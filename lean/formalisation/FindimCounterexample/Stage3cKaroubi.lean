/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import Mathlib.CategoryTheory.Idempotents.Biproducts
import Mathlib.CategoryTheory.Idempotents.FunctorExtension
import Mathlib.CategoryTheory.Triangulated.Pretriangulated

/-!
# Shifts and Hom exactness in the Karoubi envelope

The individual shift functors extend by Mathlib's functor extension to the
Karoubi envelope. Their comparison isomorphisms are inherited from the original
category. Hom exactness for triangles is inherited by cutting a lift with the
source idempotent. No triangulated structure on the Karoubi envelope is used.
-/

open CategoryTheory CategoryTheory.Limits CategoryTheory.Idempotents
open CategoryTheory.Pretriangulated

namespace FindimCounterexample.Stage3cKaroubi

universe v u

variable {C : Type u} [Category.{v} C]

/-- Mathlib provides finite biproducts in the envelope; its binary-biproduct
bridge is a theorem, so we register the instance used by this stage. -/
instance karoubi_hasBinaryBiproducts [Preadditive C] [HasFiniteBiproducts C] :
    HasBinaryBiproducts (Karoubi C) :=
  hasBinaryBiproducts_of_finite_biproducts (Karoubi C)

section Shift

variable [HasShift C ℤ]

/-- The shift of a formal direct summand, using Mathlib's functor extension. -/
def shift (n : ℤ) : Karoubi C ⥤ Karoubi C :=
  (functorExtension₂ C C).obj (shiftFunctor C n)

@[simp]
theorem shift_obj_X (n : ℤ) (P : Karoubi C) : ((shift n).obj P).X = P.X⟦n⟧ := rfl

@[simp]
theorem shift_obj_p (n : ℤ) (P : Karoubi C) : ((shift n).obj P).p = P.p⟦n⟧' := rfl

@[simp]
theorem shift_map_f (n : ℤ) {P Q : Karoubi C} (f : P ⟶ Q) :
    ((shift n).map f).f = f.f⟦n⟧' := rfl

instance shift_additive [Preadditive C] (n : ℤ) [(shiftFunctor C n).Additive] :
    (shift (C := C) n).Additive where
  map_add := by
    intro P Q f g
    ext
    exact (shiftFunctor C n).map_add

/-- Shifting an original object agrees with shifting its image in the envelope. -/
def shiftToKaroubiIso (n : ℤ) (X : C) :
    (toKaroubi C).obj (X⟦n⟧) ≅ (shift n).obj ((toKaroubi C).obj X) :=
  (((functorExtension₂CompWhiskeringLeftToKaroubiIso C C).app
    (shiftFunctor C n)).app X).symm

@[simp]
theorem shiftToKaroubiIso_hom_f (n : ℤ) (X : C) :
    (shiftToKaroubiIso n X).hom.f = 𝟙 (X⟦n⟧) := rfl

@[simp]
theorem shiftToKaroubiIso_inv_f (n : ℤ) (X : C) :
    (shiftToKaroubiIso n X).inv.f = 𝟙 (X⟦n⟧) := rfl

@[reassoc]
theorem shiftToKaroubiIso_naturality (n : ℤ) {X Y : C} (f : X ⟶ Y) :
    (toKaroubi C).map (f⟦n⟧') ≫ (shiftToKaroubiIso n Y).hom =
      (shiftToKaroubiIso n X).hom ≫ (shift n).map ((toKaroubi C).map f) := by
  ext
  simp

@[reassoc]
theorem shiftToKaroubiIso_inv_naturality (n : ℤ) {X Y : C} (f : X ⟶ Y) :
    (shiftToKaroubiIso n X).inv ≫ (toKaroubi C).map (f⟦n⟧') =
      (shift n).map ((toKaroubi C).map f) ≫ (shiftToKaroubiIso n Y).inv := by
  ext
  simp

/-- Composing the extended shifts agrees with addition of their indices. -/
def shiftAddIso (m n : ℤ) (P : Karoubi C) :
    (shift n).obj ((shift m).obj P) ≅ (shift (m + n)).obj P :=
  (((functorExtension₂ C C).mapIso (shiftFunctorAdd C m n)).app P).symm

end Shift

section Exactness

variable [Preadditive C]

/-- Exactness of maps into original objects persists for a formal summand as
source. A lift in the original category is cut by the source idempotent. -/
theorem lift_exact {X Y Z : C} (f : X ⟶ Y) (g : Y ⟶ Z)
    (hex : ∀ (W : C) (a : W ⟶ Y), a ≫ g = 0 → ∃ b : W ⟶ X, a = b ≫ f)
    {P : Karoubi C} (a : P ⟶ (toKaroubi C).obj Y)
    (ha : a ≫ (toKaroubi C).map g = 0) :
    ∃ b : P ⟶ (toKaroubi C).obj X, a = b ≫ (toKaroubi C).map f := by
  have ha' : a.f ≫ g = 0 := congrArg Karoubi.Hom.f ha
  obtain ⟨b, hb⟩ := hex P.X a.f ha'
  refine ⟨⟨P.p ≫ b, by simp⟩, ?_⟩
  ext
  dsimp
  rw [Category.assoc, ← hb, Karoubi.p_comp]

variable [HasZeroObject C] [HasShift C ℤ]
variable [∀ n : ℤ, (shiftFunctor C n).Additive] [Pretriangulated C]

/-- Hom exactness at the second object of a distinguished triangle for every
object of the Karoubi envelope. -/
theorem coyoneda_exact₂ (T : Triangle C) (hT : T ∈ distTriang C)
    {P : Karoubi C} (a : P ⟶ (toKaroubi C).obj T.obj₂)
    (ha : a ≫ (toKaroubi C).map T.mor₂ = 0) :
    ∃ b : P ⟶ (toKaroubi C).obj T.obj₁,
      a = b ≫ (toKaroubi C).map T.mor₁ :=
  lift_exact T.mor₁ T.mor₂ (fun _ b hb => T.coyoneda_exact₂ hT b hb) a ha

/-- Hom exactness at the third object of a distinguished triangle for every
object of the Karoubi envelope. -/
theorem coyoneda_exact₃ (T : Triangle C) (hT : T ∈ distTriang C)
    {P : Karoubi C} (a : P ⟶ (toKaroubi C).obj T.obj₃)
    (ha : a ≫ (toKaroubi C).map T.mor₃ = 0) :
    ∃ b : P ⟶ (toKaroubi C).obj T.obj₂,
      a = b ≫ (toKaroubi C).map T.mor₂ :=
  lift_exact T.mor₂ T.mor₃ (fun _ b hb => T.coyoneda_exact₃ hT b hb) a ha

/-- Hom exactness at the shifted first object, without giving the Karoubi
envelope a triangulated structure. -/
theorem coyoneda_exact₁ (T : Triangle C) (hT : T ∈ distTriang C)
    {P : Karoubi C} (a : P ⟶ (toKaroubi C).obj (T.obj₁⟦(1 : ℤ)⟧))
    (ha : a ≫ (toKaroubi C).map (T.mor₁⟦(1 : ℤ)⟧') = 0) :
    ∃ b : P ⟶ (toKaroubi C).obj T.obj₃,
      a = b ≫ (toKaroubi C).map T.mor₃ :=
  lift_exact T.mor₃ (T.mor₁⟦(1 : ℤ)⟧')
    (fun _ b hb => T.coyoneda_exact₁ hT b hb) a ha

end Exactness

end FindimCounterexample.Stage3cKaroubi
