#!/usr/bin/env python3
"""Claim: typecheck the generic stage-3c odd-double construction.

Cases: the entire candidate Lean module, with its universally quantified objects.
Conventions: pinned worktree imports are read-only; all output stays beside this
script. This direct check does not replace the five worktree acceptance gates.
"""
from pathlib import Path
import os
import subprocess

here = Path(__file__).resolve().parent
# The stage-3c worktree of the Lean repository (set FINDIM_WORKTREE to its location).
tree = Path(__import__('os').environ.get('FINDIM_WORKTREE', 'findim-worktrees/stage3c'))
packages = ['Cli', 'batteries', 'Qq', 'aesop', 'proofwidgets', 'importGraph',
            'LeanSearchClient', 'plausible']
paths = [tree / '.lake/packages' / p / '.lake/build/lib/lean' for p in packages]
paths += [tree / '.lake/private-packages/mathlib/.lake/build/lib/lean',
          tree / '.lake/build/lib/lean', Path('/usr/lib/lean4/lib/lean')]
env = dict(os.environ, LEAN_PATH=':'.join(map(str, paths)))
command = ['/usr/bin/lean', '-DautoImplicit=false', '-DwarningAsError=true',
           '-Dweak.linter.mathlibStandardSet=true', str(here / 'Stage3cOddDouble.lean')]
result = subprocess.run(command, cwd=here, env=env, text=True,
                        stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
(here / 'check.log').write_text(result.stdout + f'\nexit code: {result.returncode}\n')
print(result.stdout, end='')
print(f'exit code: {result.returncode}')
if result.returncode:
    raise SystemExit(result.returncode)

listing = (tree / 'Audit/Statements.lean').read_text().splitlines()
listing = [line for line in listing if
           line.startswith('#check @Stage3cOddDouble.') or
           line.startswith('#print axioms Stage3cOddDouble.')]
statement_source = here / 'Statements.lean'
statement_source.write_text((here / 'Stage3cOddDouble.lean').read_text() +
                            '\nopen FindimCounterexample\n\n' + '\n'.join(listing) + '\n')
command = ['/usr/bin/lean', str(statement_source)]
result = subprocess.run(command, cwd=here, env=env, text=True,
                        stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
(here / 'statements.log').write_text(result.stdout + f'\nexit code: {result.returncode}\n')
print(result.stdout, end='')
print(f'statement check exit code: {result.returncode}')
raise SystemExit(result.returncode)
