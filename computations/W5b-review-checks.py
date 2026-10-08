#!/usr/bin/env python3
"""Model: GPT-6 (specific variant unknown); effort: unknown.
Claim (supported): finite checks of the table and numerical assertions in A1.
Cases: all 179 ordered cochain entries; bar dimensions K^0,...,K^4;
       the saved minimal two-factor rank recurrence; two polynomial certificates.
Conventions: cohomological bar degrees are nonpositive; T corners have rows
left and columns right. The minimal-tail file uses homological degrees.
These checks do not certify all-degree statements or historical rerun coverage.
Read-only inputs; stdout is saved separately as W5b-review-checks.out.
"""
from collections import Counter
from itertools import product
from pathlib import Path
import hashlib
import json
import re
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
inputs = []
def read(rel):
    p = ROOT / rel
    inputs.append(p)
    return p.read_text()

def cochain(text):
    body = text.split(r'\begin{tabular}', 1)[1].split(r'\end{tabular}', 1)[0]
    result = []
    for coefficient, words in re.findall(r'\$(q(?:\^\d+)?|1)\$\s*&\s*\\texttt\{([^}]+)\}', body):
        degree = 0 if coefficient == '1' else 1 if coefficient == 'q' else int(coefficient[2:])
        result.extend((degree, word) for word in words.split())
    return result
source = cochain(read('.cache/ar-src/09-cochain.tex'))
report = cochain(read('report/sections/A1-computations.tex'))
assert source == report and len(report) == 179
assert len({word[:3] for _, word in report}) == 179
print('PASS: 179 ordered source/report entries and distinct inputs; degrees:', dict(sorted(Counter(d for d, _ in report).items())))

# Independent enumeration of compatible corner strings, rather than reuse of
# the dimension program's matrix-power routine.
T = ((8, 4), (4, 4))
radical = ((7, 4), (4, 3))
def bar(n):
    total = 0
    for indices in product(range(2), repeat=n+3):
        size = T[indices[0]][indices[1]] * T[indices[-2]][indices[-1]]
        for j in range(1, n+1):
            size *= radical[indices[j]][indices[j+1]]
        total += size
    return total
B = {j: bar(-j) for j in range(-4, 1)}
L = {j: B.get(j-2, 0) + B.get(j, 0) for j in range(-2, 3)}
K = [sum(L[a] * L[b] for a in L for b in L if a+b == j) for j in range(5)]
assert [B[0], B[-1], B[-2]] == [208, 1968, 18640]
assert K == [1761405952, 148453376, 11713792, 818688, 43264]
H = (400, 0, 800, 0, 400)
# From the zero differential out of degree 4, recover boundary dimensions
# downwards using dim K^j = dim im d^{j-1} + dim im d^j + dim H^j.
outgoing = 0
for j in reversed(range(5)):
    incoming = K[j] - H[j] - outgoing
    assert incoming >= 0
    outgoing = incoming
C1 = incoming
Lambda = 1600 + 159999**5 * C1
assert C1 == 1623889344
assert Lambda == 170271818183326072615867045851312256
print('PASS: bar dimensions', [B[0], B[-1], B[-2]], '; K^0..4', K)
print('PASS: dim C1 =', C1, '; dim Lambda =', Lambda)

saved = json.loads(read('computations/06-two-factor/sizes.json'))
terms = {int(i): v for i, v in saved['dimensions']['K'].items()}
homology = {int(i): v for i, v in saved['homology'].items()}
ranks = {-4: 0}
for j in range(-4, 2):
    ranks[j+1] = terms[j] - ranks[j] - homology[j]
assert ranks == {int(i): v for i, v in saved['inferred_differential_ranks'].items()}
assert ranks[1] == saved['dimensions']['C1'] == 1377984
assert terms[0] - ranks[1] == saved['dimensions']['C0'] == 784704
assert terms[1] == 3591168
assert any(homology.values())
print('PASS: saved minimal-tail rank recurrence; C0=784704, C1=1377984, K1=3591168.')
print('Supported correction: the minimal-tail complex has nonzero homology', {i: h for i, h in homology.items() if h})
profile = json.loads(read('computations/06-two-factor/evaluated.json'))['W']
assert {int(i): v for i, v in profile.items()} == {i: int(i in (0, 3)) for i in range(-4, 8)}
print('PASS: saved two-factor profile has W0=W3=1 and all other W^-4..7 zero.')

for stem in ('foundations_certificate', 'finite_cochain_certificate'):
    rel = 'computations/08-D-E/' + stem
    read(rel + '.py')
    expected = read(rel + '.out').encode()
    result = subprocess.run([sys.executable, '-B', str(ROOT / (rel + '.py'))], cwd=ROOT,
                            capture_output=True, check=True, timeout=120)
    assert result.stdout == expected and not result.stderr, stem
    print('PASS: fresh exact-polynomial certificate matches saved output:', stem)

print('Input SHA-256:')
for path in inputs:
    print(hashlib.sha256(path.read_bytes()).hexdigest(), path.relative_to(ROOT))
print('All listed finite checks passed. No historical experiment reruns or all-degree certification asserted.')
