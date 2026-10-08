#!/usr/bin/env python3
"""Claim: item 3, Ext_C^i(s,C)=0 except Ext^2=s^r, for 0<=i<=8.
Cases: exact F_2(q) and primitive q in F_(2^16), all right-module actions.
Conventions: Hom(Ci,C)=iC by evaluation, precomposition is left multiplication.
Author: Codex job 04.
"""
import sys
sys.dont_write_bytecode=True
from importlib import import_module
base=import_module('01_algebra')
res=import_module('02_resolution')
from sage.all import matrix


def audit(K,q):
    A=base.Algebra(K,q)
    eC,fC=A.ideal('e',False),A.ideal('f',False)
    u,x,y,z,v=[A.b(n) for n in 'uxyzv']
    diffs=[]
    spaces=[]
    for n in range(9):
        factor=u if n==0 else x+q**(n-1)*y
        M,D,C=res.map_matrix(A,fC if n==0 else eC,eC,factor,right=False)
        diffs.append(M)
        spaces.append(D)
    dims=[]
    for n,M in enumerate(diffs):
        ker=M.right_kernel()
        im=(matrix(K,M.ncols(),0).column_space() if n==0
            else diffs[n-1].column_space())
        assert im.is_subspace(ker),('Hom complex',n)
        h=ker.dimension()-im.dimension()
        dims.append(h)
        assert h==(1 if n==2 else 0),('Ext dimension',n,h)
        print('degree',n,': dim Hom =',M.ncols(),'; kernel =',ker.dimension(),
              '; boundaries =',im.dimension(),'; Ext dimension =',h)
        if n==2:
            D=spaces[n]
            cv=D.coordinate_vector(v)
            assert cv in ker and cv not in im
            for name,a in zip(A.names,A.basis):
                expected=v if name=='f' else A.V.zero()
                assert D.coordinate_vector(A.mul(v,a)-expected) in im, ('right action',name)
            print('PASS: class of v generates Ext^2 and has the right f-simple action')
    assert dims==[0,0,1,0,0,0,0,0,0]
    print('ITEM 3 PASS (supported):',dims)


if __name__=='__main__':
    for label,K,q in base.fields():
        print('\nFIELD:',label,flush=True)
        audit(K,q)
