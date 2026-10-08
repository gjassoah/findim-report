# Dossier job D-B: realisation by a bimodule complex (report §2.3, §6.1–6.6; optional §5.3)

Sources: the main preprint, `build/sections/03-localization-and-lifting.tex` and
`04-tensor-realization.tex` (also `02-selection-process.tex` for H). Note: `notes/01-how-the-construction-works.md`
and `notes/02-constraints-and-criteria.md` (Remark O.3') for context.

Results: 2.3 (right fractions in the Verdier quotient: the facts actually used, with proofs or exact
citations); 6.1 (quadratic presentation, encoding algebra B, the directed-algebra dimension bound,
modules M(Y)); 6.2 (the action θ and the evaluation functors, factorisation through 𝒬); 6.3 (odd double,
including the K₀ reading: [V] = 0 in K₀(𝒬) while U only exists in the idempotent completion); 6.4 (lifting
a B-diagram from 𝒬 to K^b(proj B); identify precisely where choices are non-constructive and why the
length l of the resulting complex is not controlled); 6.5 (rectification: the three-column complex P, its
differential squares to zero with all signs, the homotopy equivalences ι_i and arrow homotopies); 6.6
(realisation theorem with the splitting from gldim B ≤ 2, and the iterate formula). Then 5.3: decide
whether the generalisation to selection data (R, Ψ), Ψ ≅ εR^n right projective with left action
ρ : R → εM_n(R)ε, goes through verbatim; prove it if so (status), else say exactly what fails.

Output: `report/notes/proofs/D-B-realisation.md`. Also write `audit/D-B-preprint-issues.md` listing issues
found in the preprint (or "none found", with what was checked).

## Common rules for dossier jobs (W2 of `docs/PLAN-part2.md`)

You write a **proof dossier note**: complete, checkable proofs written from scratch for a research report.
Read first: `AGENTS.md`, `audit/report-notation.md` (binding conventions), `report/notes/outline.md`
(numbering, symbols, dependencies), and `docs/WORKING_RULES.md` §AI_RESEARCH_PROCESS (statuses).

- For each result assigned to you: (1) write the statement with every hypothesis, in the report's
  conventions and symbols; (2) **attempt the proof yourself before reading the preprint's proof**; (3) then
  read the preprint's proof, compare, and record every difference, gap, sign or convention issue, or error
  you find in the preprint (precisely and neutrally); (4) write the final proof in checkable steps, each
  justified in place or by a cited result with an exact locator that you have read (otherwise mark
  "locator not verified").
- Never write "clearly", "it is easy to see", "a standard argument shows" for an unchecked step; write
  "GAP:" with what is missing instead.
- Use computation where it helps (Sage/Python, exact arithmetic); scripts go to `computations/` with a
  header, outputs saved; state their scope. A computation never replaces a proof in all degrees.
- Status of each result at the end of your note: AI-proved (you wrote a complete proof), plausible, open,
  or refuted, with the reason. Do not call anything proved or verified.
- Do not copy the preprints' prose; your note is a mathematical dossier (Markdown with LaTeX), not
  manuscript prose.
- Write incrementally (one result per append), so that partial work survives an interruption. Modify only
  the files named in your task and new files under `computations/`. First line of your note and of your
  final answer: model and effort if known. Final answer: at most 30 lines (results, statuses, issues found).
