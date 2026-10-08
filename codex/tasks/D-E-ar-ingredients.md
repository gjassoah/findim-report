# Dossier job D-E: the ingredients of the Auslander–Reiten counterexample (report §8.2–8.6)

Source: `.cache/ar-src/03-algebra.tex` to `09-cochain.tex` (and `08-consequences.tex`). Your own earlier
computations are in `computations/02-ar-finite-data/` (C, T, resolution, cocycle), `computations/04-…`
(brackets), `computations/06-two-factor/` (two-cone profile); reuse them as evidence, but every statement
in all degrees needs a proof.

Results: 8.2 (C: multiplication table, radical, simple s; the minimal resolution of s with the parameter
shift, in all degrees, with a proof of exactness and minimality; RHom_C(s, C) concentrated in one degree
with the stated value); 8.3 (T = C ⋉ DC symmetric; Ext*_T(s, s) = k[τ], |τ| = 3, in all degrees,
including the multiplicative structure); 8.4 (E = T ⊗ T, S = s ⊗ s, Ext*_E(S, S) = k[τ₁, τ₂]; the two-cone
bimodule 𝒞 and its profile Êxt^a(S, 𝒞 ⊗ S), all a); 8.5 (twists h_λ, action λ^{−m} on τ^m, the
Hochschild cocycle realising τ with its boundary identity, the lifts E_λ → 𝒞[3] with nonzero evaluation);
8.6 (the fibre F, the stable map v, the comparison maps δ^a and the 2×2 determinant
λ₁^{−m} − λ₂^{−m} ≠ 0 (char 2: +), δ⁰ surjective with nonzero kernel; hence the hypotheses of the
conversion principle (job D-D) hold and Theorem AR follows). Long finite identities (multiplication and
cocycle tables) may be certified by script: give the script, its scope and output, and state exactly what
it certifies.

Output: `report/notes/proofs/D-E-ar-ingredients.md`; issues in `audit/D-E-preprint-issues.md`.

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
