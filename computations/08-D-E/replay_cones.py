#!/usr/bin/env python3
"""Claim: finite exact replay of saved two-cone Hom matrices and seam.
Cases: computations/06-two-factor seed 10102026 over GF(2^16), -4<=a<=7.
Conventions: left modules, homological complete resolution, char two.
Scope: recomputes ranks and consecutive zero products of saved Hom matrices;
checks direct stable Hom in a=0,-1 from saved module action matrices. Does
not rebuild the cocycle, resolution, cone, or certify any all-degree claim.
All prior artifacts are read-only; outputs/state belong to this directory.
"""
from pathlib import Path
import os,sys,json
HERE=Path(__file__).resolve().parent
OLD=HERE.parent/'06-two-factor'
os.environ['DOT_SAGE']=str(HERE/'sage-state-cones')
os.environ['XDG_CACHE_HOME']=str(HERE/'cache-cones')
sys.dont_write_bytecode=True
from sage.all import load,matrix,identity_matrix
st=load(str(OLD/'profile-matrices.sobj'))
h=st['hom']; ranks={}; W={}
resume='--resume-initial-ranks' in sys.argv
if resume:
    # The initial run printed a rank only after its corresponding d^2 check.
    # Retain that completed exact calculation instead of repeating it.
    for line in (HERE/'replay_cones-initial.out').read_text().splitlines():
        if line.startswith('rank '):
            _,degree,value=line.split()
            ranks[int(degree)]=int(value)
    assert set(ranks)==set(h)
    print('Reusing completed initial exact rank/product pass.',flush=True)
for a in sorted(h):
    if not resume: ranks[a]=int(h[a].rank())
    if a-1 in h:
        if not resume: assert h[a].sparse_matrix()*h[a-1].sparse_matrix()==0
        W[a]=int(h[a].ncols()-ranks[a]-ranks[a-1])
    print('rank',a,ranks[a],flush=True)
assert W=={a:int(a in (0,3)) for a in range(-4,8)}
core=dict(scope='Saved Hom matrix replay: original pass recomputed every rank and d^2; resume only packages that pass.',W=W,ranks=ranks)
(HERE/'replay_cones-core.json').write_text(json.dumps(core,indent=2)+'\n')
M=load(str(OLD/'evaluated.sobj'))['M']; k=M[0].base_ring(); n=M[0].nrows()
omega=M[18].sparse_matrix()*M[38].sparse_matrix(); pr=int(omega.rank())
ordinary={}
for trans in (False,True):
    actions=[x.transpose() if trans else x for x in M]
    # First impose the two f-idempotents. The remaining character equations
    # then have only the dimension of their common image as unknown count.
    idempotent=actions[8].sparse_matrix()*actions[28].sparse_matrix()
    B=idempotent.column_space().basis_matrix().transpose()
    assert idempotent.sparse_matrix()*B.sparse_matrix()==B
    equations=matrix(k,[row for i in range(40) for row in
      (actions[i].sparse_matrix()*B.sparse_matrix()-(B if i%20==8 else 0*B)).rows()])
    factor=omega.transpose() if trans else omega
    assert all((actions[i].sparse_matrix()-(identity_matrix(k,n,sparse=True) if i%20==8 else 0*actions[i].sparse_matrix()))*factor==0 for i in range(40))
    ordinary[trans]=int(B.ncols()-equations.rank())
    print('seam',trans,'corner dimension',B.ncols(),'ordinary Hom',ordinary[trans],flush=True)
assert ordinary[False]-pr==W[0]
assert ordinary[True]-pr==W[-1]
result=dict(scope=__doc__,field=str(k),dim_coneX=n,W=W,ranks=ranks,
 ordinary_Hom_X_M=ordinary[False],ordinary_Hom_M_X=ordinary[True],projective_factor_rank=pr,
 status='finite saved-matrix replay completed; no all-degree assertion')
(HERE/'replay_cones.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2),flush=True)
