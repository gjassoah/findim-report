import FindimCounterexample.Stage4aRank
import FindimCounterexample.Stage4aHigherObstruction
/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import FindimCounterexample.Stage4aFactorization
import Mathlib.CategoryTheory.Triangulated.Yoneda

/-!
# Stage 4a: the Hom profile of one cone

The generic long exact sequence below reuses Mathlib's homological Yoneda
functor. Exactness and its consequences are derived from distinguished
triangles, not supplied as fields of the conditional interface.
-/

noncomputable section

open CategoryTheory CategoryTheory.Limits CategoryTheory.Pretriangulated
open Module Opposite

namespace FindimCounterexample.Stage4a

universe u v w
variable {k : Type u} [Field k]
variable {C : Type v} [Category.{w} C] [Preadditive C] [Linear k C]
variable [HasShift C ℤ]

namespace Cone

/-- The shifted Hom map induced by an ordinary morphism. -/
def homMap (S : C) {A B : C} (f : A ⟶ B) (n : ℤ) :
    ShiftedHom S A n →ₗ[k] ShiftedHom S B n :=
  Linear.rightComp k S (f⟦n⟧')

/-- The connecting map, including the shift addition identification. -/
def connecting (S : C) (T : Triangle C) (n : ℤ) :
    ShiftedHom S T.obj₃ n →ₗ[k] ShiftedHom S T.obj₁ (n + 1) :=
  Linear.rightComp k S
    (T.mor₃⟦n⟧' ≫ (shiftFunctorAdd' C 1 n (n + 1) (by omega)).inv.app T.obj₁)

/-- Combine two target shifts by the canonical shift-addition isomorphism. -/
def targetShiftEquiv (S Y : C) (b a c : ℤ) (h : b + a = c) :
    ShiftedHom S (Y⟦b⟧) a ≃ₗ[k] ShiftedHom S Y c :=
  Linear.homCongr k (Iso.refl S) ((shiftFunctorAdd' C b a c h).app Y).symm

omit [Preadditive C] [Linear k C] in
/-- Vanishing transported along the explicit target-shift identification. -/
theorem subsingleton_targetShift (S Y : C) (b a c : ℤ) (h : b + a = c)
    (hc : Subsingleton (ShiftedHom S Y c)) : Subsingleton (ShiftedHom S (Y⟦b⟧) a) := by
  have := hc
  exact (Iso.homCongr (Iso.refl S)
    ((shiftFunctorAdd' C b a c h).app Y).symm).injective.subsingleton

variable [HasZeroObject C] [∀ n : ℤ, (shiftFunctor C n).Additive] [Pretriangulated C]

/-- Exactness at the second object in every shifted Hom sequence. -/
theorem exact₂ (S : C) (T : Triangle C) (hT : T ∈ distTriang C) (n : ℤ)
    (y : ShiftedHom S T.obj₂ n) (hy : homMap (k := k) S T.mor₂ n y = 0) :
    ∃ x : ShiftedHom S T.obj₁ n, homMap (k := k) S T.mor₁ n x = y := by
  have hex := (preadditiveCoyoneda.obj (op S)).homologySequence_exact₂ T hT n
  exact (ShortComplex.ab_exact_iff _).mp hex y hy

set_option backward.isDefEq.respectTransparency false in
/-- Exactness at the third object in every shifted Hom sequence. -/
theorem exact₃ (S : C) (T : Triangle C) (hT : T ∈ distTriang C) (n : ℤ)
    (z : ShiftedHom S T.obj₃ n) (hz : connecting (k := k) S T n z = 0) :
    ∃ y : ShiftedHom S T.obj₂ n, homMap (k := k) S T.mor₂ n y = z := by
  have hex := (preadditiveCoyoneda.obj (op S)).homologySequence_exact₃ T hT n (n + 1) rfl
  apply (ShortComplex.ab_exact_iff _).mp hex z
  simpa only [preadditiveCoyoneda_homologySequenceδ_apply, connecting,
    Linear.rightComp_apply, Category.assoc] using hz

set_option backward.isDefEq.respectTransparency false in
/-- Exactness at the first object in the next degree. -/
theorem exact₁ (S : C) (T : Triangle C) (hT : T ∈ distTriang C) (n : ℤ)
    (x : ShiftedHom S T.obj₁ (n + 1))
    (hx : homMap (k := k) S T.mor₁ (n + 1) x = 0) :
    ∃ z : ShiftedHom S T.obj₃ n, connecting (k := k) S T n z = x := by
  have hex := (preadditiveCoyoneda.obj (op S)).homologySequence_exact₁ T hT n (n + 1) rfl
  obtain ⟨z, hz⟩ := (ShortComplex.ab_exact_iff _).mp hex x hx
  refine ⟨z, ?_⟩
  simpa only [preadditiveCoyoneda_homologySequenceδ_apply, connecting,
    Linear.rightComp_apply, Category.assoc] using hz

/-- The first two maps in the Hom sequence compose to zero. -/
theorem homMap_comp (S : C) (T : Triangle C) (hT : T ∈ distTriang C) (n : ℤ)
    (x : ShiftedHom S T.obj₁ n) :
    homMap (k := k) S T.mor₂ n (homMap (k := k) S T.mor₁ n x) = 0 := by
  change (x ≫ T.mor₁⟦n⟧') ≫ T.mor₂⟦n⟧' = 0
  rw [Category.assoc, ← Functor.map_comp, comp_distTriang_mor_zero₁₂ _ hT,
    Functor.map_zero, comp_zero]

set_option backward.isDefEq.respectTransparency false in
/-- The connecting map followed by the next Hom map is zero. -/
theorem connecting_comp (S : C) (T : Triangle C) (hT : T ∈ distTriang C) (n : ℤ)
    (z : ShiftedHom S T.obj₃ n) :
    homMap (k := k) S T.mor₁ (n + 1) (connecting (k := k) S T n z) = 0 := by
  have hz := (preadditiveCoyoneda.obj (op S)).homologySequenceδ_comp T hT n (n + 1) rfl
  have hz' := congrArg (fun f => f z) hz
  change homMap (k := k) S T.mor₁ (n + 1)
    ((preadditiveCoyoneda.obj (op S)).homologySequenceδ T n (n + 1) rfl z) = 0 at hz'
  rw [preadditiveCoyoneda_homologySequenceδ_apply] at hz'
  simpa only [connecting, homMap, Linear.rightComp_apply, Category.assoc] using hz'

/-- Surjectivity of the first action and injectivity of the next one force
the cone's Hom group to vanish. -/
theorem subsingleton_of_surjective_injective (S : C) (T : Triangle C)
    (hT : T ∈ distTriang C) (n : ℤ)
    (hsurj : Function.Surjective (homMap (k := k) S T.mor₁ n))
    (hinj : Function.Injective (homMap (k := k) S T.mor₁ (n + 1))) :
    Subsingleton (ShiftedHom S T.obj₃ n) := by
  apply (subsingleton_iff_forall_eq (0 : ShiftedHom S T.obj₃ n)).mpr
  intro z
  have hz : connecting (k := k) S T n z = 0 :=
    hinj ((connecting_comp S T hT n z).trans (map_zero _).symm)
  obtain ⟨y, hy⟩ := exact₃ S T hT n z hz
  obtain ⟨x, hx⟩ := hsurj y
  rw [← hy, ← hx]
  exact homMap_comp S T hT n x

/-- If the first object's Hom groups in two adjacent degrees vanish, the
second arrow induces a linear isomorphism on Hom. -/
theorem homMap_bijective_of_zeros (S : C) (T : Triangle C)
    (hT : T ∈ distTriang C) (n : ℤ)
    (h₀ : Subsingleton (ShiftedHom S T.obj₁ n))
    (h₁ : Subsingleton (ShiftedHom S T.obj₁ (n + 1))) :
    Function.Bijective (homMap (k := k) S T.mor₂ n) := by
  constructor
  · apply LinearMap.ker_eq_bot.mp
    apply eq_bot_iff.mpr
    intro y hy
    obtain ⟨x, hx⟩ := exact₂ S T hT n y hy
    have hx₀ : x = 0 := @Subsingleton.elim _ h₀ x 0
    simpa only [hx₀, map_zero, Submodule.mem_bot] using hx.symm
  · intro z
    exact exact₃ S T hT n z (@Subsingleton.elim _ h₁ _ 0)

/-- If the second object's Hom groups in two adjacent degrees vanish, the
connecting map induces a linear isomorphism on Hom. -/
theorem connecting_bijective_of_zeros (S : C) (T : Triangle C)
    (hT : T ∈ distTriang C) (n : ℤ)
    (h₀ : Subsingleton (ShiftedHom S T.obj₂ n))
    (h₁ : Subsingleton (ShiftedHom S T.obj₂ (n + 1))) :
    Function.Bijective (connecting (k := k) S T n) := by
  constructor
  · apply LinearMap.ker_eq_bot.mp
    apply eq_bot_iff.mpr
    intro z hz
    obtain ⟨y, hy⟩ := exact₃ S T hT n z hz
    have hy₀ : y = 0 := @Subsingleton.elim _ h₀ y 0
    simpa only [hy₀, map_zero, Submodule.mem_bot] using hy.symm
  · intro x
    exact exact₁ S T hT n x (@Subsingleton.elim _ h₁ _ 0)

omit [HasZeroObject C] [∀ n : ℤ, (shiftFunctor C n).Additive] [Pretriangulated C] in
/-- Ordinary shifted postcomposition by a degree-three class agrees with
graded multiplication after the explicit target-shift identification. -/
theorem targetShift_homMap (s : C) (τ : ShiftedHom s s (3 : ℤ)) (n : ℤ)
    (x : ShiftedHom s s n) :
    targetShiftEquiv (k := k) s s 3 n (3 + n) rfl (homMap (k := k) s τ n x) =
      x.comp τ rfl := by
  simp only [targetShiftEquiv, Linear.homCongr_apply, Iso.refl_inv,
    Category.id_comp, homMap, Linear.rightComp_apply, ShiftedHom.comp, Category.assoc,
    Iso.symm_hom, Iso.app_inv]

omit [HasZeroObject C] [∀ n : ℤ, (shiftFunctor C n).Additive] [Pretriangulated C] in
/-- Surjectivity transfers from graded multiplication to the actual shifted
first arrow of a cone triangle. -/
theorem homMap_surjective_of_mul (s : C) (τ : ShiftedHom s s (3 : ℤ)) (n : ℤ)
    (h : Function.Surjective (fun x : ShiftedHom s s n => x.comp τ rfl)) :
    Function.Surjective (homMap (k := k) s τ n) := by
  intro y
  obtain ⟨x, hx⟩ := h (targetShiftEquiv (k := k) s s 3 n (3 + n) rfl y)
  refine ⟨x, (targetShiftEquiv (k := k) s s 3 n (3 + n) rfl).injective ?_⟩
  rw [targetShift_homMap]
  exact hx

omit [HasZeroObject C] [∀ n : ℤ, (shiftFunctor C n).Additive] [Pretriangulated C] in
/-- Injectivity transfers from graded multiplication to the actual shifted
first arrow of a cone triangle. -/
theorem homMap_injective_of_mul (s : C) (τ : ShiftedHom s s (3 : ℤ)) (n : ℤ)
    (h : Function.Injective (fun x : ShiftedHom s s n => x.comp τ rfl)) :
    Function.Injective (homMap (k := k) s τ n) := by
  intro x y hxy
  apply h
  exact (targetShift_homMap s τ n x).symm.trans
    ((congrArg (targetShiftEquiv (k := k) s s 3 n (3 + n) rfl) hxy).trans
      (targetShift_homMap s τ n y))

/-- The degree-three class as a map `s[-3] → s`, using the inverse of
the fully faithful shift and its counit. This specifies the report's
implicit identification of the same symbol `τ` in the two Hom spaces. -/
def deshiftTau (s : C) (τ : ShiftedHom s s (3 : ℤ)) : s⟦(-3 : ℤ)⟧ ⟶ s :=
  (shiftFunctor C (3 : ℤ)).preimage ((shiftNegShift s (3 : ℤ)).hom ≫ τ)

/-- The first exceptional map of Proposition 10.1: `i` induces an
isomorphism in degree zero. Its proof needs only the two adjacent vanishings. -/
theorem oneCone_i_bijective (D : TateDuality k C) (s X : C)
    (P : PolynomialSelfExtensions (k := k) s 3)
    (t : s⟦(-3 : ℤ)⟧ ⟶ s) (i : s ⟶ X)
    (π : X ⟶ (s⟦(-3 : ℤ)⟧)⟦(1 : ℤ)⟧)
    (hT : Triangle.mk t i π ∈ distTriang C) :
    Function.Bijective (homMap (k := k) s i 0) := by
  apply homMap_bijective_of_zeros s (Triangle.mk t i π) hT 0
  · exact subsingleton_targetShift s s (-3) 0 (-3) (by omega)
      (D.subsingleton_complement s s 2 (-3) (by omega)
        (P.subsingleton_of_not_dvd 2 (by omega)))
  · exact subsingleton_targetShift s s (-3) (0 + 1) (-2) (by omega)
      (D.subsingleton_complement s s 1 (-2) (by omega)
        (P.subsingleton_of_not_dvd 1 (by omega)))

/-- The second exceptional map of Proposition 10.1: the connecting map in
degree one is bijective onto `Hom(s,s[-3][2])`, canonically degree minus one. -/
theorem oneCone_pi_bijective (s X : C)
    (P : PolynomialSelfExtensions (k := k) s 3)
    (t : s⟦(-3 : ℤ)⟧ ⟶ s) (i : s ⟶ X)
    (π : X ⟶ (s⟦(-3 : ℤ)⟧)⟦(1 : ℤ)⟧)
    (hT : Triangle.mk t i π ∈ distTriang C) :
    Function.Bijective (connecting (k := k) s (Triangle.mk t i π) 1) := by
  apply connecting_bijective_of_zeros s (Triangle.mk t i π) hT 1
  · exact P.subsingleton_of_not_dvd 1 (by omega)
  · exact P.subsingleton_of_not_dvd 2 (by omega)

variable [∀ A B : C, FiniteDimensional k (A ⟶ B)]

/-- The two exceptional dimensions of Proposition 10.1, with the original
triangle convention `s[-3] → s → X`. -/
theorem oneCone_finrank (D : TateDuality k C) (s X : C)
    (P : PolynomialSelfExtensions (k := k) s 3)
    (t : s⟦(-3 : ℤ)⟧ ⟶ s) (i : s ⟶ X)
    (π : X ⟶ (s⟦(-3 : ℤ)⟧)⟦(1 : ℤ)⟧)
    (hT : Triangle.mk t i π ∈ distTriang C) :
    finrank k (ShiftedHom s X (0 : ℤ)) = 1 ∧
      finrank k (ShiftedHom s X (1 : ℤ)) = 1 := by
  have hH₀ : finrank k (ShiftedHom s s (0 : ℤ)) = 1 :=
    P.finrank_multiple (by omega) 0
  constructor
  · exact (LinearEquiv.ofBijective (homMap (k := k) s i 0)
      (oneCone_i_bijective D s X P t i π hT)).finrank_eq.symm.trans hH₀
  · have he := (LinearEquiv.ofBijective (connecting (k := k) s (Triangle.mk t i π) 1)
      (oneCone_pi_bijective s X P t i π hT)).finrank_eq
    have he' := (targetShiftEquiv (k := k) s s (-3) 2 (-1) (by omega)).finrank_eq
    exact he.trans (he'.trans ((D.finrank_complement s s (-1) 0 (by omega)).trans hH₀))

/-- The vanishing part of Proposition 10.1 in the shifted triangle
`s → s[3] → Y → s[1]`. Its exceptional degrees are minus three and minus two. -/
theorem normalized_subsingleton (D : TateDuality k C) (s Y : C)
    (P : PolynomialSelfExtensions (k := k) s 3)
    (i : s⟦(3 : ℤ)⟧ ⟶ Y) (π : Y ⟶ s⟦(1 : ℤ)⟧)
    (hT : Triangle.mk P.tau i π ∈ distTriang C)
    (n : ℤ) (hn₀ : n ≠ -3) (hn₁ : n ≠ -2) :
    Subsingleton (ShiftedHom s Y n) := by
  apply subsingleton_of_surjective_injective (k := k) s (Triangle.mk P.tau i π) hT n
  · exact homMap_surjective_of_mul s P.tau n (P.right_mul_tau_surjective D n hn₀)
  · exact homMap_injective_of_mul s P.tau (n + 1)
      (P.right_mul_tau_injective D (n + 1) (by omega))

set_option backward.isDefEq.respectTransparency false in
/-- The vanishing part of Proposition 10.1 with the original triangle
`s[-3] → s → X`. Shifting by three introduces signs; the isomorphism used
here has components `(counit, -id, id)`, which cancels the first two signs. -/
theorem oneCone_subsingleton (D : TateDuality k C) (s X : C)
    (P : PolynomialSelfExtensions (k := k) s 3)
    (i : s ⟶ X) (π : X ⟶ (s⟦(-3 : ℤ)⟧)⟦(1 : ℤ)⟧)
    (hT : Triangle.mk (deshiftTau s P.tau) i π ∈ distTriang C)
    (a : ℤ) (ha₀ : a ≠ 0) (ha₁ : a ≠ 1) :
    Subsingleton (ShiftedHom s X a) := by
  let T := Triangle.mk (deshiftTau s P.tau) i π
  let T₃ := (Triangle.shiftFunctor C 3).obj T
  let e := shiftNegShift s (3 : ℤ)
  let N := Triangle.mk P.tau (i⟦(3 : ℤ)⟧') (T₃.mor₃ ≫ e.hom⟦(1 : ℤ)⟧')
  have hsign : (3 : ℤ).negOnePow = -1 := by decide
  have eN : T₃ ≅ N := by
    refine Triangle.isoMk T₃ N e (-Iso.refl _) (Iso.refl _) ?_ ?_ ?_
    · change ((3 : ℤ).negOnePow • (deshiftTau s P.tau)⟦(3 : ℤ)⟧') ≫
        (-(𝟙 (s⟦(3 : ℤ)⟧))) = e.hom ≫ P.tau
      simp only [hsign, Units.neg_smul, one_smul, Preadditive.comp_neg,
        Category.comp_id, neg_neg, deshiftTau, Functor.map_preimage, e]
    · change ((3 : ℤ).negOnePow • i⟦(3 : ℤ)⟧') ≫ 𝟙 _ =
        (-(𝟙 (s⟦(3 : ℤ)⟧))) ≫ i⟦(3 : ℤ)⟧'
      simp only [hsign, Units.neg_smul, one_smul, Preadditive.neg_comp,
        Category.id_comp, Category.comp_id]
    · change T₃.mor₃ ≫ e.hom⟦(1 : ℤ)⟧' = 𝟙 _ ≫ (T₃.mor₃ ≫ e.hom⟦(1 : ℤ)⟧')
      rw [Category.id_comp]
  have hN : N ∈ distTriang C :=
    (distinguished_iff_of_iso eN).mp (T.shift_distinguished hT 3)
  have hv := normalized_subsingleton D s (X⟦(3 : ℤ)⟧) P _ _ hN
    (a - 3) (by omega) (by omega)
  have := hv
  exact (targetShiftEquiv (k := k) s X 3 (a - 3) a (by omega)).symm.injective.subsingleton

/-- Proposition 10.1: the complete two-degree dimension and vanishing profile
of the cone, using only the approved Tate and polynomial inputs. The two map
isomorphism clauses are `oneCone_i_bijective` and `oneCone_pi_bijective`. -/
theorem oneCone_profile (D : TateDuality k C) (s X : C)
    (P : PolynomialSelfExtensions (k := k) s 3)
    (i : s ⟶ X) (π : X ⟶ (s⟦(-3 : ℤ)⟧)⟦(1 : ℤ)⟧)
    (hT : Triangle.mk (deshiftTau s P.tau) i π ∈ distTriang C) :
    finrank k (ShiftedHom s X (0 : ℤ)) = 1 ∧
      finrank k (ShiftedHom s X (1 : ℤ)) = 1 ∧
      ∀ a : ℤ, a ≠ 0 → a ≠ 1 → Subsingleton (ShiftedHom s X a) := by
  have hdim := oneCone_finrank D s X P (deshiftTau s P.tau) i π hT
  exact ⟨hdim.1, hdim.2, oneCone_subsingleton D s X P i π hT⟩

/-- The composite-vanishing assertion of Corollary 10.3. Every degree-one
map from the simple object to the cone annihilates every degree-minus-one
self-map. No composite vanishing is assumed in the interface. -/
theorem oneCone_composite_zero (D : TateDuality k C) (s X : C)
    (P : PolynomialSelfExtensions (k := k) s 3)
    (i : s ⟶ X) (π : X ⟶ (s⟦(-3 : ℤ)⟧)⟦(1 : ℤ)⟧)
    (hT : Triangle.mk (deshiftTau s P.tau) i π ∈ distTriang C)
    (β : ShiftedHom s s (-1 : ℤ)) (w : ShiftedHom s X (1 : ℤ)) :
    β ≫ w⟦(-1 : ℤ)⟧' = 0 := by
  exact beta_shift_comp_eq_zero D (P.finrank_multiple (by omega) 0) P.tau P.tau_ne_zero
    (oneCone_subsingleton D s X P i π hT (-3) (by omega) (by omega)) β w

end Cone

end FindimCounterexample.Stage4a

end
/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/

/-!
# Stage 4a: the one-factor rank obstruction

Proposition 10.2 and Corollary 10.3, for the actual one-cone object and the
given triangle. The comparison with the module `Z` and its first Ext group
belongs to Section 8 and is deliberately not an interface hypothesis here.
-/

open CategoryTheory CategoryTheory.Limits CategoryTheory.Pretriangulated

namespace FindimCounterexample.Stage4a

universe u v w
variable {k : Type u} [Field k] {C : Type w} [Category.{v} C]
  [Preadditive C] [Linear k C] [HasZeroObject C] [HasShift C ℤ]
  [∀ n : ℤ, Functor.Additive (shiftFunctor C n)] [Pretriangulated C]
  [∀ A B : C, FiniteDimensional k (A ⟶ B)]

/-- Proposition 10.2, rank and triangle clauses, with all cone dimensions
derived from Proposition 10.1. -/
theorem one_factor_rank (D : TateDuality k C) (s X F : C)
    (P : PolynomialSelfExtensions (k := k) s 3) [HasBinaryBiproduct s s]
    (i : s ⟶ X) (π : X ⟶ s⟦(-3 : ℤ)⟧⟦(1 : ℤ)⟧)
    (hcone : Triangle.mk (Cone.deshiftTau s P.tau) i π ∈ distTriang C)
    (ρ : F ⟶ s ⊞ s) (w₁ w₂ : s ⟶ X⟦(1 : ℤ)⟧)
    (q : X⟦(1 : ℤ)⟧ ⟶ F⟦(1 : ℤ)⟧)
    (htriangle : Triangle.mk ρ (biprod.desc w₁ w₂) q ∈ distTriang C)
    (β : ShiftedHom s s (-1 : ℤ)) (hβ : β ≠ 0)
    (hw : w₁ ≠ 0 ∨ w₂ ≠ 0)
    (h₁ : β ≫ w₁⟦(-1 : ℤ)⟧' = 0) (h₂ : β ≫ w₂⟦(-1 : ℤ)⟧' = 0) :
    Module.finrank k (s ⟶ F) = 2 ∧
      ∀ v : s ⟶ F, ¬ Function.Surjective (Stage4aRank.scalarDifference (k := k) v) := by
  have hdim := Cone.oneCone_finrank D s X P (Cone.deshiftTau s P.tau) i π hcone
  have hH₀ : Module.finrank k (ShiftedHom s s (0 : ℤ)) = 1 :=
    P.finrank_multiple (by norm_num) 0
  have hEnd : Module.finrank k (s ⟶ s) = 1 :=
    (Linear.homCongr k (Iso.refl s) ((shiftFunctorZero C ℤ).app s)).finrank_eq.symm.trans hH₀
  have hX : Module.finrank k (s ⟶ X) = 1 :=
    (Linear.homCongr k (Iso.refl s) ((shiftFunctorZero C ℤ).app X)).finrank_eq.symm.trans hdim.1
  have hH : Module.finrank k (ShiftedHom s s (-1 : ℤ)) = 1 :=
    (D.finrank_complement s s (-1) 0 (by norm_num)).trans hH₀
  exact Stage4aRank.oneFactor_rank s X F ρ w₁ w₂ q htriangle hEnd hX hdim.2
    β hβ hH hw h₁ h₂

/-- Corollary 10.3, including the rank conclusion: the two composite
vanishings are derived, and the scalar comparison fails to be surjective
for every morphism to `F`. No assumption concerning `Ext¹(Z,Z)` is made. -/
theorem one_factor_obstruction (D : TateDuality k C) (s X F : C)
    (P : PolynomialSelfExtensions (k := k) s 3) [HasBinaryBiproduct s s]
    (i : s ⟶ X) (π : X ⟶ s⟦(-3 : ℤ)⟧⟦(1 : ℤ)⟧)
    (hcone : Triangle.mk (Cone.deshiftTau s P.tau) i π ∈ distTriang C)
    (ρ : F ⟶ s ⊞ s) (w₁ w₂ : s ⟶ X⟦(1 : ℤ)⟧)
    (q : X⟦(1 : ℤ)⟧ ⟶ F⟦(1 : ℤ)⟧)
    (htriangle : Triangle.mk ρ (biprod.desc w₁ w₂) q ∈ distTriang C)
    (hw : w₁ ≠ 0 ∨ w₂ ≠ 0) :
    (∀ β : ShiftedHom s s (-1 : ℤ),
      β ≫ w₁⟦(-1 : ℤ)⟧' = 0 ∧ β ≫ w₂⟦(-1 : ℤ)⟧' = 0) ∧
    Module.finrank k (s ⟶ F) = 2 ∧
      ∀ v : s ⟶ F, ¬ Function.Surjective (Stage4aRank.scalarDifference (k := k) v) := by
  have hcomp (β : ShiftedHom s s (-1 : ℤ)) :=
    And.intro (Cone.oneCone_composite_zero D s X P i π hcone β w₁)
      (Cone.oneCone_composite_zero D s X P i π hcone β w₂)
  refine ⟨hcomp, ?_⟩
  have hH₀ : Module.finrank k (ShiftedHom s s (0 : ℤ)) = 1 :=
    P.finrank_multiple (by norm_num) 0
  have hH : Module.finrank k (ShiftedHom s s (-1 : ℤ)) = 1 :=
    (D.finrank_complement s s (-1) 0 (by norm_num)).trans hH₀
  have : Nontrivial (ShiftedHom s s (-1 : ℤ)) := Module.nontrivial_of_finrank_eq_succ hH
  obtain ⟨β, hβ⟩ := exists_ne (0 : ShiftedHom s s (-1 : ℤ))
  exact one_factor_rank D s X F P i π hcone ρ w₁ w₂ q htriangle β hβ hw
    (hcomp β).1 (hcomp β).2

end FindimCounterexample.Stage4a

-- Audit commands are intentional, as in acceptance gate 4.
set_option linter.hashCommand false
open FindimCounterexample

/-! Stage 4a: conditional inputs and their transitive projection use.
The traversal inspects project proof/definition bodies. Mathlib cannot depend
on project interfaces, so imported non-project bodies need not be traversed.
This supplements, and does not replace, the exhaustive axiom gate. -/

private def stage4aInterfaceStructures : List Lean.Name := [
  `FindimCounterexample.Stage4a.TateDuality,
  `FindimCounterexample.Stage4a.PolynomialSelfExtensions]

private def stage4aProjectionNames (env : Lean.Environment) : Array Lean.Name :=
  stage4aInterfaceStructures.toArray.flatMap fun name =>
    ((Lean.getStructureInfo? env name).map (fun info => info.fieldInfo.map (·.projFn))).getD #[]

private partial def stage4aPrimitiveProjections (env : Lean.Environment)
    (e : Lean.Expr) : Array Lean.Name :=
  match e with
  | .proj s i b =>
    let here := if stage4aInterfaceStructures.contains s then
        (((Lean.getStructureInfo? env s).bind (·.getProjFn? i)).toArray) else #[]
    here ++ stage4aPrimitiveProjections env b
  | .app f a => stage4aPrimitiveProjections env f ++ stage4aPrimitiveProjections env a
  | .lam _ t b _ | .forallE _ t b _ =>
    stage4aPrimitiveProjections env t ++ stage4aPrimitiveProjections env b
  | .letE _ t v b _ => stage4aPrimitiveProjections env t ++
    stage4aPrimitiveProjections env v ++ stage4aPrimitiveProjections env b
  | .mdata _ b => stage4aPrimitiveProjections env b
  | _ => #[]

private partial def stage4aFields (env : Lean.Environment) (name : Lean.Name) :
    StateM (Lean.NameSet × Lean.NameSet) Unit := do
  let (seen, found) ← get
  if seen.contains name then return
  set (seen.insert name, found)
  if (stage4aProjectionNames env).contains name then
    modify fun (s, f) => (s, f.insert name)
  unless (`FindimCounterexample).isPrefixOf name do return
  if let some info := env.find? name then
    if let some body := info.value? (allowOpaque := true) then
      (stage4aPrimitiveProjections env body).forM fun n =>
        modify fun (s, f) => (s, f.insert n)
      body.getUsedConstants.forM (stage4aFields env)

elab "#stage4a_fields " id:ident : command => do
  let name ← Lean.Elab.Command.liftCoreM <| Lean.Elab.realizeGlobalConstNoOverloadWithInfo id
  let env ← Lean.getEnv
  let (_, (_, found)) := (stage4aFields env name).run ({}, {})
  Lean.logInfo m!"Interface projections in {name}: {found.toArray.qsort Lean.Name.lt}"

#check @Stage4a.TateDuality
#print axioms Stage4a.TateDuality

#check @Stage4a.PolynomialSelfExtensions
#print axioms Stage4a.PolynomialSelfExtensions

#check @Stage4a.TateDuality.right_factorization
#print axioms Stage4a.TateDuality.right_factorization
#stage4a_fields Stage4a.TateDuality.right_factorization

#check @Stage4a.Toda.bracket_nonempty
#print axioms Stage4a.Toda.bracket_nonempty
#stage4a_fields Stage4a.Toda.bracket_nonempty

#check @Stage4a.Toda.bracket_eq_coset
#print axioms Stage4a.Toda.bracket_eq_coset
#stage4a_fields Stage4a.Toda.bracket_eq_coset

#check @Stage4a.Toda.juggling
#print axioms Stage4a.Toda.juggling
#stage4a_fields Stage4a.Toda.juggling

#check @Stage4a.Toda.bracket_eq_of_distinguished_cones
#print axioms Stage4a.Toda.bracket_eq_of_distinguished_cones
#stage4a_fields Stage4a.Toda.bracket_eq_of_distinguished_cones

#check @Stage4a.tate_obstruction
#print axioms Stage4a.tate_obstruction
#stage4a_fields Stage4a.tate_obstruction

#check @Stage4a.HigherObstruction.polynomial_toda_eq_zero
#print axioms Stage4a.HigherObstruction.polynomial_toda_eq_zero
#stage4a_fields Stage4a.HigherObstruction.polynomial_toda_eq_zero

#check @Stage4aRank.oneFactor_rank
#print axioms Stage4aRank.oneFactor_rank
#stage4a_fields Stage4aRank.oneFactor_rank

#check @Stage4a.beta_comp_eq_zero
#print axioms Stage4a.beta_comp_eq_zero
#stage4a_fields Stage4a.beta_comp_eq_zero

#check @Stage4a.beta_shift_comp_eq_zero
#print axioms Stage4a.beta_shift_comp_eq_zero
#stage4a_fields Stage4a.beta_shift_comp_eq_zero

#check @Stage4a.Cone.oneCone_i_bijective
#print axioms Stage4a.Cone.oneCone_i_bijective
#stage4a_fields Stage4a.Cone.oneCone_i_bijective

#check @Stage4a.Cone.oneCone_pi_bijective
#print axioms Stage4a.Cone.oneCone_pi_bijective
#stage4a_fields Stage4a.Cone.oneCone_pi_bijective

#check @Stage4a.Cone.oneCone_profile
#print axioms Stage4a.Cone.oneCone_profile
#stage4a_fields Stage4a.Cone.oneCone_profile

#check @Stage4a.Cone.oneCone_composite_zero
#print axioms Stage4a.Cone.oneCone_composite_zero
#stage4a_fields Stage4a.Cone.oneCone_composite_zero

#check @Stage4a.one_factor_rank
#print axioms Stage4a.one_factor_rank
#stage4a_fields Stage4a.one_factor_rank

#check @Stage4a.one_factor_obstruction
#print axioms Stage4a.one_factor_obstruction
#stage4a_fields Stage4a.one_factor_obstruction
