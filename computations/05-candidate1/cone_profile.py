#!/usr/bin/env python3
"""Codex job 08. Claim: direct stable profile of the actual evaluated cone.
Cases: saved cone cases 0 and 1 over GF(2^16), shifts -4 through 4.
Conventions: characteristic two, left modules, [1] a cosyzygy.
Status: supported finite computations only; saved independently of F.
"""
from profile import *

def run(case):
    state=load(str(HERE/f'cone-{case}.sobj')); C=state['C']; K=C[0].base_ring()
    q=K.multiplicative_generator()**state['parameters']['exponents'][0]; T=te.TrivialExtension(K,q)
    rel=matrix(K,[c for a in range(20) if a!=8 for c in C[20+a].columns()]).transpose()
    Cs,Q,S=quotient(C[:20],rel,'C tensor s'); emit('C tensor s dimension',Cs[0].nrows())
    W=compute_W(T,Cs)
    result={'case':case,'dim_Cs':Cs[0].nrows(),'W':{str(a):int(W[a]) for a in range(-4,5)},'systems':SYSTEMS,'cone_sha256':hashlib.sha256((HERE/f'cone-{case}.sobj').read_bytes()).hexdigest()}
    (HERE/f'W-{case}.json').write_text(json.dumps(result,indent=2,default=str)+'\n'); emit(result)
if __name__=='__main__': run(int(sys.argv[1]))
