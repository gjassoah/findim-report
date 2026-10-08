/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import FindimCounterexample.Stage4aCone
import FindimCounterexample.Stage4aRank

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
