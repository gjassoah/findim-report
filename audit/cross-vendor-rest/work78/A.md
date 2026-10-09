Model: Claude Opus 5.5 (claude-opus-5-5); effort: unknown (low setting requested by caller).

# Phase A (blind) check of Sections 7 and 8

Input: only `<package>/statements.pdf` (pp. 12-15 rendered) and its text extraction.
Status words: every verdict below is an AI check (AI-proved at best). Nothing here is "proved" in the
human-refereed sense.

## Conventions fixed (as in the document unless stated otherwise)

- Left modules, compositions right to left; an arrow a: i -> j lies in e_j A e_i.
- Cohomological grading, K[s]^n = K^{n+s}, d_{K[s]} = (-1)^s d_K; tensor product of complexes
  d(u (x) v) = du (x) v + (-1)^{|u|} u (x) dv (Section 4 convention).
- K_l: quiver 0 -> 1 -> ... -> l, c_i in 1_i K_l 1_{i-1}, rad^2 = 0. W = simple right module at l.
- Triangular algebra Lambda = (E 0; F E): elements (a,f,b), left modules = triples (M,N,eta: FM -> N),
  F = e_2 Lambda e_1, its right E-action from the corner a (acting on M), left action from b.
- C^n(P) = coker(P^{n-1} -> P^n); so P^{<=0} -> C^0(P) is a projective resolution and
  0 -> C^n -> P^{n+1} -> C^{n+1} -> 0.
- Background statements used are marked [BG x.y]. Standard results are marked [STD, confidence].

## Proposition 7.2 — PROVED

Setup checks.
(0a) (7.1) is exact: c_i· sends 1_{i-1} -> c_i, c_{i-1} -> c_i c_{i-1} = 0; image k c_i = rad 1_iK_l,
kernel k c_{i-1} = rad 1_{i-1}K_l (for i=1 kernel 0). Cokernel of c_l· is 1_lK_l / k c_l = W. So
R_W (R_W^n = 1_{l+n}K_l, -l <= n <= 0, differential c_{l+n+1}·) is a projective resolution of W.
(0b) O is a (B_1,B)-bimodule: a left K_l-action on ⊕_i P^{a+i} commuting with both B-actions is the
same as bimodule maps 1_{i-1}O -> 1_iO with consecutive composites 0; d_P is a bimodule map and d^2=0.
O is finite-dimensional and, as a right B-module, ⊕ P^{a+i} is projective.

Step 1 (Phi on B-complexes). Modules over Delta = B x B_1 are pairs; a complex N with N = pi_0 N has a
K-projective resolution over B, which is K-projective over Delta. Since X pi_0 = O and Y pi_0 = 0,
Phi N = X (x)^L_Delta N = O (x)^L_B N. O is a flat right B-module, so O (x)_B - is exact on modules,
hence preserves acyclicity of arbitrary (unbounded) complexes, and O (x)^L_B N = O (x)_B N, a complex of
left B_1-modules (component pi_1).

Step 2 (Phi on B_1-complexes). For a complex M of left B_1-modules, Phi M = Y (x)^L_{B_1} M (since
X pi_1 = Y). Q := B (x)_k R_W is a bounded complex of (B,B_1)-bimodules with terms
B (x) 1_jK_l = (1 (x) 1_j)B_1, projective right B_1-modules, and Q -> Y = B (x) W is a quasi-isomorphism
of bimodules (Kunneth over k). A bounded complex of projective right modules is K-flat, so
Y (x)^L_{B_1} M = Q (x)_{B_1} M in D(Mod B). Further (1(x)1_j)B_1 (x)_{B_1} M = (1(x)1_j)M with B acting
via b (x) 1, and the differential c_{j+1}· becomes the action of 1 (x) c_{j+1}.

Step 3 (compose). Take M = O (x)_B N. Then (1(x)1_j)M = P^{a+j} (x)_B N and 1(x)c_{j+1} acts as
d_P^{a+j} (x) 1. Hence Phi^2 N = Tot of the double complex with column n in [-l,0] equal to
P^{b+n} (x)_B N (because a+l+n = b+n), total degree of P^{b+n}(x)N^q equal to n+q, differential
d_P (x) 1 + (-1)^n (1 (x) d_N).
(P (x)_B N)[b] (P is a bounded complex of right-projective modules, hence K-flat, so (x)=(x)^L) has
degree-m term ⊕_{p+q=m+b} P^p (x) N^q; putting p = b+n gives n+q = m: same terms; its differential is
(-1)^b(d_P (x) 1) + (-1)^{b+p}(1 (x) d_N) = (-1)^b d_P (x) 1 + (-1)^n 1 (x) d_N.
The two differentials differ only in the sign of the horizontal part; multiplying column n by
(-1)^{bn} is an isomorphism of complexes of left B-modules (B acts on P^{b+n} (x) N through the left
action on P). Hence Phi^2 N ≅ (P (x)^L_B N)[b] in D(Mod Delta) (concentrated at pi_0). Only an
isomorphism of objects is claimed and proved (no naturality needed later).

Step 4 (global dimension). gldim Delta = max(gldim B, gldim B_1) on each side. Let M be a left
B_1 = B (x)_k K_l-module, M_j = (1(x)1_j)M. Since c_j maps vertex j-1 to j, U_j = ⊕_{i>=j} M_i are
submodules, U_j/U_{j+1} ≅ M_j (x)_k S_j with S_j the simple left K_l-module at j (arrows act by 0).
The simple left K_l-module S_j has the resolution K_l1_l -> ... -> K_l1_{j+1} -> K_l1_j -> S_j of length
l-j (left projective K_l1_i has basis 1_i, c_{i+1}). Tensoring over k a B-projective resolution of M_j
(length <= dL) with it gives a resolution of M_j (x)_k S_j by modules Be (x) K_l1_i = B_1(e(x)1_i),
projective, of length <= dL + l - j. The filtration gives pd M <= dL + l. Right modules: same with the
right simples at j, whose resolutions (7.1)-type have length j <= l: pd <= dR + l. With
gldim B <= dL, dR this gives left/right gldim Delta <= dL + l, dR + l.
[STD: left gldim of a f.d. algebra is attained on f.g. modules; high confidence. Not even needed: the
argument above works for arbitrary modules.]

Remark. The prose claim Y (x)^L_{B_1} O ≅ P[b] is the case N = B of Steps 2-3.
(In Step 4, "Be" stands for any projective B-module; L (x)_k K_l1_i is a summand of a free B_1-module.)

## Theorem 7.3 — PROVED (from background)

Quantifiers: A and l are built from P alone, and P is one complex for all Y [BG 6.18: "there exists P
... such that for every Y", "P does not depend on Y"]. So one algebra serves all Y. OK.

Steps.
1. R finitely presented => presentation with relations of degree <= 2 (Section 6.2 prose; the argument
   given there is the standard one and checks out). Construction 6.2 gives B; [BG 6.4]: every left and
   right B-module has pd <= 2, so dL = dR = 2; M exact, faithful on objects (M(Y)=0 only if Y=0).
2. [BG 6.18] gives P bounded, terms f.d. bimodules projective on the right, P (x)^L_B M(Y) ≅
   M(HY) ⊕ M(HY)[3]. Choose a <= b with P^j = 0 outside [a,b] (if P = 0 take a=b=0), l = b-a.
3. Prop 7.2 (proved above): Delta, X, Phi; left/right gldim Delta <= l+2. A := Delta ⋉ X, f.d.
4. Fix Y with extinction time t >= 1 (so H^{t-1}Y ≠ 0 = H^tY). N := M(Y), f.d. nonzero left B-module,
   regarded as Delta-module through pi_0 and inflated to A.
5. Induction with Prop 7.2 (applied to the complexes F^j M(Y)[jb], F = P (x)^L_B -, using only that Phi
   is a functor commuting with shifts): Phi^{2j} N ≅ F^j M(Y)[jb] for all j >= 0.
   [BG 6.20]: F^j M(Y) ≅ ⊕_{r=0}^j (M(H^jY)[3r])^{binom(j,r)}; zero iff H^jY = 0.
6. Upper bound: Phi^{2t} N ≅ 0. [BG 4.5] with dL = dR = l+2 and t' = 2t gives pd_A N < ∞ and
   pd_A N <= (l+2) + (2t-1)(l+3). (If 4.5's t is meant to be the minimal extinction time T <= 2t, the
   bound for T is smaller; either reading gives the claim.)
7. Lower bound: Phi^{2t-2} N ≅ F^{t-1}M(Y)[(t-1)b] ≠ 0 since H^{t-1}Y ≠ 0 and M is faithful.
   [BG 4.4, "in particular"] gives pd_A N >= 2t-2. (Sanity of that "in particular": Phi^r N lies in
   D^{<=0} because derived tensor products of complexes in D^{<=0} with a bimodule stay in D^{<=0};
   a nonzero object of D^{<=0}(mod) has pd >= 0 by [BG 4.3].)
8. Unbounded extinction: modules Y with finite extinction times t unbounded give N with
   2t-2 <= pd_A N < ∞, so findim A = ∞.

Comments. The bound 2t-2 is not sharp in this argument (Phi^{2t-1}N may also be nonzero); the statement
only claims the inequality. "∆ of finite global dimension": <= l+2 both sides.

## Corollary 7.4 — PROVED (from background)

1. [BG 5.17]: (R,Psi) over C, R finitely presented, and for every m >= 1 a f.d. Y_m of extinction time
   exactly m. Apply Theorem 7.3 (one A, one l, independent of m): N_m := M(Y_m) has
   2m-2 <= pd_A N_m <= (l+2)+(2m-1)(l+3) < ∞. Hence findim A = ∞.
2. gldim Delta <= l+2 on both sides (Prop 7.2 with dL = dR = 2 by [BG 6.4]).
3. Simple modules. X is an ideal of A with X^2 = 0, so X ⊆ rad A and simple A-modules = simple
   Delta-modules = simple B-modules ⊔ simple B_1-modules. B = kQ/(J2), J2 inside paths of length 2,
   Q acyclic with 3 vertices: e_iBe_i = k, B basic with 3 simples (each 1-dimensional).
   B_1 = B (x)_k K_l: the ideal rad B (x) K_l + B (x) rad K_l is nilpotent with quotient
   k^3 (x) k^{l+1} = k^{3(l+1)}, so 3(l+1) simples. Total 3 + 3(l+1) = 3(l+2). OK.
Note: l depends on the complex P produced by Theorem 6.18 (not computed); the corollary only asserts
existence of some l, which is fine.

## Lemma 8.2 — PROVED (main isomorphisms, Ext identification, vanishing); the clause "compatible with
## composition and with additive functors that preserve the complexes involved" is imprecise

(i) Ext^a(M,L) = 0 (a>0, L projective, not nec. f.g.): P^{<=0} -> M is a projective resolution, so for
a >= 1 Ext^a(M,L) is the cohomology of Hom(P,L) at Hom(P^{-a},L) (both neighbours Hom(P^{-a±1},L)
belong to the truncated complex when a >= 1). Hom(P,L) is exact (L summand of A^(I), finite generation),
so Ext^a(M,L) = 0.

(ii) Key claim: for P' totally acyclic and W exact of f.g. projectives,
H^0 Hom(P',W) -> Hom-stable(C^0P', C^0W), [f] |-> C^0(f), is an isomorphism.
- Well defined: if f = dh + hd, then on C^0 the term d_W h^0 lands in im d_W^{-1} = 0 in C^0W, and
  h^1 d_P^0 factors through P^1 (projective). So C^0(f) factors through a projective.
- Surjective: given g: C^0P' -> C^0W, the comparison theorem lifts g on P'^{<=0} -> C^0P' (projective
  resolution) to W^{<=0} -> C^0W (exact). For n >= 0 inductively: the map C^nP' -> C^nW -> W^{n+1}
  extends along C^nP' -> P'^{n+1} because Ext^1(C^{n+1}P', W^{n+1}) = 0 by (i) applied to P'[n+1]
  (W^{n+1} projective); the extension induces C^{n+1}P' -> C^{n+1}W. This is a chain map lifting g.
- Injective: if C^0(f) = beta alpha through projective L, extend alpha along C^0P' -> P'^1 (by (i))
  and lift beta along W^0 -> C^0W; h^1 := beta' alpha' (other h = 0) gives C^0(dh+hd) = C^0(f). So
  WLOG C^0(f) = 0. Then f^{<=0} is a lift of 0 between a projective resolution and an exact complex,
  hence null-homotopic: h^n (n <= 0) with f^n = dh^n + h^{n+1}d (n <= -1), f^0 = d h^0. Put h^1 = 0
  and, for n >= 1, h^{n+1}: P'^{n+1} -> W^n with h^{n+1}d^n = f^n - d h^n: the right side kills
  im d^{n-1} (compute f^n d^{n-1} - d h^n d^{n-1} = d f^{n-1} - d(f^{n-1} - d h^{n-1}) = 0), so it is
  defined on C^nP' ⊆ P'^{n+1} and extends by Ext^1(C^{n+1}P', W^n) = 0. So f is null-homotopic.
(iii) Degree a: Hom(P,W)^a has the same terms as Hom(P[-a],W)^0 and Hom(P,W[a])^0, with differentials
differing by signs, so equal cohomology; C^0(P[-a]) = C^{-a}(P), C^0(W[a]) = C^a(W) (cokernels ignore
the sign of the differential); P[-a] is totally acyclic and W[a] exact. Apply (ii) twice. Only P
needs total acyclicity (W exact suffices).
(iv) a > 0: Ext^a(M,N) = coker(Hom(P^{-a+1},N) -> Hom(C^{-a}P,N)) with 0 -> C^{-a}P -> P^{-a+1}.
Maps through P^{-a+1} factor through a projective; conversely a map C^{-a}P -> L -> N with L
projective extends over P^{-a+1} because Ext^1(C^{-a+1}P, L) = 0 (by (i) for P[-a+1]). So
Ext^a(M,N) ≅ Hom-stable(C^{-a}P, N).
(v) Compatibility: [f] |-> C^0(f) is a functor on chain maps (C^0(gf) = C^0(g)C^0(f)); for additive
functors G that are right exact (so C^0(GP) = G C^0(P)) and send P, W to complexes of the same type,
C^0(G f) = G C^0(f). Any sign issues in comparing shifts are not specified by the statement.
Imprecision only; no mathematical problem found.

## Lemma 8.3 — PROVED

(1) Morphisms (alpha,beta) with beta eta = eta' F(alpha). L_i -> L_i: for i=1, beta = F(alpha), so
Hom ≅ Hom_E(M,N); for i=2, alpha = 0 and beta arbitrary. L_2M -> L_1N: alpha = 0, condition vacuous
(eta = 0), beta: M -> FN arbitrary. L_1M -> L_2N: beta ∘ id = 0, so beta = 0, alpha: M -> 0.
All natural in M, N.
(2) Lambda e_1 = {(a,f,0)} = (E, F, mult) and F (x)_E E ≅ F, so Lambda e_1 ≅ L_1(E);
Lambda e_2 = {(0,0,b)} = (0,E,0) = L_2(E). L_i additive => preserve summands of free modules. The first
component functor is additive and sends Lambda^n to E^n, hence projectives to projectives.
(3) L_1P = (P, FP, id): termwise f.g. projective by (2); exact since F (x)_E - is exact (F_E
projective). Hom_Lambda(L_1P, Lambda) ≅ Hom_E(P,E) ⊕ 0 as complexes (naturality in (1)): exact.
L_2P: exact; Hom_Lambda(L_2P, Lambda) ≅ Hom_E(P, F (x)_E E) ⊕ Hom_E(P, E) = Hom_E(P,F) ⊕ Hom_E(P,E),
exact since _E F is f.g. projective (summand of E^m) and P totally acyclic.

## Theorem 8.4 — PROVED (signs irrelevant; hypotheses sufficient, slightly stronger than needed)

Notation. Ê^a := Ext-hat^a_E(S,S), Ê_F^a := Ext-hat^a_E(S,FS). C := Q/i(S). K := homotopy category of
totally acyclic complexes of f.g. projective Lambda-modules (a triangulated subcategory of K(proj):
shifts and cones of totally acyclic complexes are totally acyclic, the Hom(-,Lambda) of a cone being
the cone of the Hom complexes). Uses: E self-injective (symmetric is more than needed) so every
f.g. E-module has a complete resolution (8.1 prose); Ext-hat^a(M,N) = H^a Hom_E(P_M,P_N) (8.1 prose);
F P is a complete resolution of FM (8.1 prose).

Step 1 (Z is a Lambda-module, f.d.). eta = iota is E-linear; dimensions finite.
s |-> (v_0 s, i s) is injective (i is), and Z_2 is the pushout of FS <- S -> Q, so iota is injective
with coker iota ≅ C. Hence a short exact sequence of Lambda-modules
  0 -> L_1(S) --(id, iota)--> Z -> L_2(C) -> 0     (*)
((id,iota) is a morphism: iota∘id = iota∘F(id)).

Step 2 (Gorenstein-projective, Ext^a(Z,Lambda) = 0). Choose a complete resolution P_S of S with
P_S^1 = Q and S -> P_S^1 equal to i (possible: splice a projective resolution of S, i, and a complete
resolution of C); then C^1(P_S) = C and P_C := P_S[1] is a complete resolution of C. By Lemma 8.3(3)
(proved) L_1P_S, L_2P_C are totally acyclic with C^0 = L_1S, L_2C (L_i exact). Extension closure
(direct): horseshoe lemma on the projective-resolution halves; on the coresolution halves, extend
L_1S -> P'^1 over Z using Ext^1_Lambda(L_2C, P'^1) = 0 (Lemma 8.2 vanishing) and add Z -> L_2C -> P''^1;
snake lemma gives injectivity and cokernel an extension of cokernels; iterate. The resulting P_Z sits
in a degreewise split sequence 0 -> L_1P_S -> P_Z -> L_2P_C -> 0, so P_Z is exact and Hom(P_Z,Lambda) is
exact (long exact sequence). So Z is Gorenstein-projective and by Lemma 8.2, Ext^a(Z,Lambda) = 0 for
a > 0. [Also directly: long exact Ext sequence of (*) and Lemma 8.2 for L_1S, L_2C.]
[STD: closure of totally reflexive modules under extensions, Avramov–Martsinkovsky / Christensen;
high confidence; the direct argument above is the usual proof.]

Step 3 (Z as a cone). The degreewise split sequence gives a triangle in K:
  A_1 -> P_Z -> A_2[1] --w--> A_1[1], with A_1 := L_1P_S, A_2 := L_2P_S (L_2P_C = A_2[1]).
Rotating: A_2 --u--> A_1 -> P_Z -> A_2[1], u = ±w[-1].
Hom groups in K (Lemma 8.3(1) at the level of Hom complexes, natural so compatible with differentials):
  K(A_1,A_1[b]) ≅ Ê^b, K(A_2,A_2[b]) ≅ Ê^b, K(A_2,A_1[b]) ≅ H^b Hom_E(P_S, FP_S) = Ê_F^b,
  K(A_1,A_2[b]) = 0 (Hom complex is zero).
Identification of u. Taking the second (e_2-)component is an exact functor Lambda-mod -> E-mod; on
Hom(L_2-, L_1-) it is exactly the isomorphism of Lemma 8.3(1), and it sends (*) to
0 -> FS -> Z_2 -> C -> 0, which is the pushout along v_0 of 0 -> S -> Q -> C -> 0. Hence the class of
(*) corresponds to v_0 ∘ theta, theta in Ext^1(C,S) the class giving C ≅ S[1]; so u corresponds to
±v in Ê_F^0 (sign depends on rotation/shift conventions). Composition: for g = L_1(gamma) = (gamma,
F gamma) and u = (0, mu): g∘u = (0, F(gamma)mu), i.e. "F(g)v"; for j = L_2(kappa): u[b]∘j =
(0, mu[b]kappa), i.e. "v[b]j". Replacing v by -v or j by -j does not change kernel or image
dimensions of delta^a, so all sign conventions are irrelevant (delta^a and (g,j) |-> F(g)v + v[a]j
have the same injectivity/surjectivity). This is why the char-2 remark in Section 9 is harmless.

Step 4 (Ext computation). Write Hom^b(X,Y) = K(X,Y[b]). Triangle A_2 -u-> A_1 -p-> Z -w-> A_2[1]
(Z := P_Z).
- Hom(A_1,-): Hom^b(A_1,A_2) = 0 for all b, so p_*: Ê^b ≅ Hom^b(A_1,Z).
- Hom(A_2,-): 0 -> coker(u_*: Ê^b -> Ê_F^b) -> Hom^b(A_2,Z) -> ker(u_*: Ê^{b+1} -> Ê_F^{b+1}) -> 0,
  where u_*(j) = v[b]j.
- u^*: Hom^b(A_1,Z) -> Hom^b(A_2,Z) sends p g to p(g u); since w p = 0 it lands in the subgroup
  coker(u_*), and equals g |-> [F(g)v] mod {v[b]j}.
- Hom(-,Z): Hom^{a-1}(A_1,Z) -u^*-> Hom^{a-1}(A_2,Z) -> Hom^a(Z,Z) -> Hom^a(A_1,Z) -u^*-> Hom^a(A_2,Z).
So Hom^a(Z,Z) = 0 iff (u^* surjective at a-1) and (u^* injective at a), i.e. iff
  (S_{a-1}) every element of Ê_F^{a-1} is F(g)v - v[a-1]j, i.e. delta^{a-1} surjective, and
           j |-> v[a]j injective on Ê^a,
  (I_a)    (g,j) in ker delta^a implies g = 0.
For a >= 1: delta^{a-1} surjective (a-1 = 0: hypothesis; a-1 > 0: bijective); v[a]j = 0 gives
delta^a(0,j) = 0 hence j = 0 (delta^a injective); ker delta^a = 0. So Ext^a_Lambda(Z,Z) ≅ Hom^a(Z,Z)
= 0 for all a >= 1 (Lemma 8.2 for a > 0).
Exact criterion: (S_{a-1}) for a >= 1 says delta^{a-1} surjective and v[a]· injective on Ê^a;
together with (I_a) this is exactly ker delta^a = 0. Hence
  Ext^a(Z,Z) = 0 for all a >= 1  <=>  delta^a surjective for all a >= 0 and injective for all a >= 1,
i.e. the hypotheses on delta^a (apart from ker delta^0 ≠ 0) are necessary and sufficient. Note that
delta^0 need not be injective, and no condition on delta^a for a < 0 is needed.

Step 5 (nonprojective). Z projective iff Z ≅ 0 in K iff u is an isomorphism. If u were an iso,
id_{A_1} = u∘u^{-1} with u^{-1} in K(A_1,A_2) = 0, so A_1 ≅ 0, i.e. Ê^0 = End-stable(S) = 0, i.e. S
projective; then the domain of delta^0 is 0, contradicting ker delta^0 ≠ 0. So Z is nonprojective.
The ONLY use of "ker delta^0 ≠ 0" is to force S nonprojective; it could be replaced by "S is not
projective" (a weaker hypothesis, given the others). Not a problem with the statement.

Step 6. Z nonprojective with Ext^a(Z, Z ⊕ Lambda) = 0 for a >= 1: counterexample to the AR conjecture
for Lambda (definition in Section 3.2). Lambda is f.d. since E, F are.

Points relying on standard facts (high confidence): extension closure (proved directly above);
Ext^1 class of an extension computed via any exact functor preserving the resolutions (used to
identify u with ±v; routine).

## Hints about intended proofs noticed in the document (not relied on)

- After Prop 7.2: "Y (x)^L_{B_1} O ≅ P[b]"; "l+2 copies of B"; bounds grow linearly in l.
- Section 6 prose: "cancellation ... in the second iterate of the functor of Section 7" (Phi^2 vs P).
- Section 4 intro / Cor 4.5 are clearly the intended route for Theorem 7.3 (the upper bound
  (l+2)+(2t-1)(l+3) is exactly Cor 4.5 with d = l+2 and extinction 2t).
- Section 8 intro: "reduces the vanishing of the self-extensions ... to the bijectivity of a map between
  Tate cohomology groups"; 8.1 prose sets up Ext-hat = H^a Hom(P_M,P_N) and F P as complete resolution.
- Section 9: "in characteristic two all signs disappear" (consistent with Step 3 of 8.4: signs are
  irrelevant to the hypotheses anyway).

## Computation

None run (arguments are short and structural; no numerical check seemed informative).

## Summary table

| Statement | Verdict | Notes |
|---|---|---|
| Prop 7.2 | PROVED | Phi N = O(x)_B N; Phi^2 N = Tot with columns P^{b+n}(x)N, iso to (P(x)N)[b] after sign twist (-1)^{bn}; gldim via vertex filtration, <= d+l. Iso of objects only (enough). |
| Thm 7.3 | PROVED (from BG 4.3, 4.4, 4.5, 6.4, 6.18, 6.20) | One A for all Y since P is independent of Y. Phi^{2j}N ≅ F^jM(Y)[jb]; lower bound from Phi^{2t-2}N ≠ 0, upper from Cor 4.5 with t'=2t, d=l+2. |
| Cor 7.4 | PROVED (from BG 5.17 + 7.3) | 3 + 3(l+1) = 3(l+2) simples (X square-zero ideal); gldim Delta <= l+2; one algebra for all m. |
| Lemma 8.2 | PROVED (one clause imprecise) | Only P needs total acyclicity, W exact suffices. "Compatible with composition and additive functors preserving the complexes" is vague; true for C^0 functoriality and right exact G. |
| Lemma 8.3 | PROVED | Direct. |
| Thm 8.4 | PROVED | Z = cone of u: L_2P_S -> L_1P_S, u ↔ ±v. Ext^{>0}(Z,Z)=0 iff delta^a onto (a>=0) and injective (a>=1): hypotheses necessary and sufficient. ker delta^0 ≠ 0 used only to make S nonprojective (could be replaced by "S nonprojective"). Gorenstein-projectivity via extension closure (proved directly). Symmetric only used as self-injective. Signs irrelevant. |

No statement problem found in Sections 7-8.
