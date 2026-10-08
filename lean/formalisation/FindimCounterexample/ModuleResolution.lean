/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import Mathlib.Algebra.Category.ModuleCat.Projective
import Mathlib.Algebra.Homology.ShortComplex.ModuleCat
import Mathlib.CategoryTheory.Abelian.Projective.Resolution

/-!
# Projective resolutions from explicit module families

The resolution input is a family of modules, its successive linear maps, exactness
as range equals kernel, and a surjective augmentation. This file packages those
data as Mathlib's `ProjectiveResolution`, without changing the modules or maps.
-/

open CategoryTheory

namespace FindimCounterexample.ModuleResolution

universe u v
variable {R : Type u} [Ring R]
variable (P : ℕ → ModuleCat.{v} R) (d : ∀ n, P (n + 1) →ₗ[R] P n)
variable (h : ∀ n, LinearMap.range (d (n + 1)) = LinearMap.ker (d n))

include h in
/-- Exactness of consecutive differentials implies the complex identity. -/
theorem differential_comp (n : ℕ) : (d n).comp (d (n + 1)) = 0 :=
  LinearMap.range_le_ker_iff.mp (h n).le

/-- The chain complex associated with an exact family of module maps. -/
def complex : ChainComplex (ModuleCat.{v} R) ℕ :=
  ChainComplex.of P (fun n => ModuleCat.ofHom (d n))
    (fun n => ModuleCat.hom_ext (differential_comp P d h n))

/-- The chain complex has the original modules as its terms. -/
@[simp]
theorem complex_X (n : ℕ) : (complex P d h).X n = P n := rfl

/-- The consecutive differentials are the original linear maps. -/
@[simp]
theorem complex_d_succ (n : ℕ) :
    (complex P d h).d (n + 1) n = ModuleCat.ofHom (d n) :=
  by simp [complex]

/-- The associated chain complex is exact in every positive degree. -/
theorem complex_exactAt_succ (n : ℕ) : (complex P d h).ExactAt (n + 1) := by
  rw [HomologicalComplex.exactAt_iff' _ (n + 1 + 1) (n + 1) n (by simp) (by simp)]
  apply (ShortComplex.moduleCat_exact_iff_range_eq_ker _).mpr
  simpa only [HomologicalComplex.sc', HomologicalComplex.shortComplexFunctor',
    complex, ChainComplex.of_d, ModuleCat.hom_ofHom] using! h n

variable {E : ModuleCat.{v} R} (ε : P 0 →ₗ[R] E)
variable (h₀ : LinearMap.range (d 0) = LinearMap.ker ε)

include h₀ in
/-- Exactness at the augmentation implies that it annihilates the differential. -/
theorem augmentation_comp : ε.comp (d 0) = 0 :=
  LinearMap.range_le_ker_iff.mp h₀.le

/-- The augmentation, regarded as a morphism of chain complexes. -/
noncomputable def augmentation :
    complex P d h ⟶ (ChainComplex.single₀ (ModuleCat.{v} R)).obj E :=
  (ChainComplex.toSingle₀Equiv _ _).symm ⟨ModuleCat.ofHom ε, by
    rw [complex_d_succ]
    exact ModuleCat.hom_ext (augmentation_comp P d ε h₀)⟩

/-- The degree zero component of the chain augmentation is the input map. -/
@[simp]
theorem augmentation_f_zero : (augmentation P d h ε h₀).f 0 = ModuleCat.ofHom ε :=
  ChainComplex.toSingle₀Equiv_symm_apply_f_zero _ _

variable (hε : Function.Surjective ε)

include hε in
/-- The augmentation of an exact augmented family is a quasi-isomorphism. -/
theorem augmentation_quasiIso : QuasiIso (augmentation P d h ε h₀) := by
  refine ⟨fun n => ?_⟩
  cases n with
  | zero =>
    rw [ChainComplex.quasiIsoAt₀_iff,
      ShortComplex.quasiIso_iff_of_zeros' _ (by rfl) (by rfl) (by rfl)]
    constructor
    · apply (ShortComplex.moduleCat_exact_iff_range_eq_ker _).mpr
      simpa only [HomologicalComplex.shortComplexFunctor', augmentation_f_zero,
        complex_d_succ, ModuleCat.hom_ofHom] using! h₀
    · change Epi ((augmentation P d h ε h₀).f 0)
      rw [augmentation_f_zero]
      exact (ModuleCat.epi_iff_surjective _).mpr hε
  | succ n =>
    rw [quasiIsoAt_iff_exactAt']
    · exact complex_exactAt_succ P d h n
    · exact ChainComplex.exactAt_succ_single_obj _ _

variable [∀ n, Module.Projective R (P n)]

/-- A projective resolution with exactly the supplied modules and differentials. -/
noncomputable def projectiveResolution : ProjectiveResolution E where
  complex := complex P d h
  projective n := by change Projective (P n); infer_instance
  π := augmentation P d h ε h₀
  quasiIso := augmentation_quasiIso P d h ε h₀ hε

end FindimCounterexample.ModuleResolution
