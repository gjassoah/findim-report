/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import FindimCounterexample.FiniteQuotientRing
import FindimCounterexample.MatrixTransvections
import FindimCounterexample.SelectionCentral

/-!
# Matrix quotients of the selection group

The matrices in Proposition 5.14 are units of matrices over the actual
quotient ring, including nonreduced quotients. Report matrix indices 1 and 5
are `0` and `4 : Fin 5`; an interior index is shifted up by one.
-/

noncomputable section

open scoped commutatorElement

namespace FindimCounterexample.FiniteQuotients

open SelectionGroup

/-- The matrix unit group, definitionally the general linear group. -/
abbrev MatGroup (m : ℕ) := (Matrix (Fin 5) (Fin 5) (FiniteQuotientRing.S m))ˣ

/-- Embed an interior index into the five matrix positions. -/
def middle (i : Index) : Fin 5 := ⟨i.val + 1, by omega⟩

@[simp]
theorem middle_inj (i j : Index) : middle i = middle j ↔ i = j := by
  simp [middle, Fin.ext_iff]

@[simp]
theorem middle_ne_zero (i : Index) : middle i ≠ 0 := by
  intro h
  have := congrArg Fin.val h
  simp [middle] at this

@[simp]
theorem zero_ne_middle (i : Index) : (0 : Fin 5) ≠ middle i := (middle_ne_zero i).symm

@[simp]
theorem middle_ne_four (i : Index) : middle i ≠ 4 := by
  intro h
  have := congrArg Fin.val h
  have := i.isLt
  simp only [middle] at *
  omega

@[simp]
theorem four_ne_middle (i : Index) : (4 : Fin 5) ≠ middle i := (middle_ne_four i).symm

/-- The row of the matrix unit attached to a root. -/
def row : Root → Fin 5
  | .u _ => 0
  | .v i => middle i
  | .w ij => middle ij.val.1

/-- The column of the matrix unit attached to a root. -/
def col : Root → Fin 5
  | .u i => middle i
  | .v _ => 4
  | .w ij => middle ij.val.2

theorem row_ne_col (a : Root) : row a ≠ col a := by
  cases a with
  | u i => exact zero_ne_middle i
  | v i => exact middle_ne_four i
  | w ij => exact fun h => ij.property ((middle_inj _ _).mp h)

variable (m : ℕ) (hm : 0 < m)

/-- The diagonal entries of the image of T_l, as units. -/
def diagonalEntry (l : Index) (k : Fin 5) : (FiniteQuotientRing.S m)ˣ :=
  if k = middle l then FiniteQuotientRing.t m hm else 1

/-- The image of a torus generator. -/
def D (l : Index) : MatGroup m := MatrixTransvections.diag (diagonalEntry m hm l)

/-- The image of a root generator with any integer parameter. -/
def rootImage (a : Root) (r : ℤ) : MatGroup m :=
  MatrixTransvections.e (row a) (col a) (row_ne_col a) (FiniteQuotientRing.tPow m hm r)

theorem diagonal_ratio (l : Index) (a : Root) :
    diagonalEntry m hm l (row a) * (diagonalEntry m hm l (col a))⁻¹ =
      FiniteQuotientRing.t m hm ^ step a l := by
  cases a with
  | u i =>
    by_cases hi : i = l <;>
      simp_all [diagonalEntry, row, col, step, weight]
  | v i =>
    by_cases hi : i = l <;>
      simp_all [diagonalEntry, row, col, step, weight]
  | w ij =>
    by_cases hi : ij.val.1 = l <;> by_cases hj : ij.val.2 = l <;>
      simp_all [diagonalEntry, row, col, step, weight]

theorem D_commute (l k : Index) : Commute (D m hm l) (D m hm k) :=
  MatrixTransvections.diag_commute _ _

theorem D_conjugate (l : Index) (a : Root) (r : ℤ) :
    D m hm l * rootImage m hm a r * (D m hm l)⁻¹ =
      rootImage m hm a (r + step a l) := by
  rw [D, rootImage, MatrixTransvections.diag_conjugate_e]
  apply congrArg (MatrixTransvections.e (row a) (col a) (row_ne_col a))
  rw [FiniteQuotientRing.tPow_add]
  have h := congrArg (fun x : (FiniteQuotientRing.S m)ˣ => (x : FiniteQuotientRing.S m))
    (diagonal_ratio m hm l a)
  change _ * _ = _ at h
  calc
    _ = FiniteQuotientRing.tPow m hm r *
        ((diagonalEntry m hm l (row a) : FiniteQuotientRing.S m) *
          ((diagonalEntry m hm l (col a))⁻¹ : (FiniteQuotientRing.S m)ˣ)) := by ring
    _ = _ := congrArg (FiniteQuotientRing.tPow m hm r * ·) h

theorem root_u_sq (i : Index) (r : ℤ) : rootImage m hm (.u i) r ^ 2 = 1 :=
  MatrixTransvections.e_sq _ _ _ _

theorem root_uu (i j : Index) (r s : ℤ) :
    Commute (rootImage m hm (.u i) r) (rootImage m hm (.u j) s) :=
  MatrixTransvections.e_commute _ _ _ _ _ _ (middle_ne_zero i) (middle_ne_zero j) _ _

theorem root_vv (i j : Index) (r s : ℤ) :
    Commute (rootImage m hm (.v i) r) (rootImage m hm (.v j) s) :=
  MatrixTransvections.e_commute _ _ _ _ _ _ (four_ne_middle j) (four_ne_middle i) _ _

theorem root_uv (i j : Index) (hij : i ≠ j) (r s : ℤ) :
    Commute (rootImage m hm (.u i) r) (rootImage m hm (.v j) s) :=
  MatrixTransvections.e_commute _ _ _ _ _ _
    (fun h => hij ((middle_inj _ _).mp h)) (by change (4 : Fin 5) ≠ 0; decide) _ _

theorem root_wu (ij : Pair) (h : Index) (hh : h ≠ ij.val.1) (s r : ℤ) :
    Commute (rootImage m hm (.w ij) s) (rootImage m hm (.u h) r) :=
  MatrixTransvections.e_commute _ _ _ _ _ _ (middle_ne_zero ij.val.2)
    (fun e => hh ((middle_inj _ _).mp e)) _ _

theorem root_wv (ij : Pair) (h : Index) (hh : h ≠ ij.val.2) (s r : ℤ) :
    Commute (rootImage m hm (.w ij) s) (rootImage m hm (.v h) r) :=
  MatrixTransvections.e_commute _ _ _ _ _ _
    (fun e => hh ((middle_inj _ _).mp e.symm)) (four_ne_middle ij.val.1) _ _

theorem root_uw (ij : Pair) (r s : ℤ) :
    ⁅rootImage m hm (.u ij.val.1) r, rootImage m hm (.w ij) s⁆ =
      rootImage m hm (.u ij.val.2) (r + s) := by
  simp only [rootImage, row, col]
  rw [MatrixTransvections.e_commutator _ _ _ _ _ (zero_ne_middle ij.val.2)]
  exact congrArg (MatrixTransvections.e _ _ _) (FiniteQuotientRing.tPow_add m hm r s).symm

theorem root_wv_transfer (ij : Pair) (s r : ℤ) :
    ⁅rootImage m hm (.w ij) s, rootImage m hm (.v ij.val.2) r⁆ =
      rootImage m hm (.v ij.val.1) (r + s) := by
  simp only [rootImage, row, col]
  rw [MatrixTransvections.e_commutator _ _ _ _ _ (middle_ne_four ij.val.1)]
  exact congrArg (MatrixTransvections.e _ _ _)
    ((mul_comm _ _).trans (FiniteQuotientRing.tPow_add m hm r s).symm)

/-- Proposition 5.14: the homomorphism defined by the specified matrices. -/
def pi : G →* MatGroup m :=
  lift (D m hm) (rootImage m hm) (D_commute m hm) (D_conjugate m hm)
    (root_u_sq m hm) (fun i j _ => root_uu m hm i j)
    (fun i j _ => root_vv m hm i j) (root_uv m hm) (root_wu m hm)
    (root_wv m hm) (root_uw m hm) (root_wv_transfer m hm)

@[simp]
theorem pi_T (l : Index) : pi m hm (T l) = D m hm l := lift_T _ _ _ _ _ _ _ _ _ _ _ _ l

@[simp]
theorem pi_S (a : Root) (r : ℤ) : pi m hm (S a r) = rootImage m hm a r :=
  lift_S _ _ _ _ _ _ _ _ _ _ _ _ a r

/-- The image of z_N is the transvection in the top right corner. -/
theorem pi_z (N : ℤ) : pi m hm (z N) =
    MatrixTransvections.e 0 4 (by decide) (FiniteQuotientRing.tPow m hm N) := by
  rw [z, map_commutatorElement, pi_S, pi_S]
  simp only [rootImage, row, col]
  rw [MatrixTransvections.e_commutator _ _ _ _ _ (by decide)]
  simp

/-- The displayed image of T_l in Proposition 5.14. -/
theorem pi_T_matrix (l : Index) :
    (pi m hm (T l) : Matrix (Fin 5) (Fin 5) (FiniteQuotientRing.S m)) =
      Matrix.diagonal (fun k => (diagonalEntry m hm l k : FiniteQuotientRing.S m)) := by
  rw [pi_T]
  rfl

/-- The displayed image of U_i(r). -/
theorem pi_U_matrix (i : Index) (r : ℤ) :
    (pi m hm (U i r) : Matrix (Fin 5) (Fin 5) (FiniteQuotientRing.S m)) =
      1 + Matrix.single 0 (middle i) (FiniteQuotientRing.tPow m hm r) := by
  rw [pi_S]
  rfl

/-- The displayed image of V_i(r). -/
theorem pi_V_matrix (i : Index) (r : ℤ) :
    (pi m hm (V i r) : Matrix (Fin 5) (Fin 5) (FiniteQuotientRing.S m)) =
      1 + Matrix.single (middle i) 4 (FiniteQuotientRing.tPow m hm r) := by
  rw [pi_S]
  rfl

/-- The displayed image of W_ij(r). -/
theorem pi_W_matrix (ij : Pair) (r : ℤ) :
    (pi m hm (W ij r) : Matrix (Fin 5) (Fin 5) (FiniteQuotientRing.S m)) =
      1 + Matrix.single (middle ij.val.1) (middle ij.val.2)
        (FiniteQuotientRing.tPow m hm r) := by
  rw [pi_S]
  rfl

/-- The displayed top-right matrix formula for z_N. -/
theorem pi_z_matrix (N : ℤ) :
    (pi m hm (z N) : Matrix (Fin 5) (Fin 5) (FiniteQuotientRing.S m)) =
      1 + Matrix.single 0 4 (FiniteQuotientRing.tPow m hm N) := by
  rw [pi_z]
  rfl

/-- The actual image subgroup F_m. -/
def F : Subgroup (MatGroup m) := (pi m hm).range

/-- The image is finite because the monic quotient ring is finite. -/
theorem finite_F : Finite (F m hm) := by
  have := FiniteQuotientRing.finite m hm
  infer_instance

end FindimCounterexample.FiniteQuotients
