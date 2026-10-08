/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import Mathlib.RingTheory.Finiteness.Projective
import Mathlib.Algebra.Module.Opposite

/-!
# Duality over a possibly noncommutative ring

The dual of a right module takes values in the regular bimodule. The left and right
scalar actions on the duals are supplied by Mathlib's commuting-action instances.
These are the algebraic preliminaries for stage 2 of Proposition O.4.
-/

namespace FindimCounterexample
namespace RingDual

open MulOpposite

variable (A : Type*) [Ring A]

/-- The left dual of a right module. -/
abbrev RightDual (P : Type*) [AddCommGroup P] [Module Aᵐᵒᵖ P] := P →ₗ[Aᵐᵒᵖ] A

/-- The right dual of a left module. -/
abbrev LeftDual (Q : Type*) [AddCommGroup Q] [Module A Q] := Q →ₗ[A] A

variable {A}
variable {P P' P'' : Type*} [AddCommGroup P] [AddCommGroup P'] [AddCommGroup P'']
  [Module Aᵐᵒᵖ P] [Module Aᵐᵒᵖ P'] [Module Aᵐᵒᵖ P'']
variable {Q Q' : Type*} [AddCommGroup Q] [AddCommGroup Q'] [Module A Q] [Module A Q']

/-- Precomposition on the duals of right modules. -/
def rightMap (f : P →ₗ[Aᵐᵒᵖ] P') : RightDual A P' →ₗ[A] RightDual A P where
  toFun g := g.comp f
  map_add' _ _ := rfl
  map_smul' _ _ := rfl

/-- Precomposition on the duals of left modules. -/
def leftMap (f : Q →ₗ[A] Q') : LeftDual A Q' →ₗ[Aᵐᵒᵖ] LeftDual A Q where
  toFun g := g.comp f
  map_add' _ _ := rfl
  map_smul' _ _ := rfl

@[simp] theorem rightMap_apply (f : P →ₗ[Aᵐᵒᵖ] P') (g : RightDual A P') (x : P) :
    rightMap f g x = g (f x) := rfl

@[simp] theorem leftMap_apply (f : Q →ₗ[A] Q') (g : LeftDual A Q') (x : Q) :
    leftMap f g x = g (f x) := rfl

@[simp] theorem rightMap_comp (f : P →ₗ[Aᵐᵒᵖ] P') (g : P' →ₗ[Aᵐᵒᵖ] P'') :
    rightMap (g.comp f) = (rightMap f).comp (rightMap g) := rfl

/-- Evaluation in the double dual of a right module. -/
def eval (P : Type*) [AddCommGroup P] [Module Aᵐᵒᵖ P] :
    P →ₗ[Aᵐᵒᵖ] LeftDual A (RightDual A P) where
  toFun x :=
    { toFun := fun g => g x
      map_add' := fun _ _ => rfl
      map_smul' := fun _ _ => rfl }
  map_add' x y := by ext g; exact g.map_add x y
  map_smul' a x := by ext g; exact g.map_smul a x

@[simp] theorem eval_apply (x : P) (g : RightDual A P) : eval P x g = g x := rfl

/-- Naturality of evaluation, keeping both handedness changes explicit. -/
theorem eval_naturality (f : P →ₗ[Aᵐᵒᵖ] P') :
    (eval P').comp f = (leftMap (rightMap f)).comp (eval P) := rfl

section FiniteFree

variable (ι : Type*) [Fintype ι] [DecidableEq ι]

/-- A coordinate functional on a finite free right module, with values in `A`. -/
def coordinate (i : ι) : RightDual A (ι → Aᵐᵒᵖ) where
  toFun x := unop (x i)
  map_add' _ _ := rfl
  map_smul' _ _ := rfl

/-- Every vector in the finite free right module is its coordinate expansion. -/
theorem free_expansion (x : ι → Aᵐᵒᵖ) :
    ∑ i, x i • Pi.single i (1 : Aᵐᵒᵖ) = x := by
  ext j
  simp [Pi.single_apply, smul_eq_mul]

/-- Every functional on a finite free right module is its coordinate expansion. -/
theorem dual_expansion (g : RightDual A (ι → Aᵐᵒᵖ)) :
    ∑ i, g (Pi.single i 1) • coordinate ι i = g := by
  apply LinearMap.ext
  intro x
  conv_rhs => rw [← free_expansion ι x]
  simp [coordinate, map_sum, map_smul, MulOpposite.smul_eq_mul_unop]

/-- The dual of a finite free right module is finite free on the coordinate functionals. -/
def freeDualEquiv : RightDual A (ι → Aᵐᵒᵖ) ≃ₗ[A] (ι → A) where
  toFun g i := g (Pi.single i 1)
  invFun a := ∑ i, a i • coordinate ι i
  left_inv := dual_expansion ι
  right_inv a := by ext i; simp [coordinate, Pi.single_apply, apply_ite unop]
  map_add' _ _ := rfl
  map_smul' _ _ := rfl

omit [Fintype ι] [DecidableEq ι] in
/-- Evaluation is bijective for finite free right modules. -/
theorem eval_bijective_free [Finite ι] : Function.Bijective (eval (ι → Aᵐᵒᵖ) (A := A)) := by
  classical
  let := Fintype.ofFinite ι
  constructor
  · intro x y h
    ext i
    apply unop_injective
    exact congrArg (fun g => g (coordinate ι i)) h
  · intro h
    refine ⟨fun i => op (h (coordinate ι i)), ?_⟩
    ext g
    conv_rhs => rw [← dual_expansion ι g]
    conv_lhs => rw [← free_expansion ι (fun i => op (h (coordinate ι i))) ]
    simp [map_sum, map_smul, MulOpposite.smul_eq_mul_unop, smul_eq_mul]

end FiniteFree

/-- Bijectivity of evaluation descends to a retract. -/
theorem eval_bijective_of_split (i : P →ₗ[Aᵐᵒᵖ] P') (s : P' →ₗ[Aᵐᵒᵖ] P)
    (hs : s.comp i = LinearMap.id) (h : Function.Bijective (eval P' (A := A))) :
    Function.Bijective (eval P (A := A)) := by
  have hsx (x : P) : s (i x) = x := DFunLike.congr_fun hs x
  constructor
  · intro x y hxy
    apply LinearMap.injective_of_comp_eq_id i s hs
    apply h.1
    apply LinearMap.ext
    intro g
    exact congrArg (fun z => z (rightMap i g)) hxy
  · intro g
    obtain ⟨x, hx⟩ := h.2 (leftMap (rightMap i) g)
    refine ⟨s x, ?_⟩
    apply LinearMap.ext
    intro f
    have hx' := DFunLike.congr_fun hx (rightMap s f)
    change f (s x) = _ at hx'
    change f (s x) = g f
    rw [hx']
    apply congrArg g
    apply LinearMap.ext
    intro y
    exact congrArg f (hsx y)

/-- A finitely generated projective right module is reflexive. -/
theorem eval_bijective [Module.Finite Aᵐᵒᵖ P] [Module.Projective Aᵐᵒᵖ P] :
    Function.Bijective (eval P (A := A)) := by
  obtain ⟨n, s, i, _, _, hs⟩ := Module.Finite.exists_comp_eq_id_of_projective Aᵐᵒᵖ P
  exact eval_bijective_of_split i s hs (eval_bijective_free (A := A) (Fin n))

/-- The evaluation isomorphism for a finitely generated projective right module. -/
noncomputable def evalEquiv [Module.Finite Aᵐᵒᵖ P] [Module.Projective Aᵐᵒᵖ P] :
    P ≃ₗ[Aᵐᵒᵖ] LeftDual A (RightDual A P) :=
  LinearEquiv.ofBijective (eval P) eval_bijective

/-- The dual of a finitely generated projective right module is projective. -/
instance rightDual_projective [Module.Finite Aᵐᵒᵖ P] [Module.Projective Aᵐᵒᵖ P] :
    Module.Projective A (RightDual A P) := by
  obtain ⟨n, s, i, _, _, hs⟩ := Module.Finite.exists_comp_eq_id_of_projective Aᵐᵒᵖ P
  let : Module.Projective A (RightDual A (Fin n → Aᵐᵒᵖ)) :=
    Module.Projective.of_equiv (freeDualEquiv (A := A) (Fin n)).symm
  apply Module.Projective.of_split (rightMap s) (rightMap i)
  ext f x
  exact congrArg f (DFunLike.congr_fun hs x)

/-- The dual of a finitely generated projective right module is finitely generated. -/
instance rightDual_finite [Module.Finite Aᵐᵒᵖ P] [Module.Projective Aᵐᵒᵖ P] :
    Module.Finite A (RightDual A P) := by
  obtain ⟨n, s, i, _, _, hs⟩ := Module.Finite.exists_comp_eq_id_of_projective Aᵐᵒᵖ P
  let : Module.Finite A (RightDual A (Fin n → Aᵐᵒᵖ)) :=
    Module.Finite.of_surjective (freeDualEquiv (A := A) (Fin n)).symm.toLinearMap
      (freeDualEquiv (A := A) (Fin n)).symm.surjective
  apply Module.Finite.of_surjective (rightMap i)
  intro f
  refine ⟨rightMap s f, ?_⟩
  ext x
  exact congrArg f (DFunLike.congr_fun hs x)

/-- A left inverse of the dual map gives a right inverse of the original map. -/
theorem split_of_dual_split [Module.Finite Aᵐᵒᵖ P] [Module.Projective Aᵐᵒᵖ P]
    [Module.Finite Aᵐᵒᵖ P'] [Module.Projective Aᵐᵒᵖ P']
    (f : P →ₗ[Aᵐᵒᵖ] P') (r : RightDual A P →ₗ[A] RightDual A P')
    (hr : r.comp (rightMap f) = LinearMap.id) :
    ∃ s : P' →ₗ[Aᵐᵒᵖ] P, f.comp s = LinearMap.id := by
  refine ⟨(evalEquiv (A := A) (P := P)).symm.toLinearMap.comp
    ((leftMap r).comp (eval P')), ?_⟩
  apply LinearMap.ext
  intro x
  apply (eval_bijective (A := A) (P := P')).1
  apply LinearMap.ext
  intro g
  have he := (evalEquiv (A := A) (P := P)).apply_symm_apply (leftMap r (eval P' x))
  have he' := DFunLike.congr_fun he (rightMap f g)
  change g (f _) = _ at he'
  change g (f _) = g x
  exact he'.trans (congrArg (fun z : RightDual A P' => z x) (DFunLike.congr_fun hr g))

end RingDual
end FindimCounterexample
