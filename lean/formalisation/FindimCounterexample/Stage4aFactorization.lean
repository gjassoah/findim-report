/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import FindimCounterexample.Stage4aInterface

/-!
# Stage 4a: the composite in Corollary 10.3

Tate duality factors every degree-minus-one class on the right through a
nonzero degree-three class. Associativity then reduces the composite with a
degree-one map to a map of degree minus three. The cone calculation supplies
the vanishing of that group; it is not an interface assumption.
-/

open CategoryTheory

namespace FindimCounterexample.Stage4a

universe u v w
variable {k : Type u} [Field k] {C : Type w} [Category.{v} C]
  [Preadditive C] [Linear k C] [HasShift C ℤ]
  [∀ n : ℤ, Functor.Additive (shiftFunctor C n)]

/-- The factorisation step of Corollary 10.3, before applying the one-cone
calculation. No triangle or Hom vanishing is built into the interface. -/
theorem beta_comp_eq_zero (D : TateDuality k C) {s X : C}
    [FiniteDimensional k (ShiftedHom s s (0 : ℤ))]
    (h₀ : Module.finrank k (ShiftedHom s s (0 : ℤ)) = 1)
    (τ : ShiftedHom s s (3 : ℤ)) (hτ : τ ≠ 0)
    (hX : Subsingleton (ShiftedHom s X (-3 : ℤ)))
    (β : ShiftedHom s s (-1 : ℤ)) (w : ShiftedHom s X (1 : ℤ)) :
    β.comp w (show (1 : ℤ) + (-1) = 0 by norm_num) = 0 := by
  obtain ⟨γ, rfl⟩ := D.right_factorization h₀ τ hτ β
  rw [ShiftedHom.comp_assoc τ γ w (show (-4 : ℤ) + 3 = -1 by norm_num)
    (show (1 : ℤ) + (-4) = -3 by norm_num) (by norm_num)]
  rw [hX.elim (γ.comp w (by norm_num)) 0, ShiftedHom.comp_zero]

/-- The same vanishing before collapsing the two shifts of the target. This
is the form needed by the original triangle in Proposition 10.2. -/
theorem beta_shift_comp_eq_zero (D : TateDuality k C) {s X : C}
    [FiniteDimensional k (ShiftedHom s s (0 : ℤ))]
    (h₀ : Module.finrank k (ShiftedHom s s (0 : ℤ)) = 1)
    (τ : ShiftedHom s s (3 : ℤ)) (hτ : τ ≠ 0)
    (hX : Subsingleton (ShiftedHom s X (-3 : ℤ)))
    (β : ShiftedHom s s (-1 : ℤ)) (w : ShiftedHom s X (1 : ℤ)) :
    β ≫ w⟦(-1 : ℤ)⟧' = 0 := by
  apply (cancel_mono ((shiftFunctorAdd' C 1 (-1) 0 (by norm_num)).inv.app X)).mp
  simpa only [Category.assoc, CategoryTheory.Limits.zero_comp, ShiftedHom.comp] using
    beta_comp_eq_zero D h₀ τ hτ hX β w

end FindimCounterexample.Stage4a
