GPT-6 (Codex), effort unknown.

# Job 15 support record: Lemma 6.1

Scope: both finite-family parts of `lemma:fractions`, in the isolated stage3c
Lean worktree. Status: AI-proved, directly compiled with warnings as errors;
full-stage acceptance gates pending root-job integration. Not author-certified.

## Sources and conventions

Read the exact statement and proof at `report/sections/06-realisation.tex`,
lines 45–105, the Section 6 inventory and the task instructions. Lean writes
composition from left to right: the paper's `q(f)q(u)⁻¹` is
`(Localization.isoOfHom L W u hu).inv ≫ L.map f`.

Pinned Mathlib search (`0df444a360eaa60ab8c11dca51a86af692955474`):

- `CategoryTheory/Localization/CalculusOfFractions.lean` defines
  `MorphismProperty.RightFraction`, `HasRightCalculusOfFractions` (line 207),
  and the Ore refinement `LeftFraction.exists_rightFraction` (line 230).
- The same file supplies `Localization.exists_rightFraction` (line 966),
  `RightFraction.map_s_comp_map`, and `MorphismProperty.map_eq_iff_precomp`
  (line 984). These will be reused rather than rebuilding localisation.
- `MorphismProperty.comp_mem` supplies closure of denominators under
  composition; the calculus-of-fractions class includes identities.
- `Preadditive/AdditiveFunctor.lean` provides the zero-preservation instance
  for additive functors. The paper assumes linear categories and functors,
  hence this hypothesis is available without any strengthening.

The proof uses finite-set induction, dependent target objects and
an explicit identity denominator at the empty family. For part 2 it applies
`map_eq_iff_precomp` successively, avoiding a finite-biproduct hypothesis.

## Formal statements and correspondence

All declarations live in `FindimCounterexample.Stage3cFractions`. The common
context is arbitrary categories `C`, `D`, a functor `L : C ⥤ D`, a morphism
property `W : MorphismProperty C`, and Mathlib's assumptions
`[L.IsLocalization W] [W.HasRightCalculusOfFractions]`.

1. `exists_common_denominator_finset` takes `s : Finset ι`, `X : C`,
   `Y : ι → C` and `γ : ∀ i, L.obj X ⟶ L.obj (Y i)` and returns
   `∃ (X' : C) (u : X' ⟶ X), W u ∧
   ∀ i ∈ s, ∃ f : X' ⟶ Y i, L.map u ≫ γ i = L.map f`.
   The empty-set case uses `X' = X` and `u = 𝟙 X` explicitly.
2. `exists_common_denominator`, for `[Finite ι]`, returns
   `∃ (X' : C) (u : X' ⟶ X) (hu : W u) (f : ∀ i, X' ⟶ Y i),
   ∀ i, γ i = (Localization.isoOfHom L W u hu).inv ≫ L.map (f i)`.
   This is Lemma 6.1(1), with the numerators supplied as an actual dependent
   family. It applies to an empty index type.
3. `exists_equalising_denominator_finset` takes source families `f g`,
   together with `L.map (f i) = L.map (g i)` for `i ∈ s`, and returns a
   denominator `u` with `u ≫ f i = u ≫ g i` for all `i ∈ s`.
   Its empty-set denominator is again explicitly `𝟙 X`.
4. `exists_equalising_denominator` is the same conclusion for an arbitrary
   finite index type. This strengthens the simultaneous annihilation claim
   to equality and does not need additive structure.
5. `exists_annihilating_denominator` additionally assumes `[Preadditive C]`,
   `[Preadditive D]`, `[L.Additive]`. Given `[Finite ι]`,
   `g : ∀ i, X ⟶ Y i` and `h : ∀ i, L.map (g i) = 0`, it returns
   `∃ (X' : C) (u : X' ⟶ X), W u ∧ ∀ i, u ≫ g i = 0`.
   This is Lemma 6.1(2), including the empty family.

The common-denominator induction combines the existing denominator with a
right fraction for the next map using `LeftFraction.exists_rightFraction`.
The simultaneous-equality induction precomposes one more equality and uses
`map_eq_iff_precomp`; the denominator remains in `W` by `W.comp_mem`.

## Departures for integration in the stage report

- Generalisation: no triangulated-category, essential-smallness or Verdier
  subcategory assumptions are needed once `L.IsLocalization W` and
  `W.HasRightCalculusOfFractions` are supplied. Part 2 uses preadditive
  categories and an additive functor; the report's linear assumptions imply
  these, with no extra mathematical hypothesis.
- Proof route: simultaneous annihilation follows from finite simultaneous
  equalisation, avoiding the report's replacement by a finite biproduct.
  This removes any need to assume finite biproducts.
- No claim of Lemma 6.1 is omitted or weakened.

## Current evidence

Both imported Mathlib modules were already cached. No package source or
package build output was modified. The completed file has 112 lines.

Direct check, run in the stage3c worktree on 2026-10-08:

```text
lake env lean -DautoImplicit=false -DwarningAsError=true \
  -Dweak.linter.mathlibStandardSet=true FindimCounterexample/Stage3cFractions.lean
exit code: 0
output: empty
```

The only initial compiler issue was Mathlib's style linter preferring `let`
over `letI` inside a proposition; both occurrences were corrected and the
command rerun successfully. No mathematical gap remains for item 1.
Full-stage gates belong to the root job after import and audit integration.
Correspondence review by the implementing model is not an independent review.
