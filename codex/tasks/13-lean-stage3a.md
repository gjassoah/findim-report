# Codex job 13: Lean stage 3a (complete the strong-Nakayama theorem)

Approved by Gustavo on 2026-10-08 (stage 3a of `lean/FEASIBILITY-report.md`; unconditional, down to Mathlib).

Lean repository (writable for this job): `findim-counterexample-formalisation`.
Read its `README.md`, `AGENTS.md`, all of `FindimCounterexample/*.lean` (stages 1 and 2, proved and committed),
`Audit/` and `tools/gates.sh`. In this verification repository read `lean/DESIGN.md`, `lean/FEASIBILITY-report.md`,
`lean/FEASIBILITY-report-inventory.md` (sections A, B and the row for Theorem 3.3), `docs/WORKING_RULES.md`
(section LEAN_FORMALISATION) and the statement and proof of `thm:strong-nakayama` in
`report/sections/03-criteria.tex`. The rules are hard: no `sorry`/`admit`/axioms/`native_decide`, no heartbeat or
recursion changes, transitive axioms ⊆ {propext, Classical.choice, Quot.sound}, files ≤ 1500 lines, warnings as
errors. Do not change `lean-toolchain`, `lakefile.toml`, the manifest, or the statements of stages 1–2. Do not
commit; Claude commits after review.

## Goal

Stage 2 proves the conclusion of Theorem 3.3 of the report from **exactness of the dual complex**. Stage 3a
closes the gap to the informal theorem, which assumes **vanishing of Ext**. Formalise, for an arbitrary ring A
(noncommutative allowed; the report's finite-dimensional algebras are a special case):

1. **Ext of a resolution.** For a right A-module E with a resolution ⋯ → P₁ → P₀ → E → 0 by projective right
   modules (exact at every term, augmentation surjective) and any right module N, the groups
   `Ext^i(E, N)` of Mathlib (the `Abelian.Ext` / derived-category Ext in `ModuleCat Aᵐᵒᵖ`, whichever is the
   standard one at the pinned commit) vanish for all i ≥ 0 if and only if the complex
   0 → Hom(P₀, N) → Hom(P₁, N) → ⋯ is exact (injective at the first map, range = kernel elsewhere).
   Search Mathlib first for an existing comparison between Ext and the cohomology of `Hom` of a projective
   resolution (e.g. `ProjectiveResolution` and its Ext/`leftDerived` API) and reuse it; record what you found.
   If only one direction is reasonably available, prove the direction "Ext vanishing ⇒ exactness" (the one
   the theorem needs), and record the other as a departure.
2. **The theorem with its actual hypothesis.** If moreover the Pₙ are finitely generated, E is nonzero, and
   `Ext^i(E, A) = 0` for all i ≥ 0 (A as a right module over itself), then the dual cokernels Cₙ of stage 2
   are finitely generated left A-modules with `pd Cₙ = n` (in the stage-1/2 form: `HasProjectiveDimensionLE`
   and not `HasProjectiveDimensionLT`), and there are finitely generated left modules of every finite
   projective dimension n ≥ 1. Obtain this by combining item 1 with stage 2; identify the module `Hom(Pₙ, A)`
   used in item 1 with the dual `RingDual.RightDual A (P n)` of stage 2 and the dual maps with
   `dualDifferential`.
3. **Transpose.** Define the transpose of a presentation Q₁ →f Q₀ of right modules as
   `coker(f* : Q₀* → Q₁*)` (the report's convention, `report/sections/02-preliminaries.tex`, conventions), and
   show that for n ≥ 1 the module Cₙ is the transpose of the presentation P_n → P_{n−1} of
   coker(P_n → P_{n−1}) ≅ Ω^{n−1}E (the last isomorphism from exactness). Minimality of the presentation is
   **not** required (Mathlib has no projective covers); record this as a departure: the report's transpose is
   taken for a minimal presentation, and the Lean statement holds for every presentation coming from the
   resolution.
4. **Statements file.** Add the main declarations of items 1–3 to `Audit/Statements.lean` and update the
   README's correspondence table and numbered departures (keep the existing ones).

Choose the formal representation of the resolution to match stage 2 (ℕ-indexed families with exactness
hypotheses), unless the Ext comparison forces a `ChainComplex`/`ProjectiveResolution`; then provide a bridge
from stage 2's representation and explain the choice.

## Bound and stopping rule

New files under `FindimCounterexample/`, imported from `FindimCounterexample.lean`. If after a serious attempt the
Ext comparison of item 1 needs more than about 1500 new lines, stop, keep only compiling sorry-free lemmas, and
report precisely what Mathlib lacks. Run `tools/gates.sh` with evidence directory
`lean/gates/stage3a-uncommitted`
at the end (all five gates).

## Output

A report in this verification repository, `audit/13-lean-stage3a-codex.md` (written incrementally): Mathlib searches
and reuse decisions, each formal statement with an informal reading, every departure, gate results, remaining
gaps. Final answer at most 25 lines, first line model and effort.
