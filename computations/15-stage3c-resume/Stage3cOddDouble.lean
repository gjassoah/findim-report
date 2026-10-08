/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import FindimCounterexample.Stage3cConeSplitting

/-!
# Odd doubles of formal summands

The two cones of Proposition 6.7 are chosen in the original pretriangulated
category. Their decompositions live in its Karoubi category; no triangulation
of that category is used. The Grothendieck-group assertion is outside the scope.
-/

open CategoryTheory CategoryTheory.Category CategoryTheory.Limits
open CategoryTheory.Idempotents CategoryTheory.Pretriangulated
open FindimCounterexample.Stage3cKaroubi

namespace FindimCounterexample.Stage3cOddDouble

universe v u

variable {C : Type u} [Category.{v} C] [Preadditive C]

noncomputable section

/-- The complement is placed first, so that `1 - p` is the identity block. -/
def complementDecomposition [HasFiniteBiproducts C] (U : Karoubi C) :
    (toKaroubi C).obj U.X ≅ U.complement ⊞ U :=
  U.decomposition.symm ≪≫ biprod.braiding U U.complement

/-- In the complement decomposition, `1 - p` has only its identity block. -/
theorem complement_matrix [HasFiniteBiproducts C] (U : Karoubi C) :
    (complementDecomposition U).inv ≫ (toKaroubi C).map (𝟙 U.X - U.p) ≫
      (complementDecomposition U).hom = biprod.fst ≫ biprod.inl := by
  have hp : U.decomposition.inv ≫ biprod.snd = U.complement.decompId_p :=
    biprod.lift_snd _ _
  have hi : biprod.inr ≫ U.decomposition.hom = U.complement.decompId_i :=
    biprod.inr_desc _ _
  have hmap : (toKaroubi C).map (𝟙 U.X - U.p) =
      U.complement.decompId_p ≫ U.complement.decompId_i := U.complement.decomp_p
  have hb : (biprod.inr : U.complement ⟶ U ⊞ U.complement) ≫
      (biprod.braiding U U.complement).hom = biprod.inl := by
    rw [← biprod.braiding'_eq_braiding]
    exact biprod.inr_desc _ _
  have hb' : (biprod.braiding U U.complement).inv ≫ biprod.snd = biprod.fst :=
    biprod.lift_snd _ _
  rw [hmap, ← hp, ← hi]
  simp only [complementDecomposition, Iso.trans_inv, Iso.symm_inv, Iso.trans_hom,
    Iso.symm_hom]
  change ((biprod.braiding U U.complement).inv ≫ U.decomposition.hom) ≫
    ((U.decomposition.inv ≫ biprod.snd) ≫ biprod.inr ≫ U.decomposition.hom) ≫
      U.decomposition.inv ≫ (biprod.braiding U U.complement).hom = _
  simp only [Category.assoc]
  rw [Iso.hom_inv_id_assoc, Iso.hom_inv_id_assoc, hb, reassoc_of% hb']

variable [HasZeroObject C] [HasShift C ℤ]
  [∀ n : ℤ, (shiftFunctor C n).Additive]

/-- The first cone and its decomposition `U ⊞ U[1]`. -/
def firstDouble [Pretriangulated C] (U : Karoubi C) :
    Σ X : C, (toKaroubi C).obj X ≅ U ⊞ (shift 1).obj U := by
  apply Classical.choice
  obtain ⟨X, j, v, hT⟩ := distinguished_cocone_triangle (𝟙 U.X - U.p)
  exact ⟨⟨X, Stage3cConeSplitting.coneSplittingIso
    (Triangle.mk (𝟙 U.X - U.p) j v) hT
    (complementDecomposition U) (complementDecomposition U) (complement_matrix U)⟩⟩

/-- Shift the first decomposition, identifying the iterated shift with `[2]`. -/
def shiftedDecomposition [HasFiniteBiproducts C] (U : Karoubi C) {X : C}
    (e : (toKaroubi C).obj X ≅ U ⊞ (shift 1).obj U) :
    (toKaroubi C).obj (X⟦(1 : ℤ)⟧) ≅ (shift 1).obj U ⊞ (shift 2).obj U := by
  letI : PreservesBinaryBiproducts (shift (C := C) 1) :=
    preservesBinaryBiproducts_of_preservesBiproducts _
  exact shiftToKaroubiIso 1 X ≪≫ (shift 1).mapIso e ≪≫
    (shift 1).mapBiprod U ((shift 1).obj U) ≪≫
    biprod.mapIso (Iso.refl _) (shiftAddIso 1 1 U)

/-- The second cone and its decomposition `U ⊞ U[3]`. -/
def thirdDouble [Pretriangulated C] (U : Karoubi C) :
    Σ X : C, (toKaroubi C).obj X ≅ U ⊞ (shift 3).obj U := by
  apply Classical.choice
  let X := (firstDouble U).1
  let e := (firstDouble U).2
  let e₁ := shiftedDecomposition U e
  let e₂ := e ≪≫ biprod.braiding U ((shift 1).obj U)
  let g : X⟦(1 : ℤ)⟧ ⟶ X := (toKaroubi C).preimage
    (e₁.hom ≫ biprod.fst ≫ biprod.inl ≫ e₂.inv)
  have hg : e₁.inv ≫ (toKaroubi C).map g ≫ e₂.hom =
      biprod.fst ≫ biprod.inl := by
    simp [g, Category.assoc]
  obtain ⟨V, j, v, hT⟩ := distinguished_cocone_triangle g
  exact ⟨⟨V, Stage3cConeSplitting.coneSplittingIso (Triangle.mk g j v) hT e₁ e₂ hg ≪≫
    biprod.mapIso (Iso.refl _) (shiftAddIso 2 1 U)⟩⟩

/-- Proposition 6.7 without its Grothendieck-group clause, for any formal summand. -/
theorem exists_odd_doubles [Pretriangulated C] (U : Karoubi C) :
    ∃ X V : C, Nonempty ((toKaroubi C).obj X ≅ U ⊞ (shift 1).obj U) ∧
      Nonempty ((toKaroubi C).obj V ≅ U ⊞ (shift 3).obj U) :=
  ⟨(firstDouble U).1, (thirdDouble U).1, ⟨(firstDouble U).2⟩, ⟨(thirdDouble U).2⟩⟩

end

end FindimCounterexample.Stage3cOddDouble
