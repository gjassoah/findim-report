# Common definitions: algebra C of Section 9.1 and T = C x DC of Section 9.2, cochain p of Section 9.3.
# Conventions (fixed by me, from the document):
#  * products right-to-left; basis vector c in aCb means a*c = c = c*b (a,b idempotents in {e,f}).
#  * T = C (+) DC, (c,phi)(c',phi') = (cc', c.phi' + phi.c'), (a.phi)(c) = phi(c a), (phi.a)(c) = phi(a c).
#  * c* denotes the dual basis vector of DC; capital letter X = x* etc.
#  * field: GF(2)(q, lam) (lam only used for Lemma 9.7(3)).
from sage.all import GF, PolynomialRing, FractionField, vector, matrix, QQ

R = PolynomialRing(GF(2), 'q,lam')
K = FractionField(R)
q, lam = [K(g) for g in R.gens()]

Cb = ['e', 'x', 'y', 'z', 'u', 'v', 't', 'j', 'f', 'n']
corner = {'e': ('e', 'e'), 'x': ('e', 'e'), 'y': ('e', 'e'), 'z': ('e', 'e'),
          'u': ('e', 'f'), 'v': ('e', 'f'), 't': ('f', 'e'), 'j': ('f', 'e'),
          'f': ('f', 'f'), 'n': ('f', 'f')}   # c in (left idempotent) C (right idempotent)
deg = {'e': 0, 'f': 0, 'u': 1, 't': 1, 'x': 2, 'y': 2, 'n': 2, 'v': 3, 'j': 3, 'z': 4}
# products of two non-idempotent basis vectors (all others zero)
prodC = {('x', 'y'): {'z': q}, ('y', 'x'): {'z': 1}, ('x', 'u'): {'v': 1}, ('y', 'u'): {'v': 1},
         ('t', 'x'): {'j': 1}, ('t', 'y'): {'j': q**2}, ('u', 't'): {'y': 1, 'x': q},
         ('v', 't'): {'z': q}, ('u', 'j'): {'z': 1}, ('t', 'u'): {'n': 1 + q}, ('n', 't'): {'j': q},
         ('u', 'n'): {'v': 1}}

Tb = Cb + [c.upper() for c in Cb]       # 20 basis vectors; upper = dual
idx = {b: i for i, b in enumerate(Tb)}
DIM = 20


def zero():
    return vector(K, DIM)


def bv(b):
    v = zero(); v[idx[b]] = 1; return v


def mulC(a, b):
    """product of basis vectors of C as dict"""
    if a in ('e', 'f'):
        return {b: K(1)} if corner[b][0] == a else {}
    if b in ('e', 'f'):
        return {a: K(1)} if corner[a][1] == b else {}
    return {k: K(c) for k, c in prodC.get((a, b), {}).items()}


# structure constants of C as 10x10 -> vector
def mulC_vec(a, b):
    v = zero()
    for k, c in mulC(a, b).items():
        v[idx[k]] += c
    return v


def mult_basis(A, B):
    """product of two basis vectors of T"""
    v = zero()
    if A in Cb and B in Cb:
        return mulC_vec(A, B)
    if A in Cb and B not in Cb:
        # (A . phi)(c) = phi(c A), phi = B.lower()*
        phi = B.lower()
        for c in Cb:
            coeff = mulC(c, A).get(phi, 0)
            if coeff:
                v[idx[c.upper()]] += coeff
        return v
    if A not in Cb and B in Cb:
        phi = A.lower()
        for c in Cb:
            coeff = mulC(B, c).get(phi, 0)
            if coeff:
                v[idx[c.upper()]] += coeff
        return v
    return v


MT = [[mult_basis(A, B) for B in Tb] for A in Tb]


def mul(a, b):
    """product of two elements (vectors) of T"""
    res = zero()
    for i in range(DIM):
        if a[i] == 0:
            continue
        for j in range(DIM):
            if b[j] == 0:
                continue
            res += a[i] * b[j] * MT[i][j]
    return res


def tr(a):
    return a[idx['E']] + a[idx['F']]   # tr(c, phi) = phi(1) = phi(e)+phi(f)


rad_basis = [b for b in Tb if b not in ('e', 'f')]   # 18 vectors: radical r


def Tcorner(b):
    """(left idempotent, right idempotent) of a basis vector of T"""
    if b in Cb:
        return corner[b]
    l, r = corner[b.lower()]
    return (r, l)   # dual reverses


# cochain p
def load_p():
    txt = open(os.path.join(os.path.dirname(os.path.abspath(__file__)), 'cochain-table.md')).read().splitlines()
    P = {}
    n = 0
    for line in txt:
        if not (line.startswith('coefficient') and ':' in line and line.split(':')[0].split()[1].startswith(('q','1'))):
            continue
        head, entries = line.split(':', 1)
        c = head.split()[1]
        if c == 'q^2':
            co = q**2
        elif c == 'q^3':
            co = q**3
        elif c == 'q':
            co = q
        elif c == '1':
            co = K(1)
        else:
            raise ValueError(c)
        for ent in entries.split():
            assert len(ent) == 4
            a, b, cc, w = ent
            key = (a, b, cc)
            P.setdefault(key, zero())
            assert P[key][idx[w]] == 0, ent
            P[key][idx[w]] += co
            n += 1
    return P, n


P, NENT = load_p()


def p_basis(a, b, c):
    """p on basis vectors (zero if a factor in I or not in table)"""
    return P.get((a, b, c), zero())


def p_vec(a, b, c):
    """p extended trilinearly to vectors (I-components are dropped, p extended by zero)"""
    res = zero()
    for i, A in enumerate(Tb):
        if a[i] == 0 or A in ('e', 'f'):
            continue
        for j, B in enumerate(Tb):
            if b[j] == 0 or B in ('e', 'f'):
                continue
            for k, Cc in enumerate(Tb):
                if c[k] == 0 or Cc in ('e', 'f'):
                    continue
                key = (A, B, Cc)
                if key in P:
                    res += a[i] * b[j] * c[k] * P[key]
    return res
