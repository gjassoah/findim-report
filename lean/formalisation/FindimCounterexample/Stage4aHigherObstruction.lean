/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import FindimCounterexample.Stage4aInterface
import FindimCounterexample.Stage4aShift
import FindimCounterexample.Stage4aToda
import FindimCounterexample.Stage4aObstruction

/-!
# Stage 4a: the higher-degree case of Corollary 10.5

For a polynomial generator in degree `p > 3`, the bracket of degrees `p,-1,-1`
is nonempty and its target is zero. The proof derives the zero consecutive
composites and the zero target from the polynomial basis and Tate duality.
-/

open CategoryTheory CategoryTheory.Category CategoryTheory.Pretriangulated CategoryTheory.Limits

namespace FindimCounterexample.Stage4a

universe u v w

variable {k : Type u} [Field k] {C : Type w} [Category.{v} C]
  [Preadditive C] [Linear k C] [HasZeroObject C] [HasShift C ℤ]
  [∀ n : ℤ, Functor.Additive (shiftFunctor C n)] [Pretriangulated C]

namespace HigherObstruction

/-- The three degree vanishings suffice for the higher-degree bracket obstruction.
The consecutive zero composites and nonemptiness are conclusions of the proof. -/
theorem bracket_eq_zero_of_vanishings (s : C) (p : ℤ)
    (hneg : Subsingleton (ShiftedHom s s (-2 : ℤ)))
    (hcomp : Subsingleton (ShiftedHom s s (p - 1)))
    (htarget : Subsingleton (ShiftedHom s s (p - 3)))
    (f : s ⟶ s⟦(-1 : ℤ)⟧) (g : s⟦(-1 : ℤ)⟧ ⟶ s⟦(-2 : ℤ)⟧)
    (h : s⟦(-2 : ℤ)⟧ ⟶ s⟦p - 2⟧) {Q : C}
    (i : s⟦(-2 : ℤ)⟧ ⟶ Q) (q : Q ⟶ s⟦(-1 : ℤ)⟧⟦(1 : ℤ)⟧)
    (hT : Triangle.mk g i q ∈ distTriang C) :
    Toda.bracket (Triangle.mk g i q) f h = {0} := by
  have hcomp' := subsingleton_shiftHom s s (-1) (p - 1) (p - 2) (by omega) hcomp
  have := subsingleton_shiftHom s s 1 (p - 3) (p - 2) (by omega) htarget
  apply Toda.bracket_eq_zero_of_subsingleton hT
  · exact hneg.elim _ _
  · exact hcomp'.elim _ _

omit [HasZeroObject C] [∀ n : ℤ, Functor.Additive (shiftFunctor C n)] [Pretriangulated C] in
/-- Positive components below the generator degree vanish, directly from the
homogeneous polynomial basis in the approved input. -/
theorem polynomial_low_degree {s : C} {p : ℕ}
    (P : PolynomialSelfExtensions (k := k) s p) (n : ℕ) (hn : 0 < n) (hnp : n < p) :
    Subsingleton (ShiftedHom s s (n : ℤ)) :=
  P.subsingleton_of_not_dvd n (Nat.not_dvd_of_pos_of_lt hn hnp)

/-- Corollary 10.5 for `p > 3`, in the chosen-cone definition of the report.
The middle and last arrows are exactly the shifted copies of `β` and `τ`,
with all shift identifications given by `shiftHomEquiv`. -/
theorem polynomial_toda_eq_zero_gt_three (D : TateDuality k C) {s : C} {p : ℕ}
    (P : PolynomialSelfExtensions (k := k) s p) (hp : 3 < p)
    (τ : ShiftedHom s s (p : ℤ)) (β : ShiftedHom s s (-1 : ℤ))
    {Q : C} (i : s⟦(-2 : ℤ)⟧ ⟶ Q) (q : Q ⟶ s⟦(-1 : ℤ)⟧⟦(1 : ℤ)⟧)
    (hT : Triangle.mk (shiftHomEquiv s s (-1) (-1) (-2) (by norm_num) β) i q ∈
      distTriang C) :
    Toda.bracket
      (Triangle.mk (shiftHomEquiv s s (-1) (-1) (-2) (by norm_num) β) i q) β
      (shiftHomEquiv s s (-2) (p : ℤ) ((p : ℤ) - 2) (by omega) τ) = {0} := by
  have h₁ : Subsingleton (ShiftedHom s s (1 : ℤ)) :=
    polynomial_low_degree P 1 (by omega) (by omega)
  have hneg := D.subsingleton_complement s s 1 (-2) (by norm_num) h₁
  have hpred : Subsingleton (ShiftedHom s s ((p : ℤ) - 1)) := by
    have heq : ((p - 1 : ℕ) : ℤ) = (p : ℤ) - 1 := by omega
    rw [← heq]
    exact polynomial_low_degree P (p - 1) (by omega) (by omega)
  have htarget : Subsingleton (ShiftedHom s s ((p : ℤ) - 3)) := by
    have heq : ((p - 3 : ℕ) : ℤ) = (p : ℤ) - 3 := by omega
    rw [← heq]
    exact polynomial_low_degree P (p - 3) (by omega) (by omega)
  exact bracket_eq_zero_of_vanishings s (p : ℤ) hneg hpred htarget β _ _ i q hT

/-- Corollary 10.5 for every polynomial generator degree `p ≥ 3`. The conclusion
holds for all degree-`p` classes, hence in particular for the polynomial generator. -/
theorem polynomial_toda_eq_zero (D : TateDuality k C) {s : C} {p : ℕ}
    (P : PolynomialSelfExtensions (k := k) s p) (hp : 3 ≤ p)
    (τ : ShiftedHom s s (p : ℤ)) (β : ShiftedHom s s (-1 : ℤ))
    {Q : C} (i : s⟦(-2 : ℤ)⟧ ⟶ Q) (q : Q ⟶ s⟦(-1 : ℤ)⟧⟦(1 : ℤ)⟧)
    (hT : Triangle.mk (shiftHomEquiv s s (-1) (-1) (-2) (by norm_num) β) i q ∈
      distTriang C) :
    Toda.bracket
      (Triangle.mk (shiftHomEquiv s s (-1) (-1) (-2) (by norm_num) β) i q) β
      (shiftHomEquiv s s (-2) (p : ℤ) ((p : ℤ) - 2) (by omega) τ) = {0} := by
  by_cases hp₃ : p = 3
  · subst p
    have h₀ : Module.finrank k (ShiftedHom s s (0 : ℤ)) = 1 := by
      simpa using P.finrank_multiple (by norm_num) 0
    have : FiniteDimensional k (ShiftedHom s s (0 : ℤ)) :=
      FiniteDimensional.of_finrank_eq_succ h₀
    have h₁ : Subsingleton (ShiftedHom s s (1 : ℤ)) :=
      polynomial_low_degree P 1 (by norm_num) (by norm_num)
    have h₂ : Subsingleton (ShiftedHom s s (2 : ℤ)) :=
      polynomial_low_degree P 2 (by norm_num) (by norm_num)
    have h₄ : Subsingleton (ShiftedHom s s (4 : ℤ)) :=
      P.subsingleton_of_not_dvd 4 (by norm_num)
    exact tate_obstruction D s h₀ h₁ h₂ h₄ τ β Q i q hT
  · exact polynomial_toda_eq_zero_gt_three D P (by omega) τ β i q hT

end HigherObstruction

end FindimCounterexample.Stage4a
