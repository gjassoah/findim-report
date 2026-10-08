#!/usr/bin/env python3
"""Job16 resumed proof check; no worktree writes.

Claim: candidate Cone plus existing OneFactor and stage4a audit commands elaborate.
Cases: complete candidate sources, using the worktree's prebuilt imports.
Conventions: report composition and shifts are those documented in Stage4aInterface.
This source-only check is not Lake build or any of the five acceptance gates.
"""
from pathlib import Path
import os
import subprocess
import hashlib

# The stage-4a worktree of the Lean repository (set FINDIM_WORKTREE to its location).
base = Path(os.environ.get('FINDIM_WORKTREE', 'findim-worktrees/stage4a'))
out = Path(__file__).resolve().parent
cone = (out / 'Stage4aCone.lean').read_text()
wrapper = (out / 'Stage4aOneFactor.lean').read_text() if (out / 'Stage4aOneFactor.lean').exists() else (base / 'FindimCounterexample/Stage4aOneFactor.lean').read_text()
audit = (out / 'Statements.lean').read_text() if (out / 'Statements.lean').exists() else (base / 'Audit/Statements.lean').read_text()
stage_audit = audit[audit.index('/-! Stage 4a:'):]
text = 'import FindimCounterexample.Stage4aRank\nimport FindimCounterexample.Stage4aHigherObstruction\n'
text += cone + '\nend\n' + '\n'.join(line for line in wrapper.splitlines() if not line.startswith('import '))
text += '\n\n-- Audit commands are intentional, as in acceptance gate 4.\nset_option linter.hashCommand false\nopen FindimCounterexample\n\n' + stage_audit
candidate = out / 'CombinedCheck.lean'
candidate.write_text(text)
paths = [base / '.lake/build/lib/lean']
paths.extend(sorted((base / '.lake/packages').glob('*/.lake/build/lib/lean')))
env = dict(os.environ, LEAN_PATH=':'.join(map(str, paths)))
command = ['lean', '-DwarningAsError=true', '-DautoImplicit=false', '-Dweak.linter.mathlibStandardSet=true', str(candidate)]
with (out / 'combined-check.log').open('w') as log:
    rc = subprocess.run(command, cwd=base, env=env, stdout=log, stderr=subprocess.STDOUT).returncode
(out / 'combined-check-status.txt').write_text(f'exit {rc}\nsha256 {hashlib.sha256(candidate.read_bytes()).hexdigest()} CombinedCheck.lean\n')
print(f'Combined candidate check exit {rc}; see {out / "combined-check.log"}')
raise SystemExit(rc)
