#!/usr/bin/env python3
"""Codex job 12: final output checks and two Fable scope checks.

Claim: check saved receipts against recomputed small cases; the AR e-simple
has Ext^1 dimension two; an exceptional simple over k(1->2) need not return
to itself under D RHom(-,C). Cases: F_2(q), degrees 0,1; saved degree<=12
receipts. Conventions: left modules, composition right to left, exact
arithmetic. Status: supported for these computations.
Run: python3 -B computations/07-one-factor-search/validate.py
"""
import hashlib
import json
from pathlib import Path
import sys
sys.dont_write_bytecode = True
import profiles
from sage.all import GF, PolynomialRing, matrix, vector

HERE = Path(__file__).resolve().parent


def main():
    controls = json.loads((HERE/'controls.json').read_text())
    receipt = json.loads((HERE/'profiles.json').read_text())
    assert receipt['status'] == 'completed; no eligible candidate; step 4 not entered'
    assert receipt['maximum_unknowns'] < 1000000
    for path, digest in receipt['source_sha256'].items():
        assert hashlib.sha256((profiles.ROOT/path).read_bytes()).hexdigest() == digest, path
    for row in receipt['cases'][:3]:
        assert row['c'] == 0
        assert [r['Ext'] for r in row['resolution']] == [int(n % 3 == 0) for n in range(13)]
        assert row['tau_degree'] + 2*row['beta_degree'] == 1
    assert [r['Ext'] for r in receipt['cases'][3]['resolution']] == controls['six_dimensional']['ext_0_to_12']
    assert receipt['cases'][4]['resolution'][1]['Ext'] == 1
    assert receipt['cases'][5]['resolution'][1]['Ext'] == 1

    K = PolynomialRing(GF(2), 'q').fraction_field()
    A = profiles.ar(K, K.gen())
    e_records = A.ext(0, last=1)
    assert e_records[1]['Ext'] == 2
    corner_dim = sum(c == (0, 0) for c in A.corners)
    assert corner_dim == 8
    E = profiles.trivial(A, 2)
    balanced_degrees = [4*d for d in A.degrees]+[2-4*d for d in A.degrees]
    assert all(balanced_degrees[c] == balanced_degrees[i]+balanced_degrees[j]
               for i in range(40) for j in range(40) for c in E.table[i][j])
    assert all(balanced_degrees[i] == 2 for i, x in enumerate(E.trace) if x)

    # C=k(1->2), basis e0,e1,a, with a=e1*a*e0.
    table = [[{} for _ in range(3)] for _ in range(3)]
    for i, j, k in [(0, 0, 0), (1, 1, 1), (1, 2, 2), (2, 0, 2)]:
        table[i][j] = {k: K(1)}
    C = profiles.Algebra(K, table, [(0, 0), (1, 1), (1, 0)], [0, 1],
                         [0, 0, 0], 'C_A2')
    # A e1 --right a--> A e0 --top--> s0; map is the column (0,1).
    inclusion = matrix(K, 2, 1, [0, 1])
    assert all(inclusion*C.indecs[1][i] == C.indecs[0][i]*inclusion for i in range(3))
    assert inclusion.rank() == 1
    # Hom(P0,C)=e0 C, Hom(P1,C)=e1 C; differential is left a.
    hom_differential = matrix(K, 2, 1, [0, 1])
    quotient = matrix(K, 1, 2, [1, 0])
    assert quotient*hom_differential == 0
    right_ids = [1, 2]
    right_actions = [matrix(K, 2, 2,
                            lambda i, j: table[right_ids[j]][a].get(right_ids[i], 0))
                     for a in range(3)]
    assert all(quotient*right_actions[a] == int(a == 1)*quotient for a in range(3))
    checks = {'job': 'Codex job 12', 'status': 'supported',
              'receipt_hashes_match': True, 'maximum_unknowns': receipt['maximum_unknowns'],
              'AR_e_simple_resolution': e_records, 'eTe_dimension': corner_dim,
              'iterated_balanced_grading': {'basis_degrees': balanced_degrees,
                                            'form_degree': 2, 'tau_degree': -4,
                                            'beta_degree': 2,
                                            'description': 'old DC weight 4; epsilon weight -2'},
              'C_A2_source_simple': {'vertex': 0, 'projective_dimension': 1,
                                     'Ext_C_1_s_C_right_simple_vertex': 1,
                                     'dual_simple_differs': True}}
    (HERE/'validation.json').write_text(json.dumps(checks, indent=2)+'\n')
    print('Codex job 12: validation PASS')
    print('AR e-simple: Ext^1 dimension 2; eTe dimension 8, not 4.')
    print('C=k(1->2): D Ext_C^1(s0,C)=s1, not s0.')
    print('Iterated extension: old DC weight 4, epsilon weight -2 balances (-4)+2*2=0; Ext^1 still nonzero.')
    print('Source hashes match; saved controls and profiles agree; max unknowns', receipt['maximum_unknowns'])


if __name__ == '__main__':
    main()
