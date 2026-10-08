/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import FindimCounterexample.FiniteQuotientRing
import Mathlib.Algebra.BigOperators.Finsupp.Basic

/-!
# Finite quotients separate finitely supported Laurent coefficients

Shift the support into the interval `0,...,m-1`, with `m` larger than its
width, and apply the monic power basis. Negative exponents are interpreted
as powers of the unit `t`, so the shift preserves the zero relation.
-/

namespace FindimCounterexample.FiniteQuotientRing

/-- If the support lies in `[-K,K]`, the modulus `2*K+1` detects every
nonzero coefficient vector. -/
theorem eq_zero_of_bounded_sum (f : ℤ →₀ ZMod 2) (K : ℕ)
    (hK : ∀ N ∈ f.support, N.natAbs ≤ K)
    (h : f.sum (fun N c => c • tPow (2 * K + 1) (by omega) N) = 0) :
    f = 0 := by
  classical
  let m := 2 * K + 1
  have hm : 0 < m := by omega
  have bounds (i : f.support) : -(K : ℤ) ≤ i.val ∧ i.val ≤ K := by
    have ha := hK i.val i.property
    have hb := Int.le_natAbs (a := i.val)
    have hc := Int.le_natAbs (a := -i.val)
    rw [Int.natAbs_neg] at hc
    omega
  let q : f.support → Fin m := fun i =>
    ⟨(i.val + K).toNat, by have hi := bounds i; dsimp [m]; omega⟩
  have hq (i : f.support) : ((q i).val : ℤ) = i.val + K := by
    dsimp [q]
    exact Int.toNat_of_nonneg (by have hi := bounds i; omega)
  have hqi : Function.Injective q := by
    intro i j hij
    apply Subtype.ext
    have he := congrArg (fun a : Fin m => (a.val : ℤ)) hij
    rw [hq i, hq j] at he
    omega
  have hli := (linearIndependent_tPow m hm).comp q hqi
  have hsum : (∑ i : f.support, f i.val • tPow m hm ((q i).val : ℤ)) = 0 := by
    simp only [hq]
    rw [Finset.sum_coe_sort f.support
      (fun N : ℤ => f N • tPow m hm (N + (K : ℤ)))]
    change f.sum (fun N c => c • tPow m hm N) = 0 at h
    have he := congrArg (fun x : S m => x * tPow m hm (K : ℤ)) h
    simpa only [Finsupp.sum, Finset.sum_mul, smul_mul_assoc, ← tPow_add, zero_mul] using he
  have hc := Fintype.linearIndependent_iff.mp hli (fun i : f.support => f i.val) hsum
  ext N
  by_cases hN : N ∈ f.support
  · exact hc ⟨N, hN⟩
  · exact Finsupp.notMem_support_iff.mp hN

/-- Vanishing in every positive-modulus coefficient quotient forces all
finitely supported Laurent coefficients to vanish. -/
theorem eq_zero_of_all_sums (f : ℤ →₀ ZMod 2)
    (h : ∀ m (hm : 0 < m), f.sum (fun N c => c • tPow m hm N) = 0) :
    f = 0 := by
  apply eq_zero_of_bounded_sum f (f.support.sup Int.natAbs)
  · intro N hN
    exact Finset.le_sup hN
  · exact h _ (by omega)

/-- Every nonzero finitely supported Laurent vector survives in one finite
coefficient quotient. -/
theorem exists_nonzero_sum (f : ℤ →₀ ZMod 2) (hf : f ≠ 0) :
    ∃ m, ∃ hm : 0 < m, f.sum (fun N c => c • tPow m hm N) ≠ 0 := by
  by_contra h
  push Not at h
  exact hf (eq_zero_of_all_sums f h)

end FindimCounterexample.FiniteQuotientRing
