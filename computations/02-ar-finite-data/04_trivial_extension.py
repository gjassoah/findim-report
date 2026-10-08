#!/usr/bin/env python3
"""Claim: item 4, T=C semidirect DC is symmetric; Ext_T^a(s,s), a<=9.
Cases: all 20^3 associators/form identities; computed minimal covers through P_9.
Conventions: (a phi)(c)=phi(ca), (phi a)(c)=phi(ac); left modules, column maps.
Author: Codex job 04.
"""
import sys
sys.dont_write_bytecode=True
from importlib import import_module
base=import_module('01_algebra')
from sage.all import VectorSpace, matrix, block_diagonal_matrix, vector


class TrivialExtension(base.Algebra):
    def __init__(self,K,q):
        C=base.Algebra(K,q)
        self.K,self.q,self.dim=K,q,20
        self.names=C.names+[s.upper() for s in C.names]
        self.corners=C.corners+[(r,l) for l,r in C.corners]
        self.V=VectorSpace(K,20)
        self.basis=list(self.V.basis())
        self.table=[[self.V.zero() for j in range(20)] for i in range(20)]
        for i in range(10):
            for j in range(10):
                self.table[i][j]=vector(K,list(C.table[i][j])+[0]*10)
                self.table[i][10+j]=vector(K,[0]*10+[C.table[c][i][j] for c in range(10)])
                self.table[10+j][i]=vector(K,[0]*10+[C.table[i][c][j] for c in range(10)])


def structural(A):
    K,B,mul=A.K,A.basis,A.mul
    trace=lambda a: a[10]+a[18]
    G=matrix(K,[[trace(mul(a,b)) for b in B] for a in B])
    assert G==G.transpose() and G.rank()==20
    assert G==matrix(K,20,20,lambda i,j: int(j==(i+10)%20))
    for a in B:
        for b in B:
            for c in B:
                left,right=mul(mul(a,b),c),mul(a,mul(b,c))
                assert left==right,('T associativity',a,b,c)
                assert trace(left)==trace(right)
    assert all(mul(A.b('e')+A.b('f'),a)==mul(a,A.b('e')+A.b('f'))==a for a in B)
    radical=A.span([b for n,b in zip(A.names,B) if n not in 'ef'])
    assert radical.dimension()==18
    assert all(mul(a,b) in radical and mul(b,a) in radical for a in radical.basis() for b in B)
    P=radical
    dims=[P.dimension()]
    for i in range(2,7):
        P=A.span([mul(a,b) for a in radical.basis() for b in P.basis()])
        dims.append(P.dimension())
    assert dims[-1]==0
    assert all(mul(a,b)[i]==a[i]*b[i] for a in B for b in B for i in [0,8])
    print('PASS: dim T=20; all 8000 associators; form symmetric, associative, rank 20')
    print('PASS: trace-dual stars; radical powers dimensions',dims,flush=True)


def projective(A,vertices):
    """Return the left action on a direct sum of T e or T f."""
    indices=[[i for i,c in enumerate(A.corners) if c[1]==v] for v in vertices]
    actions=[]
    for a in range(20):
        blocks=[]
        for ids in indices:
            blocks.append(matrix(A.K,[[A.table[a][b][c] for b in ids] for c in ids]))
        actions.append(block_diagonal_matrix(blocks))
    return indices,actions


def ext_dimensions(A):
    K=A.K
    # Begin with the actual f-character, not the claimed resolution.
    actions=[matrix(K,1,1,[int(n=='f')]) for n in A.names]
    assert all(actions[i]*actions[j]==sum((A.table[i][j][k]*actions[k] for k in range(20)),matrix(K,1,1))
               for i in range(20) for j in range(20))
    fcounts=[]
    for degree in range(10):
        m=actions[0].nrows()
        V=VectorSpace(K,m)
        radical=V.subspace([c for name,M in zip(A.names,actions) if name not in 'ef' for c in M.columns()])
        chosen_span=radical
        generators=[]
        vertices=[]
        for v in ['e','f']:
            for g in actions[A.names.index(v)].columns():
                if g not in chosen_span:
                    generators.append(g)
                    vertices.append(v)
                    chosen_span=V.subspace(list(chosen_span.basis())+[g])
        assert chosen_span.dimension()==m
        ids,Pactions=projective(A,vertices)
        columns=[actions[b]*g for bs,g in zip(ids,generators) for b in bs]
        cover=matrix(K,columns).transpose()
        assert cover.rank()==m,('cover not surjective',degree)
        assert all(cover*Pactions[a]==actions[a]*cover for a in range(20)),('not T-linear',degree)
        kernel=cover.right_kernel()
        Pdim=cover.ncols()
        radP=VectorSpace(K,Pdim).subspace([c for name,M in zip(A.names,Pactions) if name not in 'ef' for c in M.columns()])
        assert kernel.is_subspace(radP),('cover not minimal',degree)
        nf=vertices.count('f')
        fcounts.append(nf)
        print('degree',degree,': syzygy dimension',m,'; top (e,f)',
              (vertices.count('e'),nf),'; projective dimension',Pdim,
              '; next kernel dimension',kernel.dimension(),flush=True)
        assert nf==int(degree%3==0),('Ext dimension differs',degree,nf)
        # Restrict the actual action to ker(cover); equality of the image of
        # its basis inclusion and the kernel certifies exactness recursively.
        inclusion=kernel.basis_matrix().transpose()
        assert cover*inclusion==0 and inclusion.rank()==Pdim-m
        actions=[]
        for M in Pactions:
            image=M*inclusion
            coords=matrix(K,[kernel.coordinate_vector(c) for c in image.columns()]).transpose()
            assert inclusion*coords==image
            actions.append(coords)
    print('Ext dimensions degrees 0..9:',fcounts)
    print('ITEM 4 PASS (supported); no Yoneda product or all-degree claim tested')


if __name__=='__main__':
    for label,K,q in base.fields():
        print('\nFIELD:',label,flush=True)
        A=TrivialExtension(K,q)
        structural(A)
        ext_dimensions(A)
