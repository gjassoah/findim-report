# Codex job 15: Lean stage 3c (abstract lemmas of Section 6)

Approved by Gustavo on 2026-10-08 (stage 3c of `lean/FEASIBILITY-report.md`; unconditional, down to Mathlib).

Lean working tree (writable for this job): `findim-worktrees/stage3c`, a git worktree of the Lean repository
`findim-counterexample-formalisation` on branch `stage3c`, created from commit `394efc3` (stages 1, 2 and 3a).
Its `.lake/packages` is a symlink to the main checkout's built packages: never run `lake update`,
`lake clean` or anything that writes into `.lake/packages`; build with `lake build` in the worktree only.
Other Codex jobs work at the same time in the main checkout (stage 3b) and in sibling worktrees; do not
read or write them. Claude merges the branches after review.

Read the worktree's `README.md`, `AGENTS.md`, `Audit/`, `tools/gates.sh` and skim `FindimCounterexample/*.lean`
(follow their style and naming). In this verification repository read `lean/DESIGN.md`,
`lean/FEASIBILITY-report.md`, the relevant rows of `lean/FEASIBILITY-report-inventory.md` and
`docs/WORKING_RULES.md` (section LEAN_FORMALISATION).

The rules are hard: no `sorry`/`admit`/axioms/`native_decide`, no heartbeat or recursion changes, transitive
axioms ⊆ {propext, Classical.choice, Quot.sound}, files ≤ 1500 lines, warnings as errors. Do not change
`lean-toolchain`, `lakefile.toml`, the manifest, or the statements of earlier stages. Do not commit; Claude
commits after review. New files go under `FindimCounterexample/` with a prefix naming the stage, imported
from `FindimCounterexample.lean`; add the main declarations to `Audit/Statements.lean` and extend the README's
correspondence table and numbered departures (keep the existing ones; number new departures after the
existing ones, prefixed with the stage, e.g. "3c.1", so that merging with other stages is unambiguous).

Proof strategy is free, but do not change any statement of the report; if a statement as written is false
or ambiguous in Lean, stop on that item and report it precisely.

Also read `report/sections/06-realisation.tex`, subsections `subsec:fractions` and `subsec:odd-double`
(statements, proofs, and the definitions they use), and the Section 6 rows of the inventory.

## Goal

1. **Lemma 6.1** (`lemma:fractions`), both items, for a category with a class of morphisms admitting a right
   calculus of fractions, stated with Mathlib's localisation API (`MorphismProperty`, `HasRightCalculusOfFractions`,
   `exists_rightFraction`, `map_eq_iff_precomp`, or whatever the pinned Mathlib provides; search first and
   record what you found). Finite families: include the empty family (identity denominator). Item 2 needs a
   preadditive setting (zero morphisms); use the hypotheses the report uses, no more.
2. **Lemma 6.6** (`lemma:cone-splitting`), in Mathlib's idempotent completion (`Karoubi`) of a
   (pre)triangulated category, with the shift and Hom-exactness facts it needs proved, not assumed. The
   inventory notes that no triangulation of the Karoubi envelope is needed; do not assume one.
3. **Proposition 6.7** (`prop:odd-double`) **without its K₀ clause**: construct the actual objects and the
   isomorphisms the statement asserts (not merely their existence as hypotheses). Record the omitted K₀
   clause as a departure.

## Bound and stopping rule

The feasibility estimate is 1 500–3 500 new lines; stop and report if the stage needs more than about 5 000. If an item needs Mathlib infrastructure that is clearly absent, stop that item, keep only compiling
sorry-free lemmas, report precisely what is missing, and finish the other items. Run `tools/gates.sh` in the
worktree with evidence directory `lean/gates/stage3c-uncommitted` at the end (all five gates), and
after each completed item if the build is long, so that a session cut off by a usage limit leaves a
consistent state.

## Output

A report in this verification repository, `audit/15-lean-stage3c-codex.md` (written incrementally, after each item):
Mathlib searches and reuse decisions, each formal statement with an informal reading, every departure,
line counts, gate results, remaining gaps. Final answer at most 25 lines, first line model and effort.
