/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import Mathlib.CategoryTheory.Localization.CalculusOfFractions
import Mathlib.CategoryTheory.Preadditive.AdditiveFunctor

/-!
# Finite families of right fractions

Lemma 6.1 of the report is stated for any localisation admitting a right
calculus of fractions. Finite-set induction gives a common denominator for
maps with varying targets, and a single denominator equalising finitely many
pairs of maps. The latter specialises to simultaneous annihilation in the
preadditive setting. Both inductions start with the identity denominator.
-/

open CategoryTheory CategoryTheory.Category CategoryTheory.Limits

namespace FindimCounterexample.Stage3cFractions

universe w v₁ v₂ u₁ u₂

variable {C : Type u₁} {D : Type u₂} [Category.{v₁} C] [Category.{v₂} D]
variable (L : C ⥤ D) (W : MorphismProperty C)
variable [L.IsLocalization W] [W.HasRightCalculusOfFractions]

/-- A finite set of maps in the localisation has a common denominator.
The empty-set witness is the identity of `X`. -/
theorem exists_common_denominator_finset {ι : Type w} (s : Finset ι)
    {X : C} {Y : ι → C} (γ : ∀ i, L.obj X ⟶ L.obj (Y i)) :
    ∃ (X' : C) (u : X' ⟶ X), W u ∧
      ∀ i ∈ s, ∃ f : X' ⟶ Y i, L.map u ≫ γ i = L.map f := by
  classical
  induction s using Finset.induction_on with
  | empty =>
      exact ⟨X, 𝟙 X, W.id_mem X, by simp⟩
  | @insert i s _ ih =>
      obtain ⟨X', u, hu, hf⟩ := ih
      obtain ⟨φ, hφ⟩ := Localization.exists_rightFraction L W (γ i)
      obtain ⟨ψ, hψ⟩ :=
        (MorphismProperty.LeftFraction.mk u φ.s φ.hs).exists_rightFraction
      refine ⟨ψ.X', ψ.s ≫ u, W.comp_mem _ _ ψ.hs hu, ?_⟩
      intro j hj
      rcases Finset.mem_insert.mp hj with rfl | hj
      · refine ⟨ψ.f ≫ φ.f, ?_⟩
        rw [hψ, L.map_comp, assoc, hφ, φ.map_s_comp_map, L.map_comp]
      · obtain ⟨f, hf⟩ := hf j hj
        refine ⟨ψ.s ≫ f, ?_⟩
        rw [L.map_comp, assoc, hf, L.map_comp]

/-- Lemma 6.1(1): for any finite family, including an empty one, there is
one denominator and an actual family of numerators. -/
theorem exists_common_denominator {ι : Type w} [Finite ι]
    {X : C} {Y : ι → C} (γ : ∀ i, L.obj X ⟶ L.obj (Y i)) :
    ∃ (X' : C) (u : X' ⟶ X) (hu : W u) (f : ∀ i, X' ⟶ Y i),
      ∀ i, γ i = (Localization.isoOfHom L W u hu).inv ≫ L.map (f i) := by
  classical
  let := Fintype.ofFinite ι
  obtain ⟨X', u, hu, hf⟩ := exists_common_denominator_finset L W Finset.univ γ
  choose f hf using fun i => hf i (Finset.mem_univ i)
  refine ⟨X', u, hu, f, fun i => ?_⟩
  rw [← hf i, ← assoc, Localization.isoOfHom_inv_hom_id, id_comp]

/-- Finitely many pairs which become equal in the localisation can all
be equalised by one denominator. The empty-set witness is the identity. -/
theorem exists_equalising_denominator_finset {ι : Type w} (s : Finset ι)
    {X : C} {Y : ι → C} (f g : ∀ i, X ⟶ Y i)
    (h : ∀ i ∈ s, L.map (f i) = L.map (g i)) :
    ∃ (X' : C) (u : X' ⟶ X), W u ∧
      ∀ i ∈ s, u ≫ f i = u ≫ g i := by
  classical
  induction s using Finset.induction_on with
  | empty =>
      exact ⟨X, 𝟙 X, W.id_mem X, by simp⟩
  | @insert i s _ ih =>
      obtain ⟨X', u, hu, heq⟩ := ih (fun j hj => h j (Finset.mem_insert_of_mem hj))
      have hi : L.map (u ≫ f i) = L.map (u ≫ g i) := by
        rw [L.map_comp, L.map_comp, h i (Finset.mem_insert_self i s)]
      obtain ⟨X'', v, hv, hi⟩ :=
        (MorphismProperty.map_eq_iff_precomp L W (u ≫ f i) (u ≫ g i)).mp hi
      refine ⟨X'', v ≫ u, W.comp_mem _ _ hv hu, ?_⟩
      intro j hj
      rcases Finset.mem_insert.mp hj with rfl | hj
      · simpa only [assoc] using hi
      · simpa only [assoc] using congrArg (fun t => v ≫ t) (heq j hj)

/-- The finite-family equalisation criterion uses no additive structure. -/
theorem exists_equalising_denominator {ι : Type w} [Finite ι]
    {X : C} {Y : ι → C} (f g : ∀ i, X ⟶ Y i)
    (h : ∀ i, L.map (f i) = L.map (g i)) :
    ∃ (X' : C) (u : X' ⟶ X), W u ∧ ∀ i, u ≫ f i = u ≫ g i := by
  classical
  let := Fintype.ofFinite ι
  obtain ⟨X', u, hu, heq⟩ :=
    exists_equalising_denominator_finset L W Finset.univ f g (fun i _ => h i)
  exact ⟨X', u, hu, fun i => heq i (Finset.mem_univ i)⟩

variable [Preadditive C] [Preadditive D] [L.Additive]

/-- Lemma 6.1(2): finitely many maps which vanish in the localisation are
annihilated by a single denominator. No finite biproduct hypothesis is needed. -/
theorem exists_annihilating_denominator {ι : Type w} [Finite ι]
    {X : C} {Y : ι → C} (g : ∀ i, X ⟶ Y i)
    (h : ∀ i, L.map (g i) = 0) :
    ∃ (X' : C) (u : X' ⟶ X), W u ∧ ∀ i, u ≫ g i = 0 := by
  obtain ⟨X', u, hu, heq⟩ :=
    exists_equalising_denominator L W g (fun _ => 0) (fun i => by simpa using h i)
  exact ⟨X', u, hu, fun i => by simpa using heq i⟩

end FindimCounterexample.Stage3cFractions
