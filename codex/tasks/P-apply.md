# Job P-apply: apply the decided prose changes to the report

Read `audit/P-prose-codex.md` (194 proposals, by a previous job) and apply them to `report/main.tex` and
`report/sections/*.tex`, with the following decisions by Claude (binding):

**Rejected (do not apply):**
- All proposals that remove or replace the defined terms **"selection data"** and **"selection functor"** (keep
  `def:selection-data` as it is, keep "selection data" and "selection functor" wherever they occur, including the
  section titles of §5 and §6 and the abstract's "selection functor"; the Terminology rows for `selection data`
  and `selection functor`). Exception: replace "selection diagram" by the diagram $\mathbb V$ as proposed, and
  "selection group" in A1 as proposed.
- In `A4-ai-declaration.tex`: keep the section title and keep the clause "no part of it was written by a human".
- In `A2-verification.tex`: keep "Proof notes and fresh-context verification" as the subsection title.

**Modified:**
- §6.4 heading (`The odd double`): use `A summand and its odd shifts` instead of `Direct sums with odd shifts`.
- `report/main.tex` abstract: apply the proposal for "stable data" only; keep "a selection functor".

**Accepted:** every other proposal, including the terminology index rows other than the rejected ones (apply
the replacement at every listed occurrence, in context, with grammar adjusted). Where proposals overlap, use the
fuller one once. Do not change any mathematical statement, hypothesis, formula, label, citation or reference
target. Where a replacement needs a reference such as `\Cref{thm:conversion}`, check the label exists.

Keep source lines at most 80 columns. Compile from `report/` into a private directory
(`latexmk -pdf -outdir=../scratch/P-apply-build main.tex`): no errors, no undefined references, no new
overfull boxes. Write `audit/P-apply-codex.md`: one line per proposal (applied / rejected per the list /
not applicable, with a reason when not applied). Do not commit. Final answer at most 15 lines, first line model
and effort.
