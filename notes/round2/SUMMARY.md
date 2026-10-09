# Round 2 summary (branch `verification-round-2`, 2026-10-09)

Nothing here is human verification. Statuses as in `docs/WORKING_RULES.md`. Plan: `docs/PLAN-round2.md`.
Coordination: Claude Sonnet 5.5, then Claude Opus 5.5, who reviewed and corrected the Sonnet part. Second checks: Claude
Opus 5.5 (fresh sessions). Repetition of the original checks and the recheck of edits: Codex GPT-6 Astra.

## Results

| Item | Result | Status | Record |
|---|---|---|---|
| Cross-vendor check, Sections 3–10 | In a blind phase the checker gave its own proof of every statement, except the existence of g_λ (Prop. 9.14), supplied by the report's construction, and Cor. 5.5(3), which rests on [Sch07a] (read in the source: applies). Report's proofs checked step by step: no error; one gap (Cor. 10.5: definedness of the bracket for p > 3) repaired | supported (a model other than the checker of the notes; for Sections 3 and 10 the same model compiled the notes); Cor. 10.5 AI-verified after repair | `audit/cross-vendor-s6-s9.md`, `audit/cross-vendor-rest.md` |
| Recheck of all edits to Sections 3–10 | 16 hunks, no error found | — | `audit/R2-recheck-codex.md` |
| Calibration | 8 of 8 seeded errors found by the original procedure, 0 false alarms | supported (8 seeds) | `audit/calibration.md` |
| OpenAI's Lean statements | faithful encodings; correspondence with Cor. 7.4, Thm 9.17, Cor. 9.18; Thm 3.7 not among them | plausible (two models; Mathlib source read) | `audit/openai-lean-audit.md` |
| Comparator, kernel replay | not run (judged to add little to the understanding of the report); script kept | open | `tools/round2-comparator.sh` |
| Stacks citations | ten checked, one wrong tag corrected | supported | `audit/stacks-tags-round2.md` |
| Wording and record | 'complete proofs' replaced; Lean gate named in README; Appendix B: OpenAI's formalisations, scope, second checks; AI declaration names Sonnet 5.5 and Opus 5.5 for round 2; literature item marked unresolved; PDF 54 pages | — | `report/`, `README.md`, `notes/round2/website-text.md` |

## Open risks, ranked

1. The second checks were blind only by instruction, and the statements outline the proofs; the checker is the model
   that wrote the prose and compiled the notes for Sections 3 and 10. They are evidence of a different kind from the
   original checks, not independent certification.
2. Cited results the proofs use (Minamoto–Yamaura, Tate duality [Lin13], [AR75] as attribution) were read earlier by
   Claude, not re-read in round 2; Appendix A computations were not rerun by a second model.
3. OpenAI's formal proofs are not checked here (Comparator not run); the report says so in Appendix B.
4. Wording items not applied (list in `audit/cross-vendor-rest.md`), e.g. Thm 8.4 needs only self-injectivity.
