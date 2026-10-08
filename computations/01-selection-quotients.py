#!/usr/bin/env python3
# Claim tested: build/sections/02-selection-process.tex, Lemma "finite-central-quotients" and
# the group G of Section 2.1.  The assignment T_l -> diag(t at position l), U_i(r) -> I + t^r E_{0i},
# V_i(r) -> I + t^r E_{i4}, W_ij(r) -> I + t^r E_{ij} (indices 0..4, l,i,j in {1,2,3}) defines a
# homomorphism G -> GL_5(S_m), S_m = F_2[t]/(t^m - 1); the images of z_N = [U_i(a),V_i(b)], a+b=N,
# equal I + t^N E_{04}, are independent of (i,a,b), are central in the image, and z_0..z_{m-1}
# generate (Z/2)^m.  Also tested: the centralizer relations in the proof of Lemma
# "group-finite-presentation" and the integral-preimage table there (weight check).
# Cases: m = 1..6; all integer arguments r,s,q in [-2m, 2m] (triples for the transfer identity
# and for z_N independence use a,b in the same range, N = a+b).
# Conventions: commutator [x,y] = x y x^-1 y^-1 (the paper's; the opposite x^-1 y^-1 x y also
# tested and reported as "alt"); matrices indexed 0..4, E_ab the matrix unit, product is ordinary
# matrix multiplication over S_m (phi(xy)=phi(x)phi(y)); conjugation rule T S T^-1 = S(r+lambda_l)
# read as stated; the reverse reading T^-1 S T is also tested ("alt").  S_m elements are ints
# (bitmasks, bit k = coefficient of t^k) reduced mod t^m - 1, over F_2, exact.
# Written by a Claude Sonnet subagent on 2026-10-07.
import itertools, sys

I3 = (1, 2, 3)
class Ring:
    def __init__(s, m): s.m = m; s.mask = (1 << m) - 1
    def mul(s, a, b):
        r = 0
        for k in range(s.m):
            if (a >> k) & 1:
                sh = (b << k)
                # reduce mod t^m - 1: fold high bits
                while sh >> s.m:
                    sh = (sh & s.mask) ^ (sh >> s.m)
                r ^= sh
        return r
    def t(s, r): return 1 << (r % s.m)

def run(m):
    R = Ring(m); n = 5
    def zero(): return tuple(tuple(0 for _ in range(n)) for _ in range(n))
    def ident(): return tuple(tuple(1 if i == j else 0 for j in range(n)) for i in range(n))
    def mm(A, B):
        return tuple(tuple(_dot(A, B, i, j) for j in range(n)) for i in range(n))
    def _dot(A, B, i, j):
        x = 0
        for k in range(n): x ^= R.mul(A[i][k], B[k][j])
        return x
    def elem(a, b, r):
        M = [list(row) for row in ident()]; M[a][b] ^= R.t(r); return tuple(tuple(x) for x in M)
    def T(l):
        M = [list(row) for row in ident()]; M[l][l] = R.t(1); return tuple(tuple(x) for x in M)
    def Tinv(l):
        M = [list(row) for row in ident()]; M[l][l] = R.t(-1); return tuple(tuple(x) for x in M)
    U = lambda i, r: elem(0, i, r)
    V = lambda i, r: elem(i, 4, r)
    W = lambda i, j, r: elem(i, j, r)
    def inv(A):  # all generators are involutions in char 2 (checked), diag inverse separate
        return None
    def comm(x, y, xi, yi): return mm(mm(x, y), mm(xi, yi))      # x y x^-1 y^-1
    def comm_alt(x, y, xi, yi): return mm(mm(xi, yi), mm(x, y))  # x^-1 y^-1 x y
    # elementary matrices are their own inverses (checked below)
    rng = range(-2 * m, 2 * m + 1)
    res = {}
    fails = {}
    def rec(name, ok, info=None):
        res.setdefault(name, [0, 0]); res[name][0 if ok else 1] += 1
        if not ok:
            fails.setdefault(name, [])
            if len(fails[name]) < 5: fails[name].append(info)
    Id = ident()
    # generators list (with inverses) for centrality
    gens = []
    for r in rng:
        for i in I3:
            gens.append(("U", i, r, U(i, r))); gens.append(("V", i, r, V(i, r)))
            for j in I3:
                if i != j: gens.append(("W", i, j, r, W(i, j, r)))
    for g in gens:
        M = g[-1]; rec("self-inverse", mm(M, M) == Id, g[:-1])
    lam = {}
    for i in I3:
        for l in I3:
            lam[("U", i, l)] = -1 if i == l else 0
            lam[("V", i, l)] = 1 if i == l else 0
    for i in I3:
        for j in I3:
            if i != j:
                for l in I3: lam[("W", i, j, l)] = (1 if l == i else 0) - (1 if l == j else 0)
    # conjugation rules
    for l in I3:
        for g in gens:
            key = g[:-3] if g[0] != "W" else g[:3]
            if g[0] == "W": _, i, j, r, M = g; lv = lam[("W", i, j, l)]; tgt = lambda rr: W(i, j, rr)
            elif g[0] == "U": _, i, r, M = g; lv = lam[("U", i, l)]; tgt = lambda rr, i=i: U(i, rr)
            else: _, i, r, M = g; lv = lam[("V", i, l)]; tgt = lambda rr, i=i: V(i, rr)
            c1 = mm(mm(T(l), M), Tinv(l)); c2 = mm(mm(Tinv(l), M), T(l))
            rec("conj T S T^-1 = S(r+lam)", c1 == tgt(r + lv), (g[:-1], l))
            rec("conj alt T^-1 S T = S(r+lam)", c2 == tgt(r + lv), (g[:-1], l))
    # T commute
    for a in I3:
        for b in I3: rec("T_l commute", mm(T(a), T(b)) == mm(T(b), T(a)))
    # commutation relations
    def com(x, y): return mm(x, y) == mm(y, x)
    for i in I3:
        for j in I3:
            if i == j: continue
            for r in rng:
                for s in rng:
                    rec("[U_i,U_j]=1 (i!=j)", com(U(i, r), U(j, s)), (i, j, r, s))
                    rec("[V_i,V_j]=1 (i!=j)", com(V(i, r), V(j, s)), (i, j, r, s))
                    rec("[U_i,V_j]=1 (i!=j)", com(U(i, r), V(j, s)), (i, j, r, s))
                    for h in I3:
                        if h != i: rec("[W_ij,U_h]=1 (h!=i)", com(W(i, j, s), U(h, r)), (i, j, h, r, s))
                        if h != j: rec("[W_ij,V_h]=1 (h!=j)", com(W(i, j, s), V(h, r)), (i, j, h, r, s))
                    x, y = U(i, r), W(i, j, s)
                    rec("[U_i(r),W_ij(s)]=U_j(r+s)", comm(x, y, x, y) == U(j, r + s), (i, j, r, s))
                    rec("alt-comm [U_i(r),W_ij(s)]=U_j(r+s)", comm_alt(x, y, x, y) == U(j, r + s), (i, j, r, s))
                    x, y = W(i, j, s), V(j, r)
                    rec("[W_ij(s),V_j(r)]=V_i(s+r)", comm(x, y, x, y) == V(i, s + r), (i, j, r, s))
                    rec("alt-comm [W_ij(s),V_j(r)]=V_i(s+r)", comm_alt(x, y, x, y) == V(i, s + r), (i, j, r, s))
    # opposite-order reading (anti-homomorphism): relation holds in the opposite ring iff
    # the commutator [x,y]_opp = y^-1.. ; test: product reversed matrices give same relations?
    def comm_opp(x, y): return mm(mm(mm(y, x), y), x)  # opposite composition: y^-1 x^-1 y x, factors are involutions
    for i in I3:
        for j in I3:
            if i == j: continue
            for r in rng:
                for s in rng:
                    rec("opp-composition [U_i(r),W_ij(s)]=U_j(r+s)", comm_opp(U(i, r), W(i, j, s)) == U(j, r + s), (i, j, r, s))
                    rec("opp-composition [W_ij(s),V_j(r)]=V_i(s+r)", comm_opp(W(i, j, s), V(j, r)) == V(i, s + r), (i, j, r, s))
    # z_N
    E04 = lambda N: elem(0, 4, N)
    for a in rng:
        for b in rng:
            N = a + b
            for i in I3:
                z = comm(U(i, a), V(i, b), U(i, a), V(i, b))
                rec("z_N = I + t^N E04 (all i,a,b)", z == E04(N), (i, a, b))
    # independence of (i,a,b): compare any two triples with equal N
    byN = {}
    for a in rng:
        for b in rng:
            for i in I3: byN.setdefault(a + b, []).append((i, a, b))
    for N, L in byN.items():
        vals = {comm(U(i, a), V(i, b), U(i, a), V(i, b)) for (i, a, b) in L}
        rec("z_N independent of (i,a,b)", len(vals) == 1, N)
        rec("z_N^2 = 1", all(mm(v, v) == Id for v in vals), N)
    # transfer identity (eq. commutator-transfer): [U_i(r),V_i(q+s)] = [U_j(r+q),V_j(s)]
    for i in I3:
        for j in I3:
            if i != j:
                for r in rng:
                    for q in rng:
                        for s in rng:
                            l_ = comm(U(i, r), V(i, q + s), U(i, r), V(i, q + s))
                            r_ = comm(U(j, r + q), V(j, s), U(j, r + q), V(j, s))
                            rec("transfer [U_i(r),V_i(q+s)]=[U_j(r+q),V_j(s)]", l_ == r_, (i, j, r, q, s))
    # centrality of z_N against all generators incl. T_l
    for N in range(-2 * m, 2 * m + 1):
        z = E04(N)
        for g in gens: rec("z_N central vs U,V,W gens", com(z, g[-1]), (N, g[:-1]))
        for l in I3: rec("z_N central vs T_l", com(z, T(l)), (N, l))
    # independence: 2^m products pairwise distinct
    prods = {}
    for c in itertools.product((0, 1), repeat=m):
        M = Id
        for q, cq in enumerate(c):
            if cq: M = mm(M, E04(q))
        prods.setdefault(M, []).append(c)
    rec("z_0..z_{m-1}: 2^m products pairwise distinct", len(prods) == 2 ** m, len(prods))
    # periodicity z_{N+m} = z_N
    rec("z_{N+m}=z_N (period m)", all(E04(N) == E04(N + m) for N in rng))
    # finite presentation centralizer relations
    for h in I3:
        for i in I3:
            if h != i:
                rec("u_i,v_i commute with T_h (h!=i)", com(U(i, 0), T(h)) and com(V(i, 0), T(h)), (i, h))
    for i in I3:
        for j in I3:
            if i != j:
                w = W(i, j, 0); h = [x for x in I3 if x not in (i, j)][0]
                rec("w_ij commutes with T_i T_j", com(w, mm(T(i), T(j))), (i, j))
                rec("w_ij commutes with T_h (h not in {i,j})", com(w, T(h)), (i, j, h))
                rec("w_ij does NOT commute with T_i (sanity, m>1)", (not com(w, T(i))) or m == 1, (i, j))
    # definition (eq. group-finite-generators): S(r) = T^n S(0) T^-n
    for i in I3:
        for r in rng:
            Ti = lambda k, i=i: T(i) if k >= 0 else Tinv(i)
            def pw(l, k):
                M = Id
                for _ in range(abs(k)): M = mm(M, T(l) if k >= 0 else Tinv(l))
                return M
            rec("U_i(r)=T_i^-r u_i T_i^r", mm(mm(pw(i, -r), U(i, 0)), pw(i, r)) == U(i, r), (i, r))
            rec("V_i(r)=T_i^r v_i T_i^-r", mm(mm(pw(i, r), V(i, 0)), pw(i, -r)) == V(i, r), (i, r))
            for j in I3:
                if i != j: rec("W_ij(r)=T_i^r w_ij T_i^-r", mm(mm(pw(i, r), W(i, j, 0)), pw(i, -r)) == W(i, j, r), (i, j, r))
    return res, fails

def table_check():
    # weights check for the integral-preimage table in the proof of group-finite-presentation
    def lam(S, n):
        t = S[0]
        if t == "U": return -n[S[1]]
        if t == "V": return n[S[1]]
        return n[S[1]] - n[S[2]]
    ok = True; cnt = 0
    for r in range(-4, 5):
        for s in range(-4, 5):
            for i in I3:
                for j in I3:
                    if i == j: continue
                    h = [x for x in I3 if x not in (i, j)][0]
                    rows = []
                    rows.append((("U", i), ("U", j), {i: -r, j: -s}))
                    rows.append((("V", i), ("V", j), {i: r, j: s}))
                    rows.append((("U", i), ("V", j), {i: -r, j: s}))
                    rows.append((("W", i, j), ("U", j), {j: -s, i: r - s}))
                    rows.append((("W", i, j), ("U", h), {i: r, j: 0, h: -s}))
                    rows.append((("W", i, j), ("V", i), {i: s, j: s - r}))
                    rows.append((("W", i, j), ("V", h), {i: r, j: 0, h: s}))
                    rows.append((("U", i), ("W", i, j), {i: -r, j: -r - s}))
                    rows.append((("W", i, j), ("V", j), {j: s, i: r + s}))
                    for X, Y, nn in rows:
                        n = {1: 0, 2: 0, 3: 0}; n.update(nn)
                        cnt += 1
                        if lam(X, n) != r or lam(Y, n) != s:
                            ok = False; print("TABLE FAIL", X, Y, r, s, n)
    return ok, cnt

if __name__ == "__main__":
    allok = True
    for m in range(1, 7):
        res, fails = run(m)
        print(f"=== m = {m} (arguments in [{-2*m},{2*m}]) ===")
        for k, (p, f) in sorted(res.items()):
            tag = "alt " in k or k.startswith("alt") or k.startswith("opp")
            status = "PASS" if f == 0 else ("FAIL" + (" (alternative reading, informational)" if tag else ""))
            if f and not tag and "sanity" not in k: allok = False
            print(f"  {status:8s} {k}: {p} pass, {f} fail")
            for x in fails.get(k, []): print("      e.g.", x)
    ok, cnt = table_check()
    print(f"=== preimage table weight check: {'PASS' if ok else 'FAIL'} ({cnt} instances) ===")
    print("OVERALL (main readings):", "ALL PASS" if allok and ok else "SOME FAILURE")
