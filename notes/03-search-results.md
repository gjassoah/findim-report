# 03. Phase 3: search along the Auslander–Reiten route

Claude Opus 5.5, 2026-10-07. Statuses as in `docs/WORKING_RULES.md`. Plan: `docs/PLAN.md`, "Phase 3 decision".

## 1. What has been established

| Item | Result | Status | Evidence |
|---|---|---|---|
| Finite data of the AR preprint on C (dim 10) and T = C ⋉ DC (dim 20) | all checks pass in low degrees | supported | Codex job 04 |
| Near-miss test bed Λ₀ (dim 80, 4 simples), Z₀ (dim 10) | Ext¹(Z₀,Z₀) = k, Ext^{2..6}(Z₀,Z₀) = 0, Ext^{1..6}(Z₀,Λ₀) = 0, Z₀ nonprojective; Ext¹ ≅ coker δ⁰ | supported (degrees ≤ 6) | Codex job 06 |
| Scalar c = ⟨τ, β₀, β₀⟩ for Fable's one-factor Candidate 1 | c = 0 (zero indeterminacy); the lift vanishes because (DC)² = 0 | AI-proved (Codex), exact over 𝔽₂(q) | Codex job 07 |

So the conversion principle behaves as claimed on the test bed, and the one-factor shrink fails at the one
class the cone construction was meant to remove. **Direct test (Codex job 08):** Candidate 1 built
explicitly has dim F = 352, dim Λ₁ = 392 (4 simples), dim Z = 16, and Ext^{1,2,3}(Z, Z) = (1, 0, 0),
Ext^{1,2,3}(Z, Λ₁) = 0, δ⁰ = [[1, 1], [0, 0]] (supported, two samples over 𝔽_{2^16}). It fails exactly as
predicted. Note the size: a working one-factor design of this shape would be small (≈ 400-dimensional).

## 2. Why one factor cannot work over a trivial extension (weight argument)

*Claim* (status: **AI-verified** for the conditional statement below, after Codex job 11 fixed the
restriction/inverse-twist conventions and supplied the grading argument over an arbitrary field;
`audit/11-weight-argument-codex.md`). Let T = C ⋉ DC with C
finite-dimensional, s a simple module inflated from C, H^a = stable Hom_T(s, s[a]), and suppose classes
τ ∈ H^p and β ∈ H^r are homogeneous of integer weights w(τ), w(β) for the grading of T by DC-degree, with
τβ = 0 = ββ and zero indeterminacy, so that ⟨τ, β, β⟩ ⊆ H^{p+2r−1} is a single element. If
w(τ) + 2w(β) ≠ 0 and H^{p+2r−1} is concentrated in weight 0, then ⟨τ, β, β⟩ = 0.

*Proof sketch.* For H ∈ k^×, the automorphism h_H of T (identity on C, multiplication by H on DC) induces a
triangle autoequivalence Φ_H of the stable module category by restriction of scalars; Φ_H(s) ≅ s since s
is inflated from C. Fix such isomorphisms; Φ_H acts on H^* and the action on the weight-w part is
multiplication by H^w (this is the meaning of "weight"; with the preprint's normalisation τ has weight −1,
since the twist multiplies τ^m by H^{−m}). Toda brackets are natural under triangle functors:
Φ_H⟨τ, β, β⟩ = ⟨Φ_Hτ, Φ_Hβ, Φ_Hβ⟩ = H^{w(τ)+2w(β)}⟨τ, β, β⟩ (zero indeterminacy). The left side equals
⟨τ, β, β⟩ because H^{p+2r−1} has weight 0. Choosing H with H^{w(τ)+2w(β)} ≠ 1 gives the claim. ∎

In Candidate 1, p = 3, r = −1, H⁰ = k·id has weight 0, and the computed weights are w(τ) = −1, w(β₀) = 1
(inverse-twist convention), so w(τ) + 2w(β₀) = 1 ≠ 0: **c = 0 is forced**, which explains job 07.

**Correction (Codex job 11).** An earlier version of this note claimed that the argument kills every
one-factor design over a trivial extension with homogeneous classes. That is **false**: in the 6-dimensional
trivial extension of k(1 → 2) (cycle a, b with aba = bab = 0), the simple s at vertex 1 has homogeneous
classes τ ∈ H³, β ∈ H^{−1} with zero indeterminacy and ⟨τ, β, β⟩ = {id_s}, because there
w(τ) + 2w(β) = 0. (There s is periodic and τ² = 0, so this is not the polynomial situation the
construction needs.) The obstruction is a weight condition to be checked for each design; it does explain
why the AR preprint's specific one-factor shrink fails.

*What a one-factor fix would need.* A symmetric algebra T′ (with no grading in which
w(τ) + 2w(β) ≠ 0, e.g. τ of suitable weight, or no DC-type grading at all) with a simple s such that Ext*_{T′}(s, s) = k[τ], a family of twists acting on τ^m by distinct
characters (for the 2 × 2 determinant), and a nonzero bracket. Status: open; a candidate question for a
second Fable consult.

## 3. The two-factor fallback (Codex job 10)

Rebuilding the preprint's two-factor construction with minimal bimodule data gives the claimed two-cone
profile at X = s ⊗ s (W⁰ = W³ = k, all other W^a = 0 for −4 ≤ a ≤ 7; supported over 𝔽_{2^16}), but the
intermediate bimodules already have dimensions 784 704 and 1 377 984, and the next linear system has
3.6·10⁶ unknowns. The fibre F, Λ, Z and the Ext groups were not reached. So the minimised two-factor
construction was not completed within that bound (8 simples; 9 for the finitistic counterexample via O.5);
no lower bound on its final size follows from the intermediate dimensions (V-C23). It is explicit in
principle and not tractable with the computations attempted.

## 4. No one-factor design works (Codex job 12, checked by Claude)

*Theorem (OF.1, status: **AI-verified** — argument by Codex, checked step by step by Claude).* Let A be a
finite-dimensional symmetric algebra and s a nonprojective simple module with End(s) = k and
Ext^1(s, s) = Ext^2(s, s) = Ext^4(s, s) = 0. Then ⟨τ, β, β⟩ = {0} for every τ ∈ Ext³(s, s) and β ∈ H^{−1}.

*Proof.* Tate duality for symmetric algebras gives perfect pairings H^a × H^{−1−a} → H^{−1} ≅ k by
composition; so H^{−2} = H^{−3} = H^{−5} = 0. For τ ≠ 0 choose γ ∈ H^{−4} with γτ = β. Then ⟨τ, β, γ⟩ is
defined (τβ ∈ H² = 0, βγ ∈ H^{−5} = 0) and lies in H^{−3} = 0. The inclusion ⟨τ, β, γ⟩τ ⊆ ⟨τ, β, γτ⟩
gives 0 ∈ ⟨τ, β, β⟩, whose indeterminacy τH^{−3} + H¹β vanishes. ∎

If Ext*(s, s) = k[τ] is polynomial with |τ| = 3 the hypotheses hold; if |τ| = p > 3 the bracket lies in
H^{p−3} = 0. Hence **every one-factor design of conversion-principle type over a polynomial-Ext simple
fails** (c = 0), with or without a grading. This supersedes the weight arguments of §2 as the
explanation. **Correction (V-C23):** the tensor square S = s ⊗ s also satisfies the theorem's hypotheses
(so the bracket vanishes there too); the two-factor construction escapes not because the theorem fails but
because it does not use this bracket: two cones with a gapped profile and maps into the shifted target. It does not exclude
non-scalar stable endomorphism rings, other brackets, or a redesigned conversion construction (open).
Three concrete attempts (dimensions 6, 12, 40) were also tested; all fail the polynomial-Ext requirement
(supported, Ext profiles to degree 12).

## 5. Pending

- Nothing pending in this line: (i) the minimised two-factor fallback was not completed within the bound (§3); (ii) one-factor designs are
  excluded (§4). A redesigned conversion construction is open.
