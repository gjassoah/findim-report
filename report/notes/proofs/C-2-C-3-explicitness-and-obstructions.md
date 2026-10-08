# Dossier C-2 and C-3: explicitness, sizes, and obstructions (report §7.3, §8.7–8.8, §9)

Claude Opus 5.5, 2026-10-08. Compiled from part I (`notes/01`, `notes/03`, `audit/03`, `audit/07`, `audit/08`,
`audit/10`, `audit/11`, `audit/12`), in the conventions of `audit/report-notation.md`.

## C-2. Explicitness and sizes

### 7.3 What is explicit in the main construction (remark)

Explicit given their inputs: the selection data (§5.2), the encoding algebra B (§6.1), the rectified
complex P given the chain data (§6.5), the simulation (§7.1). Not explicit: the chain data of §6.4. They are
obtained by representing finitely many morphisms of the Verdier quotient by roofs and by choosing
null-homotopies; the existence of roofs is guaranteed by the Ore condition, but no bound on the length of
the complexes D_i (hence on l and on the number 3(l + 2) of simple modules of A) is provided, and the
representatives depend on choices of cones of composites in K^b(proj B). (Status: AI-proved as a statement
about the proof; whether a bound could be extracted with more work is open.) The encoding algebra B has
2 + 2d arrows, d the number of generators of a quadratic presentation of ℂG; G has 15 generators before
adding inverses and auxiliary generators for quadratisation.

### 8.7 Corollary: a finitistic counterexample with nine simple modules

*Statement.* Assume Theorem AR (§8.6): Λ = [[E, 0], [F, E]] over k = 𝔽₂(q, H₁, H₂) has eight simple modules
and a nonprojective module Z with Ext^{≥1}_Λ(Z, Z ⊕ Λ) = 0. Let Z′ be an indecomposable nonprojective summand
of Z. Then Γ = End_Λ(Λ ⊕ Z′)^op has nine simple modules (if Λ is basic; in general one more than Λ) and
End_Λ(Λ ⊕ Z′) has infinite left little finitistic dimension.

*Proof.* Z′ inherits the Ext vanishing (Ext is additive), Z′ is nonprojective; apply 3.4 (C-1). Λ is basic
with eight simples (AR preprint, Theorem 1.1; to be confirmed in D-E). ∎ (AI-proved, conditional on 8.6.)

### 8.8 Sizes (computational statements; status AI-computed, not re-derived by Claude)

- With the finite representatives exactly as specified in the AR preprint: dim F = 800 + 159999⁵·dim C₁ and
  dim Λ = 1600 + 159999⁵·dim C₁ with dim C₁ = 1 623 889 344, i.e. dim Λ ≈ 1.7·10³⁵ (`audit/03` §5, from the
  preprint's definitions: each cosyzygy over E^e = (T ⊗ T)^e, of dimension 160000, multiplies dimension
  by 159999).
- Rebuilding the same construction with minimal bimodule data: the two-cone profile at S = s ⊗ s is
  Êxt⁰ = Êxt³ = k and zero otherwise for −4 ≤ a ≤ 7 (supported over 𝔽_{2^16}); intermediate bimodules of
  dimension 784 704 and 1 377 984; the next linear system has 3.6·10⁶ unknowns (`audit/10`,
  `computations/06-two-factor/`). F, Λ, Z were not reached. **No lower bound on dim F or dim Λ follows**
  from these intermediate dimensions (kernels, cokernels and removal of projective summands need not
  preserve a lower bound; V-C23). What can be said: the minimised construction was not completed within a
  bound of ~2·10⁶ unknowns per linear system.
- The report should present these as computations with their scope, not as theorems.

## C-3. Obstructions to smaller constructions

### 9.1 Weight argument (conditional) and its sharp form

*Setting.* T = C ⋉ DC graded by DC-degree (C in degree 0, DC in degree 1), s a simple module inflated from
C with End(s) = k; homogeneous stable classes have an internal degree δ. For λ ∈ k^×, h_λ(c, f) = (c, λf) is
an algebra automorphism; restriction along h_λ is a triangle autoequivalence of stmod T fixing s
(identity identification, since DC annihilates s), and a homogeneous stable map of internal degree δ
transforms by λ^{−δ} (restriction weight −δ; the right-twisted tensor functor of the AR preprint is
restriction along h_λ^{−1}, weight δ).

**Lemma 9.1.** Let τ ∈ Êxt^p(s, s), β ∈ Êxt^r(s, s) be homogeneous with τβ = 0 = β², and suppose the
indeterminacy of ⟨τ, β, β⟩ vanishes and the target Êxt^{p+2r−1}(s, s) is concentrated in internal degree 0.
If δ(τ) + 2δ(β) ≠ 0 then ⟨τ, β, β⟩ = {0}. Valid over any field (choose homogeneous null-homotopies; the
bracket representative is homogeneous of degree δ(τ) + 2δ(β)). (AI-verified, `audit/11` §1–2.)

*Application.* In the one-factor design of the AR construction (p = 3, r = −1, target Êxt⁰ = k·id),
δ(τ) = −1 and δ(β₀) = 1, so δ(τ) + 2δ(β₀) = 1 ≠ 0 and the decisive bracket c vanishes (also computed
directly: `audit/07`, exact over 𝔽₂(q)).

*Sharp form (W.2, Fable consult 02 §2; AI-verified with scope corrections, `audit/12` §1).* For graded
symmetric T′ with symmetric form concentrated in degree N, β₀ (the trace-dual of id_s) has δ(β₀) = N, and
c ≠ 0 requires δ(τ′) = −2N; the AR mechanism (τ the connecting map of s[d] → T ⊗_C R → s) always gives
δ(τ) = −1. This condition is necessary, not sufficient.

### 9.2 Example: the obstruction is a weight condition, not a consequence of homogeneity

T = trivial extension of k(1 → 2) in characteristic 2: the cycle 1 –a→ 2 –b→ 1 with aba = bab = 0, dim 6,
deg a = 0, deg b = 1. The simple s at vertex 1 has a complete 4-periodic resolution with differentials
a, ab, b, ba; Êxt^n(s, s) = k for n ≡ 0, 3 mod 4 and 0 otherwise. With f the degree-3 chain map of
components (e₁, b, e₂, a), v the degree-4 periodicity isomorphism, t the degree-5 map (0, e₂, 0, e₁):
df = 0, dt = f², ft + tf = v². For τ = f and β = f v^{−1} (degrees 3 and −1): τβ = 0 = β², zero
indeterminacy, and ⟨τ, β, β⟩ = {id_s}; the weights satisfy δ(τ) + 2δ(β) = 0. (AI-proved with a finite
check, `audit/11` §4.) Here s is periodic and τ² = 0, so this is not the polynomial situation of §8.

### 9.3 Tate-duality obstruction

**Theorem 9.3.** Let A be a finite-dimensional symmetric algebra and s a nonprojective simple module with
End(s) = k and Ext¹(s, s) = Ext²(s, s) = Ext⁴(s, s) = 0. Then ⟨τ, β, β⟩ = {0} for all τ ∈ Ext³(s, s) and
β ∈ Êxt^{−1}(s, s). Consequently, if Ext*(s, s) = k[τ] with |τ| = p ≥ 3, the bracket ⟨τ, β, β⟩ vanishes (for p = 3 by the
theorem; for p > 3 because it lies in Êxt^{p−3}(s, s) = 0). In the one-factor design (cone of τ, lifts of
twists, fibre) the decisive invariant is this bracket (Fable's reduction, confirmed by the direct
construction of 9.4), so that design fails for every such (A, s); the statement is about that design, not
about an undefined class of all designs.

*Proof.* Tate duality gives perfect pairings Êxt^a × Êxt^{−1−a} → Êxt^{−1} ≅ k by composition, so
Êxt^{−2} = Êxt^{−3} = Êxt^{−5} = 0 and Êxt⁰ = k. For τ ≠ 0 choose γ ∈ Êxt^{−4} with γτ = β. Then
⟨τ, β, γ⟩ is defined (τβ ∈ Êxt² = 0, βγ ∈ Êxt^{−5} = 0) and lies in Êxt^{−3} = 0; by 2.2,
{0} = ⟨τ, β, γ⟩τ ⊆ ⟨τ, β, γτ⟩ = ⟨τ, β, β⟩, whose indeterminacy τÊxt^{−3} + Êxt¹β vanishes. ∎
(AI-verified: argument by Codex, `audit/12` §2, checked step by step by Claude; Tate duality as in
Linckelmann, arXiv:1211.5999v1, §2, read by Codex — to be re-read before citing.)

*Reading (corrected after V-C23).* The tensor square S = s ⊗ s over E = T ⊗ T also satisfies the
hypotheses of the theorem (Ext*(S, S) = k[τ₁, τ₂] vanishes in degrees 1, 2 and 4), so ⟨τ, β, β⟩ = 0 there
as well. The two-factor construction of the AR preprint does not need this bracket: it uses the cones of the
two classes τ₁, τ₂, whose combined profile Êxt^a(S, 𝒞 ⊗ S) has a gap (nonzero only for a = 0 and 3), and
maps from the twisted bimodules into the shifted target 𝒞[3] (AR preprint, `05-cones.tex`, profile, and
`07-branches.tex`); the class that the one-factor design must kill is absent there. The theorem does not
exclude designs with non-scalar stable endomorphisms, other brackets, or a different conversion principle
(open).

### 9.4 Computational evidence (to be presented with scope)

- Test bed Λ₀ = [[T, 0], [E_{λ₁} ⊕ E_{λ₂}, T]] (one-factor, no cone; dim 80, 4 simples), Z₀ (dim 10):
  Ext^a(Z₀, Z₀) = 1, 0, 0, 0, 0, 0 and Ext^a(Z₀, Λ₀) = 0 for a = 1..6; Z₀ nonprojective; Ext¹ ≅ coker δ⁰
  (three 𝔽_{2^16} runs to degree 6, exact over 𝔽₂(q, H₁, H₂) to degree 2; `audit/06`).
- One-factor candidate Λ₁ (cone of τ, lifts, fibre; dim F = 352, dim Λ₁ = 392, 4 simples), Z₁ (dim 16):
  Ext^a(Z₁, Z₁) = (1, 0, 0), Ext^a(Z₁, Λ₁) = 0 for a = 1, 2, 3; δ⁰ = [[1, 1], [0, 0]] (two 𝔽_{2^16} samples;
  `audit/08`). Consistent with 9.1 and 9.3.
- Three further one-factor attempts (dimensions 6, 12, 40) fail the polynomial-Ext requirement (Ext
  profiles to degree 12; `audit/12` §3).
- In the report each item names its scripts and outputs (`computations/03-…`, `05-…`, `07-…`) and the exact
  parameters used (V-C23: definitions and reproducible evidence must be given, not only results).
