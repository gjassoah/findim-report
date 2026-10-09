#!/usr/bin/env bash
# Build or update the public repository `findim-report` next to this repository
# (see docs/findim-report-proposal.md).
#
#   tools/make_public_repo.sh --init
#       Create the public repository as a single snapshot commit of the current HEAD. Refuses if the
#       target directory exists (the released history is never replaced by this script).
#   tools/make_public_repo.sh --update "Commit message"
#       Replace the working tree of the existing public repository by a snapshot of the current HEAD and
#       record the difference as one new commit on top of its history. Stops without committing if
#       nothing changed.
#
# In both modes the export leaves out the preprint (paper.pdf, build/) and six page images of
# third-party papers made during verification and the Syncthing ignore file, and adds the compiled report (report/build/main.pdf as
# report/findim-report.pdf; PREPRINT.md, with the pinned link and checksums, is part of the repository).
# Commits are made in the author's name. Nothing is pushed: pushing is a separate, approved step.
#
# Run from the repository root. PUBLIC_DIR overrides the target directory (used for testing).
set -euo pipefail
SRC=$(git rev-parse --show-toplevel)
DST=${PUBLIC_DIR:-$(dirname "$SRC")/findim-report}
MODE=${1:-}
EXCLUDE="paper.pdf build computations/D-A-MY17-v1-p18.png computations/D-A-MY17-v1-p20.png \
computations/D-C-Reg19-comparison-26.png computations/D-C-Reg19-comparison-27.png \
computations/D-C-Reg19-comparison-28.png computations/08-D-E/linckelmann-page4.png .stignore"
AUTHOR=(-c user.name="Gustavo Jasso" -c user.email="gjasso@math.uni-koeln.de")
TRAILER="Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>"

[ -z "$(git -C "$SRC" status --porcelain)" ] || { echo "refusing: uncommitted changes in $SRC" >&2; exit 1; }
[ -f "$SRC/report/build/main.pdf" ] || { echo "refusing: report/build/main.pdf missing; compile the report" >&2; exit 1; }

export_snapshot() {   # export HEAD of $SRC into the current directory, apply exclusions, add the PDF
  git -C "$SRC" archive HEAD | tar -x -C .
  for f in $EXCLUDE; do rm -rf "$f"; done
  mkdir -p report
  cp "$SRC/report/build/main.pdf" report/findim-report.pdf
}

case "$MODE" in
  --init)
    [ -e "$DST" ] && { echo "refusing: $DST exists (use --update)" >&2; exit 1; }
    mkdir -p "$DST"; cd "$DST"
    export_snapshot
    git init --quiet -b main
    git add -A
    git "${AUTHOR[@]}" commit --quiet -m "Report on OpenAI's counterexamples to the little finitistic dimension conjecture

The research report, its sources, and the complete record of the AI-assisted work that produced it.

$TRAILER"
    echo "created $DST"
    ;;
  --update)
    MSG=${2:?usage: tools/make_public_repo.sh --update "Commit message"}
    [ -d "$DST/.git" ] || { echo "refusing: $DST is not an existing repository (use --init)" >&2; exit 1; }
    cd "$DST"
    [ -z "$(git status --porcelain)" ] || { echo "refusing: uncommitted changes in $DST" >&2; exit 1; }
    [ "$(git rev-parse --abbrev-ref HEAD)" = main ] || { echo "refusing: $DST is not on main" >&2; exit 1; }
    find . -mindepth 1 -maxdepth 1 ! -name .git -exec rm -rf {} +
    export_snapshot
    git add -A
    if git diff --cached --quiet; then echo "no changes; nothing committed"; exit 0; fi
    git diff --cached --stat | tail -1
    git "${AUTHOR[@]}" commit --quiet -m "$MSG

$TRAILER"
    echo "committed $(git rev-parse --short HEAD) in $DST (not pushed)"
    ;;
  *)
    echo "usage: tools/make_public_repo.sh --init | --update \"Commit message\"" >&2; exit 2
    ;;
esac
