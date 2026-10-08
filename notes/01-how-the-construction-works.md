# 01. How the construction of the preprint works

Author: Claude Opus 5.5, 2026-10-07. Statuses as in `docs/WORKING_RULES.md`. Labels P.x are the preprint's
results (numbering of `build/sections/*.tex`); nothing here certifies them.

Conventions: those of the preprint (left modules, composition right to left, cohomological grading,
K[s]^n = K^{n+s}). k is a field; F = X ⊗ᴸ_D − for a D-bimodule X.

## 1. The four stages

| Stage | Input | Output | Explicit? |
|---|---|---|---|
| S1 Selection (§2, P.2.1) | f.p. group G (15 generators, Abels type), R = ℂG, central idempotent e = (1+z₀)/2, automorphism α | H(Y) = ₐ(eY); f.d. modules Y_m with H^{m−1}Y_m ≠ 0 = H^m Y_m | yes (but large) |
| S2 Encoding and lifting (§3, P.3.6) | a quadratic presentation of R | 3-vertex algebra B (gldim ≤ 2), modules M(Y), chain data D_i, f_a, h_ρ in K^b(proj B) | **no**: obtained from roofs in a Verdier quotient |
| S3 Rectification (§4, P.4.1) | chain data | bounded B-bimodule complex P, right projective, P ⊗ᴸ M(Y) ≃ M(HY) ⊕ M(HY)[3] | yes, given the chain data |
| S4 Simulation and trivial extension (§5–6) | P with support of length l | D = B × (B ⊗ C), C = A_{l+1}/rad², X = O ⊕ T, A = D ⋉ X | yes, given P |

The final algebra has 3(l+2) simple modules (l unknown) and a number of arrows of the order of the number
of generators of a quadratic presentation of ℂG. Nothing in it is explicit, because S2 is not.

## 2. The logical interface

**(I1) Trivial extensions detect extinction.** For D of finite global dimension, X a f.d. bimodule,
A = D ⋉ X, and a f.d. D-module N inflated to A: D ⊗ᴸ_A N ≃ ⊕_{r≥0} F^r N [r] (P.6.1, via the bar
construction; also Minamoto–Yamaura). Hence pd_A N < ∞ iff F^t N ≃ 0 for some t, and F^r N ≄ 0 implies
pd_A N ≥ r (P.6.2).

Consequence (O.1, status **AI-proved** modulo P.6.1 and the bound H^q(F^rN) = 0 for q ∉ [−rg, 0] proved in
P.6.2): *findim (D ⋉ X) = ∞ as soon as the extinction times t(N) = min{t : F^t N ≃ 0} are finite and
unbounded on f.d. D-modules.* (The converse, needed only to understand what is necessary, would follow from
the Minamoto–Yamaura formula pd_A N = sup_r (pd_D F^r N + r) together with pd_D(F^rN) ≤ rg + gldim D; not
checked here.)

**(I2) Ordinary bimodules suffice up to doubling.** Any bounded complex P of D-bimodules, termwise projective
on the right, is simulated by an ordinary bimodule over a larger algebra: F² ≃ P[b] ⊗ᴸ − on one factor
(P.5.1). So the problem is: *find D of finite global dimension and a bounded right-projective bimodule
complex P with unbounded finite extinction times.*

**(I3) Selection data.** The preprint produces such P from (R, e, α) with R finitely presented. What is used:
R finitely presented (to encode it in B with finitely many arrows and relations), H exact and given by the
right-projective bimodule ₐ(eR), and the evaluation functors. Centrality of e is used only to make eY an
R-submodule and the action r ↦ θ(eα(r)e) unital and multiplicative (§3.3).

## 3. Why the preprint needs a Verdier quotient (a K-theoretic reading)

The class of F^r N in K₀(D) is [F]^r [N], and K₀(D) has finite rank n. If F^t N ≃ 0, then [N] lies in the
generalised kernel of [F], so [F^r N] = 0 for all r ≥ n while F^r N ≄ 0. Long extinction therefore forces
the iterates to be **K₀-invisible**: in the preprint F² M(Y) ≃ M(HY) ⊕ M(HY)[b] ⊕ M(HY)[b+3], whose class is
zero. This is the role of the *odd double* U ⊕ U[3] (P.3.3): the summand U = (E₀, θ(e)) exists only in the
idempotent completion of the Verdier quotient Q, whose K₀ can have infinite rank, while U ⊕ U[3] lies in Q
itself, whose K₀ is a quotient of K₀(B) = ℤ³.

At the level of R the corresponding requirement is the opposite: positivity. See O.3 below.

## 4. Steps reused below, and what was checked

| Step | Reused? | Check so far |
|---|---|---|
| P.6.1 bar decomposition, P.6.2 detection | yes (I1) | read; agrees with Minamoto–Yamaura, Cor. 4.11 and Lemma 4.13 as cited; locators **not yet read in MY17** |
| P.5.1 simulation | yes (I2) | read, signs not yet checked |
| P.4.1 rectification | possibly | read; the three-column differential squares to zero by the displayed computation (checked by hand) |
| P.3.3 odd double | possibly | read; argument checked by hand at the level of Hom sequences |
| P.3.5 diagram lifting | possibly | read, not checked |
| P.2.1 selection | no (to be replaced) | read; relations and finite quotients supported by computation for m ≤ 6 (`computations/01-…`) |

A full verification of the preprint is not a goal of this task; any step that a final construction reuses
will be verified as recorded in `LEDGER.md`.

## 5. The second mechanism in the same release (companion preprints)

The companion *A counterexample to Tachikawa's second conjecture* (OpenAI, 2026-09-23; sources read in
`.cache/companion-src/`) obtains infinite little finitistic dimension differently (its Corollary 1.3,
proof in §8): it constructs a symmetric algebra A and a nonprojective self-orthogonal module M; then
Γ = End_A(A ⊕ M)^op has infinite dominant dimension and is not self-injective, and the cosyzygies C_n of Γ
have pd C_n = n. The underlying explicit counterexample to the Auslander–Reiten conjecture (OpenAI,
2026-09-23; `.cache/ar-src/`) has eight simple modules but dimension 800 + dim F over 𝔽₂(q, H₁, H₂), and its
proof uses parameter-shifting syzygies (powers of q) and two independent twists (H₁, H₂).

This mechanism is an instance of a general elementary criterion (O.4 in note 02): failure of the strong
Nakayama conjecture for A^op gives infinite left findim A, with explicit witnesses.
