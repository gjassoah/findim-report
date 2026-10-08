# Codex job 06

Claim: test the stated near-miss triangular algebra and its quotient module.
Cases: three seeded triples of primitive elements of GF(2^16), Ext degrees
0 through 6; GF(2)(q,H1,H2), Ext degrees 0 through 2.
Conventions: left modules, column matrices, characteristic two,
`u.a = u*h_H(a)` on the right-twisted bimodules.
Status: computed dimensions are **supported** only in these cases.

Use the system Python with SageMath installed:

```sh
python3 computations/03-testbed-lambda0/testbed.py --case 0 --degree 6 > computations/03-testbed-lambda0/case-0.out 2>&1
python3 computations/03-testbed-lambda0/testbed.py --case 1 --degree 6 > computations/03-testbed-lambda0/case-1.out 2>&1
python3 computations/03-testbed-lambda0/testbed.py --case 2 --degree 6 > computations/03-testbed-lambda0/case-2.out 2>&1
python3 computations/03-testbed-lambda0/testbed.py --case exact --degree 2 > computations/03-testbed-lambda0/case-exact.out 2>&1
python3 computations/03-testbed-lambda0/crosscheck.py 0 > computations/03-testbed-lambda0/crosscheck-0.out 2>&1
python3 computations/03-testbed-lambda0/crosscheck.py exact > computations/03-testbed-lambda0/crosscheck-exact.out 2>&1
```

The scripts set `DOT_SAGE` inside this directory and disable bytecode writes.
The Arch Sage launcher here does not support `sage -python`.
`result-*.json` records all cochain dimensions, differential ranks, Betti
multiplicities, syzygy dimensions, finite-field parameters and input hashes.
`crosscheck-*.json` records the independent module-intertwiner calculation
and the explicit self-extension cocycles.

`testbed.py` reuses only the algebra constructors and structural audits from
job 04, after source inspection. The Lambda multiplication, quotient module,
cover algorithm and Hom computations are implemented here. No expected Ext
dimension is used to construct the resolution or as an assertion.

`crosscheck.py` solves module-map equations without projective resolutions.
It then tests the first-order variations of the two off-diagonal branch
actions, checking the extension identities and their independence modulo
coboundaries. Its shared inputs are the algebra and module constructors,
so this is a different computation, not a fully independent implementation
of the initial algebra data.

The report is `audit/06-testbed-lambda0-codex.md`. Sage's local state directory
is regenerable and contains no evidence used in the mathematical conclusions.

An additional check constructs comparison chain maps on a minimal T-resolution
of s and computes the two twist actions on Ext_T^a(s,s), a=0,...,6:

```sh
python3 computations/03-testbed-lambda0/comparison.py 0 > computations/03-testbed-lambda0/comparison-0.out 2>&1
python3 computations/03-testbed-lambda0/summarise.py > computations/03-testbed-lambda0/summary.out 2>&1
```

This computes the comparison-map ranks without using the preprint's claimed
twist eigenvalue formula. The summary compares the resulting kernel/cokernel
dimensions with the independently computed Lambda self-Ext dimensions.
