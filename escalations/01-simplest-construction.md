# Escalation 01: the simplest route to an explicit counterexample

For: Claude Fable 5.1 (one call). Prepared by Claude Opus 5.5, 2026-10-07. Self-contained; the answer is
treated as untrusted input and will be checked.

## Background

k is a field, algebras are finite-dimensional, modules finitely generated. The little finitistic dimension
conjecture (findim A < ∞ for all A) is claimed to be false by two recent unrefereed preprints:

- **M1** (OpenAI, "An algebra of infinite little finitistic dimension", 2026): A = D ⋉ X with gldim D < ∞;
  pd_A N < ∞ iff F^t N ≃ 0 for some t, and F^r N ≄ 0 ⇒ pd_A N ≥ r, where F = X ⊗ᴸ_D −. The modules N_m with
  extinction time ≈ 2m come from a finitely presented group of Abels type (15 generators, infinitely many
  independent central involutions shifted by an automorphism), encoded in a 3-vertex algebra via a Verdier
  quotient and a non-constructive lifting of a diagram. The final algebra is not explicit.
- **M2** (OpenAI companions on Tachikawa's second conjecture and on the Auslander–Reiten conjecture, 2026):
  over k = 𝔽₂(q, H₁, H₂), an explicit 8-simple algebra Λ = [[A, 0], [F, A]] (A = T ⊗ T, T = C ⋉ DC, C a
  10-dimensional 2-vertex algebra containing the quantum exterior algebra k⟨x,y⟩/(x², y², xy − qyx) as a
  corner; F a finite bimodule) with a nonprojective Gorenstein-projective Z and Ext^{≥1}(Z, Z ⊕ Λ) = 0. The
  mechanism: parameter-shifting syzygies (powers of q) and two independent twists (H₁, H₂) that make a
  comparison map invertible in all positive degrees.

Observations made in this task (O.2–O.4 proved and independently verified by a second model; O.5 proved,
not yet independently verified; O.4's mechanism is classical — Crawley-Boevey's notes on FDC ⇒ strong
Nakayama):

- **O.4.** If E ≠ 0 is a right A-module with Ext^i(E, A) = 0 for all i ≥ 0 (failure of the strong Nakayama
  conjecture; equivalently E ⊗ᴸ_A DA ≃ 0), then the left modules C_n = Tr Ω^{n−1}E have pd C_n = n, so left
  findim A = ∞. Proof: dualise the minimal resolution of E to an exact sequence 0 → P₀* → P₁* → ⋯ of
  projectives and shift dimensions.
- **O.5.** If (Λ, M) violates the Auslander–Reiten conjecture, then for Γ = End_Λ(Λ ⊕ M)^op the module
  S = coker(Hom(Λ ⊕ M, P(M)) → Hom(Λ ⊕ M, M)) satisfies Ext^i_Γ(S, Γ) = 0 for all i ≥ 0; with O.4,
  End_Λ(Λ ⊕ M) has infinite findim and one more simple module than Λ.
- **O.2.** On a module variety of fixed dimension vector, finite projective dimensions are bounded, and finite
  extinction times of F are bounded. Hence witnesses must have unbounded dimension; in O.4 the syzygies of E
  must have unbounded dimension. In particular a family E_λ of constant dimension with ΩE_λ ≅ E_{qλ}
  cannot satisfy Ext^{≥0}(E_λ, A) = 0 (Hom(E_λ, A) must be nonzero).
- **O.3.** In M1, selection data (R, Ψ) with Ψ right projective need infinitely many linearly independent
  rank functions [Ψ^{⊗t}] on f.d. R-modules (so R cannot be commutative noetherian, hereditary, or have
  finite-rank K₀).
- Known positive classes (to be re-read): monomial algebras, rad³ = 0, representation dimension ≤ 3
  (Igusa–Todorov), Gorenstein algebras; any counterexample has Loewy length ≥ 4 and lies outside these.

## The question

The goal is a counterexample that a human can verify by elementary means: an explicit quiver with
relations (few vertices, few arrows, possibly over a field with one or more transcendental parameters), an
explicit family of modules, and a proof by explicit resolutions or recursions.

1. Which mechanism is most promising for this goal: (a) a direct strong Nakayama failure E with
   Ext^*(E, A) = 0 (O.4); (b) a simpler Auslander–Reiten counterexample, then O.5; (c) M1 with simpler
   selection data or an explicit lift; (d) something else? Give your reasons in a few sentences each.
2. For your preferred mechanism, propose up to three **concrete candidate constructions**: the algebra (by
   quiver and relations, or as a triangular / trivial-extension / tensor construction from named small
   pieces), the module(s), and the proof strategy, including why the necessary conditions above are
   satisfied (in particular how the syzygies of E grow, and how Hom(E, A) is killed). Be explicit enough
   that each candidate can be tested by computer (QPA/Sage) in small degrees.
3. For each candidate, state the step you consider most likely to fail.
4. If you believe no "elementary" counterexample is likely to exist, say why (structural reasons), and what
   the most explicit achievable outcome would be.

Answer in at most about 150 lines. Mark every claim you have not proved as such; do not cite results by
number unless you are sure, and say so when unsure.
