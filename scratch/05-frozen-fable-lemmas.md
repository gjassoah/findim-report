# Frozen claims for Codex job 05

Conventions: k a field, algebras finite-dimensional, modules finitely generated; V^* = Hom(V, A).

### 1.1 The module behind E

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

### 1.2 A simple E is an Auslander–Reiten counterexample on a corner

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

### 1.3 Triangular algebras do not help

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


### Claim 4

For hereditary D of finite type extinction times are bounded by the number of
indecomposables (every object is a sum of shifted indecomposables and F acts by a Boolean matrix on their
support),
(Context: D finite-dimensional hereditary of finite representation type, F = X ⊗ᴸ_D − for a D-bimodule X; claim: finite extinction times of F on D^b(mod D) are bounded by the number of indecomposable D-modules.)
