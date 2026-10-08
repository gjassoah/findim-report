#!/usr/bin/env python3
"""Exact sign check for D-D; mathematical scope: block identities only.

Claim tested: the differential on the upper triangular endomorphisms of
Q = Cone(V) becomes (dg, dj, (Fg)V - Vj - dh) in the coordinates
[[Fg, (-1)^n h], [0, (-1)^n j]], and d_Q^2 = 0 for a chain map V.
Cases: both parities of the arbitrary integer n, with coefficients in Z
and reduced modulo 2.  The words are formal noncommutative words; no
random matrices, numerical approximation, or bounded-degree Ext test is used.
Conventions: cochain degrees, Q^i = A^i + B^{i+1},
d_Q = [[a,V],[0,-b]], where a=d_A, b=d_B, and aV=Vb.
The symbol g denotes Fg in the upper-left block.  The component h has
unshifted degree n-1.  Words are composed right to left, with indices
determined by the displayed source and target shifts.  This computation
checks signs; it does not establish complete resolutions or Ext vanishing.
Model: GPT-6; effort: unknown.  Python standard library only.
"""

from itertools import product


def add(*polys):
    out = {}
    for poly in polys:
        for word, coefficient in poly.items():
            out[word] = out.get(word, 0) + coefficient
    return {word: coefficient for word, coefficient in out.items() if coefficient}


def scale(coefficient, poly):
    return {word: coefficient * value for word, value in poly.items()
            if coefficient * value}


def mul(left, right):
    out = {}
    for (word_l, coefficient_l), (word_r, coefficient_r) in product(
            left.items(), right.items()):
        word = word_l + word_r
        out[word] = out.get(word, 0) + coefficient_l * coefficient_r
    return {word: coefficient for word, coefficient in out.items() if coefficient}


def reduce_poly(poly, modulus=None, chain_relations=False):
    """Use only a^2=b^2=0 and aV=Vb when explicitly requested."""
    out = {}
    for word, coefficient in poly.items():
        if chain_relations:
            # Rewriting aV as Vb decreases the number of a's in the word.
            while "aV" in word:
                word = word.replace("aV", "Vb")
            if "aa" in word or "bb" in word:
                continue
        out[word] = out.get(word, 0) + coefficient
    if modulus is not None:
        out = {word: coefficient % modulus for word, coefficient in out.items()}
    return {word: coefficient for word, coefficient in out.items() if coefficient}


def matrix_add(left, right, right_sign=1):
    return [[add(left[i][j], scale(right_sign, right[i][j]))
             for j in range(2)] for i in range(2)]


def matrix_mul(left, right):
    return [[add(*(mul(left[i][k], right[k][j]) for k in range(2)))
             for j in range(2)] for i in range(2)]


def matrix_is_zero(matrix, modulus=None, chain_relations=False):
    return all(not reduce_poly(entry, modulus, chain_relations)
               for row in matrix for entry in row)


def hom_differential(differential, morphism, parity):
    return matrix_add(matrix_mul(differential, morphism),
                      matrix_mul(morphism, differential),
                      -((-1) ** parity))


def main():
    a, b, v, g, j, h = ({symbol: 1} for symbol in "abVgjh")
    zero = {}
    differential = [[a, v], [zero, scale(-1, b)]]
    print("D-D exact cone-sign check")
    print("Scope: formal block signs, not complete resolutions or Ext vanishing.")
    print("Composition right to left; Q^i=A^i+B^{i+1}; d_Q=[[a,V],[0,-b]].")
    print("g denotes Fg; h has unshifted degree n-1.")
    for modulus in (None, 2):
        coefficient_ring = "Z" if modulus is None else "Z/2Z"
        for parity in (0, 1):
            sign = (-1) ** parity
            morphism = [[g, scale(sign, h)], [zero, scale(sign, j)]]
            actual = hom_differential(differential, morphism, parity)
            dg = add(mul(a, g), scale(-sign, mul(g, a)))
            dj = add(mul(b, j), scale(-sign, mul(j, b)))
            dh = add(mul(a, h), scale(sign, mul(h, b)))
            delta = add(mul(g, v), scale(-1, mul(v, j)))
            expected = [[dg, scale(-sign, add(delta, scale(-1, dh)))],
                        [zero, scale(-sign, dj)]]
            assert matrix_is_zero(matrix_add(actual, expected, -1), modulus)
            squared = hom_differential(differential, actual, 1 - parity)
            assert matrix_is_zero(squared, modulus, chain_relations=True)
            print(f"{coefficient_ring}, n mod 2 = {parity}: "
                  "coordinate differential PASS; endomorphism d^2 PASS")
        assert matrix_is_zero(matrix_mul(differential, differential),
                              modulus, chain_relations=True)
        print(f"{coefficient_ring}: cone d_Q^2 PASS "
              "using a^2=b^2=0 and aV=Vb")
    print("All checks passed. The identity covers all integer n by parity.")


if __name__ == "__main__":
    main()
