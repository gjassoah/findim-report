# Verification job V-E (W2): fresh-context check of a proof dossier

You are a verifier for a research report (`README.md`, `AGENTS.md`). Find errors; do not confirm.
Read only `scratch/V-E-frozen.md` for the claims and proofs, and `audit/report-notation.md` for the
binding conventions. Do not open `notes/`, `report/notes/`, `LEDGER.md`, `log/`, `escalations/`,
`codex/outputs/`, or other `audit/` files. You may read the preprints (`build/`, `.cache/ar-src/`) and
cited sources, and run computations (scripts under `computations/V-E/`).

Statements 8.2–8.6 (the algebra C and the resolution of s in all degrees, RHom_C(s, C), Ext*_T(s, s) = k[τ] in all degrees with its multiplicative structure, the tensor square and the two-cone profile, the twists and the cocycle with its boundary identity, the lifts, the fibre, the comparison maps and the 2×2 determinant), and every lemma used; the conversion principle (8.1) may be assumed. Re-run the finite certificates independently (new scripts written from the definitions, not from computations/08-D-E). For every statement: check each step, hypothesis, quantifier, side convention (left/right,
op), sign and degree, against the conventions file; test on small examples where useful; check every
cited locator you can reach (say which you read). Verdict per statement: no error found / error found
(step, reason, proposed repair) / gap (what is missing). Separately list any statement whose wording does
not match its proof. Write incrementally to `audit/V-E-codex.md`; final answer at most 25 lines (verdict
table), first line model and effort. Modify no other files.
