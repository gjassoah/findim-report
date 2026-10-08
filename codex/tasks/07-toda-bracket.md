# Codex job 07: the scalar c (line 3C)

Context: `README.md`, `AGENTS.md`. Reuse `computations/02-ar-finite-data/` (the algebra T = C ⋉ DC over
k = F₂(q), symmetric, dim 20; the simple s at f; Ext^*_T(s, s) has dimension 1 in degrees 3m, verified up to
degree 9 in job 04). Do not open `notes/`, `escalations/`, `log/`, `LEDGER.md`.

Work in the stable module category of T (triangulated, shift [1] = Ω⁻¹). Put H^a = stable Hom(s, s[a]);
over this symmetric algebra one expects H^{3m} = k and H^{−3m−1} = k for m ≥ 0, all other H^a = 0 (check in
the range −7 ≤ a ≤ 7). Let τ ∈ H^3 and β₀ ∈ H^{−1} be generators (β₀ is represented by a module map
s → Ωs; identify it explicitly).

Questions:
1. Confirm the compositions needed for a Toda bracket ⟨τ, β₀, β₀⟩: β₀ ∘ β₀ (as a map s → s[−2], i.e. in H^{−2})
   and τ ∘ β₀ in the appropriate degree vanish (by the H^a pattern they must; verify the degrees).
2. Compute the Toda bracket ⟨τ, β₀, β₀⟩ ⊂ H^{3−1−1−1} = H^0 = k (degree bookkeeping to be done carefully,
   with your conventions stated): construct the cone of τ as a T-module triangle, lift/extend β₀ through it,
   and compose. Determine its indeterminacy and whether the bracket contains 0. Report the resulting
   scalar c (0 or nonzero) for several specialisations of q in F_{2^n} of large order, and exactly over F₂(q)
   if feasible.
3. As an independent second computation of the same quantity, compute the Massey/Toda product
   ⟨β₀, β₀, β₀⟩ ⊂ H^{−4} and report whether it contains 0.

The answer is a single bit (c = 0 or c ≠ 0) plus supporting data; state clearly which conventions it
depends on and whether it is independent of them. Output: scripts and outputs in
`computations/04-toda-bracket/` (headers as usual, "Codex job 07"); running report
`audit/07-toda-bracket-codex.md`; final answer ≤ 25 lines, first line model and effort. Modify no other files.
