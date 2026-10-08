#!/usr/bin/env python3
"""Review claim: all 179 source cochain table entries match the new certificate.
Scope: literal table data and polynomial exponents only, not cocycle validity.
Conventions: rows 1,q,q^2,q^3 and four-letter input/output tokens; char two.
"""
import ast
import re
from pathlib import Path
source = Path('.cache/ar-src/09-cochain.tex').read_text()
source_table={0:[],1:[],2:[],3:[]}
for coeff,words in re.findall(r'\$(q(?:\^[23])?|1)\$\s*&\s*\\texttt\{([^}]+)\}',source):
    d={'1':0,'q':1,'q^2':2,'q^3':3}[coeff]
    source_table[d].extend(words.split())
node=ast.parse(Path('computations/08-D-E/finite_cochain_certificate.py').read_text())
for s in node.body:
    if isinstance(s,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='table' for t in s.targets):
        candidate={d:words.split() for d,words in ast.literal_eval(s.value).items()}
        break
else: raise AssertionError('table assignment absent')
assert source_table==candidate,(source_table,candidate)
assert sum(map(len,source_table.values()))==179
print('All 179 literal source-table entries, exponents, and within-row order match.')
print('Row cardinalities:',{d:len(v) for d,v in source_table.items()})
print('Scope: transcription only; universal identities are checked by finite_cochain_certificate.py.')
