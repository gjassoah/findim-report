# Codex job 10: the two-factor construction with minimal resolutions (fallback line)

Context: `README.md`, `AGENTS.md`. Reuse `computations/02-ar-finite-data/` to `computations/05-candidate1/`
(your own earlier code: C, T, the cone, lifts, fibre, triangular algebra, Ext computations). The AR
preprint (`.cache/ar-src/`, sections 05-cones, 06-lift, 07-branches) builds A = T ⊗ T, X = s ⊗ s, a
two-cone bimodule 𝒞, lifts U_{H_i} → 𝒞[3], and the fibre F, using bar resolutions; that makes dim F ≈ 10³⁵.
Do not open `notes/`, `escalations/`, `log/`, `LEDGER.md`.

Goal: rebuild the same construction with **minimal** (or at least small) bimodule representatives —
e.g. tensor products of the one-factor minimal data, cosyzygies over A^e computed minimally, projective
covers instead of free modules of rank dim 𝒴 — and measure and test it:
1. dim of each intermediate object, dim F, dim Λ = 2·400 + dim F, dim Z.
2. Over F_{2^n} (n ≥ 16) with random q, H₁, H₂ of large order: Ext^a_Λ(Z, Z) and Ext^a_Λ(Z, Λ) for
   a = 1, 2 (3 if cheap); expected 0 if the preprint is right. Also the comparison map δ⁰ (kernel and
   cokernel) and the stable profile at X of the two-cone bimodule for −4 ≤ a ≤ 7.
3. If Λ and Z exist with these properties, the number of simple modules of End_Λ(Λ ⊕ Z′) for an
   indecomposable nonprojective summand Z′ of Z (expected 9) and its dimension (if computable).

Bound: stop when a single linear system exceeds about 2·10⁶ unknowns or after the degree-2 checks;
report sizes and where it stopped. Record every place where the minimal version differs from the
preprint's bar version and why the difference is harmless (stable equivalence, projective summands).
Output: `computations/06-two-factor/` (headers, "Codex job 10"), running report
`audit/10-two-factor-codex.md`. Final answer ≤ 25 lines, first line model and effort. Modify no other files.
