# Codex job 08: build Candidate 1 and test it directly (line 3C, definitive test)

Context: `README.md`, `AGENTS.md`. Reuse `computations/02-ar-finite-data/` (C, T = C ⋉ DC, s, cocycle) and,
when it exists, `computations/03-testbed-lambda0/` (triangular algebras and modules over T). The
construction is the one-factor version of the AR preprint's construction (`.cache/ar-src/`, sections
05-cones, 06-lift, 07-branches, which do it for A = T ⊗ T); here A := T. Do not open `notes/`,
`escalations/`, `log/`, `LEDGER.md`.

Construction (one factor; follow the preprint's lemmas with T in place of T ⊗ T, and record every place
where the one-factor version needs a choice):
1. τ ∈ HH³(T) from the preprint's cocycle; a small bimodule representative of 𝒞 = cone(τ : T[−3] → T) in the
   stable category of T-bimodules (push out a minimal bimodule resolution along a cocycle representative);
   N := 𝒞[1] (one bimodule cosyzygy).
2. For H ∈ {H₁, H₂}: the twisted bimodule U_H and a bimodule map g_H : U_H → N lifting the twist, as in the
   preprint's lift lemmas, normalised so that the evaluations g_{H₁} ⊗ s and g_{H₂} ⊗ s agree.
3. F := ker(U_{H₁} ⊕ U_{H₂} ⊕ P(N) → N) (P(N) a projective bimodule cover); Λ₁ := [[T, 0], [F, T]];
   X := s, v : X → F ⊗ X the induced diagonal stable map; Z := (X, Y, ι) as in (conv:finite-module).
Field: F_{2^n} (n ≥ 16), q, H₁, H₂ of large multiplicative order; two random choices.

Compute: dim F, dim Λ₁, dim Z; dim Ext^a_{Λ₁}(Z, Z) and dim Ext^a_{Λ₁}(Z, Λ₁) for a = 1, 2, 3 (further only
if cheap); the stable profile W^a = stable Hom(s, (𝒞 ⊗ s)[a]) for −4 ≤ a ≤ 4; and the comparison map δ⁰ of
the conversion principle with its kernel and cokernel.

Prediction under test (from an untrusted analysis): Ext¹(Z, Z) ≅ k because a certain Toda bracket vanishes
(job 07 found c = 0), while Ext^a(Z, Z) = 0 for a = 2, 3 and Ext^a(Z, Λ₁) = 0. Report whatever you find;
a clean failure is as valuable as success.

Bound: stop after degree 3, or when a single linear system exceeds ~10⁵ unknowns (report sizes). Output:
`computations/05-candidate1/` (headers, "Codex job 08"), running report `audit/08-candidate1-codex.md`,
final answer ≤ 25 lines, first line model and effort. Modify no other files.
