# Comparison of the report's Lean formalisation with OpenAI's (round 2, 2026-10-09)

By a fresh Claude Opus 5.5 session, reading the sources only (nothing built; no implication checked in Lean). A: `lean/formalisation/` (Lean 4.33.1, Mathlib `0df444a3`). B: openai/math `fd4aeeb2`, trees `lean/OAI/Algebra/{Finitistic,AuslanderReiten,FinitisticAsymmetry}` and `lean/OAI/RingTheory/Tachikawa` (Lean 4.34.1, Mathlib `d13f23b7`); B paths below are relative to `lean/OAI/` with `Algebra/` or `RingTheory/` omitted, and B names carry the prefix `OAI.`. "Equivalent" means mathematically equivalent statements, judged by reading. Status: plausible.

# Comparison of the report's Lean formalisation (A) with OpenAI's (B)

Reviewer: Claude Opus 5.5 (subagent), effort unknown. Reading only; nothing built, no Lean run. Status of every
verdict below: reading of the Lean source by an AI model (plausible; "supported" where the two statements were put
side by side term by term). No implication between A and B was checked in Lean: A and B use different Lean and
Mathlib revisions and no file imports the other, so "equivalent" or "implies" below is meant mathematically.

- A: `lean/formalisation/` of findim-report-private (Lean 4.33.1, Mathlib 0df444a3); statements from
  `lean/gates/main-103c2b4/4-statements.log` (namespace `FindimCounterexample`).
- B: openai/math fd4aeeb2 (Lean 4.34.1, Mathlib d13f23b7), read-only copy in ``
  (`Finitistic` = `OAI/Algebra/Finitistic`, `AuslanderReiten`, `FinitisticAsymmetry`, `Tachikawa` =
  `OAI/RingTheory/Tachikawa`). Paths below are relative to ``; all B names live under
  `OAI.`.

Relation scale: **equivalent/implies** (B's statement is mathematically the same as A's or implies it, possibly
after reindexing or renaming); **special case** (B proves A's statement only for a specific object); **related**
(B has a statement with a different form, different hypotheses, or a strictly weaker/stronger content, or has the
ingredients but not the statement); **none** (nothing found; searches listed).

## Table

| A's item | A's declarations | B's counterpart (file, declaration) | Relation | Notes |
|---|---|---|---|---|
| 1. Prop. 3.1 (projective coresolutions, arbitrary abelian category) | `ProjectiveCoresolution.hasProjectiveDimensionLE`, `.not_hasProjectiveDimensionLT`, `.projectiveDimension_eq` | none | none | B never uses coresolutions by projectives; its pd results go through minimal resolutions and Tor against simples over finite-dim. algebras. Nearest general pd lemma: `Tachikawa/DerivedDescent.lean`, `Tachikawa.projective_dimension_of_bounded_resolution` (bounded projective resolution ⇒ pd ≤ d), unrelated in content. |
| 2a. Ring duality for f.g. projectives | `RingDual.freeDualEquiv`, `.evalEquiv`, `.rightDual_projective`, `.rightDual_finite`, `.split_of_dual_split` | `FinitisticAsymmetry/Nakayama/Minimality.lean`, `LittleFinitistic.Nakayama.split_of_dual_surjective` | related (for `split_of_dual_split`); none for the rest | B's lemma: dual map surjective ⇒ map split mono; A's: dual map split mono ⇒ map split epi. Different directions and hypotheses. B has no Hom_A(-,A) duality between left and right f.g. projectives; its `RightDual`/`LeftDual` (`AuslanderReiten/Duality/RightDual.lean`, `Tachikawa/FiniteCoinduction.lean`) are k-duals. |
| 2b. Thm. 3.3, strong Nakayama criterion, arbitrary ring | `ExactCoresolution.coresolution`, `StrongNakayama.coresolution`, `.projective_zero`, `.cok_finite`, `.not_projective_one`, `.projectiveDimension_eq`, `.unbounded`, `.homRightDualEquiv`, `.homDifferential_eq_dualDifferential`, `.ext_vanishing_iff_dual_exact`, `.projectiveDimension_eq_of_ext`, `.unbounded_of_ext` | none | none | No statement deriving modules of projective dimension exactly n from exactness of a dual complex, in general or for B's algebras. B's finitistic theorem does not pass through Thm. 3.3/3.7. |
| 2c. Ext via resolutions, abelian category | `ResolutionExt.ext_zero_iff_injective`, `.ext_succ_iff_cocycles_boundaries`, `.ext_vanishing_iff` | `Tachikawa/StableDuality.lean`, `Tachikawa.ext_subsingleton_of_boundaries`; `Tachikawa/Nakayama.lean`, `Tachikawa.boundaries_of_ext_subsingleton` | equivalent/implies for `ext_succ_iff_cocycles_boundaries` (the two B lemmas together); none for degree 0 and for `ext_vanishing_iff` | Same setting: `[Category C] [Abelian C] [HasExt C]`, `P : ProjectiveResolution X`. B states the two directions separately. B also has the injective-resolution version `Tachikawa.ext_subsingleton_of_coboundaries` (`Tachikawa/Coresolution.lean`), one direction only. |
| 2d. Module resolutions | `ModuleResolution.projectiveResolution`, `ModuleResolution.ext_vanishing_iff` | `Tachikawa/StableDuality.lean`, `Tachikawa.resolutionOfExact` | equivalent (same construction) for `projectiveResolution`; none for `ext_vanishing_iff` | B's input uses `Function.Exact` and categorical `Projective`; A's uses `range = ker` and `Module.Projective`. Both are data, not theorems. |
| 2e. Transpose | `Transpose.presentedModule`, `.ofPresentation`, `.cok_eq_transpose`, `.syzygy`, `.presentationCokernelEquivSyzygy`, `.presentationCokernelIsoSyzygy` | none | none | `transpose` in B (`Tachikawa/Nakayama.lean`, `Tachikawa/FiniteCoinduction.lean`) means transposing k-duals, not the Auslander transpose. |
| 3a. Group G of Def. 5.6 (presented group) and its universal property | `SelectionGroup.G`, `SelectionGroup.Relator` (and constructors), `SelectionGroup.lift` | `Finitistic/Selection/GroupSelection.lean`: `LittleFinitistic.Presentation.AuxiliaryGroup`, `.Equation`, `.relators`, `.ofData`, structure `LittleFinitistic.SelectionGroupData` | equivalent (isomorphic presentations, by inspection) | B has 3 extra generators `W i i a` (all a) set to 1 by `diagonalW`; otherwise the same generators, relations and torus conventions (B's `if l=i then 1 else 0` signs = A's `step`). No isomorphism between the two groups is formalised anywhere. |
| 3b. Prop. 5.7, finite presentation | `SelectionFinite.finitelyPresented : Group.IsFinitelyPresented SelectionGroup.G` (with `SelectionFinite.P`, `.presentationEquiv`, `.card_generator = 15`, `.relations_finite`, `.torus_conjugation`, ...) | `Finitistic/Selection/FinitePresentation.lean`, `LittleFinitistic.FinitePresentation.auxiliaryGroup_isFinitelyPresented : Group.IsFinitelyPresented Presentation.AuxiliaryGroup` (with `Model`, `presentationEquiv`, `seedGenerator_card = 18`, `rule_card = 159`) | equivalent (for the isomorphic group) | Same Mathlib notion `Group.IsFinitelyPresented` (different Mathlib revisions). |
| 3c. Prop. 5.8, central involutions z_N | `SelectionCommutator.transfer`, `SelectionGroup.commutator_transfer`, `.commutator_eq_of_sum`, `.z_eq`, `.z_mem_center`, `.z_sq` | `Finitistic/Selection/GroupSelection.lean`: `LittleFinitistic.commutator_transfer`, `SelectionGroupData.split_transfer`, `.splitting_independent`, `.centralZ_eq`, `.centralZ_involution`; `Presentation.z_central`, `Presentation.z_involution` | equivalent | `commutator_transfer` is A's `transfer` with hypotheses written as `x*y = u*y*x` instead of `⁅x,y⁆ = u`. B's `z N := ⁅U 0 0, V 0 N⁆`, A's `z N := ⁅U 0 N, V 0 0⁆`; equal by the splitting lemmas in either. |
| 3d. Prop. 5.10, shift automorphisms | `SelectionGroup.beta`, `.beta_T`, `.beta_U`, `.beta_V`, `.beta_W`, `.beta_add`, `.beta_zero`, `.beta_z`, `.alpha_z` | `Finitistic/Selection/GroupSelection.lean`: `Presentation.shiftAut`, `shiftHom_T/U/V/W`, `shiftHom_comp`, `shiftHom_zero`, `shiftAut_z` | equivalent | Same action (U i r ↦ U i (r+k), T, V, W fixed). `beta_add`/`beta_zero` are stated in B for `shiftHom`, not for the `MulEquiv`. |
| 3e. Prop. 5.13, finite quotients π_m, every m ≥ 1 | `FiniteQuotientRing.S`, `.basis`, `.finite`, `.t`, `.t_pow`, `.linearIndependent_tPow`; `FiniteQuotients.pi`, `.pi_T_matrix`, `.pi_U_matrix`, `.pi_V_matrix`, `.pi_W_matrix`, `.pi_z_matrix`, `.finite_F`, `.coordinates`, `.coordinates_injective`, `.coordinates_range`, `.centerEquiv`, `.centerEquiv_generator`, `.z_image_mem_center`, `.Z_le_center` | `Finitistic/Selection/FiniteQuotient.lean`: `CyclicRing`, `cyclicBasis`, `cyclicRing_finite`, `cyclic_root_pow`, `cyclic_root_isUnit`, `cyclic_powers_independent`, `centralEmbedding_injective`; `Finitistic/Selection/MatrixModel.lean`: `matrixT/U/V/W`, `matrixRepresentation`, `matrixRepresentation_z`, `cyclicRepresentation`, `finiteQuotientGroup_finite`, `finite_central_quotient`, `quotientCentralEmbedding_*` | equivalent, except `coordinates_range`/`centerEquiv` (related) | Same ring F₂[t]/(t^m−1), same 5×5 matrices (B's `matrixRepresentation` is over any commutative ring of characteristic 2 with a unit r). B proves: image finite, (F₂)^m → image injective, central, basis ↦ π_m(z_i). B does not state that the image of (F₂)^m is the subgroup generated by the π_m(z_i) (A's `coordinates_range`), which follows in a few lines. |
| 3f. Cor. 5.15, independence of the z_N; center not f.g. | `SelectionGroup.centralSum`, `.centralSum_single_one`, `.centralSum_injective`, `.centralProduct_range`, `.centralSubgroup_map`, `.directSumEquiv`, `.directSumEquiv_single`, `.center_not_finitelyGenerated`, `.center_not_fg` | none (ingredients only) | related | B has `finite_central_quotient` (z_0,…,z_{m−1} independent after π_m) and `shiftAut_z`, from which the corollary follows on paper, but no statement about the centre of the group, about ⊕_ℤ F₂, or about finite generation. Searched: `FG`, `Group.FG`, `Finsupp`, `→₀`, uses of `Presentation.z`. |
| 4. Prop. 5.4, rank obstruction as linear algebra | `RankObstruction.apply_pow_eq_zero_of_eventually`, `.apply_pow_finrank_eq_zero`, `.extinction_bound` | none | none | B has no counterpart (the proposition explains why a K₀ route fails; B does not need it). Searched: `Module.End`, `Module.Dual`, `finrank` with powers, `Finitistic/Iteration/*` (extinction there is for iterated functors on derived objects, not linear algebra). |
| 5a. Lemma 6.1, common denominators | `Stage3cFractions.exists_common_denominator_finset`, `.exists_common_denominator`, `.exists_equalising_denominator_finset`, `.exists_equalising_denominator`, `.exists_annihilating_denominator` | `Finitistic/Localization/DiagramLifting.lean`: `LittleFinitistic.DiagramLifting.finite_roof`, `.finite_zero_refinement` | equivalent/implies for `exists_common_denominator(_finset)` and `exists_annihilating_denominator`; related for `exists_equalising_denominator(_finset)` | Same setting (`L.IsLocalization W`, `W.HasRightCalculusOfFractions`). B indexes by `Fin n`; A by `Finite ι` or a `Finset`. `finite_zero_refinement` needs only `HasZeroMorphisms` and `L.PreservesZeroMorphisms`, so it is more general than A's preadditive version. B has no equalising version for non-preadditive categories (in the preadditive case it follows from `finite_zero_refinement` applied to f − g). |
| 5b. Lemma 6.6, cone splitting in Karoubi | `Stage3cConeSplitting.coneSplittingIso` (with `nonempty_iso_of_hom_exact`, `nonempty_iso_of_complementary_retracts`; `Stage3cKaroubi.*`: `shift`, `shift_obj_X/p`, `shift_map_f`, `shift_additive`, `shiftAddIso`, `shiftToKaroubiIso(_hom_f/_inv_f/_naturality/_inv_naturality)`, `karoubi_hasBinaryBiproducts`, `lift_exact`, `coyoneda_exact₁/₂/₃`) | `Finitistic/Localization/OddDouble.lean`: `LittleFinitistic.OddDouble.cone_splitting`, `.regular_cone_iso`, `.formalShift`, `.formalShiftFunctor` (+ `Additive` instance), `.formalShiftAdd` | related (different formulation of the same lemma); equivalent for the shift on Karoubi; none for the Karoubi exactness lemmas and the two abstract splitting criteria | B: if `T.mor₁ ≫ u ≫ T.mor₁ = T.mor₁` then `toKaroubi T.obj₃ ≅ formalCokernel ⊞ formalKernel` (Nonempty). A: given decompositions of `T.obj₁`, `T.obj₂` in Karoubi in which `T.mor₁` is `fst ≫ inl`, an explicit iso `T.obj₃ ≅ B ⊞ A[1]`. Each yields the other on paper; neither direction is formalised. B's `formalShift` has the same X and p as A's `shift`. |
| 5c. Prop. 6.7 without K₀ (odd doubles) | `Stage3cOddDouble.exists_odd_doubles` (with `firstDouble`, `thirdDouble`, `shiftedDecomposition`, `complementDecomposition`, `complement_matrix`) | `Finitistic/Localization/OddDouble.lean`: `LittleFinitistic.OddDouble.odd_double_one`, `.odd_double_three`, `.odd_double_three_nested` | equivalent | Same hypotheses (preadditive pretriangulated `C`, arbitrary `U : Karoubi C`), same conclusion up to `formalShift U n` vs `(shift n).obj U`. A also gives the isomorphisms as data (`firstDouble`, `thirdDouble`); B only `Nonempty`. |
| 6. Section 10 under `TateDuality`, `PolynomialSelfExtensions` (Toda brackets) | `Stage4a.TateDuality`, `.PolynomialSelfExtensions`, `.TateDuality.right_factorization`, `.Toda.bracket_nonempty`, `.Toda.bracket_eq_coset`, `.Toda.juggling`, `.Toda.bracket_eq_of_distinguished_cones`, `.tate_obstruction`, `.HigherObstruction.polynomial_toda_eq_zero`, `Stage4aRank.oneFactor_rank`, `Stage4a.beta_comp_eq_zero`, `.beta_shift_comp_eq_zero`, `.Cone.oneCone_i_bijective`, `.Cone.oneCone_pi_bijective`, `.Cone.oneCone_profile`, `.Cone.oneCone_composite_zero`, `.one_factor_rank`, `.one_factor_obstruction` | none for the conclusions; for the hypotheses only concrete module-level analogues: `AuslanderReiten/Duality/FiniteStableDuality.lean`, `ArExplicit.FiniteLeftModule.stableDuality`; `AuslanderReiten/Ext/TExtPolynomial.lean`, `tSelfExt_zero_of_not_dvd`, `tExtCoefficientEquiv`, `tTauPower_mul` | none (conclusions); related (hypotheses) | No Toda brackets, no `ShiftedHom` pairings, no pretriangulated stable category in B (searched `Toda`, `Massey`, `ShiftedHom`, `Pretriangulated`, `distTriang` in `AuslanderReiten`, `Tachikawa`). B's stable duality is a linear iso `Dual k (StableHom R M N) ≃ StableHom R N (ΩM)` for a finite-dim. algebra with symmetric trace (Tate duality in one degree, on stable Hom quotients of module maps); B's T-Ext results give Ext^*_T(s,s) ≅ k[τ], |τ| = 3, for its specific algebra (module Ext, n ≥ 0). Neither is an instance of A's interface structures. |

## Item 1: Proposition 3.1

A: for `R : ProjectiveCoresolution 𝒞` (short exact sequences `0 → c n → p n → c (n+1) → 0` with `p n` projective) in
an arbitrary abelian category, `Projective (R.c 0) → ∀ n, HasProjectiveDimensionLE (R.c n) n`, and
`¬ Projective (R.c 1) → ∀ n, ¬ HasProjectiveDimensionLT (R.c (n+1)) (n+1)`.

B: none. Searches: `HasProjectiveDimensionLE`, `HasProjectiveDimensionLT`, `projectiveDimension` over all four trees
(48 files); `ShortExact` near projective-dimension statements (only inside proofs in
`FinitisticAsymmetry/Kasch/FiniteDimension.lean` and `FinitisticAsymmetry/Transport/ProjectiveDimension.lean`, which
use Mathlib's dimension-shifting); `coresolution` (only `Tachikawa.coresolutionOfExact`, an injective resolution of
modules). B's projective-dimension machinery (`Finitistic/Dimension/*`: `PDMinimal.pdLE_iff_term_zero`,
`pdLE_iff_simpleTor_zero`, `le_projectiveDimension_of_nonzero_Tor`) is for finite-dimensional algebras over a field
and detects pd through minimal resolutions and Tor against simples. It is a different route to lower and upper pd
bounds and does not contain Proposition 3.1.

## Item 2: Theorem 3.3 and its supporting lemmas

**Strong Nakayama criterion and transpose (2b, 2e): none.** Searched: `transpose` (B's occurrences concern k-duals
in `Tachikawa/Nakayama.lean` and `Tachikawa/FiniteCoinduction.lean`); `Ext … (ModuleCat.of R R)` (only the AR
challenge statement, `Statement.lean`, and concrete computations for B's specific algebra C in
`AuslanderReiten/Ext/BaseExt.lean`, `ExceptionalExt.lean`); exact-projective-dimension statements of the form
`HasProjectiveDimensionLE … ∧ ¬ HasProjectiveDimensionLT …` (none). B's Finitistic proof does not use Theorem
3.3 or Theorem 3.7: it bounds pd of explicit modules N_m directly.

The nearest B material is in `FinitisticAsymmetry/Nakayama` and `FinitisticAsymmetry/Rickard`: the Nakayama functor
`LittleFinitistic.Nakayama.functor` (M ↦ D Hom_R(M,R), for a finite-dimensional k-algebra), the lemma
`nakayamaComplex_hom_exact` (exactness of Hom(DA, ν P) from exactness of P), and

```lean
lemma split_of_dual_surjective {P Q : ModuleCat.{u} R} (F : Frame R P)
    (d : P ⟶ Q) (h : Function.Surjective (LinearMap.lcomp k R d.hom)) :
    ∃ s : Q ⟶ P, d ≫ s = 𝟙 P
```

(`k R : Type u`, `[Field k] [Ring R] [Algebra k R]`; `Frame R P` is a finite dual basis, which exists for f.g.
projective P by `frame_nonempty`). This says: if Hom(d, R) is surjective, d is a split mono. A's
`RingDual.split_of_dual_split` says: for f : P → P' between f.g. projective right modules, if the dual map f* has a
left inverse, f has a right inverse. These are different statements (direction, hypothesis); neither is a
reformulation of the other without extra argument. Classification: related. A's `freeDualEquiv`, `evalEquiv`
(double-dual iso for f.g. projective right modules over an arbitrary ring), `rightDual_projective`,
`rightDual_finite`: none in B (B's `RightDual`, `LeftDual` are k-linear duals of modules over a k-algebra, and
`Tachikawa.Nakayama.evaluationEquiv` is about k-duals).

**Ext via resolutions (2c).** A:

```lean
ResolutionExt.ext_succ_iff_cocycles_boundaries {C} [Category C] [Abelian C] [HasExt C] {X Y : C}
  (R : ProjectiveResolution X) (n : ℕ) :
  Subsingleton (Abelian.Ext X Y (n + 1)) ↔
    ∀ f : R.complex.X (n + 1) ⟶ Y, R.complex.d (n + 2) (n + 1) ≫ f = 0 →
      ∃ g, R.complex.d (n + 1) n ≫ g = f
```

B (`Tachikawa/StableDuality.lean` and `Tachikawa/Nakayama.lean`, namespace `OAI.Tachikawa`):

```lean
theorem ext_subsingleton_of_boundaries {C : Type*} [Category C] [Abelian C] [HasExt C]
    {X Y : C} (P : ProjectiveResolution X) (n : ℕ)
    (h : ∀ f : P.complex.X (n+1) ⟶ Y, P.complex.d (n+2) (n+1) ≫ f = 0 →
      ∃ g : P.complex.X n ⟶ Y, P.complex.d (n+1) n ≫ g = f) :
    Subsingleton (Abelian.Ext X Y (n+1))
lemma boundaries_of_ext_subsingleton {C : Type*} [Category C] [Abelian C] [HasExt C]
    {X Y : C} (P : ProjectiveResolution X) (n : ℕ) [Subsingleton (Abelian.Ext X Y (n+1))]
    (f : P.complex.X (n+1) ⟶ Y) (hf : P.complex.d (n+2) (n+1) ≫ f = 0) :
    ∃ g : P.complex.X n ⟶ Y, P.complex.d (n+1) n ≫ g = f
```

Together these are exactly A's iff, in the same generality (universe-polymorphic `C`, same Mathlib API
`extMk_eq_zero_iff`). A's degree-0 statement `ext_zero_iff_injective` and the combined `ext_vanishing_iff`: none in
B (searched `Ext … 0`, `ext_zero`; B's occurrences are concrete vanishing results). Both proofs are thin wrappers
around Mathlib's `ProjectiveResolution.extMk_eq_zero_iff`.

**Module resolutions (2d).** A's `ModuleResolution.projectiveResolution` and B's

```lean
def Tachikawa.resolutionOfExact (M : ModuleCat R) (P : ℕ → ModuleCat R)
    (d : ∀ n, P (n+1) ⟶ P n) (ε : P 0 ⟶ M)
    (hd : ∀ n, Function.Exact (d (n+1)) (d n))
    (hε : Function.Exact (d 0) ε) (surj : Function.Surjective ε)
    (proj : ∀ n, Projective (P n)) : ProjectiveResolution M
```

build the same `ProjectiveResolution` from an exact sequence (`ChainComplex.of`), with equivalent inputs. A's
`ModuleResolution.ext_vanishing_iff` (all Ext^n(E,N) vanish iff the Hom complex is exact): none in B as a
statement. A's `ExactCoresolution.coresolution` (building A's `ProjectiveCoresolution` from an exact sequence):
none; B's `Tachikawa.coresolutionOfExact` builds an `InjectiveResolution`, a different object.

## Item 3: the group of Section 5

**The group.** A's `SelectionGroup.G := PresentedGroup SelectionGroup.relations`, generators `torus l` (l : Fin 3)
and `root s r` with `s ∈ {u i, v i, w ij}` (ij an ordered pair of distinct indices, 6 of them). B's
`Presentation.AuxiliaryGroup := PresentedGroup relators`, generators `T i`, `U i a`, `V i a`, `W i j a` for all
`i j : Fin 3` (including i = j) and the relations of `Presentation.Equation`. Relation by relation:
`squareU` = A's `involution`; `commuteUU/VV/UV` = `uu/vv/uv`; `commuteWU (h ≠ i)` = `wu`; `commuteWV (h ≠ j)` =
`wv`; `commutatorUW` = `uw`; `commutatorWV` = `wv_transfer`; `commuteTT` = `torus`; `conjTU/TV/TW` = `conjugation`,
with the same signs (A's weights: u_i ↦ −e_i, v_i ↦ e_i, w_ij ↦ e_i − e_j; B: `a - if l=i`, `a + if l=i`,
`a + [l=i] − [l=j]`); `diagonalW : W i i a = 1` is B's only extra relation and kills B's only extra generators.
So the two presentations define isomorphic groups (Tietze move; plausible by inspection, not formalised). B's
`ofData : AuxiliaryGroup →* G` from `SelectionGroupData G` is the universal property corresponding to A's
`SelectionGroup.lift`; the data differ only by the diagonal W's (set them to 1). Equivalent.

**Finite presentation.** B: `LittleFinitistic.FinitePresentation.auxiliaryGroup_isFinitelyPresented :
Group.IsFinitelyPresented Presentation.AuxiliaryGroup`, via `presentationEquiv : Model ≃* AuxiliaryGroup` with
`Model := PresentedGroup finiteRelators`, 18 generators (A: 15; B keeps the three diagonal W's) and 159 indexed rule
patterns. A: `SelectionFinite.finitelyPresented : Group.IsFinitelyPresented SelectionGroup.G`. Equivalent for
isomorphic groups; the B statement transfers to A's group only through the unformalised isomorphism.

**Central involutions.** B's `commutator_transfer (x y v u w : G) (hu : x*y = u*y*x) (hw : y*v = w*v*y)
(hxv : Commute x v) (hwu : Commute w u) (hwv : Commute w v) : ⁅x,w⁆ = ⁅u,v⁆` is A's
`SelectionCommutator.transfer {x w v p q} : Commute x v → ⁅x, w⁆ = p → ⁅w, v⁆ = q → Commute q p → Commute q v →
⁅x, q⁆ = ⁅p, v⁆` under (A's x, w, v, p, q) = (B's x, y, v, u, w), since `⁅x,y⁆ = u ↔ x*y = u*y*x`. B's
`SelectionGroupData.split_transfer` and `splitting_independent (i j a b c d) (hsum : a+b = c+d) :
⁅U i a, V i b⁆ = ⁅U j c, V j d⁆` give A's `commutator_transfer` and `commutator_eq_of_sum`; `centralZ_eq` is A's
`z_eq`; `Presentation.z_central (N) (g) : Commute (z N) g` is A's `z_mem_center`; `z_involution : z N * z N = 1`
is A's `z_sq`. Equivalent.

**Shift automorphisms.** B's `shiftAut k : AuxiliaryGroup ≃* AuxiliaryGroup` with `shiftHom_T/U/V/W`,
`shiftHom_comp k l : (shiftHom k).comp (shiftHom l) = shiftHom (l+k)`, `shiftHom_zero`, and `shiftAut_z k N :
shiftAut k (z N) = z (N+k)` match A's `beta`, `beta_T/U/V/W`, `beta_add`, `beta_zero`, `beta_z`; A's `alpha = beta
1`. Equivalent (B states the composition law for the underlying homomorphisms).

**Finite quotients.** B's ring `CyclicRing m := AdjoinRoot (X^m - C 1)` over `ZMod 2` = A's `FiniteQuotientRing.S
m`; `cyclicBasis`, `cyclicRing_finite`, `cyclic_root_isUnit`, `cyclic_root_pow`, `cyclic_powers_independent` match
A's `basis`, `finite`, `t`, `t_pow`, `linearIndependent_tPow` (B assumes `m ≠ 0` or `[NeZero m]`, A `0 < m`).
`matrixRepresentation r` (any commutative ring of characteristic 2, any unit r; more general than A) and its
specialisation `cyclicRepresentation m : AuxiliaryGroup →* (Matrix (Fin 5) (Fin 5) (CyclicRing m))ˣ` send T, U, V,
W to the same diagonal matrices and transvections as A's `pi` (`pi_T_matrix` … `pi_W_matrix` are definitional in
B), and `matrixRepresentation_z` is A's `pi_z_matrix`. B's `finite_central_quotient m` states: the corestriction is
surjective, `quotientCentralEmbedding : Multiplicative (Fin m → ZMod 2) →* image` is injective, central, and sends
the i-th basis vector to the image of `z i`; `finiteQuotientGroup_finite` is A's `finite_F`. This is A's
`coordinates_injective`, `centerEquiv_generator`, `z_image_mem_center`, `Z_le_center` in content. A's
`coordinates_range` (the image is exactly the subgroup generated by the images of z_0, …, z_{m−1}) and the
resulting `centerEquiv` are not stated in B; they follow from B's statements in a few lines. Equivalent except for
that step.

**Corollary 5.15.** None in B as a statement (searches listed in the table). B's Finitistic proof only uses the
finite quotients and their characters (`Finitistic/Selection/SelectionCharacter.lean`, `TestModules.lean`).

## Item 4: Proposition 5.4 as linear algebra

None. B's main construction does not need the rank obstruction.

## Item 5: Section 6

**Lemma 6.1.** B (`Finitistic/Localization/DiagramLifting.lean`, `variable (L : C ⥤ D) (W : MorphismProperty C)
[L.IsLocalization W] [W.HasRightCalculusOfFractions]`):

```lean
theorem finite_roof (n : ℕ) (X : C) (Y : Fin n → C) (f : ∀ i, L.obj X ⟶ L.obj (Y i)) :
    ∃ (Z : C) (u : Z ⟶ X), W u ∧ ∃ (g : ∀ i, Z ⟶ Y i), ∀ i, L.map u ≫ f i = L.map (g i)
theorem finite_zero_refinement [HasZeroMorphisms C] [HasZeroMorphisms D] [L.PreservesZeroMorphisms]
    (n : ℕ) (X : C) (Y : Fin n → C) (f : ∀ i, X ⟶ Y i) (hf : ∀ i, L.map (f i) = 0) :
    ∃ (Z : C) (u : Z ⟶ X), W u ∧ ∀ i, u ≫ f i = 0
```

`finite_roof` is A's `exists_common_denominator_finset` for `Fin n`; A's versions for a `Finset` of an arbitrary
index type and for `[Finite ι]` (with the conclusion written as `γ i = (isoOfHom L W u hu).inv ≫ L.map (f i)`)
follow by enumerating the index set and inverting `L.map u`. `finite_zero_refinement` implies A's
`exists_annihilating_denominator` (A assumes preadditive C, D and additive L, which give B's hypotheses). A's
`exists_equalising_denominator(_finset)` (L.map f i = L.map g i ⇒ a common u with u ≫ f i = u ≫ g i, no
preadditivity): not in B; in the preadditive case it is `finite_zero_refinement` applied to `f i - g i`.

**Lemma 6.6.** A:

```lean
Stage3cConeSplitting.coneSplittingIso … (T : Triangle C) (hT : T ∈ distinguishedTriangles)
  {I A B : Karoubi C} (e1 : toKaroubi.obj T.obj₁ ≅ I ⊞ A) (e2 : toKaroubi.obj T.obj₂ ≅ I ⊞ B)
  (h : e1.inv ≫ toKaroubi.map T.mor₁ ≫ e2.hom = biprod.fst ≫ biprod.inl) :
  toKaroubi.obj T.obj₃ ≅ B ⊞ (Stage3cKaroubi.shift 1).obj A
```

B (`Finitistic/Localization/OddDouble.lean`, same pretriangulated context):

```lean
theorem regular_cone_iso (T : Triangle C) (u : T.obj₂ ⟶ T.obj₁)
    (hu : T.mor₁ ≫ u ≫ T.mor₁ = T.mor₁) (hT : T ∈ distTriang C) :
    Nonempty ((toKaroubi C).obj T.obj₃ ≅ formalCokernel T u hu ⊞ formalKernel T u hu)
```

with `formalCokernel = (T.obj₂, 𝟙 - u ≫ T.mor₁)` and `formalKernel = (T.obj₁⟦1⟧, (𝟙 - T.mor₁ ≫ u)⟦1⟧')`, and the
underlying `cone_splitting` (explicit s, t with the biproduct equations). These are two formulations of the same
lemma: A's hypothesis yields a generalised inverse u (transport `fst ≫ inl` back through e2, e1 and use full
faithfulness of `toKaroubi`), and then B's summands are isomorphic to B and A[1]; conversely a generalised inverse
gives decompositions of the kind A assumes. Neither translation is formalised. B gives only `Nonempty`, A an
explicit isomorphism. Classification: related. A's abstract splitting criteria
`nonempty_iso_of_hom_exact`, `nonempty_iso_of_complementary_retracts` and the exactness transfer to Karoubi
(`lift_exact`, `coyoneda_exact₁/₂/₃`): none in B (B uses exactness of `coyoneda` on the triangle in C directly).
The shift on Karoubi: B's `formalShift P n` (X := P.X⟦n⟧, p := P.p⟦n⟧') is A's `(Stage3cKaroubi.shift n).obj P`
(`shift_obj_X`, `shift_obj_p`); `formalShiftFunctor` with its `Additive` instance and `formalShiftAdd` match
`shift`, `shift_additive`, `shiftAddIso`; B's are stated in the pretriangulated context of that file, A's need only
`HasShift` (and preadditivity for additivity). `shiftToKaroubiIso` and its naturality: not stated in B.
`karoubi_hasBinaryBiproducts`: B uses the same Mathlib facts as a local instance.

**Proposition 6.7 without K₀.** B:

```lean
theorem odd_double_one (U : Karoubi C) : ∃ S : C, Nonempty ((toKaroubi C).obj S ≅ U ⊞ formalShift U 1)
theorem odd_double_three (U : Karoubi C) : ∃ Z : C, Nonempty ((toKaroubi C).obj Z ≅ U ⊞ formalShift U 3)
```

for `[Category C] [Preadditive C] [HasShift C ℤ] [HasZeroObject C] [∀ n, (shiftFunctor C n).Additive]
[Pretriangulated C]`, proved from the two cones as in the report. Together they are A's `exists_odd_doubles`.
Equivalent. A additionally gives the isomorphisms as data (`firstDouble`, `thirdDouble`) and the auxiliary
`complementDecomposition`, `complement_matrix`, `shiftedDecomposition`, which B uses only inside proofs.

## Item 6: Section 10

None for the conclusions. B contains no Toda brackets (search `Toda`, `Massey`: no hits), no `ShiftedHom`-valued
pairings, and no pretriangulated stable category of an algebra (the `Pretriangulated`/`distTriang` hits in
`AuslanderReiten` concern derived and homotopy categories of modules and a general long exact sequence lemma in
`AuslanderReiten/Homology/TriangleGradedSequence.lean`). B's route to the Auslander–Reiten counterexample
constructs the module and checks Ext vanishing directly; it does not need the obstruction results.

B does prove concrete analogues of A's two hypotheses, in a different setting:
- `ArExplicit.FiniteLeftModule.stableDuality : Module.Dual k (StableHom R M.carrier N) ≃ₗ[k] StableHom R N
  M.syzygy.carrier` for a finite-dimensional k-algebra with a symmetric Frobenius trace (`hs`), i.e.
  D \underline{Hom}(M, N) ≅ \underline{Hom}(N, ΩM), which is Tate duality in one degree for modules. A's
  `TateDuality k C` is an abstract structure on a k-linear category with shift (a natural perfect pairing in every
  degree, compatible with composition); B does not state naturality in both variables, compatibility with
  composition, or other degrees in that form, and B's `StableHom` is a quotient of Hom spaces, not a category.
- `AuslanderReiten/Ext/TExtPolynomial.lean` (`tTauMulEquiv`, `tExtCoefficientEquiv`, `tSelfExt_zero_of_not_dvd`,
  `tTauPower_mul`): Ext^n_T(s,s) is one-dimensional for 3 | n, zero otherwise, and powers of τ multiply, for B's
  specific algebra T over a field with parameter q. This is the content of the report's Theorem T-ext for B's algebra,
  i.e. a module-Ext instance of the content of A's `PolynomialSelfExtensions s 3` (A's is stated for `ShiftedHom`
  in an abstract category; B's for `Ext` in `ModuleCat`). UNSURE whether B's T and s coincide with the report's (not
  compared).

Classification: related (hypotheses only), none (all formal statements of item 6).

## Other direction: what B formalises that A does not

- `OAI.LittleFinitistic.Main.exists_counterexample` (`Finitistic/Main.lean`): a finite-dimensional complex algebra
  with `littleFinitisticDimension A = ⊤` and finitely generated modules N_m with `2m−2 ≤ pd N_m < ⊤`, for an
  explicit algebra `SelectedOrdinaryAlgebra.A`. The proof formalises the whole chain: the group algebra ℂG of the
  selection group and selection idempotents (`Selection/*`), the encoding into a quadratic three-vertex directed
  algebra of global dimension ≤ 2 (`Encoding/*`), bimodule bar resolutions and derived tensor products
  (`Bar/*`, `Bimodule/*`, `Ordinary/*`), Verdier localisation, idempotent completion and odd doubles
  (`Localization/*`), rectification (`Rectification/*`), iteration and extinction (`Iteration/*`, `Selected/*`),
  and pd detection by minimal resolutions and Tor against simples (`Dimension/*`).
- `OAI.ArExplicit.main` (`AuslanderReiten/Main.lean`): the explicit Auslander–Reiten counterexample over
  F₂(q,H₁,H₂) and all field extensions, with trivial extension algebras, Ext^*(s,s) ≅ k[τ], stable duality for
  symmetric algebras, complete resolutions and two-cone constructions.
- `OAI.Tachikawa.main_theorem` (`Tachikawa/Counterexample.lean`): a finite-dimensional symmetric algebra with a
  nonprojective module M with Ext^{>0}(M,M) = 0.
- `OAI.LittleFinitistic.extreme_left_right_asymmetry` (`FinitisticAsymmetry/Main.lean`): an algebra Λ with little
  and big finitistic dimension ∞ while Λ^op has both 0, and injectives generate D(Λ^op) but not D(Λ).

None of B's main theorems uses Proposition 3.1, Theorem 3.3, Proposition 5.4, Corollary 5.15 or Section 10, so B
contains no formal counterpart of these.

## Conclusion

A is not contained in B. B has equivalent statements for Section 5's group (presentation, finite presentation,
z_N, shifts, finite quotients π_m for every m ≥ 1, up to an unformalised isomorphism of the two presented groups
and the small `coordinates_range` step), for Lemma 6.1 (common and annihilating denominators), for Proposition 6.7
without K₀ (odd doubles), and for the degree ≥ 1 Ext-via-resolution criterion. Lemma 6.6 appears in B in a
different but interderivable form (cone of a regular morphism). B has nothing for Proposition 3.1, Theorem 3.3
(strong Nakayama, ring duality, transpose), Proposition 5.4, Corollary 5.15 or Section 10 (Toda brackets, Tate
obstruction); for Section 10 it has only concrete module-level analogues of A's two hypotheses.
