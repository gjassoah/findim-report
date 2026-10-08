# Answer to escalation 01: the simplest route to an explicit counterexample

Author: Claude Fable 5.1, 2026-10-07 (one call). Untrusted input for the task; every claim below carries a
status in the sense of the working rules. Longer than the requested 150 lines because §1 gives full proofs. Sources read: the escalation, `notes/01`, `notes/02`, and the
Auslander–Reiten preprint sources `.cache/ar-src/01–08` (not `log/`, not `codex/`). Nothing was computed by
machine in this call; "AI-proved" means a complete argument is written here and was checked by me only.

Conventions. k is a field, algebras are finite-dimensional, modules finitely generated. For a right
A-module V, V^* = Hom_{A^op}(V, A) is a left A-module. Tr is the Auslander–Bridger transpose computed from a
minimal projective presentation. Syzygies and cosyzygies are taken without projective summands.

## 0. Verdict in six lines

1. Mechanisms (a) with E simple and (b) are the same problem: a simple E with Ext^{0,1}(E, A) = 0 forces
   A ≅ End_B(B ⊕ M) with B a corner of A having one simple module fewer (§1.2, AI-proved), and conversely
   O.5. The only genuinely different version of (a) uses a non-simple E, for which §1.1 gives an equivalent
   module-theoretic criterion (a module C of projective dimension one that is ∞-torsionfree).
2. Triangular matrix algebras, and more generally gluings along stratifying ideals, cannot carry E unless a
   proper piece is already a counterexample (§1.3, AI-proved for triangular algebras).
3. Hence the smallest conceivable counterexample is End_B(B ⊕ M) for the smallest (B, M) violating the
   Auslander–Reiten conjecture, or an algebra A that is not Morita-reducible to such a corner.
4. I recommend (b): shrink the Auslander–Reiten preprint's construction (dimension 20 instead of 400 for the
   symmetric algebra, and minimal instead of bar resolutions for the bimodule F), and test it by computer.
   Candidates and their likely failure points are in §3–§4. Whether the shrunk version works depends on one
   Toda-bracket-type scalar that I could not determine without computation (§4.1).
5. I do not believe an example verifiable by hand (say dimension ≤ 30, two or three simple modules, no
   transcendental parameter) exists; the structural reasons are in §5. The most explicit achievable outcome
   is, in my judgement, an algebra with three simple modules over F_2(q, H_1, H_2) whose dimension is in the
   low thousands, with all data given by finite matrices and a proof reducing to the degree-by-degree
   invertibility of a 2 × 2 matrix of monomials.
6. Mechanism (c) is structurally the hardest to make explicit (K_0-invisibility forces the odd double); I do
   not recommend it for this goal (§2).

## 1. Three structural statements

### 1.1 The module behind E (status: AI-proved)

**Lemma 1.** Let A be finite-dimensional. The following data determine each other, with E = Tr C and
C = Tr E:

(i) a nonzero right A-module E with Ext^i_{A^op}(E, A) = 0 for all i ≥ 0;

(ii) a nonprojective left A-module C with pd C ≤ 1 such that Ext^i_{A}(Tr C, A) = 0 for all i ≥ 1
(C is ∞-torsionfree in the sense of Auslander–Bridger).

Moreover, (ii) holds if and only if C is nonprojective, pd C ≤ 1, and there is an exact sequence
0 → C → Q_2 → Q_3 → ⋯ of finitely generated projective left modules that stays exact under Hom_A(−, A);
equivalently, each C_{m−1} → Q_m (C_1 = C, C_m = coker(Q_{m−1} → Q_m)) is an injective left
add(A)-approximation. In this situation E ≅ Ext^1_A(C, A) as right modules, and the witnesses of O.4 are
C_m with pd C_m = m.

*Proof.* Let P_• → E be a minimal projective resolution and Q_i = P_i^*, so that P = Q^* by reflexivity of
finitely generated projectives. The cohomology of 0 → Q_0 → Q_1 → ⋯ at Q_i is Ext^i(E, A). Thus (i) says
that Q is exact. Put C = C_1 = coker(Q_0 → Q_1) = Tr E (the presentation P_1 → P_0 → E is minimal). Exactness
at Q_0 and Q_1 gives 0 → Q_0 → Q_1 → C → 0, so pd C ≤ 1, and C is not projective because Q_0 → Q_1 is not a
split monomorphism (its dual P_1 → P_0 is not a split epimorphism, E ≠ 0 and the resolution being minimal).
Exactness of Q at Q_i for i ≥ 2 is the sequence 0 → C → Q_2 → Q_3 → ⋯, and its Hom(−, A)-dual is P in
degrees ≥ 1, which is exact at P_i for i ≥ 1; so Hom(−, A) of the coresolution is exact except that its
H^0 is E, as stated. Conversely, given C as in (ii) with minimal presentation Q_0 → Q_1 → C → 0 (injective
on Q_0 because pd C ≤ 1), put E = Tr C = coker(Q_1^* → Q_0^*). Then Hom(E, A) = ker(Q_0^{**} → Q_1^{**}) =
ker(Q_0 → Q_1) = 0, and Ext^i(E, A) = 0 for i ≥ 1 is the hypothesis Ext^i(Tr C, A) = 0.

For the identification of the coresolution: with C_0 = Q_0 and the sequences 0 → C_{m−1} → Q_m → C_m → 0,
one computes H_m(Q^*) = Ext^1(C_{m+1}, A) for m ≥ 1 and H_0(Q^*) = Ext^1(C_1, A) (dualise the two short exact
sequences at Q_m; the kernel of Q_m^* → Q_{m−1}^* is C_m^*, the image of Q_{m+1}^* → Q_m^* is the image of
Q_{m+1}^* → C_m^*, whose cokernel is Ext^1(C_{m+1}, A)). Hence exactness of Q^* in positive degrees is
Ext^1(C_m, A) = 0 for m ≥ 2, which is the left-approximation property of C_{m−1} → Q_m, and
E = H_0(Q^*) = Ext^1(C, A). The statement pd C_m = m is O.4. ∎

*Reading.* The search for (a) is the search for a nonprojective module C of projective dimension one all
of whose iterated cosyzygies (by left projective approximations) are torsionless, that is, embed in
projectives. Since the C_m are torsionless of unbounded dimension (O.2), A has infinitely many
indecomposable torsionless modules; this is a cheap necessary condition to check on a candidate. The
converse direction is a search strategy: enumerate small nonprojective torsionless C with pd C = 1 and
iterate the minimal left add(A)-approximation; the first non-injective step kills the candidate.

### 1.2 A simple E is an Auslander–Reiten counterexample on a corner (status: AI-proved)

**Lemma 2.** Let S be a simple right A-module with Hom_A(S, A) = 0 = Ext^1_A(S, A). Let e be the sum of the
primitive idempotents of S in a decomposition of 1 and f = 1 − e, B = fAf, M = eAf (a right B-module). Then
left multiplication A → End_B(Af) = End_B(B ⊕ M) is an isomorphism of algebras. In particular, A has exactly
one simple module more than B, and M is not projective over B.

*Proof.* For a right A-module V put η_V : V → Hom_B(Af, Vf), v ↦ (x ↦ vx). Applying (−)f = − ⊗_A Af (exact)
to η_V gives an isomorphism, because Hom_B(Af, N)f ≅ Hom_B(fAf, N) = N by restriction; so ker η_V and
coker η_V are killed by f, that is, they are modules over A/AfA, whose simple modules are the copies of S.
If Hom_A(S, V) = 0 then ker η_V = 0. If also Ext^1_A(S, V) = 0 then Ext^1_A(T, V) = 0 for every
A/AfA-module T (induction on length), so V → Hom_B(Af, Vf) splits, and the cokernel is an A/AfA-module that
is a direct summand of W = Hom_B(Af, Vf); but Hom_A(T, W) = Hom_B(Tf, Vf) = 0 for every A/AfA-module T, so
the cokernel is zero. Apply this to V = A. The decomposition Af = fAf ⊕ eAf gives End_B(Af) = End_B(B ⊕ M).
If M were projective over B, End_B(B ⊕ M) would be Morita equivalent to B, which has fewer simples. ∎

Together with O.5 this makes mechanism (a) with E simple literally the same as mechanism (b): the pair
(A, S) with Ext^{≥0}(S, A) = 0 is (End_B(B ⊕ M), top of Hom_B(B ⊕ M, M)) for B = fAf and M = eAf, and
Ext^{≥1}_B(M, B ⊕ M) = 0 is then the classical Auslander–Reiten equivalence (which I recall from
Auslander–Reiten 1975 but have not re-read; only the direction O.5 is needed below). Computationally (b) is
better: Ext^i_B(M, B ⊕ M) lives on the smaller algebra B, whereas Ext^i_A(S, A) lives on
A = End_B(B ⊕ M), whose dimension is dim B + 2 dim M + dim End_B(M).

### 1.3 Triangular algebras do not help (status: AI-proved)

**Lemma 3.** Let A = [[B, 0], [M, C]] with M a (C, B)-bimodule, and let E ≠ 0 be a right A-module with
RHom_A(E, A) = 0. Write E = (X, Y, φ) with X ∈ mod B, Y ∈ mod C, φ : Y ⊗_C M → X, and let
Z = cone(φ : Y ⊗^L_C M → X) ∈ D^b(mod B). Then RHom_B(Z, B) = 0, and either Z ≠ 0, in which case the left
little finitistic dimension of B is infinite, or Z = 0, in which case E ≅ Y ⊗_C e_C A and
RHom_C(Y, C) = 0 with Y ≠ 0 (so C fails the strong Nakayama conjecture and left findim C = ∞ by O.4).

*Proof.* Right A-modules are triples as stated; e_B A = (B, 0, 0) and e_C A = (M, C, id). The functor
i_* : X' ↦ (X', 0, 0) is exact with left adjoint i^*(X, Y, φ) = coker φ and Li^*(E) = Z (resolve E; or use
the triangle j_!Y → E → i_*Z with j_!Y = (Y ⊗^L_C M, Y, id) and the map (φ, id)). Hence
RHom_A(E, e_B A) = RHom_B(Li^*E, B) = RHom_B(Z, B), which vanishes. If Z = 0 then E ≅ j_!Y and
RHom_A(E, A) = RHom_C(Y, j^*A) = RHom_C(Y, C) with j^*A = Ae_C = C. If Z ≠ 0, let P → Z be a minimal
bounded-above complex of finitely generated projective right B-modules with top nonzero term P^b. Then
P^* is an exact complex 0 → (P^b)^* → (P^{b−1})^* → ⋯ of projective left modules whose cokernels
C_n = coker((P^{n+1})^* → (P^n)^*) have finite projective dimension ≤ b − n and satisfy
Ω C_n = C_{n+1}. If left findim B = d < ∞ then C_{n+d} is projective for all n, in particular C_{b−1},
so (P^b)^* → (P^{b−1})^* splits, so P^{b−1} → P^b is a split epimorphism, contradicting minimality. ∎

I recall (not re-read) the bound findim [[B,0],[M,C]] ≤ findim B + findim C + 1 of Fossum–Griffith–Reiten
and Happel's reduction for recollements of bounded derived categories (finite findim passes to and from the
two pieces); Lemma 3 is the part of this that the present question needs, with a self-contained proof.
Consequence for the search: the idempotent ideals of a candidate A must all be non-stratifying. In the
preprints this is visible: M1 uses a square-zero ideal, M2's final algebra End_Λ(Λ ⊕ Z) is glued along the
ideal of maps factoring through add Λ.

## 2. Question 1: which mechanism

**(a) with E simple = (b).** By Lemma 2 and O.5 these are the same object seen from two sides; (b) is the
better side to compute on (§1.2). I take (b) as the recommended mechanism, in the specific form of the
Auslander–Reiten preprint's conversion principle (its Proposition "Triangular conversion"), whose input is
small: a symmetric algebra A, a module X, a side-projective bimodule F and a stable map v : X → FX such
that δ^a : H^a ⊕ H^a → \underline{Hom}(X, FX[a]) is surjective with nonzero kernel for a = 0 and bijective
for a > 0. Everything else in that preprint serves to produce such an F; that is where the size comes from
(not 800 + dim F with small F: F is a kernel of a map from a free A^e-module of rank dim 𝒴, so dim F is of
the order of dim A^e times the size of a cosyzygy; with A of dimension 400 this is enormous).

**(a) with E non-simple.** Lemma 1 turns it into a search for a torsionless module C of projective
dimension one whose iterated minimal left projective approximations stay injective forever. I see no
mechanism producing such a C other than through a Gorenstein-projective-like module over a bigger algebra
(forward half of a complete resolution), and the obvious way to cut off the backward half, a triangular
extension, is excluded by Lemma 3. A cancellation phenomenon (Hom(E, I^i(A)) ≠ 0 for every term of the
minimal injective coresolution of A, but with exact Hom complex) is conceivable for non-simple E and would
give an algebra satisfying the generalised Nakayama conjecture but not the strong one; I have no candidate
and consider this a research question rather than a shortcut (status: heuristic).

**(c).** The trivial-extension route needs an endofunctor F of D^b(mod D) with unbounded finite extinction
times. Since [F] acts on K_0(D) ≅ Z^n, every N with F^t N ≃ 0 has [F^r N] = 0 for r ≥ n while F^r N ≄ 0:
the iterates must be K_0-invisible, which for a module-like object forces something like the odd double
U ⊕ U[odd] (`notes/01`, §3). For hereditary D of finite type extinction times are bounded by the number of
indecomposables (every object is a sum of shifted indecomposables and F acts by a Boolean matrix on their
support; status: AI-proved, two lines), and the natural tame candidate (Kronecker, shift the tubes
λ ↦ qλ and kill one) fails exactly on the K_0 count: F(R_λ) = 0 and F(R_{qλ}) = R_λ have incompatible
classes. So (c) cannot be made small or explicit without reproducing the Verdier-quotient lifting, and O.3
excludes all easy selection data. Not recommended for the stated goal.

**(d) Tachikawa's second conjecture.** A self-injective B with a nonprojective M with Ext^{>0}_B(M, M) = 0
gives (b) for free (Ext^{>0}(M, B) = 0). In the stable category of a symmetric B this asks for an object
with \hat{Ext}^i(M, M) = 0 for i ∉ {0, −1}. The ingredient of the preprint, X = s over T with Tate
cohomology k[τ] in degrees 3m and k in degrees −3m − 1, is as close to this as a single module gets: the
two twists are then needed to cancel the remaining classes, and they act on the bimodule side, so one lands
in (b) with a triangular Λ anyway. I do not see a module-level device replacing the twists (status: open;
the one natural attempt, a universal self-extension, fails: see §4.3).

## 3. Question 2: three candidates

All candidates work over k = F_2(q, H_1, H_2) (or a field containing elements q, H_1, H_2 such that
q^m ≠ 1 and H_1^m ≠ H_2^m for the finitely many m tested), with the preprint's C (dim 10), T = C ⋉ DC
(dim 20, symmetric), the simple s at f, Ext^*_T(s, s) = k[τ], |τ| = 3, and the twists h_H of T (identity
on C, scalar H on DC). I did not re-verify the preprint's computations of Ext^*_T(s, s), of the cocycle p, or
of the lifts; the candidates inherit those as hypotheses.

### Candidate 1: the one-factor shrink of the Auslander–Reiten construction

Data. A := T, X := s. 𝒞 := cone(τ : T[−3] → T) in the stable category of T-bimodules, with the small
representative 𝒞 = (P_2 ⊕ T)/Ω^3_{T^e}T obtained by pushing out a minimal bimodule resolution along a
cocycle representative Ω^3_{T^e}T → T of τ (dimension dim Ω^2_{T^e}T + 20, so a few hundred). N := 𝒞[1],
represented by one bimodule cosyzygy. Lifts f_H : U_H = T_{h_H} → N with top component β_H : U_H → ΩT,
1 ↦ ξ_H = Σ_w h(w) ⊗ w^*: the preprint's Lemmas "lift:B" and "lift:G" are one-factor statements (B is a
homotopy Q → P[−1] with defect bε in degree 0, and pB = dG + Gd uses the boundary identity of the cocycle),
so Φ = (B, G) is a graded map Q → Cone(p)[1] commuting with the differential in positive degrees and gives
f_H after passing to cokernels, with evaluation H·β_0 where β_0 ∈ H^{−1} = \underline{Hom}(s, Ωs) is the
class of 1 ↦ f^*. Rescale by H^{−1}, take g_1, g_2 with the same evaluation w, and set
F := ker(U_{H_1} ⊕ U_{H_2} ⊕ P(N) → N), Λ_1 := [[T, 0], [F, T]], Z := (X, Y, ι) as in the preprint's
(conv:finite-module), Γ_1 := End_{Λ_1}(Λ_1 ⊕ Z), S := the simple top of Hom(Λ_1 ⊕ Z, Z).

What I checked (status: AI-proved, given the preprint's Lemma res:polynomial and its stable duality).
With H^a = \underline{Hom}(s, s[a]) one has H^{3m} = k, H^{−3m−1} = k (m ≥ 0), all other H^a = 0. The
triangle X[−3] → X → 𝒞X → X[−2] gives W^a := \underline{Hom}(X, 𝒞X[a]) = k for a ∈ {0, 1} and 0 otherwise:
the degree-0 class is the bottom inclusion ι, the degree-1 class projects isomorphically to H^{−1}. Hence
for V^a = \underline{Hom}(X, FX[a]) the fibre sequence 𝒞X → FX → X ⊕ X → 𝒞X[1] gives V^a ≅ (H^a)^2 for
every a ≥ 1 (for a = 1 both sides are 0, for a ≥ 2 because W^a = W^{a+1} = 0), and in degree 0 an exact
sequence 0 → W^0/(w[−1]∘H^{−1}) → V^0 → k·(diagonal) → 0. The twist acts on H^{3m} by H^{−m}, so for a = 3m > 0
the comparison δ^a is the matrix [[H_1^{−m}, 1], [H_2^{−m}, 1]] with determinant H_1^{−m} + H_2^{−m} ≠ 0, and
δ^a = 0 = V^a for a ≢ 0 mod 3; so every positive-degree hypothesis of the conversion principle holds.

The remaining condition is the scalar c defined by w[−1] ∘ β_0 = c·ι in W^0 = k. It is the Toda bracket
⟨τ, β_0, β_0⟩ ⊂ H^0, which has zero indeterminacy (τH^{−3} + H^1β_0 = 0), so c is a well-defined element of
k, depending on nothing but T and s. If c ≠ 0 then V^0 = k, δ^0 is surjective with one-dimensional kernel,
and the conversion principle gives Ext^{>0}_{Λ_1}(Z, Z ⊕ Λ_1) = 0 with Z nonprojective; then
Ext^i_{Γ_1}(S, Γ_1) = 0 for all i ≥ 0 by O.5, and findim Γ_1 = ∞ by O.4. If c = 0 then V^0 = k^2,
im δ^0 = k·v, and Ext^1_{Λ_1}(Z, Z) ≅ coker δ^0 = k: the candidate fails at Ext^1.

Size. Λ_1 has 4 simple modules and dimension 40 + dim F; Γ_1 has 5 simple modules. dim F is governed by
the minimal bimodule resolution of T (dim T^e = 400): my estimate is that dim F lies in the low thousands.
This is explicit (all data are finite matrices) but not hand-checkable; the Ext computation in degrees
≤ 6 is feasible in QPA or Sage over F_2(q, H_1, H_2), or over F_{2^n} with q, H_1, H_2 of large order.

Necessary conditions. Hom_{Γ_1}(S, Γ_1) = 0 because the projective cover P → Z is surjective (O.5 (b)).
The syzygies of S over Γ_1 are Hom(Λ_1 ⊕ Z, K_j) for the kernels K_j of the add(Λ_1 ⊕ Z)-approximations in
the resolution of Z; their growth, which O.2 demands, has to come from dim Hom_{Λ_1}(Z, K_j), and the source
of that growth is the infinite negative Tate cohomology of X (H^{−3m−1} = k for all m): the Betti numbers of
Z itself over Λ_1 are constant (two per degree, as P_Z is the cone of E(P) → J(P) with P of constant rank
one). I have not computed these dimensions (status: heuristic).

### Candidate 2: a smaller C

The preprint's C is designed so that (i) s is exceptional over C (Ext^{>0}_C(s, s) = 0) with an infinite
non-periodic minimal resolution of constant Betti number one, driven by the parameter shift ℓ_i = x + q^i y
on the quantum exterior corner, and (ii) RHom_C(s, C) ≅ s^r[−2], a single simple right module in a single
degree. These two facts are all that the passage to T = C ⋉ DC uses (its Lemma res:polynomial): the
triangle s[2] → T ⊗_C R → s → s[3] then gives Ext^*_T(s, s) = k[τ] with |τ| = 2 + 1. A smaller C with (i)
and RHom_C(s, C) ≅ (simple)[−d] would give a symmetric T of dimension 2 dim C with Ext^*_T(s, s) = k[τ],
|τ| = d + 1, and Candidate 1 goes through verbatim with 3 replaced by d + 1 (the profile of cone(τ) is then
k in degrees 0 and d − 1, and the Toda bracket lands in H^0 with zero indeterminacy as soon as d ≥ 2).
Both conditions are checkable by computer in bounded degrees for a 2-vertex algebra with one parameter q:
compute the minimal resolution of s to degree 6 and Hom(−, C) of it. Requirements that a search should
impose from the start: C rep-infinite (a periodic s cannot have the gap pattern in Tate cohomology), a
corner containing k⟨x, y⟩/(x², y², xy − qyx) or another algebra with a parameter-shifting module of constant
Betti numbers, and dim C ≤ 9. I have not run such a search; my expectation is that 10 is close to minimal
for this design (status: heuristic).

### Candidate 3: the explicit near miss as a test bed

Replace F by U_{H_1} ⊕ U_{H_2} (no cone, no fibre). Then Λ_0 := [[T, 0], [T_{σ_1} ⊕ T_{σ_2}, T]] is an
80-dimensional algebra with 4 simple modules, given by an explicit quiver with relations (two copies of T,
and two sets of arrows from the second copy to the first, twisted by h_{H_1}, h_{H_2}), and
Z_0 := (s, Y_0, ι) with Y_0 = (s ⊕ s ⊕ Tf)/{(x, x, i(x))}, dim Z_0 = 1 + (2 + 8 − 1) = 10. Here
FX = X ⊕ X, V^a = (H^a)^2, v = (id, id), and δ^a(g, j) = (H_1^{−m}g + j, H_2^{−m}g + j) for a = 3m. By the
preprint's sequence (conv:end-cohomology), Ext^a_{Λ_0}(Z_0, Z_0) = 0 for a ≥ 2, Ext^1_{Λ_0}(Z_0, Z_0) ≅
coker δ^0 = k, \underline{End}(Z_0) ⊇ ker δ^0 ≠ 0, and Ext^{>0}_{Λ_0}(Z_0, Λ_0) = 0 (total acyclicity of the
cone does not use δ). (Status: plausible; it follows the preprint's §2, which I read but did not verify.)
This is a hand-sized object on which the whole machinery (complete resolutions, the two-column Hom
computation, the twist eigenvalues H_i^{−m}) can be checked by computer in low degrees before investing in
Candidate 1, and it isolates exactly the one class that the cone-and-fibre construction removes.

## 4. Question 3: the step most likely to fail

### 4.1 Candidate 1: the Toda bracket c = ⟨τ, β_0, β_0⟩

Everything in Candidate 1 except c is either inherited from the preprint or checked above. The two-factor
construction avoids c because the Koszul profile of two cones has a gap (W^1 = W^2 = 0), whereas any single
cone of a power τ^r has two adjacent top degrees {3r − 3, 3r − 2} (computed from the same long exact
sequences), so a one-factor construction always meets this bracket. I have no structural argument for
c ≠ 0. Juggling the bracket against the pairing H^0 × H^{−1} → H^{−1} suggests c ≠ 0 if and only if
⟨β_0, β_0, β_0⟩ ≠ 0 in H^{−4} (status: heuristic; the juggling formula for Toda brackets with vanishing
indeterminacy is standard, but I have not checked the sign-free form needed here). The decisive computer
test is dim Ext^1_{Λ_1}(Z, Z), or, cheaper and on T alone, the following: lift β_0 : s → Ωs to w : s → N⊗s
along the top projection (possible since τβ_0 = 0) and decide whether w[−1] ∘ β_0 : s → Ω(N ⊗ s) ≅ 𝒞 ⊗ s
is stably zero (shift conventions as in the preprint: [1] = Ω^{−1}); this is linear algebra over k on modules of dimension at most a few hundred.

Second risk: the preprint's inputs that I did not verify (Ext^*_T(s, s) = k[τ], the cocycle table and the
boundary identity (coc:boundary), Lemma lift:evaluation). A wrong sign or coefficient there breaks both
the preprint and Candidate 1; the preprint's own cross-checks (nonzero evaluation q^3 of p on the cycle
q^2[t|x|J] + [t|y|J]) are finite and should be recomputed first.

### 4.2 Candidate 2: existence of a smaller C

The hard requirement is (ii), RHom_C(s, C) concentrated in one degree with simple value, together with
exceptionality of s and non-periodicity of its resolution. These pull in different directions: non-
periodicity needs a rep-infinite corner with a parameter-shifting module, exceptionality needs the
parameter-shifted syzygies never to map back nontrivially to s, and (ii) needs the dual complex to be exact
except in one degree. The preprint's C satisfies all three with its vertex f, the arrows u, t and the
element n; removing n or j breaks the multiplication table in ways I could not repair by hand. A search may
well return nothing below dimension 10.

### 4.3 Candidate 3: it is a near miss by design, and cheap repairs fail

The only way Candidate 3 fails as a test bed is if the conversion machinery itself is wrong, which the
test would reveal. It cannot be promoted to a counterexample by a universal extension: if ξ spans
Ext^1(Z_0, Z_0) and 0 → Z_0 → Z_0' → Z_0 → 0 is the extension ξ, then Ext^2(Z_0', Z_0) = 0 forces
Ext^1(Z_0', Z_0') → Ext^1(Z_0', Z_0) to be surjective, and Ext^1(Z_0', Z_0) ≅ k because id ↦ ξ is onto
Ext^1(Z_0, Z_0) and ξ·ξ = 0 (status: AI-proved from the two long exact sequences). The class has to be
removed on the algebra side, which is what the cone and the fibre do.

## 5. Question 4: why no elementary counterexample, and what is achievable

**Structural obstructions (each with its status).**

1. By Igusa–Todorov (recalled, not re-read), representation dimension ≤ 3 implies finite findim, so any
   counterexample has representation dimension ≥ 4. Algebras known to have representation dimension ≥ 4
   are of the type of exterior algebras on ≥ 3 generators (Rouquier; recalled) and constructions on top of
   them; nothing with the flavour of a quiver with two or three vertices and a handful of arrows is known
   to have representation dimension ≥ 4, and all the usual small classes (monomial, special biserial,
   representation-finite, hereditary, tilted, torsionless-finite, rad^3 = 0, rad^{2l+1} = 0 with A/rad^l
   representation-finite) have findim < ∞ (recalled). In particular A must have infinitely many
   indecomposable torsionless modules, which Lemma 1 also shows directly (the C_m are torsionless of
   unbounded dimension).
2. A is not self-injective (Hom(E, A) ≠ 0 for every E over a self-injective algebra), not Gorenstein
   (findim = idim < ∞), and no idempotent ideal of A is stratifying unless a corner or quotient is already
   a counterexample (Lemma 3 for triangular algebras, AI-proved; Happel's reduction for general
   recollements, recalled). So A cannot be assembled from good pieces by triangular or recollement gluing;
   the gluing must be of trivial-extension or endomorphism-algebra type, and both inflate the dimension
   (dim End_B(B ⊕ M) = dim B + 2 dim M + dim End_B(M)).
3. The resolution of E has unbounded Betti numbers (O.2), so the cheapest source of infinite resolutions,
   parameter-shifting modules of constant Betti number (Schulz), cannot carry E by itself; growth has to
   be manufactured, by a tensor square (the preprint) or by add(Λ ⊕ Z)-approximations (Lemma 2 and O.5).
   Over a finite field there is no parameter shift at all (every q has finite order), so either the field
   is infinite or the growth mechanism must also produce non-periodicity; the preprints use both a
   transcendental q and characteristic two (for signs).
4. For the simple-E route, Lemma 2 says the algebra is End_B(B ⊕ M) for an Auslander–Reiten counterexample
   (B, M); the positive results on that conjecture (rad^3 = 0, quantum complete intersections, commutative
   complete intersections, representation-finite algebras; recalled from the preprint's introduction and
   memory, not re-read) exclude the smallest B one would try, and a counterexample M must itself have
   Ext^{>0}(M, M) = 0 with an infinite resolution, which the Schulz modules fail exactly at Ext^1.

Together these make me believe (status: heuristic, no theorem) that no counterexample of dimension below
a few hundred exists, and none at all over F_2 with the mechanisms known today.

**The most explicit achievable outcome.** In order of decreasing explicitness:

- If c ≠ 0 (§4.1): Γ_1 = End_{Λ_1}(Λ_1 ⊕ Z) with 5 simple modules over F_2(q, H_1, H_2), dim Λ_1 in the low
  thousands, with the proof of findim Γ_1 = ∞ reducing to (i) the finite identities on the 10-dimensional C
  (multiplication table, resolution ⋯ → Ce --ℓ_1--> Ce --ℓ_0--> Ce --u--> Cf → s, cocycle table), (ii) the
  one-factor profile computation of §3, (iii) the determinant H_1^{−m} + H_2^{−m} ≠ 0 for all m ≥ 1, and
  (iv) three general lemmas (the conversion principle, O.5, O.4). The witnesses C_n = Tr Ω^{n−1} S are
  explicit cokernels of dualised projective maps.
- If c = 0: the preprint's own two-factor construction with minimal instead of bar resolutions, which
  reduces dim F by a large factor but keeps 8 + 1 simple modules and dimension in the tens of thousands.
- In either case the human-verifiable part is the proof structure, not the algebra: all degree-dependent
  statements come from a one-parameter recursion (ℓ_i = x + q^i y) and a 2 × 2 determinant, and the large
  bimodule F enters only through its stable type. A verification should therefore target the finite
  identities on C and T, the conversion principle, and O.5, and treat F as a black box specified by a
  triangle.

**What to compute first.** (1) Recompute the preprint's finite data on C and T (multiplication table,
Lemma res:base, the cocycle evaluation q^3). (2) Candidate 3 in degrees ≤ 6 (dim Ext^a_{Λ_0}(Z_0, Z_0)
should be 1, 0, 0, 0, 0 for a = 1, …, 5, and Ext^a(Z_0, Λ_0) = 0). (3) The Toda bracket c on T. (4) Only
then build F minimally and test Candidate 1.
