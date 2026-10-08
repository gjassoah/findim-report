/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import FindimCounterexample.Duality
import FindimCounterexample.ExactCoresolution
import Mathlib.Algebra.Category.ModuleCat.Projective

/-!
# The duality criterion for unbounded finite projective dimensions

Let `Pₙ` be finitely generated projective right modules, with maps `dₙ : Pₙ₊₁ → Pₙ`.
Assume that `0 → P₀* → P₁* → ⋯` is exact. A surjection `P₀ → E ≠ 0` annihilating
`d₀` ensures that the first dual cokernel is not projective. The successive dual
cokernels therefore have projective dimensions `n` for `n ≥ 1` by stage 1.

A projective resolution supplies the maps and augmentation used here. Exactness
of the original resolution is not needed beyond the stated augmentation properties.
The comparison of dual exactness with Ext vanishing is outside the scope.
-/

open CategoryTheory

namespace FindimCounterexample
namespace StrongNakayama

universe u v
variable {A : Type u} [Ring A]
variable (P : ℕ → ModuleCat.{v} Aᵐᵒᵖ)
variable (d : ∀ n, P (n + 1) →ₗ[Aᵐᵒᵖ] P n)

/-- The dual modules, with left multiplication on values. -/
abbrev dualObjects (n : ℕ) : ModuleCat.{max u v} A :=
  ModuleCat.of A (RingDual.RightDual A (P n))

/-- The dual differentials are precomposition with the original differentials. -/
abbrev dualDifferential (n : ℕ) : dualObjects P n →ₗ[A] dualObjects P (n + 1) :=
  RingDual.rightMap (d n)

/-- The actual range quotients of the dual complex, with `C₀ = P₀*`. -/
abbrev cok (n : ℕ) : ModuleCat.{max u v} A :=
  ExactCoresolution.cok (dualObjects P) (dualDifferential P d) n

variable [∀ n, Module.Finite Aᵐᵒᵖ (P n)] [∀ n, Module.Projective Aᵐᵒᵖ (P n)]
variable (h₀ : Function.Injective (dualDifferential P d 0))
variable (h : ∀ n, LinearMap.range (dualDifferential P d n) =
  LinearMap.ker (dualDifferential P d (n + 1)))

/-- The dual complex gives a projective coresolution whose terms are the dual cokernels. -/
def coresolution : ProjectiveCoresolution (ModuleCat.{max u v} A) :=
  ExactCoresolution.coresolution (dualObjects P) (dualDifferential P d) h h₀
    (fun _ => inferInstance)

/-- The initial cokernel term is projective. -/
theorem projective_zero : Projective (cok P d 0) := by
  change Projective (ModuleCat.of A (RingDual.RightDual A (P 0)))
  infer_instance

/-- All cokernel terms are finitely generated. -/
instance cok_finite (n : ℕ) : Module.Finite A (cok P d n) := by
  cases n with
  | zero => exact RingDual.rightDual_finite
  | succ n =>
    change Module.Finite A
      (RingDual.RightDual A (P (n + 1)) ⧸ LinearMap.range (dualDifferential P d n))
    infer_instance

variable {E : Type*} [AddCommGroup E] [Module Aᵐᵒᵖ E] [Nontrivial E]
variable (ε : P 0 →ₗ[Aᵐᵒᵖ] E) (hε : Function.Surjective ε)
variable (wε : ε.comp (d 0) = 0)

include h₀ h hε wε

/-- The first dual cokernel cannot be projective if the augmentation has nonzero target. -/
theorem not_projective_one : ¬ Projective (cok P d 1) := by
  intro hc
  let : Projective ((coresolution P d h₀ h).c 1) := hc
  let splitting := ((coresolution P d h₀ h).shortExact 0).splittingOfProjective
  have hr : splitting.r.hom.comp (RingDual.rightMap (d 0)) = LinearMap.id :=
    ModuleCat.hom_ext_iff.mp splitting.f_r
  obtain ⟨s, hs⟩ := RingDual.split_of_dual_split (d 0) splitting.r.hom hr
  obtain ⟨y, hy⟩ := exists_ne (0 : E)
  obtain ⟨x, rfl⟩ := hε y
  apply hy
  have hx : d 0 (s x) = x := DFunLike.congr_fun hs x
  have hz : ε (d 0 (s x)) = 0 := DFunLike.congr_fun wε (s x)
  rwa [hx] at hz

/-- Proposition O.4 with dual exactness stated directly: `pd Cₙ = n` for `n ≥ 1`. -/
theorem projectiveDimension_eq (n : ℕ) (hn : 1 ≤ n) :
    HasProjectiveDimensionLE (cok P d n) n ∧
      ¬ HasProjectiveDimensionLT (cok P d n) n :=
  (coresolution P d h₀ h).projectiveDimension_eq (projective_zero P d)
    (not_projective_one P d h₀ h ε hε wε) n hn

/-- Finitely generated left modules have arbitrarily large finite projective dimensions. -/
theorem unbounded : ∀ n : ℕ, 1 ≤ n →
    ∃ M : ModuleCat.{max u v} A, Module.Finite A M ∧
      HasProjectiveDimensionLE M n ∧ ¬ HasProjectiveDimensionLT M n := by
  intro n hn
  exact ⟨cok P d n, inferInstance, projectiveDimension_eq P d h₀ h ε hε wε n hn⟩

end StrongNakayama
end FindimCounterexample
