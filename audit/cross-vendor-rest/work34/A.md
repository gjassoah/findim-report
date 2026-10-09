# Phase A (blind) check of Sections 3 and 4

Checker: Claude Opus 5.5 (model id claude-opus-5-5), effort: unknown/low. Input read: statements.pdf (pages 1-5) and
statements.txt only. No computation was needed (all arguments are formal).

Status words: every verdict below is my own AI-produced argument (status "AI-proved" at best), not a proof in the
human-checked sense.

## Conventions fixed

- Modules are finitely generated left modules unless said otherwise; right A-modules = left A^op-modules.
- (-)^* = Hom(-, A) exchanges f.g. projective left and right modules; P -> P^** is a natural isomorphism for f.g.
  projective P (used throughout, standard, confidence high).
- Tr is computed from a minimal presentation; for a right module E, Tr E is a left module.
- findim A always means left modules. Theorem 3.3: a RIGHT module E violating strong Nakayama gives LEFT modules
  C_n, so it gives findim A = infinity (left). All orientations in the document are consistent with this.
- Cohomological grading; X[s]^n = X^{n+s}. "Minimal" bounded-above complex of f.g. projectives P over a
  finite-dimensional algebra: d(P) is contained in rad(P). Standard fact used (confidence high): every object of
  D^-(mod L) (L f.d.) is isomorphic to a minimal complex P with P^j = 0 above the top cohomology degree.
- In Theorem 3.7: G = Lambda + M, End(G) acts on G on the left, Hom_Lambda(G,X) is a right End(G)-module by
  precomposition, i.e. a left Gamma = End(G)^op-module. Projectivisation (standard, confidence high):
  Hom(G,-): add G -> proj Gamma is an equivalence; hence Hom_Gamma(Hom(G,X), Gamma) = Hom_Lambda(X, G) for
  X in add G.
- Proposition 3.10: A = (B 0; M C) with matrix multiplication, e1 = (1 0;0 0), e2 = (0 0;0 1); for a right
  A-module V, X = V e1 (right B), Y = V e2 (right C), phi: Y (x)_C M -> X induced by the action of M = e2 A e1.
  Then e1A = (B,0,0), e2A = (M,C,id), A e1 = B + M as right B-module, A e2 = C as right C-module,
  e1 A e2 = 0.
- Section 4: Delta acts on the left of A = Delta + X by multiplication; X is an ideal with X^2 = 0.

## Proposition 3.1 — PROVED

Standard facts (abelian category with enough projectives, confidence high): pd c <= n iff Ext^{n+1}(c,-) = 0;
pd c = n (finite) iff additionally Ext^n(c,Y) != 0 for some Y; Ext^{>=1}(p,-) = 0 for p projective.

1. n = 1: 0 -> c0 -> p0 -> c1 -> 0 is a projective resolution of length 1, so pd c1 <= 1; c1 not projective, so
   pd c1 = 1.
2. Induction: assume pd c_n = n >= 1. From 0 -> c_n -> p_n -> c_{n+1} -> 0 the long exact Ext sequence gives
   Ext^{i+1}(c_{n+1},-) = Ext^i(c_n,-) for i >= 1. Hence Ext^{n+2}(c_{n+1},-) = 0 and
   Ext^{n+1}(c_{n+1},-) = Ext^n(c_n,-) != 0 (n >= 1 is needed here). So pd c_{n+1} = n+1.
No minimality of the p_n is needed.

## Theorem 3.3 — PROVED

1. Dualise the minimal resolution: the complex 0 -> P_0^* -> P_1^* -> P_2^* -> ... of f.g. projective left modules
   has cohomology Ext^n_{A^op}(E,A) in degree n (including n = 0, E^* = Hom(E,A)). By hypothesis it is exact.
2. Hence there are short exact sequences 0 -> P_0^* -> P_1^* -> C_1 -> 0 and 0 -> C_n -> P_{n+1}^* -> C_{n+1} -> 0
   (n >= 1), where C_n = coker(P_{n-1}^* -> P_n^*) is identified with the image of P_n^* -> P_{n+1}^* by exactness.
3. C_1 is not projective: otherwise P_0^* -> P_1^* is split mono, so its dual P_1 = P_1^** -> P_0^** = P_0 is split
   epi, whence E = coker(P_1 -> P_0) = 0, contradiction.
4. Proposition 3.1 with c0 = P_0^*, p_n = P_{n+1}^*, c_n = C_n gives pd_A C_n = n for all n >= 1.
5. C_n = Tr Omega^{n-1} E: by minimality, P_n -> P_{n-1} -> Omega^{n-1}E -> 0 is a minimal presentation
   (P_{n-1} -> Omega^{n-1}E and P_n -> Omega^n E are projective covers), and Tr is the cokernel of its dual.
6. The C_n are f.g. left A-modules of pd n, so findim A = infinity.

The unnumbered claims after the theorem (Ext^i(E,A) = D Tor_i(E,DA); pd E = n < infinity implies Ext^n(E,A) != 0)
are standard and correct.

## Proposition 3.5 — PROVED (with two redundancies noted)

Set-up: pd C = 1, so the minimal presentation is a resolution 0 -> P_1 --f--> P_0 -> C -> 0 (f injective). Then
Tr C = coker(f^*: P_0^* -> P_1^*).

0. Always (for any C of pd <= 1): Ext^1_A(C,A) = coker(f^*) = Tr C, so "E = Ext^1_A(C,A)" holds unconditionally,
   not only "in this case". Also (Tr C)^* = ker(f^**) = ker f = 0, i.e. Hom_{A^op}(Tr C, A) = 0 always.
   "C is not projective" in (2),(3) is implied by pd C = 1. The hypothesis "no projective summands" is not used.
1. (1) <=> (2): by step 0 the degree-0 condition is automatic, and nonprojectivity is given.
2. (1) => (3): let ... -> R_2 -> R_1 -> R_0 -> E -> 0 be a projective resolution of E = Tr C extending the
   presentation R_1 = P_0^* -> R_0 = P_1^*. Dualising and using P = P^**: 0 -> P_1 -f-> P_0 -> R_2^* -> R_3^* -> ...
   is exact (degree 0 by f injective, degree m >= 1 by Ext^m(E,A) = 0). So 0 -> C -> Q_2 -> Q_3 -> ... exact with
   Q_m = R_m^*. Approximation: let K_m = coker(R_{m-1}^* -> R_m^*) (K_1 = C). Then
   Hom_A(K_m, A) = ker(R_m -> R_{m-1}) = im(R_{m+1} -> R_m), and Hom(Q_{m+1},A) = R_{m+1} -> Hom(K_m,A) is
   d_{m+1} onto its image, hence surjective: every map K_m -> A factors through K_m -> Q_{m+1}.
3. (3) => (1): put K_1 = C, 0 -> K_m -> Q_{m+1} -> K_{m+1} -> 0. Approximation means
   0 -> K_{m+1}^* -> Q_{m+1}^* -> K_m^* -> 0 exact. Splicing with 0 -> C^* -> P_0^* -> P_1^*, the complex
   ... -> Q_3^* -> Q_2^* -> P_0^* -> P_1^* -> Tr C -> 0 is a projective resolution of Tr C. Dualising back gives
   0 -> P_1 -> P_0 -> Q_2 -> Q_3 -> ..., which is exact (splice of 0->P_1->P_0->C->0 and the given sequence, C ->
   Q_2 injective). Its cohomology is Ext^i(Tr C, A), i >= 0. So (1).

## Corollary 3.6 — PROVED

From the proof of Theorem 3.3, C_n is a submodule of the projective P_{n+1}^*, so torsionless, and pd C_n = n.
Some indecomposable summand of C_n has pd exactly n and is torsionless. These are pairwise non-isomorphic for
different n. (Left modules.)

## Theorem 3.7 — PROVED

Hypothesis gives Ext^{>=1}_Lambda(M, G) = 0 and Ext^{>=1}(Lambda, G) = 0, hence Ext^{>=1}(G', G) = 0 for G' in add G.
Let K = ker pi.

1. S != 0: the image of Hom(G,pi) consists of the maps G -> M factoring through a projective (any such map factors
   through the projective cover pi). So S = underline-Hom(G,M) = underline-End(M) (stable Hom from Lambda is 0),
   which is nonzero since M is not projective (id_M does not factor through a projective).
2. Ext^{>=1}(K, G) = 0 and Hom(P,G) -> Hom(K,G) is onto: long exact sequence of 0 -> K -> P -> M -> 0 against G,
   with Ext^{>=1}(P,G) = 0 = Ext^{>=1}(M,G).
3. Resolution of S. Take right add G-approximations G_1 -> K, G_2 -> K'_1 := ker, etc. (they exist, Lambda is f.d.;
   they are onto since Lambda is in add G). Then Hom(G,-) is exact on 0 -> K'_{j+1} -> G_{j+1} -> K'_j -> 0
   (K'_0 = K), and ... -> Hom(G,G_2) -> Hom(G,G_1) -> Hom(G,P) -> Hom(G,M) -> S -> 0 is a projective resolution of
   the Gamma-module S (exact at Hom(G,P) because Hom(G,G_1) -> Hom(G,K) is onto and Hom(G,-) is left exact).
4. Apply Hom_Gamma(-,Gamma) = Hom_Lambda(-,G) (projectivisation): the complex
   0 -> Hom(M,G) -> Hom(P,G) -> Hom(G_1,G) -> Hom(G_2,G) -> ... (degrees 0,1,2,...). Exactness:
   degree 0: pi epi. Degree 1: maps P -> G killing K = im(G_1 -> P) factor through M. Degree 2: kernel is Hom(K,G)
   (G_1 -> K onto), which is the image of Hom(P,G) by step 2. Degrees >= 3: by induction Ext^{>=1}(K'_j, G) = 0
   (from Ext^{>=1}(G_{j+1},G) = 0 and the long exact sequence), so 0 -> Hom(K'_j,G) -> Hom(G_{j+1},G) ->
   Hom(K'_{j+1},G) -> 0 is exact for all j; splicing gives exactness.
5. Hence Ext^i_Gamma(S,Gamma) = 0 for all i >= 0. Consequence: S is a right module over A := Gamma^op = End_Lambda(G)
   with Ext^i_{A^op}(S,A) = 0 for all i >= 0; Theorem 3.3 gives findim End_Lambda(G) = infinity (left modules).
Only "pi is an epimorphism from a projective" is used, not that it is a cover.

## Proposition 3.8 — PROVED

Let F = (-)f = Hom_{A^op}(fA,-): mod A^op -> mod B^op (exact), with left adjoint L = - (x)_B fA. "Killed by f"
right A-modules are exactly those with all composition factors = S (a simple T has Tf = 0 iff Te_i != 0 for some
primitive e_i in e iff T = S). By devissage, Hom(T,A) = 0 = Ext^1(T,A) for all such T (and RHom(T,A) = 0 under the
stronger hypothesis).

1. Multiplication mu: Af (x)_B fA -> A (right A-modules). mu f is the isomorphism Af (x)_B B -> Af, so ker mu and
   coker mu = A/AfA are killed by f.
2. Under Hom_{B^op}(Af, Af) = Hom_{A^op}(Af (x)_B fA, A) (tensor-Hom adjunction), the left multiplication map
   lambda: A -> End_{B^op}(Af), a |-> (y |-> ay), corresponds to mu^*: Hom(A,A) -> Hom(Af (x)_B fA, A)
   (check: a |-> (yf (x) fb |-> a y f b)). Factor mu as Af (x) fA ->> AfA >-> A. Hom(A,A) -> Hom(AfA,A) is
   bijective since Hom(A/AfA, A) = 0 = Ext^1(A/AfA, A); Hom(AfA,A) -> Hom(Af (x) fA, A) is bijective since it is
   injective and its cokernel embeds in Hom(ker mu, A) = 0. So lambda is bijective; it is an algebra map because
   left multiplications compose as products. Af = fAf + eAf = B + M as right B-modules.
3. Simples: simple B-modules correspond bijectively to simple A-modules T with Tf != 0 (standard, e.g. Green /
   Auslander-Reiten-Smalo; confidence high). Only the class of S is lost.
4. M not projective: otherwise Af = B + M is a f.g. projective generator of mod B^op, so A = End_{B^op}(Af) is
   Morita equivalent to B and has the same number of simples, contradicting step 3.
5. Ext vanishing. Derived adjunction: Ext^i_{B^op}(Af, Af) = Hom_{D(A^op)}(Af (x)^L_B fA, A[i]) (fA is projective,
   so RHom_A(fA, A) = Af). Let W = cone(mu: Af (x)^L_B fA -> A). Applying the exact functor (-)f (= - (x)_A Af)
   gives cone(Af (x)^L_B B -> Af) = 0, so every H^j(W) is killed by f, W is in D^-(mod A^op).
   Claim Hom(W, A[i]) = 0 for all i: for n >= i, the triangle tau^{<-n}W -> W -> tau^{>=-n}W shows
   Hom(W,A[i]) = Hom(tau^{>=-n}W, A[i]) (Hom(D^{<= -n-1}, D^{>= -n}) = 0 handles A[i] and A[i-1]); the bounded
   complex tau^{>=-n}W has cohomology with all factors S, so RHom(-,A) kills it by devissage.
   Hence Ext^i_{B^op}(Af,Af) = Hom(A, A[i]) = 0 for i >= 1, and M + B is a summand of Af.
(For i = 0 this reproves step 2 under the stronger hypothesis.)

## Proposition 3.10 — PROVED

1. Q -> Y a projective resolution over C^op. Q (x)_C e2A = (Q(x)_C M, Q, id) is a complex of projective right
   A-modules representing Y (x)^L_C e2A; eps = (phi o (aug(x)M), aug): Q (x)_C e2A -> E is A-linear. Let
   W = cone(eps). W e2 = cone(Q -> Y) is acyclic, so the subcomplex (W e1, 0, 0) -> W is a quasi-isomorphism; and
   W e1 = cone(Q(x)_C M -> X) represents Z. So W = i_B(Z), where i_B = - (x)_B e1A (= (X',0,0)), exact, with right
   adjoint (-)e1 = Hom_A(e1A,-).
2. RHom_{A^op}(i_B Z, V) = RHom_{B^op}(Z, V e1) and RHom_{A^op}(Q(x)_C e2A, V) = RHom_{C^op}(Y, V e2).
   For V = e1A: V e1 = B, V e2 = e1Ae2 = 0. For V = e2A: V e1 = M, V e2 = C.
3. RHom(E, A) = 0 means RHom(E, e1A) = 0 = RHom(E, e2A). The triangle Q(x)e2A -> E -> W -> gives, with V = e1A:
   RHom_B(Z,B) = RHom(W,e1A) = 0 since the other two terms vanish. (With V = e2A: RHom_B(Z,M) = RHom_C(Y,C)[-1].)
4. If Z = 0: then RHom_C(Y,C) = RHom_B(Z,M)[1] = 0; Y != 0 since Y = 0 gives Z = X, so X = 0 and E = 0. Theorem 3.3
   for C and the right module Y gives findim C = infinity.
5. If Z != 0: Z is in D^-(mod B^op) (Tor^C_i(Y,M) f.d.). Take a minimal complex P = Z of f.g. projective right
   B-modules, P^j = 0 for j > n, P^n != 0 (n = top cohomology degree). RHom(Z,B) = 0 says
   0 -> (P^n)^* -> (P^{n-1})^* -> (P^{n-2})^* -> ... is exact. Its first cokernel is not projective (else P^{n-1} ->
   P^n is split epi with image in rad P^n, forcing P^n = 0). Proposition 3.1 gives left B-modules of every
   projective dimension: findim B = infinity. (This complex-to-module step is not spelled out in the statement but
   is routine; it is the same mechanism as Theorem 3.3.)

## Proposition 3.11 — PROVED (with a convention fixed)

Convention issue: "dimension vector" and Rep_d(A) for a dimension vector are not defined for a general f.d. algebra
over an arbitrary field. I prove it for Rep_d(A) = {k-algebra maps A -> M_d(k)}, d an integer (as in Section 4.3),
with the Zariski topology on k-points. For any reasonable dimension-vector variety (a subset of Rep_{|d|}(A), or the
quiver-representation variety for A = kQ/I, where the same argument runs) openness in the subspace topology and
boundedness follow. Over a finite field all these sets are finite and the statement is trivial.

1. For f.g. M over f.d. A with J = rad A: pd M <= n iff Tor^A_{n+1}(A/J, M) = 0 (minimal resolution: Tor_i(A/J,M)
   = A/J (x) P_i). Standard, confidence high.
2. Fix a resolution F_. -> A/J of the right module A/J by f.g. free modules A^{m_i} (independent of M). For
   M in Rep_d(A), F_i (x)_A M = k^{d m_i} and the differentials are matrices whose entries are linear in the
   coordinates of M. Tor_{n+1} = 0 iff rk(d_{n+1}) + rk(d_{n+2}) >= d m_{n+1} (always <=). Rank is lower
   semicontinuous (minors), and {r1 + r2 >= c} = union over a+b=c of {r1 >= a} cap {r2 >= b} is open. So
   U_n = {pd <= n} is open.
3. Rep_d(A) is noetherian (closed subset of affine space; closed sets <-> vanishing ideals, ACC in k[x]). The chain
   U_0 subset U_1 subset ... of open sets stabilises at some U_N, so pd <= N on all finite-pd points.
4. Every d-dimensional module is a point of Rep_d(A); finitely many d below any bound give the last sentence.
Unnumbered remark: dim Tr N <= dim P_1 <= dim A * dim(Omega N) <= (dim A)^2 dim N; correct, and the C_n of Theorem
3.3 then force dim Omega^{n-1} E unbounded.

## Theorem 4.1 (Minamoto–Yamaura) — PROVED (own proof; no flatness of X needed)

1. 0 -> X -> A -> Delta -> 0 is an exact sequence of Delta-A-bimodules (Delta acting on the left through Delta in A;
   A acting on X on the right through A -> Delta, since X^2 = 0). As right A-modules X = X (x)_Delta Delta_A
   (x (x) d |-> xd), and Delta_A is free of rank one as a left Delta-module.
2. Let P -> N be a projective resolution over A. Tensoring the sequence of step 1 with P (termwise flat) gives a
   short exact sequence of complexes of left Delta-modules
   0 -> X (x)_Delta (Delta (x)_A P) -> P -> Delta (x)_A P -> 0.
   T := Delta (x)_A P is a bounded-above complex of projective Delta-modules representing Delta (x)^L_A N, so the
   left term is X (x)^L_Delta T = Phi(T); the middle is N (restriction of the inflated N along Delta -> A -> Delta).
   This gives a triangle Phi(T) -> N --u--> T --v--> Phi(T)[1], natural in N.
3. T is in D^{<=0} with H^0(T) = Delta (x)_A N = N/XN = N; the truncation rho: T -> H^0(T) = N satisfies rho u = id
   (u induces 1 (x) n on H^0). So the first map of the triangle is 0 and (rho, v): T -> N + Phi(T)[1] is an iso
   (map of triangles from the split triangle; five lemma), natural in N.
4. Define p_0 = rho and p_r = Phi(p_{r-1})[1] o v: T -> Phi^r N[r]. Iterating step 3, for each r,
   (p_0,...,p_r, Phi^{r+1}... ) gives T = N + Phi N[1] + ... + Phi^r N[r] + Phi^{r+1}T[r+1].
   Phi preserves D^{<=0} (right t-exact), so Phi^{r+1}T[r+1] is in D^{<= -r-1}.
5. The objects Phi^r N[r] are in D^{<= -r}; represent them by complexes concentrated in degrees <= -r; then the
   termwise sum and product coincide degreewise, so the coproduct equals the product in D(Mod Delta) and lies in
   D^-. The map (p_r)_r: T -> prod_r Phi^r N[r] = coprod_r Phi^r N[r] is an iso on H^n for each n by step 4 with
   r >= -n. It is natural in N.
Naturality: P is functorial in N up to homotopy, the connecting map of a short exact sequence of complexes is
natural, and rho is natural.

## Lemma 4.3 — PROVED

1. Any bounded-above complex Q of f.g. projectives representing C is K-projective, so Hom_D(C, S[n]) =
   H^n Hom(Q, S); if Q^{-n} = 0 this vanishes. Hence sup <= pd C.
2. For a minimal Q (d(Q) in rad Q), the differential of Hom(Q,S) is f |-> f o d = 0 (S semisimple kills rad), so
   Hom(C,S[n]) = Hom(Q^{-n}, S), nonzero for some simple S iff Q^{-n} != 0. Thus Q vanishes below -sup, so
   pd C <= sup. C != 0 makes the sup > -infinity; sup = infinity iff pd = infinity.

## Proposition 4.4 (Minamoto–Yamaura) — PROVED

1. X is a nilpotent ideal (X^2 = 0), so X in rad A and the simple A-modules are the inflated simple Delta-modules.
2. Lemma 4.3 for A (N nonzero, f.g.): pd_A N = sup{n : Hom_{D(A)}(N, S[n]) != 0}. Restriction along A -> Delta is
   exact with left adjoint Delta (x)^L_A -, so Hom_{D(A)}(N, S[n]) = Hom_{D(Delta)}(Delta (x)^L_A N, S[n])
   = prod_r Hom(Phi^r N, S[n-r]) by Theorem 4.1 (coproduct).
3. Each Phi^r N is in D^-(mod Delta) (X f.d., N f.g.). By Lemma 4.3 for Delta (and pd 0 = -infinity),
   sup_n{...} = sup_r (r + pd_Delta Phi^r N).
4. "In particular": for 0 != C in D^{<=0}, pd C >= 0 (a minimal representative has a nonzero term in the top
   cohomology degree t <= 0, so its lowest degree is <= 0). Phi^r N is in D^{<=0}, so Phi^r N != 0 gives
   pd_A N >= r.

## Corollary 4.5 — PROVED

Note: for a f.d. algebra, left and right global dimensions coincide (both equal max{i : Tor_i(Delta/J, Delta/J)
!= 0}), so d_L and d_R bound the same number; the statement remains true as written.
1. If pd_A N = p < infinity then Phi^r N = 0 for r > p (Prop. 4.4); take t = p+1 >= 1.
2. Conversely let Phi^t N = 0, so Phi^r N = 0 for r >= t. Tor^Delta_i(X,-) = 0 for i > pd(X_Delta) <= d_R, so
   Phi maps D^{[a,b]} to D^{[a-d_R, b]}, hence Phi^r N is in D^{[-r d_R, 0]}.
3. For C in D^{[a,b]}(mod Delta): Hom(H^j(C)[-j], S[n]) = Ext^{n+j}(H^j C, S) = 0 when n + j > d_L; by devissage
   over the finitely many cohomology degrees, Hom(C,S[n]) = 0 for n > d_L - a, so pd C <= d_L - a (Lemma 4.3).
   Thus pd Phi^r N <= d_L + r d_R.
4. Prop. 4.4: pd_A N = max_{0<=r<t}(pd Phi^r N + r) (the r = 0 term is finite and >= 0) <= d_L + (t-1)(d_R+1).
5. Last sentence: with t_N the extinction time, Phi^{t_N - 1} N != 0 gives t_N - 1 <= pd_A N < infinity; unbounded
   t_N gives findim A = infinity.

## Proposition 4.7 — PROVED (via Corollary 4.5 and Proposition 3.11)

1. Right global dimension finite implies left global dimension finite (equal; see note in 4.5).
2. For N in Rep_d(Delta) with finite extinction time t_N: by Corollary 4.5, pd_A N < infinity and
   t_N - 1 <= pd_A N.
3. N, inflated, is a d-dimensional A-module; by Proposition 3.11 for A, pd_A is bounded by some p_d on
   d-dimensional A-modules of finite pd. So t_N <= p_d + 1. (N = 0 has t_N = 0.)

## Hints about intended proofs noticed in the document (not relied on)

- Before 3.1: "dimension-shifting argument"; before 3.5: "a module of projective dimension one, such as C_1"
  (so Theorem 3.3 goes through Prop. 3.1 with C_1 = Tr E).
- After 3.3: Ext^i(E,A) = D Tor_i(E, DA) (derived Nakayama functor kills E).
- Before 3.7: attributed to Auslander–Reiten (failure of AR conjecture gives failure of generalised Nakayama for an
  endomorphism algebra). Before 3.8: "on a corner of the algebra".
- Before 3.11: Schofield's argument via Happel's survey; openness alternatively from semicontinuity of dim Ext.
- Section 4: "bar decomposition", proof "avoids the grading", "does not assume X flat"; derived powers of X matter
  (Example 4.2, omitted). After 4.7: "Compare Proposition 3.11" (suggests the route I used).

## Minor observations

- Prop. 3.5: "C is not projective" in (2),(3) is implied by pd C = 1; the "no projective summands" hypothesis is
  unused; E = Ext^1_A(C,A) holds for every C of pd 1, not only "in this case".
- Prop. 3.10, case Z != 0: the conclusion needs the passage from the complex Z to modules (minimal complex + Prop. 3.1);
  routine but not a direct citation of Theorem 3.3.
- Prop. 3.11: "dimension vector" undefined for general A and k; proved for Rep_d with d an integer, which implies
  the dimension-vector version.
- Cor. 4.5: d_L = d_R automatically for finite-dimensional algebras.
- Theorem 3.7: projective cover not needed (any epimorphism from a projective).

## Summary table

| Statement | Verdict | Notes |
|---|---|---|
| Prop 3.1 | PROVED | Ext dimension shift |
| Thm 3.3 | PROVED | dual of resolution exact; C_1 nonprojective since E != 0; Prop 3.1 |
| Prop 3.5 | PROVED | redundant hypotheses noted; E = Ext^1(C,A) always |
| Cor 3.6 | PROVED | C_n subset P_{n+1}^* |
| Thm 3.7 | PROVED | add G-approximation resolution; Hom_Gamma(-,Gamma) = Hom_Lambda(-,G) |
| Prop 3.8 | PROVED | mu: Af (x)_B fA -> A, cone killed by f; derived adjunction for Ext vanishing |
| Prop 3.10 | PROVED | recollement-type triangle; Z != 0 case via minimal complex + Prop 3.1 |
| Prop 3.11 | PROVED (convention fixed) | Tor_{n+1}(A/J,-) with a fixed free resolution; rank semicontinuity; noetherian |
| Thm 4.1 | PROVED | triangle Phi(T) -> N -> T split by truncation; iterate; sum = product |
| Lemma 4.3 | PROVED | minimal projective complexes |
| Prop 4.4 | PROVED | adjunction + Thm 4.1 + Lemma 4.3 |
| Cor 4.5 | PROVED | Tor amplitude <= d_R; d_L = d_R anyway |
| Prop 4.7 | PROVED | Cor 4.5 + Prop 3.11 for A |

Standard results used (confidence high in each exact statement): Ext characterisation of pd in abelian categories;
P = P^** for f.g. projectives; existence of minimal projective complexes for D^-(mod L), L f.d.; projectivisation
Hom(G,-): add G = proj End(G)^op; simple modules of fAf <-> simples T with Tf != 0; Morita theory for progenerators;
pd M = max{i : Tor_i(A/J,M) != 0}; derived tensor-Hom adjunctions; equality of left and right global dimension
for f.d. algebras; Zariski topology on k-points of affine space is noetherian.
