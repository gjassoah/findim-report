#!/usr/bin/env python3
"""Codex job 06.
Claim: reconcile all saved dimensions, ranks and input hashes.
Cases: three GF(2^16) runs through Ext^6 and exact rational functions through Ext^2.
Conventions: degree zero Ext means Hom; vertices upper e,f then lower e,f.
"""
from pathlib import Path
import json
import hashlib
HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[1]
rows=[json.loads((HERE/('result-'+c+'.json')).read_text()) for c in ['0','1','2','exact']]
for c,data in zip(['0','1','2','exact'],rows):
    for p,h in data['source_sha256'].items():
        assert hashlib.sha256((ROOT/p).read_bytes()).hexdigest()==h,('source drift',c,p)
    for a,pdim in enumerate(data['projective_dimensions']):
        assert pdim==data['syzygies'][a]+data['syzygies'][a+1]
        assert pdim==sum(x*y for x,y in zip(data['betti'][a],[36,24,12,8]))
    for target in ['self','regular']:
        for row in data[target]:
            assert row['ext']==row['cochains']-row['out_rank']-row['in_rank']>=0
    assert data['stable_end']==data['self'][0]['ext']-data['projective_factor_dimension']
    for label in ['self','regular','betti','projective_dimensions','syzygies']:
        assert data[label]==rows[0][label][:len(data[label])],('specialisation discrepancy',c,label)
    assert data['stable_end']==rows[0]['stable_end']
    expected_self=[5,1]+[0]*(data['degree']-1)
    expected_regular=[22]+[0]*data['degree']
    measured_self=[r['ext'] for r in data['self']]
    measured_regular=[r['ext'] for r in data['regular']]
    print('Case',c,'self',measured_self,'regular',measured_regular,'stable End',data['stable_end'])
    print('  Deviations from requested positive-degree pattern:',
          [] if measured_self[1:]==expected_self[1:] and measured_regular[1:]==expected_regular[1:] else 'FOUND; see ranks')
    print('  Parameters',data['parameters'],'; runtime seconds',round(data['elapsed_seconds'],2))
for c in ['0','exact']:
    check=json.loads((HERE/('crosscheck-'+c+'.json')).read_text())
    data=rows[0 if c=='0' else 3]
    assert check['end']==data['self'][0]['ext']
    assert check['hom_regular']==data['regular'][0]['ext']
    assert check['extension_span_mod_boundaries']==data['self'][1]['ext']==data['delta0']['cokernel']
print('PASS: independent Hom and explicit coker(delta0) checks agree for case 0 and exact.')
print('a | syzygy | Betti (upper e,f, lower e,f) | Pdim | self (C,out,in,H) | regular (C,out,in,H)')
for a in range(8):
    d=rows[0]
    def ranks(target):
        return tuple(d[target][a][k] for k in ['cochains','out_rank','in_rank','ext']) if a<=6 else '-'
    print(a,d['syzygies'][a],d['betti'][a],d['projective_dimensions'][a],ranks('self'),ranks('regular'),sep=' | ')
print('Omega^8 dimension:',rows[0]['syzygies'][8])
print('PASS: all saved source hashes and internal rank/dimension identities.')
comparison=json.loads((HERE/'comparison-0.json').read_text())
for a in range(1,7):
    predicted=comparison[a-1]['delta_cokernel']+comparison[a]['delta_kernel']
    assert predicted==rows[0]['self'][a]['ext'],('comparison discrepancy',a,predicted)
print('PASS: direct comparison-map kernel/cokernel dimensions reproduce Ext^1..Ext^6 in case 0.')
