#!/usr/bin/env python3
"""Codex job 10. Rebuild a finite one-factor cone and its projective tail.
Claim: the saved tail is a projective complex for the supplied bar cocycle.
Cases: seeded primitive q,H1,H2 in GF(2^16), seed 10102026.
Conventions: characteristic two, column bimodules, homological differential.
Status: supported only in this specialisation; no two-factor Ext assertion.
"""
from reuse import *
from sage.all import GF, gcd, save, load
import random
import json
import time

def run():
    K = GF(2**16, name='b')
    b = K.multiplicative_generator()
    rng = random.Random(10102026)
    es = []
    while len(es) < 3:
        e = rng.randrange(1, 65535)
        if gcd(e, 65535) == 1 and e not in es:
            if len(es) == 2 and gcd(e-es[1], 65535) != 1:
                continue
            es.append(e)
    q, H1, H2 = [b**e for e in es]
    result = dict(job='Codex job 10', status='running', seed=10102026,
                  field=str(K), modulus=str(K.modulus()), exponents=es,
                  orders=[int(x.multiplicative_order()) for x in (q,H1,H2)],
                  ratio_order=int((H1/H2).multiplicative_order()), resolution=[])
    def record():
        result['systems'] = c.SYSTEMS
        (HERE/'one-factor.json').write_text(json.dumps(result, indent=2)+'\n')
    T = c.te.TrivialExtension(K,q)
    B = c.Bimodules(T)
    if '--resume' in sys.argv:
        old=load(str(HERE/'one-factor.sobj'))
        C,data=old['C'],old['data']
        result=json.loads((HERE/'one-factor.json').read_text())
        assert result['exponents']==es
        c.SYSTEMS.extend(result['systems'])
        c.emit('resuming rebuilt cone')
    else:
        record()
        c.emit('parameters', result)
        c.base.audit(K,q)
        c.te.structural(T)
        entries = c.coc.read_entries()
        c.coc.cocycle(K,q,entries)
        c.coc.boundary(K,q,H1,entries)
        c.coc.boundary(K,q,H2,entries)
        c.coc.evaluation(K,q,entries)
        C, data = c.build_cone(B,result['resolution'])
    result['dim_C'] = C[0].nrows()
    save(dict(C=C,data=data,parameters=result),str(HERE/'one-factor.sobj'))
    result['status'] = 'one-factor cone reconstructed'
    record()
    # The finite complex C -> P1(T) -> P0(T), degrees 0,-1,-2,
    # retains both homology groups of the original cone complex.
    top = join(c.matrix(K,data['Ps'][1]['dim'],20),data['ds'][2],'augment')
    f = product(top,data['section'])
    assert product(f,data['quotient']) == top
    assert product(data['ds'][1],f) == 0
    tail = []
    M = C
    prev = None
    result['cone_resolution'] = []
    for n in range(5):
        P,ep,inc,M = B.cover(M,'cone minimal degree '+str(n))
        d = product(f,ep) if n == 0 else product(prev,ep)
        tail.append(dict(P=P,d=d,ep=ep,inc=inc))
        if n: assert product(tail[n-1]['d'],d) == 0
        prev = inc
        result['cone_resolution'].append(dict(degree=n,projective=P['dim'],
            next_syzygy=inc.ncols(),betti=[P['vertices'].count(v) for v in range(4)]))
        save(dict(C=C,data=data,parameters=result,tail=tail,f=f),str(HERE/'one-factor.sobj'))
        record()
    result['status'] = 'one-factor cone and five minimal tail terms reconstructed'
    record()
    c.emit(result['status'],result['cone_resolution'])

if __name__ == '__main__': run()
