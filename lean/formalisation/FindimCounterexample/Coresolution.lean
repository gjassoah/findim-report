/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import Mathlib.CategoryTheory.Abelian.Projective.Dimension

/-!
# Projective coresolutions of a projective object give unbounded projective dimension

Let `0 → C₀ → P₀ → C₁ → 0, 0 → C₁ → P₁ → C₂ → 0, …` be short exact sequences in an abelian
category with every `Pₙ` projective, `C₀` projective and `C₁` not projective. Then `Cₙ` has
projective dimension exactly `n` for every `n ≥ 1`.

This is the dimension-shifting half of Proposition O.4 in `notes/02-constraints-and-criteria.md`
of the verification repository: if a nonzero right module `E` satisfies `Ext^i(E, A) = 0` for all
`i ≥ 0`, dualising its minimal projective resolution gives such sequences, so the left
finitistic dimension of `A` is infinite.
-/

open CategoryTheory

namespace FindimCounterexample

variable {𝒞 : Type*} [Category 𝒞] [Abelian 𝒞]

/-- A chain of short exact sequences `0 → c n → p n → c (n + 1) → 0` with projective middle
terms. -/
structure ProjectiveCoresolution (𝒞 : Type*) [Category 𝒞] [Abelian 𝒞] where
  /-- The successive cokernels. -/
  c : ℕ → 𝒞
  /-- The projective middle terms. -/
  p : ℕ → 𝒞
  /-- The inclusions `c n ⟶ p n`. -/
  ι : ∀ n, c n ⟶ p n
  /-- The projections `p n ⟶ c (n + 1)`. -/
  π : ∀ n, p n ⟶ c (n + 1)
  /-- The composites vanish. -/
  w : ∀ n, ι n ≫ π n = 0
  /-- Each short complex is short exact. -/
  shortExact : ∀ n, (ShortComplex.mk (ι n) (π n) (w n)).ShortExact
  /-- The middle terms are projective. -/
  projective : ∀ n, Projective (p n)

namespace ProjectiveCoresolution

variable (R : ProjectiveCoresolution 𝒞)

/-- The `n`-th short exact sequence. -/
abbrev sc (n : ℕ) : ShortComplex 𝒞 := ShortComplex.mk (R.ι n) (R.π n) (R.w n)

/-- Upper bound: if `c 0` is projective, then `c n` has projective dimension at most `n`. -/
theorem hasProjectiveDimensionLE (h₀ : Projective (R.c 0)) (n : ℕ) :
    HasProjectiveDimensionLE (R.c n) n := by
  induction n with
  | zero => exact (projective_iff_hasProjectiveDimensionLE_zero (R.c 0)).1 h₀
  | succ n ih =>
    have := R.projective n
    exact (R.shortExact n).hasProjectiveDimensionLT_X₃ (n + 1) ih
      (hasProjectiveDimensionLT_of_ge (R.p n) 1 (n + 2) (by omega))

/-- Lower bound: if `c 1` is not projective, then `c (n + 1)` does not have projective
dimension `< n + 1`. -/
theorem not_hasProjectiveDimensionLT (h₁ : ¬ Projective (R.c 1)) (n : ℕ) :
    ¬ HasProjectiveDimensionLT (R.c (n + 1)) (n + 1) := by
  induction n with
  | zero => rwa [← projective_iff_hasProjectiveDimensionLT_one]
  | succ n ih =>
    have := R.projective (n + 1)
    rwa [(R.shortExact (n + 1)).hasProjectiveDimensionLT_X₃_iff n inferInstance]

/-- **Exact projective dimension.** If `c 0` is projective and `c 1` is not, then for every
`n ≥ 1` the object `c n` has projective dimension at most `n` and not less than `n`. -/
theorem projectiveDimension_eq (h₀ : Projective (R.c 0)) (h₁ : ¬ Projective (R.c 1))
    (n : ℕ) (hn : 1 ≤ n) :
    HasProjectiveDimensionLE (R.c n) n ∧ ¬ HasProjectiveDimensionLT (R.c n) n := by
  obtain ⟨m, rfl⟩ : ∃ m, n = m + 1 := ⟨n - 1, by omega⟩
  exact ⟨R.hasProjectiveDimensionLE h₀ (m + 1), R.not_hasProjectiveDimensionLT h₁ m⟩

end ProjectiveCoresolution

end FindimCounterexample
