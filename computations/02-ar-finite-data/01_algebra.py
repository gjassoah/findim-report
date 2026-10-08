#!/usr/bin/env python3
"""Claim: item 1, the ten-dimensional algebra and its radical.
Cases: all 10^3 basis triples over F_2(q), then q primitive in F_(2^16).
Conventions: basis e,x,y,z,u,v,t,j,f,n; corners left first; no opposite algebra.
Author: Codex job 04.
"""
import os
import sys
from pathlib import Path
os.environ.setdefault('DOT_SAGE', str(Path(__file__).resolve().parent))
sys.dont_write_bytecode = True
from sage.all import GF, PolynomialRing, vector, matrix, VectorSpace


def fields():
    K = PolynomialRing(GF(2), 'q').fraction_field()
    yield 'exact F_2(q)', K, K.gen()
    F = GF(2**16, name='a')
    q = F.multiplicative_generator()
    print('Finite-field modulus:', F.modulus())
    print('Specialisation q =', q, '; multiplicative order =', q.multiplicative_order())
    assert q.multiplicative_order() == 65535
    yield 'specialised F_(2^16)', F, q


class Algebra:
    def __init__(self, K, q):
        self.K, self.q = K, q
        self.names = list('exyzuvtjfn')
        self.corners = [('e','e')]*4 + [('e','f')]*2 + [('f','e')]*2 + [('f','f')]*2
        self.dim = 10
        self.V = VectorSpace(K, 10)
        self.basis = list(self.V.basis())
        self.table = [[self.V.zero() for b in range(10)] for a in range(10)]
        for i, (left, right) in enumerate(self.corners):
            self.table[self.names.index(left)][i] = self.basis[i]
            self.table[i][self.names.index(right)] = self.basis[i]
        products = [('x','y',{'z':q}), ('y','x',{'z':1}),
                    ('x','u',{'v':1}), ('y','u',{'v':1}),
                    ('t','x',{'j':1}), ('t','y',{'j':q**2}),
                    ('u','t',{'y':1,'x':q}), ('v','t',{'z':q}),
                    ('u','j',{'z':1}), ('t','u',{'n':1+q}),
                    ('n','t',{'j':q}), ('u','n',{'v':1})]
        for a,b,cs in products:
            self.table[self.names.index(a)][self.names.index(b)] = self.elem(cs)

    def elem(self, cs):
        v = vector(self.K, self.dim)
        for name,c in cs.items():
            v[self.names.index(name)] += c
        return v

    def b(self, name):
        return self.basis[self.names.index(name)]

    def mul(self, a, b):
        v = self.V.zero()
        for i in a.nonzero_positions():
            for j in b.nonzero_positions():
                v += a[i]*b[j]*self.table[i][j]
        return v

    def span(self, vectors):
        return self.V.subspace(vectors)

    def ideal(self, vertex, left=True):
        return [v for v,ends in zip(self.basis,self.corners)
                if ends[1 if left else 0] == vertex]


def audit(K, q):
    A = Algebra(K,q)
    B, mul = A.basis, A.mul
    assert len(B) == matrix(K,B).rank() == 10
    for i,a in enumerate(B):
        for j,b in enumerate(B):
            for k,c in enumerate(B):
                assert mul(mul(a,b),c) == mul(a,mul(b,c)), ('associativity',A.names[i],A.names[j],A.names[k])
    print('PASS: associativity on all 1000 basis triples')
    e,f = A.b('e'), A.b('f')
    assert mul(e,e)==e and mul(f,f)==f and mul(e,f)==mul(f,e)==A.V.zero()
    assert all(mul(e+f,a)==mul(a,e+f)==a for a in B)
    dims = [A.span([mul(mul(A.b(i),a),A.b(j)) for a in B]).dimension()
            for i,j in [('e','e'),('e','f'),('f','e'),('f','f')]]
    assert dims == [4,2,2,2]
    print('PASS: unit e+f, orthogonal idempotents, corner dimensions',dims)
    N = A.span([A.b(a) for a in 'xyzuvtjn'])
    assert all(mul(a,b) in N and mul(b,a) in N for a in N.basis() for b in B)
    powers, P = [N.dimension()], N
    for n in range(2,6):
        P = A.span([mul(a,b) for a in P.basis() for b in N.basis()])
        powers.append(P.dimension())
    assert powers[-1] == 0
    # The coordinate projection to e,f is an onto algebra map with kernel N.
    for a in B:
        for b in B:
            ab = mul(a,b)
            assert ab[0]==a[0]*b[0] and ab[8]==a[8]*b[8]
    print('PASS: N two-sided; dimensions N^1..N^5 =',powers,'; C/N = k x k')
    u,t,z = A.b('u'),A.b('t'),A.b('z')
    product = mul(mul(mul(u,t),u),t)
    assert product == q*(1+q)*z and product != A.V.zero()
    print('PASS: ((ut)u)t =',product,'= q(1+q)z != 0')
    print('ITEM 1 PASS (supported by exhaustive exact computation)')


if __name__ == '__main__':
    for label,K,q in fields():
        print('\nFIELD:',label,flush=True)
        audit(K,q)
