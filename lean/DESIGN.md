# Formalisation design (Phase 5)

Claude Opus 5.5, 2026-10-07. Rules: `docs/WORKING_RULES.md` (LEAN_FORMALISATION summary). Gustavo delegated
the choice between unconditional and conditional formalisation.

## Scope decision

No small concrete counterexample has been found (see `REPORT.md` when written, and the ledger). The
elementary core of this task consists of general implications, which can be formalised **unconditionally**,
down to Mathlib, without any interface hypotheses:

| Stage | Statement (informal) | Source | Formal setting |
|---|---|---|---|
| 1 | Let 0 → P⁰ → P¹ → P² → ⋯ be exact with all Pⁱ projective, and C₁ = coker(P⁰ → P¹) not projective. Then the cokernels C_n satisfy pd C_n = n for all n ≥ 1. | O.4 (second half) | an abelian category with enough projectives and `HasExt`; `HasProjectiveDimensionLT` |
| 2 | (O.4) For a ring A and a f.g. right module E ≠ 0 with Ext^i(E, A) = 0 for all i ≥ 0 and a resolution by f.g. projectives, the left modules C_n (cokernels of the dualised resolution) have pd C_n = n; hence unbounded finite projective dimensions. | O.4 | `ModuleCat`, `Module.Dual`, f.g. projective modules |
| 3 | (O.5) If M is a nonprojective module with Ext^{≥1}(M, M ⊕ Λ) = 0, the Γ-module S = coker(Hom(G, P(M)) → Hom(G, M)) for G = Λ ⊕ M satisfies Ext^i_Γ(S, Γ) = 0 for all i ≥ 0. | O.5 | to be designed after stage 2 |

**Excluded** (recorded, not coverage): the preprints' constructions (Abels group, Verdier quotient, the
Auslander–Reiten algebra of dimension ≈ 10³⁵), the finitistic dimension of any specific algebra, and the
computational results (supported by scripts, not by proofs).

**Departures** (to be extended): stage 1 is stated for any abelian category with enough projectives, which
is more general than the informal version; stage 2 may be stated for f.g. projective resolutions over an
arbitrary ring (no finite-dimensionality needed) if the proof allows.

## Setup

- Repository: `findim-counterexample-formalisation`
  (own git repository, local; its sources are included in this repository as `lean/formalisation/`).
- Lean 4.33.1 (Arch `lean4-bin`), Mathlib pinned to `0df444a360eaa60ab8c11dca51a86af692955474` (a commit
  already built locally against this toolchain); fetch only the needed prebuilt files; ≤ 5 GB.
- Gates (LEAN_FORMALISATION §6): source scan, build with warnings as errors, axiom report ⊆ {propext,
  Classical.choice, Quot.sound}, statement listing, `leanchecker` replay; evidence in `lean/gates/` here.
- Work split: statements and correspondence by Claude; proof engineering by Codex (job queue, resumable);
  correspondence review by the model that did not write the statements.

## Stage 2 implementation (job 09, 2026-10-07)

GPT-6 (Codex), effort unknown. Mathematical status: AI-proved; all five acceptance gates
passed in `lean/gates/stage2-uncommitted/`; not author-certified. Full record: `audit/09-lean-stage2-codex.md`.

The Lean representation is an explicit family of right modules `P n` and maps
`d n : P (n+1) →ₗ[Aᵐᵒᵖ] P n`. Each term has the standard Mathlib
`Module.Finite` and `Module.Projective` instances. Duals take values in the
regular bimodule `A`: `P →ₗ[Aᵐᵒᵖ] A`, with left multiplication on values.
The second dual consists of left-linear maps to `A`, acted on by right
multiplication. No commutativity instance is assumed.

`Duality.lean` constructs the finite-free dual isomorphism and evaluation
bijectivity, then passes to projective retracts using Mathlib's finite-free
retract theorem. It also transfers a retraction of the dual map to a section
of the original map. `ExactCoresolution.lean` constructs actual range quotients
and their short exact sequences. `StrongNakayama.lean` applies these to the
dual family and invokes the unchanged stage 1 theorem.

Numbered departures (matching the Lean README):

1. The exact dimension conclusion retains stage 1's conjunction of the upper
   bound `HasProjectiveDimensionLE` and the negation of `HasProjectiveDimensionLT`.
2. Dual exactness is stated as injectivity in degree zero and range = kernel in
   later degrees. The equivalence with Ext vanishing is excluded by the job.
3. The ring is arbitrary; finite dimensionality and commutativity are not assumed.
4. The right resolution is represented by an indexed family. Its exactness is
   weakened to the properties used: a surjection `ε : P₀ → E` onto a nontrivial
   right module and `ε ∘ d₀ = 0`. Higher right exactness and exactness at `P₀`
   are unnecessary for the conclusion. This removes hypotheses, without assuming
   any new mathematical facts through an interface.

The cokernel convention is `C₀ = P₀*` and
`Cₙ₊₁ = Pₙ₊₁* / range(dₙ*)`; the projective middle term in short exact sequence
number n is `Pₙ₊₁*`. All cokernels are also finitely generated. The final
`StrongNakayama.unbounded` theorem quantifies over every positive integer and
returns a finitely generated left module of that exact projective dimension.
A numerical definition of little finitistic dimension and a concrete algebra
are not part of this stage. There are no conditional library interfaces.

## Stage 3 decision (2026-10-07, Claude)

Stage 3 (O.5) is deferred. It needs Ext over Γ = End(G)^op computed from add G-resolutions (Yoneda on add G,
exactness transfer), i.e. infrastructure comparable to or larger than stage 2, while the mathematical
content is classical (Auslander–Reiten 1975) and already AI-verified. Usage is better spent on the search.
It will be reconsidered if a concrete candidate emerges whose proof uses O.5.

## Stage 3a (approved by Gustavo, 2026-10-08)

Scope: `lean/FEASIBILITY-report.md`, stage 3a — complete Theorem 3.3 of the report: Ext vanishing ⇔ exactness of
the Hom complex of a projective resolution (Mathlib's Ext), the theorem with its actual hypothesis, and the
transpose identification (without minimality; departure). Unconditional. Implementation delegated to Codex
(job 13, ultra); statements and correspondence reviewed by Claude; gates in `lean/gates/stage3a-*`. Other stages
not approved.

### Stage 3a implementation (job 13, 2026-10-08)

GPT-6 Astra (Codex), effort ultra. Formally verified in Lean; all five acceptance gates pass. The receipt is
recorded in `audit/13-lean-stage3a-codex.md`, `lean/gates/stage3a-uncommitted/` (before the commit) and
`lean/gates/stage3a-394efc3/` (the committed state, commit `394efc3` of the Lean repository); statements
and correspondence reviewed by Claude Opus 5.5.

Mathlib's `ProjectiveResolution.extMk_eq_zero_iff` and `extMk_surjective`
provide the positive-degree comparison directly. Degree zero uses `Ext⁰=Hom`
and the augmentation's cokernel property. `ResolutionExt.lean` gives the full
equivalence in an abelian category. `ModuleResolution.lean` packages the
indexed family as a standard Mathlib resolution; `ModuleResolutionExt.lean`
then gives the explicit additive range–kernel version. The comparison itself,
including this bridge, uses 274 new lines, below the job's stopping bound.

`StrongNakayamaExt.lean` identifies the Hom differentials into the regular
right module with the stage-2 dual differentials and applies the unchanged
stage-2 dimension theorem. `Transpose.lean` identifies its dual cokernels
with the transposes of the resolution presentations, and the original
presentation cokernels with the chosen resolution's syzygies.

Departures 1–4 above remain the stage-2 correspondence record. Departure 2's
excluded comparison is now supplied by stage 3a. Additional departures,
numbered as in the Lean README:

5. The original resolution's full exactness and surjective augmentation are
   explicit hypotheses of stage 3a, internally packaged as Mathlib's
   `ProjectiveResolution`. Both directions, including degree zero, are covered.
   Hom exactness is additive; the regular-target dual maps also carry their
   stage-2 left-module structure.
6. Transposes and syzygies are relative to the supplied presentation and
   resolution. Minimal presentations, projective covers and independence of
   these choices are not formalised. For `n ≥ 1`, the statement identifies
   `Cₙ` with the transpose of `Pₙ→Pₙ₋₁`, presenting the chosen `Ωⁿ⁻¹E`.
7. The general module comparison uses `[Small.{v} R]` for Mathlib's Ext
   instance. The strong-Nakayama application places the ring and its modules
   in one universe so that the regular target belongs to the same category.
   These are size conventions; no commutativity or finite-dimensionality
   assumption is added. Stage 2's separate universes are unchanged.

No later stage, concrete algebra, or numerical definition of finitistic
dimension is included. Same-model correspondence review is not an independent
review or human certification.

### Stage 3b (approved 2026-10-08)

Approved by Gustavo on 2026-10-08: the group of report §5 (Definition 5.6, Propositions 5.9, 5.11, 5.13,
5.14, Corollary 5.15), unconditional, down to Mathlib. Implementation delegated to Codex (job 14, ultra);
statements and correspondence reviewed by Claude; gates in `lean/gates/stage3b-*`. Other stages not approved.

### Stage 3b implementation (job 14, 2026-10-08)

GPT-6 (Codex), effort unknown. Status: AI-proved, unconditionally down to
the pinned Mathlib. All requested group statements are implemented; all five
acceptance gates passed. Report: `audit/14-lean-stage3b-codex.md`.
Final evidence: `lean/gates/stage3b-uncommitted/`; 775 project declarations
(524 theorems), allowed axioms only, full kernel replay, source hashes rechecked.
No stage-3b commit has been made. Same-model correspondence checks are not
independent model reviews or author certification; Claude's review is pending.

The implementation defines G by exactly Definition 5.6, constructs its
central involutions and shift automorphisms, and constructs the specified
matrix homomorphisms over `AdjoinRoot (X^m-1 : Polynomial (ZMod 2))` for
every positive m. Monic division supplies the coefficient basis; no
irreducibility, squarefreeness or domain hypothesis is used. The image
subgroups and the infinite central direct sum are actual subgroup closures,
with explicit isomorphisms and generator correspondence. The centre's
non-finite generation uses Noetherian integer modules. The exact finite
presentation on fifteen generators is separately defined and its isomorphism
with G is checked in both directions. Mathlib's `Group.IsFinitelyPresented`
is used, so the fallback predicate from the job is unnecessary.

Numbered departures, continuing the Lean README's existing 1–7:

8. Report indices 1,2,3 are `Fin 3` values 0,1,2; distinct W pairs form a
   subtype. The commutator convention agrees definitionally. The chosen
   definition of z_N uses index 0 and splitting N+0, and independence of
   both choices is a theorem. No relations are added to G.
9. Matrix groups are units of square matrices, an allowed representation
   of `GL₅`. Positions 1,5 become 0,4, and weighted matrix units use
   `Matrix.single`. The modulus is a natural number with `0 < m`; root
   parameters remain integers. The finite elementary abelian group is
   `Multiplicative (Fin m → ZMod 2)`; its target subgroup lies in the
   actual finite image.
10. Corollary 5.15 uses `Multiplicative (ℤ →₀ ZMod 2)`. Finite supports in
    `[-K,K]` are detected by modulus `2*K+1` after shifting to the monic
    power basis. This is the report's residue-separation argument in
    bounded-support form. Noetherian integer modules give the required
    inheritance of finite generation for abelian subgroups.
11. For the finite presentation, coordinate conjugation and integer
    iteration replace the explicit weight-kernel lattice basis calculation.
    The same nine transport vectors yield all parameterised relations.
    The two presentations, their relation sets and final isomorphism are
    unchanged mathematically. No conditional interface is introduced.

All stages 1, 2 and 3a declarations and the toolchain/dependency pins remain
unchanged. The new stage comprises 16 Lean modules and 2,137 lines, with
at most 232 lines per new module. No stopping-rule exception was needed.

### Stages 3c, 4a, 4b (approved 2026-10-08)

Approved by Gustavo on 2026-10-08 ("Execute formalisation tasks 3c, 4a and 4b"), as proposed in
`lean/FEASIBILITY-report.md`:

- 3c: report §6, Lemma 6.1, Lemma 6.6, Proposition 6.7 without its K₀ clause; unconditional. Codex job 15.
- 4a: report §10, Propositions 10.1, 10.2, Corollary 10.3, Theorem 10.4, Corollary 10.5; **conditional** on
  exactly the three interface fields listed in `lean/FEASIBILITY-report.md` (k-linear pretriangulated
  category with finite-dimensional Homs; composition-compatible perfect Tate pairing; an object s with graded
  endomorphism algebra k[τ], |τ| = 3). Claude reads the instruction to execute the stage as proposed as the
  approval of these three fields (LEAN_FORMALISATION §2.4); any further field stops the item and goes back
  to Gustavo. Codex job 16.
- 4b: the proof of Proposition 5.4 in abstract linear algebra (a reduction; no link to K₀). Codex job 17.

Jobs 15–17 run in parallel with job 14 (stage 3b, main checkout), each in its own git worktree of the Lean
repository (`findim-worktrees/stage{3c,4a,4b}`, branches
`stage3c`, `stage4a`, `stage4b` from `394efc3`, `.lake/packages` symlinked to the main checkout's), so that
their builds and gate runs do not interfere. Claude reviews and merges the branches.

### Stage 3c implementation record (job 15)

GPT-6 (Codex), effort unknown, 2026-10-08. Incremental record:
`audit/15-lean-stage3c-codex.md`; final gate destination:
`lean/gates/stage3c-uncommitted/`. Implementation is unconditional; the
manuscript and earlier-stage statements are unchanged.

Stage-specific departures, matching the stage3c README:

- **3c.1.** The K₀ clause of Proposition 6.7 and following class assertions
  are excluded by the author's task; they are not claimed as formalised.
- **3c.2.** Lemma 6.1 uses an arbitrary localisation with a right calculus
  of fractions, and preadditive categories and an additive functor for its
  zero-morphism assertion. Its simultaneous-annihilation proof uses successive
  equalisation instead of a finite biproduct, so no biproduct or triangulation
  assumption is needed. Empty families use the identity denominator.
- **3c.3.** The cone splitting and odd doubles use only a pretriangulated
  category; the octahedral axiom, essential smallness and field linearity are
  unnecessary. Karoubi shifts are explicit extended functors with their
  additivity, embedding comparisons and iterated-shift comparisons derived;
  no shift or triangulation typeclass on Karoubi is postulated.
- **3c.4.** Cone splitting constructs inverse maps from Hom exactness instead
  of finishing with Yoneda detection. The two-cone construction uses classical
  choices of cones and splittings. `U : Karoubi C` packages the report's object
  and idempotent; no existence of an odd double is assumed.

The shared package cache lacked four compiled idempotent-completion modules.
A local ignored Lake package override points to a private copy of the same
pinned Mathlib revision; all new dependency outputs go there. The shared
package symlink and the three pinned configuration files remain unchanged.

Stage 3c acceptance (2026-10-08): all five gates pass in the stage3c worktree,
with evidence in `lean/gates/stage3c-uncommitted/`. The four new mathematical
modules contain 560 lines. The exhaustive axiom audit covers 192 declarations
in the complete library and only the three permitted axioms; kernel replay
covers all 14 project modules. The repaired odd-double construction is
integrated. Status: AI-proved, uncommitted; same-model correspondence review
is complete, and Claude's review and merge remain pending. No in-scope gap
remains; the K₀ clause remains excluded coverage.

### Stages 3b and 4b done (2026-10-08)

- 3b: Codex job 14 (GPT-6 Astra, ultra), 2 137 lines in 16 modules; statements reviewed by Claude Opus 5.5
  (the relations of Definition 5.6 and of Proposition 5.9 one by one, the matrices of Proposition 5.14);
  committed `73be322` in the Lean repository. Departures in the Lean README.
- 4b: Codex job 17 (GPT-6 Astra, ultra), 140 lines; slightly more general than the report (any field, no
  cyclicity; kernel stabilisation on the dual replaces the Fitting decomposition); committed `762d41a` on
  branch `stage4b`, merged into `main` as `3653ed3`.
- Gates 1–5 on the merged `main` (stages 1, 2, 3a, 3b, 4b): all pass; 779 declarations audited, axioms only
  propext, Classical.choice, Quot.sound (`lean/gates/main-3653ed3/`).

### Stage 3c done (2026-10-08)

Codex job 15 (GPT-6 Astra, ultra; three attempts, the job being interrupted and resumed), 560 lines in 4 modules; statements reviewed by Claude Opus 5.5 against
Lemma 6.1, Lemma 6.6 and Proposition 6.7 (objects and isomorphisms constructed; K₀ clause omitted, departure
3c.1); committed `40a12e5` on branch `stage3c`, merged into `main` as `3080334`. Gates 1–5 on `main`
(stages 1, 2, 3a, 3b, 3c, 4b): all pass; 825 declarations audited, axioms only propext, Classical.choice,
Quot.sound (`lean/gates/main-3080334/`). The merged worktrees of 3c and 4b were removed (3c had kept a private
3.4 GB Mathlib copy, above the 5 GB project limit together with the main checkout).

### Stage 4a done (2026-10-08); all approved stages complete

Codex job 16 (GPT-6 Astra, ultra; three attempts, as for job 15), 1 599 lines in 9 modules. Claude Opus 5.5
reviewed the interface file line by line: the only custom structures are `TateDuality` (pairing,
composition compatibility, target naturality — the content of report Theorem 2.1 and the pairing after
it; source naturality and linearity of shifts are derived) and `PolynomialSelfExtensions` (monomial
bases of Hom(s, s[n]) for n ≥ 0, unit, multiplication); Mathlib's `Linear`, `Pretriangulated` and
`FiniteDimensional` supply field 1. Statements reviewed against Propositions 10.1, 10.2, Corollary 10.3,
Theorem 10.4, Corollary 10.5; departures 4a.1–4a.6 in the Lean README (notably 4a.4: no Ext¹ clause, δ⁰
not identified with the §8 map). Committed `363ef0b` on `stage4a`, merged as `103c2b4`.

Final gates on `main` at `103c2b4` (stages 1, 2, 3a, 3b, 3c, 4a, 4b; 5 352 lines of Lean): all five pass;
1 047 declarations audited, axioms only propext, Classical.choice, Quot.sound (`lean/gates/main-103c2b4/`).
All worktrees removed; the branches `stage3c`, `stage4a`, `stage4b` are merged. Stage 3d not approved.
