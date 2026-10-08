#!/usr/bin/env bash
# Build the public repository `findim-report` next to this repository, as a single snapshot commit of the
# current HEAD (see docs/findim-report-proposal.md).
#
# - exports the tracked files of HEAD (no history);
# - leaves out the preprint (paper.pdf, build/) and six page images of third-party papers made during
#   verification;
# - adds the compiled report (PREPRINT.md, with the pinned link and checksums, is part of the repository);
# - creates one commit by the author; no remote is configured (pushing is a separate, approved step).
#
# Usage: tools/make_public_repo.sh   (from the repository root; refuses to overwrite)
set -euo pipefail
SRC=$(git rev-parse --show-toplevel)
DST=$(dirname "$SRC")/findim-report
[ -e "$DST" ] && { echo "refusing: $DST exists" >&2; exit 1; }
[ -z "$(git -C "$SRC" status --porcelain)" ] || { echo "refusing: uncommitted changes in $SRC" >&2; exit 1; }
EXCLUDE="paper.pdf build computations/D-A-MY17-v1-p18.png computations/D-A-MY17-v1-p20.png \
computations/D-C-Reg19-comparison-26.png computations/D-C-Reg19-comparison-27.png \
computations/D-C-Reg19-comparison-28.png computations/08-D-E/linckelmann-page4.png"

mkdir -p "$DST"
git -C "$SRC" archive HEAD | tar -x -C "$DST"
cd "$DST"
for f in $EXCLUDE; do rm -rf "$f"; done

mkdir -p report
cp "$SRC/report/build/main.pdf" report/findim-report.pdf
git init --quiet -b main
git add -A
git -c user.name="Gustavo Jasso" -c user.email="gjasso@math.uni-koeln.de" \
  commit --quiet -m "Report on OpenAI's counterexamples to the little finitistic dimension conjecture

The research report, its sources, and the complete record of the AI-assisted work that produced it.

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>"
echo "created $DST"
