#!/usr/bin/env python3
"""Codex job 08. Claim: collect the saved case results without recomputation.
Cases: completed GF(2^16) cases 0 and 1, Ext degrees 1..3.
Conventions: supported finite computations; this receipt is not a proof.
Checks only completion, arithmetic consistency and cross-case agreement.
"""
import json, hashlib
from pathlib import Path
HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[1]
rows=[]
for case in [0,1]:
    r=json.loads((HERE/f'case-{case}.json').read_text())
    w=json.loads((HERE/f'W-{case}.json').read_text())
    norm=json.loads((HERE/f'normalisation-{case}.json').read_text())
    assert r['status']=='completed through degree 3'
    assert r['W']==w['W']
    assert norm['equal_as_actual_maps'] and norm['equal_stably'] and norm['both_stably_nonzero']
    for target in ['self','regular']:
        for entry in r[target]:
            assert entry['Ext']==entry['cochains']-entry['out_rank']-entry['in_rank']
    systems=[s for key in ['systems','finish_systems','profile_systems','ext_systems'] for s in r[key]]+w['systems']+norm['systems']
    assert all(s['unknowns_per_rhs']<=100000 for s in systems)
    rows.append({'case':case,'seed':r['seed'],'exponents':r['exponents'],'orders':r['orders'],'ratio_order':r['ratio_order'],
      'dimensions':{k:r[k] for k in ['dim_C','dim_N','dim_F','dim_Lambda','dim_Cs','dim_Fs','dim_Z']},
      'Ext_Z_Z':[d['Ext'] for d in r['self'] if d['degree']>0],
      'Ext_Z_Lambda':[d['Ext'] for d in r['regular'] if d['degree']>0],
      'W':r['W'],'delta0':r['delta0'],'normalisation':norm,
      'largest_guarded_unknown_count':max(s['unknowns_per_rhs'] for s in systems)})
for key in ['dimensions','Ext_Z_Z','Ext_Z_Lambda','W','delta0']:
    assert rows[0][key]==rows[1][key],key
inputs=list((ROOT/'.cache/ar-src').glob('*.tex'))+[HERE.parent/'02-ar-finite-data'/f for f in ['01_algebra.py','04_trivial_extension.py','05_cochain.py']]
result={'job':'Codex job 08','model':'GPT-6 (Codex)','effort':'unknown','status':'supported in two finite-field cases','cases':rows,
        'input_sha256':{str(p.relative_to(ROOT)):hashlib.sha256(p.read_bytes()).hexdigest() for p in sorted(inputs)}}
(HERE/'summary.json').write_text(json.dumps(result,indent=2)+'\n')
files=sorted(p for p in HERE.iterdir() if p.is_file() and p.name not in ['SHA256SUMS','summary.out','validation.out'])
files.append(ROOT/'audit/08-candidate1-codex.md')
(HERE/'SHA256SUMS').write_text(''.join(f'{hashlib.sha256(p.read_bytes()).hexdigest()}  {p.relative_to(ROOT)}\n' for p in files))
print('Codex job 08: both case receipts complete; numerical results agree.')
for r in rows:
    print('case',r['case'],'dimensions',r['dimensions'],'Ext self',r['Ext_Z_Z'],'Ext regular',r['Ext_Z_Lambda'],
          'largest guarded unknown count',r['largest_guarded_unknown_count'])
print('Input hashes, summary.json and SHA256SUMS written.')
