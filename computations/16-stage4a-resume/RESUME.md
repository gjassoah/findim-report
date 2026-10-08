GPT-6 (Codex); effort unknown.

# Job 16 prepared repairs (applied on the next resume)

**Final status, 2026-10-08:** the write root was restored, input hashes matched,
and `resume.patch` was applied to the worktree. The build and all five acceptance
gates passed; see `lean/gates/stage4a-uncommitted/` and the final job report.
Do not reapply this historical patch. The remainder of this file records the
previous read-only checkpoint and its reproduction instructions.

The resumed session lacked write access to the stage4a worktree. All files here
are review candidates or source-only checking evidence. No worktree or shared
package was modified, and no Lake build was run in this session.

`resume.patch` repairs Stage4aCone, repairs the audit command's state extraction,
and updates README status and the derived-biproduct explanation. Compare the
worktree against `patch-inputs.json` before applying; this patch is relative to
the already uncommitted stage4a files, not the repository's base commit.

`Stage4aCone.lean` passes source-only Lean with the existing worktree setup:

```sh
lean --setup findim-worktrees/stage4a/.lake/build/ir/FindimCounterexample/Stage4aCone.setup.json computations/16-stage4a-resume/Stage4aCone.lean
```

`check_candidate.py` creates `CombinedCheck.lean` from that candidate, the
unchanged worktree OneFactor source, and the repaired stage4a audit commands.
It runs Lean against the worktree's existing imported objects, with warnings as
errors and standard Mathlib linters. The harness disables only `hashCommand`
for the intentional audit commands, matching the purpose of gate 4; the actual
Statements candidate needs no linter change. It closes Cone's file-scoped
noncomputable section before the next concatenated module. The source-only
check writes no `.olean`, `.ilean`, IR or package artifact.

```sh
python3 computations/16-stage4a-resume/check_candidate.py
```

Both checks passed. `combined-check.log` contains main statement types,
transitive axioms and computed interface-projection uses. This evidence does
not replace fresh module compilation, the exhaustive axiom gate, or replay.

After restoring the worktree as a writable workspace root:

1. Recheck input hashes and apply `resume.patch` in the stage4a worktree.
2. Run `lake build` there; repair any integration-only issues.
3. Run all five gates with the task's `lean/gates/stage4a-uncommitted` directory.
4. Update README and audit/16-lean-stage4a-codex.md with the actual gate receipt.
5. Leave everything uncommitted for Claude's review.

No further interface field was found necessary. Departure 4a.4 (Section 8
comparison and Ext¹ consequence) remains unchanged.
