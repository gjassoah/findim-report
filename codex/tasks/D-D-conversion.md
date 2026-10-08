# Dossier job D-D: the conversion principle (report §8.1)

Source: the Auslander–Reiten preprint, `.cache/ar-src/01-stable.tex` and `02-conversion.tex` (and the
cited facts on complete resolutions and triangular matrix algebras it uses). Context: part I tested the
principle on the test bed (`audit/06-testbed-lambda0-codex.md`) and on the one-factor candidate
(`audit/08-candidate1-codex.md`); those are computations, not proofs.

Result 8.1: for a finite-dimensional symmetric algebra (characteristic 2 is allowed; state whether the
proof needs it), a finite bimodule F projective on both sides, a finite module S and a stable map
v : S → F ⊗ S, with δ^a : Êxt^a(S, S)² → Êxt^a(S, F ⊗ S) surjective with nonzero kernel for a = 0 and
bijective for a > 0, the module Z = (S, Y, ι) over Λ = [[E,0],[F,E]] is finite, nonprojective,
Gorenstein-projective, and Ext^a_Λ(Z, Z) = 0 = Ext^a_Λ(Z, Λ) for all a > 0. Write a complete proof:
the triangular-algebra facts (column functors, projectives, complete resolutions), the totally acyclic
complex P_Z = Cone(V), the identification of Z with its cokernel, the computation of Ext^a(Z, Z) through
δ^a, and nonprojectivity. Cite exactly what you use from the literature (with locators read), prove the
rest. Note every place where the hypothesis "symmetric" or "characteristic 2" is used.

Output: `report/notes/proofs/D-D-conversion.md`; issues in `audit/D-D-preprint-issues.md`.

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
