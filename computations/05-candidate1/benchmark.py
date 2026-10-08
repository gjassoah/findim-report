#!/usr/bin/env python3
"""Codex job 08. Claim: compare exact GF(2^16) multiplication backends.
Cases: deterministic 188 by 188 matrices; no mathematical result inferred.
Conventions: same finite field as candidate.py; output saved locally.
"""
from candidate import *
K=GF(2**16,'b'); b=K.gen(); n=188
A=matrix(K,n,n,{(i,(3*i+j)%n):b**(i%16) for i in range(n) for j in range(3)},sparse=False)
B=matrix(K,n,n,{(i,(7*i+j)%n):b**(i%15) for i in range(n) for j in range(5)},sparse=False)
reference=None
for method in ['_multiply_classical','_multiply_karatsuba']:
    t=time.time(); C=getattr(A,method)(B); emit(method,time.time()-t)
    if reference is None: reference=C
    else: assert C==reference
t=time.time(); D=A.sparse_matrix()*B.sparse_matrix(); emit('sparse',time.time()-t); assert C==D
emit('all three exact products agree')
