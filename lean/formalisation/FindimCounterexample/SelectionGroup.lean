/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import Mathlib.GroupTheory.PresentedGroup
import Mathlib.GroupTheory.Commutator.Basic
import Mathlib.Data.Fintype.Prod
import Mathlib.Data.Fintype.Sum
import Mathlib.Tactic.DeriveFintype

/-!
# The selection group

Definition 5.6 of the report. Indices `0,1,2 : Fin 3` represent the report's
`1,2,3`. The relation predicate below lists exactly the defining relations;
in particular there are no same-type or W/W commutation relations.
Mathlib's commutator convention is the report's `x * y * x⁻¹ * y⁻¹`.
-/

open scoped commutatorElement

namespace FindimCounterexample.SelectionGroup

/-- The three interior indices. -/
abbrev Index := Fin 3

/-- The six ordered pairs of distinct indices. -/
abbrev Pair := {p : Index × Index // p.1 ≠ p.2}

/-- The twelve root types. -/
inductive Root where
  | u (i : Index)
  | v (i : Index)
  | w (ij : Pair)
  deriving DecidableEq, Fintype

/-- The weight homomorphism of a root type. -/
def weight : Root → (Index → ℤ) →+ ℤ
  | .u i => -(Pi.evalAddMonoidHom (fun _ : Index => ℤ) i)
  | .v i => Pi.evalAddMonoidHom (fun _ : Index => ℤ) i
  | .w ij => Pi.evalAddMonoidHom (fun _ : Index => ℤ) ij.val.1 -
      Pi.evalAddMonoidHom (fun _ : Index => ℤ) ij.val.2

/-- The value of a weight on the indicated standard basis vector. -/
def step (s : Root) (l : Index) : ℤ := weight s (Pi.single l 1)

/-- The generators of the infinite presentation. -/
inductive Generator where
  | torus (l : Index)
  | root (s : Root) (r : ℤ)
  deriving DecidableEq

namespace Word

/-- Torus letters in the free group. -/
abbrev T (l : Index) : FreeGroup Generator := FreeGroup.of (.torus l)

/-- Root letters in the free group. -/
abbrev S (s : Root) (r : ℤ) : FreeGroup Generator := FreeGroup.of (.root s r)

abbrev U (i : Index) (r : ℤ) := S (.u i) r
abbrev V (i : Index) (r : ℤ) := S (.v i) r
abbrev W (ij : Pair) (r : ℤ) := S (.w ij) r

end Word

open Word in
/-- Exactly the relators of Definition 5.6, expressed as words equal to one. -/
inductive Relator : FreeGroup Generator → Prop where
  | torus (l k : Index) : Relator ⁅T l, T k⁆
  | conjugation (l : Index) (s : Root) (r : ℤ) :
      Relator (T l * S s r * (T l)⁻¹ * (S s (r + step s l))⁻¹)
  | involution (i : Index) (r : ℤ) : Relator (U i r ^ 2)
  | uu (i j : Index) (h : i ≠ j) (r s : ℤ) : Relator ⁅U i r, U j s⁆
  | vv (i j : Index) (h : i ≠ j) (r s : ℤ) : Relator ⁅V i r, V j s⁆
  | uv (i j : Index) (h : i ≠ j) (r s : ℤ) : Relator ⁅U i r, V j s⁆
  | wu (ij : Pair) (h : Index) (hh : h ≠ ij.val.1) (s r : ℤ) :
      Relator ⁅W ij s, U h r⁆
  | wv (ij : Pair) (h : Index) (hh : h ≠ ij.val.2) (s r : ℤ) :
      Relator ⁅W ij s, V h r⁆
  | uw (ij : Pair) (r s : ℤ) :
      Relator (⁅U ij.val.1 r, W ij s⁆ * (U ij.val.2 (r + s))⁻¹)
  | wv_transfer (ij : Pair) (s r : ℤ) :
      Relator (⁅W ij s, V ij.val.2 r⁆ * (V ij.val.1 (r + s))⁻¹)

/-- The defining relation set, without additional relations. -/
def relations : Set (FreeGroup Generator) := {w | Relator w}

/-- The group of Definition 5.6. -/
abbrev G := PresentedGroup relations

/-- The torus generators in the presented group. -/
def T (l : Index) : G := PresentedGroup.of (.torus l)

/-- The root generators in the presented group. -/
def S (s : Root) (r : ℤ) : G := PresentedGroup.of (.root s r)

abbrev U (i : Index) (r : ℤ) := S (.u i) r
abbrev V (i : Index) (r : ℤ) := S (.v i) r
abbrev W (ij : Pair) (r : ℤ) := S (.w ij) r

/-- The bracket used throughout is precisely the report convention. -/
theorem commutator_convention (x y : G) : ⁅x, y⁆ = x * y * x⁻¹ * y⁻¹ := rfl

private theorem relator_eq_one {w : FreeGroup Generator} (h : Relator w) :
    PresentedGroup.mk relations w = 1 := PresentedGroup.one_of_mem h

theorem torus_commute (l k : Index) : Commute (T l) (T k) := by
  apply commutatorElement_eq_one_iff_commute.mp
  exact (map_commutatorElement _ _ _).symm.trans (relator_eq_one (.torus l k))

theorem conjugation (l : Index) (s : Root) (r : ℤ) :
    T l * S s r * (T l)⁻¹ = S s (r + step s l) := by
  have h := relator_eq_one (.conjugation l s r)
  simpa only [map_mul, map_inv, mul_inv_eq_one, PresentedGroup.of, T, S] using h

theorem u_sq (i : Index) (r : ℤ) : U i r ^ 2 = 1 := by
  exact (map_pow _ _ _).symm.trans (relator_eq_one (.involution i r))

theorem uu (i j : Index) (h : i ≠ j) (r s : ℤ) : Commute (U i r) (U j s) := by
  apply commutatorElement_eq_one_iff_commute.mp
  exact (map_commutatorElement _ _ _).symm.trans (relator_eq_one (.uu i j h r s))

theorem vv (i j : Index) (h : i ≠ j) (r s : ℤ) : Commute (V i r) (V j s) := by
  apply commutatorElement_eq_one_iff_commute.mp
  exact (map_commutatorElement _ _ _).symm.trans (relator_eq_one (.vv i j h r s))

theorem uv (i j : Index) (h : i ≠ j) (r s : ℤ) : Commute (U i r) (V j s) := by
  apply commutatorElement_eq_one_iff_commute.mp
  exact (map_commutatorElement _ _ _).symm.trans (relator_eq_one (.uv i j h r s))

theorem wu (ij : Pair) (h : Index) (hh : h ≠ ij.val.1) (s r : ℤ) :
    Commute (W ij s) (U h r) := by
  apply commutatorElement_eq_one_iff_commute.mp
  exact (map_commutatorElement _ _ _).symm.trans (relator_eq_one (.wu ij h hh s r))

theorem wv (ij : Pair) (h : Index) (hh : h ≠ ij.val.2) (s r : ℤ) :
    Commute (W ij s) (V h r) := by
  apply commutatorElement_eq_one_iff_commute.mp
  exact (map_commutatorElement _ _ _).symm.trans (relator_eq_one (.wv ij h hh s r))

theorem uw (ij : Pair) (r s : ℤ) : ⁅U ij.val.1 r, W ij s⁆ = U ij.val.2 (r + s) := by
  have h := relator_eq_one (.uw ij r s)
  simpa only [map_mul, map_inv, map_commutatorElement, mul_inv_eq_one,
    PresentedGroup.of, S] using h

theorem wv_transfer (ij : Pair) (s r : ℤ) :
    ⁅W ij s, V ij.val.2 r⁆ = V ij.val.1 (r + s) := by
  have h := relator_eq_one (.wv_transfer ij s r)
  simpa only [map_mul, map_inv, map_commutatorElement, mul_inv_eq_one,
    PresentedGroup.of, S] using h

section UniversalProperty

variable {H : Type*} [Group H]

/-- A choice of images for the generators. -/
def generatorMap (t : Index → H) (s : Root → ℤ → H) : Generator → H
  | .torus l => t l
  | .root a r => s a r

variable (t : Index → H) (s : Root → ℤ → H)
    (htt : ∀ l k, Commute (t l) (t k))
    (hconj : ∀ l a r, t l * s a r * (t l)⁻¹ = s a (r + step a l))
    (hu : ∀ i r, s (.u i) r ^ 2 = 1)
    (huu : ∀ i j, i ≠ j → ∀ r q, Commute (s (.u i) r) (s (.u j) q))
    (hvv : ∀ i j, i ≠ j → ∀ r q, Commute (s (.v i) r) (s (.v j) q))
    (huv : ∀ i j, i ≠ j → ∀ r q, Commute (s (.u i) r) (s (.v j) q))
    (hwu : ∀ ij h, h ≠ ij.val.1 → ∀ q r, Commute (s (.w ij) q) (s (.u h) r))
    (hwv : ∀ ij h, h ≠ ij.val.2 → ∀ q r, Commute (s (.w ij) q) (s (.v h) r))
    (huw : ∀ ij r q, ⁅s (.u ij.val.1) r, s (.w ij) q⁆ = s (.u ij.val.2) (r + q))
    (hwv' : ∀ ij q r, ⁅s (.w ij) q, s (.v ij.val.2) r⁆ = s (.v ij.val.1) (r + q))

/-- The universal homomorphism, with each defining relation an explicit argument.
These are precisely the conditions for mapping out of the presented group. -/
def lift : G →* H :=
  PresentedGroup.toGroup (f := generatorMap t s) (by
    intro w hw
    cases hw with
    | torus l k =>
      simpa only [map_commutatorElement, FreeGroup.lift_apply_of, generatorMap]
        using (commutatorElement_eq_one_iff_commute.mpr (htt l k))
    | conjugation l a r =>
      simpa only [map_mul, map_inv, FreeGroup.lift_apply_of, generatorMap,
        mul_inv_eq_one] using hconj l a r
    | involution i r =>
      simpa only [map_pow, FreeGroup.lift_apply_of, generatorMap] using hu i r
    | uu i j h r q =>
      simpa only [map_commutatorElement, FreeGroup.lift_apply_of, generatorMap]
        using (commutatorElement_eq_one_iff_commute.mpr (huu i j h r q))
    | vv i j h r q =>
      simpa only [map_commutatorElement, FreeGroup.lift_apply_of, generatorMap]
        using (commutatorElement_eq_one_iff_commute.mpr (hvv i j h r q))
    | uv i j h r q =>
      simpa only [map_commutatorElement, FreeGroup.lift_apply_of, generatorMap]
        using (commutatorElement_eq_one_iff_commute.mpr (huv i j h r q))
    | wu ij h hh q r =>
      simpa only [map_commutatorElement, FreeGroup.lift_apply_of, generatorMap]
        using (commutatorElement_eq_one_iff_commute.mpr (hwu ij h hh q r))
    | wv ij h hh q r =>
      simpa only [map_commutatorElement, FreeGroup.lift_apply_of, generatorMap]
        using (commutatorElement_eq_one_iff_commute.mpr (hwv ij h hh q r))
    | uw ij r q =>
      simpa only [map_mul, map_inv, map_commutatorElement, FreeGroup.lift_apply_of,
        generatorMap, mul_inv_eq_one] using huw ij r q
    | wv_transfer ij q r =>
      simpa only [map_mul, map_inv, map_commutatorElement, FreeGroup.lift_apply_of,
        generatorMap, mul_inv_eq_one] using hwv' ij q r)

@[simp]
theorem lift_T (l : Index) :
    lift t s htt hconj hu huu hvv huv hwu hwv huw hwv' (T l) = t l :=
  PresentedGroup.toGroup.of _

@[simp]
theorem lift_S (a : Root) (r : ℤ) :
    lift t s htt hconj hu huu hvv huv hwu hwv huw hwv' (S a r) = s a r :=
  PresentedGroup.toGroup.of _

/-- Two homomorphisms out of G agree if they agree on the named generators. -/
theorem hom_ext {f g : G →* H} (ht : ∀ l, f (T l) = g (T l))
    (hs : ∀ a r, f (S a r) = g (S a r)) : f = g := by
  apply PresentedGroup.ext
  intro x
  cases x with
  | torus l => exact ht l
  | root a r => exact hs a r

end UniversalProperty

end FindimCounterexample.SelectionGroup
