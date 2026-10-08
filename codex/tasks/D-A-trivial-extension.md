# Dossier job D-A: trivial extensions, simulation, the main theorem (report §4.1–4.2, §7.1–7.2)

Sources: the main preprint, `build/sections/05-ordinary-simulation.tex` and
`06-square-zero-and-conclusion.tex`; Minamoto–Yamaura, *Homological dimension formulas for trivial
extension algebras* (Library: `MY17 - Homological Dimension Formulas for Trivial Extension Algebras.pdf`,
arXiv:1710.01469v1) for comparison and attribution (read the statements you cite; give locators in v1).

Results: 4.1 (bar decomposition Δ ⊗ᴸ_A N ≃ ⊕_r Φ^r N[r] for A = Δ ⋉ X and N inflated from Δ, with all
signs; no flatness assumption on X); 4.2 (detection: if gldim Δ < ∞ on both sides then Φ^t N ≃ 0 ⇒
pd_A N < ∞, and Φ^r N ≄ 0 ⇒ pd_A N ≥ r; state and, if feasible, prove the converse/upper bound
pd_A N ≤ sup_r (pd_Δ Φ^r N + r) or cite MY exactly); 7.1 (simulation: K_l, W, the bimodules O and Y,
Δ = B × (B ⊗ K_l), gldim bound, Y ⊗ᴸ O ≃ P[b] with the sign isomorphism, Φ² ≃ P[b] ⊗ᴸ − on the first
factor); 7.2 (the main theorem: assembling selection, realisation, simulation and detection into
2m − 2 ≤ pd N_m < ∞ for a single A; check the quantifier order and the claimed bound 2m − 2 carefully).
Use the results of job D-B (realisation) as black boxes with their statements from the outline; do not
reprove them.

Output: `report/notes/proofs/D-A-trivial-extension.md`; issues in `audit/D-A-preprint-issues.md`.

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
