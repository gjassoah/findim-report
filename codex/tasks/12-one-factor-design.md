# Codex job 12: a one-factor design escaping the weight obstruction (search and test)

Context: `README.md`, `AGENTS.md`. Read `escalations/02-one-factor-fix.md` (the question),
`escalations/02-answer-fable.md` §2 (Fable's partial answer; untrusted, check it), `notes/03-search-results.md`,
`audit/11-weight-argument-codex.md` §4 (6-dimensional example with a nonzero bracket), and your own code in
`computations/02-…` to `computations/05-…`. Do not open `log/` or `LEDGER.md`.

Background in one line: the AR preprint's conversion principle needs, for a symmetric algebra T′ and a simple
s with Ext*_{T′}(s, s) = k[τ′] (polynomial, |τ′| = 3 or d + 1 ≥ 3), a one-parameter family of twists acting on
τ′^m by distinct characters, and a NONZERO Toda bracket c = ⟨τ′, β₀, β₀⟩; Fable's §2 says that for graded T′
with symmetric form in degree N this requires internal degree δ(τ′) = −2N, impossible for trivial
extensions built by the AR mechanism (δ(τ) = −1).

Tasks, in order, with a stopping rule after each:
1. Check Fable's §2.1–2.4 quickly against your earlier computations (weights of τ, β₀; the claim that every
   homogeneous triple bracket over the AR pair contains 0). Record verdicts.
2. Find up to three concrete candidate pairs (T′, s) satisfying: T′ symmetric (finite-dimensional, small:
   dim ≤ 60 preferred), s simple with Ext*(s, s) = k[τ′] polynomial (check dimensions in degrees ≤ 12),
   a twist family acting on τ′ by a nontrivial character (needed for the 2 × 2 determinant), and
   δ(τ′) + 2δ(β₀) = 0 (or no grading obstruction at all). Ideas to try: symmetric algebras whose form lives
   in degree N ≥ 2 (e.g. iterated or "higher" trivial extensions, Brauer-graph-type or twisted trivial
   extensions, A ⊗ B of symmetric algebras with s ⊗ s and a diagonal twist), modifications of C, or
   cyclic-quiver constructions with parameter-shifting syzygies. Justify each choice briefly.
3. For each candidate: compute c = ⟨τ′, β₀, β₀⟩ exactly or over F_{2^n} with parameters of large order.
4. For the first candidate with c ≠ 0: build the one-factor design (cone of τ′, lifts of twists, fibre F,
   Λ₁ = [[T′,0],[F,T′]], Z) as in job 08 and compute Ext^a(Z, Z) and Ext^a(Z, Λ₁) for a = 1, 2, 3, the dims
   of F, Λ₁, Z and the number of simple modules.

Stop at the first success of step 4 (report it in full), or when all candidates you can find fail, or when a
system exceeds ~10⁶ unknowns. "No candidate found within these bounds" is a valid outcome; say what was
tried. Output: `computations/07-one-factor-search/` (headers, "Codex job 12"), running report
`audit/12-one-factor-search-codex.md`; final answer ≤ 30 lines, first line model and effort. Modify no
other files.
