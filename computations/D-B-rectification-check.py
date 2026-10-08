#!/usr/bin/env python3
"""Claim tested: the rectification differential and arrow homotopies have the stated signs.

Case: k=Q, B=k(0 --a--> 1 --b--> 2)/(ba). Every D_i is the right-free
complex (B plus B -> B) in degrees 0,1 with differential (1,0).
Set f_a=identity, f_b=projection onto the contractible summand, and h_ba
equal to its contraction. Thus f_b f_a is nonzero but null-homotopic.
Conventions: left path action, right-to-left products, cohomological shifts.
Matrices below suppress a final tensor factor B on which all maps are identity.
Scope: this one exact rational example, not a proof for arbitrary input data.
"""

import sympy as S

paths = {"e0": (0, 0), "e1": (1, 1), "e2": (2, 2), "a": (0, 1), "b": (1, 2)}
arrows = {"a": (0, 1), "b": (1, 2)}
dims = {0: 2, 1: 1}


def mul(left, right):
    if paths[right][1] != paths[left][0]:
        return None
    if left.startswith("e"):
        return right
    if right.startswith("e"):
        return left
    return None  # ba=0


def coeff_d(degree):
    return S.Matrix([[1, 0]]) if degree == 0 else S.zeros(dims.get(degree + 1, 0), dims.get(degree, 0))


def coeff_f(arrow, degree):
    size = dims.get(degree, 0)
    return S.diag(1, 0) if arrow == "b" and degree == 0 else S.eye(size)


def basis(n):
    out = []
    for col in range(3):
        for index in (range(3) if col == 0 else arrows if col == 1 else ["ba"]):
            start = index if col == 0 else arrows[index][1] if col == 1 else 2
            for path, (source, _) in paths.items():
                if source == start:
                    out.extend((col, index, path, v) for v in range(dims.get(n + col, 0)))
    return out


bases = {n: basis(n) for n in range(-3, 3)}


def differential(n, include_h=True):
    target = {x: i for i, x in enumerate(bases[n + 1])}
    out = S.zeros(len(target), len(bases[n]))

    def add(j, key, value):
        if value:
            out[target[key], j] += value

    def apply(j, col, index, path, v, matrix, factor=1):
        for w in range(matrix.rows):
            add(j, (col, index, path, w), factor * matrix[w, v])

    for j, (col, index, path, v) in enumerate(bases[n]):
        degree = n + col
        apply(j, col, index, path, v, coeff_d(degree), (-1) ** col)
        if col == 1:
            source, dest = arrows[index]
            product = mul(path, index)
            if product:
                add(j, (0, source, product, v), 1)
            apply(j, 0, dest, path, v, coeff_f(index, degree), -1)
        elif col == 2:
            add(j, (1, "a", "b", v), 1)
            apply(j, 1, "b", "e2", v, coeff_f("a", degree))
            if include_h and degree == 1:
                add(j, (0, 2, "e2", 0), 1)
    return out


diffs = {n: differential(n) for n in range(-3, 2)}
for n in range(-3, 1):
    assert diffs[n + 1] * diffs[n] == S.zeros(len(bases[n + 2]), len(bases[n]))
print("PASS: d_P^2=0 in all degrees of this example")

failures_without_h = sum(
    differential(n + 1, False) * differential(n, False) != S.zeros(len(bases[n + 2]), len(bases[n]))
    for n in range(-3, 1)
)
assert failures_without_h
print(f"SENSITIVITY: omitting h gives nonzero squares in {failures_without_h} degrees")


def inclusion(vertex, n):
    out = S.zeros(len(bases[n]), dims.get(n, 0))
    for v in range(out.cols):
        out[bases[n].index((0, vertex, f"e{vertex}", v)), v] = 1
    return out


def action(arrow, n):
    out = S.zeros(len(bases[n]))
    for j, (col, index, path, v) in enumerate(bases[n]):
        product = mul(arrow, path)
        if product:
            out[bases[n].index((col, index, product, v)), j] = 1
    return out


def homotopy(arrow, n):
    out = S.zeros(len(bases[n - 1]), dims.get(n, 0))
    for v in range(out.cols):
        out[bases[n - 1].index((1, arrow, f"e{arrows[arrow][1]}", v)), v] = 1
    return out


for arrow, (source, dest) in arrows.items():
    for n in (0, 1):
        lhs = diffs[n - 1] * homotopy(arrow, n) + homotopy(arrow, n + 1) * coeff_d(n)
        rhs = action(arrow, n) * inclusion(source, n) - inclusion(dest, n) * coeff_f(arrow, n)
        assert lhs == rhs
    print(f"PASS: d H_{arrow}+H_{arrow} d={arrow} iota-iota f_{arrow}")

for vertex in range(3):
    indices = {n: [j for j, x in enumerate(bases[n]) if paths[x[2]][1] == vertex] for n in bases}
    ranks = {n: diffs[n].extract(indices[n + 1], indices[n]).rank() for n in diffs}
    cohomology = {n: len(indices[n]) - ranks.get(n, 0) - ranks.get(n - 1, 0) for n in range(-2, 2)}
    assert cohomology == {-2: 0, -1: 0, 0: 1, 1: 0}
    # The second coordinate of D_i^0 generates its cohomology. It is not a boundary after inclusion.
    generator = inclusion(vertex, 0)[:, 1].extract(indices[0], [0])
    incoming = diffs[-1].extract(indices[0], indices[-1])
    assert incoming.row_join(generator).rank() == incoming.rank() + 1
    print(f"PASS: iota_{vertex} induces an isomorphism on cohomology; dimensions {cohomology}")

print("All arithmetic exact over Q. Reinsert the right-free B factor to multiply dimensions by 5.")
