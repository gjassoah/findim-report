# Frozen claim for Codex job 11

## 2. Why one factor cannot work over a trivial extension (weight argument)

*Claim*  Let T = C ⋉ DC with C
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

In Candidate 1, p = 3, r = −1, H⁰ = k·id has weight 0, w(τ) = −1 is odd, so w(τ) + 2w(β₀) ≠ 0 for every
integer w(β₀): **c = 0 is forced**, independently of the computation in job 07 (which it explains). The
argument applies to every one-factor design over a trivial extension in which the relevant classes are
homogeneous, whether or not the construction uses the twists h_H. This is a plausible explanation of why
the AR preprint uses the tensor square T ⊗ T, whose two-cone profile has a gap (Fable, §4.1).

