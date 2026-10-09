# Plan, round 2: strengthening the verification record (2026-10-09)

Branch `verification-round-2`. Goal: strengthen the verification record of the report without overstating it;
nothing in this round is human verification. The working state is in `notes/round2/STATE.md`, the outcome in
`notes/round2/SUMMARY.md`.

## Tasks and status

| Task | Status | Record |
|---|---|---|
| 1. OpenAI's Lean formalisations: pinning, audit of encodings, correspondence with the report | done; re-read by Opus, nine corrections applied | `audit/openai-lean-audit.md`, `audit/openai-lean-audit-review-opus.md` |
| 1. Comparator and kernel replay | not run (judged to add little to the understanding of the report); script kept | `tools/round2-comparator.sh`, `lean/openai-comparator/` |
| 2. Cross-vendor check, Sections 6 and 9 (blind, then informed) | done; no error; wording points applied | `audit/cross-vendor-s6-s9.md` |
| 2'. Cross-vendor check, Sections 3, 4, 5, 7, 8 and 10 | done; no error; one gap (Corollary 10.5) repaired; all round-2 edits rechecked by GPT-6 Astra, no error found | `audit/cross-vendor-rest.md`, `audit/R2-recheck-codex.md` |
| 3. Calibration with seeded errors | done; 8 of 8 found | `audit/calibration.md` |
| 4. Wording, README gate, literature item, Appendix B, PDF | done | `report/`, `README.md`, `notes/round2/website-text.md` |
| Stacks Project citations | done; one tag corrected | `audit/stacks-tags-round2.md` |

## Not done

Comparator and a kernel replay of OpenAI's proofs (script ready); calibration for the dossiers of Sections 3, 5 and
10; a second-model rerun of the computations of Appendix A; a search of OpenAI's sources for a formalisation of
Theorem 3.7.

## Model allocation

Coordination and judgement: Claude Opus 5.5 (from the review onwards; the first part of the round was coordinated
by Claude Sonnet 5.5 and reviewed by Opus). Second checks: Claude Opus 5.5 in fresh sessions. Repetition of the
original checks: Codex GPT-6 Astra at the original effort. Drafting of packaging and retrieval: Claude Sonnet
subagents, checked before use.
