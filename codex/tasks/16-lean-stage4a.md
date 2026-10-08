# Codex job 16: Lean stage 4a (the obstructions of Section 10, conditional)

Approved by Gustavo on 2026-10-08 (stage 4a of `lean/FEASIBILITY-report.md`): a **conditional** formalisation over an
explicit interface. LEAN_FORMALISATION §2.4 applies: every interface field must be approved by Gustavo.

Lean working tree (writable for this job): `findim-worktrees/stage4a`, a git worktree of the Lean repository
`findim-counterexample-formalisation` on branch `stage4a`, created from commit `394efc3` (stages 1, 2 and 3a).
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
existing ones, prefixed with the stage, e.g. "4a.1", so that merging with other stages is unambiguous).

Proof strategy is free, but do not change any statement of the report; if a statement as written is false
or ambiguous in Lean, stop on that item and report it precisely.

Also read `report/sections/10-obstructions.tex` (all statements and proofs), the parts of
`report/sections/02-preliminaries.tex` it uses (Tate duality `thm:tate-duality` and the pairing after it,
Toda brackets `subsec:toda`), and the Section 10 rows of the inventory.

## The interface (approved fields; nothing else)

Gustavo approved stage 4a as proposed in `lean/FEASIBILITY-report.md`, with exactly these interface fields:

1. a `k`-linear pretriangulated category with finite-dimensional Hom spaces (Mathlib's `Pretriangulated`,
   with `Linear k` and finite-dimensionality of every Hom space; standard);
2. a perfect pairing `Hom(X, Y[a]) × Hom(Y, X[−1−a]) → k` compatible with composition (Tate duality for
   symmetric algebras, report Theorem 2.1, cited from Linckelmann); state the compatibility exactly as the
   report uses it (`⟨ζη, τ⟩ = ⟨ζ, ητ⟩` with the report's composition and shift conventions), and make the
   naturality/shift identifications explicit;
3. for Propositions 10.1–10.3, an object s with `End(s) = k` and a graded endomorphism algebra isomorphic to
   `k[τ]`, `|τ| = 3`, in non-negative degrees (an input describing the example, proved in the report as
   Theorem 9.5).

No other field may be added. In particular no field may state a Toda bracket, the vanishing of a composite,
or an Ext group of the object Z: these must be proved. Toda brackets must be **defined** (by the report's
construction from triangles), not postulated; nonemptiness and the coset law must be proved where used.
Hypotheses that are part of a theorem's own statement in the report (e.g. the Hom vanishings in Theorem
10.4) are hypotheses of the Lean theorem, not interface fields. If a proof seems to need a further field,
stop that item and report the field precisely; Claude will ask Gustavo.

## Goal

Over this interface: Proposition 10.1 (`prop:one-cone`), Proposition 10.2 (`prop:one-factor`; its Ext¹
assertion needs the conversion comparison of §8 — formalise the rank/triangle part and record the Ext¹
clause as a departure if it cannot be stated over the interface), Corollary 10.3 (`coro:one-factor`), Theorem
10.4 (`thm:tate-obstruction`) and Corollary 10.5 (`coro:tate-obstruction`). Remark 10.6 is out of scope.
Bundle the interface as a structure (or typeclasses) in one file, documented field by field with its
informal reading and the report result it stands for; list every field in the README under a heading
"Interface of stage 4a (conditional)".

## Bound and stopping rule

The feasibility estimate is 1 500–3 000 new lines plus a small-to-medium Toda-bracket development; stop and report if the stage needs more than about 5 000. If an item needs Mathlib infrastructure that is clearly absent, stop that item, keep only compiling
sorry-free lemmas, report precisely what is missing, and finish the other items. Run `tools/gates.sh` in the
worktree with evidence directory `lean/gates/stage4a-uncommitted` at the end (all five gates), and
after each completed item if the build is long, so that a session cut off by a usage limit leaves a
consistent state.

## Output

A report in this verification repository, `audit/16-lean-stage4a-codex.md` (written incrementally, after each item):
Mathlib searches and reuse decisions, each formal statement with an informal reading, every departure,
line counts, gate results, remaining gaps. Final answer at most 25 lines, first line model and effort.
