"""
Claim checked (finite sanity check of the construction used for Prop. 6.15 in A6.md):
  Given complexes V0,V1,V2 (here: of k-vector spaces; right B-linearity is formal), chain maps
  f_a (a: i -> j) and degree -1 maps h_rho with d h + h d = f_rho = sum rho_ba f_b f_a,
  the twisted complex
    P = (+)_i Be_i (x) V_i  (+)  (+)_{a:i->j} Be_j (x) V_i [1]  (+)  (+)_rho Be_2 (x) V_0 [2]
  with d[c|v]_i = [c|dv]_i,
       d[c|v]_a = -[c|dv]_a + [ca|v]_i - [c|f_a v]_j,
       d[c|v]_rho = [c|dv]_rho + sum rho_ba ([cb|v]_a + [c|f_a v]_b) + [c|h_rho v]_2
  satisfies d^2 = 0, d commutes with left multiplication by B, iota_l: V_l -> e_l P,
  v -> [e_l|v]_l, is a quasi-isomorphism (= homotopy equivalence over a field), and
  H(v) = [e_j|v]_a satisfies dH + Hd = a iota_i - iota_j f_a.
Cases: quiver with vertices 0,1,2, d+1 = 2 arrows 0->1 and 2 arrows 1->2; J2 a random 2-dim
  subspace of kQ_2 (4-dim); random complexes; two data regimes (V0 contractible, V2 contractible).
Conventions: cohomological grading; arrows compose right to left; [c|v]_a with v in V_i^{n+1}
  sits in degree n, [c|v]_rho with v in V_0^{n+2} in degree n. Arithmetic mod p = 10007.
"""
import itertools, random
import numpy as np
p = 10007
rng = random.Random(1)

def rank(M):
    M = [list(map(int, r)) for r in np.array(M, dtype=np.int64) % p]
    if not M or not M[0]: return 0
    r = 0; rows, cols = len(M), len(M[0])
    for c in range(cols):
        piv = next((i for i in range(r, rows) if M[i][c] % p), None)
        if piv is None: continue
        M[r], M[piv] = M[piv], M[r]
        inv = pow(M[r][c], p - 2, p)
        M[r] = [x * inv % p for x in M[r]]
        for i in range(rows):
            if i != r and M[i][c]:
                f = M[i][c]; M[i] = [(x - f * y) % p for x, y in zip(M[i], M[r])]
        r += 1
    return r

def nullspace(M):
    M = np.array(M, dtype=np.int64) % p
    rows, cols = M.shape
    A = [list(map(int, r)) for r in M]; pivcols = []; r = 0
    for c in range(cols):
        piv = next((i for i in range(r, rows) if A[i][c] % p), None)
        if piv is None: continue
        A[r], A[piv] = A[piv], A[r]; inv = pow(A[r][c], p - 2, p)
        A[r] = [x * inv % p for x in A[r]]
        for i in range(rows):
            if i != r and A[i][c]:
                f = A[i][c]; A[i] = [(x - f * y) % p for x, y in zip(A[i], A[r])]
        pivcols.append(c); r += 1
    free = [c for c in range(cols) if c not in pivcols]; basis = []
    for fc in free:
        v = [0] * cols; v[fc] = 1
        for i, pc in enumerate(pivcols): v[pc] = (-A[i][fc]) % p
        basis.append(v)
    return np.array(basis, dtype=np.int64).reshape(len(basis), cols)

mm = lambda A, B: (A @ B) % p

# ---- graded complexes: dims dict deg->dim, total space with offsets
class Cx:
    def __init__(self, dims, D):
        self.dims = dims; self.degs = sorted(dims); self.D = D % p
        self.off = {}; o = 0
        for n in self.degs: self.off[n] = o; o += dims[n]
        self.N = o
    def deg_of(self):
        out = []
        for n in self.degs: out += [n] * self.dims[n]
        return out

def random_complex(dims):
    degs = sorted(dims); N = sum(dims.values()); D = np.zeros((N, N), dtype=np.int64)
    off = {}; o = 0
    for n in degs: off[n] = o; o += dims[n]
    # build d^n : V^n -> V^{n+1} with d^{n+1} d^n = 0: choose d^n of random rank, then d^{n+1} kills its image
    prev = None
    for n in degs:
        if n + 1 not in dims: continue
        a, b = dims[n], dims[n + 1]
        # constraint: d^n restricted to image of d^{n-1} is zero
        if prev is not None and prev.size:
            K = nullspace(prev.T)  # rows spanning left... we need d^n * prev = 0 -> rows of d^n in left null space of prev
            basis = K  # vectors w with w @ prev = 0
        else:
            basis = np.eye(a, dtype=np.int64)
        coeff = np.array([[rng.randrange(p) for _ in range(len(basis))] for _ in range(b)], dtype=np.int64)
        # random lower rank
        if len(basis) and rng.random() < 0.5:
            coeff[rng.randrange(b)] = 0
        dn = mm(coeff, basis) if len(basis) else np.zeros((b, a), dtype=np.int64)
        D[off[n + 1]:off[n + 1] + b, off[n]:off[n] + a] = dn
        prev = dn
    return Cx(dims, D)

def contractible(dims_w):
    # cone(id_W): degrees n: W^n (+) W^{n+1}; d(x,y) = (dx + y, -dy) with W having zero differential
    degs = sorted(set(list(dims_w) + [n - 1 for n in dims_w]))
    dims = {n: dims_w.get(n, 0) + dims_w.get(n + 1, 0) for n in degs}
    C = Cx(dims, np.zeros((1, 1)))
    D = np.zeros((C.N, C.N), dtype=np.int64); S = np.zeros((C.N, C.N), dtype=np.int64)
    for n in degs:
        x0 = C.off[n]; y0 = C.off[n] + dims_w.get(n, 0)
        # y-part in degree n is W^{n+1}; d maps y in deg n to x in deg n+1 (identity)
        if n + 1 in C.off:
            for t in range(dims_w.get(n + 1, 0)):
                D[C.off[n + 1] + t, y0 + t] = 1
                S[y0 + t, C.off[n + 1] + t] = 1  # contraction: x in deg n+1 -> y in deg n
    C.D = D % p
    return C, S % p

def degree_map_ok(M, src, tgt, k):
    ds, dt = src.deg_of(), tgt.deg_of()
    for i in range(tgt.N):
        for j in range(src.N):
            if M[i, j] % p and dt[i] != ds[j] + k: return False
    return True

def random_chain_map(src, tgt):
    # unknowns: degree-0 block entries; equation D_t F - F D_s = 0
    ds, dt = src.deg_of(), tgt.deg_of()
    slots = [(i, j) for i in range(tgt.N) for j in range(src.N) if dt[i] == ds[j]]
    eqs = []
    for i in range(tgt.N):
        for j in range(src.N):
            row = [0] * len(slots)
            for s_, (a, b) in enumerate(slots):
                # (D_t F)_{ij} = sum_a D_t[i,a] F[a,j]; (F D_s)_{ij} = sum_b F[i,b] D_s[b,j]
                if b == j: row[s_] += tgt.D[i, a]
                if a == i: row[s_] -= src.D[b, j]
            eqs.append(row)
    Nsp = nullspace(np.array(eqs, dtype=np.int64)) if slots else np.zeros((0, 0), dtype=np.int64)
    F = np.zeros((tgt.N, src.N), dtype=np.int64)
    if len(Nsp):
        c = np.array([rng.randrange(p) for _ in range(len(Nsp))], dtype=np.int64)
        vec = (c @ Nsp) % p
        for s_, (a, b) in enumerate(slots): F[a, b] = vec[s_]
    return F

# ---- the algebra B
A01 = ['s', 'a']; A12 = ['t', 'b']           # t = s', b = a'
Q2 = [(y, x) for y in A12 for x in A01]      # path y x
J2 = np.array([[rng.randrange(p) for _ in Q2] for _ in range(2)], dtype=np.int64)  # rows = rho (coeffs on Q2)
assert rank(J2) == 2
# B_2 = kQ2/J2: quotient map = projection onto complement coords. Choose matrix Pi (2x4) with kernel = rowspace(J2)
Pi = nullspace(J2)                            # vectors w with J2 w = 0; then quotient coords = ? use dual: Pi2 rows annihilate J2 rows
Pi = nullspace(J2 % p)                        # each row w satisfies J2 @ w = 0
Pi = Pi % p                                   # functional  v -> Pi @ v  kills rowspace(J2)? need (Pi @ J2^T)=0
assert np.all(mm(Pi, J2.T) == 0)
dimB2 = Pi.shape[0]
# basis of Be_j (paths starting at j): Be_0: e0, s, a, B2-basis ; Be_1: e1, t, b ; Be_2: e2
Bbasis = {0: ['e0'] + A01 + ['q%d' % m for m in range(dimB2)], 1: ['e1'] + A12, 2: ['e2']}
end = {'e0': 0, 's': 1, 'a': 1, 'e1': 1, 't': 2, 'b': 2, 'e2': 2}
for m in range(dimB2): end['q%d' % m] = 2

def left_mult(arrow, j):
    """matrix of c -> arrow*c on Be_j (basis Bbasis[j])."""
    bas = Bbasis[j]; M = np.zeros((len(bas), len(bas)), dtype=np.int64)
    for col, c in enumerate(bas):
        if c.startswith('e'):
            src_vertex = int(c[1])
            if (arrow in A01 and src_vertex == 0) or (arrow in A12 and src_vertex == 1):
                M[bas.index(arrow), col] = 1
        elif c in A01 and arrow in A12:
            vec = np.zeros(len(Q2), dtype=np.int64); vec[Q2.index((arrow, c))] = 1
            img = mm(Pi, vec)
            for m in range(dimB2): M[bas.index('q%d' % m), col] = img[m]
    return M % p

def mult_right(c_basis_idx, arrow, i, j):
    """for c in Be_j and arrow a: i->j, c*a lies in Be_i; return matrix Be_j -> Be_i."""
    bj, bi = Bbasis[j], Bbasis[i]; M = np.zeros((len(bi), len(bj)), dtype=np.int64)
    for col, c in enumerate(bj):
        if c == 'e%d' % j: M[bi.index(arrow), col] = 1
        elif c in A12 and arrow in A01:  # c = y (1->2), c*a = y a in B2
            vec = np.zeros(len(Q2), dtype=np.int64); vec[Q2.index((c, arrow))] = 1
            img = mm(Pi, vec)
            for m in range(dimB2): M[bi.index('q%d' % m), col] = img[m]
    return M % p

def run(V, f, h, label):
    arrows = [(x, 0, 1) for x in A01] + [(y, 1, 2) for y in A12]
    comps = []  # (kind, key, j(B-vertex for c), Vidx, shift)
    for i in range(3): comps.append(('v', i, i, i, 0))
    for (x, i, j) in arrows: comps.append(('a', x, j, i, 1))
    for r in range(len(J2)): comps.append(('r', r, 2, 0, 2))
    off = {}; o = 0
    for cp in comps:
        off[cp[:2]] = o; o += len(Bbasis[cp[2]]) * V[cp[3]].N
    NP = o; D = np.zeros((NP, NP), dtype=np.int64)
    def blk(cp): return off[cp[:2]]
    def place(tgtcp, srccp, M):
        a0, b0 = off[tgtcp[:2]], off[srccp[:2]]
        D[a0:a0 + M.shape[0], b0:b0 + M.shape[1]] += M
    K = lambda A, B: np.kron(A, B) % p     # (c-part) (x) (v-part)
    cpd = {cp[:2]: cp for cp in comps}
    for i in range(3):
        cp = cpd[('v', i)]; place(cp, cp, K(np.eye(len(Bbasis[i]), dtype=np.int64), V[i].D))
    for (x, i, j) in arrows:
        cp = cpd[('a', x)]; I_c = np.eye(len(Bbasis[j]), dtype=np.int64)
        place(cp, cp, -K(I_c, V[i].D))
        place(cpd[('v', i)], cp, K(mult_right(None, x, i, j), np.eye(V[i].N, dtype=np.int64)))
        place(cpd[('v', j)], cp, -K(I_c, f[x]))
    for r in range(len(J2)):
        cp = cpd[('r', r)]; I2 = np.eye(1, dtype=np.int64)
        place(cp, cp, K(I2, V[0].D))
        for (y, x) in Q2:
            coef = J2[r, Q2.index((y, x))]
            place(cpd[('a', x)], cp, coef * K(mult_right(None, y, 1, 2), np.eye(V[0].N, dtype=np.int64)))
            place(cpd[('a', y)], cp, coef * K(I2, f[x]))
        place(cpd[("v", 2)], cp, -K(I2, h[r]))
    D %= p
    # degrees
    degs = []
    for cp in comps:
        dv = V[cp[3]].deg_of()
        for _ in Bbasis[cp[2]]: degs += [n - cp[4] for n in dv]
    ok_deg = all(D[i, j] == 0 or degs[i] == degs[j] + 1 for i in range(NP) for j in range(NP))
    ok_d2 = np.all(mm(D, D) == 0)
    # left action of arrows
    def Lmat(arrow):
        L = np.zeros((NP, NP), dtype=np.int64)
        for cp in comps:
            o0 = off[cp[:2]]; n_c = len(Bbasis[cp[2]]); nv = V[cp[3]].N
            L[o0:o0 + n_c * nv, o0:o0 + n_c * nv] = K(left_mult(arrow, cp[2]), np.eye(nv, dtype=np.int64))
        return L % p
    ok_lin = all(np.all(mm(Lmat(x), D) == mm(D, Lmat(x))) for x in A01 + A12)
    # e_l P: rows/cols whose c-basis element ends at vertex l
    sel = {l: [] for l in range(3)}
    for cp in comps:
        o0 = off[cp[:2]]; nv = V[cp[3]].N
        for ci, c in enumerate(Bbasis[cp[2]]):
            for t in range(nv): sel[end[c]].append(o0 + ci * nv + t)
    res = {}
    for l in range(3):
        idx = sel[l]; Dl = D[np.ix_(idx, idx)]
        # iota_l : V_l -> e_l P
        iota = np.zeros((len(idx), V[l].N), dtype=np.int64)
        o0 = off[('v', l)]; nv = V[l].N
        for t in range(nv): iota[idx.index(o0 + 0 * nv + t), t] = 1  # c = e_l is first basis element
        assert np.all(mm(Dl, iota) == mm(iota, V[l].D))
        # cone of iota: (x in V_l[1]) (+) e_lP, d(x,y) = (-dx, iota x + dy); acyclic iff quasi-iso
        n1 = V[l].N; Cn = n1 + len(idx); Dc = np.zeros((Cn, Cn), dtype=np.int64)
        Dc[:n1, :n1] = -V[l].D; Dc[n1:, :n1] = iota; Dc[n1:, n1:] = Dl
        Dc %= p
        res[l] = (rank(Dc) * 2 == Cn)
    # homotopy check for arrows
    ok_h = True
    for (x, i, j) in arrows:
        idx_i, idx_j = sel[i], sel[j]
        iota_i = np.zeros((NP, V[i].N), dtype=np.int64); iota_j = np.zeros((NP, V[j].N), dtype=np.int64)
        for t in range(V[i].N): iota_i[off[('v', i)] + t, t] = 1
        for t in range(V[j].N): iota_j[off[('v', j)] + t, t] = 1
        H = np.zeros((NP, V[i].N), dtype=np.int64)
        for t in range(V[i].N): H[off[('a', x)] + t, t] = 1   # [e_j | v]_a, e_j first basis elt of Be_j
        lhs = (mm(D, H) + mm(H, V[i].D)) % p
        rhs = (mm(Lmat(x), iota_i) - mm(iota_j, f[x])) % p
        ok_h &= bool(np.all(lhs == rhs))
    print(label, 'deg ok', ok_deg, '| d^2=0', ok_d2, '| left B-linear', ok_lin,
          '| iota_l quasi-iso', res, '| arrow homotopies', ok_h, '| dim P', NP)

def frho(f, r):
    out = None
    for (y, x) in Q2:
        term = J2[r, Q2.index((y, x))] * mm(f[y], f[x])
        out = term if out is None else (out + term)
    return out % p

# regime 1: V0 contractible
for trial in range(3):
    V0, S0 = contractible({0: 1, 1: 2})
    V1 = random_complex({-1: 2, 0: 3, 1: 2})
    V2 = random_complex({-1: 1, 0: 3, 1: 3, 2: 1})
    V = [V0, V1, V2]
    f = {x: random_chain_map(V0, V1) for x in A01}
    f.update({y: random_chain_map(V1, V2) for y in A12})
    h = [mm(frho(f, r), S0) for r in range(len(J2))]
    for r in range(len(J2)):
        assert np.all((mm(V2.D, h[r]) + mm(h[r], V0.D)) % p == frho(f, r))
    run(V, f, h, 'regime1 trial %d:' % trial)

# regime 2: V2 contractible
for trial in range(3):
    V0 = random_complex({-1: 2, 0: 2, 1: 1})
    V1 = random_complex({-1: 2, 0: 3, 1: 2})
    V2, S2 = contractible({0: 2, 1: 1, -1: 1})
    V = [V0, V1, V2]
    f = {x: random_chain_map(V0, V1) for x in A01}
    f.update({y: random_chain_map(V1, V2) for y in A12})
    h = [mm(S2, frho(f, r)) for r in range(len(J2))]
    for r in range(len(J2)):
        assert np.all((mm(V2.D, h[r]) + mm(h[r], V0.D)) % p == frho(f, r))
    nontriv = any(np.any(f[x]) for x in f)
    run(V, f, h, 'regime2 trial %d (f nonzero: %s):' % (trial, nontriv))
