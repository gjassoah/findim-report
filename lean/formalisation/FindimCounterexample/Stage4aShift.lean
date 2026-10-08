/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import Mathlib.CategoryTheory.Shift.ShiftedHom
import Mathlib.CategoryTheory.HomCongr

/-!
# Stage 4a: explicit identifications of shifted Hom spaces

These are consequences of Mathlib's integer shift, not interface fields.
The report writes these identifications implicitly when it calculates degrees.
-/

open CategoryTheory

namespace FindimCounterexample.Stage4a

universe u v
variable {C : Type u} [Category.{v} C] [HasShift C ℤ]

/-- Shift both ends of a homogeneous map and identify the target with the sum
of the shifts. The underlying function is the shifted map in the report. -/
noncomputable def shiftHomEquiv (X Y : C) (a b c : ℤ) (h : b + a = c) :
    ShiftedHom X Y b ≃ (X⟦a⟧ ⟶ Y⟦c⟧) :=
  (Functor.FullyFaithful.ofFullyFaithful (shiftFunctor C a)).homEquiv.trans
    (Iso.homCongr (Iso.refl _) ((shiftFunctorAdd' C b a c h).app Y).symm)

/-- The shift identification written without an implicit transport. -/
theorem shiftHomEquiv_apply (X Y : C) (a b c : ℤ) (h : b + a = c)
    (f : ShiftedHom X Y b) :
    shiftHomEquiv X Y a b c h f =
      f⟦a⟧' ≫ (shiftFunctorAdd' C b a c h).inv.app Y := by
  simp [shiftHomEquiv, Iso.homCongr]

/-- Vanishing in degree `b` gives vanishing between shifts differing by `b`. -/
theorem subsingleton_shiftHom (X Y : C) (a b c : ℤ) (h : b + a = c)
    (hb : Subsingleton (ShiftedHom X Y b)) :
    Subsingleton (X⟦a⟧ ⟶ Y⟦c⟧) := by
  have := hb
  exact (shiftHomEquiv X Y a b c h).symm.injective.subsingleton

omit [HasShift C ℤ] in
/-- Vanishing is unchanged on replacing source and target by isomorphic objects. -/
theorem subsingleton_hom_of_iso {X Y X' Y' : C} (e : X ≅ X') (f : Y ≅ Y')
    (h : Subsingleton (X' ⟶ Y')) : Subsingleton (X ⟶ Y) := by
  have := h
  exact (Iso.homCongr e f).injective.subsingleton

end FindimCounterexample.Stage4a
