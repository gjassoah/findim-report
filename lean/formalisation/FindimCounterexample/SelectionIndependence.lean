/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import FindimCounterexample.SelectionDirectSum
import FindimCounterexample.FiniteQuotients
import FindimCounterexample.FiniteQuotientSeparation
import Mathlib.LinearAlgebra.Finsupp.LinearCombination
import Mathlib.LinearAlgebra.Dimension.Finite
import Mathlib.RingTheory.PrincipalIdealDomain

/-!
# Independence of the central involutions

Finite matrix quotients separate every finitely supported coefficient vector.
The resulting injection identifies the generated central subgroup with the
direct sum of copies of `ZMod 2`. If the full centre were finitely generated,
its additive group would be a Noetherian integer module; this injection would
make the infinite direct sum finitely generated, a contradiction.
-/

open scoped IsMulCommutative

namespace FindimCounterexample.SelectionGroup

noncomputable section

/-- Evaluation of a finitely supported Laurent coefficient vector in S_m. -/
def coefficientSum (m : ℕ) (hm : 0 < m) :
    (ℤ →₀ ZMod 2) →ₗ[ZMod 2] FiniteQuotientRing.S m :=
  Finsupp.linearCombination (ZMod 2) (FiniteQuotientRing.tPow m hm)

@[simp] theorem coefficientSum_single (m : ℕ) (hm : 0 < m) (N : ℤ) (a : ZMod 2) :
    coefficientSum m hm (Finsupp.single N a) = a • FiniteQuotientRing.tPow m hm N :=
  Finsupp.linearCombination_single _ _ _

private theorem zmod_two_cases : ∀ a : ZMod 2, a = 0 ∨ a = 1 := by
  decide

private theorem pi_cyclic (m : ℕ) (hm : 0 < m) (N : ℤ) (a : ZMod 2) :
    FiniteQuotients.pi m hm ((cyclic N a).toMul : G) =
      MatrixTransvections.e 0 4 (by decide) (a • FiniteQuotientRing.tPow m hm N) := by
  rcases zmod_two_cases a with ha | ha
  · simp [ha]
  · simp only [ha, cyclic_one, toMul_ofMul, zCentral_coe, one_smul, FiniteQuotients.pi_z]

/-- The image of a finite product of central involutions is the transvection
whose parameter is its Laurent coefficient sum. -/
theorem pi_centralSum (m : ℕ) (hm : 0 < m) (f : ℤ →₀ ZMod 2) :
    FiniteQuotients.pi m hm ((centralSum f).toMul : G) =
      MatrixTransvections.e 0 4 (by decide) (coefficientSum m hm f) := by
  induction f using Finsupp.induction with
  | zero => simp
  | @single_add N a f _ _ ih =>
    rw [map_add, toMul_add, Subgroup.coe_mul, map_mul, centralSum_single,
      pi_cyclic, ih, map_add, coefficientSum_single, MatrixTransvections.e_mul]

/-- Finite quotients detect every relation among the central involutions. -/
theorem centralSum_injective : Function.Injective centralSum := by
  apply (injective_iff_map_eq_zero centralSum).mpr
  intro f hf
  apply FiniteQuotientRing.eq_zero_of_all_sums f
  intro m hm
  have h := pi_centralSum m hm f
  rw [hf, toMul_zero, Subgroup.coe_one, map_one] at h
  change coefficientSum m hm f = 0
  exact MatrixTransvections.e_injective 0 4 (by decide)
    (h.symm.trans (MatrixTransvections.e_zero 0 4 (by decide)).symm)

/-- The multiplicative direct-sum map is injective. -/
theorem centralProduct_injective : Function.Injective centralProduct := by
  intro a b hab
  apply Multiplicative.toAdd.injective
  apply centralSum_injective
  exact Additive.toMul.injective hab

/-- Corollary 5.15: the subgroup generated in the centre by all z_N is the
direct sum of copies of Z/2 indexed by the integers. -/
def directSumEquiv : Multiplicative (ℤ →₀ ZMod 2) ≃* centralSubgroup :=
  (MonoidHom.ofInjective centralProduct_injective).trans
    (MulEquiv.subgroupCongr centralProduct_range)

/-- The isomorphism takes the N-th standard generator to z_N. -/
@[simp] theorem directSumEquiv_single (N : ℤ) :
    (directSumEquiv (Multiplicative.ofAdd (Finsupp.single N 1)) : Subgroup.center G) =
      zCentral N := centralProduct_single_one N

/-- The full centre is not finitely generated as a group. -/
theorem center_not_finitelyGenerated : ¬ Group.FG (Subgroup.center G) := by
  intro h
  let : Group.FG (Subgroup.center G) := h
  let : Module.Finite ℤ (Additive (Subgroup.center G)) :=
    Module.Finite.iff_addGroup_fg.mpr inferInstance
  have hf : Module.Finite ℤ (ℤ →₀ ZMod 2) :=
    Module.Finite.of_injective centralSum.toIntLinearMap centralSum_injective
  rcases (Module.finite_finsupp_iff (R := ℤ) (M := ZMod 2) (ι := ℤ)).mp hf with
    hEmpty | hSub | ⟨_, hFinite⟩
  · exact hEmpty.false (0 : ℤ)
  · exact not_subsingleton (ZMod 2) hSub
  · exact Infinite.not_finite hFinite

/-- Corollary 5.15 in Mathlib's subgroup finite-generation predicate. -/
theorem center_not_fg : ¬ (Subgroup.center G).FG := by
  intro h
  exact center_not_finitelyGenerated ((Group.fg_iff_subgroup_fg _).mpr h)

end

end FindimCounterexample.SelectionGroup
