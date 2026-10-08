# Formalisation: criteria for infinite finitistic dimension

> This directory is a copy of the Lean repository `findim-counterexample-formalisation` at commit `103c2b4`,
> included so that the formal proofs can be checked. Paths such as `audit/…` and `lean/gates/…` refer to the
> root of this repository. Build from this directory with `lake build` (Lean and Mathlib versions pinned in
> `lean-toolchain` and `lake-manifest.json`).


Lean 4 formalisation accompanying the AI-assisted research record
`An-algebra-of-infinite-little-finitistic-dimension-September-23-2026` (verification of, and search for a
simpler alternative to, the OpenAI preprint *An algebra of infinite little finitistic dimension*,
2026-09-23). The development record (design, gate evidence) is (in this repository) under `lean/`.

## Scope

Stages 1–3c and 4b are unconditional formalisations down to Mathlib; stage 4a formalises
Section 10 conditionally over the approved interface below. Stages:

| Stage | Informal statement | Lean | Status |
|---|---|---|---|
| 1 | In an abelian category, short exact sequences 0 → c₀ → p₀ → c₁ → 0 and 0 → cₙ → pₙ → cₙ₊₁ → 0 with all pₙ projective, c₀ projective and c₁ not projective give pd cₙ = n for n ≥ 1 (note 02, Proposition O.4, dimension-shifting half) | `FindimCounterexample.ProjectiveCoresolution.projectiveDimension_eq` | formally verified; gates pass |
| 2 | Proposition O.4 with exactness of the dual complex stated directly: a nonzero quotient E of P₀ annihilating d₀ gives finitely generated left cokernels Cₙ of projective dimension n for every n ≥ 1 | `FindimCounterexample.StrongNakayama.projectiveDimension_eq`, `.unbounded` | AI-proved; all five gates pass; committed |
| 3a | Theorem 3.3 with Ext vanishing as its hypothesis; Ext vanishing iff Hom-complex exactness; transpose and syzygy identifications for the chosen resolution | `FindimCounterexample.ModuleResolution.ext_vanishing_iff`, `StrongNakayama.projectiveDimension_eq_of_ext`, `.unbounded_of_ext`, `Transpose.cok_eq_transpose`, `.presentationCokernelIsoSyzygy` | AI-proved; all five gates pass; committed (`394efc3`) |
| 3b | Definition 5.6, Propositions 5.9, 5.11, 5.13, 5.14 and Corollary 5.15: exact presentations, central involutions, shifts, finite quotients and the infinite central direct sum | `SelectionFinite.presentationEquiv`, `.finitelyPresented`, `SelectionGroup.z_mem_center`, `.beta`, `.directSumEquiv`, `.center_not_fg`, `FiniteQuotients.centerEquiv` | AI-proved; all five gates pass; committed |
| 3c | Section 6: finite-family right fractions, cone splitting in Karoubi, and odd doubles without the K₀ clause | `Stage3cFractions`, `Stage3cConeSplitting`, `Stage3cOddDouble` | AI-proved; all five gates pass; committed |
| 3 | Proposition O.5: an Auslander–Reiten counterexample (Λ, M) gives Ext^i_Γ(S, Γ) = 0 for all i ≥ 0, Γ = End(Λ ⊕ M)^op | — | planned |
| 4a | Section 10 obstructions over the approved Tate interface | `Stage4a.Cone.oneCone_profile`, `Stage4a.one_factor_obstruction`, `Stage4a.tate_obstruction`, `Stage4a.HigherObstruction.polynomial_toda_eq_zero` | conditional AI-proved; all five gates pass; committed |
| 4b | Proposition 5.4, abstract linear-algebra reduction: eventual orbit evaluation vanishes from dimension r onwards; natural dimension sequences with persistent zero have extinction at most r | `FindimCounterexample.RankObstruction.apply_pow_eq_zero_of_eventually`, `.apply_pow_finrank_eq_zero`, `.extinction_bound` | AI-proved; all five gates pass; committed |

Not formalised: the algebra and categorical constructions of the preprints, and any statement about a specific algebra. Stage 3b concerns only the group of report Section 5; stage 3c only abstract category lemmas of Section 6.

## Correspondence and departures

1. Stage 1 is stated in an arbitrary abelian category (more general than modules).
   The projective-dimension statements express “pd Cₙ = n” as `HasProjectiveDimensionLE Cₙ n ∧
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

8. Stage 3b represents the report's indices 1,2,3 by `Fin 3` values 0,1,2;
   a subtype of ordered pairs enforces the distinctness of W indices.
   Mathlib's commutator convention agrees definitionally with the report.
   `z N` is defined using index 0 and splitting N+0; independence of both
   choices is a theorem. The presentation imposes exactly Definition 5.6.

9. The finite quotient uses `AdjoinRoot (X^m-1 : Polynomial (ZMod 2))`
   and units of `Matrix (Fin 5) (Fin 5) S_m`, an allowed representation
   of the general linear group. Matrix positions 1,5 become 0,4, and
   the middle positions use `middle i = i.val+1`. A weighted matrix unit
   is expressed as `Matrix.single i j c`. The positive modulus is a
   natural number with `0 < m`; all root parameters remain integers.
   Only monicity is used. The finite elementary abelian group is
   `Multiplicative (Fin m → ZMod 2)`, and Z_m is a subgroup of the
   actual image F_m, with its specified generators and centrality.

10. Corollary 5.15 uses the subgroup generated by the z_N inside the
    actual centre, and identifies it with `Multiplicative (ℤ →₀ ZMod 2)`.
    The source uses residue classes of a finite interval; the proof uses
    the equivalent shift into a monic power basis with modulus `2*K+1`
    for support in `[-K,K]`. Non-finite generation is deduced through
    Noetherian integer modules, which supplies the required inheritance
    for subgroups of finitely generated abelian groups.

11. Proposition 5.9 uses the exact finite relations and fifteen generators.
    Its kernel-lattice basis calculation is replaced by the equivalent
    coordinate conjugation argument and integer iteration; the nine
    relation-transport vectors are those in the report. Both presentation
    homomorphisms and both inverse identities are checked. The pinned
    Mathlib has `Group.IsFinitelyPresented`, which is used directly;
    no substitute predicate or conditional interface is introduced.

| Mathematical step (stage 3b) | Declaration under `FindimCounterexample.SelectionGroup` |
|---|---|
| Definition 5.6: exact presentation and weights | `Relator`, `relations`, `G`, `weight`, `lift` |
| Proposition 5.11: transfer and choice independence | `commutator_transfer`, `commutator_eq_of_sum`, `z_eq` |
| Proposition 5.11: central involutions | `z_mem_center`, `z_sq` |
| Proposition 5.13: shifts, composition, identity, effect on z | `beta`, `beta_add`, `beta_zero`, `beta_z`, `alpha_z` |
| Corollary 5.15: the actual central direct sum and its generators | `centralSum_injective`, `centralProduct_range`, `centralSubgroup_map`, `directSumEquiv`, `directSumEquiv_single` |
| Corollary 5.15: the centre is not finitely generated | `center_not_finitelyGenerated`, `center_not_fg` |

| Mathematical step (stage 3b, presentations and finite quotients) | Declaration under `FindimCounterexample` |
|---|---|
| Proposition 5.9: exact fifteen-generator finite presentation | `SelectionFinite.Generator`, `.card_generator`, `.relationWord`, `.relations_finite`, `.P` |
| Proposition 5.9: presentation isomorphism and generator images | `SelectionFinite.presentationEquiv`, `.presentationEquiv_T`, `.presentationEquiv_root0` |
| Proposition 5.9: Mathlib finite-presentability predicate | `SelectionFinite.finitelyPresented` |
| Monic quotient ring, power basis, unit t and finite coefficients | `FiniteQuotientRing.S`, `.basis`, `.t`, `.finite`, `.linearIndependent_tPow` |
| Proposition 5.14: homomorphism and specified generator images | `FiniteQuotients.pi`, `.pi_T_matrix`, `.pi_U_matrix`, `.pi_V_matrix`, `.pi_W_matrix` |
| Proposition 5.14: image of z_N, finite range and centrality | `FiniteQuotients.pi_z_matrix`, `.finite_F`, `.z_image_mem_center` |
| Proposition 5.14: specified elementary abelian subgroup | `FiniteQuotients.coordinates_injective`, `.coordinates_range`, `.centerEquiv`, `.centerEquiv_generator`, `.Z_le_center` |
| Finite quotients detect all finite integer supports | `FiniteQuotientRing.eq_zero_of_bounded_sum`, `.eq_zero_of_all_sums` |

4b.1. Stage 4b formalises the abstract reduction in Proposition 5.4. It takes
an endomorphism and linear functionals as data. The connection to K₀, the
construction of the visible space, descent of the endomorphism through rank
functions, and identification with actual dimensions remain outside its scope.
Corollary 5.5 is not formalised.

4b.2. The linear-algebra core works over every field and does not require
the vector to span the whole space under iteration. It gives vanishing at
every time at least `Module.finrank K V`, including dimension zero.

4b.3. The proof restricts to the span of the orbit and applies Mathlib's
kernel-stabilization theorem to the dual endomorphism. This replaces the
report's Fitting decomposition; no nilpotence or decomposition is assumed.

4b.4. The numerical theorem uses ℚ and explicitly casts natural dimensions
to ℚ in the evaluation identity. Its zero-successor hypothesis expresses
dimension-zero detection and `H(0) = 0`. It assumes neither an extinction
bound nor a separating family of functionals.

4b.5. Finite extinction is expressed by `∃ t₀, d Y t₀ = 0`, and the conclusion
is `d Y t = 0` for every `t ≥ Module.finrank ℚ V`. There is no separate
least-time or infinite-value definition. Times start at zero.

Stage 3c departures (the numbers of earlier stages are retained):

- **3c.1.** The K₀ clause of Proposition 6.7 and subsequent assertions about
  classes are omitted, as explicitly required by job 15.
- **3c.2.** Lemma 6.1 is stated for any localisation with a right calculus of
  fractions. Its second item uses preadditive categories and an additive
  functor, as implied by the report's linearity assumptions. Finite-set
  induction replaces the proof via finite biproducts; no finite-biproduct,
  triangulation or essential-smallness hypothesis is needed. Both induction
  base cases use the identity denominator for the empty family.
- **3c.3.** Lemma 6.6 and Proposition 6.7 use a pretriangulated category;
  neither the octahedral axiom, essential smallness nor linearity over a field
  is needed. Shifts on Karoubi are the explicit functors
  `Stage3cKaroubi.shift n`, extending the original shifts on both objects
  and morphisms. Their additivity, comparison with embedded objects and
  comparison for successive shifts are derived. No `Pretriangulated` or
  `HasShift` instance on Karoubi is assumed or installed.
- **3c.4.** The cone-splitting proof constructs both inverse maps from Hom
  exactness, instead of finishing with Yoneda detection. The odd-double
  construction follows the report's two cones, with classical choices for
  cones and splittings. A formal summand is an arbitrary `U : Karoubi C`,
  which packages exactly the report's object, idempotent and idempotency equation.

| Mathematical step (stage 3c) | Declaration under `FindimCounterexample` |
|---|---|
| Lemma 6.1(1): one denominator for a finite family with varying targets | `Stage3cFractions.exists_common_denominator` |
| Simultaneous equalisation of a finite family in a localisation | `Stage3cFractions.exists_equalising_denominator` |
| Lemma 6.1(2): simultaneous annihilation after precomposition | `Stage3cFractions.exists_annihilating_denominator` |
| Extended shifts on Karoubi and their comparisons | `Stage3cKaroubi.shift`, `.shiftToKaroubiIso`, `.shiftAddIso` |
| Hom exactness for formal summands as source | `Stage3cKaroubi.lift_exact`, `.coyoneda_exact₂`, `.coyoneda_exact₃`, `.coyoneda_exact₁` |
| Lemma 6.6: the actual splitting isomorphism | `Stage3cConeSplitting.coneSplittingIso` |
| Proposition 6.7: the first cone and its isomorphism | `Stage3cOddDouble.firstDouble` |
| Proposition 6.7: the second cone and its isomorphism | `Stage3cOddDouble.thirdDouble` |
| Proposition 6.7 without its K₀ clause | `Stage3cOddDouble.exists_odd_doubles` |

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

| Mathematical step (stage 4b, AI-proved) | Declaration under `FindimCounterexample.RankObstruction` |
|---|---|
| Eventually vanishing orbit evaluation vanishes for all times at least the ambient dimension, over any field | `apply_pow_eq_zero_of_eventually` |
| Vanishing at the dimension itself | `apply_pow_finrank_eq_zero` |
| A natural dimension sequence represented by rational evaluation, with persistent zero, has extinction at most the ambient dimension | `extinction_bound` |

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
| Proposition 10.1: complete profile and the two map isomorphisms | `Stage4a.Cone.oneCone_profile`, `.oneCone_i_bijective`, `.oneCone_pi_bijective` |
| Proposition 10.2: rank and triangle calculation with cone inputs derived | `Stage4a.one_factor_rank` |
| Corollary 10.3: composite vanishing and rank obstruction | `Stage4a.Cone.oneCone_composite_zero`, `Stage4a.one_factor_obstruction` |
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
`lean/gates/stage2-uncommitted/` (in this repository). Correspondence
and readability review in this session used the same model as the implementation;
it is not an independent review.
Stage 3a: GPT-6 Astra (Codex), effort ultra (2026-10-08), from job 13 and pinned
Mathlib sources. Report: `audit/13-lean-stage3a-codex.md`; evidence directory:
`lean/gates/stage3a-uncommitted/` (in this repository).
The implementation and same-model correspondence review are not independent
reviews. Statements reviewed by Claude Opus 5.5 and committed (`394efc3`); evidence
of the committed state: `lean/gates/stage3a-394efc3/`.
See `AGENTS.md` for rules.

Stage 3b: GPT-6 Astra (Codex), effort ultra (2026-10-08), job 14.
Report: `audit/14-lean-stage3b-codex.md` (in this repository).
Acceptance evidence: `lean/gates/stage3b-uncommitted/` (in this repository).
All six requested group items are implemented unconditionally; all five gates pass.
The stage adds 2,137 lines in 16 modules (maximum 232 lines per module).
The final audit covers 775 project declarations, including 524 theorems;
kernel replay and the post-run source-hash check pass.
Parallel correspondence review uses the same model family and is not an
independent model review or author certification. Statements reviewed by
Claude Opus 5.5 against the report (relations of Definition 5.6 and of
Proposition 5.9 one by one) and committed.

Stage 4b: GPT-6 Astra (Codex), effort ultra (2026-10-08), from job 17, the report's
Proposition 5.4 and pinned Mathlib sources. Report and implementation design:
`audit/17-lean-stage4b-codex.md`; all five gates passed, with evidence in
`lean/gates/stage4b-uncommitted/` (in this repository).
Same-model search and correspondence reviews are not independent-model reviews
or human certification. Statements reviewed by Claude Opus 5.5 and committed.

Stage 3c: GPT-6 Astra (Codex), effort ultra (2026-10-08), with same-model
subagents, from job 15, the report's Section 6 and the pinned Mathlib sources.
Report: `audit/15-lean-stage3c-codex.md`; all five gates passed, with evidence in
`lean/gates/stage3c-uncommitted/` (in this repository).
The four new mathematical modules total 560 lines. The exhaustive axiom audit
covers 192 declarations in the complete library; all transitive axioms are
among `propext`, `Classical.choice` and `Quot.sound`. Kernel replay covers all
14 project modules, including the root. Statements reviewed by Claude Opus 5.5 and committed.
The implementation and same-model correspondence review are not independent
reviews or author certification. The local ignored Lake package override uses
a private copy of the pinned Mathlib to compile missing modules without
writing the shared package tree; the pinned configuration files are unchanged.

Stage 4a: GPT-6 Astra (Codex), effort ultra (2026-10-08), with same-model agents.
Development record: `audit/16-lean-stage4a-codex.md` (in this repository).
Conditional input correspondence and readability review by the implementing
model are not an independent review or human certification. All five acceptance
gates passed on 2026-10-08 for the uncommitted sources: source scan, warnings-as-errors
build, exhaustive axiom audit, statement/interface-projection listing, and imported
kernel replay. The audit covered 368 declarations, including 271 theorems; the
stage-4a modules contribute 222 declarations, including 170 theorems. Evidence is
`lean/gates/stage4a-uncommitted/` (in this repository). Departure 4a.4
remains: the Section 8 comparison and Ext¹ consequences are not formalised.
Statements and interface reviewed by Claude Opus 5.5 and committed; not reviewed by the author.
