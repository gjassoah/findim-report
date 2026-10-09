# Phase B check of the chain-level identities in the report's proof of Prop. 9.14 (T-level part):
#  (A) sum_{w radical, left idempotent r} h(w) w* = r*  (r = e, f)
#  (C) h(a) xi = xi a for all basis a, where xi = sum_{w in basis} h(w) (x)_I w*  in T (x)_I T
#  (B) for radical basis a with right idempotent r:
#      sum_w a h(w) (x)_I w* + sum_w h(w) (x)_I w* h^{-1}(a) = a (x)_I r*   (w radical; I-components dropped
#      in the first factor as the report says "projecting to the radical in the first factor")
#  (H1) dB + Bd = D_b on generators r[a1|...|an]r' of Q, n = 0..3
#  (H2) p B = dG + Gd on generators, n = 0..4   (p = the report's chain map using the LAST three entries)
# Field GF(2)(q, lam), lam an indeterminate; exact.
import os, sys
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from talg import *
from itertools import product as iprod

rb = rad_basis
def lc(b): return Tcorner(b)[0]
def rc(b): return Tcorner(b)[1]
def trdual(w): return w.upper() if w in Cb else w.lower()
def isdual(b): return b not in Cb
def hfac(b, l):  # h_l(b) = hfac * b
    return l if isdual(b) else K(1)
zset = {'u', 'v', 't', 'E', 'X', 'Y', 'Z', 'U', 'V'}

def vec2dict(v):
    return {Tb[i]: v[i] for i in range(DIM) if v[i] != 0}
MD = {(A, B): vec2dict(MT[idx[A]][idx[B]]) for A in Tb for B in Tb}

def add(D, key, c):
    if c == 0: return
    D[key] = D.get(key, 0) + c
    if D[key] == 0: del D[key]

def addall(D, E, c=1):
    for k, v in E.items(): add(D, k, c * v)

# element of B^{-n}: dict {(a0, a1, ..., an, a_{n+1}): coeff}
def d(X):
    R = {}
    for key, c in X.items():
        n = len(key) - 2
        if n == 0:
            continue  # B^1 = 0
        for i in range(n + 1):
            for w, cc in MD[(key[i], key[i + 1])].items():
                if 1 <= i and i + 1 <= n and w in ('e', 'f'):
                    raise ValueError('inner product in I')
                add(R, key[:i] + (w,) + key[i + 2:], c * cc)
    return R

def lmul(a, X):  # basis a times X (on a0)
    R = {}
    for key, c in X.items():
        for w, cc in MD[(a, key[0])].items():
            add(R, (w,) + key[1:], c * cc)
    return R

def rmul_vecdict(X, Y):  # X times element Y (dict basis->coeff) on last
    R = {}
    for key, c in X.items():
        for y, cy in Y.items():
            for w, cc in MD[(key[-1], y)].items():
                add(R, key[:-1] + (w,), c * cy * cc)
    return R

def hinv_d(b):  # h^{-1}(b) as dict
    return {b: 1 / hfac(b, lam)}

def twisted_ext(gen_map):
    """extend a map defined on generators [a1..an] (tuple) to a0[..]a' by a0 psi h^{-1}(a')"""
    def F(X):
        R = {}
        for key, c in X.items():
            img = gen_map(key[1:-1])
            img = lmul(key[0], img)
            img = rmul_vecdict(img, hinv_d(key[-1]))
            addall(R, img, c)
        return R
    return F

def B_gen(gen):
    R = {}
    last = rc(gen[-1]) if gen else None
    for w in rb:
        if gen and lc(w) != last: continue
        for r0 in ('e', 'f'):
            # outer idempotents: generator 1[...]1 = sum over idempotents
            first = lc(gen[0]) if gen else lc(w)
            if r0 != first: continue
            add(R, (r0,) + gen + (w, trdual(w)), hfac(w, lam))
    return R

def G_gen(gen):
    if len(gen) == 0: return {}
    a = gen[-1]
    if a not in zset: return {}
    r0 = lc(gen[0])
    return {(r0,) + gen[:-1] + (a,): lam * q}

def p_chain(X):
    R = {}
    for key, c in X.items():
        n = len(key) - 2
        if n < 3: continue
        val = vec2dict(p_basis(key[n - 2], key[n - 1], key[n]))
        for w, cc in val.items():
            for ww, c3 in MD[(w, key[-1])].items():
                add(R, key[:n - 2] + (ww,), c * cc * c3)
    return R

# xi as dict over T (x)_I T: {(x, y): coeff}
xi = {}
for w in Tb:
    add(xi, (w, trdual(w)), hfac(w, lam))

def Db(X):  # only on B^0 elements: a0[ ]a' -> a0 a' xi
    R = {}
    for key, c in X.items():
        if len(key) != 2: continue
        for w, cc in MD[(key[0], key[1])].items():
            for (x, y), cx in xi.items():
                for ww, c2 in MD[(w, x)].items():
                    add(R, (ww, y), c * cc * cx * c2)
    return R

Bm = twisted_ext(B_gen)
Gm = twisted_ext(G_gen)

def gens(n):
    out = []
    for tup in iprod(rb, repeat=n):
        if all(rc(tup[i]) == lc(tup[i + 1]) for i in range(n - 1)):
            out.append(tup)
    return out

def gen_elem(gen, r0=None, r1=None):
    if gen:
        return {(lc(gen[0]),) + gen + (rc(gen[-1]),): K(1)}
    return {(r0, r1): K(1)} if r0 == r1 else {}

# (A)
for r in ('e', 'f'):
    s = zero()
    for w in rb:
        if lc(w) == r:
            s += hfac(w, lam) * MT[idx[w]][idx[trdual(w)]]
    print('(A) r=%s:' % r, vec2dict(s))
# (C)
okC = True
for a in Tb:
    L = {}
    for (x, y), c in xi.items():
        for w, cc in MD[(a, x)].items():
            add(L, (w, y), c * cc * hfac(a, lam))   # h(a) = hfac*a
    R = {}
    for (x, y), c in xi.items():
        for w, cc in MD[(y, a)].items():
            add(R, (x, w), c * cc)
    # tensor over I: (x,y) with corners matching automatically
    if L != R: okC = False; print('(C) fails', a)
print('(C) h(a) xi = xi a for all basis a:', okC)
# (B)
okB = True
for a in rb:
    r = rc(a)
    S = {}
    for w in rb:
        for x, cc in MD[(a, w)].items():
            if x in ('e', 'f'): continue
            add(S, (x, trdual(w)), cc * hfac(w, lam))
        for y, cc in MD[(trdual(w), a)].items():
            add(S, (w, y), hfac(w, lam) * cc / hfac(a, lam))
    target = {(a, r.upper()): K(1)}
    if S != target: okB = False; print('(B) fails', a, S)
print('(B) twisted Casimir identity for all radical basis a:', okB)
# (H1) dB + Bd = D_b
for n in range(0, 4):
    bad = 0; cnt = 0
    if n == 0:
        G0 = [gen_elem((), r, r) for r in ('e', 'f')]
    else:
        G0 = [gen_elem(g) for g in gens(n)]
    for X in G0:
        lhs = {}
        addall(lhs, d(Bm(X)))
        addall(lhs, Bm(d(X)))
        rhs = Db(X) if n == 0 else {}
        cnt += 1
        if lhs != rhs:
            bad += 1
    print('(H1) n=%d generators %d failures %d' % (n, cnt, bad), flush=True)
# (H2) pB = dG + Gd
for n in range(1, 5):
    bad = 0; cnt = 0
    for g in gens(n):
        X = gen_elem(g)
        lhs = p_chain(Bm(X))
        rhs = {}
        addall(rhs, d(Gm(X)))
        addall(rhs, Gm(d(X)))
        cnt += 1
        if lhs != rhs:
            bad += 1
    print('(H2) n=%d generators %d failures %d' % (n, cnt, bad), flush=True)
# report's p is a chain map: dp + pd = 0 on generators n = 3..5
for n in range(3, 6):
    bad = 0; cnt = 0
    for g in gens(n):
        X = gen_elem(g)
        s = {}
        addall(s, d(p_chain(X)))
        addall(s, p_chain(d(X)))
        cnt += 1
        if s: bad += 1
    print('(P) n=%d generators %d failures %d' % (n, cnt, bad), flush=True)
# evaluation of xi at s: xi (x)_T fbar = sum h(w) (x) w* fbar; only w* = f survives
print('terms of xi with w* = f:', {k: v for k, v in xi.items() if k[1] == 'f'})
