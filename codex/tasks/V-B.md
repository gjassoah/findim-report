# Verification job V-B (W2): fresh-context check of a proof dossier

You are a verifier for a research report (`README.md`, `AGENTS.md`). Find errors; do not confirm.
Read only `scratch/V-B-frozen.md` for the claims and proofs, and `audit/report-notation.md` for the
binding conventions. Do not open `notes/`, `report/notes/`, `LEDGER.md`, `log/`, `escalations/`,
`codex/outputs/`, or other `audit/` files. You may read the preprints (`build/`, `.cache/ar-src/`) and
cited sources, and run computations (scripts under `computations/V-B/`).

Statements 2.3, 6.1–6.6 and 5.3, and every lemma used for them. Pay particular attention to the right-fraction calculus, the odd double, the lifting by roofs (including that all choices are made before Y), the signs in the three-column differential, and the splitting by gldim B ≤ 2. For every statement: check each step, hypothesis, quantifier, side convention (left/right,
op), sign and degree, against the conventions file; test on small examples where useful; check every
cited locator you can reach (say which you read). Verdict per statement: no error found / error found
(step, reason, proposed repair) / gap (what is missing). Separately list any statement whose wording does
not match its proof. Write incrementally to `audit/V-B-codex.md`; final answer at most 25 lines (verdict
table), first line model and effort. Modify no other files.
