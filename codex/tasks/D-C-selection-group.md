# Dossier job D-C: the selection group (report §5.2)

Source: the main preprint, `build/sections/02-selection-process.tex`; Santos Rego, *On the finiteness
length of some soluble linear groups* (Library: `Reg19 - …pdf`, arXiv:1901.06704) for the cited
comparison only. Evidence from part I: `computations/01-selection-quotients.{py,out}` (relations in the
finite quotients for m ≤ 6).

Results (all of §5.2): the presentation of G; the finite presentation (fifteen generators; the kernel-lattice
centralisers and the table of integral preimages — check every row); the commutator transfer identity and
independence of z_N from (i, a, b); centrality and z_N² = 1; the automorphism α_G with α_G(z_N) = z_{N+1}
(check that translation preserves every relation, including the conjugation relations); the finite
quotients F_m ⊂ GL₅(𝔽₂[t]/(t^m − 1)) and independence of z₀, …, z_{m−1}; the selection modules Y_m and the
iterate formula H^j(Y) ≅ ₐʲ(e₀⋯e_{j−1}Y); extinction exactly at m. Prove everything in all generality
(the computation only supports small m).

Output: `report/notes/proofs/D-C-selection-group.md`; issues in `audit/D-C-preprint-issues.md`.

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
