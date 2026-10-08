#!/usr/bin/env python3
"""Codex job 10. Size audit and pre-allocation stop for the minimal tensor tail.
Claim: dimensions of L tensor L and its high cokernel follow from the
reconstructed minimal one-factor complex and its homology.
Case: one-factor.json/sobj from seed 10102026 in GF(2^16).
Conventions: L_-2=P_0(T), L_-1=P_1(T), L_n=P_n(C) for n>=0;
K=Tot(L tensor_k L). Count scalar unknowns per coefficient system.
No oversized matrix is allocated. Numerical claims have status supported.
"""
from reuse import *
from sage.all import load
import json
import hashlib

def run():
    st=load(str(HERE/'one-factor.sobj'))
    one=json.loads((HERE/'one-factor.json').read_text())
    assert len(st['tail'])>=5
    data,tail=st['data'],st['tail']
    assert data['ds'][1].matrix_from_rows(data['Ps'][0]['starts'])==0
    for n,item in enumerate(tail):
        target=data['Ps'][1] if n==0 else tail[n-1]['P']
        assert item['d'].matrix_from_rows(target['starts'])==0
    # The rank and two consecutive differentials identify the extension
    # 0 -> T -> C -> P1 -> P0 -> T -> 0, including its nonzero k-invariant.
    C=st['C']; f=st['f']
    assert data['quotient'].matrix_from_columns(range(20)).rank()==20
    assert f.rank()==C[0].nrows()-20
    assert f.rank()+data['ds'][1].rank()==data['Ps'][1]['dim']
    L={-2:data['Ps'][0]['dim'],-1:data['Ps'][1]['dim']}
    L.update({n:item['P']['dim'] for n,item in enumerate(tail)})
    K={n:sum(L[i]*L[n-i] for i in L if n-i in L) for n in range(-4,3)}
    # Homology is A in degrees -4,0 and A^2 in degree -2. This follows
    # by tensoring the checked one-factor extension over the ground field.
    H={-4:400,-3:0,-2:800,-1:0,0:400,1:0}
    ranks={-4:0}
    for n in range(-4,2): ranks[n+1]=K[n]-ranks[n]-H[n]
    result=dict(job='Codex job 10',status='pre-allocation bound audit',
        field=one['field'],exponents=one['exponents'],orders=one['orders'],ratio_order=one['ratio_order'],
        dimensions=dict(base_C=10,T=20,A=400,Ae=160000,X=1,one_factor_cone=C[0].nrows(),
                        L=L,K=K,C1=ranks[1],C0=K[0]-ranks[1],U1=400,U2=400,
                        Y=None,F=None,Lambda=None,Z=None),
        homology=H,inferred_differential_ranks=ranks,
        minimal_differentials_checked=True,
        dimension_qualification='C0 and C1 dimensions determined from the exact complex; bimodule matrices not formed',
        unperformed=['minimal cosyzygies of C1','normalised lifts','fibre F',
            'triangular algebra and module','delta0','Ext degrees 1 and 2','indecomposable summand and endomorphism dimension'])
    # C1=coker(d2) ~= im(d1), since H1(K)=0. Use the smaller im(d1)
    # presentation first, counting its source coordinates as unknowns.
    try:
        c.guard('C1 as im(d1: K1 -> K0)',K[0],K[1])
    except c.BoundStop as err:
        result['status']='stopped at requested system-size bound'
        result['stop']=err.args[0]
        result['alternative_coker_d2']=dict(equations=K[1],unknowns_per_rhs=K[2])
    else:
        raise AssertionError('Size bound not reached; construction must continue')
    result['systems']=c.SYSTEMS
    inputs=list((HERE.parent/'02-ar-finite-data').glob('*.py'))
    inputs += [OLD/'candidate.py',OLD/'profile.py']
    inputs += list((HERE.parents[1]/'.cache/ar-src').glob('*.tex'))
    result['input_sha256']={str(p.relative_to(HERE.parents[1])):hashlib.sha256(p.read_bytes()).hexdigest() for p in inputs}
    (HERE/'sizes.json').write_text(json.dumps(result,indent=2)+'\n')
    c.emit(result)

if __name__=='__main__': run()
