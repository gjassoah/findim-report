# Review job W5c: autonomous block-by-block review of part of the report

You are the reviewer of an AI-written research article (`report/`, LaTeX; build with latexmk). Read
`README.md` and `AGENTS.md`, then read in full the review protocol
`MATHEMATICAL_DOCUMENT_REVIEW.md` and the style files
`MATHEMATICAL_WRITING_STYLE.md`, `LATEX_PREAMBLE_STYLE.md` and
`AI_WRITING_PROCESS.md` (read only). Apply the protocol in **autonomous mode**, scope:
report/sections/08-conversion.tex, 09-ar-counterexample.tex, 10-obstructions.tex. Read the rest of the article (all of `report/sections/*.tex`) for context, cross-references and
consistency of notation, but edit only the files in your scope; two other reviewers handle the other files
concurrently.

For each block (paragraph, statement, proof, remark, display group) of your scope: check mathematical
correctness (every step, hypothesis, quantifier, sign, degree, side convention, edge case, cross-reference
and citation locator; the conventions are in `audit/report-notation.md` and section 2), typesetting, and
grammar and style against the style files. Do not accept a step because an earlier audit passed it.
Decide and apply directly only: evident slips, typesetting errors, and genuine grammar/style errors under
the style files (no optional polishing, no restructuring). List every change beyond an evident slip —
any change to a statement, hypothesis, proof step, or a claim you consider unsupported — as a
**proposal** with a minimal diff and reasons, without applying it.

Compile into a private directory so as not to disturb the others: from `report/`, run
`latexmk -pdf -outdir=../scratch/W5c-build main.tex`. Record the review in `audit/report-review-W5c.md`
(write incrementally): one table covering every block of your scope (stable anchor: file:line and first
words; status clean / corrected / proposal), then the applied changes as a unified diff summary, then the
proposals. Do not commit. Final answer at most 25 lines, first line model and effort.
