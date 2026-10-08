/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import FindimCounterexample.StrongNakayama
import Mathlib.LinearAlgebra.Isomorphisms

/-!
# Transposes of the presentations in a resolution

For a map `f : Q₁ → Q₀` of right modules, its presentation transpose is the left
module `coker(f* : Q₀* → Q₁*)`. This depends on the presentation; no minimality is
assumed. A resolution of `E` supplies presentations of its successive syzygies.
The dual cokernel `Cₙ₊₁` of stage 2 is their presentation transpose.

The syzygies here are kernels in the given resolution, rather than kernels of
projective covers. This distinction matters over rings without projective covers.
-/

open CategoryTheory

namespace FindimCounterexample
namespace Transpose

universe u v
variable {A : Type u} [Ring A]

/-- The right module presented by `Q₁ → Q₀`. -/
abbrev presentedModule {Q₁ Q₀ : ModuleCat.{v} Aᵐᵒᵖ} (f : Q₁ →ₗ[Aᵐᵒᵖ] Q₀) :
    ModuleCat.{v} Aᵐᵒᵖ :=
  ModuleCat.of Aᵐᵒᵖ (Q₀ ⧸ LinearMap.range f)

/-- The transpose associated with a right-module presentation, with no minimality assumption. -/
abbrev ofPresentation {Q₁ Q₀ : ModuleCat.{v} Aᵐᵒᵖ} (f : Q₁ →ₗ[Aᵐᵒᵖ] Q₀) :
    ModuleCat.{max u v} A :=
  ModuleCat.of A (RingDual.RightDual A Q₁ ⧸ LinearMap.range (RingDual.rightMap f))

variable (P : ℕ → ModuleCat.{v} Aᵐᵒᵖ)
variable (d : ∀ n, P (n + 1) →ₗ[Aᵐᵒᵖ] P n)

/-- The stage-2 dual cokernel is the transpose of the corresponding presentation. -/
theorem cok_eq_transpose (n : ℕ) :
    StrongNakayama.cok P d (n + 1) = ofPresentation (d n) := rfl

variable (E : ModuleCat.{v} Aᵐᵒᵖ) (ε : P 0 →ₗ[Aᵐᵒᵖ] E)

/-- Syzygies in the given resolution: `Ω⁰ = E`, `Ω¹ = ker ε`, `Ωⁿ⁺² = ker dₙ`. -/
def syzygy (n : ℕ) : ModuleCat.{v} Aᵐᵒᵖ :=
  match n with
  | 0 => E
  | 1 => ModuleCat.of Aᵐᵒᵖ (LinearMap.ker ε)
  | n + 2 => ModuleCat.of Aᵐᵒᵖ (LinearMap.ker (d n))

variable (hε : Function.Surjective ε)
variable (h₀ : LinearMap.range (d 0) = LinearMap.ker ε)
variable (h : ∀ n, LinearMap.range (d (n + 1)) = LinearMap.ker (d n))

/-- Exactness identifies the module presented by `Pₙ₊₁ → Pₙ` with `ΩⁿE`. -/
noncomputable def presentationCokernelEquivSyzygy (n : ℕ) :
    presentedModule (d n) ≃ₗ[Aᵐᵒᵖ] syzygy P d E ε n := by
  match n with
  | 0 =>
    exact (Submodule.quotEquivOfEq _ _ h₀).trans (ε.quotKerEquivOfSurjective hε)
  | 1 =>
    exact ((Submodule.quotEquivOfEq _ _ (h 0)).trans (d 0).quotKerEquivRange).trans
      (LinearEquiv.ofEq _ _ h₀)
  | n + 2 =>
    exact ((Submodule.quotEquivOfEq _ _ (h (n + 1))).trans
      (d (n + 1)).quotKerEquivRange).trans (LinearEquiv.ofEq _ _ (h n))

/-- The categorical form of the cokernel-to-syzygy identification. -/
noncomputable def presentationCokernelIsoSyzygy (n : ℕ) :
    presentedModule (d n) ≅ syzygy P d E ε n :=
  (presentationCokernelEquivSyzygy P d E ε hε h₀ h n).toModuleIso

end Transpose
end FindimCounterexample
