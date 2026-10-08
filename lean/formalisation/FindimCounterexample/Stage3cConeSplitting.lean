/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import FindimCounterexample.Stage3cKaroubi

/-!
# Cone splitting in the Karoubi envelope

A distinguished triangle whose first map is the identity on a common summand
and zero on the complementary summands has the asserted split cone. The proof
uses Hom exactness inherited from the original category, not a triangulation
of its idempotent completion.
-/

open CategoryTheory CategoryTheory.Limits CategoryTheory.Idempotents
open CategoryTheory.Pretriangulated

namespace FindimCounterexample.Stage3cConeSplitting

universe v u

section Splitting

variable {D : Type u} [Category.{v} D] [Preadditive D]

/-- A sequence that is split short exact after applying every covariant Hom
functor gives an actual biproduct isomorphism. -/
theorem nonempty_iso_of_hom_exact {A X B : D} [HasBinaryBiproduct A B]
    (a : A ⟶ X) (b : X ⟶ B) (hab : a ≫ b = 0)
    (hinj : ∀ (Z : D) (g : Z ⟶ A), g ≫ a = 0 → g = 0)
    (hex : ∀ (Z : D) (g : Z ⟶ X), g ≫ b = 0 → ∃ h : Z ⟶ A, g = h ≫ a)
    (hsurj : ∀ (Z : D) (g : Z ⟶ B), ∃ h : Z ⟶ X, g = h ≫ b) :
    Nonempty (X ≅ A ⊞ B) := by
  obtain ⟨s, hs⟩ := hsurj B (𝟙 B)
  obtain ⟨r, hr⟩ := hex X (𝟙 X - b ≫ s) (by
    rw [Preadditive.sub_comp, Category.id_comp, Category.assoc, ← hs,
      Category.comp_id, sub_self])
  have har : a ≫ r = 𝟙 A := by
    apply sub_eq_zero.mp
    apply hinj A
    rw [Preadditive.sub_comp, Category.assoc, ← hr, Preadditive.comp_sub,
      Category.comp_id, ← Category.assoc, hab, zero_comp, sub_zero,
      Category.id_comp, sub_self]
  have hsr : s ≫ r = 0 := by
    apply hinj B
    rw [Category.assoc, ← hr, Preadditive.comp_sub, Category.comp_id,
      ← Category.assoc, ← hs, Category.id_comp, sub_self]
  refine ⟨{
    hom := biprod.lift r b
    inv := biprod.desc a s
    hom_inv_id := ?_
    inv_hom_id := ?_ }⟩
  · rw [biprod.lift_desc, ← hr, sub_add_cancel]
  · ext <;> simp [Category.assoc, har, hsr, hab, ← hs]

/-- Splitting a four-term Hom-exact sequence after choosing the complementary
retracts to its first and last maps. -/
theorem nonempty_iso_of_complementary_retracts
    {X₁ X₂ X₃ X₄ X₅ A B : D} [HasBinaryBiproduct B A]
    (f : X₁ ⟶ X₂) (j : X₂ ⟶ X₃) (v : X₃ ⟶ X₄) (w : X₄ ⟶ X₅)
    (hjv : j ≫ v = 0)
    (hex₂ : ∀ (Z : D) (g : Z ⟶ X₂), g ≫ j = 0 → ∃ h : Z ⟶ X₁, g = h ≫ f)
    (hex₃ : ∀ (Z : D) (g : Z ⟶ X₃), g ≫ v = 0 → ∃ h : Z ⟶ X₂, g = h ≫ j)
    (hex₄ : ∀ (Z : D) (g : Z ⟶ X₄), g ≫ w = 0 → ∃ h : Z ⟶ X₃, g = h ≫ v)
    (iB : B ⟶ X₂) (pB : X₂ ⟶ B) (iA : A ⟶ X₄) (pA : X₄ ⟶ A)
    (hB : iB ≫ pB = 𝟙 B) (hfB : f ≫ pB = 0)
    (hj : pB ≫ iB ≫ j = j)
    (hA : iA ≫ pA = 𝟙 A) (hAw : iA ≫ w = 0)
    (hv : v ≫ pA ≫ iA = v) :
    Nonempty (X₃ ≅ B ⊞ A) := by
  apply nonempty_iso_of_hom_exact (iB ≫ j) (v ≫ pA)
  · rw [Category.assoc, ← Category.assoc j v pA, hjv, zero_comp, comp_zero]
  · intro Z g hg
    obtain ⟨h, hh⟩ := hex₂ Z (g ≫ iB) (by simpa only [Category.assoc] using hg)
    have he := congrArg (fun k => k ≫ pB) hh
    simpa only [Category.assoc, hB, Category.comp_id, hfB, comp_zero] using he
  · intro Z g hg
    have hgv : g ≫ v = 0 := by
      calc
        g ≫ v = (g ≫ (v ≫ pA)) ≫ iA := by simp only [Category.assoc, hv]
        _ = 0 := by rw [hg, zero_comp]
    obtain ⟨h, hh⟩ := hex₃ Z g hgv
    refine ⟨h ≫ pB, ?_⟩
    simpa only [Category.assoc, hj] using hh
  · intro Z g
    obtain ⟨h, hh⟩ := hex₄ Z (g ≫ iA) (by
      rw [Category.assoc, hAw, comp_zero])
    refine ⟨h, ?_⟩
    have he := congrArg (fun k => k ≫ pA) hh
    simpa only [Category.assoc, hA, Category.comp_id] using he

end Splitting

section Cone

open Stage3cKaroubi

variable {C : Type u} [Category.{v} C] [Preadditive C]
variable [HasZeroObject C] [HasShift C ℤ]
variable [∀ n : ℤ, (shiftFunctor C n).Additive]

/-- Lemma 6.6: the cone of the identity on a common summand and zero on its
complements is the sum of the target complement and the shifted source
complement, in Mathlib's Karoubi envelope. -/
noncomputable def coneSplittingIso [Pretriangulated C]
    (T : Triangle C) (hT : T ∈ distTriang C)
    {I A B : Karoubi C}
    (e1 : (toKaroubi C).obj T.obj₁ ≅ I ⊞ A)
    (e2 : (toKaroubi C).obj T.obj₂ ≅ I ⊞ B)
    (hf : e1.inv ≫ (toKaroubi C).map T.mor₁ ≫ e2.hom =
      biprod.fst ≫ biprod.inl) :
    (toKaroubi C).obj T.obj₃ ≅ B ⊞ (shift 1).obj A := by
  classical
  apply Classical.choice
  let K := toKaroubi C
  let S := shift (C := C) 1
  let f := K.map T.mor₁
  let j := K.map T.mor₂
  let v := K.map T.mor₃
  let q := e2.hom ≫ biprod.fst ≫ biprod.inl ≫ e1.inv
  let iB := (biprod.inr : B ⟶ I ⊞ B) ≫ e2.inv
  let pB := e2.hom ≫ (biprod.snd : I ⊞ B ⟶ B)
  let iA₀ := (biprod.inr : A ⟶ I ⊞ A) ≫ e1.inv
  let pA₀ := e1.hom ≫ (biprod.snd : I ⊞ A ⟶ A)
  let eS := shiftToKaroubiIso (C := C) 1 T.obj₁
  let iA := S.map iA₀ ≫ eS.inv
  let pA := eS.hom ≫ S.map pA₀
  have hf' : f = e1.hom ≫ biprod.fst ≫ biprod.inl ≫ e2.inv := by
    calc
      f = e1.hom ≫ (e1.inv ≫ f ≫ e2.hom) ≫ e2.inv := by simp
      _ = e1.hom ≫ biprod.fst ≫ biprod.inl ≫ e2.inv := by
        rw [show e1.inv ≫ f ≫ e2.hom = biprod.fst ≫ biprod.inl from hf]
        simp only [Category.assoc]
  have hfq : f ≫ q + pA₀ ≫ iA₀ = 𝟙 _ := by
    rw [hf']
    simp only [q, pA₀, iA₀, Category.assoc, Iso.inv_hom_id_assoc,
      biprod.inl_fst_assoc]
    calc
      _ = e1.hom ≫ (biprod.fst ≫ biprod.inl + biprod.snd ≫ biprod.inr) ≫ e1.inv := by
        simp only [Preadditive.comp_add, Preadditive.add_comp, Category.assoc]
      _ = 𝟙 _ := by rw [biprod.total]; simp
  have hqf : q ≫ f + pB ≫ iB = 𝟙 _ := by
    rw [hf']
    simp only [q, pB, iB, Category.assoc, Iso.inv_hom_id_assoc,
      biprod.inl_fst_assoc]
    calc
      _ = e2.hom ≫ (biprod.fst ≫ biprod.inl + biprod.snd ≫ biprod.inr) ≫ e2.inv := by
        simp only [Preadditive.comp_add, Preadditive.add_comp, Category.assoc]
      _ = 𝟙 _ := by rw [biprod.total]; simp
  have hfj : f ≫ j = 0 := by
    change K.map T.mor₁ ≫ K.map T.mor₂ = 0
    rw [← K.map_comp, comp_distTriang_mor_zero₁₂ T hT, K.map_zero]
  have hjv : j ≫ v = 0 := by
    change K.map T.mor₂ ≫ K.map T.mor₃ = 0
    rw [← K.map_comp, comp_distTriang_mor_zero₂₃ T hT, K.map_zero]
  have hvf : v ≫ K.map (T.mor₁⟦(1 : ℤ)⟧') = 0 := by
    change K.map T.mor₃ ≫ K.map (T.mor₁⟦(1 : ℤ)⟧') = 0
    rw [← K.map_comp, comp_distTriang_mor_zero₃₁ T hT, K.map_zero]
  have hiA₀f : iA₀ ≫ f = 0 := by
    rw [hf']
    simp [iA₀, Category.assoc]
  have hvSf : v ≫ eS.hom ≫ S.map f = 0 := by
    rw [← shiftToKaroubiIso_naturality]
    rw [← Category.assoc, hvf, zero_comp]
  have hvS : v ≫ eS.hom ≫ S.map (pA₀ ≫ iA₀) = v ≫ eS.hom := by
    have he := congrArg (fun k => (v ≫ eS.hom) ≫ S.map k) hfq
    simp only [Functor.map_add, Functor.map_comp, Preadditive.comp_add] at he
    rw [S.map_id, Category.comp_id] at he
    rw [← Category.assoc,
      show (v ≫ eS.hom) ≫ S.map f = 0 by simpa only [Category.assoc] using hvSf,
      zero_comp, zero_add] at he
    simpa only [Category.assoc, S.map_comp] using he
  apply nonempty_iso_of_complementary_retracts f j v (K.map (T.mor₁⟦(1 : ℤ)⟧'))
    hjv (fun _ a ha => Stage3cKaroubi.coyoneda_exact₂ T hT a ha)
    (fun _ a ha => Stage3cKaroubi.coyoneda_exact₃ T hT a ha)
    (fun _ a ha => Stage3cKaroubi.coyoneda_exact₁ T hT a ha) iB pB iA pA
  · simp [iB, pB, Category.assoc]
  · rw [hf']
    simp [pB, Category.assoc]
  · have he := congrArg (fun k => k ≫ j) hqf
    simpa only [Preadditive.add_comp, Category.assoc, hfj, comp_zero, zero_add,
      Category.id_comp] using he
  · simp only [iA, pA]
    rw [Category.assoc, Iso.inv_hom_id_assoc, ← S.map_comp]
    simp [iA₀, pA₀]
  · simp only [iA]
    rw [Category.assoc, shiftToKaroubiIso_inv_naturality,
      ← Category.assoc, ← S.map_comp, hiA₀f, S.map_zero, zero_comp]
  · calc
      v ≫ pA ≫ iA = (v ≫ eS.hom ≫ S.map (pA₀ ≫ iA₀)) ≫ eS.inv := by
        simp only [pA, iA, S.map_comp, Category.assoc]
      _ = v := by rw [hvS]; simp

end Cone

end FindimCounterexample.Stage3cConeSplitting
