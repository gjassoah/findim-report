#!/usr/bin/env python3
"""Claim: D-E finite certificate reproducibility and source table identity.
Cases: two new universal finite certificates and all 179 cocycle table entries.
Conventions: source text is read-only; cochain word abcv records p(a,b,c)'s
coefficient of v; polynomial exponents are integers, characteristic two.
Scope: confirms saved output equals fresh execution, literal table matches the
preprint, and records SHA-256 input digests. No all-degree mathematical claim.
"""
import ast
import hashlib
import json
from pathlib import Path
import re
import subprocess
import sys

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
script = HERE / 'finite_cochain_certificate.py'
tree = ast.parse(script.read_text())
assign = next(node for node in tree.body if isinstance(node, ast.Assign)
              and any(isinstance(t, ast.Name) and t.id == 'table' for t in node.targets))
literal = ast.literal_eval(assign.value)
actual = sorted((word, power) for power, words in literal.items() for word in words.split())
source = ROOT / '.cache/ar-src/09-cochain.tex'
table = source.read_text().split(r'\begin{tabular}', 1)[1].split(r'\end{tabular}', 1)[0]
expected = []
for coefficient, words in re.findall(r'\$(q(?:\^\d+)?|1)\$\s*&\s*\\texttt\{([^}]+)\}', table):
    power = 0 if coefficient == '1' else 1 if coefficient == 'q' else int(coefficient[2:])
    expected.extend((word, power) for word in words.split())
assert len(expected) == 179 and actual == sorted(expected)
print('All 179 independently transcribed cochain entries equal the source table.')
for name in ['foundations_certificate', 'finite_cochain_certificate']:
    program = HERE / (name + '.py')
    result = subprocess.run([sys.executable, '-B', str(program)], cwd=ROOT,
                            capture_output=True, check=True)
    assert not result.stderr, result.stderr.decode()
    assert result.stdout == (HERE / (name + '.out')).read_bytes(), name
    print(name + ': fresh execution exactly matches saved output.')
paths = sorted((ROOT / '.cache/ar-src').glob('0[3-9]-*.tex'))
paths += [HERE / (name + suffix) for name in
          ['foundations_certificate', 'finite_cochain_certificate']
          for suffix in ['.py', '.out']]
print(json.dumps({str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest()
                  for p in paths}, indent=2))
print('Scope: source identity and finite-certificate reproducibility only.')
