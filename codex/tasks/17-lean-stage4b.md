# Codex job 17: Lean stage 4b (the rank-function obstruction, abstract linear algebra)

Approved by Gustavo on 2026-10-08 (stage 4b of `lean/FEASIBILITY-report.md`): the proof of Proposition 5.4
(`prop:rank-obstruction`) in an abstract linear-algebra setting. This is a reduction: the link to K₀ of a ring
and to the rank functions χ_Y is not part of the stage.

Lean working tree (writable for this job): `findim-worktrees/stage4b`, a git worktree of the Lean repository
`findim-counterexample-formalisation` on branch `stage4b`, created from commit `394efc3` (stages 1, 2 and 3a).
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
existing ones, prefixed with the stage, e.g. "4b.1", so that merging with other stages is unambiguous).

Proof strategy is free, but do not change any statement of the report; if a statement as written is false
or ambiguous in Lean, stop on that item and report it precisely.

Also read `report/sections/05-selection.tex`, from the start of Section 5 to the end of the proof of
Proposition 5.4 (the rank functions, the space 𝒱 and the identities `eq:rank-shift`), and the Proposition 5.4
row of the inventory.

## Goal

State and prove over ℚ (or any field, if no harder) the abstract theorem behind Proposition 5.4:

1. **Linear-algebra core.** Let 𝒱 be a finite-dimensional vector space of dimension r, T an endomorphism of
   𝒱 and v ∈ 𝒱 with 𝒱 spanned by the iterates `T^t v` (t ≥ 0). If a linear functional φ satisfies
   `φ(T^t v) = 0` for all t ≥ t₀ (some t₀), then `φ(T^r v) = 0`. Formalise the report's
   Fitting-decomposition argument or any other proof.
2. **Extinction form.** For a family `d : ι → ℕ → ℕ` (read `d Y t = dim H^t Y`) with `d Y t = φ_Y(T^t v)` for
   functionals φ_Y on 𝒱, and with `d Y t = 0 → d Y (t+1) = 0` (read: H of the zero module is zero), every Y
   with `d Y t = 0` for some t has `d Y t = 0` for all t ≥ r, i.e. extinction time at most r.

Keep the hypotheses minimal and record every one with its informal reading in the report (which
identity of `eq:rank-shift` it stands for). Corollary 5.5 is out of scope.

## Bound and stopping rule

The feasibility estimate is 400–1 200 new lines; stop and report if the stage needs more than about 2 000. If an item needs Mathlib infrastructure that is clearly absent, stop that item, keep only compiling
sorry-free lemmas, report precisely what is missing, and finish the other items. Run `tools/gates.sh` in the
worktree with evidence directory `lean/gates/stage4b-uncommitted` at the end (all five gates), and
after each completed item if the build is long, so that a session cut off by a usage limit leaves a
consistent state.

## Output

A report in this verification repository, `audit/17-lean-stage4b-codex.md` (written incrementally, after each item):
Mathlib searches and reuse decisions, each formal statement with an informal reading, every departure,
line counts, gate results, remaining gaps. Final answer at most 25 lines, first line model and effort.
