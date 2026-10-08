/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import FindimCounterexample.Stage4aInterface
import FindimCounterexample.Stage4aShift
import FindimCounterexample.Stage4aToda

/-!
# Stage 4a: the Tate-duality obstruction

Report Theorem 10.4, conditional on the approved perfect Tate pairing.
The bracket is represented by the chain `s → s[-1] → s[-2] → s[1]`.
It therefore lies in `Hom(s[1],s[1])`, identified with degree zero by shifting.
Every choice of distinguished triangle on the middle arrow is allowed.
-/

open CategoryTheory CategoryTheory.Category CategoryTheory.Limits
  CategoryTheory.Pretriangulated

namespace FindimCounterexample.Stage4a

universe u v w
variable {k : Type u} [Field k] {C : Type w} [Category.{v} C]
  [Preadditive C] [Linear k C] [HasZeroObject C] [HasShift C ℤ]
  [∀ n : ℤ, Functor.Additive (shiftFunctor C n)] [Pretriangulated C]

set_option backward.isDefEq.respectTransparency false in
/-- Theorem 10.4 in actual shifted Hom spaces. The three vanishings and scalar
endomorphisms are hypotheses of this theorem, not fields of the Tate interface. -/
theorem tate_obstruction (D : TateDuality k C) (s : C)
    [FiniteDimensional k (ShiftedHom s s (0 : ℤ))]
    (h₀ : Module.finrank k (ShiftedHom s s (0 : ℤ)) = 1)
    (h₁ : Subsingleton (ShiftedHom s s (1 : ℤ)))
    (h₂ : Subsingleton (ShiftedHom s s (2 : ℤ)))
    (h₄ : Subsingleton (ShiftedHom s s (4 : ℤ)))
    (τ : ShiftedHom s s (3 : ℤ)) (β : ShiftedHom s s (-1 : ℤ))
    (Z : C) (i : s⟦(-2 : ℤ)⟧ ⟶ Z) (q : Z ⟶ s⟦(-1 : ℤ)⟧⟦(1 : ℤ)⟧)
    (hT : Triangle.mk (shiftHomEquiv s s (-1) (-1) (-2) rfl β) i q ∈ distTriang C) :
    Toda.bracket (Triangle.mk (shiftHomEquiv s s (-1) (-1) (-2) rfl β) i q) β
      (shiftHomEquiv s s (-2) 3 1 rfl τ) = {0} := by
  have hm₂ := D.subsingleton_complement s s 1 (-2) (by norm_num) h₁
  have hm₃ := D.subsingleton_complement s s 2 (-3) (by norm_num) h₂
  have hm₅ := D.subsingleton_complement s s 4 (-5) (by norm_num) h₄
  have : Subsingleton (s⟦(1 : ℤ)⟧ ⟶
      (Triangle.mk (shiftHomEquiv s s (-1) (-1) (-2) rfl β) i q).obj₂) :=
    subsingleton_shiftHom s s 1 (-3) (-2) rfl hm₃
  have : Subsingleton (
      (Triangle.mk (shiftHomEquiv s s (-1) (-1) (-2) rfl β) i q).obj₁⟦(1 : ℤ)⟧ ⟶
        s⟦(1 : ℤ)⟧) :=
    subsingleton_hom_of_iso
      (((shiftFunctorAdd' C (-1) 1 0 rfl).app s).symm ≪≫
        (shiftFunctorZero C ℤ).app s) (Iso.refl _) h₁
  have hfg : β ≫ shiftHomEquiv s s (-1) (-1) (-2) rfl β = 0 := hm₂.elim _ _
  have hgh : shiftHomEquiv s s (-1) (-1) (-2) rfl β ≫
      shiftHomEquiv s s (-2) 3 1 rfl τ = 0 :=
    (subsingleton_shiftHom s s (-1) 2 1 rfl h₂).elim _ _
  by_cases hτ : τ = 0
  · subst τ
    have hz : shiftHomEquiv s s (-2) 3 1 rfl (0 : ShiftedHom s s (3 : ℤ)) = 0 := by
      simp [shiftHomEquiv_apply]
    rw [hz]
    obtain ⟨d, hd⟩ := Toda.zero_mem_bracket hT hfg (W := s⟦(1 : ℤ)⟧)
    rw [Toda.bracket_eq_singleton hT d, hd]
  · obtain ⟨γ, hγ⟩ := D.right_factorization h₀ τ hτ β
    let f : s⟦(3 : ℤ)⟧ ⟶ s⟦(-1 : ℤ)⟧ :=
      shiftHomEquiv s s 3 (-4) (-1) rfl γ
    have hfac : τ ≫ f = β := by
      simpa only [f, shiftHomEquiv_apply, ShiftedHom.comp, assoc] using hγ
    have hfg' : f ≫ shiftHomEquiv s s (-1) (-1) (-2) rfl β = 0 :=
      (subsingleton_shiftHom s s 3 (-5) (-2) rfl hm₅).elim _ _
    have : Subsingleton (s⟦(3 : ℤ)⟧⟦(1 : ℤ)⟧ ⟶ s⟦(1 : ℤ)⟧) :=
      subsingleton_hom_of_iso ((shiftFunctorAdd' C 3 1 4 rfl).app s).symm
        (Iso.refl _) (subsingleton_shiftHom s s 4 (-3) 1 rfl hm₃)
    simpa only [hfac] using Toda.bracket_eq_zero_of_factor hT hfg' hgh τ

end FindimCounterexample.Stage4a
