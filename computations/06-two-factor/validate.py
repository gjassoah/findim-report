#!/usr/bin/env python3
"""Codex job 10. Independent seam checks for the saved evaluated cone.
Claim: degrees 0 and -1 of W agree with direct stable module Hom.
Case: the saved 276-dimensional A-module in GF(2^16).
Conventions: left modules, X the (f,f)-character; projective factorizations
are the image of the socle element f* tensor f*. Status: supported.
"""
from reuse import *
from sage.all import load, matrix, identity_matrix
import json

def run():
    st=load(str(HERE/'evaluated.sobj')); M=st['M']; K=M[0].base_ring(); n=M[0].nrows()
    result=json.loads((HERE/'evaluated.json').read_text())
    assert result['status']=='stable profile completed by complete-resolution Hom matrices'
    eq=matrix(K,[row for i in range(40) for row in
        (M[i]-(identity_matrix(K,n) if i%20==8 else 0*M[i])).rows()])
    soc=c.kernel(eq,'direct Hom(X,coneX)')
    omega=product(M[18],M[38])
    assert product(eq,omega)==0
    W0=int(soc.ncols()-omega.rank())
    # Hom(M,X) is the simultaneous left annihilator of a.M-chi(a).M;
    # take transposes, so the same kernel routine computes its row maps.
    eqdual=matrix(K,[row for i in range(40) for row in
        (M[i].transpose()-(identity_matrix(K,n) if i%20==8 else 0*M[i])).rows()])
    top=c.kernel(eqdual,'direct Hom(coneX,X)')
    assert product(eqdual,omega.transpose())==0
    Wminus1=int(top.ncols()-omega.rank())
    assert result['W']['0']==W0 and result['W']['-1']==Wminus1
    out=dict(job='Codex job 10',status='supported',dim_M=n,
        ordinary_Hom_X_M=soc.ncols(),ordinary_Hom_M_X=top.ncols(),
        projective_factor_rank=int(omega.rank()),W0=W0,Wminus1=Wminus1,
        systems=c.SYSTEMS)
    (HERE/'validation.json').write_text(json.dumps(out,indent=2)+'\n')
    c.emit(out)

if __name__=='__main__': run()
