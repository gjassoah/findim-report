/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import Mathlib.CategoryTheory.Triangulated.Pretriangulated
import Mathlib.CategoryTheory.Preadditive.Biproducts
import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas

/-!
# Stage 4a: the rank obstruction

Linear algebra and triangle exactness used in report Proposition 10.2.
The final comparison with the module `Z` of report Section 8 is not asserted here.
-/

noncomputable section

open CategoryTheory CategoryTheory.Limits CategoryTheory.Pretriangulated
open Module

namespace FindimCounterexample.Stage4aRank

universe u v w

section LinearAlgebra

variable {k : Type u} [Field k]
variable {U V W T : Type*}
variable [AddCommGroup U] [Module k U] [FiniteDimensional k U]
variable [AddCommGroup V] [Module k V] [FiniteDimensional k V]
variable [AddCommGroup W] [Module k W] [FiniteDimensional k W]
variable [AddCommGroup T] [Module k T] [FiniteDimensional k T]

omit [FiniteDimensional k U] [FiniteDimensional k T] in
/-- The rank calculation in Proposition 10.2: in an exact sequence
`0 → U → V → W → T`, dimensions `1, ?, 2, 1` and a nonzero last map
force the middle dimension to be two. -/
theorem finrank_eq_two_of_exact
    (f : U →ₗ[k] V) (g : V →ₗ[k] W) (h : W →ₗ[k] T)
    (hf : Function.Injective f)
    (hfg : LinearMap.range f = LinearMap.ker g)
    (hgh : LinearMap.range g = LinearMap.ker h)
    (hU : finrank k U = 1) (hW : finrank k W = 2) (hT : finrank k T = 1)
    (hh : h ≠ 0) : finrank k V = 2 := by
  have hsurj : Function.Surjective h :=
    surjective_of_nonzero_of_finrank_eq_one hT hh
  have hrankh : finrank k (LinearMap.range h) = 1 := by
    rw [LinearMap.range_eq_top.mpr hsurj, finrank_top, hT]
  have hrankf : finrank k (LinearMap.range f) = 1 :=
    (LinearMap.finrank_range_of_inj hf).trans hU
  have hhNull := h.finrank_range_add_finrank_ker
  have hgNull := g.finrank_range_add_finrank_ker
  rw [hrankh, hW] at hhNull
  rw [← hfg, hgh, hrankf] at hgNull
  omega

/-- The degree-zero scalar difference map from Proposition 10.2. -/
def scalarDifference (v : V) : (k × k) →ₗ[k] V where
  toFun x := (x.1 - x.2) • v
  map_add' x y := by
    simp only [Prod.fst_add, Prod.snd_add]
    rw [add_sub_add_comm, add_smul]
  map_smul' c x := by
    simp only [Prod.smul_fst, Prod.smul_snd, smul_eq_mul, RingHom.id_apply]
    rw [← mul_sub, mul_smul]

omit [FiniteDimensional k V] in
/-- The image of the degree-zero comparison map is precisely the line spanned by `v`. -/
theorem range_scalarDifference (v : V) :
    LinearMap.range (scalarDifference (k := k) v) = k ∙ v := by
  ext y
  constructor
  · rintro ⟨x, rfl⟩
    exact Submodule.smul_mem _ _ (Submodule.subset_span (Set.mem_singleton v))
  · intro hy
    obtain ⟨c, rfl⟩ := Submodule.mem_span_singleton.mp hy
    exact ⟨(c, 0), by simp [scalarDifference]⟩

omit [FiniteDimensional k V] in
/-- A scalar difference map cannot be onto a two-dimensional space. -/
theorem scalarDifference_not_surjective (hV : finrank k V = 2) (v : V) :
    ¬ Function.Surjective (scalarDifference (k := k) v) := by
  intro hsurj
  have hrange := LinearMap.range_eq_top.mpr hsurj
  rw [range_scalarDifference] at hrange
  have hbound : finrank k (k ∙ v) ≤ 1 := by
    simpa using (finrank_span_le_card ({v} : Set V))
  rw [hrange, finrank_top, hV] at hbound
  omega

end LinearAlgebra

section Triangles

variable {k : Type u} [Field k]
variable {C : Type v} [Category.{w} C] [Preadditive C] [Linear k C]
variable [HasZeroObject C] [HasShift C ℤ]
variable [∀ n : ℤ, (shiftFunctor C n).Additive] [Pretriangulated C]

/-- The Hom exactness of a distinguished triangle, expressed by equality of linear
ranges and kernels. No exactness field is added to the conditional interface. -/
theorem hom_range_eq_ker (S : C) (T : Triangle C) (hT : T ∈ distTriang C) :
    LinearMap.range (Linear.rightComp k S T.mor₁) =
      LinearMap.ker (Linear.rightComp k S T.mor₂) := by
  ext f
  constructor
  · rintro ⟨g, rfl⟩
    change (g ≫ T.mor₁) ≫ T.mor₂ = 0
    rw [Category.assoc, comp_distTriang_mor_zero₁₂ _ hT, comp_zero]
  · intro hf
    obtain ⟨g, hg⟩ := T.coyoneda_exact₂ hT f hf
    exact ⟨g, hg.symm⟩

/-- Vanishing of the preceding map in the triangle Hom sequence makes the next
map injective. The hypothesis is a map-vanishing hypothesis, not an interface field. -/
theorem hom_injective_of_boundary_zero (S : C) (T : Triangle C)
    (hT : T ∈ distTriang C)
    (hboundary : ∀ f : S ⟶ T.invRotate.obj₁, f ≫ T.invRotate.mor₁ = 0) :
    Function.Injective (Linear.rightComp k S T.mor₁) := by
  apply LinearMap.ker_eq_bot.mp
  change LinearMap.ker (Linear.rightComp k S T.invRotate.mor₂) = ⊥
  rw [← hom_range_eq_ker (k := k) S T.invRotate (inv_rot_of_distTriang T hT)]
  apply LinearMap.range_eq_bot.mpr
  ext f
  exact hboundary f

/-- The triangle form of the rank step in Proposition 10.2. Applied to the
inverse rotation `X → Fs → s ⊕ s → X[1]`, it obtains `dim Hom(s,Fs)=2`
from the two one-cone dimensions and the two boundary conditions. -/
theorem triangle_finrank_eq_two (S : C) (T : Triangle C)
    (hT : T ∈ distTriang C)
    [FiniteDimensional k (S ⟶ T.obj₁)]
    [FiniteDimensional k (S ⟶ T.obj₂)]
    [FiniteDimensional k (S ⟶ T.obj₃)]
    [FiniteDimensional k (S ⟶ T.obj₁⟦(1 : ℤ)⟧)]
    (hU : finrank k (S ⟶ T.obj₁) = 1)
    (hW : finrank k (S ⟶ T.obj₃) = 2)
    (hU₁ : finrank k (S ⟶ T.obj₁⟦(1 : ℤ)⟧) = 1)
    (hboundary : ∀ f : S ⟶ T.invRotate.obj₁, f ≫ T.invRotate.mor₁ = 0)
    (hlast : Linear.rightComp k S T.mor₃ ≠ 0) :
    finrank k (S ⟶ T.obj₂) = 2 := by
  apply finrank_eq_two_of_exact (Linear.rightComp k S T.mor₁)
    (Linear.rightComp k S T.mor₂) (Linear.rightComp k S T.mor₃)
    (hom_injective_of_boundary_zero S T hT hboundary)
    (hom_range_eq_ker S T hT)
    (hom_range_eq_ker S T.rotate (rot_of_distTriang T hT)) hU hW hU₁ hlast

/-- The linear identification `Hom(S,A ⊕ B) = Hom(S,A) × Hom(S,B)`. -/
def homBiprodEquiv (S A B : C) [HasBinaryBiproduct A B] :
    (S ⟶ A ⊞ B) ≃ₗ[k] (S ⟶ A) × (S ⟶ B) where
  toFun f := (f ≫ biprod.fst, f ≫ biprod.snd)
  invFun f := biprod.lift f.1 f.2
  left_inv f := by ext <;> simp
  right_inv f := by simp
  map_add' f g := by simp [Preadditive.add_comp]
  map_smul' c f := by simp

omit [HasZeroObject C] [Pretriangulated C] in
/-- If `β` spans `Hom(S,S[n])` and its composites with both shifted components
of `w` vanish, then the shifted row map `w[n]` vanishes on all of
`Hom(S,(S ⊕ S)[n])`. This is the first-map argument of Proposition 10.2. -/
theorem shifted_biprod_row_zero (S Y : C) [HasBinaryBiproduct S S]
    (n : ℤ) (β : S ⟶ S⟦n⟧) (hβ : β ≠ 0)
    (hdim : finrank k (S ⟶ S⟦n⟧) = 1)
    (w₁ w₂ : S ⟶ Y)
    (h₁ : β ≫ w₁⟦n⟧' = 0) (h₂ : β ≫ w₂⟦n⟧' = 0)
    (f : S ⟶ (S ⊞ S)⟦n⟧) : f ≫ (biprod.desc w₁ w₂)⟦n⟧' = 0 := by
  obtain ⟨c, hc⟩ := (finrank_eq_one_iff_of_nonzero' β hβ).mp hdim
    (f ≫ (biprod.fst : S ⊞ S ⟶ S)⟦n⟧')
  obtain ⟨d, hd⟩ := (finrank_eq_one_iff_of_nonzero' β hβ).mp hdim
    (f ≫ (biprod.snd : S ⊞ S ⟶ S)⟦n⟧')
  rw [biprod.desc_eq, Functor.map_add, Preadditive.comp_add,
    Functor.map_comp, Functor.map_comp, ← Category.assoc, ← Category.assoc,
    ← hc, ← hd, Linear.smul_comp, Linear.smul_comp, h₁, h₂]
  simp

variable [∀ A B : C, FiniteDimensional k (A ⟶ B)]

set_option backward.isDefEq.respectTransparency false in
/-- The rank and triangle part of report Proposition 10.2. The dimension
hypotheses are the conclusions and inputs of Proposition 10.1; the two
composite vanishings are the hypothesis of Proposition 10.2. The theorem
derives the Hom dimension and the failure of the scalar comparison map to
be surjective. It does not assert the Section 8 comparison with `Ext¹(Z,Z)`. -/
theorem oneFactor_rank (S X F : C) [HasBinaryBiproduct S S]
    (ρ : F ⟶ S ⊞ S) (w₁ w₂ : S ⟶ X⟦(1 : ℤ)⟧)
    (q : X⟦(1 : ℤ)⟧ ⟶ F⟦(1 : ℤ)⟧)
    (htriangle : Triangle.mk ρ (biprod.desc w₁ w₂) q ∈ distTriang C)
    (hEnd : finrank k (S ⟶ S) = 1)
    (hX : finrank k (S ⟶ X) = 1)
    (hX₁ : finrank k (S ⟶ X⟦(1 : ℤ)⟧) = 1)
    (β : S ⟶ S⟦(-1 : ℤ)⟧) (hβ : β ≠ 0)
    (hH : finrank k (S ⟶ S⟦(-1 : ℤ)⟧) = 1)
    (hw : w₁ ≠ 0 ∨ w₂ ≠ 0)
    (h₁ : β ≫ w₁⟦(-1 : ℤ)⟧' = 0)
    (h₂ : β ≫ w₂⟦(-1 : ℤ)⟧' = 0) :
    finrank k (S ⟶ F) = 2 ∧
      ∀ v : S ⟶ F, ¬ Function.Surjective (scalarDifference (k := k) v) := by
  let T := Triangle.mk ρ (biprod.desc w₁ w₂) q
  let R := T.invRotate
  have hR : R ∈ distTriang C := inv_rot_of_distTriang T htriangle
  have hR₁ : finrank k (S ⟶ R.obj₁) = 1 := by
    have he := (Linear.homCongr k (Iso.refl S)
      ((shiftEquiv C (1 : ℤ)).unitIso.app X)).finrank_eq
    exact he.symm.trans hX
  have hR₃ : finrank k (S ⟶ R.obj₃) = 2 := by
    change finrank k (S ⟶ S ⊞ S) = 2
    rw [(homBiprodEquiv (k := k) S S S).finrank_eq, finrank_prod, hEnd]
  have hR₁shift : finrank k (S ⟶ R.obj₁⟦(1 : ℤ)⟧) = 1 := by
    have he := (Linear.homCongr k (Iso.refl S)
      ((shiftEquiv C (1 : ℤ)).counitIso.app (X⟦(1 : ℤ)⟧))).finrank_eq
    exact he.trans hX₁
  have hboundary : ∀ f : S ⟶ R.invRotate.obj₁, f ≫ R.invRotate.mor₁ = 0 := by
    intro f
    have hz := shifted_biprod_row_zero (k := k) S (X⟦(1 : ℤ)⟧) (-1) β hβ
      hH w₁ w₂ h₁ h₂ f
    change f ≫ (-(biprod.desc w₁ w₂ ≫
      (shiftEquiv C (1 : ℤ)).counitIso.inv.app (X⟦(1 : ℤ)⟧))⟦(-1 : ℤ)⟧' ≫
      (shiftEquiv C (1 : ℤ)).unitIso.inv.app (X⟦(1 : ℤ)⟧⟦(-1 : ℤ)⟧)) = 0
    simp only [Functor.map_comp, Preadditive.comp_neg, Category.assoc]
    rw [← Category.assoc f, hz]
    simp
  have hlast : Linear.rightComp k S R.mor₃ ≠ 0 := by
    intro hz
    have hz₁ := congrArg (fun L => L (biprod.inl : S ⟶ S ⊞ S)) hz
    have hz₂ := congrArg (fun L => L (biprod.inr : S ⟶ S ⊞ S)) hz
    change biprod.inl ≫ (biprod.desc w₁ w₂ ≫
      (shiftEquiv C (1 : ℤ)).counitIso.inv.app (X⟦(1 : ℤ)⟧)) = 0 at hz₁
    change biprod.inr ≫ (biprod.desc w₁ w₂ ≫
      (shiftEquiv C (1 : ℤ)).counitIso.inv.app (X⟦(1 : ℤ)⟧)) = 0 at hz₂
    have hw₁ : w₁ = 0 := by
      apply (cancel_mono ((shiftEquiv C (1 : ℤ)).counitIso.inv.app
        (X⟦(1 : ℤ)⟧))).mp
      simpa only [biprod.inl_desc_assoc, zero_comp] using hz₁
    have hw₂ : w₂ = 0 := by
      apply (cancel_mono ((shiftEquiv C (1 : ℤ)).counitIso.inv.app
        (X⟦(1 : ℤ)⟧))).mp
      simpa only [biprod.inr_desc_assoc, zero_comp] using hz₂
    exact hw.elim (fun h => h hw₁) (fun h => h hw₂)
  have hF : finrank k (S ⟶ F) = 2 :=
    triangle_finrank_eq_two S R hR hR₁ hR₃ hR₁shift hboundary hlast
  exact ⟨hF, scalarDifference_not_surjective hF⟩

end Triangles

end FindimCounterexample.Stage4aRank
