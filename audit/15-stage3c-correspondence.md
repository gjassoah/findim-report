Model: GPT-6 (Codex); effort: unknown.

# Stage 3c correspondence review

This is a fresh, adversarial source review by a separate same-model agent.
It is not an independent-model review, kernel-check receipt, or human certification.
No implementation report or build output was used as evidence for correspondence.
The reviewer did not build or modify Lean sources. Mathematical judgments below
have status **supported** by source inspection; compilation and axiom acceptance
remain the responsibility of the stage's gates.

## Lemma 6.1: finite right fractions

Reviewed on 2026-10-08:

- Report: `report/sections/06-realisation.tex`, lines 48–103,
  SHA-256 `6cb08176ad1b01f4a620a0ead3c2932f2631ab5b99636c7e51f3d2f32e797750`.
- Lean worktree: `FindimCounterexample/Stage3cFractions.lean`, 112 lines,
  SHA-256 `23c2736162d97bacacbb3f4f5c9a629d7a84a06190109669ddd75b3477df4663`.
- Scope: job 15 and the Lemma 6.1 inventory row explicitly request the abstract
  localisation version and the empty-family case.

**Verdict: no correspondence defect found.** Both requested conclusions are
present, with the quantifier order and morphism directions of the report.

| Check | Source-based finding |
|---|---|
| Genuine localisation | The hypotheses are Mathlib's `[L.IsLocalization W]` and `[W.HasRightCalculusOfFractions]`. They do not assume any finite-family conclusion. The latter includes identity and composition closure and the ordinary right Ore/equalisation conditions. |
| Item 1 quantifiers | `exists_common_denominator` takes an arbitrary finite index type, one source `X`, varying targets `Y i`, and arbitrary maps `L.obj X ⟶ L.obj (Y i)`. It concludes one `X'` and one `u : X' ⟶ X` in `W`, followed by an actual entire family `f : ∀ i, X' ⟶ Y i`. Thus the denominator is chosen before and uniformly for all indices. |
| Item 1 direction | Its equality is `γ i = (Localization.isoOfHom L W u hu).inv ≫ L.map (f i)`. Mathlib's `≫` reads left to right, so this is exactly the report's right-to-left product `q(f_i) q(u)⁻¹`. The inverse has source `L.obj X`, not `L.obj X'`. |
| Item 1 construction | The finite-set induction starts with `X, 𝟙 X`. For an inserted index it obtains an individual roof from `Localization.exists_rightFraction`, then uses `LeftFraction.exists_rightFraction` to refine the previous and new denominators. The new denominator is `ψ.s ≫ u`, whose membership in `W` follows from the two known memberships. No unproved membership for the other Ore leg is used. |
| Item 2 quantifiers and direction | `exists_annihilating_denominator` takes maps `g i : X ⟶ Y i` whose images are zero, and concludes a single `u : X' ⟶ X` in `W` with `u ≫ g i = 0` for all indices. This is the report's `g_i u = 0`; no target denominator or reversed composition has been substituted. |
| Item 2 hypotheses | `[Preadditive C]`, `[Preadditive D]` and `[L.Additive]` supply zero morphisms, zero composition and preservation of zero. They hold in the report's linear Verdier quotient setting. No biproduct, projectivity, compactness, finiteness of Hom spaces, or splitting assumption is added. |
| Empty family | There is no nonemptiness hypothesis on `ι`. Both finite-set inductions explicitly use the identity denominator in their empty branch. Passing through `Fintype.ofFinite` and `Finset.univ` covers empty types; the family of numerators is empty in that case. |
| Equality criterion | The auxiliary equalisation theorem uses the forward implication of Mathlib's `map_eq_iff_precomp` on already precomposed maps and then composes denominators. It does not replace localisation equality by a stronger faithfulness assumption. |

Relevant pinned-Mathlib declarations inspected directly:

- `CategoryTheory/Localization/CalculusOfFractions.lean`:
  `HasRightCalculusOfFractions` (line 207),
  `LeftFraction.exists_rightFraction` (line 230),
  `Localization.exists_rightFraction` (line 966), and
  `MorphismProperty.map_eq_iff_precomp` (line 984).
- `CategoryTheory/Localization/Predicate.lean`:
  `Localization.isoOfHom` and its inverse/hom identities.
- `CategoryTheory/Preadditive/AdditiveFunctor.lean`:
  `Functor.Additive` and `preservesZeroMorphisms_of_additive`.

The abstract categorical generality is the explicitly approved formulation,
rather than a loss of the report's triangulated instance. The implementation
does not separately construct a Verdier quotient or prove the triangulated
subcategory's denominator class satisfies the calculus; job 15 requests the
abstract theorem with that standard Mathlib hypothesis.

The proof route for item 2 differs from the report: simultaneous equalisation
by finite induction replaces passage through a finite biproduct. This removes
an unused biproduct hypothesis and should be documented as a proof-route
departure. It does not change the conclusion.

## Lemma 6.6: cone splitting

**Verdict: no correspondence defect found in the declarations or mathematical
proof route.** The final source difference check is complete for the worktree
snapshot identified below. This is a source-correspondence judgment and does
not assert a build or gate result.

Reviewed source: `Stage3cKaroubi.lean` and `Stage3cConeSplitting.lean` in the
Lean worktree, against `report/sections/06-realisation.tex`, lines 288–342.

The declaration `Stage3cConeSplitting.coneSplittingIso` takes a distinguished
triangle `T` in `C`, two decompositions
`K(T.obj₁) ≅ I ⊞ A` and `K(T.obj₂) ≅ I ⊞ B`, where `K = toKaroubi C`, and
the assertion that its first map has matrix identity on the common `I` and
zero on the complements. It returns an actual isomorphism
`K(T.obj₃) ≅ B ⊞ (Stage3cKaroubi.shift 1).obj A`.

| Check | Source-based finding |
|---|---|
| Ambient hypotheses | The result requires `Preadditive C`, `HasZeroObject C`, `HasShift C ℤ`, additivity of the shifts, and `Pretriangulated C`. These are the components of Mathlib's pretriangulated setting. It does not require `IsTriangulated C`, essential smallness, idempotent completeness of `C`, or any triangulation of `Karoubi C`. Thus it covers the report's triangulated setting with weaker hypotheses. |
| Biproduct availability | The theorem has no additional finite-biproduct premise. Pinned `Pretriangulated.lean` constructs `HasBinaryBiproducts C` and `HasFiniteBiproducts C`; Mathlib's idempotent-completion API then supplies finite biproducts in `Karoubi C`. The local `karoubi_hasBinaryBiproducts` only exposes the standard finite-to-binary bridge. |
| Matrix direction | With `e1 : K X₁ ≅ I ⊞ A` and `e2 : K X₂ ≅ I ⊞ B`, the equation `e1.inv ≫ K.map f ≫ e2.hom = biprod.fst ≫ biprod.inl` is an equality of maps `I ⊞ A ⟶ I ⊞ B`. It projects to `I` and includes into the target's first summand. This is precisely the report's identity-on-`I`, zero-elsewhere matrix. |
| Output | The output order is target complement `B`, followed by source complement shifted by positive one. There is no interchange of source and target, negative shift, or replacement of the original cone object. |
| Extended shifts | `shift n` is the extension of `shiftFunctor C n` through `functorExtension₂ C C`. The three explicit lemmas identify its underlying object, idempotent, and map as `P.X⟦n⟧`, `P.p⟦n⟧'`, and `f.f⟦n⟧'`. Thus it implements exactly `(Z,p)[n] = (Z[n],p[n])`, without assuming that an abstract endofunctor has this behavior. |
| Shift comparison | `shiftToKaroubiIso n X` identifies `K(X[n])` with `shift n (K X)` and both underlying comparison maps are identities. Both naturality directions are supplied. `shiftAddIso m n P` has direction `shift n (shift m P) ≅ shift (m+n) P`, obtained from the original shift's addition isomorphism. No full `HasShift (Karoubi C) ℤ` instance or coherence theorem is asserted; the needed explicit comparisons are supplied. |
| Exactness on Karoubi sources | `lift_exact` takes an ordinary lift `b : P.X ⟶ X` and constructs the Karoubi morphism with underlying map `P.p ≫ b`. The identity `P.p ≫ a.f = a.f` establishes the desired factorisation. This is the report's direct-summand exactness argument written on representatives. |
| Exactness is derived | `coyoneda_exact₂`, `coyoneda_exact₃`, and `coyoneda_exact₁` invoke `lift_exact` with the corresponding pinned-Mathlib distinguished-triangle theorems. The main cone result passes these derived theorems to its splitting helper. No Hom-exactness assertion is a premise of `coneSplittingIso`. |
| Splitting construction | The general helper constructs a section `s` of `b`, factors `𝟙 X - b ≫ s` through `a` to obtain `r`, and constructs mutually inverse maps `biprod.lift r b` and `biprod.desc a s`. Thus the requested isomorphism is constructed from the proved exactness, not assumed under another name. |
| Complementary retracts | The source complement maps are shifted and transported through `shiftToKaroubiIso` in the correct directions: `iA = S.map iA₀ ≫ eS.inv`, `pA = eS.hom ≫ S.map pA₀`. The triangle's zero composites and source/target projector identities give all retract and annihilation equations consumed by the helper. |

The split-exactness helper accepts exactness as premises because it is a
general categorical lemma. This is not a conditionalisation of Lemma 6.6:
all three required exactness premises are discharged in the main declaration
using the proved Karoubi-source exactness theorems.

Pinned Mathlib inspected directly for this review:

- `CategoryTheory/Idempotents/FunctorExtension.lean`:
  `functorExtension₁`, `functorExtension₂`, and
  `functorExtension₂CompWhiskeringLeftToKaroubiIso`.
- `CategoryTheory/Shift/Basic.lean`: `shiftFunctorAdd`, with direction
  `shiftFunctor C (m+n) ≅ shiftFunctor C m ⋙ shiftFunctor C n`.
- `CategoryTheory/Triangulated/Pretriangulated.lean`: the ambient class,
  triangle Hom exactness, zero composites, and the constructed binary and
  finite biproduct instances.

Proof-route departure to record: the report's final Yoneda detection is
replaced by explicit mutually inverse biproduct maps. The mathematical
conclusion is unchanged. Using pretriangulated hypotheses is a generalisation,
not an extra assumption.

## Proposition 6.7: the two odd doubles

**Verdict: no correspondence defect found in the declarations or mathematical
construction of the integrated source.** The reviewed candidate has now been
integrated byte-for-byte. It supplies both objects and both isomorphisms
without an additional mathematical premise. This is a correspondence judgment;
the normal kernel gates remain separate acceptance requirements. Historical
and final integrated snapshots are identified below.

Reviewed source: `Stage3cOddDouble.lean` in the Lean worktree, against
`report/sections/06-realisation.tex`, lines 344–373. The reviewer also reread
the current Karoubi and cone-splitting sources; the latter's intervening changes
are proof-script refinements and do not change its hypotheses or conclusion.
The worktree was accessed read-only throughout this review.

| Check | Source-based finding |
|---|---|
| Input object and idempotent | The input is arbitrary `U : Karoubi C`. Mathlib's structure is exactly an object `U.X : C`, an endomorphism `U.p`, and the equation `U.p ≫ U.p = U.p`. This packages the report's `(E,p)` without imposing that the idempotent already split in `C`. |
| Hypotheses | The main declarations require only the same pretriangulated structure used in Lemma 6.6. They do not require essential smallness, `IsIdempotentComplete C`, an odd-double existence hypothesis, or any extra property of `U`. The cases `p = 0` and `p = 𝟙` are included. |
| First decomposition | `complementDecomposition U` starts with Mathlib's `U.decomposition : U ⊞ U.complement ≅ K U.X`, inverts it, and swaps its two summands. Thus its target is `(E,1-p) ⊞ (E,p)`, with the complement first as in the report. |
| First matrix | `complement_matrix` asserts that `K.map (𝟙 U.X - U.p)` is `fst ≫ inl` after conjugation by that decomposition. This is the identity on `(E,1-p)` and zero on `(E,p)`, not the projector onto `U`. The source proof reduces this to Mathlib's complementary inclusion/projection factorisation and biproduct braiding identities; the candidate's added `change` makes the same composite explicit. |
| First actual object | `firstDouble U` has dependent-pair type `Σ X : C, K X ≅ U ⊞ shift 1 U`. It invokes `distinguished_cocone_triangle (𝟙 U.X - U.p)` in `C`, then the already established cone-splitting construction. The cone object and its isomorphism are conclusions of this construction. |
| Shift of the first decomposition | `shiftedDecomposition` constructs `K(X[1]) ≅ shift 1 U ⊞ shift 2 U` from `shiftToKaroubiIso`, the image of the given isomorphism under `shift 1`, the additive-functor biproduct comparison, and `shiftAddIso 1 1 U`. Biproduct preservation is supplied from the proved additivity of the extended shift and Mathlib's ordinary additive-functor instance, not assumed as a new hypothesis. |
| Second morphism belongs to `C` | `thirdDouble` takes `X` and its decomposition from the same `firstDouble U`, then defines `g : X[1] ⟶ X` using `(toKaroubi C).preimage`. The pinned Mathlib fully faithful embedding has underlying preimage `f.f`. Thus `g` is an actual original-category morphism, rather than an arbitrary Karoubi morphism being coned in a nonexistent triangulation. |
| Second matrix | The source decomposition is `shift 1 U ⊞ shift 2 U`. The target decomposition `e₂` is the original `U ⊞ shift 1 U` decomposition followed by braiding, so its order is `shift 1 U ⊞ U`. The transported map `fst ≫ inl` identifies the common `shift 1 U`. In the report's unswapped target order, it is precisely the displayed matrix `[[0,0],[id,0]]`. |
| Second actual object and shift | The second application of `distinguished_cocone_triangle g` chooses `V : C`. Cone splitting has common summand `shift 1 U`, source complement `shift 2 U`, and target complement `U`, giving `K V ≅ U ⊞ shift 1 (shift 2 U)`. The final `shiftAddIso 2 1 U` converts the last term to `shift 3 U`, with the correct positive shift and output order. |
| Final existence statement | `exists_odd_doubles` concludes one pair `X V : C` with the two asserted isomorphisms packaged by `Nonempty`. More strongly, `firstDouble` and `thirdDouble` expose chosen objects together with actual isomorphism values. The final theorem is not merely an implication from their assumed existence. |
| Grothendieck group | Neither the definitions nor `exists_odd_doubles` claim `[X] = [V] = 0` in triangulated `K₀`. This is exactly the exclusion approved in job 15 and must remain an explicit numbered departure. No weaker invariant is substituted for it. |

The choices of cones are noncomputable choices from Mathlib's
`Pretriangulated.distinguished_cocone_triangle`, the ordinary cone-existence
axiom of a pretriangulated category. This does not assume the desired
decomposition of either cone: both decompositions are supplied by the new
cone-splitting construction. Repeated references to `(firstDouble U).1` and
`(firstDouble U).2` refer to projections of the same defined dependent pair,
so the second construction does not mix incompatible choices.

Additional pinned Mathlib inspected directly:

- `CategoryTheory/Idempotents/Karoubi.lean`: `Karoubi`,
  `fullyFaithfulToKaroubi`, its `Full` and `Faithful` instances, and `decomp_p`.
- `CategoryTheory/Idempotents/Biproducts.lean`: `Karoubi.complement` and
  `Karoubi.decomposition`, including the actual `1-p` idempotent and the
  inclusion/projection formulas.
- `CategoryTheory/Triangulated/Pretriangulated.lean`:
  `distinguished_cocone_triangle`, whose chosen third object lies in `C`.
- `CategoryTheory/Preadditive/AdditiveFunctor.lean` and
  `CategoryTheory/Limits/Preserves/Shapes/Biproducts.lean`: finite biproduct
  preservation and the finite-shape-to-binary comparison used in the shift.

## Candidate difference check and historical source snapshots

The candidate source review was completed on 2026-10-08 while the worktree was
temporarily read-only. At that point the worktree's `Stage3cOddDouble.lean` had
not been replaced by the candidate. The reviewed candidate was saved as
`computations/15-stage3c-resume/Stage3cOddDouble.lean` in the verification
repository. The table in this subsection preserves those pre-integration
snapshots; the final integrated state is recorded in the following subsection.

The candidate changes only the following points of the original odd-double
source:

1. It adds an explicit `change` for the composite in `complement_matrix`
   before associativity rewrites. The exposed composite is
   `braiding.inv ≫ decomposition.hom ≫ decomposition.inv ≫ snd ≫ inr ≫
   decomposition.hom ≫ decomposition.inv ≫ braiding.hom`. Cancelling the
   adjacent isomorphism pairs gives `braiding.inv ≫ snd ≫ inr ≫ braiding.hom`,
   hence `fst ≫ inl`. The statement and mathematical argument are unchanged.
2. It moves `HasZeroObject C`, `HasShift C ℤ`, and shift-additivity section
   variables below `complement_matrix`. The complement decomposition and its
   matrix computation require only a preadditive category with the indicated
   finite biproducts. No hypothesis is added to a report conclusion.
3. It replaces `Pretriangulated C` by `HasFiniteBiproducts C` on the auxiliary
   `shiftedDecomposition`. That helper only transports an existing
   decomposition through an additive shift. The weaker hypothesis suffices;
   `thirdDouble` still obtains it from its pretriangulated setting. The types
   and constructions of `firstDouble`, `thirdDouble`, and `exists_odd_doubles`
   retain the same mathematical input and output.

The saved `computations/15-stage3c-resume/odd-double.patch` was applied to the
original source **in memory only** by the reviewer, and the result was checked
byte-for-byte against the candidate. They match. No worktree file was written
or built by the reviewer.

| Snapshot | Lines | SHA-256 |
|---|---:|---|
| Pre-integration worktree `FindimCounterexample/Stage3cFractions.lean` | 112 | `23c2736162d97bacacbb3f4f5c9a629d7a84a06190109669ddd75b3477df4663` |
| Pre-integration worktree `FindimCounterexample/Stage3cKaroubi.lean` | 145 | `3b3780ec5ab7859af72aa4e5ea02d32a1f507a6452f3c4e6a9bd8dc3c5b5a5e5` |
| Pre-integration worktree `FindimCounterexample/Stage3cConeSplitting.lean` | 198 | `ffafd57b6279cdd6368d47e384407470e5d7c9acd1971c0e5443d96e68c67adb` |
| Pre-integration worktree `FindimCounterexample/Stage3cOddDouble.lean` | 100 | `41a149f62f22a0b056bf2e557e488755d619ba4e828574673eda0c2ee2f61439` |
| Verification-repository candidate `computations/15-stage3c-resume/Stage3cOddDouble.lean` | 105 | `052bb4572eb670ab521eb1a909375c964f3b218ab09b366349b38d1b2f9a059d` |

The report source hash remains
`6cb08176ad1b01f4a620a0ead3c2932f2631ab5b99636c7e51f3d2f32e797750`.

## Final integrated source snapshot

After worktree write access was restored, the implementing agent applied the
reviewed patch. On 2026-10-08 this reviewer checked the four worktree source
hashes again and independently compared the integrated odd-double file with
the reviewed candidate using `cmp`, which returned equality. The other three
files retain their previously reviewed hashes. Thus there are no additional
mathematical source changes beyond the reviewed candidate delta.

All paths in this table are relative to the stage3c Lean worktree:

| Integrated source | Lines | SHA-256 |
|---|---:|---|
| `FindimCounterexample/Stage3cFractions.lean` | 112 | `23c2736162d97bacacbb3f4f5c9a629d7a84a06190109669ddd75b3477df4663` |
| `FindimCounterexample/Stage3cKaroubi.lean` | 145 | `3b3780ec5ab7859af72aa4e5ea02d32a1f507a6452f3c4e6a9bd8dc3c5b5a5e5` |
| `FindimCounterexample/Stage3cConeSplitting.lean` | 198 | `ffafd57b6279cdd6368d47e384407470e5d7c9acd1971c0e5443d96e68c67adb` |
| `FindimCounterexample/Stage3cOddDouble.lean` | 105 | `052bb4572eb670ab521eb1a909375c964f3b218ab09b366349b38d1b2f9a059d` |

Total new Lean source: 560 lines; all four files are below the 1500-line limit.

The reviewer also read the stage3c README correspondence rows and departures
3c.1–3c.4. They cover both finite-fraction items, empty families, the explicit
Karoubi shifts and Hom exactness, the actual cone-splitting isomorphism, both
odd-double constructions, the approved K₀ omission, weaker ambient hypotheses,
and both proof-route departures. No stage3c correspondence or departure
omission was found. All main declarations also occur in `Audit/Statements.lean`.
A minor inherited README wording issue was reported to the implementer:
departure 1's phrase “All stages express” projective dimension no longer
describes the scope after adding this non-dimension stage; the intended
subject is the projective-dimension statements.

This closes the requested same-model correspondence review for the integrated
source snapshot above. No integrated-worktree build, exhaustive axiom report,
statement-listing run, or kernel replay is certified by this review. Those
gates are assessed separately in the evidence observation below. The reviewer
made no worktree edits and ran no builds.

## Acceptance-evidence observation — 2026-10-08

A read-only consistency check of `lean/gates/stage3c-uncommitted/` found:

- `summary.txt` records exit 0 for all five gates. The build log ends with
  `Build completed successfully (1896 jobs).`
- All 19 entries in `sources.sha256` match the current worktree byte-for-byte.
  `commit.txt` matches current HEAD,
  `394efc357e0cbe75b8e66a5353d2aef4302893b3`. The four stage3c hashes are exactly
  the integrated-source hashes reviewed above.
- The axiom log contains 192 distinct declaration rows, including 139 theorem
  rows; both counts agree with its JSON summary. Every recorded transitive
  axiom set is a subset of `{propext, Classical.choice, Quot.sound}`.
  Stage3c coverage is 46 declaration rows: 5 fractions, 18 Karoubi,
  6 cone-splitting, and 17 odd-double declarations. All 30 stage3c declarations
  requested by `#check` in `Audit/Statements.lean` have axiom rows and occur in
  the statement-listing output.
- The axiom summary names all 13 project modules and the root module.
  `5-leanchecker.log` records precisely the same 14 distinct modules, including
  all four stage3c modules, each once. There are no missing or extra replay
  module names.

This supports the consistency of the recorded five-gate result with the exact
reviewed integrated sources. The reviewer inspected the audit implementation
and parsed the saved evidence, but did not rerun a build, audit, or replay.
This is a same-model evidence check and correspondence review, not an
independent-model review or author certification.
