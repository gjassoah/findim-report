/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.Data.ZMod.Basic
import Mathlib.Algebra.CharP.Algebra

/-!
# The coefficient rings of the finite quotients

For each positive `m`, the quotient of `𝔽₂[X]` by `X ^ m - 1` has the
power basis of length `m`. The image of `X` is a unit. Only monic division
is used; no irreducibility or squarefreeness assumption is made.
-/

open Polynomial

namespace FindimCounterexample.FiniteQuotientRing

noncomputable section

/-- The defining polynomial of the cyclic coefficient ring. -/
def polynomial (m : ℕ) : Polynomial (ZMod 2) := X ^ m - 1

/-- The ring `𝔽₂[t]/(t ^ m - 1)` of Proposition 5.14. -/
abbrev S (m : ℕ) := AdjoinRoot (polynomial m)

/-- The residue class of the polynomial variable. -/
def root (m : ℕ) : S m := AdjoinRoot.root (polynomial m)

/-- Evaluation at one shows that the coefficient quotient is nontrivial. -/
instance (m : ℕ) : Nontrivial (S m) :=
  (AdjoinRoot.lift (RingHom.id (ZMod 2)) 1 (by simp [polynomial])).domain_nontrivial

instance (m : ℕ) : CharP (S m) 2 :=
  charP_of_injective_ringHom (f := AdjoinRoot.of (polynomial m)) (by
    intro a b hab
    have h := congrArg
      (AdjoinRoot.lift (RingHom.id (ZMod 2)) 1 (by simp [polynomial])) hab
    simpa only [AdjoinRoot.lift_of, RingHom.id_apply] using h) 2

theorem monic (m : ℕ) (hm : 0 < m) : (polynomial m).Monic := by
  simpa only [polynomial, map_one] using
    (Polynomial.monic_X_pow_sub_C (1 : ZMod 2) hm.ne')

@[simp]
theorem natDegree (m : ℕ) : (polynomial m).natDegree = m := by
  simpa only [polynomial, map_one] using
    (Polynomial.natDegree_X_pow_sub_C (n := m) (r := (1 : ZMod 2)))

/-- The monic power basis, indexed by the report's exponents `0,...,m-1`. -/
noncomputable def basis (m : ℕ) (hm : 0 < m) :
    Module.Basis (Fin m) (ZMod 2) (S m) :=
  (AdjoinRoot.powerBasis' (monic m hm)).basis.reindex (finCongr (natDegree m))

@[simp]
theorem basis_apply (m : ℕ) (hm : 0 < m) (i : Fin m) :
    basis m hm i = root m ^ i.val := by
  rw [basis, Module.Basis.reindex_apply, (AdjoinRoot.powerBasis' (monic m hm)).basis_eq_pow]
  rfl

/-- In particular, the quotient ring is finite for every positive modulus. -/
theorem finite (m : ℕ) (hm : 0 < m) : Finite (S m) := by
  let := Module.fintypeOfFintype (basis m hm)
  infer_instance

@[simp]
theorem root_pow (m : ℕ) : root m ^ m = 1 := by
  have h := AdjoinRoot.mk_self (f := polynomial m)
  change AdjoinRoot.mk (polynomial m) (X ^ m - 1) = 0 at h
  rw [map_sub, map_pow, map_one, AdjoinRoot.mk_X, sub_eq_zero] at h
  exact h

/-- The unit represented by `t`, with the explicit inverse `t ^ (m-1)`. -/
noncomputable def t (m : ℕ) (hm : 0 < m) : (S m)ˣ where
  val := root m
  inv := root m ^ (m - 1)
  val_inv := by rw [← pow_succ', Nat.sub_add_cancel hm, root_pow]
  inv_val := by rw [← pow_succ, Nat.sub_add_cancel hm, root_pow]

@[simp]
theorem t_val (m : ℕ) (hm : 0 < m) : (t m hm : S m) = root m := rfl

@[simp]
theorem t_inv_val (m : ℕ) (hm : 0 < m) :
    ((t m hm)⁻¹ : (S m)ˣ).val = root m ^ (m - 1) := rfl

@[simp]
theorem t_pow (m : ℕ) (hm : 0 < m) : t m hm ^ m = 1 := by
  apply Units.ext
  exact root_pow m

/-- Integer powers are taken in the unit group before coercion to the ring. -/
noncomputable def tPow (m : ℕ) (hm : 0 < m) (r : ℤ) : S m :=
  ↑(t m hm ^ r)

@[simp]
theorem tPow_zero (m : ℕ) (hm : 0 < m) : tPow m hm 0 = 1 := by
  simp [tPow]

theorem tPow_add (m : ℕ) (hm : 0 < m) (r s : ℤ) :
    tPow m hm (r + s) = tPow m hm r * tPow m hm s := by
  simp only [tPow, zpow_add, Units.val_mul]

@[simp]
theorem tPow_natCast (m : ℕ) (hm : 0 < m) (n : ℕ) :
    tPow m hm (n : ℤ) = root m ^ n := by
  simp [tPow]

@[simp]
theorem tPow_one (m : ℕ) (hm : 0 < m) : tPow m hm 1 = root m := by
  simpa using tPow_natCast m hm 1

theorem tPow_mul_neg (m : ℕ) (hm : 0 < m) (r : ℤ) :
    tPow m hm r * tPow m hm (-r) = 1 := by
  rw [← tPow_add, add_neg_cancel, tPow_zero]

theorem tPow_periodic (m : ℕ) (hm : 0 < m) (r : ℤ) :
    tPow m hm (r + m) = tPow m hm r := by
  rw [tPow_add, tPow_natCast, root_pow, mul_one]

theorem basis_eq_tPow (m : ℕ) (hm : 0 < m) (i : Fin m) :
    basis m hm i = tPow m hm (i.val : ℤ) := by
  rw [basis_apply, tPow_natCast]

theorem isUnit_tPow (m : ℕ) (hm : 0 < m) (r : ℤ) : IsUnit (tPow m hm r) :=
  (t m hm ^ r).isUnit

theorem linearIndependent_tPow (m : ℕ) (hm : 0 < m) :
    LinearIndependent (ZMod 2) (fun i : Fin m => tPow m hm (i.val : ℤ)) := by
  simpa only [← basis_eq_tPow] using (basis m hm).linearIndependent

/-- Finite coefficient vectors are identified with the quotient ring by the power basis. -/
noncomputable def linearCombination (m : ℕ) (hm : 0 < m) :
    (Fin m → ZMod 2) ≃ₗ[ZMod 2] S m := (basis m hm).equivFun.symm

theorem linearCombination_apply (m : ℕ) (hm : 0 < m) (c : Fin m → ZMod 2) :
    linearCombination m hm c = ∑ i : Fin m, c i • tPow m hm (i.val : ℤ) := by
  simp only [linearCombination, Module.Basis.equivFun_symm_apply, basis_eq_tPow]

@[simp]
theorem linearCombination_single (m : ℕ) (hm : 0 < m) (i : Fin m) :
    linearCombination m hm (Pi.single i 1) = tPow m hm (i.val : ℤ) := by
  simp [linearCombination_apply, Pi.single_apply]

/-- No nontrivial coefficient relation exists among the first `m` powers. -/
theorem sum_pow_eq_zero (m : ℕ) (hm : 0 < m) (c : Fin m → ZMod 2) :
    (∑ i : Fin m, c i • tPow m hm (i.val : ℤ)) = 0 ↔ ∀ i, c i = 0 := by
  rw [← linearCombination_apply, (linearCombination m hm).map_eq_zero_iff]
  exact funext_iff

theorem sum_pow_injective (m : ℕ) (hm : 0 < m) :
    Function.Injective (fun c : Fin m → ZMod 2 =>
      ∑ i : Fin m, c i • tPow m hm (i.val : ℤ)) := by
  simpa only [← linearCombination_apply] using (linearCombination m hm).injective

end

end FindimCounterexample.FiniteQuotientRing
