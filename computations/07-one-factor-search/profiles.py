#!/usr/bin/env python3
"""Codex job 12: small algebra screening and replay of the AR certificate.

Claim: compute minimal-resolution Ext dimensions through degree 12; test
symmetric forms and reject three attempted constructions before step 4.
Cases: AR T of dimension 20, T(k A2) of dimension 6, its tensor product
with dual numbers of dimension 12, and T(T_AR) of dimension 40. AR uses
F_2(q) and two primitive q in GF(2^16). Others use GF(2^16).
Conventions: left modules, column maps, right-to-left multiplication;
minimal covers from radical quotients, [1]=Omega^-1, characteristic two.
Finite computations have status supported. Reused source is read-only;
only the witness module's DOT_SAGE assignment is redirected in memory.
Run: python3 -B computations/07-one-factor-search/profiles.py
"""
import ast
import hashlib
import json
import os
from pathlib import Path
import sys
import time

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
os.environ['DOT_SAGE'] = str(HERE/'sage-state')
os.environ['PYTHONDONTWRITEBYTECODE'] = '1'
sys.dont_write_bytecode = True
sys.path.insert(0, str(HERE.parent/'02-ar-finite-data'))
from importlib import import_module
from sage.all import (GF, PolynomialRing, VectorSpace, matrix,
                      block_diagonal_matrix, identity_matrix)

te = import_module('04_trivial_extension')
cochain = import_module('05_cochain')
SYSTEMS = []
RESULT = {'job': 'Codex job 12', 'status': 'running', 'cases': []}


def emit(*args):
    print(*args, flush=True)


def checkpoint():
    RESULT['systems'] = SYSTEMS
    RESULT['maximum_unknowns'] = max((x['unknowns'] for x in SYSTEMS), default=0)
    (HERE/'profiles.json').write_text(json.dumps(RESULT, indent=2, default=str)+'\n')


def guard(name, rows, cols):
    SYSTEMS.append({'name': name, 'equations': int(rows), 'unknowns': int(cols)})
    if cols > 1000000:
        RESULT['status'] = 'stopped at one-million-unknown bound'
        checkpoint()
        raise RuntimeError(SYSTEMS[-1])


def sparse_add(dst, src, scalar):
    for i, c in src.items():
        value = dst.get(i, 0) + scalar*c
        if value:
            dst[i] = value
        else:
            dst.pop(i, None)


class Algebra:
    def __init__(self, K, table, corners, idems, trace, name, degrees=None):
        self.K, self.table, self.corners = K, table, corners
        self.idems, self.trace, self.name = idems, trace, name
        self.dim, self.degrees = len(table), degrees
        self.rad = [i for i in range(self.dim) if i not in idems]
        self.ids = [[i for i, (_, r) in enumerate(corners) if r == v]
                    for v in range(len(idems))]
        self.indecs = []
        for ids in self.ids:
            loc = {b: j for j, b in enumerate(ids)}
            self.indecs.append([
                matrix(K, len(ids), len(ids),
                       {(loc[c], j): x for j, b in enumerate(ids)
                        for c, x in table[a][b].items()})
                for a in range(self.dim)])

    def audit(self):
        n, t = self.dim, self.table
        for a in range(n):
            for b in range(n):
                assert all(self.corners[c] == (self.corners[a][0], self.corners[b][1])
                           for c in t[a][b])
                if self.degrees is not None:
                    assert all(self.degrees[c] == self.degrees[a]+self.degrees[b]
                               for c in t[a][b])
                for c in range(n):
                    left, right = {}, {}
                    for i, x in t[a][b].items():
                        sparse_add(left, t[i][c], x)
                    for i, x in t[b][c].items():
                        sparse_add(right, t[a][i], x)
                    assert left == right, (self.name, 'associativity', a, b, c)
        G = matrix(self.K, n, n,
                   lambda i, j: sum(self.trace[k]*x for k, x in t[i][j].items()))
        assert G == G.transpose() and G.rank() == n
        for a in range(n):
            left, right = {}, {}
            for e in self.idems:
                sparse_add(left, t[e][a], 1)
                sparse_add(right, t[a][e], 1)
            assert left == right == {a: self.K(1)}
        # Nilpotence of the radical is checked by supports, which is stronger
        # than needed and uses no cancellation. The quotient is split diagonal.
        supp = set(self.rad)
        for _ in range(n+1):
            supp = {c for a in self.rad for b in supp for c in t[a][b]}
            assert supp.isdisjoint(self.idems)
            if not supp:
                break
        assert not supp
        emit('PASS symmetric algebra', self.name, 'dimension', n, 'simples', len(self.idems))
        return G

    def projective(self, vertices):
        ids = [self.ids[v] for v in vertices]
        acts = [block_diagonal_matrix([self.indecs[v][a] for v in vertices])
                for a in range(self.dim)]
        starts, offset = [], 0
        for v, bs in zip(vertices, ids):
            starts.append(offset+bs.index(self.idems[v]))
            offset += len(bs)
        return ids, acts, starts

    def ext(self, vertex, last=12):
        K, n = self.K, self.dim
        acts = [matrix(K, 1, 1, [int(a == self.idems[vertex])]) for a in range(n)]
        records = []
        for d in range(last+1):
            size = acts[0].nrows()
            guard(self.name+f' degree {d} radical', len(self.rad)*size, size)
            rad = matrix(K, [c for a in self.rad for c in acts[a].columns()])
            current = rad.row_space().basis_matrix().transpose()
            radical_dimension = current.ncols()
            gs, vs = [], []
            for v, e in enumerate(self.idems):
                joined = current.augment(acts[e])
                pivots = list(joined.pivots())
                selected = [i-current.ncols() for i in pivots if i >= current.ncols()]
                gs.extend(acts[e].column(i) for i in selected)
                vs.extend([v]*len(selected))
                current = joined.matrix_from_columns(pivots)
            assert current.ncols() == size and len(vs) == size-radical_dimension
            ids, projective, starts = self.projective(vs)
            cover = matrix(K, [acts[b]*g for bs, g in zip(ids, gs) for b in bs]).transpose()
            guard(self.name+f' degree {d} cover', cover.nrows(), cover.ncols())
            assert cover.rank() == size
            assert all(cover*projective[a] == acts[a]*cover for a in range(n))
            kernel = cover.right_kernel_matrix()
            inc = kernel.transpose()
            assert inc.matrix_from_rows(starts).is_zero()
            assert cover*inc == 0 and inc.ncols()+cover.rank() == cover.ncols()
            rows = list(kernel.pivots())
            new = []
            for a in range(n):
                image = projective[a]*inc
                action = image.matrix_from_rows(rows)
                assert inc*action == image
                new.append(action)
            records.append({'degree': d, 'syzygy_dimension': size,
                            'projective_dimension': int(cover.ncols()),
                            'betti': [vs.count(v) for v in range(len(self.idems))],
                            'Ext': vs.count(vertex), 'next_syzygy_dimension': int(inc.ncols())})
            acts = new
        emit(self.name, 'Ext dimensions:', [r['Ext'] for r in records])
        return records


def ar(K, q):
    old = te.TrivialExtension(K, q)
    table = [[{int(i): c for i, c in enumerate(x) if c} for x in row] for row in old.table]
    corners = [(int(l == 'f'), int(r == 'f')) for l, r in old.corners]
    return Algebra(K, table, corners, [0, 8], [int(i in (10, 18)) for i in range(20)],
                   'AR20', [0]*10+[1]*10)


def cyclic(K, r, length, name, degrees=None):
    paths = [(v, d) for d in range(length) for v in range(r)]
    index = {p: i for i, p in enumerate(paths)}
    table = []
    for v, d in paths:
        row = []
        for w, e in paths:
            row.append({index[w, d+e]: K(1)} if (w+e) % r == v and d+e < length else {})
        table.append(row)
    return Algebra(K, table, [((v+d) % r, v) for v, d in paths], list(range(r)),
                   [int(d == length-1) for v, d in paths], name,
                   degrees if degrees is not None else [d for v, d in paths])


def tensor(A, B, name):
    pairs = [(i, j) for i in range(A.dim) for j in range(B.dim)]
    table = [[{a*B.dim+b: x*y for a, x in A.table[i][k].items()
               for b, y in B.table[j][l].items()}
              for k, l in pairs] for i, j in pairs]
    nv = len(B.idems)
    corners = [(A.corners[i][0]*nv+B.corners[j][0],
                A.corners[i][1]*nv+B.corners[j][1]) for i, j in pairs]
    return Algebra(A.K, table, corners, [a*B.dim+b for a in A.idems for b in B.idems],
                   [A.trace[a]*B.trace[b] for a, b in pairs], name,
                   [A.degrees[a]+B.degrees[b] for a, b in pairs])


def trivial(A, form_degree):
    n, K = A.dim, A.K
    table = [[{} for _ in range(2*n)] for _ in range(2*n)]
    for i in range(n):
        for j in range(n):
            for k, x in A.table[i][j].items():
                table[i][j][k] = x
                table[j][n+k][n+i] = x
                table[n+k][i][n+j] = x
    return Algebra(K, table, A.corners+[(r, l) for l, r in A.corners], A.idems,
                   [0]*n+[int(i in A.idems) for i in range(n)], 'iterated40',
                   A.degrees+[form_degree-d for d in A.degrees])


def replay_witness(K, q):
    path = HERE.parent/'04-toda-bracket/witness.py'
    tree = ast.parse(path.read_text(), filename=str(path))
    changed = 0
    for node in tree.body:
        if isinstance(node, ast.Assign) and any(
                isinstance(t, ast.Subscript) and ast.unparse(t) == "os.environ['DOT_SAGE']"
                for t in node.targets):
            node.value = ast.Constant(str(HERE/'sage-state'))
            changed += 1
    assert changed == 1
    namespace = {'__file__': str(path), '__name__': 'job12_witness_replay'}
    exec(compile(ast.fix_missing_locations(tree), str(path), 'exec'), namespace)
    assert os.environ['DOT_SAGE'] == str(HERE/'sage-state')
    namespace['run'](K, q)


def main():
    start = time.time()
    K0 = PolynomialRing(GF(2), 'q').fraction_field()
    K = GF(2**16, name='a')
    primitive = K.multiplicative_generator()
    RESULT['finite_field'] = {'field': str(K), 'modulus': str(K.modulus()),
                              'primitive': str(primitive), 'order': int(primitive.multiplicative_order())}
    for label, field, q in [('exact F2(q)', K0, K0.gen()),
                            ('GF(2^16), q=a', K, primitive),
                            ('GF(2^16), q=a^7', K, primitive**7)]:
        emit('CASE', label)
        if field.is_finite():
            assert q.multiplicative_order() == 65535
            H1, H2 = primitive**11, primitive**13
            assert H1.multiplicative_order() == H2.multiplicative_order() == 65535
            assert all(H1**(-m) != H2**(-m) for m in range(1, 13))
        A = ar(field, q)
        A.audit()
        records = A.ext(1)
        replay_witness(field, q)
        entries = cochain.read_entries()
        cochain.cocycle(field, q, entries)
        cochain.evaluation(field, q, entries)
        RESULT['cases'].append({'algebra': A.name, 'parameters': label,
                                'resolution': records, 'c': 0,
                                'form_degree': 1, 'tau_degree': -1, 'beta_degree': 1})
        checkpoint()

    # Three attempted constructions, each discarded at its first failed
    # necessary condition. Full small profiles are retained as useful controls.
    B = cyclic(K, 2, 3, 'Nakayama6')
    B.audit()
    b_records = B.ext(0)
    D = cyclic(K, 1, 2, 'dual_numbers', degrees=[0, 0])
    D.audit()
    d_records = D.ext(0)
    BD = tensor(B, D, 'tensor12')
    BD.audit()
    bd_records = BD.ext(0)
    b_ext = [r['Ext'] for r in b_records]
    d_ext = [r['Ext'] for r in d_records]
    assert [r['Ext'] for r in bd_records] == [sum(b_ext[i]*d_ext[n-i] for i in range(n+1))
                                             for n in range(13)]
    RESULT['cases'].extend([
        {'algebra': B.name, 'dimension': 6, 'simples': 2, 'resolution': b_records,
         'rejection': 'Ext^4 is nonzero; tau^2=0, see controls.json', 'form_degree': 2},
        {'algebra': BD.name, 'dimension': 12, 'simples': 2, 'resolution': bd_records,
         'rejection': 'Ext^1 is nonzero', 'form_degree': 2}])
    checkpoint()

    A = ar(K, primitive)
    E = trivial(A, 2)
    E.audit()
    e_records = E.ext(1, last=1)
    # Explicit trace identification T(A)=A tensor dual_numbers for symmetric A.
    AD = tensor(A, D, 'AR_tensor_dual')
    gram = matrix(K, A.dim, A.dim, lambda i, j:
                  sum(A.trace[k]*c for k, c in A.table[i][j].items()))
    perm = []
    for i in range(A.dim):
        nonzero = gram.column(i).nonzero_positions()
        assert len(nonzero) == 1 and gram[nonzero[0], i] == 1
        perm.extend([i, A.dim+int(nonzero[0])])
    assert sorted(perm) == list(range(40))
    for i in range(40):
        for j in range(40):
            assert {perm[k]: c for k, c in AD.table[i][j].items()} == E.table[perm[i]][perm[j]]
    ar_ext = [r['Ext'] for r in RESULT['cases'][1]['resolution']]
    derived_ext = [sum(ar_ext[i]*d_ext[n-i] for i in range(n+1)) for n in range(13)]
    assert [r['Ext'] for r in e_records] == derived_ext[:2]
    RESULT['cases'].append({'algebra': E.name, 'dimension': 40, 'simples': 2,
                            'form_degree': 2, 'resolution': e_records,
                            'ext_0_to_12_via_tensor_resolution': derived_ext,
                            'trace_isomorphism_basis_permutation': perm,
                            'rejection': 'Ext^1 is nonzero'})
    paths = [Path(__file__), HERE/'controls.py',
             HERE.parent/'02-ar-finite-data/01_algebra.py',
             HERE.parent/'02-ar-finite-data/04_trivial_extension.py',
             HERE.parent/'02-ar-finite-data/05_cochain.py',
             HERE.parent/'04-toda-bracket/witness.py', ROOT/'.cache/ar-src/09-cochain.tex']
    RESULT['source_sha256'] = {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest()
                               for p in paths}
    RESULT['witness_adaptation'] = 'AST: redirect DOT_SAGE only; no equations or assertions changed'
    RESULT['status'] = 'completed; no eligible candidate; step 4 not entered'
    RESULT['elapsed_seconds'] = time.time()-start
    checkpoint()
    emit('Iterated T(T_AR) Ext 0..12 from checked tensor resolution:', derived_ext)
    emit('COMPLETED', RESULT['status'], 'max unknowns', RESULT['maximum_unknowns'])


if __name__ == '__main__':
    main()
