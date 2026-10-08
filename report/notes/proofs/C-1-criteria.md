# Dossier C-1: criteria and constraints (report §2.2, §3.1–3.7, §4.3–4.4, §5.1)

Claude Opus 5.5, 2026-10-08. Compiled from part I (`notes/02`, `audit/02`, `audit/03`, `audit/05`, `audit/12`),
rewritten in the conventions of `audit/report-notation.md`, with all corrections found in part I built in.
Statuses: as recorded in `LEDGER.md` (part I); the adaptation to the report's conventions is re-verified in
W2 by a fresh Codex job (V-C1).

Throughout, k is a field, A a finite-dimensional k-algebra, modules finitely generated left modules,
(−)* = Hom_A(−, A) (sending left modules to right modules and conversely), and Ω, Tr as in the conventions.

## 2.2 A juggling inclusion for Toda brackets

**Lemma.** Let 𝒯 be a triangulated category, X →f Y →g Z →h W with gf = 0 = hg, and u : X′ → X. Then
⟨h, g, f⟩ ∘ u[1] ⊆ ⟨h, g, f u⟩.

*Proof.* Choose a triangle Y →g Z →i C_g →q Y[1]. A defining system for ⟨h, g, f⟩ is a pair
(a : X[1] → C_g, b : C_g → W) with q a = f[1] and b i = h; its value is b a. Then (a u[1], b) satisfies
q (a u[1]) = (f u)[1] and b i = h, so it is a defining system for ⟨h, g, f u⟩ with value (b a) u[1]. ∎
(AI-proved; dg version with signs in `audit/12-one-factor-search-codex.md` §2.) In the graded
endomorphism ring of an object O this reads ⟨a, b, c⟩ d ⊆ ⟨a, b, c d⟩ whenever both sides are defined:
for a, b, c, d of degrees p, q, r, s use the chain O[−p−q−r] → O[−p−q] → O[−p] → O with maps
c[−p−q−r], b[−p−q], a[−p], and precompose with d[−p−q−r−s]; the output has degree p + q + r + s − 1 and no
sign is introduced in this convention (V-C1).

## 3.1 Projective coresolutions

**Proposition.** Let 𝒜 be an abelian category with enough projectives, and let
0 → c₀ → p₀ → c₁ → 0 and 0 → c_n → p_n → c_{n+1} → 0 (n ≥ 1) be short exact sequences with every p_n
projective, c₀ projective and c₁ not projective. Then pd c_n = n for every n ≥ 1.

*Proof.* Upper bound by induction: pd c₀ = 0, and a short exact sequence 0 → c_n → p_n → c_{n+1} → 0 with
p_n projective gives pd c_{n+1} ≤ pd c_n + 1. Lower bound: c₁ is not projective, and the first sequence
gives pd c₁ ≤ 1, so pd c₁ = 1. For n ≥ 1 and every object V, the long exact Ext sequence of the n-th
sequence and Ext^{≥1}(p_n, V) = 0 give Ext^{j+1}(c_{n+1}, V) ≅ Ext^j(c_n, V) for j ≥ 1; with j = n and V
such that Ext^n(c_n, V) ≠ 0 (exists as pd c_n = n), pd c_{n+1} ≥ n + 1. ∎ (**formally verified in Lean** in Lean,
stage 1, `FindimCounterexample.ProjectiveCoresolution.projectiveDimension_eq`; note that Lean states it
without "enough projectives", using Mathlib's Ext.)

## 3.2 Failure of the strong Nakayama property gives infinite little finitistic dimension

**Theorem.** Let E ≠ 0 be a right A-module with Ext^i_{A^op}(E, A) = 0 for all i ≥ 0, and let
⋯ → P₁ → P₀ → E → 0 be a minimal projective resolution of E. Put C₀ = P₀* and C_n = coker(P_{n−1}* → P_n*)
for n ≥ 1. Then C_n ≅ Tr Ω^{n−1} E and pd_A C_n = n for every n ≥ 1. In particular the left little
finitistic dimension of A is infinite.

*Proof.* Dualising, 0 → P₀* → P₁* → P₂* → ⋯ is a complex of projective left modules whose cohomology at
P_i* is Ext^i(E, A) = 0; so it is exact, and it splits into the short exact sequences of 3.1 with
c_n = C_n and p_n = P_{n+1}*. If C₁ were projective, P₀* → P₁* would be a split monomorphism, so its dual
P₁ → P₀ would be a split epimorphism (reflexivity of f.g. projectives), forcing E = coker(P₁ → P₀) = 0.
So 3.1 applies. Finally P_n → P_{n−1} → Ω^{n−1}E → 0 is a minimal presentation, whence
Tr Ω^{n−1}E = coker(P_{n−1}* → P_n*) = C_n. ∎ (AI-verified, `audit/02`; **formally verified in Lean** in Lean, stage 2,
over an arbitrary ring with exactness of the dual complex as hypothesis.)

*Attribution.* The dualisation argument is the classical proof that finiteness of the finitistic
dimension implies the strong Nakayama conjecture, as in Crawley-Boevey's notes *Noncommutative Algebra 2*
(Bielefeld 2019/20), §3.2, Proposition 5 and its proof, p. 63 (located and read by Codex; to be re-read
before citing). The formula pd C_n = n is the dimension-shifting refinement.

*Equivalent form.* Ext^i_{A^op}(E, A) ≅ D Tor_i^A(E, DA), so the hypothesis says E ⊗ᴸ_A DA ≃ 0: the derived
Nakayama functor kills E. It forces pd E = ∞.

## 3.3 Reformulation via ∞-torsionfree modules

**Proposition.** (a) If E is as in 3.2, then C = Tr E is a nonprojective module with pd C = 1 and no nonzero
projective summand, Ext^i_{A^op}(Tr C, A) = 0 for all i ≥ 1, and E ≅ Ext¹_A(C, A).
(b) Conversely, let C have no nonzero projective summand, pd C = 1, C not projective, and
Ext^i_{A^op}(Tr C, A) = 0 for all i ≥ 1. Then E = Tr C satisfies Ext^i(E, A) = 0 for all i ≥ 0.
(c) Equivalently to Ext^{≥1}(Tr C, A) = 0 (given pd C = 1): C has a coresolution
0 → C → Q₂ → Q₃ → ⋯ by projectives in which each map C_{m−1} → Q_m (C₁ = C, C_m the cokernels) is a left
add(A)-approximation.

*Proof.* (a) As in 3.2 with C = C₁; E has no projective summand since Hom(E, A) = 0, so Tr Tr E ≅ E.
(b) A minimal resolution 0 → Q₀ → Q₁ → C → 0 gives E = coker(Q₁* → Q₀*) ≅ Ext¹_A(C, A), and
Hom(E, A) = ker(Q₀ → Q₁) = 0; E ≠ 0 since otherwise Q₁* → Q₀* would split and C would be projective; the
positive degrees are the hypothesis. (c) Splicing as in `audit/05` §Lemma 1, items 6–7: for m ≥ 2,
dualising 0 → C_{m−1} → Q_m → C_m → 0 identifies the obstruction to surjectivity of Q_m* → C_{m−1}* with
Ext¹_A(C_m, A). ∎ (AI-verified as corrected, `audit/05`.) Without the "no projective summand" condition the
correspondence holds only up to projective summands.

*Proof of (c) (V-C1 repair).* Let C have no projective summand and pd C = 1, E = Tr C, and choose a minimal
resolution 0 → Q₀ → Q₁ → C → 0. If the transpose Ext groups vanish, (b) gives Ext^{≥0}(E, A) = 0;
dualising a minimal projective resolution of E gives an exact complex whose first cokernel is Tr E = C and
whose tail is a projective coresolution of C; the dual of each of its short exact sequences is the
corresponding segment of the resolution of E, hence exact, so the inclusions are left
add(A)-approximations. Conversely, dualising an approximation coresolution gives an exact sequence
⋯ → Q₃* → Q₂* → C* → 0; splicing with 0 → C* → Q₁* → Q₀* → E → 0 gives a projective resolution of E whose
dual 0 → Q₀ → Q₁ → Q₂ → ⋯ is exact, so Ext^{≥0}(E, A) = 0. If C has a projective summand P, split it off
and add it back with the coresolution 0 → P → P → 0.

*Consequence (corrected after V-C1).* Every indecomposable summand of a C_m is torsionless and has finite
projective dimension; if only finitely many such indecomposables occurred, their projective dimensions would
bound pd C_m = m. So A has infinitely many indecomposable torsionless modules of finite projective
dimension. (Unbounded vector-space dimension alone would not suffice: k^m over k.)

## 3.4 Auslander–Reiten counterexamples

**Theorem.** Let Λ be a finite-dimensional algebra and M a nonprojective Λ-module with
Ext^i_Λ(M, M ⊕ Λ) = 0 for all i ≥ 1. Put G = Λ ⊕ M, Γ = End_Λ(G)^op, 𝔽 = Hom_Λ(G, −), let π : P → M be a
projective cover and S = coker 𝔽π. Then S ≠ 0 and Ext^i_Γ(S, Γ) = 0 for all i ≥ 0. Hence (3.2 applied to
Γ^op) the algebra End_Λ(G) has infinite left little finitistic dimension, and its number of simple modules
is the number of isomorphism classes of indecomposable summands of G.

*Proof.* (a) Choose right add G-approximations g_j : G_j → K_j with K₀ = ker π, K_{j+1} = ker g_j; they are
surjective as Λ ∈ add G. Since 𝔽 is left exact and the g_j are approximations,
⋯ → 𝔽G₁ → 𝔽G₀ → 𝔽P → 𝔽M → S → 0 is a projective resolution. (b) If 𝔽π were surjective, id_M would lift
through π and M would be projective. (c) For Y ∈ add G, Hom_Γ(𝔽Y, Γ) ≅ Hom_Λ(Y, G) naturally (Yoneda on
add G), so Ext^*_Γ(S, Γ) is the cohomology of 0 → Hom(M, G) → Hom(P, G) → Hom(G₀, G) → ⋯. (d) The
resolution ⋯ → G₀ → P → M is by Hom(−, G)-acyclic modules (Ext^{≥1}(G, G) = 0), so the complex computes
Ext^*_Λ(M, G); as Ext^{≥1}(M, G) = 0 and Hom(M, G) → Hom(P, G) is injective, it is exact. ∎ (AI-verified,
`audit/03`; classical: Auslander–Reiten 1975, Theorem 1.1(b), p. 71, proof p. 72 — read by Codex in
`AR75a…`, to be re-read before citing; their proof uses injective resolutions.)

*Remark (number of simples).* Replacing M by an indecomposable nonprojective summand M′ keeps the
hypotheses (Ext is additive), so Γ can be chosen with exactly one more simple module than (basic) Λ.

## 3.5 Simple witnesses are Auslander–Reiten counterexamples on a corner

*In this subsection Af, M and the endomorphisms are taken as **right** B-modules (an exception to the
left-module default; V-C1).*

**Proposition.** Let S be a simple right A-module with Hom_{A^op}(S, A) = 0 = Ext¹_{A^op}(S, A); let e be the
sum of the primitive idempotents (in a fixed complete decomposition of 1) belonging to S, f = 1 − e,
B = fAf, M = eAf, a right B-module. Then left multiplication A → End_{B^op}(Af) ≅ End_{B^op}(B ⊕ M) is an
algebra isomorphism; B has exactly one isomorphism class of simple modules fewer than A, and M is not a
projective right B-module.

*Proof.* For a right A-module V let η_V : V → Hom_B(Af, Vf), v ↦ (x ↦ vx). Applying (−)f gives an
isomorphism, so ker η_V and coker η_V are A/AfA-modules, i.e. have composition factors S. If
Hom(S, V) = 0 then ker η_V = 0; if moreover Ext¹(S, V) = 0 then Ext¹(T, V) = 0 for every A/AfA-module T, so
η_V splits, and its cokernel is a summand of Hom_B(Af, Vf) killed by f, hence zero since
Hom_A(T, Hom_B(Af, Vf)) = Hom_B(Tf, Vf) = 0. Apply to V = A. If M were B-projective, End_B(B ⊕ M) would be
Morita equivalent to B. ∎ (AI-verified, `audit/05`, with notation fixes; the dimension formula
dim End_B(B ⊕ M) = dim B + 2 dim M + dim End M proposed earlier is false in general and is not used.)

**Corollary (V-C1; needs more than the two vanishings).** (a) If S is a simple right A-module with
Ext^i_{A^op}(S, A) = 0 for all i ≥ 0, then, with B and M as above, M is a nonprojective right B-module with
Ext^{≥1}_{B^op}(M, B ⊕ M) = 0. (b) Conversely, for an indecomposable nonprojective right B-module M with
Ext^{≥1}(M, B ⊕ M) = 0, the algebra End_{B^op}(B ⊕ M) has a simple module T (at the vertex of M) with
Ext^{≥0}(T, −) = 0 into the regular module, on the appropriate side.

*Proof.* (a) A minimal injective resolution A → I^• of the right regular module has no summand with socle S
(as Ext^*(S, A) = 0), so each I^j is a sum of D(Ae_t) with e_t ≤ f; then I^j f = D(Be_t) is injective over B,
the coinduction unit for I^j is an isomorphism by the argument of the proposition, and
Hom_{B^op}(Af, I^• f) = Hom_{A^op}(A, I^•) computes Ext^{>0}_{B^op}(Af, Af) = 0. Since Af = B ⊕ M and M is
nonprojective (proposition), M is an Auslander–Reiten counterexample. (b) Apply 3.4: the cokernel U of
𝔽π is supported only at the vertex of M (maps from projective summands of G to M lift through π), so all its
composition factors are copies of one simple T; if d were the least degree with Ext^d(T, Γ) ≠ 0, the lower
groups would vanish for every module filtered by T, and 0 → U′ → U → T → 0 would embed Ext^d(T, Γ) into
Ext^d(U, Γ) = 0 (Hom left exactness for d = 0), a contradiction. ∎ The example A = k(1 → 2 → 3)/(ba), S the
right simple at 3, has Hom(S, A) = Ext¹(S, A) = 0 but Ext²(S, A) ≠ 0: the two low-degree vanishings alone do
not give (a).

## 3.6 Triangular gluing

**Proposition.** Let A = [[B, 0], [M, C]] with M a C-B-bimodule; right A-modules are triples
(X, Y, φ : Y ⊗_C M → X) with X a right B-module and Y a right C-module. Let E ≠ 0 be a right A-module with
RHom_{A^op}(E, A) = 0, and Z = cone(Y ⊗ᴸ_C M → X) ∈ D⁻(mod B^op). Then RHom_{B^op}(Z, B) = 0; if Z ≄ 0 then the
left little finitistic dimension of B is infinite; if Z ≃ 0 then Y ≠ 0 and RHom_{C^op}(Y, C) = 0, so C has
infinite left little finitistic dimension by 3.2.

*Proof (V-C1 repair).* Write e = diag(1, 0), f = diag(0, 1), j_!Y = Y ⊗ᴸ_C fA and i_* the inflation of right
B-modules. The derived unit gives a triangle j_!Y → E → i_*Z → (j_!Y)[1] (identity on the C-component, the
multiplication map on the B-component). As eA = i_*B, adjunction gives RHom_{B^op}(Z, B) = RHom_{A^op}(E, eA) = 0.
If Z ≄ 0, represent it by a nonzero minimal bounded-above complex P^• of f.g. projective right B-modules
with largest nonzero degree m; its dual 0 → (P^m)* → (P^{m−1})* → ⋯ is exact, its first cokernel is not
projective (otherwise the first map would split, against the radical differential of a minimal complex),
and 3.1 applied to the successive cokernels gives unbounded finite projective dimensions. If Z ≃ 0, then
E ≃ j_!Y, so Y ≠ 0, and RHom_{C^op}(Y, C) = RHom_{A^op}(j_!Y, fA) = 0 since (fA)f = C. ∎ (AI-verified: argument
by Codex in V-C1, checked by Claude; works even if Z has infinitely many nonzero cohomology groups.)

*Remark.* This does **not** imply that every idempotent ideal of a counterexample is non-stratifying
(refuted: R × k with R a counterexample).

## 3.7 Bounded dimension

**Proposition.** For a dimension vector d, {M ∈ Rep_d(A) : pd M ≤ n} is open; hence pd is bounded on the
modules of finite projective dimension in Rep_d(A), and modules of unbounded finite projective dimension
have unbounded dimension. ∎ (AI-verified, `audit/02`; proof via Tor_{n+1}(A/J, M) computed from a fixed free
resolution of A/J, rank semicontinuity, and the ascending chain condition on opens. The same argument:
Happel's notes §2.3, p. 5, attributed to Schofield 1985; openness also from Geiß–Labardini-Fragoso–Schröer,
arXiv:2302.02085v2, Cor. 2.6 — both located by Codex, to be re-read before citing. Both work over an
algebraically closed field; the Tor argument here works over any field, so do not present either citation
alone as giving the statement verbatim — V-C1.)

*Consequence for 3.2.* dim Tr M ≤ (dim A)² dim M; so the syzygies Ω^n E of a witness have unbounded
dimension.

## 4.3 Bounded extinction

**Proposition.** Let Δ have finite global dimension, X a f.d. Δ-bimodule, Φ = X ⊗ᴸ_Δ −, d a dimension
vector. The finite extinction times t(N) = min{t : Φ^t N ≃ 0} of N ∈ Rep_d(Δ) are bounded. ∎ (AI-verified,
`audit/02`, with the correction that on a total-dimension variety term dimensions are only locally
constant.)

*Proof (written out after V-C1).* For t ≥ 0 let U_t = {N : Φ^t N ≃ 0}. Since gldim Δ < ∞, truncating the right
bar resolution of X at a projective syzygy gives a bounded resolution Q of X by f.d. bimodules that are
projective as right modules (no finiteness of gldim Δ^e or perfectness of k is needed). For fixed t, the
complex Q ⊗_Δ ⋯ ⊗_Δ Q (t factors) is bounded, termwise f.d. and right projective (a tensor of two such terms
is a right-module summand of finitely many copies of the second), and computes Φ^t. Tensoring with the
universal module gives a bounded complex of vector bundles of finite rank on Rep_d(Δ); the locus where its
fibre is exact is open (finitely many rank conditions). So U_t is open; U_t ⊆ U_{t+1}; by noetherianity the
chain is stationary, and every N with finite extinction time lies in U_T for one T. ∎

## 4.4 K₀-invisibility

**Remark (proof included).** Φ induces an endomorphism [Φ] of K₀(Δ) ≅ ℤ^n (Δ of finite global dimension).
If Φ^t N ≃ 0 then [N] lies in the generalised kernel of [Φ], so [Φ^r N] = 0 for r ≥ n while Φ^r N may be
nonzero: long extinction requires iterates of zero class. In the main construction Φ² M(Y) ≃
M(HY)[b] ⊕ M(HY)[b + 3] has class zero, which is the role of the odd double. ∎ (AI-proved.)

## 5.1 Selection data and the rank-function obstruction

**Definition.** Selection data: a k-algebra R (possibly infinite-dimensional) and an R-bimodule Ψ that is
f.g. projective as a right module; H = Ψ ⊗_R −. The preprint's case: Ψ = ₐ(eR) for a central idempotent e
and an automorphism α.

**Proposition.** For a f.d. R-module Y let χ_Y([P]) = dim(P ⊗_R Y) on K₀(R_R), T[P] = [P ⊗_R Ψ], and V the
image of span_ℚ{T^t[R]} in functions on f.d. modules. If dim V = r < ∞, then every f.d. Y with H^t Y = 0 for
some t has H^r Y = 0. ∎ (AI-verified, `audit/02`; proof by Fitting decomposition of T on V, using
χ_Y(T[P]) = χ_{HY}([P]).) Consequences (AI-verified): unbounded extinction needs infinitely many independent
rank functions; excluded are commutative noetherian R, path algebras of finite quivers, and universal
localisations of f.d. hereditary algebras (K₀ surjectivity: Schofield, arXiv:0708.0257v1, Lemma 4.1,
located by Codex, to be re-read).
