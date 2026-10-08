/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import FindimCounterexample.ModuleResolutionExt
import FindimCounterexample.StrongNakayama

/-!
# The strong-Nakayama criterion from Ext vanishing

For a nonzero right module with a resolution by finitely generated projectives,
vanishing of all Ext groups into the regular module gives finitely generated
left dual cokernels of each positive finite projective dimension.
-/

open CategoryTheory CategoryTheory.Abelian

namespace FindimCounterexample.StrongNakayama

universe u
variable {A : Type u} [Ring A]
variable (P : ℕ → ModuleCat.{u} Aᵐᵒᵖ)
variable (d : ∀ n, P (n + 1) →ₗ[Aᵐᵒᵖ] P n)

/-- Categorical Hom into the right regular module is the stage-2 dual. -/
def homRightDualEquiv (n : ℕ) :
    (P n ⟶ ModuleCat.of Aᵐᵒᵖ A) ≃+ RingDual.RightDual A (P n) where
  toEquiv := ModuleCat.homEquiv
  map_add' _ _ := rfl

/-- The Hom-complex maps into the regular module are precisely the dual maps. -/
theorem homDifferential_eq_dualDifferential (n : ℕ) :
    ModuleResolution.homDifferential P d (ModuleCat.of Aᵐᵒᵖ A) n =
      (dualDifferential P d n).toAddMonoidHom := rfl

variable [∀ n, Module.Projective Aᵐᵒᵖ (P n)]
variable (h : ∀ n, LinearMap.range (d (n + 1)) = LinearMap.ker (d n))
variable {E : ModuleCat.{u} Aᵐᵒᵖ} (ε : P 0 →ₗ[Aᵐᵒᵖ] E)
variable (h₀ : LinearMap.range (d 0) = LinearMap.ker ε) (hε : Function.Surjective ε)

include h h₀ hε

/-- For a projective resolution, Ext vanishing into the regular module is
equivalent to the dual exactness hypotheses of stage 2. -/
theorem ext_vanishing_iff_dual_exact :
    (∀ n : ℕ, Subsingleton (Ext E (ModuleCat.of Aᵐᵒᵖ A) n)) ↔
      Function.Injective (dualDifferential P d 0) ∧
        ∀ n, LinearMap.range (dualDifferential P d n) =
          LinearMap.ker (dualDifferential P d (n + 1)) := by
  rw [ModuleResolution.ext_vanishing_iff P d (ModuleCat.of Aᵐᵒᵖ A) h ε h₀ hε]
  constructor
  · rintro ⟨hi, he⟩
    refine ⟨hi, fun n => ?_⟩
    ext f
    exact SetLike.ext_iff.mp (he n) f
  · rintro ⟨hi, he⟩
    refine ⟨hi, fun n => ?_⟩
    ext f
    exact SetLike.ext_iff.mp (he n) f

variable [∀ n, Module.Finite Aᵐᵒᵖ (P n)] [Nontrivial E]
variable (hExt : ∀ n : ℕ, Subsingleton (Ext E (ModuleCat.of Aᵐᵒᵖ A) n))

include hExt

/-- The strong-Nakayama theorem with its Ext hypothesis: the dual cokernels
are finitely generated and have projective dimension exactly `n` for `n ≥ 1`. -/
theorem projectiveDimension_eq_of_ext (n : ℕ) (hn : 1 ≤ n) :
    Module.Finite A (cok P d n) ∧ HasProjectiveDimensionLE (cok P d n) n ∧
      ¬ HasProjectiveDimensionLT (cok P d n) n := by
  obtain ⟨hi, he⟩ := (ext_vanishing_iff_dual_exact P d h ε h₀ hε).mp hExt
  exact ⟨inferInstance, projectiveDimension_eq P d hi he ε hε
    (ModuleResolution.augmentation_comp P d ε h₀) n hn⟩

/-- Ext vanishing produces finitely generated left modules of every positive
finite projective dimension over an arbitrary ring. -/
theorem unbounded_of_ext : ∀ n : ℕ, 1 ≤ n →
    ∃ M : ModuleCat.{u} A, Module.Finite A M ∧
      HasProjectiveDimensionLE M n ∧ ¬ HasProjectiveDimensionLT M n := by
  intro n hn
  exact ⟨cok P d n, projectiveDimension_eq_of_ext P d h ε h₀ hε hExt n hn⟩

end FindimCounterexample.StrongNakayama
