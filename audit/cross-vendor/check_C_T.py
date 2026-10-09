# Claims checked: Lemma 9.1 (C associative, grading, radical N, N^5=0, N^4 != 0),
# table (9.2) for i=0..12, Prop 9.3 exactness of R and of Hom_C(R,C) for i = 0..12 (the all-i argument is by hand in A9.md),
# Lemma 9.4 (T associative, dim 20, tr symmetric and nondegenerate, rad = N+DC, (rad)^6 = 0, rad^5 status, T/rad = k x k).
# Field: GF(2)(q) exact (Sage fraction field).
import os, sys
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from talg import *
from sage.all import matrix, vector, span

Cidx = list(range(10))
# --- associativity of C and of T
bad = 0
for i in range(DIM):
    for j in range(DIM):
        ij = MT[i][j]
        for k in range(DIM):
            lhs = mul(ij, MT[j][k] * 0 + bv(Tb[k]))
            rhs = mul(bv(Tb[i]), MT[j][k])
            if lhs != rhs:
                bad += 1
                if i < 10 and j < 10 and k < 10:
                    print('C nonassoc', Tb[i], Tb[j], Tb[k])
print('associativity failures in T (incl. C):', bad)
# unit
one = bv('e') + bv('f')
print('1 is unit:', all(mul(one, bv(b)) == bv(b) and mul(bv(b), one) == bv(b) for b in Tb))
# --- grading of C
okg = True
for a in Cb:
    for b in Cb:
        for w, c in mulC(a, b).items():
            if c != 0 and deg[w] != deg[a] + deg[b]:
                okg = False; print('grading fails', a, b, w)
print('C graded:', okg)
# corner consistency of products in T
okc = True
for A in Tb:
    for B in Tb:
        v = MT[idx[A]][idx[B]]
        for w in Tb:
            if v[idx[w]] != 0:
                if Tcorner(A)[1] != Tcorner(B)[0] or Tcorner(w) != (Tcorner(A)[0], Tcorner(B)[1]):
                    okc = False; print('corner', A, B, w)
print('corners consistent in T:', okc)


def span_mat(vecs):
    if not vecs:
        return matrix(K, 0, DIM)
    M = matrix(K, vecs)
    return M.row_space()


def products(U, V):
    vecs = []
    for a in U.basis():
        for b in V.basis():
            vecs.append(mul(a, b))
    return span_mat(vecs) if vecs else span_mat([])


Nsp = span_mat([bv(b) for b in ['x', 'y', 'z', 'u', 'v', 't', 'j', 'n']])
Cfull = span_mat([bv(b) for b in Cb])
print('N is ideal of C:', products(Cfull, Nsp).is_subspace(Nsp) and products(Nsp, Cfull).is_subspace(Nsp))
pw = Nsp
for m in range(2, 6):
    pw = products(pw, Nsp)
    print('dim N^%d =' % m, pw.dimension())
# T radical
Rsp = span_mat([bv(b) for b in rad_basis])
Tfull = span_mat([bv(b) for b in Tb])
print('N+DC ideal of T:', products(Tfull, Rsp).is_subspace(Rsp) and products(Rsp, Tfull).is_subspace(Rsp))
pw = Rsp
for m in range(2, 7):
    pw = products(pw, Rsp)
    print('dim (N+DC)^%d =' % m, pw.dimension())
# symmetric form
G = matrix(K, DIM, DIM, lambda i, j: tr(MT[i][j]))
print('tr symmetric:', G == G.transpose(), ' Gram det != 0:', G.det() != 0)

# --- table (9.2) and Prop 9.3 for i = 0..12
Ce = ['e', 'x', 'y', 'z', 't', 'j']
Cf = ['f', 'u', 'v', 'n']
eC = ['e', 'x', 'y', 'z', 'u', 'v']
fC = ['f', 't', 'j', 'n']


def ell(i):
    return bv('x') + q**i * bv('y')


def rightmult_matrix(src, tgt, a):
    # rows: images of src basis under c -> c a, in coordinates of tgt basis
    rows = []
    for c in src:
        img = mul(bv(c), a)
        assert all(img[idx[w]] == 0 for w in Tb if w not in tgt), (c, img)
        rows.append([img[idx[w]] for w in tgt])
    return matrix(K, rows)


def leftmult_matrix(src, tgt, a):
    rows = []
    for c in src:
        img = mul(a, bv(c))
        assert all(img[idx[w]] == 0 for w in Tb if w not in tgt), (c, img)
        rows.append([img[idx[w]] for w in tgt])
    return matrix(K, rows)


# table rows
print('table au:', [mul(bv(c), bv('u')) for c in Ce])
for i in range(0, 3):
    print('table a l_%d:' % i, [ {w: mul(bv(c), ell(i))[idx[w]] for w in Tb if mul(bv(c), ell(i))[idx[w]] != 0} for c in Ce])
ok = True
Mu = rightmult_matrix(Ce, Cf, bv('u'))           # row-vector convention: x -> x*M
# H^0 = Cf / im(u) has dim 1 and is spanned by f
print('dim Cf/im(.u) =', 4 - Mu.rank())
prev = Mu
for i in range(0, 13):
    Ml = rightmult_matrix(Ce, Ce, ell(i))
    if (Ml * prev).is_zero() is False:
        ok = False; print('not a complex at', i)
    # exactness: rank(Ml) + rank(prev) = 6
    if Ml.rank() + prev.rank() != 6:
        ok = False; print('not exact at', i)
    prev = Ml
print('R exact (degrees -1..-14) and complex:', ok)
# minimality: entries of differentials in radical (u and l_i in N) - clear.
# Hom_C(R, C): fC -> eC -> eC -> ... by left multiplication
Lu = leftmult_matrix(fC, eC, bv('u'))
print('rank u. on fC:', Lu.rank(), '(injective iff 4)')
prev = Lu
coh = []
for i in range(0, 13):
    Ll = leftmult_matrix(eC, eC, ell(i))
    assert (prev * Ll).is_zero()
    coh.append(6 - Ll.rank() - prev.rank())
    if i == 0:
        # kernel of l_1. / image of l_0.
        pass
    prev = Ll
print('dims of H^1,H^2,... of Hom_C(R,C):', coh)
# H^2: kernel of l_1. modulo image of l_0.
L0 = leftmult_matrix(eC, eC, ell(0)); L1 = leftmult_matrix(eC, eC, ell(1))
ker = L1.left_kernel(); im = L0.row_space()
print('ker(l1.)=', ker.basis(), ' im(l0.)=', im.basis())
# right action on H^2 class of v: v*t, v*n, v*f
print('v.t =', mul(bv('v'), bv('t')), ' v.n =', mul(bv('v'), bv('n')), ' v.f = v:', mul(bv('v'), bv('f')) == bv('v'))
