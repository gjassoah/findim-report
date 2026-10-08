# Outline and logical spine of the report

Claude Opus 5.5, 2026-10-08. Conventions: `audit/report-notation.md`. Every result below gets a dossier note
in `report/notes/proofs/` (proof from scratch) and a fresh-context verification before drafting (W2).

## Notation decisions (resolving the clashes of the notation table)

| Object | Symbol in the report | Preprint symbol |
|---|---|---|
| k-duality | D = Hom_k(−, k) | D |
| base algebra of a trivial extension (finite gldim) | Δ | D (main) |
| bimodule of the trivial extension; its derived tensor functor | X; Φ = X ⊗ᴸ_Δ − | X; F |
| final algebra of the main construction | A = Δ ⋉ X | A |
| selection data, functor | (R, Ψ); H = Ψ ⊗_R − (special case Ψ = ₐ(eR)) | R, e, α, H |
| encoding algebra, Verdier quotient, action | B; 𝒬 = K^b(proj B)/𝒮; θ : R → End_𝒬(E₀) | same |
| morphisms inverted in 𝒬 | 𝒲 (cone in 𝒮) | Σ |
| formal summand and odd double | U = (E₀, θ(e)); V = U ⊕ U[3] | same |
| chain algebra and its right simple (simulation) | K_l (linear A_{l+1}, rad² = 0); W | C; W |
| bimodules of the simulation | O and Y (X = O ⊕ Y) | O and T |
| AR route: 10-dim algebra, symmetric algebra, simple | C, T = C ⋉ DC, s | same |
| tensor square and its simple | E = T ⊗_k T, S = s ⊗ s | A, X |
| twist automorphisms, twisted bimodules | h_λ (λ ∈ k^×), E_λ | h_H, U_H |
| fibre bimodule, triangular algebra, module | F, Λ = [[E,0],[F,E]], Z | same |
| AR → findim algebra | Γ = End_Λ(Λ ⊕ Z′)^op (Z′ an indecomposable nonprojective summand) | — |
| Tate groups | Êxt^a(X, Y) = stable Hom(X, Y[a]); generator τ ∈ Êxt³_T(s, s), β₀ ∈ Êxt^{−1}_T(s, s) | H^a |
| one-factor design (obstruction section) | Λ₁, Z₁, test bed Λ₀, Z₀ | — |

## Results, sources, dossier jobs

Status in part I in brackets. "Job" = the W2 dossier job that writes the proof note (D-*: Codex Ultra
drafting jobs; C-*: compiled by Claude from part I notes and audits, adapted to these conventions).

### §2 Preliminaries
- 2.1 Tate duality for symmetric algebras (cited: Linckelmann arXiv:1211.5999v1 §2; statement only). [cited]
- 2.2 Juggling inclusion ⟨a, b, c⟩d ⊆ ⟨a, b, cd⟩ (short proof). [AI-proved, audit/12] — C-1
- 2.3 Right fractions in Verdier quotients (Ore condition, cancellation, roofs; Stacks Project cited for
  the general theory; the two facts used proved). — D-B

### §3 Criteria
- 3.1 Projective coresolutions ⇒ pd C_n = n (any abelian category) [Lean L.1] — C-1
- 3.2 Strong Nakayama failure ⇒ explicit modules of every finite pd (O.4; mechanism: Crawley-Boevey's
  notes) [AI-verified; Lean L.2] — C-1
- 3.3 Reformulation via ∞-torsionfree modules (F.1 as corrected) [AI-verified as corrected] — C-1
- 3.4 Auslander–Reiten counterexamples ⇒ infinite findim of End(Λ ⊕ M) (O.5; AR 1975 Thm 1.1(b))
  [AI-verified] — C-1
- 3.5 Simple witnesses are AR counterexamples on a corner (F.2) [AI-verified] — C-1
- 3.6 Triangular gluing (F.3 corrected, D⁻ form) [AI-verified] — C-1
- 3.7 Bounded dimension: finite pd bounded on Rep_d (O.2b; Happel, Schofield) [AI-verified] — C-1

### §4 Trivial extensions and extinction
- 4.1 Bar decomposition D… (Δ ⊗ᴸ_A N ≃ ⊕ Φ^r N[r]) (preprint P.6.1; Minamoto–Yamaura) — D-A
- 4.2 Detection: extinction ⇔ finite pd; Φ^r N ≄ 0 ⇒ pd ≥ r; upper bound via MY formula if included
  (preprint P.6.2) — D-A
- 4.3 Bounded extinction on Rep_d (O.2a) [AI-verified] — C-1
- 4.4 K₀-invisibility of long iterates (remark with proof) [AI-proved] — C-1

### §5 Selection data
- 5.1 Definition; the rank-function obstruction (O.3) [AI-verified] — C-1
- 5.2 The group G: finite presentation; central involutions z_N and the shift automorphism; finite
  quotients F_m; selection modules Y_m with extinction m (preprint §2) [computations supported m ≤ 6] — D-C
- 5.3 (optional) generalised selection data (O.3') — decide after D-B: include with proof or omit.

### §6 Realisation by a bimodule complex
- 6.1 Quadratic presentations and the encoding algebra B; directed dimension bound (gldim ≤ 2) — D-B
- 6.2 The action θ : R → End_𝒬(E₀) and evaluation functors — D-B
- 6.3 The odd double (U ⊕ U[3] lies in 𝒬), with the K₀ reading — D-B
- 6.4 Lifting a B-diagram from 𝒬 to K^b(proj B) (roofs; non-constructive step identified) — D-B
- 6.5 Rectification: the three-column bimodule complex P — D-B
- 6.6 Realisation theorem P ⊗ᴸ M(Y) ≃ M(HY) ⊕ M(HY)[3]; iterates — D-B

### §7 Simulation and the final algebra
- 7.1 Simulation of P by an ordinary bimodule over Δ = B × (B ⊗ K_l); gldim bound; Φ² ≃ P[b] ⊗ᴸ − — D-A
- 7.2 Main theorem: findim A = ∞ (2m − 2 ≤ pd N_m < ∞) — D-A
- 7.3 Remarks: what is explicit; why l is unknown — C-2

### §8 The Auslander–Reiten route
- 8.1 Conversion principle (AR preprint §2): Λ = [[E,0],[F,E]], Z = (S, Y, ι); Ext^{>0}(Z, Z ⊕ Λ) = 0 — D-D
- 8.2 The algebra C, its simple s, the minimal resolution with parameter shift, RHom_C(s, C) — D-E
- 8.3 T = C ⋉ DC symmetric; Ext*_T(s, s) = k[τ], |τ| = 3 (all degrees) — D-E
- 8.4 E = T ⊗ T, S = s ⊗ s, Ext*_E(S, S) = k[τ₁, τ₂]; two-cone bimodule and its profile (W⁰ = W³ = k) — D-E
- 8.5 Twists h_λ, their action on τ^m (λ^{−m}), the cocycle realising τ and the lifts E_λ → 𝒞[3] — D-E
- 8.6 The fibre F and the comparison δ: the 2×2 determinant; Theorem (AR counterexample) — D-E
- 8.7 Corollary: Γ has infinite findim with nine simple modules (O.5) — C-2
- 8.8 Sizes: as specified ≈ 1.7·10³⁵; minimised two-factor not completed (intermediate dimensions only; no lower bound) — C-2

### §9 Obstructions to smaller constructions
- 9.1 Weight argument (conditional), sharp condition δ(τ′) = −2N (W.1, W.2 as corrected) — C-3
- 9.2 Example: the 6-dimensional trivial extension with a nonzero bracket — C-3
- 9.3 Tate-duality obstruction (OF.1): every one-factor conversion design over a polynomial-Ext simple
  fails — C-3
- 9.4 Computational evidence: test bed Λ₀ (degrees ≤ 6) and Candidate Λ₁ (dim 392; Ext¹(Z₁, Z₁) = k) —
  presented as computations with scope, not theorems — C-3

### Appendices
- A computations (scripts, scope, tables) — Codex job after W3
- B verification and formalisation record (from LEDGER, audits, lean/gates)
- C the Tachikawa companion: Nakayama-type consequences (remark, cited, unverified)
- D declaration of the use of AI and outline of the process; link to `findim-report`

## Dependencies (for the order of sections)

3.1 → 3.2 → 3.4 → 8.7; 4.1 → 4.2 → 7.2; 5.2 → 7.2; 6.1–6.6 → 7.1 → 7.2; 2.1 → 9.3; 8.1–8.6 → 8.7.
