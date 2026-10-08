# Progress

## Current phase

Part II complete, 2026-10-08. Report: 53 pages, title and byline as decided by Gustavo, red notice on every
page, caveat lector, final prose pass, no draft markers, clean compile; the bibliography cites the published
versions Lin13, San22, GLS24 (MathSciNet BibTeX; locators re-read in the published PDFs, all unchanged).
Lean stages 3a, 3b, 3c, 4a (conditional) and 4b formally verified in Lean (Lean repository `main` at `103c2b4`).
Public repository `../findim-report` built by `tools/make_public_repo.sh` as a single snapshot commit (no
remote; without the preprint and six page images; `PREPRINT.md` with the link pinned to `openai/math` commit
`adc7f12` and SHA-256 checksums, all ten files checked against upstream; compiled report added).

## Waiting for Gustavo

1. The push of `../findim-report` to `gjassoah/findim-report`: on hold at his request (2026-10-08).
2. Lean: stages 3a, 3b, 3c, 4a (conditional), 4b done (Lean `main` at `103c2b4`, all gates pass). Stage 3d
   not approved. The report (Appendix B, Appendix D) describes all of them.

## Running jobs

None.

## Decisions made by Claude

- 2026-10-08: after three output-limit failures of consult 02, its remaining questions moved to Codex (job 12). No further Fable calls planned.

- 2026-10-07: Codex recommendations adopted as recorded in `docs/PLAN.md`, "Amendments".
- 2026-10-07: stray transcript exports git-ignored, not deleted (Q2).
- 2026-10-07: the usage-limit detection is tested only on a mock; the first real limit event will be kept.

## Model attribution

| Date | Model, effort | Unit of work | Output |
|---|---|---|---|
| 2026-10-07 | Claude Opus 5.5 | Reading the preprint; plan; setup; summaries of research, Lean and code rules | `docs/PLAN.md`, `docs/WORKING_RULES.md`, root files |
| 2026-10-07 | Claude Sonnet (subagent) | Draft summaries of the writing, style, review and LaTeX rules (checked by Opus) | `docs/WORKING_RULES.md` (last four sections) |
| 2026-10-07 | Claude Sonnet (subagent) | Literature watch (retrieval only) | `audit/literature-watch.md` |
| 2026-10-07 | Codex GPT-6 Astra, medium | Workflow critique (job 01) | `codex/outputs/01-workflow-critique.md` |
| 2026-10-07 | Claude Opus 5.5 | Notes 01–02: interface of the preprint, O.2–O.5 | `notes/` |
| 2026-10-07 | Codex GPT-6 Astra, high | Independent verification of O.2–O.4, literature (job 02) | `audit/02-verification-codex.md` |
| 2026-10-07 | Claude Sonnet (subagent) | Computer check of the preprint's group quotients (checked by Opus) | `computations/01-selection-quotients.*` |
| 2026-10-07 | Codex GPT-6 Astra, high | Verification of O.5; size of the AR algebra (job 03) | `audit/03-verification-O5-codex.md` |
| 2026-10-07 | Claude Fable 5.1 | Escalation 01: mechanisms, Lemmas F.1–F.3, candidates | `escalations/01-answer-fable.md` |
| 2026-10-07 | Codex GPT-6 Astra, high | Jobs 04 (AR finite data), 05 (Fable lemmas), 06 (test bed), 07 (scalar c) | `audit/04–07-*` |
| 2026-10-07 | Claude Opus 5.5 | Lean stage 1, gate script, design | Lean repository; `lean/` |
| 2026-10-07 | Codex GPT-6 Astra, high | Jobs 08 (Candidate 1), 09 (Lean stage 2), 10 (two-factor), 11 (weight argument) | `audit/08–11-*` |
| 2026-10-08 | Claude Fable 5.1 | Consult 02 (incomplete: §2 only) | `escalations/02-answer-fable.md` |
| 2026-10-08 | Codex GPT-6 Astra, max | Job 12: one-factor search, Tate-duality obstruction OF.1 | `audit/12-one-factor-search-codex.md` |
| 2026-10-08 | Claude Opus 5.5 | Check of OF.1; final report | `notes/03`, `REPORT.md` |
| 2026-10-08 | Codex GPT-6 Astra, ultra/max | Part II proof dossiers D-A … D-E and their fresh verifications V-A … V-E, V-C1, V-C23 | `report/notes/proofs/`, `audit/V-*` |
| 2026-10-08 | Claude Opus 5.5 | Part II: outline, conventions, notes C-1/C-2/C-3, all drafted prose of `report/`, judgement of all verdicts and proposals | `report/`, `audit/report-review.md` |
| 2026-10-08 | Codex GPT-6 Astra, ultra | W4 section checks (W4-05, -06, -0407, -0809, -rest); W5 block-by-block review (W5a–c) | `audit/W4-*`, `audit/report-review-W5*` |
| 2026-10-08 | Codex GPT-6 Astra, high | Appendix A inventory (45 reruns); Lean feasibility inventory | `report/notes/appendix-A-inventory.md`, `lean/FEASIBILITY-report-inventory.md` |
| 2026-10-08 | Claude Opus 5.5 | Lean feasibility evaluation; finalisation | `lean/FEASIBILITY-report.md` |
| 2026-10-08 | Codex GPT-6 Astra, ultra | Lean stage 3a (job 13) | Lean repository `394efc3`, `audit/13-lean-stage3a-codex.md` |
| 2026-10-08 | Codex GPT-6 Astra, high | AI-prose audit (P-prose) and application of the adopted proposals (P-apply) | `audit/P-prose-codex.md`, `audit/P-apply-codex.md` |
| 2026-10-08 | Claude Opus 5.5 | Gustavo's final decisions (title, byline, notice, caveat lector), prose decisions, MathSciNet entries, sanitised repository | `report/`, `library.bib`, `tools/make_public_repo.sh` |
| 2026-10-08 | Codex GPT-6 Astra, ultra | Lean stages 3b, 3c, 4a (conditional), 4b (jobs 14–17) | Lean repository `103c2b4`, `audit/14-…`–`audit/17-…` |
| 2026-10-08 | Claude Opus 5.5 | Review and merge of stages 3b–4b; report updates (Appendix B, displays, inline protection); release preparation | `report/`, `lean/DESIGN.md`, `USAGE.md` |
