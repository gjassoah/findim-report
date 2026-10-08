/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import Mathlib.Algebra.Group.Commute.Basic
import Mathlib.Tactic.Ring

/-!
# Integer conjugation orbits

These elementary group identities give the torus action in the finite
presentation of Proposition 5.9. All assumptions are explicit identities
in an arbitrary group, to be instantiated in the presented groups.
-/

namespace FindimCounterexample.SelectionTorus

variable {H : Type*} [Group H]

/-- Conjugation by a product is successive conjugation, in the same order. -/
theorem conjugate_mul (a b x : H) :
    (a * b) * x * (a * b)⁻¹ = a * (b * x * b⁻¹) * a⁻¹ := by
  simp only [mul_inv_rev, mul_assoc]

/-- A one-step shift under conjugation gives every integer multiple of the shift. -/
theorem conjugate_zpow_shift (a : H) (s : ℤ → H) (k : ℤ)
    (h : ∀ r, a * s r * a⁻¹ = s (r + k)) (n r : ℤ) :
    a ^ n * s r * (a ^ n)⁻¹ = s (r + n * k) := by
  have hi (r : ℤ) : a⁻¹ * s r * a = s (r - k) := by
    have he := congrArg (fun x : H => a⁻¹ * x * a) (h (r - k))
    simpa only [sub_add_cancel, mul_assoc, inv_mul_cancel_left,
      inv_mul_cancel, mul_one] using he.symm
  induction n using Int.induction_on generalizing r with
  | zero => simp
  | succ n ih =>
      rw [zpow_add_one, conjugate_mul, h, ih]
      congr 1
      ring
  | pred n ih =>
      rw [zpow_sub_one, conjugate_mul, inv_inv, hi, ih]
      congr 1
      ring

/-- A commuting conjugator shifts every point of an integer conjugation orbit
by the same amount as it shifts the initial point. -/
theorem orbit_conjugate (a b x : H) (k r : ℤ) (hab : Commute a b)
    (h : b * x * b⁻¹ = a ^ k * x * (a ^ k)⁻¹) :
    b * (a ^ r * x * (a ^ r)⁻¹) * b⁻¹ =
      a ^ (r + k) * x * (a ^ (r + k))⁻¹ := by
  rw [← conjugate_mul, (hab.symm.zpow_right r).eq, conjugate_mul, h,
    ← conjugate_mul, ← zpow_add]

end FindimCounterexample.SelectionTorus
