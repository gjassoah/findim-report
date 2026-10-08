#!/usr/bin/env python3
"""Claim: item 2, minimal C-resolution of the left f-simple.
Cases: exactness at degrees 0..8 (d_1..d_9), and symbolic r=q^i kernel.
Conventions: left ideals, column maps, d_1=right u, d_(i+2)=right (x+q^i y).
Author: Codex job 04.
"""
import sys
sys.dont_write_bytecode = True
from importlib import import_module
base = import_module('01_algebra')
from sage.all import GF, PolynomialRing, matrix, vector


def map_matrix(A, dom, cod, factor, right=True):
    D,C = A.span(dom), A.span(cod)
    cols = [C.coordinate_vector(A.mul(v,factor) if right else A.mul(factor,v))
            for v in D.basis()]
    return matrix(A.K,cols).transpose(), D,C


def audit(K,q):
    A = base.Algebra(K,q)
    e,f,u,x,y,z,j = [A.b(n) for n in 'efuxyzj']
    Ce,Cf = A.ideal('e'), A.ideal('f')
    # Verify the simple character on every algebra product, including the unit.
    chi = lambda a: a[A.names.index('f')]
    assert chi(e+f)==1
    assert all(chi(A.mul(a,b))==chi(a)*chi(b) for a in A.basis for b in A.basis)
    assert len(Ce)==6 and len(Cf)==4
    Cfs = A.span(Cf)
    diffs = [matrix(K,1,len(Cf),[chi(a) for a in Cfs.basis()])]
    for n in range(1,10):
        factor = u if n==1 else x+q**(n-2)*y
        M,D,C = map_matrix(A,Ce,Cf if n==1 else Ce,factor)
        diffs.append(M)
        ker = A.span([sum((v[i]*D.basis()[i] for i in range(D.dimension())), A.V.zero())
                      for v in M.right_kernel().basis()])
        expected = A.span([x+q**(0 if n==1 else n-1)*y,z,j])
        assert ker==expected, ('kernel',n)
        im = A.span([A.mul(a,factor) for a in D.basis()])
        expected_im = A.span([u,A.b('v'),A.b('n')] if n==1
                             else [x+q**(n-2)*y,z,j])
        assert im==expected_im, ('image',n)
        rad_cod = A.span([a for a in (Cf if n==1 else Ce) if a not in [e,f]])
        assert all(v in rad_cod for v in im.basis()), ('minimality',n)
    for n in range(9):
        assert diffs[n]*diffs[n+1] == 0
        assert diffs[n].right_kernel() == diffs[n+1].column_space()
        print('degree',n,': dim R =',diffs[n].ncols(),
              '; outgoing rank =',diffs[n].rank(),'; incoming rank =',diffs[n+1].rank(),
              '; exact and minimal: PASS')
    print('PASS: simple character, kernel/image formulas, minimality; degrees 0..8')


def uniform():
    K = PolynomialRing(GF(2),['q','r']).fraction_field()
    q,r = K.gens()
    A=base.Algebra(K,q)
    x,y,z,j=[A.b(n) for n in 'xyzj']
    M,D,C = map_matrix(A,A.ideal('e'),A.ideal('e'),x+r*y)
    ker=A.span([sum((v[i]*D.basis()[i] for i in range(6)),A.V.zero())
                for v in M.right_kernel().basis()])
    assert ker == A.span([x+q*r*y,z,j])
    assert A.span([A.mul(a,x+r*y) for a in D.basis()]) == A.span([x+r*y,z,j])
    # Explicit pivot certificate survives r=q^i whenever 1+q^2*r != 0.
    cols=[A.mul(A.b(n),x+r*y) for n in 'eyt']
    minor=matrix(K,[[v[A.names.index(n)] for v in cols] for n in 'xzj']).det()
    assert minor==1+q**2*r
    assert all(A.mul(v,x+r*y)==0 for v in [x+q*r*y,z,j])
    print('UNIFORM: ker right(x+r*y) = <x+q*r*y,z,j>; image = <x+r*y,z,j>')
    print('Rank-3 minor (columns e,y,t; rows x,z,j) =',minor)
    print('At r=q^i, i>=0, pivot = 1+q^(i+2) is nonzero in F_2(q).')


if __name__=='__main__':
    for label,K,q in base.fields():
        print('\nFIELD:',label,flush=True)
        audit(K,q)
    uniform()
    print('ITEM 2 PASS (finite checks supported; uniform formula has symbolic certificate)')
