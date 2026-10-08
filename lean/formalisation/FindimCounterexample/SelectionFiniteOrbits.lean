/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import FindimCounterexample.SelectionFinitePresentation
import FindimCounterexample.SelectionTorus

/-!
# Root orbits in the finite presentation

The finite torus-kernel relations give exactly the one-step shifts of the
infinite presentation. The root orbits use inverse torus powers for U and
positive torus powers for V and W, as in Proposition 5.9.
-/

namespace FindimCounterexample.SelectionFinite

open SelectionGroup (Index Pair Root)

/-- The torus element whose conjugation increases a root parameter by one. -/
def base : Root → P
  | .u i => (T i)⁻¹
  | .v i => T i
  | .w ij => T ij.val.1

/-- The integer-parameter root family constructed from the finite generators. -/
def family (a : Root) (r : ℤ) : P :=
  base a ^ r * root0 a * (base a ^ r)⁻¹

@[simp]
theorem family_zero (a : Root) : family a 0 = root0 a := by simp [family]

theorem base_commute (a : Root) (l : Index) : Commute (base a) (T l) := by
  cases a with
  | u i => exact (torus_commute i l).inv_left
  | v i => exact torus_commute i l
  | w ij => exact torus_commute ij.val.1 l

private theorem conjugate_eq_self {H : Type*} [Group H] {a x : H}
    (h : Commute a x) : a * x * a⁻¹ = x := by
  rw [h.eq]
  simp only [mul_assoc, mul_inv_cancel, mul_one]

/-- The pair-kernel relation makes the second W index shift in the negative
direction. -/
theorem torus_w_second (ij : Pair) :
    T ij.val.2 * W0 ij * (T ij.val.2)⁻¹ = (T ij.val.1)⁻¹ * W0 ij * T ij.val.1 := by
  have h := congrArg (fun x : P => (T ij.val.1)⁻¹ * x * T ij.val.1)
    (conjugate_eq_self (torus_w_pair ij))
  simpa only [mul_inv_rev, mul_assoc, inv_mul_cancel_left,
    inv_mul_cancel, mul_one] using h

/-- The finite kernel relations give the required action on each initial root. -/
theorem conjugation_zero (l : Index) (a : Root) :
    T l * root0 a * (T l)⁻¹ =
      base a ^ SelectionGroup.step a l * root0 a * (base a ^ SelectionGroup.step a l)⁻¹ := by
  cases a with
  | u i =>
      by_cases hli : l = i
      · subst l
        simp [base, SelectionGroup.step, SelectionGroup.weight]
      · simpa [base, SelectionGroup.step, SelectionGroup.weight, Ne.symm hli] using
          conjugate_eq_self (torus_u0 l i hli)
  | v i =>
      by_cases hli : l = i
      · subst l
        simp [base, SelectionGroup.step, SelectionGroup.weight]
      · simpa [base, SelectionGroup.step, SelectionGroup.weight, Ne.symm hli] using
          conjugate_eq_self (torus_v0 l i hli)
  | w ij =>
      by_cases hli : l = ij.val.1
      · subst l
        simp [base, SelectionGroup.step, SelectionGroup.weight, ij.property.symm]
      · by_cases hlj : l = ij.val.2
        · subst l
          simpa [base, SelectionGroup.step, SelectionGroup.weight,
            ij.property] using torus_w_second ij
        · simpa [base, SelectionGroup.step, SelectionGroup.weight,
            Ne.symm hli, Ne.symm hlj] using
            conjugate_eq_self (torus_w_third ij l hli hlj)

/-- Every root orbit satisfies the conjugation relation in Definition 5.6. -/
theorem conjugation (l : Index) (a : Root) (r : ℤ) :
    T l * family a r * (T l)⁻¹ = family a (r + SelectionGroup.step a l) :=
  SelectionTorus.orbit_conjugate (base a) (T l) (root0 a)
    (SelectionGroup.step a l) r (base_commute a l) (conjugation_zero l a)

end FindimCounterexample.SelectionFinite
