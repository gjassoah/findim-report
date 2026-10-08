# Lean feasibility (Phase 5, early pilot)

Claude Opus 5.5, 2026-10-07. Searched sources, not memory.

## Toolchain

- Lean 4.33.1 and Lake 5.0.0 from the Arch package `lean4-bin` 4.33.1-2.
- Mathlib `0df444a360eaa60ab8c11dca51a86af692955474` (commit date 2026-08-21) is already built locally against
  this toolchain (`.lake` 4.0 GB), with an axiom-audit executable. Plan: the Lean project of this task,
  `findim-counterexample-formalisation`, reuses this pin and the Mathlib cache.

## Mathlib at the pinned commit (files read: `CategoryTheory/Abelian/Projective/Dimension.lean`)

| Needed | Available | Where |
|---|---|---|
| Projective dimension | `HasProjectiveDimensionLT`, `HasProjectiveDimensionLE`, `projectiveDimension` (in `WithBot ℕ∞`) | `CategoryTheory/Abelian/Projective/Dimension.lean` |
| Ext in an abelian category | `Abelian.Ext`, criterion `hasProjectiveDimensionLT_iff` | same, and `Algebra/Homology/DerivedCategory/Ext/Basic.lean` |
| Dimension shift along 0 → X₁ → X₂ → X₃ → 0 with X₂ projective | `hasProjectiveDimensionLT_X₃_iff` (statement still to be read exactly) | same file, line 223 |
| Projective modules | `Module.Projective`, `CategoryTheory.Projective` | `Algebra/Module/Projective.lean` |
| Trivial extensions | `TrivSqZeroExt` not found by the search pattern used; to be searched again | — |

## First assessment

- The abstract part of O.4 (an exact sequence 0 → P⁰ → P¹ → ⋯ of projectives with non-projective first
  cokernel gives pd C_n = n) should be formalisable **unconditionally** with little effort, by induction with
  `hasProjectiveDimensionLT_X₃_iff`.
- The concrete part (a specific algebra, a module E, and the vanishing of Ext^i(E, A) for all i) is
  formalisable unconditionally only if the final construction has an explicit recursive description of the
  minimal resolution of E; this depends on the candidate.
- The trivial-extension mechanism (bar decomposition, derived tensor products) would need theory that the
  pinned Mathlib does not have in usable form; it would be a conditional formalisation.
