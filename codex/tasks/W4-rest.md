# Verification job W4-rest: sections 1, 2, 3, 10 and appendices B, C against their sources

You are a verifier for a research report (`README.md`, `AGENTS.md`). Find errors; do not confirm.

Read `report/sections/01-introduction.tex`, `02-preliminaries.tex`, `03-criteria.tex`, `10-obstructions.tex`,
`A2-verification.tex`, `A3-companion.tex` (LaTeX; macros in `report/main.tex`), and as sources:
`report/notes/proofs/C-1-criteria.md` (verified dossier for sections 2–3), 
`report/notes/proofs/C-2-C-3-explicitness-and-obstructions.md` (section 10), `audit/12-one-factor-search-codex.md`
§2 (the Tate-duality obstruction), `audit/11-weight-argument-codex.md` (weights), `audit/06-testbed-lambda0-codex.md`,
`audit/08-candidate1-codex.md` (computations of section 10), `LEDGER.md` and `report/PROGRESS.md` (for appendix B
only), `audit/report-notation.md`, and the statements of the other sections that these sections reference.
You may read cited sources: library PDFs for AR75a, CB19, Hap90, GLS23, Sch07a, Lin12a, MY20; the
preprints (`build/`, `.cache/ar-src/`, `.cache/companion-src/`).

Check, for every numbered statement, proof, remark and every claim in the introduction:
1. hypotheses, quantifiers, sides (left/right, op), signs; nothing claimed beyond what is proved here or in a
   cited result with a correct locator;
2. every step of every proof (in particular prop:one-cone, prop:one-factor, thm:tate-obstruction and its use
   of Tate duality and the juggling lemma with the report's graded convention; all of section 3);
3. that the introduction states every result exactly as the body proves it (no strengthening), and that
   every cross-reference points to the intended statement;
4. that the computational statements of section 10 match the audits (dimensions, fields, ranges);
5. that appendix B describes the record accurately (models, efforts, verdicts, Lean versions and the exact
   formal statements: read the Lean sources in
   `findim-counterexample-formalisation/FindimCounterexample/`);
   and that appendix C describes the companion preprint accurately;
6. unsupported or overstated interpretive sentences.

Verdict per block: no error found / error found (location, reason, proposed minimal repair as a diff) / gap /
unsupported claim. Write incrementally to `audit/W4-rest-codex.md`; final answer at most 25 lines, first line
model and effort. Modify no other files.
