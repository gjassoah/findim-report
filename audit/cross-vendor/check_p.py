# Claims checked: Lemma 9.7 (1)-(4) for the cochain p of cochain-table.md, plus I-bilinearity (corner)
# consistency of the table, plus the data used in Prop 9.8 (cobar functional) and Lemma 9.9.
# Scope: all basis quadruples (a,b,c,d) of r for (1); all basis triples for (2); all basis pairs (a,b) for (3)
# with lam a transcendental (identity in GF(2)(q,lam), hence for every lam in k^x); field GF(2)(q,lam).
import os, sys
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from talg import *

print('number of table entries:', NENT, ' distinct triples:', len(P))
# --- corner consistency (I-multilinearity): (a,b,c) composable and w in (left(a), right(c))
okc = True
for (a, b, c), val in P.items():
    if Tcorner(a)[1] != Tcorner(b)[0] or Tcorner(b)[1] != Tcorner(c)[0]:
        okc = False; print('non composable triple', a, b, c)
    for w in Tb:
        if val[idx[w]] != 0 and Tcorner(w) != (Tcorner(a)[0], Tcorner(c)[1]):
            okc = False; print('corner of value wrong', a, b, c, w)
    for x in (a, b, c):
        if x in ('e', 'f'):
            okc = False; print('idempotent input', a, b, c)
print('table I-bilinear (corner consistent):', okc)

# --- (1) cocycle identity on all basis quadruples of r
rb = rad_basis
fails = 0
cnt = 0
for a in rb:
    A = bv(a)
    for b in rb:
        if Tcorner(a)[1] != Tcorner(b)[0]:
            continue
        B = bv(b)
        AB = MT[idx[a]][idx[b]]
        for c in rb:
            if Tcorner(b)[1] != Tcorner(c)[0]:
                continue
            Cc = bv(c)
            BC = MT[idx[b]][idx[c]]
            pabc = p_basis(a, b, c)
            for d in rb:
                if Tcorner(c)[1] != Tcorner(d)[0]:
                    continue
                D = bv(d)
                CD = MT[idx[c]][idx[d]]
                s = mul(A, p_basis(b, c, d)) + p_vec(AB, Cc, D) + p_vec(A, BC, D) + p_vec(A, B, CD) + mul(pabc, D)
                cnt += 1
                if s != 0:
                    fails += 1
                    if fails < 5:
                        print('cocycle fails', a, b, c, d, s)
print('(1) composable quadruples checked:', cnt, ' failures:', fails)
# (non-composable quadruples: every term vanishes by I-bilinearity, given the corner check above)

# --- (2) dual-count property
def ndual(s):
    return sum(1 for ch in s if ch.isupper())
ok2 = True
for (a, b, c), val in P.items():
    for w in Tb:
        if val[idx[w]] != 0 and ndual(a + b + c) != ndual(w) + 1:
            ok2 = False; print('(2) fails', a, b, c, w)
print('(2) holds:', ok2)

# --- (3)
def h(l, v):
    w = vector(K, v)
    for i in range(10, 20):
        w[i] = l * w[i]
    return w

zset = {'u', 'v', 't', 'E', 'X', 'Y', 'Z', 'U', 'V'}
def zl(l, v):
    w = zero()
    for i, B in enumerate(Tb):
        if v[i] != 0 and B in zset:
            w[i] += l * q * v[i]
    return w

def trdual(w):
    return w.upper() if w in Cb else w.lower()

ok3 = True
for a in rb:
    for b in rb:
        A, B = bv(a), bv(b)
        lhs = zero()
        for w in rb:
            lhs += mul(p_vec(A, B, h(lam, bv(w))), bv(trdual(w)))
        AB = mul(A, B)
        rhs = mul(A, zl(lam, B)) + zl(lam, AB) + mul(zl(lam, A), h(1 / lam, B))
        if lhs != rhs:
            ok3 = False; print('(3) fails', a, b, lhs - rhs)
print('(3) holds for all basis pairs (a,b), lam symbolic:', ok3)
# also check trace-duality claim: tr(w * trdual(w')) = delta
okd = all(tr(mul(bv(w), bv(trdual(w2)))) == (1 if w == w2 else 0) for w in Tb for w2 in Tb)
print('c* is trace-dual of c and (c*)* = c:', okd)

# --- (4)
print('(4) p(t,x,J) =', p_basis('t', 'x', 'J'), '\n    p(t,y,J) =', p_basis('t', 'y', 'J'))

# --- data for Prop 9.8: x.J, y.J, t.x, t.y
print('x*J =', mul(bv('x'), bv('J')), '\n y*J =', mul(bv('y'), bv('J')))
print('t*x =', mul(bv('t'), bv('x')), '\n t*y =', mul(bv('t'), bv('y')))
# f-coefficient functional pbar(a,b,c) = coefficient of f in p(a,b,c) for a in fT, c in Tf
nz = [(k, v[idx['f']]) for k, v in P.items() if v[idx['f']] != 0]
print('nonzero f-coefficients of p:', nz)
