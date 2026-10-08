/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import FindimCounterexample.SelectionFiniteRelations
import Mathlib.GroupTheory.FinitelyPresentedGroup

/-!
# The finite presentation is isomorphic to the selection group

The two presentation maps are inverse on every generator. The isomorphism
identifies the fifteen finite generators with the specified elements of G,
and transports Mathlib's finite-presentability predicate to G.
-/

open scoped commutatorElement

namespace FindimCounterexample.SelectionFinite

/-- Images of the fifteen finite generators in G. -/
def generatorToG : Generator → SelectionGroup.G
  | .inl i => SelectionGroup.T i
  | .inr a => SelectionGroup.S a 0

private theorem kernel_commute (l : SelectionGroup.Index) (a : SelectionGroup.Root)
    (h : SelectionGroup.step a l = 0) :
    Commute (SelectionGroup.T l) (SelectionGroup.S a 0) := by
  apply mul_inv_eq_iff_eq_mul.mp
  simpa only [h, add_zero] using SelectionGroup.conjugation l a 0

private theorem pair_kernel_commute (ij : SelectionGroup.Pair) :
    Commute (SelectionGroup.T ij.val.1 * SelectionGroup.T ij.val.2)
      (SelectionGroup.W ij 0) := by
  apply mul_inv_eq_iff_eq_mul.mp
  rw [SelectionTorus.conjugate_mul, SelectionGroup.conjugation, SelectionGroup.conjugation]
  have h := ij.property
  simp_all [SelectionGroup.step, SelectionGroup.weight]

/-- The finite presentation maps to G by its specified fifteen generators. -/
def toG : P →* SelectionGroup.G :=
  PresentedGroup.toGroup (f := generatorToG) (by
    rintro _ ⟨r, rfl⟩
    cases r <;>
      simp only [relationWord, map_mul, map_inv, map_pow, map_commutatorElement,
        FreeGroup.lift_apply_of, generatorToG, mul_inv_eq_one,
        commutatorElement_eq_one_iff_commute]
    case torus i j => exact SelectionGroup.torus_commute i j
    case involution i => exact SelectionGroup.u_sq i 0
    case uu ij => exact SelectionGroup.uu _ _ ij.property 0 0
    case vv ij => exact SelectionGroup.vv _ _ ij.property 0 0
    case uv ij => exact SelectionGroup.uv _ _ ij.property 0 0
    case wu ij h => exact SelectionGroup.wu ij h.val h.property 0 0
    case wv ij h => exact SelectionGroup.wv ij h.val h.property 0 0
    case uw ij => simpa only [zero_add] using SelectionGroup.uw ij 0 0
    case wv_transfer ij => simpa only [zero_add] using SelectionGroup.wv_transfer ij 0 0
    case torus_u hi =>
      apply kernel_commute
      have h := hi.property
      simp_all [SelectionGroup.step, SelectionGroup.weight]
    case torus_v hi =>
      apply kernel_commute
      have h := hi.property
      simp_all [SelectionGroup.step, SelectionGroup.weight]
    case torus_w_pair ij => exact pair_kernel_commute ij
    case torus_w_third ij k =>
      apply kernel_commute
      have hi := k.property.1
      have hj := k.property.2
      simp_all [SelectionGroup.step, SelectionGroup.weight])

@[simp]
theorem toG_T (i : SelectionGroup.Index) : toG (T i) = SelectionGroup.T i :=
  PresentedGroup.toGroup.of _

@[simp]
theorem toG_root0 (a : SelectionGroup.Root) : toG (root0 a) = SelectionGroup.S a 0 :=
  PresentedGroup.toGroup.of _

/-- Reconstruction of the integer root parameters recovers the original
generators after mapping the finite presentation to G. -/
theorem toG_family (a : SelectionGroup.Root) (r : ℤ) :
    toG (family a r) = SelectionGroup.S a r := by
  cases a with
  | u i =>
    have h := SelectionTorus.conjugate_zpow_shift (SelectionGroup.T i)
      (SelectionGroup.U i) (SelectionGroup.step (.u i) i)
      (fun q => SelectionGroup.conjugation i (.u i) q) (-r) 0
    simpa [family, base, map_mul, map_inv, map_zpow, toG_T, toG_root0,
      SelectionGroup.step, SelectionGroup.weight, inv_zpow, zpow_neg] using h
  | v i =>
    have h := SelectionTorus.conjugate_zpow_shift (SelectionGroup.T i)
      (SelectionGroup.V i) (SelectionGroup.step (.v i) i)
      (fun q => SelectionGroup.conjugation i (.v i) q) r 0
    simpa [family, base, map_mul, map_inv, map_zpow, toG_T, toG_root0,
      SelectionGroup.step, SelectionGroup.weight] using h
  | w ij =>
    have h := SelectionTorus.conjugate_zpow_shift (SelectionGroup.T ij.val.1)
      (SelectionGroup.W ij) (SelectionGroup.step (.w ij) ij.val.1)
      (fun q => SelectionGroup.conjugation ij.val.1 (.w ij) q) r 0
    simpa [family, base, map_mul, map_inv, map_zpow, toG_T, toG_root0,
      SelectionGroup.step, SelectionGroup.weight, ij.property, ij.property.symm] using h

/-- The composite on the finite presentation fixes its fifteen generators. -/
theorem fromG_comp_toG : fromG.comp toG = MonoidHom.id P := by
  apply hom_ext
  · intro i
    simp
  · intro a
    simp

/-- The composite on G fixes every integer-parameter generator. -/
theorem toG_comp_fromG : toG.comp fromG = MonoidHom.id SelectionGroup.G := by
  apply SelectionGroup.hom_ext
  · intro i
    simp
  · intro a r
    simp [toG_family]

/-- Proposition 5.9: the exact finite presentation and G are isomorphic. -/
def presentationEquiv : P ≃* SelectionGroup.G :=
  MonoidHom.toMulEquiv toG fromG fromG_comp_toG toG_comp_fromG

@[simp]
theorem presentationEquiv_T (i : SelectionGroup.Index) :
    presentationEquiv (T i) = SelectionGroup.T i := toG_T i

@[simp]
theorem presentationEquiv_root0 (a : SelectionGroup.Root) :
    presentationEquiv (root0 a) = SelectionGroup.S a 0 := toG_root0 a

/-- Finite presentability uses Mathlib's existing predicate. -/
theorem finitelyPresented : Group.IsFinitelyPresented SelectionGroup.G := by
  have : Finite relations := Set.finite_coe_iff.mpr relations_finite
  exact Group.IsFinitelyPresented.equiv presentationEquiv

end FindimCounterexample.SelectionFinite
