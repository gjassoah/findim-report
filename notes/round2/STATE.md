# Round 2 state (branch `verification-round-2`, closed 2026-10-09)

Plan: `docs/PLAN-round2.md`. Outcome: `notes/round2/SUMMARY.md`. Coordinated by Claude Sonnet 5.5,
then by Claude Opus 5.5, who reviewed the Sonnet part; the work units and models are in `PROGRESS.md`.

## Done

- Task 1: pins (`lean/openai-comparator/pins.sha256`), audit of OpenAI's challenge statements against the classical
  definitions and the report (`audit/openai-lean-audit.md`), re-read by Claude Opus 5.5 with nine corrections
  (`audit/openai-lean-audit-review-opus.md`); text scan of OpenAI's solution sources. Comparator and kernel replay
  not run: first blocked by the missing toolchain and tools, then not run by Gustavo's decision.
- Task 2: two-phase cross-vendor check of Sections 3–10 (`audit/cross-vendor-s6-s9.md`, `audit/cross-vendor-rest.md`);
  one gap (Corollary 10.5) repaired; all edits to Sections 3–10 rechecked by GPT-6 Astra (`audit/R2-recheck-codex.md`).
- Task 3: calibration with eight seeded errors (`audit/calibration.md`, `audit/calibration/`).
- Task 4 and follow-ups: wording ('proofs written out in full (not verified by a human)'), README (Lean gate,
  plan link), Appendix B (second checks, OpenAI's formalisations, scope), Appendix C, Appendix D and the provenance
  comment in `report/main.tex`, `notes/round2/website-text.md`, the literature-watch item marked unresolved,
  Stacks citations (`audit/stacks-tags-round2.md`).
- Tooling: `tools/codex_job.py` option `--workdir` (runs outside the repository, used for the calibration);
  `tools/round2-comparator.sh` (not run).

## Procedure notes

- The blind packages, the seeded copies and the sealed seed list were kept in temporary directories outside the
  repository during the work and deleted afterwards; their hashes and the checkers' outputs are archived in
  `audit/cross-vendor/package.sha256`, `audit/cross-vendor-rest/package.sha256` and `audit/calibration/`.
- The calibration ran `tools/codex_run.sh run <calibration directory>/codex/tasks/CAL-V-{A,B,D,E}.md --effort ultra
  --workdir <calibration directory>`, one command per job, with copies of the original task files `codex/tasks/V-*.md`
  whose output paths were renamed.

## Next

Review by Gustavo, then the release steps in `docs/PLAN-round2.md` (merge, snapshot update, tag `v0.2.0`, push),
each with his approval.
