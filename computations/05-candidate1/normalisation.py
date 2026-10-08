#!/usr/bin/env python3
"""Codex job 08. Claim: the two normalised evaluations agree stably and
are nonzero. Cases: the two saved actual candidates over GF(2^16).
Conventions: tensor with the f-character; projective factors from s are
exactly the image of the dual-f action, using s -> T f via its socle.
Status: supported finite computations only.
"""
from candidate import *

def run(case):
    state=load(str(HERE/f'candidate-{case}.sobj')); N=state['N']; K=N[0].base_ring()
    q=K.multiplicative_generator()**state['parameters']['exponents'][0]; T=te.TrivialExtension(K,q)
    # Use a generating set to construct the tensor quotient, then check
    # balancing for every algebra basis letter, including those not used.
    letters=[0]+[T.names.index(x) for x in 'xutZ']
    equations=matrix(K,[c for a in letters for c in N[20+a].columns()])
    Q=kernel(equations,'normalisation tensor quotient').transpose()
    assert all(Q*N[20+a]==int(a==8)*Q for a in range(20))
    piv=list(Q.pivots()); S=identity_matrix(K,N[0].nrows()).matrix_from_columns(piv)*Q.matrix_from_columns(piv).inverse()
    assert Q*S==identity_matrix(K,Q.nrows())
    Ns=[Q*a*S for a in N[:20]]
    w=[Q*g.column(8) for g in state['g']]
    assert all(Ns[a]*x==int(a==8)*x for x in w for a in range(20))
    factors=Ns[18].column_space()
    assert w[0]-w[1] in factors and all(x not in factors for x in w)
    result={'job':'Codex job 08','case':case,'dim_Ns':Q.nrows(),'equal_stably':True,'both_stably_nonzero':True,'equal_as_actual_maps':bool(w[0]==w[1]),'projective_factor_dimension':factors.dimension(),'systems':SYSTEMS}
    (HERE/f'normalisation-{case}.json').write_text(json.dumps(result,indent=2,default=str)+'\n'); emit(result)
if __name__=='__main__': run(int(sys.argv[1]))
