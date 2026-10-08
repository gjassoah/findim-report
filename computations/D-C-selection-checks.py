#!/usr/bin/env python3
"""Exact checks for dossier D-C (2026-10-08).

Claim: the nine integral-preimage rows and twelve kernel bases have their
stated weights; the selection-group relations hold in the specified matrices.
Cases: weight identities symbolically over Z for every allowed index choice;
matrix checks for m=1,...,10, every parameter residue, every allowed index;
central independence for all 2**m subsets; signs/extinction for m=1,...,10.
Conventions: [a,b]=aba^-1 b^-1; matrix indices 0,...,4 in code (add one
for the dossier); S_m=F_2[t]/(t**m-1); a polynomial is an integer bit mask.
Written from the group definition before reading the earlier computation.
This finite computation does not replace the all-m proof in the dossier.
Run: python3 computations/D-C-selection-checks.py
Save stdout to computations/D-C-selection-checks.out.
"""

from collections import Counter
from functools import lru_cache
from itertools import permutations


def dot(a, b):
    return sum(x * y for x, y in zip(a, b))


def weight(kind, i, j=None):
    a = [0, 0, 0]
    a[i] = -1 if kind == "U" else 1
    if kind == "W":
        a[j] = -1
    return tuple(a)


def determinant(columns):
    a, b, c = columns
    return (
        a[0] * (b[1] * c[2] - b[2] * c[1])
        - b[0] * (a[1] * c[2] - a[2] * c[1])
        + c[0] * (a[1] * b[2] - a[2] * b[1])
    )


def unit(i):
    return tuple(int(h == i) for h in range(3))


def check_lattices():
    kernels = 0
    for kind in ("U", "V", "W"):
        for i in range(3):
            for j in (range(3) if kind == "W" else (None,)):
                if j == i:
                    continue
                lam = weight(kind, i, j)
                q = tuple((-1 if kind == "U" else 1) * x for x in unit(i))
                if kind == "W":
                    k = next(h for h in range(3) if h not in (i, j))
                    basis = [
                        tuple(x + y for x, y in zip(unit(i), unit(j))),
                        unit(k),
                    ]
                else:
                    basis = [unit(h) for h in range(3) if h != i]
                assert dot(lam, q) == 1
                assert all(dot(lam, b) == 0 for b in basis)
                assert abs(determinant([q, *basis])) == 1
                kernels += 1
    assert kernels == 12
    print("Kernel bases: 12/12; weight(q)=1, weight(b)=0, determinant=+/-1.")

    counts = Counter()
    # Each coordinate below is its (r coefficient, s coefficient).
    for i, j, k in permutations(range(3)):
        source_rows = [
            ("U_i,U_j", ("U", i, None), ("U", j, None),
             {i: (-1, 0), j: (0, -1)}, None),
            ("V_i,V_j", ("V", i, None), ("V", j, None),
             {i: (1, 0), j: (0, 1)}, None),
            ("U_i,V_j", ("U", i, None), ("V", j, None),
             {i: (-1, 0), j: (0, 1)}, None),
            ("W_ij,U_j", ("W", i, j), ("U", j, None),
             {i: (1, -1), j: (0, -1)}, None),
            ("W_ij,U_k", ("W", i, j), ("U", k, None),
             {i: (1, 0), j: (0, 0), k: (0, -1)}, None),
            ("W_ij,V_i", ("W", i, j), ("V", i, None),
             {i: (0, 1), j: (-1, 1)}, None),
            ("W_ij,V_k", ("W", i, j), ("V", k, None),
             {i: (1, 0), j: (0, 0), k: (0, 1)}, None),
            ("U_i,W_ij", ("U", i, None), ("W", i, j),
             {i: (-1, 0), j: (-1, -1)}, ("U", j, None)),
            ("W_ij,V_j", ("W", i, j), ("V", j, None),
             {i: (1, 1), j: (0, 1)}, ("V", i, None)),
        ]
        for name, left, right, coords, output in source_rows:
            columns = [tuple(coords.get(h, (0, 0))[c] for h in range(3))
                       for c in range(2)]
            evaluate = lambda typ: tuple(dot(weight(*typ), col) for col in columns)
            assert evaluate(left) == (1, 0), (name, i, j, k)
            assert evaluate(right) == (0, 1), (name, i, j, k)
            if output is not None:
                assert evaluate(output) == (1, 1)
            counts[name] += 1
    for name, count in counts.items():
        print(f"Integral preimage {name}: {count}/6 index choices; "
              "symbolic target (r,s) attained.")
    print("Both noncommuting rows: output weight is r+s in all 12 choices.")


def check_m(m):
    counts = Counter()
    mask = (1 << m) - 1

    @lru_cache(None)
    def ring_mul(a, b):
        out = 0
        while b:
            if b & 1:
                out ^= a
            b >>= 1
            a = ((a << 1) & mask) ^ (a >> (m - 1))
        return out

    def tpower(r):
        return 1 << (r % m)

    identity = {(i, i): 1 for i in range(5)}

    def multiply(a, b):
        out = {}
        for (i, j), x in a.items():
            for (h, k), y in b.items():
                if j == h:
                    out[i, k] = out.get((i, k), 0) ^ ring_mul(x, y)
        return {ij: x for ij, x in out.items() if x}

    def product(*args):
        out = identity
        for a in args:
            out = multiply(out, a)
        return out

    def elementary(i, j, coefficient):
        out = dict(identity)
        if coefficient:
            out[i, j] = coefficient
        return out

    def image(kind, i, r, j=None):
        positions = {"U": (0, i + 1), "V": (i + 1, 4),
                     "W": (i + 1, None if j is None else j + 1)}
        a, b = positions[kind]
        return elementary(a, b, tpower(r))

    def diagonal(i, r):
        out = dict(identity)
        out[i + 1, i + 1] = tpower(r)
        return out

    def check(name, a, b):
        assert a == b, (m, name, a, b)
        counts[name] += 1

    def commute(a, b):
        return product(a, b, a, b)  # elementary generators are involutions

    types = [("U", i, None) for i in range(3)]
    types += [("V", i, None) for i in range(3)]
    types += [("W", i, j) for i, j in permutations(range(3), 2)]
    for i, j in permutations(range(3), 2):
        check("torus", product(diagonal(i, 1), diagonal(j, 1)),
              product(diagonal(j, 1), diagonal(i, 1)))
    for kind, i, j in types:
        for r in range(m):
            a = image(kind, i, r, j)
            check("inverses", product(a, a), identity)
            if kind == "U":
                check("U-squares", product(a, a), identity)
            for h in range(3):
                check("conjugation",
                      product(diagonal(h, 1), a, diagonal(h, -1)),
                      image(kind, i, r + weight(kind, i, j)[h], j))
            check("negative-parameters", image(kind, i, r - 2*m, j), a)

    for i, j in permutations(range(3), 2):
        for r in range(m):
            for s in range(m):
                for left, right in (("U", "U"), ("V", "V"), ("U", "V")):
                    check(f"commute-{left}{right}",
                          commute(image(left, i, r), image(right, j, s)),
                          identity)
                w = image("W", i, s, j)
                for h in range(3):
                    if h != i:
                        check("commute-WU", commute(w, image("U", h, r)), identity)
                    if h != j:
                        check("commute-WV", commute(w, image("V", h, r)), identity)
                check("transfer-U", commute(image("U", i, r), w),
                      image("U", j, r+s))
                check("transfer-V", commute(w, image("V", j, r)),
                      image("V", i, r+s))
    for i in range(3):
        for r in range(m):
            for s in range(m):
                check("z-images", commute(image("U", i, r), image("V", i, s)),
                      elementary(0, 4, tpower(r+s)))

    zs = [elementary(0, 4, tpower(r)) for r in range(m)]
    for z in zs:
        for kind, i, j in types:
            for r in range(m):
                a = image(kind, i, r, j)
                check("z-central-root", product(z, a), product(a, z))
        for h in range(3):
            check("z-central-torus", product(z, diagonal(h, 1)),
                  product(diagonal(h, 1), z))
    seen = set()
    for subset in range(1 << m):
        actual = product(*(zs[q] for q in range(m) if (subset >> q) & 1))
        check("z-subsets", actual, elementary(0, 4, subset))
        seen.add(tuple(sorted(actual.items())))
    assert len(seen) == 1 << m

    signs = [1] * (m - 1) + [-1]
    selected = 1
    surviving = []
    for j in range(m + 1):
        surviving.append(bool(selected))
        if j < m:
            selected *= (1 + signs[j]) // 2
    assert surviving == [True] * m + [False]
    print(f"m={m:2}: {sum(counts.values())} exact matrix equalities; "
          f"{len(seen)} distinct central subset products; first zero iterate={m}.")
    print("       " + ", ".join(f"{key}={counts[key]}" for key in sorted(counts)))


if __name__ == "__main__":
    check_lattices()
    for m in range(1, 11):
        check_m(m)
    print("All listed finite checks passed. No all-m conclusion is inferred from them.")
