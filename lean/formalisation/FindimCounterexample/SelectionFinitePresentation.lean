/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import FindimCounterexample.SelectionGroup
import Mathlib.Data.Fintype.Sigma
import Mathlib.Data.Set.Finite.Range

/-!
# The finite presentation of the selection group

The generators and relators are exactly those of Proposition 5.9. The finite
relator index type records the zero-parameter root relations and the torus
kernel relations. The equivalence with the infinite presentation is constructed
in the subsequent files.
-/

open scoped commutatorElement

namespace FindimCounterexample.SelectionFinite

open SelectionGroup (Index Pair Root)

/-- The fifteen generators: three torus generators and twelve root generators. -/
abbrev Generator := Index ⊕ Root

theorem card_generator : Fintype.card Generator = 15 := by decide

namespace Word

abbrev T (i : Index) : FreeGroup Generator := FreeGroup.of (.inl i)
abbrev root0 (a : Root) : FreeGroup Generator := FreeGroup.of (.inr a)
abbrev U0 (i : Index) := root0 (.u i)
abbrev V0 (i : Index) := root0 (.v i)
abbrev W0 (ij : Pair) := root0 (.w ij)

end Word

/-- A finite index set for precisely the relators in Proposition 5.9. -/
inductive RelatorIndex where
  | torus (i j : Index)
  | involution (i : Index)
  | uu (ij : Pair)
  | vv (ij : Pair)
  | uv (ij : Pair)
  | wu (ij : Pair) (h : {k : Index // k ≠ ij.val.1})
  | wv (ij : Pair) (h : {k : Index // k ≠ ij.val.2})
  | uw (ij : Pair)
  | wv_transfer (ij : Pair)
  | torus_u (hi : Pair)
  | torus_v (hi : Pair)
  | torus_w_pair (ij : Pair)
  | torus_w_third (ij : Pair) (k : {k : Index // k ≠ ij.val.1 ∧ k ≠ ij.val.2})
  deriving Fintype

open Word in
/-- The finite relator words. No parameterised root relations are added. -/
def relationWord : RelatorIndex → FreeGroup Generator
  | .torus i j => ⁅T i, T j⁆
  | .involution i => U0 i ^ 2
  | .uu ij => ⁅U0 ij.val.1, U0 ij.val.2⁆
  | .vv ij => ⁅V0 ij.val.1, V0 ij.val.2⁆
  | .uv ij => ⁅U0 ij.val.1, V0 ij.val.2⁆
  | .wu ij h => ⁅W0 ij, U0 h.val⁆
  | .wv ij h => ⁅W0 ij, V0 h.val⁆
  | .uw ij => ⁅U0 ij.val.1, W0 ij⁆ * (U0 ij.val.2)⁻¹
  | .wv_transfer ij => ⁅W0 ij, V0 ij.val.2⁆ * (V0 ij.val.1)⁻¹
  | .torus_u hi => ⁅T hi.val.1, U0 hi.val.2⁆
  | .torus_v hi => ⁅T hi.val.1, V0 hi.val.2⁆
  | .torus_w_pair ij => ⁅T ij.val.1 * T ij.val.2, W0 ij⁆
  | .torus_w_third ij k => ⁅T k.val, W0 ij⁆

/-- The finite relation set of Proposition 5.9. -/
def relations : Set (FreeGroup Generator) := Set.range relationWord

theorem relations_finite : relations.Finite := Set.finite_range relationWord

/-- The group P with the stated finite presentation. -/
abbrev P := PresentedGroup relations

/-- The torus generators of P. -/
def T (i : Index) : P := PresentedGroup.of (.inl i)

/-- The root generators of P, at parameter zero. -/
def root0 (a : Root) : P := PresentedGroup.of (.inr a)

abbrev U0 (i : Index) := root0 (.u i)
abbrev V0 (i : Index) := root0 (.v i)
abbrev W0 (ij : Pair) := root0 (.w ij)

private theorem relator_eq_one (r : RelatorIndex) :
    PresentedGroup.mk relations (relationWord r) = 1 :=
  PresentedGroup.one_of_mem ⟨r, rfl⟩

theorem torus_commute (i j : Index) : Commute (T i) (T j) := by
  apply commutatorElement_eq_one_iff_commute.mp
  exact (map_commutatorElement _ _ _).symm.trans (relator_eq_one (.torus i j))

theorem u0_sq (i : Index) : U0 i ^ 2 = 1 :=
  (map_pow _ _ _).symm.trans (relator_eq_one (.involution i))

theorem uu0 (i j : Index) (hij : i ≠ j) : Commute (U0 i) (U0 j) := by
  apply commutatorElement_eq_one_iff_commute.mp
  exact (map_commutatorElement _ _ _).symm.trans (relator_eq_one (.uu ⟨(i, j), hij⟩))

theorem vv0 (i j : Index) (hij : i ≠ j) : Commute (V0 i) (V0 j) := by
  apply commutatorElement_eq_one_iff_commute.mp
  exact (map_commutatorElement _ _ _).symm.trans (relator_eq_one (.vv ⟨(i, j), hij⟩))

theorem uv0 (i j : Index) (hij : i ≠ j) : Commute (U0 i) (V0 j) := by
  apply commutatorElement_eq_one_iff_commute.mp
  exact (map_commutatorElement _ _ _).symm.trans (relator_eq_one (.uv ⟨(i, j), hij⟩))

theorem wu0 (ij : Pair) (h : Index) (hh : h ≠ ij.val.1) : Commute (W0 ij) (U0 h) := by
  apply commutatorElement_eq_one_iff_commute.mp
  exact (map_commutatorElement _ _ _).symm.trans (relator_eq_one (.wu ij ⟨h, hh⟩))

theorem wv0 (ij : Pair) (h : Index) (hh : h ≠ ij.val.2) : Commute (W0 ij) (V0 h) := by
  apply commutatorElement_eq_one_iff_commute.mp
  exact (map_commutatorElement _ _ _).symm.trans (relator_eq_one (.wv ij ⟨h, hh⟩))

theorem uw0 (ij : Pair) : ⁅U0 ij.val.1, W0 ij⁆ = U0 ij.val.2 := by
  have h := relator_eq_one (.uw ij)
  simpa only [relationWord, map_mul, map_inv, map_commutatorElement,
    mul_inv_eq_one, PresentedGroup.of, root0] using h

theorem wv_transfer0 (ij : Pair) : ⁅W0 ij, V0 ij.val.2⁆ = V0 ij.val.1 := by
  have h := relator_eq_one (.wv_transfer ij)
  simpa only [relationWord, map_mul, map_inv, map_commutatorElement,
    mul_inv_eq_one, PresentedGroup.of, root0] using h

theorem torus_u0 (h i : Index) (hi : h ≠ i) : Commute (T h) (U0 i) := by
  apply commutatorElement_eq_one_iff_commute.mp
  exact (map_commutatorElement _ _ _).symm.trans (relator_eq_one (.torus_u ⟨(h, i), hi⟩))

theorem torus_v0 (h i : Index) (hi : h ≠ i) : Commute (T h) (V0 i) := by
  apply commutatorElement_eq_one_iff_commute.mp
  exact (map_commutatorElement _ _ _).symm.trans (relator_eq_one (.torus_v ⟨(h, i), hi⟩))

theorem torus_w_pair (ij : Pair) : Commute (T ij.val.1 * T ij.val.2) (W0 ij) := by
  apply commutatorElement_eq_one_iff_commute.mp
  have h := relator_eq_one (.torus_w_pair ij)
  simpa only [relationWord, map_commutatorElement, map_mul, PresentedGroup.of, T, root0] using h

theorem torus_w_third (ij : Pair) (k : Index) (hki : k ≠ ij.val.1) (hkj : k ≠ ij.val.2) :
    Commute (T k) (W0 ij) := by
  apply commutatorElement_eq_one_iff_commute.mp
  exact (map_commutatorElement _ _ _).symm.trans
    (relator_eq_one (.torus_w_third ij ⟨k, hki, hkj⟩))

/-- Maps out of P agree when they agree on the fifteen named generators. -/
theorem hom_ext {H : Type*} [Group H] {f g : P →* H}
    (ht : ∀ i, f (T i) = g (T i)) (hr : ∀ a, f (root0 a) = g (root0 a)) : f = g := by
  apply PresentedGroup.ext
  intro a
  cases a with
  | inl i => exact ht i
  | inr a => exact hr a

end FindimCounterexample.SelectionFinite
