/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import FindimCounterexample.Coresolution
import Mathlib.Algebra.Homology.ShortComplex.ModuleCat

/-!
# Cokernels of an exact complex of modules

For `0 → X₀ → X₁ → ⋯`, use `C₀ = X₀` and `Cₙ₊₁ = Xₙ₊₁ / range dₙ`.
The middle term of short exact sequence number `n` is `Xₙ₊₁`.
-/

open CategoryTheory

namespace FindimCounterexample
namespace ExactCoresolution

universe u v
variable {A : Type u} [Ring A]
variable (X : ℕ → ModuleCat.{v} A) (d : ∀ n, X n →ₗ[A] X (n + 1))

/-- The degree zero term and successive range quotients. -/
def cok (n : ℕ) : ModuleCat.{v} A :=
  match n with
  | 0 => X 0
  | n + 1 => ModuleCat.of A (X (n + 1) ⧸ LinearMap.range (d n))

/-- Projection onto the next cokernel. -/
def projection (n : ℕ) : X (n + 1) ⟶ cok X d (n + 1) :=
  ModuleCat.ofHom (LinearMap.range (d n)).mkQ

variable (h : ∀ n, LinearMap.range (d n) = LinearMap.ker (d (n + 1)))

/-- The differential induced on a cokernel. -/
def inclusion (n : ℕ) : cok X d n ⟶ X (n + 1) :=
  match n with
  | 0 => ModuleCat.ofHom (d 0)
  | n + 1 => ModuleCat.ofHom ((LinearMap.range (d n)).liftQ (d (n + 1)) (h n).le)

/-- Each inclusion has the same image as the corresponding differential. -/
theorem range_inclusion (n : ℕ) :
    LinearMap.range (inclusion X d h n).hom = LinearMap.range (d n) := by
  cases n with
  | zero => rfl
  | succ n => exact Submodule.range_liftQ _ _ _

/-- The inclusion followed by the quotient projection vanishes. -/
theorem inclusion_projection (n : ℕ) :
    inclusion X d h n ≫ projection X d n = 0 := by
  apply ModuleCat.hom_ext
  apply LinearMap.range_le_ker_iff.mp
  change LinearMap.range (inclusion X d h n).hom ≤
    LinearMap.ker (LinearMap.range (d n)).mkQ
  rw [Submodule.ker_mkQ, range_inclusion]

/-- Short exactness uses injectivity at degree zero and exactness in later degrees. -/
theorem shortExact (h₀ : Function.Injective (d 0)) (n : ℕ) :
    (ShortComplex.mk (inclusion X d h n) (projection X d n)
      (inclusion_projection X d h n)).ShortExact where
  exact := by
    apply (ShortComplex.moduleCat_exact_iff_range_eq_ker _).mpr
    change LinearMap.range (inclusion X d h n).hom =
      LinearMap.ker (LinearMap.range (d n)).mkQ
    rw [Submodule.ker_mkQ, range_inclusion]
  mono_f := by
    apply (ModuleCat.mono_iff_injective _).mpr
    cases n with
    | zero => exact h₀
    | succ n =>
      apply LinearMap.ker_eq_bot.mp
      exact Submodule.ker_liftQ_eq_bot _ _ (h n).le (h n).ge
  epi_g := (ModuleCat.epi_iff_surjective _).mpr (Submodule.mkQ_surjective _)

/-- An exact complex with projective terms gives the stage 1 data. -/
def coresolution (h₀ : Function.Injective (d 0))
    (hp : ∀ n, Projective (X (n + 1))) : ProjectiveCoresolution (ModuleCat.{v} A) where
  c := cok X d
  p n := X (n + 1)
  ι := inclusion X d h
  π := projection X d
  w := inclusion_projection X d h
  shortExact := shortExact X d h h₀
  projective := hp

end ExactCoresolution
end FindimCounterexample
