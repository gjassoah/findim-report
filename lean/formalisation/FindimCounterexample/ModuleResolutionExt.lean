/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import FindimCounterexample.ModuleResolution
import FindimCounterexample.ResolutionExt
import Mathlib.Algebra.Category.ModuleCat.Ext.HasExt

/-!
# Ext and the Hom complex of an explicit module resolution

The maps on Hom groups are additive: no commutativity of the coefficient ring
is assumed. Exactness is injectivity at degree zero and equality of the additive
range and kernel in every subsequent degree.
-/

open CategoryTheory CategoryTheory.Abelian

namespace FindimCounterexample.ModuleResolution

universe u v
variable {R : Type u} [Ring R]
variable (P : ℕ → ModuleCat.{v} R) (d : ∀ n, P (n + 1) →ₗ[R] P n)
variable (N : ModuleCat.{v} R)

/-- Precomposition in the additive Hom complex. -/
def homDifferential (n : ℕ) : (P n →ₗ[R] N) →+ (P (n + 1) →ₗ[R] N) where
  toFun f := f.comp (d n)
  map_zero' := rfl
  map_add' _ _ := rfl

variable [Small.{v} R] [∀ n, Module.Projective R (P n)]
variable (h : ∀ n, LinearMap.range (d (n + 1)) = LinearMap.ker (d n))
variable {E : ModuleCat.{v} R} (ε : P 0 →ₗ[R] E)
variable (h₀ : LinearMap.range (d 0) = LinearMap.ker ε) (hε : Function.Surjective ε)

include h h₀ hε

/-- Derived-category Ext vanishes in every degree if and only if the Hom
complex of the supplied projective resolution is exact, including degree zero. -/
theorem ext_vanishing_iff :
    (∀ n : ℕ, Subsingleton (Ext E N n)) ↔
      Function.Injective (homDifferential P d N 0) ∧
        ∀ n, (homDifferential P d N n).range = (homDifferential P d N (n + 1)).ker := by
  have hc : (∀ n : ℕ, Subsingleton (Ext E N n)) ↔
      Function.Injective (fun f : P 0 ⟶ N => ModuleCat.ofHom (d 0) ≫ f) ∧
        ∀ (n : ℕ) (f : P (n + 1) ⟶ N),
          ModuleCat.ofHom (d (n + 1)) ≫ f = 0 →
            ∃ g : P n ⟶ N, ModuleCat.ofHom (d n) ≫ g = f := by
    simpa only [projectiveResolution, complex_d_succ, complex_X] using!
      (ResolutionExt.ext_vanishing_iff
        (projectiveResolution P d h ε h₀ hε) (Y := N))
  rw [hc]
  constructor
  · rintro ⟨hi, he⟩
    constructor
    · intro f g hfg
      apply ModuleCat.hom_ext_iff.mp
      apply hi
      exact ModuleCat.hom_ext hfg
    · intro n
      apply le_antisymm
      · rintro f ⟨g, rfl⟩
        change (g.comp (d n)).comp (d (n + 1)) = 0
        rw [LinearMap.comp_assoc, differential_comp P d h n, LinearMap.comp_zero]
      · intro f hf
        obtain ⟨g, hg⟩ := he n (ModuleCat.ofHom f) (ModuleCat.hom_ext hf)
        exact ⟨g.hom, ModuleCat.hom_ext_iff.mp hg⟩
  · rintro ⟨hi, he⟩
    constructor
    · intro f g hfg
      apply ModuleCat.hom_ext
      apply hi
      exact ModuleCat.hom_ext_iff.mp hfg
    · intro n f hf
      have hf' : f.hom ∈ (homDifferential P d N (n + 1)).ker :=
        ModuleCat.hom_ext_iff.mp hf
      rw [← he n] at hf'
      obtain ⟨g, hg⟩ := hf'
      exact ⟨ModuleCat.ofHom g, ModuleCat.hom_ext hg⟩

end FindimCounterexample.ModuleResolution
