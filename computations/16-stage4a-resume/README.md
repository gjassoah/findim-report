# Formalisation: criteria for infinite finitistic dimension

Lean 4 formalisation accompanying the AI-assisted research record
`An-algebra-of-infinite-little-finitistic-dimension-September-23-2026` (verification of, and search for a
simpler alternative to, the OpenAI preprint *An algebra of infinite little finitistic dimension*,
2026-09-23). The development record (design, gate evidence) is in that repository under `lean/`.

## Scope

Stages 1–3a formalise general criteria unconditionally down to Mathlib. Stage 4a
formalises Section 10 conditionally over the approved interface below. Stages:

| Stage | Informal statement | Lean | Status |
|---|---|---|---|
| 1 | In an abelian category, short exact sequences 0 → c₀ → p₀ → c₁ → 0 and 0 → cₙ → pₙ → cₙ₊₁ → 0 with all pₙ projective, c₀ projective and c₁ not projective give pd cₙ = n for n ≥ 1 (note 02, Proposition O.4, dimension-shifting half) | `FindimCounterexample.ProjectiveCoresolution.projectiveDimension_eq` | formally verified; gates pass |
| 2 | Proposition O.4 with exactness of the dual complex stated directly: a nonzero quotient E of P₀ annihilating d₀ gives finitely generated left cokernels Cₙ of projective dimension n for every n ≥ 1 | `FindimCounterexample.StrongNakayama.projectiveDimension_eq`, `.unbounded` | AI-proved; all five gates pass; committed |
| 3a | Theorem 3.3 with Ext vanishing as its hypothesis; Ext vanishing iff Hom-complex exactness; transpose and syzygy identifications for the chosen resolution | `FindimCounterexample.ModuleResolution.ext_vanishing_iff`, `StrongNakayama.projectiveDimension_eq_of_ext`, `.unbounded_of_ext`, `Transpose.cok_eq_transpose`, `.presentationCokernelIsoSyzygy` | AI-proved; all five gates pass (uncommitted) |
| 4a | Section 10 obstructions over the approved Tate interface | `Stage4a.Cone.oneCone_profile`, `Stage4a.one_factor_obstruction`, `Stage4a.tate_obstruction`, `Stage4a.HigherObstruction.polynomial_toda_eq_zero` | conditional source checks passed; final gates pending |
| 3 | Proposition O.5: an Auslander–Reiten counterexample (Λ, M) gives Ext^i_Γ(S, Γ) = 0 for all i ≥ 0, Γ = End(Λ ⊕ M)^op | — | planned |

Not formalised: the constructions of the preprints, and any statement about a specific algebra.

## Correspondence and departures

1. Stage 1 is stated in an arbitrary abelian category (more general than modules).
   All stages express “pd Cₙ = n” as `HasProjectiveDimensionLE Cₙ n ∧
   ¬ HasProjectiveDimensionLT Cₙ n`.
2. Stage 2 assumes injectivity of the first dual differential and range = kernel
   in all subsequent degrees, as stipulated in job 09. Stage 3a adds the
   equivalence with Mathlib's derived-category Ext vanishing; the original
   stage-2 declarations retain their statements.
3. Stage 2 works over every ring, without commutativity or finite dimensionality.
   Right modules are modules over `Aᵐᵒᵖ`; the dual is `P →ₗ[Aᵐᵒᵖ] A`, with
   left multiplication on values. The standard commutative `Module.Dual` API is
   not used for reflexivity.
4. The resolution is represented by a family `P : ℕ → ModuleCat Aᵐᵒᵖ` and
   maps `d n : P (n+1) →ₗ[Aᵐᵒᵖ] P n`. Only a surjective augmentation
   `ε : P 0 →ₗ[Aᵐᵒᵖ] E` and `ε.comp (d 0) = 0` are needed from its
   exactness. The final theorem omits the unused right-exactness hypotheses.
   All `P n` are finitely generated and projective, and `E` is nontrivial.
   No additional interface hypotheses are introduced.
5. Stage 3a supplies the exactness at every term and the surjective augmentation
   required of a projective resolution. These remain explicit family hypotheses;
   `ModuleResolution.projectiveResolution` packages them as Mathlib's
   `ProjectiveResolution` for its Ext API. Both directions of the equivalence
   are formalised, including degree zero. Hom groups and their differentials
   are additive over an arbitrary ring; for target `A`, the differentials
   equal the underlying additive maps of stage 2's left-linear dual maps.
6. The report uses minimal presentations and kernels of projective covers.
   Stage 3a defines the transpose of a specified presentation and the syzygies
   of the specified resolution, with no minimality assumption. It identifies
   `Cₙ₊₁` with the transpose of `Pₙ₊₁ → Pₙ`, whose cokernel is isomorphic to
   the resolution's `ΩⁿE`. No presentation-independent transpose or minimal
   syzygy is asserted.
7. The general module Ext comparison uses `[Small.{v} R]`, the size condition
   for Mathlib's `HasExt` instance on `ModuleCat.{v} R`. The strong-Nakayama
   application places `A`, `P n` and `E` in one universe so that the regular
   right module `A` belongs to the same category. The original stage-2 theorem
   retains its separate ring/module universes. No algebraic assumption is added.

4a.1. Stage 4a uses actual Hom spaces and distinguished triangles in an abstract
   linear pretriangulated category. Its application to stable modules over a
   symmetric algebra is conditional; that stable category and the cited Tate
   duality are not constructed here. Stages 1–3a keep their statements.
4a.2. The polynomial graded algebra input is given componentwise by the
   multiplicative monomial bases of `k[τ]`, including its unit. This is the
   homogeneous-coordinate form of the approved graded algebra isomorphism;
   no separate total direct-sum algebra comparison is asserted.
4a.3. Brackets are sets of composites for every specified distinguished cone
   on the middle arrow. Cone independence, nonemptiness and the full coset law
   are derived. The obstruction is written for `s → s[-1] → s[-2] → s[p-2]`,
   so its target is `Hom(s[1],s[p-2])`, canonically degree `p-3`.
4a.4. The Ext¹ clause of Proposition 10.2 and the consequent assertion about Z
   in Corollary 10.3 are omitted: Section 8's conversion comparison is outside
   the approved interface. The rank map is explicitly `(c,d) ↦ (c-d) • v`
   on scalar coordinates; neither a tensor functor nor the Section 8 map δ⁰
   is constructed or identified with it. The arbitrary object `F` represents
   `Fs` in the triangle. No comparison or Ext group is assumed.
4a.5. Theorem 10.4 uses one-dimensional degree-zero Hom, the consequence of
   `End(s)=k` used by its proof. This avoids retaining unused module simplicity
   or a named algebra isomorphism in the abstract theorem.

4a.6. The original cone triangle ends in `s[-3][1]`; its canonical
   identification with `s[-2]`, and the degree-one connecting map's target
   with `s[-1]`, are written as explicit shift isomorphisms. The generator as
   `s[-3] → s` is `Cone.deshiftTau`; shifting the triangle by three is
   normalized with the triangle isomorphism `(counit, -id, id)`.

| Mathematical step (stage 2, AI-proved) | Declaration under `FindimCounterexample` |
|---|---|
| Finite-free right-module duality | `RingDual.freeDualEquiv` |
| Evaluation for finitely generated projective right modules | `RingDual.evalEquiv` |
| Duals are finitely generated projective left modules | `RingDual.rightDual_projective`, `RingDual.rightDual_finite` |
| A split dual monomorphism gives an original split epimorphism | `RingDual.split_of_dual_split` |
| Range quotients of an exact complex give short exact sequences | `ExactCoresolution.shortExact`, `ExactCoresolution.coresolution` |
| Dual coresolution, with C₀ = P₀* and Cₙ₊₁ = Pₙ₊₁*/range dₙ* | `StrongNakayama.coresolution`, `StrongNakayama.cok` |
| C₀ is projective and C₁ is not projective | `StrongNakayama.projective_zero`, `StrongNakayama.not_projective_one` |
| Every Cₙ is finitely generated | `StrongNakayama.cok_finite` |
| Exact dimensions and unbounded finite dimensions | `StrongNakayama.projectiveDimension_eq`, `StrongNakayama.unbounded` |

| Mathematical step (stage 3a) | Declaration under `FindimCounterexample` |
|---|---|
| Ext⁰ vanishing iff the first Hom differential is injective | `ResolutionExt.ext_zero_iff_injective` |
| Positive-degree Ext vanishing iff cocycles are boundaries | `ResolutionExt.ext_succ_iff_cocycles_boundaries` |
| Full Ext/Hom-exactness equivalence for any projective resolution in an abelian category | `ResolutionExt.ext_vanishing_iff` |
| Explicit module families give Mathlib projective resolutions | `ModuleResolution.projectiveResolution` |
| Ext/Hom-exactness equivalence for explicit module families | `ModuleResolution.ext_vanishing_iff` |
| Hom into the right regular module is the stage-2 dual, with the same maps | `StrongNakayama.homRightDualEquiv`, `.homDifferential_eq_dualDifferential` |
| Ext vanishing iff stage-2 dual exactness | `StrongNakayama.ext_vanishing_iff_dual_exact` |
| Theorem 3.3: finite generation and exact projective dimensions from Ext vanishing | `StrongNakayama.projectiveDimension_eq_of_ext`, `.unbounded_of_ext` |
| Transpose of a specified presentation and its equality with the dual cokernel | `Transpose.ofPresentation`, `.cok_eq_transpose` |
| The original presentation cokernel is the resolution syzygy | `Transpose.presentationCokernelEquivSyzygy`, `.presentationCokernelIsoSyzygy` |

In sequence number n, the projective middle term is Pₙ₊₁*, not Pₙ*.
The proof uses evaluation for finite free modules and then retracts, with
Mathlib's `Module.Finite.exists_comp_eq_id_of_projective` supplying the retract.
No specific algebra or numerical value of a finitistic dimension is formalised.
The theorem asserts the existence of modules of each positive finite dimension;
it does not introduce a definition of the little finitistic dimension.

| Mathematical step (stage 4a, conditional) | Declaration under `FindimCounterexample` |
|---|---|
| Genuine Toda brackets, existence and indeterminacy coset | `Stage4a.Toda.bracket`, `.bracket_nonempty`, `.bracket_eq_coset` |
| Lemma 2.2 and independence of the chosen cone | `Stage4a.Toda.juggling`, `.bracket_eq_of_distinguished_cones` |
| Proposition 10.1: complete profile and the two map isomorphisms | `Stage4a.Cone.oneCone_profile`, `.oneCone_i_bijective`, `.oneCone_pi_bijective` (source check passed; final gates pending) |
| Proposition 10.2: rank and triangle calculation with cone inputs derived | `Stage4a.one_factor_rank` (source check passed; final gates pending) |
| Corollary 10.3: composite vanishing and rank obstruction | `Stage4a.Cone.oneCone_composite_zero`, `Stage4a.one_factor_obstruction` (source check passed; final gates pending) |
| Theorem 10.4: Tate obstruction, including definedness | `Stage4a.tate_obstruction` |
| Corollary 10.5: polynomial case in every degree `p ≥ 3` | `Stage4a.HigherObstruction.polynomial_toda_eq_zero` |

## Interface of stage 4a (conditional)

All custom structures are in `FindimCounterexample/Stage4aInterface.lean`.
The author approved the three input groups in job 16 on 2026-10-08. They are
unpacked as follows; fields listed here contain no Toda or cone conclusion.

1. Standard Mathlib parameters: a field `k`; `Category C`, `Preadditive C`,
   `Linear k C`, `HasZeroObject C`, `HasShift C ℤ`, additive shift functors,
   and `Pretriangulated C`; finite dimensionality of each `X ⟶ Y`.
   These are the approved linear pretriangulated category and Hom finiteness.
   Individual results omit standard assumptions that their proof does not use.
   Binary biproducts are supplied by Mathlib's pretriangulated instances; their
   explicit witnesses in the one-factor statements do not add an assumption.
2. `TateDuality.pairing X Y a b h` is a linear equivalence from
   `Hom(X,Y[a])` to the dual of `Hom(Y,X[b])`, for `h : a+b=-1`.
   `TateDuality.composition` states exactly `⟨ζη,τ⟩=⟨ζ,ητ⟩`.
   `TateDuality.naturality_target` spells out target naturality:
   `⟨u[a]∘f,t⟩=⟨f,t∘u⟩`; source naturality is derived from composition.
   These unpack approved input 2, report Theorem 2.1 and its pairing paragraph
   (Linckelmann, Section 2, (2.1), (2.2), (2.8)). `ShiftedHom.comp` explicitly
   inserts the inverse of `shiftFunctorAdd'`; no shift identification is an
   equality of objects. Linearity of shifts is derived, not an extra field.
3. `PolynomialSelfExtensions.basis n` is a basis of `Hom(s,s[n])` indexed
   by monomials `{m : ℕ // p*m=n}`. `basis_zero` identifies the degree-zero
   monomial with the identity, and `basis_mul` identifies products with the
   monomial whose exponent is the sum. These are the approved homogeneous
   graded-algebra isomorphism, with `p=3` for Propositions 10.1–10.3.
   For Corollary 10.5, `p≥3` is that corollary's own polynomial hypothesis.
   No negative Hom dimension or generator action is assumed; they are derived.

No model of the full polynomial/Tate/pretriangulated interface has been
constructed in Lean. The intended stable-module model requires the excluded
symmetric-algebra foundations; consistency is not certified by the gate results.
The statement listing computes transitive uses of custom interface projections
from the proof terms, including primitive projections. Standard category and
finiteness parameters are visible in the printed theorem types.

## Build and check

Lean 4.33.1 (Arch package `lean4-bin`); Mathlib pinned in `lakefile.toml` and `lake-manifest.json`.

```sh
lake build
tools/gates.sh <evidence-dir>   # source scan, build, axiom audit, statement listing, leanchecker replay
```

The build treats warnings as errors with Mathlib's standard linters. No `sorry`, custom axioms,
`native_decide` or raised heartbeat limits; all axioms lie in {propext, Classical.choice, Quot.sound}.

## Contributors and licence

Gustavo Jasso (direction, review); Claude Opus 5.5 (stage 1, statements, correspondence review);
Codex GPT-6 Astra (stage 2 proofs). Copyright: "The findim counterexample formalisation contributors".
Licence: Apache 2.0 (`LICENSE`).

## Provenance

Statements and proofs of stage 1: Claude Opus 5.5 (2026-10-07).
Stage 2: GPT-6 (Codex), effort unknown (2026-10-07), from job 09 and pinned
Mathlib sources. Report and evidence: `audit/09-lean-stage2-codex.md` and
`lean/gates/stage2-uncommitted/` in the verification repository. Correspondence
and readability review in this session used the same model as the implementation;
it is not an independent review.
Stage 3a: GPT-6 (Codex), effort unknown (2026-10-08), from job 13 and pinned
Mathlib sources. Report: `audit/13-lean-stage3a-codex.md`; evidence directory:
`lean/gates/stage3a-uncommitted/` in the verification repository.
The implementation and same-model correspondence review are not independent
reviews. Claude's stage-3a review and commit remain pending.
See `AGENTS.md` for rules.

Stage 4a: GPT-6 (Codex), effort unknown (2026-10-08), with same-model agents.
Development record: `audit/16-lean-stage4a-codex.md` in the verification repository.
Conditional input correspondence and readability review by the implementing
model are not an independent review or human certification. The resumed
source-only check covers all stated targets, with departure 4a.4. Final gates
remain pending; source checks do not replace the five acceptance gates.
