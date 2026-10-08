/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import Mathlib.LinearAlgebra.Dual.Lemmas
import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas

/-!
# The abstract rank-function obstruction

The linear-algebra reduction in Proposition 5.4: an eventually zero evaluation
along an endomorphism orbit vanishes from the dimension of the ambient space
onwards. Restriction to the span of the orbit removes the need to assume that
the given vector is cyclic. Kernel stabilization on the dual of this span
replaces the Fitting decomposition used in the report.

These abstract linear-algebra statements have status AI-proved. Acceptance
evidence is kept in the accompanying verification repository. The connection
to K₀ and the rank functions is not formalised.
-/

namespace FindimCounterexample.RankObstruction

universe u v

variable {K : Type u} [Field K] {V : Type v} [AddCommGroup V] [Module K V]

private theorem dual_pow_apply (T : Module.End K V) (φ : Module.Dual K V)
    (n : ℕ) (x : V) : (T.dualMap ^ n) φ x = φ ((T ^ n) x) := by
  induction n generalizing x with
  | zero => rfl
  | succ n ih =>
    rw [pow_succ' T.dualMap, Module.End.mul_apply, LinearMap.dualMap_apply,
      ih, pow_succ T, Module.End.mul_apply]

variable [FiniteDimensional K V]

/-- If a functional vanishes eventually along an orbit, it vanishes at every
time at least the dimension of the ambient vector space. -/
theorem apply_pow_eq_zero_of_eventually (T : Module.End K V) (v : V)
    (φ : Module.Dual K V) (h : ∃ t₀ : ℕ, ∀ t, t₀ ≤ t → φ ((T ^ t) v) = 0)
    (t : ℕ) (ht : Module.finrank K V ≤ t) : φ ((T ^ t) v) = 0 := by
  obtain ⟨t₀, h₀⟩ := h
  let C := Submodule.span K (Set.range fun n : ℕ => (T ^ n) v)
  have hC : ∀ x ∈ C, T x ∈ C := by
    change C ≤ C.comap T
    apply Submodule.span_le.mpr
    rintro _ ⟨n, rfl⟩
    change T ((T ^ n) v) ∈ C
    rw [← Module.End.mul_apply, ← pow_succ']
    exact Submodule.subset_span ⟨n + 1, rfl⟩
  let S : Module.End K C := T.restrict hC
  let ψ : Module.Dual K C := φ.domRestrict C
  have hvanish : ∀ x ∈ C, φ ((T ^ t₀) x) = 0 := by
    intro x hx
    apply LinearMap.eqOn_span (f := φ.comp (T ^ t₀)) (g := 0) ?_ hx
    rintro _ ⟨n, rfl⟩
    change φ ((T ^ t₀) ((T ^ n) v)) = 0
    rw [← Module.End.mul_apply, ← pow_add]
    exact h₀ (t₀ + n) (Nat.le_add_right t₀ n)
  have hψ : ψ ∈ LinearMap.ker (S.dualMap ^ t₀) := by
    apply LinearMap.ext
    intro x
    rw [dual_pow_apply]
    change φ (((T.restrict hC) ^ t₀) x) = 0
    rw [Module.End.pow_restrict]
    exact hvanish x x.property
  have hdim : Module.finrank K (Module.Dual K C) ≤ t := by
    simpa only [Subspace.dual_finrank_eq] using (Submodule.finrank_le C).trans ht
  have hψt : ψ ∈ LinearMap.ker (S.dualMap ^ t) := by
    rw [Module.End.ker_pow_eq_ker_pow_finrank_of_le hdim]
    exact Module.End.ker_pow_le_ker_pow_finrank S.dualMap t₀ hψ
  have hv : v ∈ C := Submodule.subset_span ⟨0, by simp⟩
  have heval := DFunLike.congr_fun (LinearMap.mem_ker.mp hψt) ⟨v, hv⟩
  rw [dual_pow_apply] at heval
  change φ (((T.restrict hC) ^ t) ⟨v, hv⟩) = 0 at heval
  rw [Module.End.pow_restrict] at heval
  exact heval

/-- The dimension-time form of the linear-algebra core of Proposition 5.4. -/
theorem apply_pow_finrank_eq_zero (T : Module.End K V) (v : V)
    (φ : Module.Dual K V) (h : ∃ t₀ : ℕ, ∀ t, t₀ ≤ t → φ ((T ^ t) v) = 0) :
    φ ((T ^ Module.finrank K V) v) = 0 :=
  apply_pow_eq_zero_of_eventually T v φ h _ le_rfl

end FindimCounterexample.RankObstruction
