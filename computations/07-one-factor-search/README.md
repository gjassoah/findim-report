# Codex job 12

Model: GPT-6 (Codex); effort: unknown. Report:
[`audit/12-one-factor-search-codex.md`](../../audit/12-one-factor-search-codex.md).

Status: the general vanishing argument is AI-proved, with a fresh-context
review finding no error. Computational data are supported only in the
specified cases. No eligible candidate reached the fibre construction.

Run from the repository root with system Python and SageMath:

```sh
python3 -B computations/07-one-factor-search/controls.py > computations/07-one-factor-search/controls.out 2>&1
python3 -B computations/07-one-factor-search/profiles.py > computations/07-one-factor-search/profiles.out 2>&1
python3 -B computations/07-one-factor-search/validate.py > computations/07-one-factor-search/validation.out 2>&1
```

Run sequentially, stopping on a nonzero exit. `controls.py` needs only
Python's standard library. The other scripts need the installed SageMath
Python modules; `DOT_SAGE` is directed to `sage-state/` here and bytecode
writes are disabled. No installation is needed.

- `controls.py` / `controls.json`: signed noncommutative nullhomotopy
  identities over Z; 5,525 defined AR scalar triples with indices 0--12;
  the complete four-periodic six-dimensional example with bracket {1};
  the formula screen of 27 symmetric uniform cyclic Nakayama presentations.
- `profiles.py` / `profiles.json`: direct minimal covers through degree 12
  for AR20, Nakayama6 and tensor12; first two covers for iterated40, with
  remaining dimensions obtained by the tensor resolution. The AR source
  constructors and certificate are reused after reading them; only the
  witness's `DOT_SAGE` assignment is changed in memory. The new cover
  computation does not use expected Ext dimensions as input.
- `validate.py` / `validation.json`: saved-source hash checks, consistency
  checks, direct AR e-simple Ext^1, the missing dual-simple hypothesis in
  Fable 2.3, and a balanced grading on iterated40.
- `independent-review.md`: separate mathematical audit of the vanishing
  statement, including the exact primary-source locator and an embedded
  signed computation with its output. Its model and effort are unknown.

All scripts have headers recording claim, cases and conventions. Their
`.out` files save stdout/stderr; the JSON files retain dimensions,
parameters and linear-system sizes. `profiles.json` pins reused inputs by
SHA-256. `SHA256SUMS` covers the final sources, report and saved evidence;
the regenerable Sage cache is excluded. Check it from the repository root:

```sh
sha256sum -c computations/07-one-factor-search/SHA256SUMS
```

The largest system has 78 scalar unknowns. Character separation over a
finite field is checked only for exponents 1--12. Positive Ext dimensions
through degree 12 alone do not establish an all-degree polynomial algebra.
The report's general obstruction is a separate argument using Tate duality
and a defining-system identity for the specified Toda bracket.
