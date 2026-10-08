/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import Mathlib.CategoryTheory.Abelian.Projective.Ext

/-!
# Ext vanishing and exactness of the Hom complex

For any projective resolution, Mathlib identifies positive-degree Ext classes
with cocycles modulo coboundaries. In degree zero, Ext is Hom, and the
augmentation is the cokernel of the first differential. Together these facts
identify vanishing in every nonnegative degree with exactness of the Hom complex,
including injectivity at its first term.
-/

open CategoryTheory CategoryTheory.Abelian CategoryTheory.Limits

namespace FindimCounterexample.ResolutionExt

universe w v u

variable {C : Type u} [Category.{v} C] [Abelian C] [HasExt.{w} C]
variable {X Y : C} (R : ProjectiveResolution X)

/-- Vanishing of degree-zero Ext is equivalent to injectivity at the first
term of the Hom complex of a projective resolution. -/
theorem ext_zero_iff_injective :
    Subsingleton (Ext X Y 0) ↔
      Function.Injective (fun f : R.complex.X 0 ⟶ Y => R.complex.d 1 0 ≫ f) := by
  constructor
  · intro h f g hfg
    change R.complex.d 1 0 ≫ f = R.complex.d 1 0 ≫ g at hfg
    have hz : R.complex.d 1 0 ≫ (f - g) = 0 := by
      rw [Preadditive.comp_sub, hfg, sub_self]
    obtain ⟨k, hk⟩ :=
      CokernelCofork.IsColimit.desc' R.isColimitCokernelCofork (f - g) hz
    have hk₀ : k = 0 := (Ext.mk₀_eq_zero_iff k).mp (h.elim _ _)
    have : f - g = 0 := by
      rw [← hk, hk₀, comp_zero]
    exact sub_eq_zero.mp this
  · intro h
    apply subsingleton_of_forall_eq (0 : Ext X Y 0)
    intro α
    obtain ⟨f, rfl⟩ := (Ext.mk₀_bijective X Y).surjective α
    apply (Ext.mk₀_eq_zero_iff f).mpr
    apply (cancel_epi (R.π.f 0)).mp
    apply h
    change R.complex.d 1 0 ≫ (R.π.f 0 ≫ f) = R.complex.d 1 0 ≫ (R.π.f 0 ≫ 0)
    rw [comp_zero, comp_zero]
    exact (R.complex_d_comp_π_f_zero_assoc f).trans zero_comp

/-- Positive-degree Ext vanishes precisely when every Hom cocycle in that
degree is a coboundary. -/
theorem ext_succ_iff_cocycles_boundaries (n : ℕ) :
    Subsingleton (Ext X Y (n + 1)) ↔
      ∀ f : R.complex.X (n + 1) ⟶ Y,
        R.complex.d (n + 2) (n + 1) ≫ f = 0 →
          ∃ g : R.complex.X n ⟶ Y, R.complex.d (n + 1) n ≫ g = f := by
  constructor
  · intro h f hf
    exact (R.extMk_eq_zero_iff f (n + 2) rfl hf n rfl).mp (h.elim _ _)
  · intro h
    apply subsingleton_of_forall_eq (0 : Ext X Y (n + 1))
    intro α
    obtain ⟨f, hf, rfl⟩ := R.extMk_surjective α (n + 2) rfl
    exact (R.extMk_eq_zero_iff f (n + 2) rfl hf n rfl).mpr (h f hf)

/-- Ext vanishes in every nonnegative degree if and only if the Hom complex
of the projective resolution is exact, starting with an injective map. -/
theorem ext_vanishing_iff :
    (∀ n : ℕ, Subsingleton (Ext X Y n)) ↔
      Function.Injective (fun f : R.complex.X 0 ⟶ Y => R.complex.d 1 0 ≫ f) ∧
        ∀ (n : ℕ) (f : R.complex.X (n + 1) ⟶ Y),
          R.complex.d (n + 2) (n + 1) ≫ f = 0 →
            ∃ g : R.complex.X n ⟶ Y, R.complex.d (n + 1) n ≫ g = f := by
  constructor
  · intro h
    exact ⟨(ext_zero_iff_injective R).mp (h 0),
      fun n => (ext_succ_iff_cocycles_boundaries R n).mp (h (n + 1))⟩
  · rintro ⟨h₀, h⟩ (_ | n)
    · exact (ext_zero_iff_injective R).mpr h₀
    · exact (ext_succ_iff_cocycles_boundaries R n).mpr (h n)

end FindimCounterexample.ResolutionExt
