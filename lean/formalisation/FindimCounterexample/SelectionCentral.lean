/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import FindimCounterexample.SelectionGroup
import FindimCounterexample.SelectionCommutator

/-!
# Central involutions in the selection group

This file formalises Proposition 5.11. The transfer calculation is instantiated
in the actual presented group; independence of the index and splitting then
allows each centrality calculation to use a suitable index.
-/

open scoped commutatorElement

namespace FindimCounterexample.SelectionGroup

/-- The transfer identity, with arbitrary integer parameters. -/
theorem commutator_transfer (i j : Index) (hij : i ≠ j) (a s b : ℤ) :
    ⁅U i a, V i (s + b)⁆ = ⁅U j (a + s), V j b⁆ := by
  apply SelectionCommutator.transfer (w := W ⟨(i, j), hij⟩ s)
  · exact uv i j hij a b
  · exact uw ⟨(i, j), hij⟩ a s
  · simpa only [add_comm b s] using wv_transfer ⟨(i, j), hij⟩ s b
  · exact (uv j i hij.symm (a + s) (s + b)).symm
  · exact vv i j hij (s + b) b

private theorem commutator_eq_of_ne (i j : Index) (hij : i ≠ j)
    (a b c d : ℤ) (h : a + b = c + d) :
    ⁅U i a, V i b⁆ = ⁅U j c, V j d⁆ := by
  have hb : c - a + d = b := by omega
  have hc : a + (c - a) = c := by omega
  simpa only [hb, hc] using commutator_transfer i j hij a (c - a) d

/-- Commutators at any two indices agree whenever the sums of parameters agree. -/
theorem commutator_eq_of_sum (i j : Index) (a b c d : ℤ) (h : a + b = c + d) :
    ⁅U i a, V i b⁆ = ⁅U j c, V j d⁆ := by
  by_cases hij : i = j
  · subst j
    obtain ⟨k, hk⟩ := exists_ne i
    exact (commutator_eq_of_ne i k hk.symm a b (a + b) 0 (by simp)).trans
      (commutator_eq_of_ne k i hk (a + b) 0 c d (by simpa using h))
  · exact commutator_eq_of_ne i j hij a b c d h

/-- The element z_N, defined using index zero and the splitting N + 0. -/
def z (N : ℤ) : G := ⁅U 0 N, V 0 0⁆

/-- Independence of the index and the splitting in the definition of z_N. -/
theorem commutator_eq_z (i : Index) (a b : ℤ) : ⁅U i a, V i b⁆ = z (a + b) :=
  commutator_eq_of_sum i 0 a b (a + b) 0 (by simp)

/-- Every splitting of N gives z_N. -/
theorem z_eq (N : ℤ) (i : Index) (a b : ℤ) (h : a + b = N) :
    z N = ⁅U i a, V i b⁆ := by
  rw [commutator_eq_z, h]

private theorem exists_third_index : ∀ i j : Index, ∃ k : Index, k ≠ i ∧ k ≠ j := by
  decide

/-- Each U generator commutes with z_N. -/
theorem u_commute_z (h : Index) (r N : ℤ) : Commute (U h r) (z N) := by
  obtain ⟨i, hi⟩ := exists_ne h
  rw [z_eq N i N 0 (by simp)]
  exact SelectionCommutator.commute_commutator
    (uu h i hi.symm r N) (uv h i hi.symm r 0)

/-- Each V generator commutes with z_N. -/
theorem v_commute_z (h : Index) (r N : ℤ) : Commute (V h r) (z N) := by
  obtain ⟨i, hi⟩ := exists_ne h
  rw [z_eq N i N 0 (by simp)]
  exact SelectionCommutator.commute_commutator
    (uv i h hi N r).symm (vv h i hi.symm r 0)

/-- Each W generator commutes with z_N. -/
theorem w_commute_z (ij : Pair) (r N : ℤ) : Commute (W ij r) (z N) := by
  obtain ⟨k, hki, hkj⟩ := exists_third_index ij.val.1 ij.val.2
  rw [z_eq N k N 0 (by simp)]
  exact SelectionCommutator.commute_commutator (wu ij k hki r N) (wv ij k hkj r 0)

/-- Conjugation by a torus generator preserves z_N. -/
theorem torus_conjugate_z (l : Index) (N : ℤ) : T l * z N * (T l)⁻¹ = z N := by
  calc
    T l * z N * (T l)⁻¹ =
        ⁅U 0 (N + step (.u 0) l), V 0 (0 + step (.v 0) l)⁆ := by
      rw [z, conjugate_commutatorElement, conjugation, conjugation]
    _ = z ((N + step (.u 0) l) + (0 + step (.v 0) l)) := commutator_eq_z _ _ _
    _ = z N := by simp [step, weight, add_assoc]

/-- Each torus generator commutes with z_N. -/
theorem torus_commute_z (l : Index) (N : ℤ) : Commute (T l) (z N) :=
  mul_inv_eq_iff_eq_mul.mp (torus_conjugate_z l N)

/-- All generators commute with z_N. -/
theorem generator_commute_z (g : Generator) (N : ℤ) :
    Commute (PresentedGroup.of g : G) (z N) := by
  cases g with
  | torus l => exact torus_commute_z l N
  | root s r =>
    cases s with
    | u i => exact u_commute_z i r N
    | v i => exact v_commute_z i r N
    | w ij => exact w_commute_z ij r N

/-- Proposition 5.11: z_N belongs to the centre of the presented group. -/
theorem z_mem_center (N : ℤ) : z N ∈ Subgroup.center G := by
  apply Subgroup.mem_center_iff.mpr
  intro g
  apply Subgroup.mem_centralizer_singleton_iff.mp
  apply PresentedGroup.generated_by relations (Subgroup.centralizer {z N})
  intro s
  exact Subgroup.mem_centralizer_singleton_iff.mpr (generator_commute_z s N)

/-- Proposition 5.11: z_N has square one. -/
theorem z_sq (N : ℤ) : z N ^ 2 = 1 :=
  SelectionCommutator.central_commutator_sq_eq_one (u_sq 0 N) (z_mem_center N)

end FindimCounterexample.SelectionGroup
