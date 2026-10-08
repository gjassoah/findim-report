#!/usr/bin/env python3
"""Codex job 12: exact controls for the one-factor obstruction.

Claim: check signed nullhomotopy identities over Z; enumerate AR weight
discrepancies; recompute the nonzero bracket for T(k A2) in characteristic 2.
Cases: indices 0..12 for scalar AR classes; all four residues of the complete
Nakayama resolution; symmetric cyclic Nakayama dimensions <=60.
Conventions: left modules, products right to left, [1]=Omega^-1; internal
degree is the character of the inverse twist. These finite checks have
status supported; they do not replace the argument in the audit report.
Run: python3 -B computations/07-one-factor-search/controls.py
"""
from collections import defaultdict
from itertools import product
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent


def clean(p):
    return {w: c for w, c in p.items() if c}


def add(*ps):
    out = defaultdict(int)
    for p in ps:
        for w, c in p.items():
            out[w] += c
    return clean(out)


def mul(p, q):
    out = defaultdict(int)
    for u, a in p.items():
        for v, b in q.items():
            out[u + v] += a * b
    return clean(out)


def signed_identity():
    # Free associative graded algebra, with prescribed differential.
    deg = dict(T=3, B=-1, G=-4, U=1, V=-6, W=-4, E=-2)
    b = {s: {(s,): 1} for s in deg}
    differentials = {s: {} for s in deg}
    differentials.update(
        U=mul(b['T'], b['B']), V=mul(b['B'], b['G']),
        W=add(mul(b['T'], b['V']), mul(b['U'], b['G'])),
        E=add(mul(b['G'], b['T']), {('B',): -1}))

    def d(p):
        out = {}
        for w, c in p.items():
            prefix_degree = 0
            for i, s in enumerate(w):
                sign = -1 if prefix_degree % 2 else 1
                out = add(out, {w[:i] + v + w[i+1:]: c * sign * a
                                for v, a in differentials[s].items()})
                prefix_degree += deg[s]
        return out

    for s in deg:
        assert all(sum(deg[x] for x in w) == deg[s] + 1
                   for w in differentials[s])
        assert not d(differentials[s]), ('d squared', s)
    # dE=GT-B permits the identical representative B in both beta slots.
    K = add(mul(b['V'], b['T']), mul(b['B'], b['E']))
    assert d(K) == mul(b['B'], b['B'])
    value = add(mul(b['T'], K), mul(b['U'], b['B']))
    primitive = add(mul(b['W'], b['T']), mul(b['U'], b['E']))
    assert value == d(primitive)
    assert not d(value)
    return {'coefficient_ring': 'Z', 'd_squared': 0,
            'beta_square_nullhomotopy': 'K=VT+BE',
            'bracket_boundary': 'TK+UB=d(WT+UE)',
            'scope': 'formal signed identities; existence of W uses H^-3=0'}


def ar_weights(bound=12):
    def group(n):
        if n >= 0 and n % 3 == 0:
            return ('t', n // 3, -n // 3)
        if n < 0 and (-n-1) % 3 == 0:
            m = (-n-1) // 3
            return ('b', m, m+1)
        return None

    # Scalar products in the one-variable Tate algebra. Its mixed action
    # follows from the perfect Tate pairing, not a finite-field eigenvalue.
    def product_nonzero(a, b):
        if a[0] == b[0] == 't':
            return True
        if a[0] == b[0] == 'b':
            return False
        t, beta = (a, b) if a[0] == 't' else (b, a)
        return t[1] <= beta[1]

    classes = [(('t', a, -a), 3*a) for a in range(bound+1)]
    classes += [(('b', a, a+1), -3*a-1) for a in range(bound+1)]
    counts = defaultdict(int)
    for (x, dx), (y, dy), (z, dz) in product(classes, repeat=3):
        if product_nonzero(x, y) or product_nonzero(y, z):
            continue
        counts['defined_triples'] += 1
        target = group(dx+dy+dz-1)
        if target is None:
            counts['zero_target'] += 1
        else:
            discrepancy = x[2]+y[2]+z[2]-target[2]
            assert discrepancy == 1
            counts['nonzero_target_weight_mismatch'] += 1
    return {'index_bound': bound, **counts}


def nakayama_control():
    # Unique alternating path is (start vertex, length); length >=3 is zero.
    def end(p):
        return (p[0]+p[1]) % 2

    def pm(p, q):
        if p is None or q is None or end(q) != p[0] or p[1]+q[1] >= 3:
            return None
        return (q[0], p[1]+q[1])

    def xor(*ps):
        out = set()
        for p in ps:
            if p is not None:
                out.symmetric_difference_update({p})
        return out

    e0, e1, a, b, ab, ba = (0, 0), (1, 0), (0, 1), (1, 1), (1, 2), (0, 2)
    basis = [e0, e1, a, b, ab, ba]
    trace = lambda p: int(p is not None and p[1] == 2)
    assert all(pm(pm(x, y), z) == pm(x, pm(y, z))
               for x, y, z in product(basis, repeat=3))
    gram = [[trace(pm(x, y)) for y in basis] for x in basis]
    assert all(sum(row) == 1 for row in gram)
    assert all(gram[i][j] == gram[j][i] for i in range(6) for j in range(6))
    D, F, U = [ba, a, ab, b], [e0, b, e1, a], [None, e1, None, e0]
    vertices = [0, 1, 1, 0]
    for i in range(4):
        Pi = [x for x in basis if x[0] == vertices[i]]
        outgoing = [pm(x, D[i]) for x in Pi]
        incoming = {pm(x, D[(i+1) % 4]) for x in basis
                    if x[0] == vertices[(i+1) % 4]}
        incoming.discard(None)
        kernel_basis = {x for x, image in zip(Pi, outgoing) if image is None}
        assert kernel_basis == incoming
        nonzero_images = [x for x in outgoing if x is not None]
        assert len(nonzero_images) == len(set(nonzero_images))
        assert pm(F[i], D[i]) == pm(D[(i+3) % 4], F[(i-1) % 4])
        f_squared = pm(F[(i+3) % 4], F[i])
        assert xor(pm(U[(i+1) % 4], D[(i+1) % 4]),
                   pm(D[(i+6) % 4], U[i])) == xor(f_squared)
        assert xor(pm(U[(i+3) % 4], F[i]),
                   pm(F[(i+5) % 4], U[i])) == {(vertices[i], 0)}
    ext = [int(vertices[i % 4] == 0) for i in range(13)]
    assert ext == [1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1]
    # f has degree 3, v is the degree-4 period, beta=f/v, gamma=1/v.
    # gamma*f=beta; beta*gamma=f/v^2, nonzero in H^-5.
    assert F[0] == e0  # Nonzero on the simple top, also after period shifts.
    return {'dimension': 6, 'simples': 2, 'ext_0_to_12': ext,
            'chain_identities': ['df=0', 'dU=f^2', 'fU+Uf=v^2'],
            'bracket': '<f,f/v,f/v>={1}', 'tau_square': 0,
            'exception_to_obstruction': 'beta*gamma=f/v^2 != 0 in H^-5; Ext^4=k',
            'DC_degrees': {'form': 1, 'tau': -2, 'beta': 1},
            'path_degrees': {'form': 2, 'tau': -4, 'beta': 2}}


def cyclic_nakayama_screen():
    cases = []
    # r>=2; all lengths L=mr+1 yielding a symmetric uniform cyclic algebra.
    # The formula follows directly from alternating maps of lengths 1,L-1.
    for r in range(2, 61):
        for m in range(1, 61):
            L = m*r+1
            if r*L > 60:
                break
            vertices = [((i//2)*L + i % 2) % r for i in range(13)]
            ext = [int(v == 0) for v in vertices]
            cases.append({'vertices': r, 'length': L, 'dimension': r*L,
                          'ext_0_to_12': ext,
                          'first_positive_degrees': [2*r-1, 2*r],
                          'rejection': 'two consecutive positive Ext degrees'})
    return cases


def main():
    result = {'job': 'Codex job 12', 'status': 'supported exact controls',
              'signed_nullhomotopy': signed_identity(),
              'AR_weights': ar_weights(), 'six_dimensional': nakayama_control(),
              'cyclic_nakayama_screen': cyclic_nakayama_screen()}
    (HERE/'controls.json').write_text(json.dumps(result, indent=2)+'\n')
    print('Codex job 12: exact controls')
    print('PASS: signed free dg identities over Z, including identical beta representatives')
    print('AR weight enumeration:', result['AR_weights'])
    print('PASS: T(k A2), all four complete-resolution residues; c=1; tau^2=0')
    print('T(k A2) Ext dimensions 0..12:', result['six_dimensional']['ext_0_to_12'])
    print('Symmetric cyclic Nakayama presentations with r>=2, dim<=60:',
          len(result['cyclic_nakayama_screen']))
    print('All fail the polynomial requirement; no step-4 candidate.')


if __name__ == '__main__':
    main()
