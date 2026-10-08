# Codex job 04: recompute the finite data of the Auslander–Reiten preprint (line 3A)

Context: `README.md`, `AGENTS.md`. The explicit Auslander–Reiten counterexample (OpenAI, 2026) is in
`.cache/ar-src/` (read `03-algebra.tex`, `04-resolution.tex`, `09-cochain.tex`, and what they cite). It is an
unverified preprint: test its claims, do not assume them. Do not open `notes/`, `escalations/`, `log/`,
`LEDGER.md`, `codex/outputs/`.

Field: k = F₂(q) (and F₂(q, H) where a twist parameter appears). Use exact arithmetic: Sage (`/usr/bin/sage`,
e.g. `GF(2)['q'].fraction_field()`) or Python with your own polynomial arithmetic over F₂. As an
independent cross-check, also specialise q (and H) to elements of large multiplicative order in a finite
field F_{2^n}; agreement of the two is supporting evidence only.

Check, in this order, and stop at the first claim that fails (report it precisely):

1. The 10-dimensional algebra C: its basis and multiplication table as stated; associativity on all basis
   triples; unit; the idempotents e, f and corner dimensions; the radical N with N⁵ = 0, C/N ≅ k × k; the
   stated nonzero fourth radical product.
2. The simple module s and its minimal projective resolution over C as stated in `04-resolution.tex`
   (the recursion with parameter-shifted maps); check exactness explicitly in degrees 0..8 and check the
   preprint's uniform kernel formula symbolically for general i if it is given as a formula.
3. RHom_C(s, C): compute Ext^i_C(s, C) for i ≤ 8 and compare with the preprint's claim.
4. T = C ⋉ DC: construct it (dim 20), check that it is symmetric (a nondegenerate symmetric associative form),
   and compute dim Ext^a_T(s, s) for a ≤ 9 (claimed: k[τ] with |τ| = 3, i.e. dimension 1 in degrees 0, 3, 6, 9
   and 0 otherwise).
5. The Hochschild cochain table of `09-cochain.tex`: check the stated cocycle and boundary identities, and
   the stated nonzero evaluation (q³ on the cycle given there), as finite computations.

Output: scripts in `computations/02-ar-finite-data/` (one script per item, each with a header: claim,
cases, conventions, author "Codex job 04"), each with its saved output (`.out`). Write a running report to
`audit/04-ar-finite-data-codex.md` (append per item; record which items passed, failed, or were not reached,
and every convention you had to choose). Final answer: at most 25 lines. First line: model and effort if
known. Modify no other files.
