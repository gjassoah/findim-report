# Phase A (blind) check of Section 10 — Claude Opus 5.5, effort unknown

Input: statements.pdf only. Background used (marked [B]): Theorem 2.1 (Tate duality, incl. the
compatibility <zeta eta, theta> = <zeta, eta theta>), the definition of Toda brackets in 2.2, Lemma 8.3,
the setting/formula of Theorem 8.4 (NOT its conclusion). Standard facts marked [S].

## Conventions fixed
- Stable category mod A, [1] = Omega^{-1}. H^a = \hat{Ext}^a_A(s,s) = Hom(s, s[a]).
- Graded product: for x in H^b, y in H^c: xy := x[c] o y in H^{b+c}. "tau·" = left multiplication.
- Signs in triangles/rotations are ignored where only kernels, images, ranks or (non)vanishing matter;
  each such place is noted.
- End_A(s) = k for a simple nonprojective s implies stable End(s) = End_A(s) = k (a nonzero
  endomorphism of a simple is invertible, so if it factored through a projective, s would be a
  summand of a projective). So H^0 = k.
- [S] For a >= 1, \hat{Ext}^a = Ext^a (stated in 2.1); Yoneda product = stable composition in positive
  degrees (confidence high).

## Preliminary (setup of 10.1): the groups H^a
Hypotheses: A symmetric, s simple, End_A(s)=k, Ext^*_A(s,s)=k[tau], |tau|=3 (so s nonprojective).
1. H^{3m}=k tau^m (m>=0, m=0 by the convention above), H^a=0 for a>=1, 3∤a.
2. [B Thm 2.1] H^{-1-a} ≅ D H^a: H^{-3m-1} ≅ D(k tau^m) 1-dim; all other negative degrees 0.
3. Claim: left and right multiplication by tau, H^{-3m-1} -> H^{-3m+2}, are isomorphisms for m>=1.
   Proof: both sides 1-dim. If tau x = 0 with x in H^{-3m-1}, then for all y in H^{3m-3}:
   <y, tau x> = <y tau, x> = 0 [B compatibility]; y tau runs over H^{3m} (y = tau^{m-1}), so x=0 by
   nondegeneracy of H^{3m} x H^{-3m-1} -> k. Same for x tau using <x tau, y> = <x, tau y>.
   Status: PROVED (from Thm 2.1 as stated). beta0 spans H^{-1} (exists, H^{-1} ≅ DH^0 = k).

## Proposition 10.1 — PROVED
Convention: the triangle s[-3] -tau-> s -i-> X -pi-> s[-2] -(±tau[1])-> s[1].
Step 1. Hom(s,-[a]) gives the exact sequence
   H^{a-3} --tau·--> H^a --i_*--> U^a --pi_*--> H^{a-2} --±tau·--> H^{a+1}.
   So 0 -> coker(tau·: H^{a-3}->H^a) -> U^a -> ker(tau·: H^{a-2}->H^{a+1}) -> 0.
Step 2 (cokernels). a=3m, m>=1: tau·: H^{3m-3}->H^{3m} is onto (polynomial ring). a=0: H^{-3}=0, coker=H^0=k.
   a=-3m-1, m>=0: tau·: H^{-3(m+1)-1} -> H^{-3m-1} iso by the Claim. Otherwise H^a=0. So coker ≠ 0 only
   at a=0, where it is 1-dim.
Step 3 (kernels), b=a-2. b=3m>=0: injective (k[tau] domain). b=-1: target H^2=0, kernel H^{-1}=k.
   b=-3m-1, m>=1: iso by the Claim. Otherwise H^b=0. So kernel ≠ 0 only at a=1.
Step 4. U^0: kernel part at a=0 is ker on H^{-2}=0, so i_*: H^0 -> U^0 is an isomorphism.
   U^1: coker part at a=1 is H^1=0, so pi_*: U^1 -> H^{-1} is an iso; pi_* on Hom(s,X[1]) is
   composition with pi[1]. All other U^a = 0. Signs irrelevant (only kernels/images used).
Uses: Thm 2.1 (duality + compatibility). No gap.

## Proposition 10.2 — PROVED
Setting: E=A, S=s, Lambda = (A 0; F A), Z from the formula of Thm 8.4 with any v0, any injective
i: s -> Q, Q projective. Write [M,N]^a = \hat{Ext}^a_A(M,N).

Part 1 (delta^0 not surjective). H^0 = k, so F(g) = g·id_{Fs} for g in k and
delta^0(g,j) = (g-j)v; im delta^0 = k v has dim <= 1. Show dim [s,Fs]^0 = 2:
 Rotate the triangle to (s+s)[-1] -(∓(w1,w2)[-1])-> X -> Fs -(rho)-> s+s -(w1,w2)-> X[1]; Hom(s,-):
   H^{-1}+H^{-1} --> U^0 --> [s,Fs]^0 --> H^0+H^0 --(g,j)->w1 g+w2 j--> U^1.
 - U^1 is 1-dim (10.1) and (w1,w2) ≠ 0, H^0=k, so the last map is onto, kernel 1-dim.
 - Image of the first map = span(w1[-1]beta0, w2[-1]beta0) = 0 by hypothesis, so U^0 (1-dim, 10.1)
   injects.  Hence dim[s,Fs]^0 = 1 + 1 = 2 > 1 >= rank delta^0. (Holds for every v.)

Part 2 (Ext^1_Lambda(Z,Z) ≠ 0). "If defined": Z is always defined (needs only v0, i).
 Step a. iota: Fs -> Z2 is injective (iota(t)=0 => (t,0)=(v0 x, i x) => x=0 => t=0) and
   Z2/iota(Fs) ≅ Q/i(s) =: C. So 0 -> L1(s) -(id,iota)-> Z -> L2(C) -> 0 is exact in mod Lambda
   (componentwise exact; first map is a Lambda-map since iota∘id = iota∘F(id)).
 Step b [B Lemma 8.3(1),(2) + exactness of L_i]: L_i of a projective resolution of M is a projective
   resolution of L_i M, and the natural Hom isomorphisms give
   Ext^a_L(L1M,L1N)=Ext^a_A(M,N), Ext^a_L(L2M,L2N)=Ext^a_A(M,N), Ext^a_L(L2M,L1N)=Ext^a_A(M,FN),
   Ext^a_L(L1M,L2N)=0 for all a>=0, compatible with composition with L_i(maps) (naturality).
 Step c. C ≅ s[1] in mod A (stably; C = Omega^{-1}s ⊕ projective). Ext^1_A(C,N) ≅ [s,N]^0 naturally in N
   ([S]: Ext^1_A(C,N) = Hom(s,N)/{maps extending over i}; maps through projectives extend since Q,P
   are injective). Ext^1_A(C,C) = [s[1],s[1]]^1 = H^1 = 0; stable End(C) ≅ H^0 = k.
 Step d. Hom_L(L1 s, Z) = Hom_L(L1s,L1s) = End_A(s) = k and Ext^1_L(L1s,Z) ≅ Ext^1_A(s,s) = 0
   (Hom(L1s,-) of Step a, Ext^*(L1s,L2C)=0).
 Step e. Hom(L2C,-) of Step a: End_A(C) --∂--> Ext^1_A(C,Fs) -> Ext^1_L(L2C,Z) -> Ext^1_A(C,C)=0,
   with ∂(x) = ±e·x, e the class of Step a in Ext^1_L(L2C,L1s) ≅ Ext^1_A(C,Fs). A map x factoring through
   a projective gives e·x = 0 (Ext^1_A(P,-)=0), and stable End(C)=k, so im ∂ = k e (dim <= 1).
   Hence Ext^1_L(L2C,Z) ≅ [s,Fs]^0 / k e has dim >= 1 (Part 1: dim [s,Fs]^0 = 2).
 Step f. Hom(-,Z) of Step a: Hom_L(L1s,Z) --∂'--> Ext^1_L(L2C,Z) -> Ext^1_L(Z,Z) -> Ext^1_L(L1s,Z) = 0.
   ∂'(phi) = ±phi_*(e); phi = j∘psi with j: L1s -> Z the inclusion, psi in End(L1s) = k (Step d),
   and j_*(e) = 0 (e = ∂(id) in Step e, then exactness). So ∂' = 0 and
       Ext^1_Lambda(Z,Z) ≅ [s,Fs]^0 / k e  ≠ 0.
 Remark (supported, not needed): e corresponds to ±v under Ext^1(C,Fs) ≅ [s,Fs]^0 (Z2 is a pushout of
   0->s->Q->C->0 along v0), so Ext^1_Lambda(Z,Z) ≅ coker delta^0 here; this matches the text in 10.3(1)
   ("surviving class is the cokernel of delta^0") and is a hint about the omitted formula (??).
 Note: Part 2 only used H^0=k, H^1=0 and dim[s,Fs]^0 >= 2; it did not use any conclusion of Thm 8.4.

## Corollary 10.3 — PROVED
Claim: for every w in U^1, w[-1] o beta0 = 0 in U^0.
1. By 10.1, U^0 = k·i. Suppose y := w[-1]beta0 = c·i with c ≠ 0.
2. Hom(-,s[-1]) on the triangle: Hom(X,s[-1]) --i^*--> Hom(s,s[-1]) = H^{-1} --> Hom(s[-3],s[-1]) = H^2 = 0,
   so there is zeta in Hom(X,s[-1]) with zeta∘i = beta0.
3. beta0 = zeta i = c^{-1} (zeta∘w[-1]) beta0; zeta∘w[-1] in End(s[-1]) = k is a scalar lambda, and
   beta0 ≠ 0 forces lambda ≠ 0. So w[-1]: s[-1] -> X is split mono, s[-1] is a summand of X.
4. Then H^3 = Hom(s, s[-1][4]) is a summand of U^4 = 0 (10.1), contradicting H^3 = k tau ≠ 0.
 (No duality pairing needed beyond 10.1.)
Second sentence: for any F with such a triangle and w1,w2 not both zero, 10.2 applies, so
Ext^1_Lambda(Z,Z) ≠ 0 for every v. If w1=w2=0 (excluded in 10.2, perhaps included in "as above"),
the triangle splits, Fs ≅ s⊕s⊕X stably, dim[s,Fs]^0 = 3, and Steps a–f of 10.2 still give
dim Ext^1_Lambda(Z,Z) >= 2. So the corollary holds under either reading.
Ambiguity (minor): "a single cone as above" is read as: E=A, S=s, F with a triangle as in 10.2, any v.

Remark (supported). With zeta, w as above, zeta∘w[-1] is exactly the Toda bracket <beta0, tau, beta0> (cone of tau,
f = beta0[-2], g = tau, h = beta0; indeterminacy beta0·H^1 + H^1·beta0 = 0). The proof above shows it is 0.
This is a different bracket from the <tau, beta, beta> of Theorem 10.4 (cone of beta); the proof of 10.3
given here does not use 10.4. The introductory text ("Tate duality also forces the vanishing of the
related Toda brackets") hints that the authors relate the two; I did not need this.

## Theorem 10.4 — PROVED
Bracket convention (2.2, h=tau, g=beta, f=beta, realised with shifts):
 X=s, f=beta: s->s[-1]; Y=s[-1], g=beta[-1]: s[-1]->s[-2]; Z=s[-2], h=tau[-2]: s[-2]->s[1]; W=s[1].
 Bracket lies in Hom(s[1],s[1]) ≅ H^0 (degree 3-1-1-1 = 0). Other shift choices differ by the shift
 functor (at most a sign), irrelevant for vanishing.
Known groups: H^0 = k (End_A(s)=k, s nonprojective simple), H^1=H^2=H^4=0, and by [B Thm 2.1]
 H^{-2} ≅ DH^1 = 0, H^{-3} ≅ DH^2 = 0.
1. Defined: gf = beta·beta in H^{-2} = 0; hg = tau·beta in H^2 = 0.
2. Indeterminacy h∘Hom(s[1],s[-2]) + Hom(s,s[1])∘beta[1] = tau·H^{-3} + H^1·beta = 0. So the bracket is
   a single element c in H^0 = k. (Moreover a, b are unique: a is unique up to i∘H^{-3}=0, b up to H^1∘q=0.)
3. Cone: s[-1] -g-> s[-2] -i-> C -q-> s. Defining system a: s[1]->C, q a = beta[1]; b: C->s[1], b i = tau[-2].
   If tau = 0 take b=0: c=0. Assume tau ≠ 0 and, for contradiction, c = b a ≠ 0; rescaling tau (b scales,
   a fixed) assume c = 1.
4. Hom(s[-2],-) on the cone triangle: H^1 -> H^0 -i_*-> Hom(s[-2],C) -q_*-> H^2 = 0, so
   Hom(s[-2],C) = k·i. Since b(a tau[-2]) = tau[-2] ≠ 0, a tau[-2] = lambda i with lambda ≠ 0; applying b,
   tau[-2] = lambda tau[-2], so lambda = 1:  i = a∘tau[-2].
5. ab is idempotent; [S] idempotents split in mod A, so C = s[1] ⊕ C' with a, b the inclusion and projection
   of s[1]. In these coordinates i = (tau[-2], 0)^T by step 4.
6. [S, standard triangulated lemma, confidence high] A triangle X -(f,0)^T-> Y ⊕ Y' -> Z -> X[1] is isomorphic
   to the sum of a triangle on f and 0 -> Y' = Y' -> 0; hence s ≅ cone(tau[-2]) ⊕ C'. s is indecomposable
   (End = k). If C' ≠ 0 then cone(tau[-2]) = 0, tau: s ≅ s[3] and H^{-1} ≅ H^2 = 0, but H^{-1} ≅ DH^0 = k.
   So C' = 0, a is an isomorphism, and rotating the cone triangle gives a triangle
        s[-2] -tau[-2]-> s[1] -beta[1]-> s -> s[-1].
7. Apply Hom(s,-[3]) to this triangle: Hom(s,s[1][3]) -> Hom(s,s[3]) -> Hom(s,s[-1][3]) is exact, i.e.
   H^4 -(beta·)-> H^3 -> H^2. With H^2 = 0 and H^4 = 0 this forces H^3 = 0, contradicting tau ≠ 0.
   Hence c = 0 and <tau,beta,beta> = {0}.
Notes. Uses of hypotheses: H^1=0 (steps 2,4), H^2=0 (steps 1,2,4,7 via duality), H^4=0 only in step 7.
 Tate duality is used only for H^{-1}≠0, H^{-2}=H^{-3}=0. dim H^3 is arbitrary; beta need not span.
 Sharpness of Ext^4=0 (supported): symmetric Nakayama algebra with two simples s,t and Loewy length 3
 (P_s = s/t/s, P_t = t/s/t): Ext^1=Ext^2=0, Ext^3(s,s)=k, Ext^4(s,s)=k (Omega^2 s = t, Omega^2 t = s),
 the cone C of beta is s[1] (from 0 -> s -> t/s -> t -> 0), a is an iso, and c ≠ 0 for tau ≠ 0.
 So the hypothesis Ext^4 = 0 cannot be dropped.

## Corollary 10.5 — PROVED (with a remark on scope)
 s is nonprojective (Ext^p ≠ 0), End_A(s)=k. H^1 = H^2 = 0 since p >= 3, H^{-2} ≅ DH^1 = 0.
 - Defined for every p >= 3: beta·beta in H^{-2} = 0; tau·beta in H^{p-1} = 0 (0 < p-1 < p).
 - p = 3: H^4 = 0 (4 not a multiple of 3); Theorem 10.4 (proved above) gives {0}.
 - p >= 4: the bracket lies in H^{p-3} with 0 < p-3 < p, so H^{p-3} = 0 and the (nonempty) bracket is {0}.
 Remark: for p >= 4 the statement is trivial for degree reasons and does not follow from Theorem 10.4
 (for p = 4 the hypothesis Ext^4 = 0 of 10.4 fails); the case p = 3 is the content.

## Hints noticed in the document (not relied on)
- 10.1 setup: "multiplication by tau is an isomorphism H^{-3m-1} -> H^{-3m+2} ... by the argument of
  Proposition 9.11" (reproved above via the duality pairing).
- Text before 10.2: the comparison map cannot be surjective in degree 0 "unless at least one of the
  compositions w_i[-1]∘beta0 is nonzero": matches the LES in my proof of 10.2.
- After 10.5: "the term W^2 = 0 replaces the term U^0 of Proposition 10.2": the omitted proof of 10.2 uses
  the same exact sequence with U^0 as the obstruction term.
- 10.3(1): "the surviving class is the cokernel of delta^0, as predicted by (??)": a formula
  Ext^1_Lambda(Z,Z) ≅ coker delta^0 (under H^1 = 0-type conditions) — proved here in this setting (10.2 Steps a–f).
- Section 10 intro: "Tate duality also forces the vanishing" (10.4). My proof of 10.4 uses duality only
  to get H^{-1}≠0, H^{-2}=H^{-3}=0.

## Summary
| Statement | Verdict | Notes |
|---|---|---|
| Prop 10.1 | PROVED | LES of the cone of tau + Thm 2.1 (duality and compatibility) for tau-multiplication isos |
| Prop 10.2 | PROVED | dim[s,Fs]^0 = 2 > rank delta^0 <= 1; Ext^1_Lambda(Z,Z) ≅ [s,Fs]^0/ke ≠ 0 via Lemma 8.3 and the sequence 0->L1 s->Z->L2 C->0 (uses H^0=k, H^1=0; no use of Thm 8.4's conclusion) |
| Cor 10.3 | PROVED | w[-1]beta0 ≠ 0 would make s[-1] a summand of X, so H^3 ⊂ U^4 = 0; equivalently <beta0,tau,beta0> = 0. Holds also if w1=w2=0. Minor ambiguity in "single cone as above" |
| Thm 10.4 | PROVED | bracket a single element of H^0=k; if nonzero, the cone of beta is s[1] and gives a triangle s[-2]->s[1]->s->s[-1], whence H^3=0 by H^2=H^4=0. Ext^4=0 is necessary (Nakayama example, supported) |
| Cor 10.5 | PROVED | p=3 from 10.4; p>=4 trivially (bracket in H^{p-3}=0), not via 10.4 |
