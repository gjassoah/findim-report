/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import FindimCounterexample.SelectionCentral

/-!
# The shift automorphisms of the selection group

Proposition 5.13: shifting only the U parameters respects exactly the defining
relations, and opposite shifts give inverse homomorphisms.
-/

open scoped commutatorElement

namespace FindimCounterexample.SelectionGroup

/-- The root-generator assignment for a shift by c. -/
def shifted (c : ℤ) : Root → ℤ → G
  | .u i, r => U i (r + c)
  | .v i, r => V i r
  | .w ij, r => W ij r

/-- The homomorphism obtained by shifting the U parameters. -/
def shiftHom (c : ℤ) : G →* G :=
  lift T (shifted c) torus_commute
    (by
      intro l a r
      cases a with
      | u i => simp only [shifted, conjugation, add_right_comm r c]
      | v i => exact conjugation l (.v i) r
      | w ij => exact conjugation l (.w ij) r)
    (fun i r => u_sq i (r + c))
    (fun i j h r q => uu i j h (r + c) (q + c))
    (fun i j h r q => vv i j h r q)
    (fun i j h r q => uv i j h (r + c) q)
    (fun ij h hh q r => wu ij h hh q (r + c))
    (fun ij h hh q r => wv ij h hh q r)
    (by
      intro ij r q
      simpa only [shifted, add_right_comm r c] using uw ij (r + c) q)
    (fun ij q r => wv_transfer ij q r)

@[simp]
theorem shiftHom_T (c : ℤ) (l : Index) : shiftHom c (T l) = T l := lift_T _ _ _ _ _ _ _ _ _ _ _ _ l

@[simp]
theorem shiftHom_U (c : ℤ) (i : Index) (r : ℤ) : shiftHom c (U i r) = U i (r + c) :=
  lift_S _ _ _ _ _ _ _ _ _ _ _ _ (.u i) r

@[simp]
theorem shiftHom_V (c : ℤ) (i : Index) (r : ℤ) : shiftHom c (V i r) = V i r :=
  lift_S _ _ _ _ _ _ _ _ _ _ _ _ (.v i) r

@[simp]
theorem shiftHom_W (c : ℤ) (ij : Pair) (r : ℤ) : shiftHom c (W ij r) = W ij r :=
  lift_S _ _ _ _ _ _ _ _ _ _ _ _ (.w ij) r

/-- Composition of shifts corresponds to addition of parameters. -/
theorem shiftHom_comp (c d : ℤ) : (shiftHom c).comp (shiftHom d) = shiftHom (c + d) := by
  apply hom_ext
  · intro l
    simp
  · intro a r
    cases a <;> simp [add_comm, add_left_comm]

/-- The zero shift is the identity. -/
theorem shiftHom_zero : shiftHom 0 = MonoidHom.id G := by
  apply hom_ext
  · intro l
    simp
  · intro a r
    cases a <;> simp

/-- The automorphism β_c of Proposition 5.13. -/
def beta (c : ℤ) : G ≃* G :=
  MonoidHom.toMulEquiv (shiftHom c) (shiftHom (-c))
    (by rw [shiftHom_comp, neg_add_cancel, shiftHom_zero])
    (by rw [shiftHom_comp, add_neg_cancel, shiftHom_zero])

@[simp]
theorem beta_apply (c : ℤ) (g : G) : beta c g = shiftHom c g := rfl

@[simp]
theorem beta_T (c : ℤ) (l : Index) : beta c (T l) = T l := shiftHom_T c l

@[simp]
theorem beta_U (c : ℤ) (i : Index) (r : ℤ) : beta c (U i r) = U i (r + c) :=
  shiftHom_U c i r

@[simp]
theorem beta_V (c : ℤ) (i : Index) (r : ℤ) : beta c (V i r) = V i r := shiftHom_V c i r

@[simp]
theorem beta_W (c : ℤ) (ij : Pair) (r : ℤ) : beta c (W ij r) = W ij r := shiftHom_W c ij r

/-- In functional order, β_c after β_d equals β_(c+d). -/
theorem beta_add (c d : ℤ) : (beta d).trans (beta c) = beta (c + d) := by
  apply MulEquiv.ext
  intro g
  exact DFunLike.congr_fun (shiftHom_comp c d) g

theorem beta_zero : beta 0 = MulEquiv.refl G := by
  apply MulEquiv.ext
  intro g
  change shiftHom 0 g = g
  exact DFunLike.congr_fun shiftHom_zero g

/-- Every shift translates the central involutions by its parameter. -/
theorem beta_z (c N : ℤ) : beta c (z N) = z (N + c) := by
  change shiftHom c (z N) = _
  rw [z, map_commutatorElement, shiftHom_U, shiftHom_V, commutator_eq_z, add_zero]

/-- The distinguished shift automorphism α_G. -/
def alpha : G ≃* G := beta 1

theorem alpha_z (N : ℤ) : alpha (z N) = z (N + 1) := beta_z 1 N

end FindimCounterexample.SelectionGroup
