# Codex job 06: the near-miss test bed Λ₀ (line 3B)

Context: `README.md`, `AGENTS.md`. The explicit Auslander–Reiten preprint is in `.cache/ar-src/`; its finite
data on C and T = C ⋉ DC were recomputed and passed in Codex job 04: reuse the scripts in
`computations/02-ar-finite-data/` (read them; do not trust them blindly). Do not open `notes/`,
`escalations/`, `log/`, `LEDGER.md`.

Construction to test (it is the preprint's conversion principle, Proposition "Triangular conversion" in
`02-conversion.tex`, applied with the simplest possible bimodule, so that it must FAIL in exactly one way):
- A := T (dim 20, symmetric), X := s (the 1-dimensional simple at f).
- For H ∈ k^×, h_H the algebra automorphism of T fixing C and multiplying DC by H (see `03-algebra.tex`);
  U_H := T with right action twisted by h_H (check the preprint's convention for which side is twisted).
- F := U_{H₁} ⊕ U_{H₂}; Λ₀ := [[T, 0], [F, T]] (dim 80, 4 simples), left modules as triples.
- F ⊗ X ≅ X ⊕ X; v₀ := (id, id) : X → X ⊕ X; i : X → Q an embedding into a projective T-module (the
  indecomposable projective-injective with socle s); Y₀ := (FX ⊕ Q)/{(v₀(x), i(x))}; Z₀ := (X, Y₀, ι) as in
  the preprint's (conv:finite-module).
- Field: F_{2^n} (n ≥ 16) with q, H₁, H₂ chosen of large multiplicative order and H₁^m ≠ H₂^m for small m;
  repeat for two or three random choices. If feasible, also exact over F₂(q, H₁, H₂) in low degrees.

Compute, for a = 0..6 (stop earlier only if the cost explodes; record where):
- dim Hom and Ext^a_{Λ₀}(Z₀, Z₀), dim Ext^a_{Λ₀}(Z₀, Λ₀), dim of the stable endomorphism space of Z₀,
  and the dimensions of the syzygies of Z₀ (Betti numbers).
Expected by the theory (to be tested, not assumed): Ext¹(Z₀, Z₀) one-dimensional, Ext^a(Z₀, Z₀) = 0 for
2 ≤ a ≤ 6, Ext^a(Z₀, Λ₀) = 0 for 1 ≤ a ≤ 6, Z₀ nonprojective. Report any deviation precisely, and check
the intermediate claim that Ext¹(Z₀, Z₀) is the cokernel of δ⁰ (the preprint's comparison map) if you can.

Output: scripts and saved outputs in `computations/03-testbed-lambda0/` (headers: claim, cases,
conventions, "Codex job 06"); running report `audit/06-testbed-lambda0-codex.md`. Final answer ≤ 25 lines,
first line model and effort. Modify no other files.
