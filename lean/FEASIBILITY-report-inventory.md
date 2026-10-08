Model: GPT-6 (Codex); effort: unknown.

# Mathlib inventory for the report

Job L-feasibility, 2026-10-08. Genre: technical feasibility record, drafted
from the current report and local Lean sources. This is a source inventory,
not a proof audit, a Lean build, or certification of the report.

## Scope, evidence and estimates

The inspected Lean repository is
`findim-counterexample-formalisation`.
Its `lean-toolchain` specifies `leanprover/lean4:v4.33.1`; both the manifest
and the Mathlib checkout HEAD specify
`0df444a360eaa60ab8c11dca51a86af692955474`.
All Mathlib paths below are relative to its `.lake/packages/mathlib/`.
Existing project code is distinguished from Mathlib. Only this inventory is
being written; no download, build, or change to the Lean repository is made.

Status conventions throughout this inventory:

- **Supported**: a declaration or signature was located in the pinned source,
  or a stated search returned no relevant implementation. Negative findings
  mean “not found in the inspected source”, not a proof of nonexistence.
- **Plausible**: proposed reuse, statement correspondence and missing-proof
  analysis. Report statements are targets, not endorsed mathematical claims.
- **Heuristic**: size estimates and recommended implementation order.

Sizes refer to new Lean, including necessary definitions, bridges and proofs:
small (S), roughly 50–300 lines; medium (M), 300–1,500; large (L), 1,500–6,000;
very large (VL), over 6,000, potentially tens of thousands. These are order-of-
magnitude estimates, not measured bids. Shared foundations are counted once;
result rows distinguish marginal work from foundation costs where material.
No elaboration or import-cache availability is claimed from source inspection.

A meaningful conditional theorem may take standard infrastructure as explicit
arguments or structure fields, but must still prove the report's construction,
comparison or obstruction. Assuming that very conclusion is not useful coverage.
The discussion below proposes possible boundaries only; it does not approve
hypotheses or start a conditional Lean development. Any later implementation
must follow the per-hypothesis approval rule in `LEAN_FORMALISATION.md`.

## Work state

Complete: 81 numbered result blocks, comprising 78 labelled and three
unlabelled blocks, each with statement coverage, missing work/size and a
conditional assessment. The final source-only receipt is at the end.

## Source catalogue

The identifiers A–N below are citations used by the result tables. Availability
is **supported** by local source searches; applicability and gap estimates are
**plausible/heuristic**, respectively. Names are namespace-qualified where
needed; local names are explicitly identified.

### A. Abelian categories, Ext and projective dimension

- `Mathlib/CategoryTheory/Abelian/Basic.lean`:
  `CategoryTheory.Abelian`.
  `Mathlib/CategoryTheory/Preadditive/Projective/Basic.lean`:
  `CategoryTheory.EnoughProjectives`.
- `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean`:
  `CategoryTheory.HasExt` (an abbreviation, not a class declaration),
  `CategoryTheory.Abelian.Ext`, and its `comp`, `homEquiv`, `homEquiv₀`,
  `mk₀`, `biprodAddEquiv`, `addEquivBiprod`. Ext is indexed by natural
  numbers; a vanishing assertion means every element is zero (or
  `Subsingleton`), not that the Ext type is empty.
- `Mathlib/Algebra/Homology/DerivedCategory/Ext/EnoughProjectives.lean`:
  `CategoryTheory.hasExt_of_enoughProjectives`, under `LocallySmall` and
  `EnoughProjectives`; `CategoryTheory.Abelian.Ext.eq_zero_of_projective`.
  Thus the smallness/Ext issue in an abstract abelian category is manageable,
  rather than missing homological foundations.
- `Mathlib/CategoryTheory/Abelian/Projective/Dimension.lean`:
  `CategoryTheory.HasProjectiveDimensionLT`, `HasProjectiveDimensionLE`,
  `hasProjectiveDimensionLT_iff`, `projective_iff_hasProjectiveDimensionLE_zero`,
  `ShortComplex.ShortExact.hasProjectiveDimensionLT_X₃_iff`,
  `Retract.hasProjectiveDimensionLT`, `projectiveDimension`,
  `projectiveDimension_le_iff`, `projectiveDimension_ge_iff`.
  The dimension-shift equivalence at line 223 compares bounds at `n+2` and
  `n+1`; it is not a blanket equality of dimensions including the split case.
  `projectiveDimension` has values in `WithBot ℕ∞`.
- `Mathlib/CategoryTheory/Abelian/Projective/Resolution.lean`:
  `CategoryTheory.ProjectiveResolution.lift`, `liftHomotopy`, `homotopyEquiv`,
  and `CategoryTheory.projectiveResolution`. These are ordinary projective
  resolutions, not projective covers or minimal/complete resolutions.

No named little finitistic dimension or global-dimension API was found by
`finitistic|globalDimension`. Defining their suprema over module categories,
with universe control and a zero-module convention, is S–M. The signed
projective dimension of a derived object in Section 4 is a different notion:
`WithBot ℕ∞` cannot represent negative finite dimensions of shifts. It needs
an extended-integer definition and comparison theorems (M–L).

### B. Noncommutative modules, duals and the existing project

- `Mathlib/Algebra/Category/ModuleCat/Abelian.lean`: `ModuleCat.abelian`
  assumes `[Ring R]`, not `[CommRing R]`.
- `Mathlib/Algebra/Category/ModuleCat/Projective.lean`:
  `ModuleCat.enoughProjectives`, `IsProjective.iff_projective` and the
  instance bridges between categorical and module projectivity.
  `Mathlib/Algebra/Category/ModuleCat/Ext/HasExt.lean` supplies `HasExt` for
  `ModuleCat R` under `[Ring R] [Small R]` at the specified universe.
  By contrast, `ModuleCat/Ext/Basic.lean` starts with `[CommRing R]` for
  its scalar/annihilator lemmas; those lemmas must not silently be applied
  over an arbitrary algebra.
- `Mathlib/Algebra/Module/Projective.lean`: `Module.Projective`,
  `Module.Projective.of_split`, `Module.Projective.of_free`,
  `Module.projective_lifting_property`.
  `Mathlib/RingTheory/Finiteness/Projective.lean`:
  `Module.Finite.exists_comp_eq_id_of_projective`, a retract of `Fin n → R`.
- `Mathlib/LinearAlgebra/Dual/Defs.lean`: `Module.Dual R M := M →ₗ[R] R`
  exists for a semiring. Its usual same-ring dual-module/evaluation API is
  developed with commutative scalars. The report uses both the field dual
  `D = Module.Dual k` and the ring dual `Hom_A(-,A)` changing handedness;
  these must not be conflated.

Read-only project evidence (paths relative to the Lean repository, **not
Mathlib**): `FindimCounterexample/Coresolution.lean` defines
`FindimCounterexample.ProjectiveCoresolution.projectiveDimension_eq`.
Its actual signature only assumes an abelian category, not enough projectives
or `HasExt` explicitly. `FindimCounterexample/Duality.lean` defines
`FindimCounterexample.RingDual.RightDual`, `LeftDual`, `evalEquiv`,
`split_of_dual_split`; `FindimCounterexample/ExactCoresolution.lean` defines
`FindimCounterexample.ExactCoresolution.cok`, `shortExact`, `coresolution`.
`FindimCounterexample/StrongNakayama.lean` contains
`FindimCounterexample.StrongNakayama.projectiveDimension_eq` and `unbounded`.
The last two assume injectivity/range-equals-kernel for the dual complex.
They do not accept the report's Ext-vanishing hypothesis directly and do not
state the transpose identification. These signatures were read; old gate
receipts were not rerun or promoted to current validation.

### C. Complexes, homotopy categories and derived categories

- `Mathlib/Algebra/Homology/HomotopyCategory.lean`: `HomotopyCategory`,
  `HomotopyCategory.quotient`, `quotient_map_out`, `homotopyOfEq`,
  `quotient_map_eq_zero_iff`, `isoOfHomotopyEquiv`.
- `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean`: `HasDerivedCategory`,
  `HasDerivedCategory.standard`, `DerivedCategory`, `DerivedCategory.Q`,
  `Qh`, `singleFunctor`, `mappingCone_triangle_distinguished`,
  `isIso_Q_map_iff_quasiIso`.
- `Mathlib/Algebra/Homology/DerivedCategory/TStructure.lean`:
  `DerivedCategory.IsLE`, `IsGE`. Boundedness can be expressed with these
  predicates and term-support predicates on cochain complexes. A ready-made
  `Dᵇ(mod A)`/`Kᵇ(proj Aᵐᵒᵖ)` package in the report's exact conventions
  was not located; these full subcategories and closure proofs need packaging.
- `Mathlib/Algebra/Homology/HomotopyCategory/KProjective.lean`:
  `CochainComplex.IsKProjective`, `isKProjective_of_projective` for a
  strictly bounded-above complex of projectives.
  `Mathlib/Algebra/Homology/DerivedCategory/KProjective.lean`:
  `CochainComplex.IsKProjective.Qh_map_bijective`, `quasiIso_iff`, and
  `CochainComplex.HomComplex.CohomologyClass.equivOfIsKProjective`.
- `Mathlib/Algebra/Homology/HomotopyCategory/HomComplex.lean`:
  `CochainComplex.HomComplex.Cochain` and `Cochain.mk`. Product-indexed Hom
  cochains, their differentials/composition and shifted versions are present;
  this is useful in Section 8, even though complete resolutions are missing.

C costs M–L for report-specific finite-generation/boundedness packaging, not
VL for constructing derived categories from scratch. Connecting explicit Hom
complexes to the library's derived Ext is still a proof obligation.

### D. Triangles, Verdier localisation, fractions and Karoubi

- `Mathlib/CategoryTheory/Triangulated/Basic.lean`:
  `CategoryTheory.Triangle`, `Triangle.mk`.
  `Triangulated/Pretriangulated.lean`: `CategoryTheory.Pretriangulated`,
  `CategoryTheory.Pretriangulated.Triangle.yoneda_exact₂` and
  `coyoneda_exact₂`.
  `Triangulated/Triangulated.lean`: `CategoryTheory.IsTriangulated`.
  `Triangulated/Functor.lean`: `CategoryTheory.Functor.IsTriangulated`.
- `Mathlib/CategoryTheory/Triangulated/Subcategory.lean`:
  `CategoryTheory.ObjectProperty.IsTriangulated`, `trW`, `trW.mk`;
  instances at lines 603, 623 and 644 give both calculi of fractions and
  compatibility with triangulation for `P.trW`. This is the cone-in-subcategory
  class used for Verdier localisation.
- `Mathlib/CategoryTheory/Localization/Triangulated.lean`:
  `CategoryTheory.Triangulated.Localization.pretriangulated`, `isTriangulated`.
  `Mathlib/CategoryTheory/Localization/CalculusOfFractions.lean`:
  `CategoryTheory.MorphismProperty.RightFraction`,
  `HasRightCalculusOfFractions`, `CategoryTheory.Localization.exists_rightFraction`,
  `CategoryTheory.MorphismProperty.map_eq_iff_precomp`.
  The latter gives equality after precomposition by a denominator. Finite
  common denominators and simultaneous killing can be obtained by induction;
  no new Verdier-localisation axiom is needed for Lemma 6.1.
- `Mathlib/CategoryTheory/Idempotents/Karoubi.lean`:
  `CategoryTheory.Idempotents.Karoubi`, `toKaroubi`, `fullyFaithfulToKaroubi`,
  `toKaroubiEquivalence`, `Karoubi.retract`.
  `Idempotents/FunctorExtension.lean`:
  `CategoryTheory.Idempotents.functorExtension` and `karoubiUniversal`,
  for an idempotent-complete target.

Remaining work includes the chosen thick subcategory and its smallness,
restricted functors, the shift on Karoubi objects and compatibility with
extension, and the report's cone-splitting/odd-double arguments (M–L).
Section 6 explicitly does **not** require a triangulated structure on Karoubi;
there is no reason to budget that stronger theorem as a prerequisite.

### E. Tensor products and bimodules

- `Mathlib/RingTheory/TensorProduct/Basic.lean`:
  `Algebra.TensorProduct.instRing`, `includeLeft`, `includeRight`;
  `TensorProduct.Algebra.module`, `smul_def`. The base is commutative, but
  the two algebras can be noncommutative. This covers `T ⊗[k] T`, `B ⊗[k] K_l`
  and enveloping algebras `A ⊗[k] Aᵐᵒᵖ`.
- `Mathlib/Algebra/Module/Bimodule.lean`: `Subbimodule.mk`, `toSubmodule`,
  `toSubmodule'`; the documented representation is commuting `Module R`
  and `Module Sᵐᵒᵖ` actions, or a module over the enveloping tensor algebra.
- `Mathlib/LinearAlgebra/TensorProduct/Defs.lean` has commutative base
  scalars. Similarly `Mathlib/Algebra/Category/ModuleCat/Monoidal/Basic.lean`
  gives `ModuleCat.monoidalCategory` for `[CommRing R]`. Neither is directly
  the report's `M ⊗_A N` for noncommutative `A`.
- There **is** an abstract balanced tensor construction:
  `Mathlib/CategoryTheory/Monoidal/Bimod.lean` defines `Bimod`,
  `Bimod.tensorBimod`, `associatorBimod`, `leftUnitorBimod`,
  `rightUnitorBimod` using coequalizers and preservation hypotheses.
  Thus “Mathlib has no tensor products of bimodules” would be incorrect.

The missing bridge is a usable concrete noncommutative balanced-tensor API:
bimodule/module-category equivalences, tensor-Hom adjunction, exactness and
projectivity criteria, finite-generation, and computational rules. These are
L (roughly 2,000–6,000 lines) jointly, with significant uncertainty. Deriving
these functors, preserving outer bimodule actions, and proving associativity,
base change and signs adds L–VL. Field-linear tensor calculations alone are
much cheaper. One can use a quotient of `M ⊗[k] N` by balancing relations or
instantiate `Bimod.tensorBimod`; neither route is a finished derived-tensor API.

### F. Trivial extensions and presented/path algebras

- `Mathlib/Algebra/TrivSqZeroExt/Basic.lean`: `TrivSqZeroExt`,
  `TrivSqZeroExt.inl`, `inr`, `fst`, `snd` and ring structure for commuting
  left/right actions. In particular the base ring need not be commutative.
  This corrects the early note's unsuccessful `TrivSqZeroExt` search.
- `Mathlib/Algebra/FreeAlgebra.lean`: `FreeAlgebra`, `FreeAlgebra.lift`,
  `hom_ext`. `Mathlib/Algebra/RingQuot.lean`: `RingQuot`,
  `RingQuot.mkAlgHom`, `liftAlgHom` provide presentations by relations.
- `Mathlib/Combinatorics/Quiver/Path.lean` provides `Quiver.Path`.
  No dedicated path-algebra/quiver-with-relations representation package was
  found by filename and text searches for `PathAlgebra|path algebra`.
  Quivers and paths alone do not supply their linearised algebra.

Finite path algebras can be defined by a path basis and partial concatenation,
or presented with vertex and arrow relations; the report's right-to-left
convention needs an explicit correspondence. Finite-dimensional normal forms,
corner modules, representation equivalences and relation bases cost L
(2,000–6,000 shared). The three-layer encoding algebra can be built directly
as a finite vector-space algebra, reducing general infrastructure at the cost
of a presentation comparison. Noncommutative finite algebra presentations
need their own predicate/structure: commutative `Algebra.FinitePresentation`
is not a substitute. The multiplication of an ordinary trivial extension is
already available; the bar/derived consequences are not supplied by it.

### G. Groups, group algebras and matrix quotients

- `Mathlib/GroupTheory/PresentedGroup.lean`: `PresentedGroup`,
  `PresentedGroup.of`, `one_of_mem`, `toGroup`, `ext`.
  `Mathlib/GroupTheory/FinitelyPresentedGroup.lean`:
  `Group.IsFinitelyPresented`, `Group.IsFinitelyPresented.equiv`,
  `exists_mulEquiv_presentedGroup`.
- `Mathlib/Algebra/MonoidAlgebra/Defs.lean`: `MonoidAlgebra.single`.
  `Mathlib/Algebra/MonoidAlgebra/Basic.lean`: `MonoidAlgebra.lift`,
  `mapDomainAlgHom`. These cover group algebras and extension of group maps;
  no report-specific presentation or central-character module is supplied.
- `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`:
  `GeneralLinearGroup n R := (Matrix n n R)ˣ`, with
  `GeneralLinearGroup.mk''` for unit determinant. Matrices over the possibly
  nonreduced ring `F₂[t]/(t^m-1)` are allowed; do not replace it by a field.
- `Mathlib/RingTheory/AdjoinRoot.lean`: `AdjoinRoot`, `AdjoinRoot.mk`,
  `AdjoinRoot.powerBasis'` for a monic polynomial,
  `Polynomial.Monic.finite_adjoinRoot`,
  `finrank_quotient_span_eq_natDegree`. These give the power basis and finite
  coefficient-ring route; a field/irreducibility assumption is unnecessary.

The group in Section 5, its two presentations, all commutator arguments,
transvection matrices and central-character projectors remain report-specific
proofs (several M–L units). This is a substantial but relatively self-contained
unconditional project; it needs no stable or derived categories.

### H. Finite-dimensional algebras, radical, covers and decomposition

- `Mathlib/LinearAlgebra/FiniteDimensional/Defs.lean` defines
  `FiniteDimensional k A` as `Module.Finite k A` over a division ring.
  Combine this with `[Ring A] [Algebra k A]` for a finite-dimensional algebra.
- `Mathlib/RingTheory/Jacobson/Radical.lean`:
  `Module.jacobson`, `Ring.jacobson`, `Ring.jacobson_quotient_jacobson`,
  `Ring.jacobson_le_of_eq_bot` (the latter in the `Ring` namespace).
  `Mathlib/RingTheory/Jacobson/Semiprimary.lean`:
  `IsSemisimpleRing.jacobson_eq_bot`, `IsSemiprimaryRing` with a nilpotent
  radical and semisimple quotient.
  `Mathlib/RingTheory/Artinian/Ring.lean`:
  `IsArtinianRing.isNilpotent_jacobson_bot` has `[Ring R]`; it is not limited
  to commutative Artinian rings despite the introductory prose in that file.

No general Krull–Schmidt theorem, projective-cover/minimal-resolution API,
Auslander transpose, `add G` approximation theory, basic-algebra/simple-module
count correspondence, or Gorenstein-projective module API was found in the
searches below. Existing projectivity, finite length and radicals do not
supply those conclusions automatically. Building the connected representation-
theoretic package costs VL (roughly 8,000–20,000+ lines); defining an individual
notion or constructing a concrete cover is often S–M. Avoid charging all of
this package to results that only need explicit split maps.

### I. Stable categories, symmetric algebras, complete resolutions and Tate duality

The report's symmetry means an associative nondegenerate symmetric bilinear
form, or a bimodule isomorphism `A ≃ D A`. No implementation of this
representation-theoretic `SymmetricAlgebra`/Frobenius-algebra notion, exact
Frobenius categories, their triangulated stable quotient, or general Tate Ext
of modules over symmetric algebras was found. `LinearAlgebra/SymmetricAlgebra/`
is the symmetric tensor algebra, and `RingTheory/Frobenius.lean` concerns
Galois-theoretic Frobenius elements. `Mathlib/Algebra/CharP/Frobenius.lean`
concerns characteristic-p Frobenius maps. Neither supplies Frobenius algebras.

There is relevant but narrower Tate theory:
`Mathlib/RepresentationTheory/Homological/TateCohomology/Basic.lean` defines
`Rep.tateNorm`, `tateComplex`, `tateCohomologyFunctor`, `tateCohomology`,
`TateCohomology.isoGroupCohomology`, `isoGroupHomology`, `exact₁`, `exact₃`.
The ambient variables are `[CommRing R] [Group G] [Fintype G] (M : Rep R G)`.
It is finite-group cohomology, not the report's two-variable stable Hom theory,
and does not supply symmetric-algebra Tate duality or compatibility of its
pairing with composition.

A stable-Hom quotient can be defined using maps factoring through projectives
(M). Complete resolutions, lifting/homotopy comparisons, the triangulated
structure, the comparison with ordinary Ext, bimodule tensor functors and
Tate duality together are VL (10,000–30,000+ lines, very uncertain). Defining
a symmetrising form and checking it on the twenty-dimensional example is M,
far cheaper than this categorical package.

### J. Toda brackets

Searches for `Toda|toda|Massey` located no Toda bracket API relevant here.
D supplies the triangles, shifts and exactness needed to define the bracket
as the set of composites of defining systems. The juggling inclusion alone
is S after this definition. Nonemptiness, independence of the chosen triangle,
coset/indeterminacy, and graded shift conventions are M–L (roughly 800–2,500
lines). The obstruction then needs composition-compatible Tate duality from I.
A graded algebra with an arbitrary operation called a bracket is not enough
unless its relation to the genuine triangulated bracket remains explicit.

### K. Grothendieck groups and linear algebra

`Mathlib/GroupTheory/MonoidLocalization/GrothendieckGroup.lean` supplies the
commutative-monoid group completion (`Algebra.GrothendieckGroup` and its
additive version). Its introduction explicitly distinguishes the analogous
abelian-category notion. No triangulated/abelian-category K₀ or K₀ of finitely
generated projectives was located. `CategoryTheory/Grothendieck.lean` is the
Grothendieck construction of categories, not K-theory.

The report needs three distinct constructions: split K₀ of projectives,
K₀ with short-exact-sequence relations, and K₀ with triangle relations, plus
comparison, functoriality and simple-class basis theorems. Definitions via
free abelian groups modulo relations are M; the comparisons/basis theorems
are L, relying on H. A “class map” into an arbitrary abelian group satisfying
triangle additivity is a useful conditional target for odd-double identities,
but does not by itself identify that group with K₀.

`Mathlib/LinearAlgebra/FiniteDimensional/Lemmas.lean` supplies
`Module.End.ker_pow_le_ker_pow_finrank`,
`Module.End.ker_pow_eq_ker_pow_finrank_of_le`;
`Mathlib/LinearAlgebra/FiniteDimensional/Basic.lean` supplies
`Module.End.ker_pow_constant`.
These support the finite-dimensional nilpotence bound behind the rank
obstructions. The numerical/linear-algebra core is S–M separately from K₀.
`Mathlib/RingTheory/Artinian/Module.lean` also has the Fitting decomposition:
`LinearMap.eventually_isCompl_ker_pow_range_pow` and
`LinearMap.isCompl_iSup_ker_pow_iInf_range_pow`, for an Artinian and Noetherian
module. Thus Fitting decomposition itself is available; this does not by
itself supply the entire Krull–Schmidt package listed in H.

### L. Module varieties and rank loci

`Mathlib/Topology/NoetherianSpace.lean` supplies
`TopologicalSpace.noetherianSpace_iff_opens`,
`TopologicalSpace.NoetherianSpace.isCompact`,
`TopologicalSpace.NoetherianSpace.finite_irreducibleComponents`.
`Mathlib/RingTheory/Spectrum/Prime/FreeLocus.lean` supplies
`Module.isLocallyConstant_rankAtStalk` for finitely presented flat modules.
Thus the commutative local-rank input of Corollary 5.5 has actual coverage.

Missing: the report's representation varieties of a noncommutative algebra,
their Zariski topology/Noetherian property, polynomial matrix families,
rank-open homology-vanishing loci, and the Tor/simple-module test for projective
dimension. These are L–VL (roughly 4,000–10,000 shared lines). The final
Noetherian stabilization argument alone is S. Universal localisation of a
hereditary noncommutative ring and its K₀-surjectivity theorem were not found;
commutative localisation or Ore localisation is not that theorem.

### M. dg algebras/modules, K-flatness, bar and Hochschild machinery

`Mathlib/Algebra/Homology/Monoidal.lean` contains
`HomologicalComplex.monoidalCategory` under its monoidal/totalization
hypotheses. `Mathlib/Algebra/Homology/DifferentialObject.lean` relates complexes
to differential graded objects through
`HomologicalComplex.dgoEquivHomologicalComplex`.
These are possible building blocks, not a
ready-to-use theory of dg modules over a noncommutative dg algebra.
The Hom-complex machinery and K-projectivity in C are also relevant.

No dedicated K-flatness API, dg-algebra quasi-isomorphism base-change theorem,
relative Hochschild bar resolution, Hochschild cup-action comparison with
Yoneda Ext, or derived noncommutative bimodule tensor package was located.
A dg algebra can be encoded as a monoid object in complexes; modules can be
encoded similarly, but the derived/K-flat library still needs construction.
The full package used in Theorem 4.1 is VL (10,000–30,000+ lines). A direct
ordinary-ring resolution proof could reduce dg prerequisites, but must
actually establish the same derived-powers/naturality statement.
Section 6 rectification only needs complexes of ordinary bimodules and
explicit homotopies; it should not be burdened with the full dg-module package.

### N. Explicit finite algebra and polynomial certificates

In addition to the matrix, polynomial quotient, linear-map and basis citations
above, `Mathlib/Algebra/MvPolynomial/Basic.lean` defines `MvPolynomial`,
`MvPolynomial.monomial`, `C`, `X`, `coeff` and proves `X_injective`.
`Mathlib/RingTheory/Localization/FractionRing.lean` defines `IsFractionRing`
and `FractionRing` and proves `IsFractionRing.mk'_eq_zero_iff_eq_zero`.
This infrastructure can express the characteristic-two tables,
the rational function field and every finite identity. This is ordinary
algebra, separate from constructing resolutions or their homology classes.
Section 9's 179-entry cochain and the 18⁴ cocycle checks need Lean definitions,
multilinearity reduction and kernel-checked certificates, split into manageable
lemmas. Existing Python/Sage output is evidence for the report, not a Lean
proof. No `native_decide` or budget-limit changes are part of this proposal.

## Per-result inventory

Numbering was reconstructed from the shared equation/theorem counter in
`report/main.tex` and cross-checked against the existing `report/build/main.aux`;
all labelled entries agree. The inventory includes all 81 numbered theorem,
lemma, proposition, corollary, definition, construction, example and remark
blocks. Three numbered blocks have no label; their source positions are given.
Numbered equations are dependencies within these blocks, not extra results.
The unnumbered introduction theorem repeats Theorem 7.3. The appendices have
no numbered result environments; their finite certificates are addressed in N
and the Section 9 rows.

Each row gives (a) statement-object coverage via the source catalogue, (b)
missing infrastructure/proof with a heuristic size, and (c) a conditional
assessment. “After earlier results” means using **proved Lean theorems** for
those results in a complete development, not assuming them as hidden fields.
Where a conditional reduction instead treats a report result as a premise, it
is identified as such and is not proposed as a permitted foundational interface.

### Section 2 — `report/sections/02-preliminaries.tex`

| Number and label | (a) Coverage | (b) Missing work and size | (c) Conditional value |
|---|---|---|---|
| Theorem 2.1 `thm:tate-duality` | B: field dual; A: nonnegative Ext; I: finite-group Tate cohomology only. | Symmetric algebras, stable Hom, complete resolutions, natural duality with the shift `-1-a`, and composition pairing. VL through I; duality itself L after that. | Assuming Tate duality would assume this theorem. One could prove it from a separately developed Serre-duality theorem with the symmetric-algebra comparison, but a field containing its displayed isomorphism is not a formalisation of 2.1. |
| Lemma 2.2 `lemma:toda-juggling` | D: triangles, shifts, composition. | J: defining systems and bracket set; postcomposition/precomposition bookkeeping. S, 100–300 lines for definition plus inclusion; full bracket API additional M–L. | Yes, as a theorem of genuine triangulated categories with the bracket defined by systems. No Tate theory or conditional axioms needed. |

### Section 3 — `report/sections/03-criteria.tex`

| Number and label | (a) Coverage | (b) Missing work and size | (c) Conditional value |
|---|---|---|---|
| Proposition 3.1 `prop:coresolution` | A covers every object; B identifies the existing `ProjectiveCoresolution.projectiveDimension_eq`. | Already represented in project source as upper bound plus sharpness. Numeric equality wrapper using A is S, about 30–100 lines. Actual source is more general than the enough-projectives statement. | Unnecessary. The sequence fields are the theorem's own input data, not missing-foundation assumptions. |
| Remark 3.2, **unlabelled**, line 35 | Existing project declaration in B. | This is a claim about formal-verification history. Source correspondence checked here; no gate rerun. No new Lean theorem required. | Not applicable; an interface cannot certify a past build/replay. |
| Theorem 3.3 `thm:strong-nakayama` | A/B cover modules, duals, Ext and pd; project source covers the dual-exactness conclusion. | Bridge a projective resolution's Hom cohomology to `Abelian.Ext`; include degree zero, finite generation and the minimal-resolution transpose/syzygy identification; define findim. M–L (1,000–4,000 lines) for the Ext/unboundedness bridge, plus H's minimal/transpose theory (L shared). | Meaningful to isolate dual-exactness as the **already existing weaker-input formulation**, but it is not the full report theorem. Generic Ext-computation and minimal-presentation APIs could be approved standard inputs; neither Ext vanishing ⇒ exactness nor the transpose comparison should be silently dropped. |
| Remark 3.4, **unlabelled**, line 81 | B: exact signature of `StrongNakayama.unbounded`. | Documentary correspondence only; its Ext-exactness exclusion remains genuine. No new Lean theorem. | Not applicable. |
| Proposition 3.5 `prop:infinitely-torsionfree` | A/B cover pd, modules, duals, complexes and Ext. | H: transpose from minimal presentations, double-transpose modulo projectives, absence of projective summands, `add A` approximations and splicing dual resolutions. L after minimal-presentation API; VL from the pin for all H dependencies. | Yes with standard minimal-presentation/duality facts; still prove all three implications and `Tr C ≅ Ext¹(C,A)`. Assuming the infinite torsionfree characterization would trivialise the result. |
| Corollary 3.6 `coro:infinitely-many-torsionless` | A: retract pd bounds; B: modules and injections into projectives. | Define torsionless and isomorphism-class infinitude; finite indecomposable decompositions and pd of finite sums from H. M (300–900 lines) after 3.3 and decomposition theory; L with the needed decomposition existence. | Yes: finite decomposition plus sum/retract pd laws leave the unboundedness contradiction. Uniqueness in full Krull–Schmidt is stronger than needed here. |
| Theorem 3.7 `thm:ar-to-findim` | A/B: Ext, endomorphism rings, opposite rings, cokernels and projectivity. | `Hom(G,-)` as a module functor, equivalence on `add G`, finite right approximations, relative acyclic-resolution computation of Ext and handedness of `End(G)ᵐᵒᵖ`. L–VL (4,000–10,000 lines), overlapping H. | Yes using standard restricted-Yoneda/acyclic-resolution results; constructing S, its nonzero identity obstruction and dual exactness must remain theorems. Assuming `Ext(S,Γ)=0` is the desired conclusion. |
| Proposition 3.8 `prop:simple-witness` | A/B/H: module Hom/Ext, radical and simple-module primitives. | Corner rings with unit f, primitive idempotent decompositions, composition-factor arguments, adjunction, minimal injective resolutions, Morita equivalence and simple counts. VL (6,000–15,000 lines shared and local). | Yes, but a large standard Artin-algebra interface; the map `A → End(Af)`, its bijectivity and the Ext transfer must still be derived. Assuming the double-centralizer statement is circular for the first assertion. |
| Example 3.9, **unlabelled**, line 243 | F: free algebra/quotient; A: Ext computation target. | Three-vertex algebra and right simples, explicit two-step resolution, dual cohomology. M–L (800–2,500 lines) with a direct finite basis; reusable path API costs extra. | An explicit resolution and chain calculations give a useful unconditional finite target. Taking the displayed Ext dimensions as fields would remove the example's content. |
| Proposition 3.10 `prop:triangular` | C/D: derived objects and cones; A/B: Ext and pd. | Triangular rings/modules, E: derived balanced tensor and adjunction, derived Hom with right action, minimal bounded-above projective replacement and dual detection. VL (8,000–20,000 shared lines). | Yes from standard recollement/adjunction and minimal-complex facts, retaining the case split and construction of unbounded pd witnesses. A bare hypothesis saying one diagonal algebra has infinite findim is circular. |
| Proposition 3.11 `prop:bounded-dimension` | L: Noetherian topology; B/H: finite-dimensional modules; A: pd. | Construct `Rep_d(A)` (specify dimension-vector meaning over an arbitrary field), Tor detection by A/J, finite free resolutions, polynomial matrix rank-open loci. L–VL, 4,000–10,000 shared lines. | The final ascending-open-chain lemma is useful and small. An interface assuming openness proves only the boundedness corollary, not the first assertion; the Tor/rank geometry must remain visible as standard inputs or new proofs. |

### Section 4 — `report/sections/04-trivial-extensions.tex`

| Number and label | (a) Coverage | (b) Missing work and size | (c) Conditional value |
|---|---|---|---|
| Theorem 4.1 `thm:bar-decomposition` | F: ordinary `TrivSqZeroExt`; C: derived category; E: abstract balanced tensor ingredients. | M/E: dg square-zero replacement, bar dg module, K-flatness, base change and naturality; identify all derived powers and locally finite shifted direct sum in D⁻. VL (10,000–30,000+ shared lines). | Yes with general dg/K-flat/base-change facts, while actually building the bar differential, contraction and splitting. Assuming the bar decomposition itself only gives a downstream conditional theorem, not coverage of 4.1. |
| Example 4.2 `ex:derived-powers` | F: finite presented algebras; A/C: pd and shifted complexes. | Concrete six-dimensional path algebra, extension, balanced tensor, resolutions and minimality/nonzero top Ext. M–L (1,000–3,000) after E's concrete tensor bridge, or L with it. | A useful explicit test of derived-versus-ordinary tensor once that comparison is present; ordinary tensor zero alone is insufficient. No need for the entire dg proof of 4.1. |
| Lemma 4.3 `lemma:pd-detection` | A/C: module pd, derived Hom, K-projective comparisons. | Signed extended pd for complexes; minimal bounded-above finite-projective replacements, contractible summand cancellation and simple-module detection. L–VL (4,000–10,000 with H). | Yes with standard minimal-complex existence and Hom-computation; derive the supremum equality, including negative degrees. Replacing it by module pd would change the statement. |
| Proposition 4.4 `prop:pd-formula` | A/C/F: pd, derived category and trivial extension. | E/M, 4.1 and 4.3; simple modules killed by square-zero ideal, tensor-Hom adjunction, infinite sum/product Hom comparison and bounds in nonpositive degrees. M–L after foundations; VL from pin. | Useful downstream of 4.1/4.3, but those are report results, not admissible hidden infrastructure fields. A conditional reduction must explicitly advertise that premise list. |
| Corollary 4.5 `coro:extinction` | A/C: pd bounds, cohomological truncation and triangle exactness. | E: finite right-projective bimodule replacement retaining left action, tensor amplitude, pd of bounded cohomology and numerical sup/max. M–L (1,000–3,000) after 4.4; VL including foundations. | Yes with standard amplitude/truncation facts and an actually formalised 4.4. Merely assuming finite pd iff extinction reproduces the conclusion. Preserve distinct d_L and d_R. |
| Remark 4.6 `rem:k0-invisibility` | K: finite-dimensional kernel-power stabilization; C: shifts. | Triangulated K₀, identification with Zⁿ, induced tensor endomorphism and scalar extension to Q. L shared; S–M for the numerical argument after these. | Yes for any finite-dimensional class invariant compatible with shifts/functor; label it an invariant-level theorem until comparison with K₀ is supplied. |
| Proposition 4.7 `prop:bounded-extinction` | L: Noetherian spaces; E/H: ingredients for finite projective tensors. | `Rep_d`, primitive-idempotent strata, bounded right-projective replacements, polynomial families of restricted differentials and rank-open acyclicity. L–VL, 4,000–10,000 shared with 3.11/E/H. | Yes as a general lemma about an increasing family of open extinction loci. Assuming those loci open leaves the main algebraic-geometric part unformalised. |

### Section 5 — `report/sections/05-selection.tex`

| Number and label | (a) Coverage | (b) Missing work and size | (c) Conditional value |
|---|---|---|---|
| Definition 5.1 `def:selection-data` | B: finite/projective modules; E: bimodules, abstract balanced tensor. | Package k-central actions, finite-dimensional module category, tensor functor and `ENat` extinction time. M (400–1,200) for definitions; exactness and preservation of finite dimension use E/6.9 (L shared). | Selection data are legitimate input structures. A supplied exact endofunctor yields a more abstract extinction theory, but connecting it to the actual Ψ tensor functor remains necessary. |
| Example 5.2 `ex:twisted-corner` | B: direct summands/projective modules; E: commuting actions. | Twisted module, idempotent image, balanced tensor isomorphism and naturality. M (400–1,000) after E; L with the bridge. | Yes on a standard balanced-tensor API; the displayed isomorphism should be constructed, not a field of the example. |
| Proposition 5.4 `prop:rank-obstruction` | K: finite-dimensional endomorphisms and stabilized kernels. | Split K₀, rank evaluation on finite modules, rationalization and induced endomorphism on the visible image. L shared K/E; M (400–1,200) for the cyclic-space/evaluation argument. | Especially useful: an abstract vector space with a cyclic vector, shift-compatible evaluations and dimension detection isolates the genuine linear-algebra proof. It is a reduction until realized by the rank functions; do not assume the extinction bound. |
| Corollary 5.5 `coro:rank-obstruction` | K: group-completion primitives; L: locally constant stalk rank and finitely many irreducible components; H: Artinian basics. | (1) finite generators for split K₀ and finite indecomposable projective list, M after H/K. (2) residue-field/simple-factor formula for χ and component ranks, L. (3) noncommutative universal localisation of hereditary rings and K₀ surjectivity, VL. Overall VL for all three. | Yes, separating the cases. A standard K₀-surjectivity theorem can be an explicit external input for (3), with checked source and approval later. Assuming finite visible rank in every case only invokes 5.4 and omits this corollary's content. |
| Definition 5.6 `def:selection-group` | G: `PresentedGroup` allows an infinite generator type and relation set. | Encode the finite generator types plus integer parameters and the precise relators. S–M (200–500). | No conditional foundation needed. One may also use a group carrying the displayed relations as input for later commutator lemmas, but the presented universal group still needs construction. |
| Proposition 5.9 `prop:group-presentation` | G: presented groups, universal maps and finite presentation predicate. | Define both presentations, prove torus conjugation for all integer exponents, weight-kernel calculations and two inverse maps; convert finite relators to `IsFinitelyPresented`. L (1,500–3,500) including 5.6. | Unconditional is realistic. Abstracting the relations for intermediate lemmas is harmless, but the presentation equivalence is the substance and cannot be assumed. |
| Proposition 5.11 `prop:central-involutions` | G: group operations, commutators, generators and presentation induction. | Transfer identity, independence of all choices, commuting with every generator, square-one argument. M (400–1,200) after 5.6. | Meaningful as a generic group theorem from the listed relations; the actual group instantiates it. No finite-presentation or homological assumptions required. |
| Proposition 5.13 `prop:shift-automorphism` | G: `PresentedGroup.toGroup`, `ext`, group equivalences. | Shift all U parameters, verify relations, inverse at -c, compatibility with z_N. M (300–800). | No missing foundational hypotheses needed; assuming an automorphism with the claimed shift omits this construction. |
| Proposition 5.14 `prop:finite-quotients` | G: GL over a quotient ring, monic power basis, presented-group lift. | Unit t and all integer powers, elementary-matrix relations, finite image, central elementary abelian subgroup and independence. L (1,500–4,000). Must handle m=1 and even m without assuming tᵐ-1 irreducible or squarefree. | Direct unconditional proof is meaningful. A generic transvection lemma can reduce repeated calculations, but a supplied π_m with the desired separation properties assumes most of the proposition. |
| Corollary 5.15 `coro:z-independent` | G: group/subgroup and finite-image tools; B/K: module/group finiteness primitives. | Direct sum of copies of Z/2, injectivity by residue separation, non-finite generation and subgroup inheritance in finitely generated abelian groups. M (500–1,300) after 5.11/5.14. | A useful generic central-involution/separating-quotients theorem; it still proves independence for arbitrary finite support. Actual quotients must be supplied by 5.14. |
| Lemma 5.16 `lemma:selection-iterates` | B/E: twisted actions, images and tensors; iteration/finite products. | Iterate 5.2, track α rather than α⁻¹ and order of idempotents, prove naturality. M (300–700) after concrete tensor/image API. | Yes with standard tensor and restriction-of-scalars laws. An abstract recurrence version is smaller but must be linked to H. |
| Theorem 5.17 `thm:selection-unbounded` | G: group algebra, finite sums and finite quotient representations; E/F: selection bimodule and presentations. | Finite presentation of the noncommutative group algebra (generators and inverses), character projector, nonzero identity coefficient, scalar actions and exact extinction. L (2,000–5,000) after Section 5 prerequisites. | A general theorem for separated central idempotents/characters is useful, but cannot replace verification of this fixed R, Ψ and all Y_m. Treating the whole module family as a field would assume unbounded extinction. |
| Remark 5.18 `rem:selection-visible-rank` | K: linear independence and ranks; G: finite group algebra. | Triangular evaluation matrix proves infinite visible rank; optional induced-character module/dimension identification. M (300–900) after 5.17/K; induction comparison M–L if retained. | Useful invariant-level corollary. Distinguish the rank assertion from the optional representation-theoretic description of Y_m. |

### Section 6 — `report/sections/06-realisation.tex`

| Number and label | (a) Coverage | (b) Missing work and size | (c) Conditional value |
|---|---|---|---|
| Lemma 6.1 `lemma:fractions` | D supplies roofs, right Ore calculus, `exists_rightFraction` and `map_eq_iff_precomp`. | Finite-family induction and additive zero specialization; M (250–700), with empty-family identity denominator. | Unconditional abstract localisation theorem is preferable. Standard Mathlib calculus-of-fractions instances already express exactly the required assumptions. |
| Construction 6.2 `cons:encoding-algebra` | F: quiver paths, free algebra/quotient; B: representations as modules. | Linear path algebra, J₂ quotient and basis, finite presentation quadraticization (immediately preceding the block), M(Y) and its action. L (2,000–5,000 shared). | Can start from an explicit finite quadratic presentation, but arbitrary finitely presented R in later theorems still needs the quadraticization equivalence. Do not build full faithfulness into the definition. |
| Lemma 6.3 `lemma:directed-gldim` | A/B: short exact pd bounds, projective retracts, arbitrary module categories; E: tensor over the field. | Corner-submodule decomposition, the explicit projective surjection, kernel support induction, opposite-ring reversal. M–L (1,000–2,500). | A good unconditional target. The statement covers **all** modules, not only finitely generated ones; field-basis direct sums handle that. Do not replace this by only checking finite-dimensional modules. |
| Proposition 6.4 `prop:encoding-algebra` | F/B: finite vector-space algebras and module categories; A: pd. | Path-basis count, ideal equals J₂, exact fully faithful functor from arrow maps, and instantiate 6.3. M–L (1,000–3,000) after F/6.2. | Yes with a standard path-representation correspondence, but dimension, relation verification and full faithfulness must remain conclusions. |
| Proposition 6.5 `prop:quotient-action` | D: Verdier quotient, linear localisation and triangle functors; F: algebra universal property; C: homotopy/derived categories. | Kᵇ(proj), thick closure, E: evaluation tensor functor, killing generators and descent, algebra action θ on quotient endomorphisms. L (2,000–5,000) after E/F/C packaging. | Yes using genuine localisation and tensor functors; no need to assume Q equivalent to D(R), which the report neither uses nor claims. “Unique factorisation” should be represented up to natural isomorphism, or by a specifically chosen strict localisation. |
| Lemma 6.6 `lemma:cone-splitting` | D: Karoubi, retracts, biproducts, triangle Hom exactness. | Extend shift to Karoubi; exactness on retract Hom groups, splitting construction and Yoneda detection. M–L (700–1,800). | A useful unconditional abstract category theorem. No Frobenius/stable-category theory or triangulation on Karoubi is needed. |
| Proposition 6.7 `prop:odd-double` | D: two cones, full faithful Karoubi embedding; K: group-completion ingredients. | Two explicit decompositions (M, 400–1,000 after 6.6); triangulated K₀ definition and shift additivity (M–L shared). | Yes: prove actual objects C,V and isomorphisms; class-map additivity suffices for a separately labelled conditional invariant conclusion. Assuming the odd-double object exists would discard the main construction. |
| Remark 6.8 `rem:why-three` | A/C/D: Ext vanishing and truncation triangles. | Two-cohomology-object splitting via Ext^{c+1}, integer inequalities and oddness. M (300–800) for the general splitting lemma; S arithmetic thereafter. | Useful with a supplied global-dimension bound; do not infer Ext² vanishing from gldim ≤2. This is a statement about this splitting argument, not impossibility of other shifts by other means. |
| Lemma 6.9 `lemma:selection-matrix` | B: finite projective retract; E: outer actions and field linear algebra; matrices. | Identify endomorphisms of the finite free right module with M_n(R), corner ring with unit ε, tensor-image comparison, exactness and dimension bound. M–L (800–2,000) after E; L shared. | Yes with standard balanced tensor/retract laws. Preserve ρ(1)=ε, not the identity of the ambient matrix algebra; handle Ψ=0 by choosing n≥1. |
| Construction 6.10 `cons:diagram-V` | D: linear categories, finite biproducts and Karoubi; F: relations. | Package B-diagrams, matrix endomorphism action, transport across the chosen odd-double isomorphism, verify relations. M (300–900). | The diagram input fields legitimately record objects, arrows and relations. Existence of its selection instance must follow from 6.7/6.9, not be silently assumed. |
| Lemma 6.11 `lemma:evaluate-V` | D: `functorExtension` to idempotent-complete targets; C: derived category over k. | Show the relevant bounded finite-dimensional derived target is idempotent complete; compare splitting images with ε_Y and shifts/actions. M–L (700–2,000). | Yes with standard splitting/idempotent-completeness facts, while proving the evaluated R-action. Taking only an abstract vector-space isomorphism loses that action. |
| Proposition 6.12 `prop:lifting` | D: right fractions; C: representative chain maps and `homotopyOfEq`. | Restrict to bounded finite-projective complexes, perform three finite denominator choices, lift relations to actual homotopies. M–L (800–2,000) after category packaging and 6.1. | Good abstract conditional input is a genuine localisation functor with Mathlib's calculus. Lifting this finite diagram must be the theorem, with choices made independently of Y. |
| Remark 6.14 `rem:uncontrolled-length` | C: finite support of complexes; D: existential localisation choices. | Formal support bound [a-2,b] for the explicit rectification is S–M. “The argument supplies no bound” is documentary, not an undecidability theorem. | Keep proof-extraction limitations as documentation. A theorem of nonexistence of an algorithm/bound would be a different claim and is not proposed. |
| Proposition 6.15 `prop:rectification` | C: complexes, Hom/homotopy and cones; E: field tensor and enveloping module; F: finite relation basis. | Construct three-column P, verify d² and signs, finite filtration contractions and arrow homotopies, boundedness/right projectivity. L (2,000–5,000) after E/F, potentially VL including them. | Yes with standard chain/tensor/finite-path infrastructure; do not assume rectification. It is particularly useful to prove the block-matrix differential and contraction core directly; a general dg rectification theorem is unnecessary. |
| Theorem 6.18 `thm:realisation` | C/D: derived category, cohomology, truncation and triangle exactness; A: Ext⁴ vanishing from pd ≤2. | Combine 6.5–6.15, translate vertexwise cohomology to B-module isomorphisms, split the degree-0/-3 extension, verify tensor comparison. M–L (800–2,000) after prerequisites; VL cumulatively. | A meaningful assembly theorem only if earlier report results are formalised or openly declared premises of a reduction. The single P must precede ∀Y. Assuming such P is the conclusion. |
| Corollary 6.20 `coro:realisation-iterates` | D: additive functors and shifts; finite biproducts and binomial arithmetic. | Coherent iteration/distribution isomorphisms, multiplicities, zero detection through M. M (400–1,200) after 6.18. | Useful abstract functor theorem from a one-step decomposition. If 6.18 is assumed rather than formalised, state this as a reduction, not missing-infrastructure coverage. |
| Remark 6.21 `rem:realisation-special-case` | B/E: central idempotents and twisted corner actions. | Instantiate n=1, ε=e, ρ(r)=eα(r)e and compare with 5.2. S–M (100–400) after bridges. | No extra foundational assumptions; no left-projectivity or automorphism hypothesis should be added to the endomorphism special case. |

### Section 7 — `report/sections/07-simulation.tex`

| Number and label | (a) Coverage | (b) Missing work and size | (c) Conditional value |
|---|---|---|---|
| Proposition 7.2 `prop:simulation` | F: finite algebra presentations; E: tensor of noncommutative k-algebras; A/C: pd, complexes and shifts. | Radical-square-zero chain algebra K_l, its simple resolution, O/Y/X actions, derived balanced-tensor associativity with **unbounded N**, sign (-1)^{bn}, radical/simple classification and global-dimension tensor bound. L–VL (4,000–10,000 after shared E/F/H; larger cumulatively). | Yes with standard tensor/finite-algebra facts; still construct X and the natural comparison. Restricting to bounded N changes the report statement. Do not use a false unrestricted additivity-of-global-dimension theorem for arbitrary tensor products; the split semisimple quotient of K_l matters. |
| Theorem 7.3 `thm:main` | A/B/F: finite algebra, modules, pd and trivial extensions; E/C/D for construction chain. | All of 4.5, 6.18/6.20, 7.2; finite presentation quadraticization; iteration, nonzero summands and numerical inequalities. M (400–1,200) marginal, VL cumulatively (tens of thousands). | An assembly reduction is valuable but must list those report results as premises, and is not a formalisation down to Mathlib or a permitted interface hiding the article's work. Ordinary standard-infrastructure interfaces could instead leave all constructions to prove. |
| Corollary 7.4 `coro:main` | G: complex group algebra and finite-dimensional representations; A/F: pd and extension. | Section 5 plus 7.3; classify simples of B, B⊗K_l, Δ and Δ⋉X, show count 3(l+2). M–L (600–2,000) marginal; VL cumulatively. | Conditional on all construction theorems it is a useful consequence, not an independent formal counterexample. Preserve one fixed algebra and l for all m. |
| Remark 7.5 `rem:what-is-explicit` | F/G: finite presentations and formulas; C/D: existential choices. | Source/proof dependency analysis and number of arrows; optional effective algorithms and support bounds would be a new project. S for formula counts; narrative not a Lean proposition as written. | Document exactly which witness is noncomputably chosen. Do not encode an unsupported impossibility-of-computation assertion. |
| Remark 7.6 `rem:simulation-bound` | A: numerical pd bounds; E/F/H underpin 7.2. | Instantiate improved l+2 bound and compare to 3l+2; S (50–150) once 7.2 exists. Literature comparison is a provenance assertion. | No additional interface needed for the inequality. A source inventory does not independently verify the cited older bound. |

### Section 8 — `report/sections/08-conversion.tex`

| Number and label | (a) Coverage | (b) Missing work and size | (c) Conditional value |
|---|---|---|---|
| Lemma 8.2 `lemma:complete-resolutions` | A/B: ordinary resolutions and projectives; C: product Hom complex, homotopy and shifts. | I: total acyclicity, stable Hom quotient, complete-resolution comparison. Construct lifts/homotopies in both integer directions, prove factoring-through-projectives criterion, all shifts and naturality/composition; compare positive degrees with Ext. L (3,000–6,000) after quotient setup; VL with full stable infrastructure. | Yes using generic ordinary-resolution/Hom-cohomology facts. The complete-resolution-to-stable-Hom comparison is precisely this lemma and must not be assumed. A supplied equivalence would give only downstream consequences. |
| Lemma 8.3 `lemma:triangular` | B: modules and projective retracts; E: bimodules; C: complexes and exactness. | Construct the triangular algebra and equivalence with triples, L₁/L₂ functors, four Hom formulas, projective and totally acyclic preservation. L (1,500–4,000) including triples API. | Yes with a standard module/triple equivalence and tensor exactness, leaving all listed Hom and preservation statements to prove. Defining a category of triples alone does not identify it with modules over Λ. |
| Theorem 8.4 `thm:conversion` | C: cones and Hom complexes; A: Ext; B: quotients. | I/E and 8.2–8.3; complete resolution starting at the chosen embedding, cone cokernel/sign comparison, endomorphism-complex short exact sequence, δ connecting map and nonprojectivity. L (2,000–5,000) after foundations; VL cumulatively. | Meaningful from standard symmetric/Frobenius theory and concrete balanced tensor, with the cone and δ calculation proved. An abstract exact sequence involving Ext(Z,Z) can isolate a small linear-algebra consequence but assumes the conversion mechanism, so is not coverage of this theorem. |
| Remark 8.6 `rem:conversion-mechanism` | A/C: exact sequences and cokernels. | Generalise the proof to the stated projective-injective/embedding hypotheses; derive the exact sequence without δ vanishing, Ext¹ ≅ coker δ⁰ when δ¹ injective. M (300–1,000) once 8.4 is factored appropriately. | Useful generalization to an appropriate Frobenius setting; no Tate duality or simplicity should enter. Such generalization must preserve the actual module/tensor interpretation. |

### Section 9 — `report/sections/09-ar-counterexample.tex`

| Number and label | (a) Coverage | (b) Missing work and size | (c) Conditional value |
|---|---|---|---|
| Lemma 9.1 `lemma:algebra-C` | N: finite bases and polynomial arithmetic; H: radical/semiprimary basics. | Define the 10-element basis multiplication, prove all associators by multilinearity, grading, N⁵=0 and quotient k²; identify radical. M–L (800–2,000). | Good unconditional finite target. A structure containing associativity/radical conclusions must be instantiated by actual Lean proofs, not by external script output. |
| Proposition 9.3 `prop:C-resolution` | A/B/C: modules, complexes, resolutions, Ext and Hom complex. | Explicit Ce/Cf corners and simple modules, all-i kernels/images with transcendental q, minimality via covers, dual cohomology and right-action comparison to sʳ[-2]. L (1,500–4,000) after 9.1; minimal-cover API shared H. | An explicit exact projective resolution can give Ext conclusions without full minimal theory; that is a useful partial target, but retain a separate missing minimality clause. Finite sampling of i is not coverage of the all-degree theorem. |
| Lemma 9.4 `lemma:T-symmetric` | F: `TrivSqZeroExt`; B: field dual; H: radical. | Define dual bimodule, symmetrising-form predicate/isomorphism, prove trace nondegeneracy, dimension 20, grading/radical with sixth power zero and quotient k². M (500–1,500) after 9.1, without requiring all I. | Good unconditional target. A general theorem that C⋉DC is symmetric could be proved once, then instantiated; assuming symmetry would omit the lemma's main assertion. |
| Theorem 9.5 `thm:T-ext` | A: Ext composition; C/D: derived triangles and Hom exactness; F: extension. | E: DC⊗_C resolution versus dual Hom and induction adjunction; derive degree-three recurrence, package Yoneda algebra and polynomial isomorphism, stable End quotient. L (2,000–5,000) after E/C/I basics and 9.3; VL cumulatively. | Meaningful with generic tensor-Hom duality/comparison. Assuming k[τ] as the Ext algebra is exactly the theorem, though it is a useful explicit premise for later abstract obstructions. Preserve multiplicative, not merely graded-dimension, identification. |
| Lemma 9.7 `lemma:cocycle` | N: finite polynomial identities, multilinear maps; F/B: explicit T. | Encode the exact 179 coefficients, I-balancing, all 18⁴ cocycle identities, weight count, all-λ boundary formula (including inverse action), two evaluations. L (1,500–4,000) for certificate infrastructure and data; kernel-checking cost uncertain. | A strong unconditional certificate target. General Hochschild theory is unnecessary for the displayed identities, but external Python/Sage success is not an admissible hypothesis proving them. Reduce arbitrary inputs by multilinearity. |
| Proposition 9.8 `prop:cocycle-generator` | A/C: cohomology and Ext; N: explicit cycle/evaluation arithmetic. | Relative bar resolution and bar action as chain maps, E: tensor with s, cohomology–Ext comparison; show ζ cycle and evaluation q³ nonzero. M (500–1,500) after M/E/9.7, VL with those foundations. | Yes with a proved generic relative-bar resolution/Ext comparison. A cochain class named τ is insufficient unless the comparison carries the displayed p to that class. |
| Lemma 9.9 `lemma:twist` | B: restriction of scalars ingredients; E: twisted bimodule tensor; A: Ext products. | Natural tensor-to-restriction equivalence with h⁻¹, bar comparison, weight action λ⁻¹ on τ, multiplicativity and all m. M–L (700–2,000) after bar/twist bridges. | Useful if only standard transport-of-Ext facts are inputs. Assuming the scalar action λ⁻ᵐ is the result. Inverse twist convention must be explicit. |
| Proposition 9.10 `prop:E-ext` | E: algebra tensor/enveloping ring; N: bilinear forms and polynomial algebra. | Tensor symmetrising forms, tensor projective resolutions, multiplicative Künneth comparison of Ext, two-generator grading and stable End. L (2,000–5,000) after E/M/I basics; VL cumulatively. | Yes with a standard multiplicative Künneth theorem, not just dimension equality. Still identify τ₁,τ₂ as external products and prove the symmetric forms and nonprojectivity. |
| Proposition 9.11 `prop:E-tate` | B/K/N: finite-dimensional duals and polynomial homogeneous pieces; A: nonnegative Ext. | I: general Tate duality compatible with composition; dual monomial bases, multiplication transposes, kernels and the degree -1 boundary case. M (500–1,500) after 9.10/I. | A useful conditional theorem on a specified Tate pairing and its compatibility. Duality as a premise covers 9.11 conditionally but leaves Theorem 2.1 outstanding; one must not define negative groups as duals and claim they are actual stable Hom without comparison. |
| Lemma 9.12 `lemma:two-cones` | C/D: cones, homotopies, shifts; E: tensor algebras and bimodule ingredients. | M: relative bar tensor complex; I: stable Eᵉ modules and cosyzygy, one-sided splitting/projectivity; construct C_N and representatives, exact stable tensor functors and both evaluated triangles. L (2,000–5,000) after E/I/M; VL cumulatively. | Yes with standard stable/bimodule APIs, while constructing C_N and proving triangle identification. Assuming only two abstract triangles can support 9.13, but omits realization by one bimodule. |
| Proposition 9.13 `prop:two-cone-profile` | D: triangle exactness; K/N: kernels/cokernels of monomial maps. | From 9.11/9.12 compute all integer degrees, commuting second-factor action and composite π[3] isomorphism; residue-class/index cases. M–L (800–2,000). | Particularly useful as a conditional cohomology calculation with explicit genuine triangles and action maps. The comparison to the constructed bimodule remains dependent on 9.12; dimensions alone do not prove the stated π isomorphism. |
| Proposition 9.14 `prop:lifts` | C: cochains, homotopies, cones; E/B: bimodule Hom and tensors; N: trace identities. | Relative bar/Casimir formulas, two homotopies in arbitrary degree, tensor-cone map with degree-zero defect, passage from deep cokernels to stable maps, λ² normalization, socle/radical nonzero proof. L–VL (4,000–8,000) after E/I/M. | Standard bar/stable comparison may be hypothesized, but construction of g_λ and its evaluation must remain proved. A supplied lift of w is essentially the main conclusion and would erase the central difficulty. |
| Proposition 9.16 `prop:fibre` | B: kernels and finite modules; E: tensor; D: triangle exactness; N: 2×2 scalar matrix. | Choose ordinary representatives in Σ⁴C₁, free bimodule cover and F; side-projectivity, triangle after evaluation, δ naturality, rational-function determinant nonzero for every m>0. M–L (1,000–3,000) after I/E/9.14. | Yes with standard stable tensor and representative facts. A useful smaller core proves bijectivity from explicit exact-sequence/action data; that alone does not construct F. The two independent parameters H₁,H₂ must persist. |
| Theorem 9.17 `thm:ar-counterexample` | A/B: Ext and modules; H: radicals; E: tensor algebras; N: characteristic-two field. | Apply 8.4/9.16, radical quotient k⁸ and simple-module count, Ext base change for finitely generated resolutions, preserve total acyclicity and nonprojectivity under every field extension. L (1,500–4,000) marginal, VL cumulatively. | Assembly conditional on the construction chain is only a reduction. With general Ext/base-change facts as infrastructure, the counterexample and scalar-extension conclusions still need all preceding report constructions. Nonprojectivity cannot be assumed to survive just from exactness of scalar extension. |
| Corollary 9.18 `coro:ar-findim` | A: Ext additivity and pd; B/H: endomorphism algebra and finite modules. | H: existence of indecomposable nonprojective summand, basic algebra/simple-count correspondence; 3.7 and full Strong Nakayama bridge. M–L (800–2,000) marginal, VL cumulatively. | Yes with standard finite-decomposition/simple-count facts and proved earlier theorems. After field extension choose a new indecomposable summand; do not assume the original chosen summand stays indecomposable. |
| Remark 9.19 `rem:ar-sizes` | N: finite-dimensional tensor and quotient dimensions, exact integer arithmetic. | Dimension recurrence for Σ and F, exact bar-corner counts for dim C₁=1,623,889,344 and huge integer; M (400–1,200) after structural dimension identities. Historical stopped computation is not a theorem. | Arithmetic certificate is meaningful but conditional on those dimension identities. It must not be advertised as constructing the enormous bimodule or as a lower bound on a minimal construction. |

### Section 10 — `report/sections/10-obstructions.tex`

| Number and label | (a) Coverage | (b) Missing work and size | (c) Conditional value |
|---|---|---|---|
| Proposition 10.1 `prop:one-cone` | D: triangles and Hom exactness; B/K: finite-dimensional vector spaces. | I: actual stable category and Tate pairing; from polynomial positive Ext derive negative-degree multiplication then calculate kernel/cokernel for every integer. M (400–1,200) after I; VL unconditionally from the pin. | Strong candidate for a conditional triangulated-category theorem with an explicit graded Hom profile and multiplication maps. The profile must be distinguished from actual symmetric-algebra Ext unless I is supplied. |
| Proposition 10.2 `prop:one-factor` | D: exact sequences; N/K: dimension and rank. | I/E: stable tensor/action δ; use 10.1 to obtain dim V⁰=2, image dimension ≤1; 8.4's exact sequence connects coker δ⁰ to Ext¹. M (400–1,000) marginal. | Yes as a rank obstruction from explicit triangle/action data; the Ext¹ assertion additionally needs the conversion comparison. Assuming only dimensions without maps omits the non-surjectivity mechanism. |
| Corollary 10.3 `coro:one-factor` | B: finite-dimensional nondegenerate pairing; D: shifts/composition. | I: composition-compatible Tate duality gives a right factor γτ=β₀, then vanish in U⁻³. S–M (200–600) after I/10.1. | Yes, retaining pairing compatibility and the particular order of multiplication. Merely having a vector-space duality is too weak. |
| Theorem 10.4 `thm:tate-obstruction` | D: triangles, shifts and Hom exactness; B: field duals/linear maps. | J: bracket definition, nonempty/coset law and graded juggling; I: stable Tate with perfect composition pairing; degree cases and factorisation through nonzero τ. M–L (700–2,000) for the obstruction after I/J; VL cumulatively. | High-value conditional target: a k-linear triangulated setting with the stated perfect pairings and Hom vanishings leaves the factorisation and bracket argument genuine. The bracket must be defined by systems; never assume the target bracket is zero or install it as the zero operation. |
| Corollary 10.5 `coro:tate-obstruction` | Polynomial grading and integer arithmetic; D/J: bracket target and nonemptiness. | Apply 10.4 at p=3; for p>3 prove the composites vanish, bracket nonempty and target H^{p-3}=0. S–M (150–400) after I/J. | Yes on the same interface. Vanishing of the target alone is not enough to conclude equality with {0} without definedness/nonemptiness. |
| Remark 10.6 `rem:weights` | N: gradings, scalar automorphisms; J: genuine bracket; F: trivial extension. | Internal grading on stable classes, twist eigencharacters, equivariance of Toda brackets, trace weight for β₀; external six-dimensional example separately encoded. L (1,500–4,000) after I/J; example M–L extra. | A useful abstract weight/equivariance lemma, provided characters are distinguishable. For arbitrary finite fields, differing integer weights need not give distinct scalar characters; use actual grading or a sufficiently rich scalar extension. Do not infer universal weight vanishing from an unqualified scalar-eigenvalue argument. |

## Feasible boundaries and suggested order

These priorities and sizes are **heuristic**, not a new formalisation scope
or authorization to write Lean.

1. **Complete the existing Part I correspondence.** Proposition 3.1 already
   has a close project-source counterpart. For Theorem 3.3, first connect
   actual Ext vanishing to the dual complex's exactness; then handle the
   separately missing transpose/minimality clause. The present
   `StrongNakayama.unbounded` does not finish those obligations.
2. **Independent unconditional targets.** Lemma 6.1 (finite fractions),
   Lemma 6.6 (splitting in Karoubi), the elementary group constructions of
   Section 5, and the finite multiplication/symmetrising-form calculations
   of Lemmas 9.1 and 9.4 can proceed without the full stable/dg library.
   They are separate M/L projects, not prerequisites that must all be
   completed before anything useful can be formalised.
3. **Abstract conditional targets.** The rank obstruction of Proposition
   5.4, odd-double argument of Proposition 6.7, two-cone calculation of
   Proposition 9.13 and Tate obstruction of Theorem 10.4 have useful
   mathematical content after explicit standard infrastructure is supplied.
   Use actual linear maps, triangle maps and composition-compatible pairings;
   retain sign, integer-degree and definedness obligations. A theorem in
   this abstract setting must be reported separately from its application
   to the report's concrete algebras.
4. **Shared foundations before either full counterexample.** Develop E's
   concrete balanced tensor and derived comparison, H's required finite
   representation theory, and either M's bar/dg package for Sections 4–7
   or I's stable/complete-resolution/Tate package for Sections 8–10.
   General derived categories and Verdier localisation already exist and
   should be reused. The remaining work is VL; summing every row's estimate
   would substantially overcount shared foundations.
5. **Assemble only after preserving quantifiers.** Theorem 7.3 needs one
   fixed algebra and a family with arbitrarily large finite dimensions;
   Theorem 9.17 needs the actual algebra/module and the scalar-extension
   assertion. Interfaces containing these families or conclusions merely
   relocate the central results. A conditional reduction to earlier report
   theorems is still useful bookkeeping, but is not full Mathlib coverage.

The earlier Part I note should therefore not be extrapolated to the whole
report. In particular, this pin contains ordinary noncommutative trivial
extensions, abstract bimodule tensor products, K-projective comparisons,
triangulated localisation and finite-group Tate cohomology. Conversely, these
names do not supply general symmetric-algebra Tate theory, concrete derived
noncommutative tensor calculus, or a ready-made triangulated K₀.

## Search method and completion receipt

**Supported source evidence.** Searches used the local pinned checkout only:
filename inventories with `rg --files`, declaration-name searches with `rg -n`,
and reads of the surrounding signatures, namespaces and hypotheses. Relevant
search families included the following (run from the Mathlib checkout):

```sh
rg -n 'HasExt|hasExt_of_enoughProjectives|HasProjectiveDimension|projectiveDimension' Mathlib
rg -n 'RightFraction|map_eq_iff_precomp|exists_rightFraction|trW|karoubiUniversal' Mathlib/CategoryTheory
rg -n 'TrivSqZeroExt|tensorBimod|isKProjective_of_projective|Qh_map_bijective' Mathlib
rg -n 'PresentedGroup|IsFinitelyPresented|mapDomainAlgHom|powerBasis' Mathlib/GroupTheory Mathlib/Algebra/MonoidAlgebra Mathlib/RingTheory/AdjoinRoot.lean
rg -ni 'Toda|Massey|KFlat|FrobeniusCategory|FrobeniusAlgebra|StableModule|PathAlgebra|GorensteinProjective|ProjectiveCover|MinimalResolution|Krull.Schmidt|Hochschild|universal locali[sz]ation' Mathlib
rg -ni 'dg algebra|dg module|differential graded algebra|differential graded module|K.flat' Mathlib/Algebra/Homology Mathlib/CategoryTheory
rg -ni 'GrothendieckGroup|Grothendieck group|finitistic|globalDimension' Mathlib
```

Negative findings also used spelling variants and filename searches. The
non-relevant hits included the symmetric tensor algebra, arithmetic Frobenius
and Frobenius reciprocity, a comment mentioning Krull–Schmidt in
`Mathlib/CategoryTheory/Preadditive/Mat.lean`, the monoid Grothendieck group,
and a Hochschild–Serre TODO in group cohomology. They were not counted as
implementations of the requested theories. No negative search proves that
an equivalent unnamed construction cannot be assembled from existing code.

**Coverage check.** An inline read-only Python scan stripped TeX comments,
counted theorem-like environments and the intervening numbered equations
using the shared counter, and compared each result with its inventory row.
All 78 labels also matched their numbers in the existing
`report/build/main.aux`. The three unlabelled blocks are Remarks 3.2 and 3.4
and Example 3.9; their reported source lines were checked. Section counts:

| Section | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | Total |
|---|---|---|---|---|---|---|---|---|---|---|
| Numbered result blocks | 2 | 11 | 7 | 13 | 17 | 5 | 4 | 16 | 6 | 81 |

The unnumbered introduction theorem and numbered equations do not add new
result rows. All four appendices were checked for numbered result
environments; none occur. Each row has the requested (a), (b) and (c), with
bibliographic-style cross-references A–N to the actual source files and
located declarations. Estimates are deliberately absent for purely
historical/documentary remarks where no new Lean theorem is proposed.

**Snapshot.** The source fingerprint is
`59ff8141caf92ada1e1b2935ef65073b1155dc51b466569ba90ee5875295afa0`.
This is SHA-256 of the concatenation, in order, of `report/main.tex` followed
by the lexicographically sorted 14 `report/sections/*.tex` files; each entry
is its repository-relative UTF-8 path, a NUL byte, its raw bytes, and a NUL
byte. It identifies the inspected source despite concurrent report-review
edits elsewhere in the workspace. The Lean toolchain and Mathlib pin are
recorded at the start of this file.

**Limits and write boundary.** This job wrote only
`lean/FEASIBILITY-report-inventory.md`. The Lean repository remained read-only;
its Git working tree was clean when inspected. No Lean/Mathlib build, import
check, axiom report, kernel replay, download, report build, commit or push
was performed. File/declaration searches are source evidence, not an
elaborated test of the proposed formal statements or a proof of the report.
Other workspace edits belong to concurrent work and were left untouched.
