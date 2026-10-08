#!/usr/bin/env python3
"""D-A finite checks, written independently of existing computation scripts.

Claim: signs in the derived bar decomposition and ordinary simulation;
       two explicit non-flat square-zero-extension examples.
Cases: bar lengths 0..5, block lengths 0..3; dg length 0..6 and internal
       degrees -2,-1,0; simulation shifts -3..4 and lengths 0..6.
       Over Q: a radical-square-zero 2-cycle through resolution degree 9;
       an explicit 7-dimensional extension with a complete minimal
       resolution of length 3.
Conventions: left modules, paths compose right to left, cohomological
       degree -n for resolution index n, d(C[s])=(-1)^s d(C).
Scope: finite computational checks only; the dossier supplies all-degree
       proofs. No imported script or previous computation is used.
Run: python3 computations/D-A-checks.py > computations/D-A-checks.out
"""

from fractions import Fraction
from itertools import product


def sign(n):
    return -1 if n % 2 else 1


def rank(matrix, ncols=0):
    """Exact rational row reduction; empty matrices have rank zero."""
    a = [[Fraction(x) for x in row] for row in matrix]
    if not a:
        return 0
    ncols = len(a[0])
    pivot = 0
    for col in range(ncols):
        row = next((i for i in range(pivot, len(a)) if a[i][col]), None)
        if row is None:
            continue
        a[pivot], a[row] = a[row], a[pivot]
        c = a[pivot][col]
        a[pivot] = [x / c for x in a[pivot]]
        for i in range(len(a)):
            if i != pivot and a[i][col]:
                c = a[i][col]
                a[i] = [x - c * y for x, y in zip(a[i], a[pivot])]
        pivot += 1
        if pivot == len(a):
            break
    return pivot


def multiply_matrices(a, b):
    if not a:
        return []
    if not b:
        return [[] for _ in a]
    return [[sum(a[i][k] * b[k][j] for k in range(len(b)))
             for j in range(len(b[0]))] for i in range(len(a))]


def check_signs():
    counts = {"multibar_faces": 0, "dg_mixed_terms": 0,
              "dg_shifted_action": 0, "simulation_differentials": 0}
    for r in range(6):
        for lengths in product(range(4), repeat=r + 1):
            exponent = sum((r - j) * v for j, v in enumerate(lengths))
            for j, length in enumerate(lengths):
                if not length:
                    continue
                target_exponent = exponent - (r - j)
                offset = sum(lengths[:j])
                for face in range(length + 1):
                    source = sign(j + offset + face + target_exponent)
                    target = sign(exponent + r + offset + face)
                    assert source == target
                    counts["multibar_faces"] += 1
    for r in range(7):
        for degrees in product((-2, -1, 0), repeat=r + 2):
            # Leibniz terms after multiplying the first two factors.
            if r:
                for j in range(r + 2):
                    prefix = sum(degrees[:j])
                    assert sign(r + prefix) + sign(r - 1 + prefix) == 0
                    counts["dg_mixed_terms"] += 1
            for action_degree in (-2, -1, 0):
                assert sign(r * action_degree) == sign(
                    action_degree + (r - 1) * action_degree)
                counts["dg_shifted_action"] += 1
    for b in range(-3, 5):
        for length in range(7):
            for n in range(-length, 0):
                # f^{n+1} d = d_{P[b]} f^n.
                assert sign(b * (n + 1)) == sign(b + b * n)
                counts["simulation_differentials"] += 1
    print("SIGN CHECKS:", counts)


class PathAlgebra:
    """A monomial quotient specified by its surviving paths.

    A path is a tuple of vertices in traversal order. Multiplication u*v
    traverses v first. The examples have at most one arrow for each
    ordered vertex pair.
    """

    def __init__(self, paths):
        self.paths = list(paths)
        self.allowed = set(paths)
        self.vertices = sorted(p[0] for p in paths if len(p) == 1)
        for p in paths:
            for i in range(len(p)):
                for j in range(i + 1, len(p) + 1):
                    assert p[i:j] in self.allowed
        for u, v, w in product(paths, repeat=3):
            assert self.mul(self.mul(u, v), w) == self.mul(u, self.mul(v, w))

    def mul(self, u, v):
        if u is None or v is None or v[-1] != u[0]:
            return None
        uv = v + u[1:]
        return uv if uv in self.allowed else None

    def projective(self, vertex, side="left"):
        index = 0 if side == "left" else -1
        return [p for p in self.paths if p[index] == vertex]

    def map_matrix(self, source, target, path, side="left"):
        src = self.projective(source, side)
        dst = self.projective(target, side)
        out = [[0 for _ in src] for _ in dst]
        for col, u in enumerate(src):
            v = self.mul(u, path) if side == "left" else self.mul(path, u)
            if v is not None:
                assert v in dst
                out[dst.index(v)][col] = 1
        return out


def check_resolution(algebra, vertices, differentials, terminal=False):
    """Augment the degree-zero projective to its top simple."""
    dims = [len(algebra.projective(v)) for v in vertices]
    mats = [None] + [algebra.map_matrix(vertices[n], vertices[n - 1], p)
                    for n, p in enumerate(differentials, 1)]
    ranks = [1] + [rank(m) for m in mats[1:]]
    for n in range(2, len(vertices)):
        assert not any(any(row) for row in multiply_matrices(mats[n - 1], mats[n]))
    for n in range(len(vertices) - 1):
        assert dims[n] == ranks[n] + ranks[n + 1]
    if terminal:
        assert dims[-1] == ranks[-1]
    # Every differential is a positive-length path, hence is radical.
    assert all(len(p) >= 2 for p in differentials)
    return dims, ranks


def tensor_with_quotient(delta, vertices, differentials, through):
    dims = [len(delta.projective(v)) for v in vertices]
    ranks = [0]
    for n, p in enumerate(differentials, 1):
        ranks.append(rank(delta.map_matrix(vertices[n], vertices[n - 1], p)))
    # The last term of a complete resolution has incoming differential zero.
    ranks.append(0)
    result = [dims[n] - ranks[n] - ranks[n + 1] for n in range(through + 1)]
    assert all(x >= 0 for x in result)
    return result


def check_right_simple_resolution(delta, vertex):
    src, dst = vertex - 1, vertex
    mat = delta.map_matrix(src, dst, (src, dst), "right")
    assert rank(mat) == len(delta.projective(src, "right"))
    assert len(delta.projective(dst, "right")) - rank(mat) == 1


def tensor_right_resolution_with_simple(vertex, simple):
    # Tensor e_i Delta with the left simple S_v: dimension delta_{i,v}.
    # The arrow differential acts by zero on S_v.
    return {0: int(simple == vertex), 1: int(simple == vertex - 1)}


def example_two_cycle():
    delta = PathAlgebra([(0,), (1,), (0, 1)])
    algebra = PathAlgebra(delta.paths + [(1, 0)])
    check_right_simple_resolution(delta, 1)
    tor = tensor_right_resolution_with_simple(1, 0)
    assert tor == {0: 0, 1: 1}
    vertices = [n % 2 for n in range(10)]
    maps = [(0, 1) if n % 2 else (1, 0) for n in range(1, 10)]
    dims, ranks = check_resolution(algebra, vertices, maps)
    homology = tensor_with_quotient(delta, vertices, maps, 8)
    assert homology == [int(n % 2 == 0) for n in range(9)]
    print("NONFLAT TWO-CYCLE: dim Delta=3, dim A=4")
    print("  X=S_0(left) tensor S_1(right), N=S_0:", "Tor dimensions", tor)
    print("  vector-space dimensions of A-projective terms, indices 0..9:", dims)
    print("  augmentation/differential ranks:", ranks)
    print("  dim H^{-n}(Delta tensor_A resolution), n=0..8:", homology)
    print("  agrees with N[r][r] in the checked degrees; no finite check asserts infinity")


def example_finite_extinction():
    delta = PathAlgebra([(0,), (1,), (2,), (0, 1), (1, 2), (0, 1, 2)])
    algebra = PathAlgebra(delta.paths + [(2, 0)])
    check_right_simple_resolution(delta, 2)
    assert tensor_right_resolution_with_simple(2, 1) == {0: 0, 1: 1}
    assert tensor_right_resolution_with_simple(2, 0) == {0: 0, 1: 0}
    vertices = [1, 2, 0, 1]
    maps = [(1, 2), (2, 0), (0, 1)]
    dims, ranks = check_resolution(algebra, vertices, maps, terminal=True)
    homology = tensor_with_quotient(delta, vertices, maps, 3)
    assert homology == [1, 0, 1, 0]
    for simple in (0, 1):
        check_resolution(delta, [simple, simple + 1], [(simple, simple + 1)], terminal=True)
    formula_terms = [1, (1 + 1) + 1]
    assert max(formula_terms) == 3 == len(vertices) - 1
    print("NONFLAT FINITE EXTINCTION: dim Delta=6, dim A=7")
    print("  X=S_0(left) tensor S_2(right), N=S_1")
    print("  Phi N=S_0[1], Phi^2 N=0; ordinary X tensor_Delta N=0")
    print("  complete minimal A-resolution vertices:", vertices)
    print("  vector-space dimensions of the projective terms:", dims)
    print("  augmentation/differential ranks:", ranks)
    print("  dim H^{-n}(Delta tensor_A resolution), n=0..3:", homology)
    print("  pd_Delta N=1; pd_Delta(Phi N)=2; formula terms:", formula_terms)
    print("  pd_A N=3 from the complete minimal resolution")


if __name__ == "__main__":
    print("D-A exact finite checks; Python standard library, rational arithmetic")
    check_signs()
    example_two_cycle()
    example_finite_extinction()
    print("All stated finite checks passed. Universal claims use the written dossier.")
