/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import Mathlib.Algebra.Group.Commute.Basic
import Mathlib.GroupTheory.Commutator.Basic

/-!
# Commutator identities for the selection group

The convention is `⁅x, y⁆ = x * y * x⁻¹ * y⁻¹`, exactly the convention
of Section 5 of the report. The transfer identity and the square calculation
in Proposition 5.11 hold in any group with the displayed relations.
-/

open scoped commutatorElement

namespace FindimCounterexample.SelectionCommutator

variable {H : Type*} [Group H]

/-- Mathlib's commutator convention agrees with Section 5 of the report. -/
theorem commutator_def (x y : H) : ⁅x, y⁆ = x * y * x⁻¹ * y⁻¹ := rfl

/-- An element commuting with each entry also commutes with their commutator. -/
theorem commute_commutator {q p v : H} (hqp : Commute q p) (hqv : Commute q v) :
    Commute q ⁅p, v⁆ := by
  rw [commutatorElement_def]
  exact ((hqp.mul_right hqv).mul_right hqp.inv_right).mul_right hqv.inv_right

/-- The commutator-transfer calculation of Proposition 5.11. -/
theorem transfer {x w v p q : H} (hxv : Commute x v)
    (hp : ⁅x, w⁆ = p) (hq : ⁅w, v⁆ = q)
    (hqp : Commute q p) (hqv : Commute q v) : ⁅x, q⁆ = ⁅p, v⁆ := by
  have hxw : x * w * x⁻¹ = p * w := by
    rw [← hp, commutatorElement_def]
    simp only [mul_assoc, inv_mul_cancel, mul_one]
  have hxv' : x * v * x⁻¹ = v := by
    rw [hxv.eq]
    simp only [mul_assoc, mul_inv_cancel, mul_one]
  have hconj : x * q * x⁻¹ = q * ⁅p, v⁆ := by
    rw [← hq, conjugate_commutatorElement, hxw, hxv',
      commutatorElement_mul_left_eq_conj_mul, hq, ← hqp.eq]
    simp only [mul_assoc, mul_inv_cancel, mul_one]
  rw [commutatorElement_def, hconj, (commute_commutator hqp hqv).eq]
  simp only [mul_assoc, mul_inv_cancel, mul_one]

/-- A commutator commuting with its involutory first entry has square one. -/
theorem commutator_sq_eq_one {x y : H} (hx : x ^ 2 = 1)
    (hc : Commute x ⁅x, y⁆) : ⁅x, y⁆ ^ 2 = 1 := by
  have h := commutatorElement_mul_left_eq_conj_mul x x y
  rw [← pow_two, hx, commutatorElement_one_left, hc.eq] at h
  simpa only [mul_assoc, mul_inv_cancel, mul_one, pow_two] using h.symm

/-- The square calculation when the commutator belongs to the centre. -/
theorem central_commutator_sq_eq_one {x y : H} (hx : x ^ 2 = 1)
    (hc : ⁅x, y⁆ ∈ Subgroup.center H) : ⁅x, y⁆ ^ 2 = 1 :=
  commutator_sq_eq_one hx (Subgroup.mem_center_iff.mp hc x)

end FindimCounterexample.SelectionCommutator
