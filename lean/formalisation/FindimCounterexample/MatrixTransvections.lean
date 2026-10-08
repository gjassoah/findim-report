/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import Mathlib.LinearAlgebra.Matrix.Transvection
import Mathlib.Algebra.CharP.Two
import Mathlib.GroupTheory.Commutator.Basic

/-!
# Elementary matrices for the finite quotients

Over a commutative ring of characteristic two, every off-diagonal transvection
is an involution. This file packages these matrices as units and proves their
addition, commutation, chain-commutator and diagonal-conjugation laws.
Inverses of diagonal entries always mean inverses of units of the ring.
-/

open scoped commutatorElement

namespace FindimCounterexample.MatrixTransvections

variable {n R : Type*} [Fintype n] [DecidableEq n] [CommRing R]

section CharacteristicTwo

variable [CharP R 2]

/-- An off-diagonal transvection, as an invertible matrix. -/
def e (i j : n) (hij : i ≠ j) (a : R) : (Matrix n n R)ˣ where
  val := Matrix.transvection i j a
  inv := Matrix.transvection i j a
  val_inv := by
    rw [Matrix.transvection_mul_transvection_same i j hij, CharTwo.add_self_eq_zero,
      Matrix.transvection_zero]
  inv_val := by
    rw [Matrix.transvection_mul_transvection_same i j hij, CharTwo.add_self_eq_zero,
      Matrix.transvection_zero]

/-- The underlying elementary matrix. -/
@[simp] theorem coe_e (i j : n) (hij : i ≠ j) (a : R) :
    (e i j hij a : Matrix n n R) = 1 + Matrix.single i j a := rfl

/-- Each transvection is its own inverse in characteristic two. -/
@[simp] theorem e_inv (i j : n) (hij : i ≠ j) (a : R) :
    (e i j hij a)⁻¹ = e i j hij a := by
  apply Units.ext
  rfl

/-- The zero parameter gives the identity. -/
@[simp] theorem e_zero (i j : n) (hij : i ≠ j) : e i j hij (0 : R) = 1 := by
  apply Units.ext
  exact Matrix.transvection_zero i j

/-- Products in one matrix position add the parameters. -/
theorem e_mul (i j : n) (hij : i ≠ j) (a b : R) :
    e i j hij a * e i j hij b = e i j hij (a + b) := by
  apply Units.ext
  exact Matrix.transvection_mul_transvection_same i j hij a b

/-- The square of an elementary transvection is the identity. -/
@[simp] theorem e_sq (i j : n) (hij : i ≠ j) (a : R) : e i j hij a ^ 2 = 1 := by
  rw [pow_two, e_mul, CharTwo.add_self_eq_zero, e_zero]

/-- The off-diagonal entry recovers the parameter. -/
@[simp] theorem e_apply_same (i j : n) (hij : i ≠ j) (a : R) :
    (e i j hij a : Matrix n n R) i j = a := by
  simp [hij]

/-- The parameter-to-transvection map is injective. -/
theorem e_injective (i j : n) (hij : i ≠ j) : Function.Injective (e i j hij : R → _) := by
  intro a b hab
  have h := congrArg (fun u : (Matrix n n R)ˣ => (u : Matrix n n R) i j) hab
  simpa only [e_apply_same] using h

/-- The parameter-to-transvection homomorphism, with additive parameters. -/
def eHom (i j : n) (hij : i ≠ j) : Multiplicative R →* (Matrix n n R)ˣ where
  toFun a := e i j hij a.toAdd
  map_one' := e_zero i j hij
  map_mul' a b := (e_mul i j hij a.toAdd b.toAdd).symm

/-- The homomorphism has the prescribed elementary matrices as its values. -/
@[simp] theorem eHom_apply (i j : n) (hij : i ≠ j) (a : Multiplicative R) :
    eHom i j hij a = e i j hij a.toAdd := rfl

/-- The elementary additive subgroup is a copy of the additive coefficient ring. -/
theorem eHom_injective (i j : n) (hij : i ≠ j) :
    Function.Injective (eHom i j hij : Multiplicative R → _) := by
  intro a b hab
  exact Multiplicative.toAdd.injective (e_injective i j hij hab)

/-- Transvections commute when both products of their matrix units vanish. -/
theorem e_commute (i j k l : n) (hij : i ≠ j) (hkl : k ≠ l)
    (hjk : j ≠ k) (hli : l ≠ i) (a b : R) :
    Commute (e i j hij a) (e k l hkl b) := by
  apply Units.ext
  simp [mul_add, add_mul, hjk, hli, add_comm, add_left_comm]

private theorem e_chain_mul (i j k : n) (hij : i ≠ j) (hjk : j ≠ k)
    (hik : i ≠ k) (a b : R) :
    e i j hij a * e j k hjk b = e i k hik (a * b) * e j k hjk b * e i j hij a := by
  apply Units.ext
  simp [mul_add, add_mul, hjk.symm, hik.symm, add_comm, add_left_comm, add_assoc]

/-- The chain commutator for three distinct matrix indices. -/
theorem e_commutator (i j k : n) (hij : i ≠ j) (hjk : j ≠ k)
    (hik : i ≠ k) (a b : R) :
    ⁅e i j hij a, e j k hjk b⁆ = e i k hik (a * b) := by
  rw [commutatorElement_def, e_chain_mul i j k hij hjk hik a b]
  simp only [mul_assoc, mul_inv_cancel, mul_one]

end CharacteristicTwo

/-- A diagonal matrix whose entries are specified units. -/
def diag (d : n → Rˣ) : (Matrix n n R)ˣ where
  val := Matrix.diagonal (fun i => (d i : R))
  inv := Matrix.diagonal (fun i => (((d i)⁻¹ : Rˣ) : R))
  val_inv := by
    rw [Matrix.diagonal_mul_diagonal]
    simp only [Units.mul_inv, Matrix.diagonal_one]
  inv_val := by
    rw [Matrix.diagonal_mul_diagonal]
    simp only [Units.inv_mul, Matrix.diagonal_one]

/-- The value of the diagonal matrix unit. -/
@[simp] theorem coe_diag (d : n → Rˣ) :
    (diag d : Matrix n n R) = Matrix.diagonal (fun i => (d i : R)) := rfl

/-- The inverse diagonal matrix uses inverses in the unit group. -/
@[simp] theorem coe_diag_inv (d : n → Rˣ) :
    (↑((diag d)⁻¹) : Matrix n n R) = Matrix.diagonal (fun i => (((d i)⁻¹ : Rˣ) : R)) := rfl

/-- Two diagonal units commute. -/
theorem diag_commute (d f : n → Rˣ) : Commute (diag d) (diag f) := by
  apply Units.ext
  exact (Matrix.commute_diagonal (fun i => (d i : R)) (fun i => (f i : R))).eq

private theorem diagonal_single_diagonal (d : n → Rˣ) (i j : n) (a : R) :
    Matrix.diagonal (fun k => (d k : R)) * Matrix.single i j a *
      Matrix.diagonal (fun k => (((d k)⁻¹ : Rˣ) : R)) =
        Matrix.single i j ((d i : R) * a * (((d j)⁻¹ : Rˣ) : R)) := by
  ext k l
  simp only [Matrix.mul_diagonal, Matrix.diagonal_mul]
  by_cases hi : i = k <;> by_cases hj : j = l <;> simp [Matrix.single, hi, hj]

variable [CharP R 2]

/-- Diagonal conjugation multiplies the coefficient by the row/column unit ratio. -/
theorem diag_conjugate_e (d : n → Rˣ) (i j : n) (hij : i ≠ j) (a : R) :
    diag d * e i j hij a * (diag d)⁻¹ =
      e i j hij ((d i : R) * a * (((d j)⁻¹ : Rˣ) : R)) := by
  apply Units.ext
  change (diag d : Matrix n n R) * (1 + Matrix.single i j a) *
    (↑((diag d)⁻¹) : Matrix n n R) = 1 + Matrix.single i j _
  rw [mul_add, mul_one, add_mul, Units.mul_inv]
  exact congrArg (1 + ·) (diagonal_single_diagonal d i j a)

end FindimCounterexample.MatrixTransvections
