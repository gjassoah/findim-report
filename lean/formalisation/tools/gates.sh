#!/usr/bin/env bash
# Acceptance gates (LEAN_FORMALISATION §6), run sequentially. Usage: tools/gates.sh EVIDENCE_DIR
set -uo pipefail
out="${1:?evidence directory}"; mkdir -p "$out"
cd "$(dirname "$0")/.."
mods=$(find FindimCounterexample -name '*.lean' | sed 's#\.lean$##; s#/#.#g' | sort)
status=0
run() { local name="$1"; shift; "$@" > "$out/$name.log" 2>&1; local rc=$?; echo "$name exit $rc" | tee -a "$out/summary.txt"; [ $rc -eq 0 ] || status=1; }
: > "$out/summary.txt"
git rev-parse HEAD > "$out/commit.txt" 2>/dev/null || echo "no commit" > "$out/commit.txt"
sha256sum lakefile.toml lake-manifest.json lean-toolchain FindimCounterexample.lean $(find FindimCounterexample Audit -name '*.lean' | sort) > "$out/sources.sha256"
# 1. source scan: forbidden constructs, line limits, orphan modules
scan() {
  local bad=0
  if grep -rnE '\bsorry\b|\badmit\b|native_decide|decide \+native|maxHeartbeats|maxRecDepth|synthInstance\.maxSize|^\s*axiom\b' FindimCounterexample FindimCounterexample.lean; then bad=1; fi
  for f in $(find FindimCounterexample -name '*.lean'); do n=$(wc -l < "$f"); [ "$n" -le 1500 ] || { echo "too long: $f $n"; bad=1; }; done
  for m in $mods; do grep -q "^import $m$" FindimCounterexample.lean || { echo "orphan: $m"; bad=1; }; done
  return $bad
}
run 1-source-scan scan
run 2-build lake build
run 3-axioms lake exe audit_axioms $mods FindimCounterexample
run 4-statements lake env lean Audit/Statements.lean
run 5-leanchecker lake env env LEAN_NUM_THREADS=1 leanchecker --verbose FindimCounterexample
exit $status
