# Feasibility of a Lean formalisation of the report

Claude Opus 5.5, 2026-10-08 (W6). Based on `lean/FEASIBILITY-report-inventory.md` (Codex job L-feasibility:
Mathlib at the pinned commit `0df444a3`, searched declaration by declaration for all 81 numbered results of
`report/`; sizes are order-of-magnitude estimates, status heuristic). Rules: `docs/WORKING_RULES.md`
(LEAN_FORMALISATION summary): conditional hypotheses are approved by Gustavo one by one; no Lean code beyond
small probes until a stage is approved. Nothing below is approved yet.

## Verdict

- **A complete unconditional formalisation down to Mathlib is not feasible as a project of reasonable size.**
  Both constructions need large infrastructure that the pinned Mathlib does not have: for §§4–7, concrete
  derived tensor products over noncommutative finite-dimensional algebras, dg/bar resolutions and K-flatness;
  for §§8–10, stable module categories of symmetric algebras, complete resolutions and Tate duality. Each is
  very large (well over 10 000 lines); with the finite representation theory both need (radicals, minimal
  covers, Krull–Schmidt, simple counts) the total is tens of thousands of lines. Mathlib does provide
  derived and homotopy categories, Verdier localisation with the calculus of fractions, `Karoubi`,
  `HasExt`/projective dimension, `TrivSqZeroExt`, `PresentedGroup` and `MonoidAlgebra`, which several
  smaller targets can use directly.
- **A conditional formalisation of the two main theorems** (Theorem 7.3, Theorem 9.17) would be an assembly
  reduction whose hypotheses are the report's own results. That relocates the work rather than checking it;
  it is not recommended.
- **What is feasible and worthwhile** is a set of independent stages: unconditional formalisations of the
  self-contained parts (the group of §5, the abstract category lemmas of §6, the finite algebra and cochain
  certificates of §9, the completion of the strong-Nakayama theorem), and conditional formalisations of the
  abstract obstruction arguments (§§5.4, 10) over explicitly stated interfaces whose fields are standard
  facts, each to be approved separately.

## Proposed stages (for Gustavo's decision)

| Stage | Content (report numbering) | Kind | Size (heuristic) | Value |
|---|---|---|---|---|
| 3a | Complete Theorem 3.3: Ext vanishing ⇔ exactness of the dual complex for a projective resolution; degree zero; transpose identification | unconditional | M–L (1 000–4 000) | closes the gap recorded in Appendix B between the formal and the informal statement |
| 3b | §5: the group G, its finite presentation (5.9), central involutions (5.11), shift automorphism (5.13), finite quotients in GL₅(F₂[t]/(tᵐ−1)) (5.14), independence (5.15) | unconditional | L (4 000–8 000 total) | the only part of the main construction that is concrete and self-contained; checks the selection input of the main theorem |
| 3c | §6 abstract lemmas: finite-family right fractions (6.1), cone splitting in the idempotent completion (6.6), the odd double without the K₀ clause (6.7) | unconditional | M–L (1 500–3 500) | the categorical core of the realisation, on Mathlib's localisation and Karoubi API |
| 3d | §9 finite data: associativity, grading and radical of C (9.1); T = C ⋉ DC symmetric (9.4, general lemma); the 179-entry cochain identities (9.7) by kernel-checked computation | unconditional | M–L, and L for 9.7 (kernel cost uncertain; a probe first) | replaces the Python/Sage certificates by formal ones |
| 4a | §10: Tate obstruction (10.4–10.5) and one-factor failure (10.1–10.3) in a k-linear triangulated category with an explicit graded Hom profile | conditional | M–L (1 500–3 000), plus Toda brackets (S–M) | the bracket and factorisation arguments stay genuine; interface fields are standard facts |
| 4b | §5.4 rank-function obstruction in an abstract linear-algebra setting (cyclic vector, shift-compatible evaluation) | conditional (reduction to linear algebra) | M (400–1 200) | isolates the proof; linking to K₀ of a ring would be a separate step |

Interface fields that stage 4a would need, each requiring separate approval (LEAN_FORMALISATION §2.4):

1. a `k`-linear pretriangulated category with finite-dimensional Hom spaces (Mathlib's `Pretriangulated`
   with linearity; standard);
2. a perfect pairing `Hom(X, Y[a]) × Hom(Y, X[−1−a]) → k` compatible with composition (Tate duality for
   symmetric algebras, report Theorem 2.1, cited from Linckelmann; this is the field that carries cited
   mathematics);
3. for 10.1–10.3, an object s with `End(s) = k` and a graded endomorphism algebra isomorphic to `k[τ]`,
   `|τ| = 3`, in non-negative degrees (an input describing the example, proved in the report as
   Theorem 9.5).

Field 2 is the only one that imports a theorem of the literature; field 3 is an assumption on the object, not
a hidden conclusion. No field states a bracket, a vanishing of a composite, or an Ext group of Z.

## Recommendation

Approve stages 3a and 3b first: 3a completes the existing formalisation (it is the natural continuation of
stages 1–2), and 3b is the largest part of the main construction that can be checked unconditionally. Stage
4a is the most valuable conditional target. Stages 3c and 3d are independent and can be scheduled later. A
proof-of-concept probe for 9.7 (whether the kernel can check the 18⁴ cocycle identities in reasonable time)
should precede any commitment to 3d.

The Part I note `lean/FEASIBILITY.md` concerned the criteria only and should not be extrapolated to the
report.
