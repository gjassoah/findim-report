#!/usr/bin/env bash
# Round 2, Task 1: Comparator and kernel replay for OpenAI's challenges LittleFinitistic,
# AuslanderReiten and Tachikawa (openai/math fd4aeeb2, Mathlib d13f23b7, Lean 4.34.1).
#
#   SRC=<clone of openai/math at fd4aeeb2> LEAN_BIN=<bin directory of Lean 4.34.1> \
#     tools/round2-comparator.sh prepare|cache|compare|replay|fresh|collect|all
#
# all = prepare cache compare replay collect. `fresh` (optional, hours) replays each solution
# module together with all of Mathlib in an empty environment. Needs comparator, lean4export and
# landrun on PATH (versions pinned in notes/round2/pkgbuilds.md). Not run in round 2.
set -uo pipefail

REPO="$(cd "$(dirname "$0")/.." && pwd)"
SRC="${SRC:?set SRC to a clone of openai/math at fd4aeeb2}"
WORK="${WORK:-$SRC/min}"
LOGS="$WORK/logs"
PIN_OPENAI=fd4aeeb2ee4fc729c18d98444fed42fd0529eeeb
PIN_MATHLIB=d13f23b723b8a846827a245b89c10fc7d3f11612
[ -n "${LEAN_BIN:-}" ] && export PATH="$LEAN_BIN:$PATH"
CHALLENGES=(LittleFinitistic AuslanderReiten Tachikawa)
declare -A SOLUTION=([LittleFinitistic]=OAI.Algebra.Finitistic.Main
                     [AuslanderReiten]=OAI.Algebra.AuslanderReiten.All
                     [Tachikawa]=OAI.RingTheory.Tachikawa.Counterexample)

die() { echo "ERROR: $*" >&2; exit 1; }
check_free() {
  local gb; gb=$(df --output=avail -BG "$SRC" | tail -1 | tr -dc 0-9)
  [ "$gb" -ge 10 ] || die "only $gb GB free"
}

stage_prepare() {
  check_free
  [ "$(git -C "$SRC" rev-parse HEAD)" = "$PIN_OPENAI" ] || die "$SRC is not at $PIN_OPENAI"
  [ -z "$(git -C "$SRC" status --porcelain -- lean)" ] || die "$SRC/lean has local changes"
  lean --version | grep -q 4.34.1 || die "lean 4.34.1 not on PATH"
  # Only the OAI modules imported by the three solutions, so that Lake does not clone the other
  # 40 packages of OpenAI's lakefile. This is a recorded deviation from OpenAI's setup.
  python3 - "$SRC/lean" "$WORK" "$PIN_MATHLIB" <<'EOF' || die "prepare failed"
import re, shutil, sys, pathlib
src, work = map(pathlib.Path, sys.argv[1:3]); pin = sys.argv[3]
seen, todo = set(), ["OAI.Algebra.Finitistic.Main", "OAI.Algebra.AuslanderReiten.All",
                     "OAI.RingTheory.Tachikawa.Counterexample"]
while todo:
    m = todo.pop()
    if m in seen: continue
    seen.add(m)
    for line in (src / (m.replace(".", "/") + ".lean")).read_text(encoding="utf-8").splitlines():
        if mm := re.match(r"\s*(?:public\s+)?import\s+(.+)", line):
            todo += [x for x in mm.group(1).split() if x.startswith("OAI")]
if work.exists(): shutil.rmtree(work)
for m in seen:
    p = m.replace(".", "/") + ".lean"
    (work / p).parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(src / p, work / p)
(work / "ComparatorChallenges").mkdir()
for c in ["LittleFinitistic", "AuslanderReiten", "Tachikawa"]:
    for ext in ("lean", "json"):
        shutil.copy2(src / "ComparatorChallenges" / f"{c}.{ext}", work / "ComparatorChallenges")
shutil.copy2(src / "lean-toolchain", work)
(work / "lakefile.lean").write_text(f'''import Lake
open System Lake DSL

package OAIMin where
  fixedToolchain := true
  leanOptions := #[⟨`autoImplicit, false⟩]

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "{pin}"

lean_lib OAI where
  roots := #[]
  globs := #[`OAI.+]
lean_lib ComparatorChallenges where globs := #[`ComparatorChallenges.+]
''')
print(len(seen), "OAI modules")
EOF
  mkdir -p "$LOGS"
  (cd "$WORK" && lake update 2>&1 | tee "$LOGS/0-lake-update.log")
  # The resolved revisions must be exactly those of OpenAI's manifest.
  python3 - "$SRC/lean/lake-manifest.json" "$WORK/lake-manifest.json" <<'EOF' | tee "$LOGS/0-manifest.log"
import json, sys
a, b = ({p["name"]: p["rev"] for p in json.load(open(f))["packages"]} for f in sys.argv[1:])
bad = [n for n in b if a.get(n) != b[n]]
for n in sorted(b): print(n, b[n], "OK" if n not in bad else f"DIFFERS (openai: {a.get(n)})")
sys.exit(1 if bad else 0)
EOF
  [ "${PIPESTATUS[0]}" = 0 ] || die "package revisions differ from OpenAI's manifest"
}

stage_cache() {
  check_free; mkdir -p "$LOGS"
  (cd "$WORK" && lake exe cache get 2>&1 | tee "$LOGS/1-cache.log")
}

stage_compare() {
  # Do not build the solutions before this stage: Comparator's guarantees assume that they are
  # compiled only inside its sandbox. systemd-run guards against a landrun escape (Comparator README).
  check_free; mkdir -p "$LOGS"
  for c in "${CHALLENGES[@]}"; do
    systemd-run --user --pipe --wait --property=RestrictAddressFamilies=~AF_UNIX -E PATH="$PATH" \
      --working-directory "$WORK" -- bash -c "lake env comparator ComparatorChallenges/$c.json" \
      2>&1 | tee "$LOGS/2-comparator-$c.log"
    echo "exit ${PIPESTATUS[0]}" | tee -a "$LOGS/2-comparator-$c.log"
  done
}

stage_replay() {
  # `leanchecker X` replays every module whose name starts with X, each against its imports;
  # `leanchecker OAI` therefore covers all copied OAI modules (Mathlib is taken from its .olean files).
  check_free; mkdir -p "$LOGS"
  (cd "$WORK" && lake build OAI 2>&1 | tail -5 > "$LOGS/3-build.log"
   lake env env LEAN_NUM_THREADS=1 leanchecker --verbose OAI > "$LOGS/3-leanchecker.log" 2>&1
   echo "exit $?" | tee -a "$LOGS/3-leanchecker.log")
}

stage_fresh() {
  check_free; mkdir -p "$LOGS"
  for c in "${CHALLENGES[@]}"; do
    (cd "$WORK" && lake env leanchecker --fresh --verbose "${SOLUTION[$c]}" > "$LOGS/4-fresh-$c.log" 2>&1
     echo "exit $?" | tee -a "$LOGS/4-fresh-$c.log")
  done
}

stage_collect() {
  local out="$REPO/lean/openai-comparator"
  mkdir -p "$out/logs"
  cp "$LOGS"/*.log "$out/logs/"
  cp "$WORK/lakefile.lean" "$WORK/lake-manifest.json" "$WORK/lean-toolchain" "$out/"
  { date -Is; lean --version; command -v comparator lean4export landrun; } > "$out/RUN-INFO.txt" 2>&1
  (cd "$out" && find logs lakefile.lean lake-manifest.json lean-toolchain RUN-INFO.txt -type f | sort \
     | xargs sha256sum > run.sha256)
  grep -H "^exit" "$out"/logs/*.log
}

case "${1:-}" in
  prepare|cache|compare|replay|fresh|collect) "stage_$1" ;;
  all) stage_prepare && stage_cache && stage_compare && stage_replay && stage_collect ;;
  *) sed -n 2,10p "$0"; exit 2 ;;
esac
