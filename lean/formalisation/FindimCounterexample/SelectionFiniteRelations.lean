/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import FindimCounterexample.SelectionFiniteOrbits
import Mathlib.Tactic.FinCases

/-!
# All parameter relations in the finite presentation

The three commuting torus generators act on every root family by its integer
weight. Conjugating the zero-parameter relations by the vectors displayed
in Proposition 5.9 supplies all relations of the infinite presentation.
-/

open scoped commutatorElement

namespace FindimCounterexample.SelectionFinite

open SelectionGroup (Index Pair Root weight step)

/-- The ordered product representing an integer torus vector. -/
def torus (n : Index → ℤ) : P := T 0 ^ n 0 * T 1 ^ n 1 * T 2 ^ n 2

private theorem weight_coordinates (a : Root) (n : Index → ℤ) :
    weight a n = n 0 * step a 0 + n 1 * step a 1 + n 2 * step a 2 := by
  have hn : n = n 0 • Pi.single 0 (1 : ℤ) + n 1 • Pi.single 1 1 +
      n 2 • Pi.single 2 1 := by
    funext i
    fin_cases i <;> simp
  calc
    weight a n = weight a (n 0 • Pi.single 0 (1 : ℤ) + n 1 • Pi.single 1 1 +
        n 2 • Pi.single 2 1) := congrArg (weight a) hn
    _ = _ := by simp only [map_add, map_zsmul, step, zsmul_eq_mul, Int.cast_id]

/-- The full integer torus action on the root families. -/
theorem torus_conjugation (n : Index → ℤ) (a : Root) (r : ℤ) :
    torus n * family a r * (torus n)⁻¹ = family a (r + weight a n) := by
  simp only [torus, SelectionTorus.conjugate_mul]
  rw [SelectionTorus.conjugate_zpow_shift (T 2) (family a) (step a 2)
      (conjugation 2 a),
    SelectionTorus.conjugate_zpow_shift (T 1) (family a) (step a 1)
      (conjugation 1 a),
    SelectionTorus.conjugate_zpow_shift (T 0) (family a) (step a 0)
      (conjugation 0 a), weight_coordinates]
  congr 1
  omega

/-- Conjugating a zero-parameter root gives the root at its weight. -/
theorem torus_conjugate_root0 (n : Index → ℤ) (a : Root) :
    torus n * root0 a * (torus n)⁻¹ = family a (weight a n) := by
  rw [← family_zero a, torus_conjugation, zero_add]

private theorem commute_of_weights {a b : Root} (h : Commute (root0 a) (root0 b))
    (n : Index → ℤ) {r s : ℤ} (ha : weight a n = r) (hb : weight b n = s) :
    Commute (family a r) (family b s) := by
  apply commutatorElement_eq_one_iff_commute.mp
  have he := congrArg (fun x : P => torus n * x * (torus n)⁻¹) h.commutator_eq
  rw [conjugate_commutatorElement, torus_conjugate_root0, torus_conjugate_root0,
    ha, hb] at he
  simpa only [mul_one, mul_inv_cancel] using he

private theorem commutator_of_weights {a b c : Root}
    (h : ⁅root0 a, root0 b⁆ = root0 c) (n : Index → ℤ) {r s t : ℤ}
    (ha : weight a n = r) (hb : weight b n = s) (hc : weight c n = t) :
    ⁅family a r, family b s⁆ = family c t := by
  have he := congrArg (fun x : P => torus n * x * (torus n)⁻¹) h
  rwa [conjugate_commutatorElement, torus_conjugate_root0, torus_conjugate_root0,
    torus_conjugate_root0, ha, hb, hc] at he

/-- Every member of a U family is an involution. -/
theorem family_u_sq (i : Index) (r : ℤ) : family (.u i) r ^ 2 = 1 := by
  have h := congrArg (MulAut.conj (base (.u i) ^ r)) (u0_sq i)
  simpa only [map_pow, map_one, MulAut.conj_apply, family] using h

/-- The U/U relation follows using the vector -r e_i - s e_j. -/
theorem family_uu (i j : Index) (hij : i ≠ j) (r s : ℤ) :
    Commute (family (.u i) r) (family (.u j) s) := by
  apply commute_of_weights (uu0 i j hij) (Pi.single i (-r) + Pi.single j (-s))
  · simp_all [weight]
  · simp_all [weight]

/-- The V/V relation follows using the vector r e_i + s e_j. -/
theorem family_vv (i j : Index) (hij : i ≠ j) (r s : ℤ) :
    Commute (family (.v i) r) (family (.v j) s) := by
  apply commute_of_weights (vv0 i j hij) (Pi.single i r + Pi.single j s)
  · simp_all [weight]
  · simp_all [weight]

/-- The U/V relation follows using the vector -r e_i + s e_j. -/
theorem family_uv (i j : Index) (hij : i ≠ j) (r s : ℤ) :
    Commute (family (.u i) r) (family (.v j) s) := by
  apply commute_of_weights (uv0 i j hij) (Pi.single i (-r) + Pi.single j s)
  · simp_all [weight]
  · simp_all [weight]

/-- The W/U commuting relation uses the report's separate vectors for h=j
and for a third index h. -/
theorem family_wu (ij : Pair) (h : Index) (hh : h ≠ ij.val.1) (s r : ℤ) :
    Commute (family (.w ij) s) (family (.u h) r) := by
  have hij : ij.val.1 ≠ ij.val.2 := ij.property
  by_cases hj : h = ij.val.2
  · apply commute_of_weights (wu0 ij h hh)
      (Pi.single ij.val.1 (s - r) + Pi.single ij.val.2 (-r))
    · simp_all [weight]
    · simp_all [weight]
  · apply commute_of_weights (wu0 ij h hh)
      (Pi.single ij.val.1 s + Pi.single h (-r))
    · simp_all [weight]
    · simp_all [weight]

/-- The W/V commuting relation uses the report's separate vectors for h=i
and for a third index h. -/
theorem family_wv (ij : Pair) (h : Index) (hh : h ≠ ij.val.2) (s r : ℤ) :
    Commute (family (.w ij) s) (family (.v h) r) := by
  have hij : ij.val.1 ≠ ij.val.2 := ij.property
  by_cases hi : h = ij.val.1
  · apply commute_of_weights (wv0 ij h hh)
      (Pi.single ij.val.1 r + Pi.single ij.val.2 (r - s))
    · simp_all [weight]
    · simp_all [weight]
  · apply commute_of_weights (wv0 ij h hh)
      (Pi.single ij.val.1 s + Pi.single h r)
    · simp_all [weight]
    · simp_all [weight]

/-- The U/W chain relation uses -r e_i - (r+s) e_j. -/
theorem family_uw (ij : Pair) (r s : ℤ) :
    ⁅family (.u ij.val.1) r, family (.w ij) s⁆ = family (.u ij.val.2) (r + s) := by
  have hij : ij.val.1 ≠ ij.val.2 := ij.property
  apply commutator_of_weights (uw0 ij)
    (Pi.single ij.val.1 (-r) + Pi.single ij.val.2 (-(r + s)))
  · simp_all [weight]
  · simp_all [weight]
  · simp_all [weight]

/-- The W/V chain relation uses (r+s) e_i + r e_j. -/
theorem family_wv_transfer (ij : Pair) (s r : ℤ) :
    ⁅family (.w ij) s, family (.v ij.val.2) r⁆ = family (.v ij.val.1) (r + s) := by
  have hij : ij.val.1 ≠ ij.val.2 := ij.property
  apply commutator_of_weights (wv_transfer0 ij)
    (Pi.single ij.val.1 (r + s) + Pi.single ij.val.2 r)
  · simp_all [weight]
  · simp_all [weight]
  · simp_all [weight]

/-- The homomorphism from the infinite presentation to the finite one. -/
def fromG : SelectionGroup.G →* P :=
  SelectionGroup.lift T family torus_commute conjugation family_u_sq
    family_uu family_vv family_uv family_wu family_wv family_uw family_wv_transfer

@[simp] theorem fromG_T (l : Index) : fromG (SelectionGroup.T l) = T l :=
  SelectionGroup.lift_T _ _ _ _ _ _ _ _ _ _ _ _ l

@[simp] theorem fromG_S (a : Root) (r : ℤ) : fromG (SelectionGroup.S a r) = family a r :=
  SelectionGroup.lift_S _ _ _ _ _ _ _ _ _ _ _ _ a r

end FindimCounterexample.SelectionFinite
