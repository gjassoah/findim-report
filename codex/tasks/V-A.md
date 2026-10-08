# Verification job V-A (W2): fresh-context check of a proof dossier

You are a verifier for a research report (`README.md`, `AGENTS.md`). Find errors; do not confirm.
Read only `scratch/V-A-frozen.md` for the claims and proofs, and `audit/report-notation.md` for the
binding conventions. Do not open `notes/`, `report/notes/`, `LEDGER.md`, `log/`, `escalations/`,
`codex/outputs/`, or other `audit/` files. You may read the preprints (`build/`, `.cache/ar-src/`) and
cited sources, and run computations (scripts under `computations/V-A/`).

Statements 4.1, 4.2, 7.1 and 7.2, and every lemma used for them. Pay particular attention to the signs in the bar resolution and in the K-flat base change, to whether flatness of X is used anywhere, to the exact projective-dimension formula and the extinction equivalence, to the global-dimension bounds of the simulating algebra, and to the order of the quantifiers in the assembly (one algebra, unbounded finite projective dimensions; the bound 2m-2). For every statement: check each step, hypothesis, quantifier, side convention (left/right,
op), sign and degree, against the conventions file; test on small examples where useful; check every
cited locator you can reach (say which you read). Verdict per statement: no error found / error found
(step, reason, proposed repair) / gap (what is missing). Separately list any statement whose wording does
not match its proof. Write incrementally to `audit/V-A-codex.md`; final answer at most 25 lines (verdict
table), first line model and effort. Modify no other files.
