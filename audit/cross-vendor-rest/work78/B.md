Model: Claude Opus 5.5 (claude-opus-5-5); effort: unknown.

# Phase B: the report's proofs of Sections 7-8 (report pp. 28-34) against Phase A (A.md)

Read: <package>/phaseB/report-sec7-8.pdf, pp. 1-7 (report pp. 28-34). Nothing else.
Background statements of Sections 4-6 are taken as stated (as in Phase A). All verdicts are AI checks.

## Proposition 7.2 — NO ERROR FOUND

Report route: R_Y = B (x)_k R_W resolves Y by right-projective bimodules; degreewise
(B (x) 1_{l+n}K_l) (x)_{B_1} O ≅ 1_{l+n}O = P^{b+n}, differential becomes d_P; the maps (-1)^{bn} give an
isomorphism of complexes of bimodules R_Y (x)_{B_1} O ≅ P[b]. R_X = O ⊕ R_Y computes Phi on all
complexes; Phi N = O (x)_B N, Phi^2 N = R_Y (x)_{B_1}(O (x)_B N) ≅ (R_Y (x)_{B_1} O) (x)_B N ≅ P[b] (x)_B N.
Checks.
- Sign twist: P[b] has differential (-1)^b d_P; (-1)^{b(n+1)} = (-1)^b (-1)^{bn}: correct.
- R_Y (x) O has no Koszul sign (O is in degree 0): correct; the associativity isomorphism
  x (x)(o (x) n) |-> (x (x) o)(x) n has no sign since o has degree 0: correct.
- P[b] (x)_B N vs (P (x)_B N)[b]: with d(u (x) v) = du (x) v + (-1)^{|u|} u (x) dv, both differentials
  equal (-1)^b d_P (x) 1 + (-1)^{p+b} 1 (x) d_N (p = degree in P), so they are EQUAL complexes. Correct.
- Second application of Phi uses O pi_1 = 0 (O = pi_1 O pi_0), so R_X (x)_Delta (O(x)N) = R_Y (x)_{B_1}(O(x)N).
  Correct, though the report leaves this implicit.
- Unbounded N: R_X bounded complex of right-projective (flat) modules, so it is K-flat: correct.
- Global dimension: right simple K_l-module at j has the resolution (7.1) truncated at j (length j <= l);
  left simples have successive syzygies simple at the following vertices (length l-j <= l).
  I = J_B (x) K_l + B (x) J_K nilpotent, B_1/I = (B/J_B)^{l+1} semisimple, so simples are S (x)_k L
  (L one-dimensional, so S (x) L is simple even if End S is a non-split division algebra). Tensor of
  projective resolutions over k is a projective resolution (Kunneth): length <= d_L + l. Filtration by
  semisimples gives gldim B_1 <= d_L + l; product: correct.
Comparison with Phase A: same Phi^2 computation, but the report gets a bimodule-level identification
first (cleaner, makes the prose claim Y (x)^L O ≅ P[b] a by-product). Global dimension via simples
instead of my vertex filtration; both correct. Nothing extra needed.

## Theorem 7.3 — NO ERROR FOUND

- Quantifiers: presentation, B, M, P (Thm 6.18), a, b, l, Delta, X, A are fixed before Y ("All these
  choices are made before the module Y is chosen"). One algebra for all Y: correct.
- gldim: B <= 2 both sides (Prop 6.4), Delta <= l+2 both sides (Prop 7.2): correct.
- "By Proposition 7.2, Phi^{2r}N ≅ (F^r M(Y))[rb]": an induction on r, applying 7.2 to the complex
  F^{r-1}M(Y)[(r-1)b] and using that Phi is a functor commuting with shifts; implicit but routine.
- Cor 6.20 gives ⊕_{j=0}^r (M(H^rY)[rb+3j])^{binom(r,j)}: consistent with my A.md.
- Phi^{2t}N ≃ 0, Phi^{2t-2}N ≄ 0 (Prop 6.4: M(H^{t-1}Y) ≠ 0): correct.
- Upper bound: Cor 4.5 with d_L = d_R = l+2 and 2t in place of t: (l+2)+(2t-1)(l+3). Correct under
  either reading of Cor 4.5 (t minimal or any t with Phi^t N ≃ 0).
- Lower bound from Prop 4.4 ("in particular"): valid in the needed form because Phi^r N lies in
  D^{<=0} (derived tensor powers of a module), so a nonzero Phi^r N has pd >= 0 (noted in A.md).
- Last assertion: f.d. modules are f.g.: correct.
Same route as Phase A.

## Corollary 7.4 — WORDING (minor), otherwise NO ERROR FOUND

- One algebra A for all m: from Thm 7.3 applied once to the selection data of Thm 5.17, then to Y_m.
  Correct.
- "The simple A-modules are the simple Delta-modules, by the proof of Proposition 4.4": the proof of 4.4
  is outside my material; the fact is elementary and I checked it independently (X is an ideal of A with
  X^2 = 0, so X ⊆ rad A and A/X = Delta). WORDING: cite this one-line reason instead of a proof.
- 3 simples for B (one per vertex; e_i B e_i = k since J2 ⊆ paths of length 2 and Q acyclic) and
  3(l+1) for B_1: total 3(l+2). Correct.
- Citation [Ope26b, Theorem 1.1] (attribution): not checked (no access, out of scope).

## Remarks 7.5, 7.6 (not statements; spot check)
- 7.5: B has 2(d+1) arrows (s, a_1..a_d, s', a'_1..a'_d): correct. l not determined: consistent with
  Phase A (Thm 6.18 gives no bound). Not checked: the count of auxiliary generators.
- 7.6: [Ope26b, Prop 5.1] bound 3l+2: NOT CHECKED (external). The claim that only finiteness matters
  except for the explicit upper bound in 7.3: correct.

## Lemma 8.2 — WORDING (the vague clause), otherwise NO ERROR FOUND

Proof checked step by step.
- Extension property: u eps_n is a cocycle of Hom(P,L) (it kills im d^{n-1}), hence a coboundary
  ± b d^n; since d^n = j_n eps_n with eps_n onto, b j_n = ±u. Correct (sign absorbed into b).
- Surjectivity: lift u eps_0 to f^0 (P^0 projective, W^0 -> N onto); f^n, n < 0, by lifting into
  im d_W^n (the needed vanishing d_W f^{n+1} d_P^n = 0, resp. for n = -1 landing in ker(W^0 -> N), is
  standard; implicit). For n >= 0: d_W^n f^n kills im d_P^{n-1}, factors through C^n(P), extend. Correct.
- Well defined: f = d h + h d induces the map induced by h^1 d_P^0, which factors through P^1. Correct.
- Injectivity: subtract the boundary of h^1 = beta' alpha'; then the two recursions: n < 0 uses
  d_W(f^n - h^{n+1} d_P^n) = (f^{n+1} - d_W h^{n+1}) d_P^n = h^{n+2} d^{n+1} d^n = 0 (with h^1 = 0 at the
  start): correct; n >= 1 identical to my A.md argument: correct.
- General a via (P[-a], W) and (P, W[a]): correct (cohomology insensitive to the sign changes).
- a > 0: Ext^a(M,N) = maps C^{-a}(P) -> N modulo those extending to P^{-a+1} = maps factoring through
  projectives (extension property); with N = L projective every map extends, so Ext^a(M,L) = 0. Correct.
Open point 1 (vague clause "compatible with composition and with additive functors that preserve the
complexes involved"; proof: "follows from the construction"). Uses in Sections 7-8:
 (a) 8.1 prose: two complete resolutions are homotopy equivalent; C^0 identifies the homotopy
     category with mod-stable E. Needs only that [f] |-> C^0(f) is a functor: true (composition of
     chain maps induces composition on C^0).
 (b) 8.1 prose: F (x)_E - induces an exact functor with F(M[a]) ≅ (FM)[a], F(g). Needs C^0(FP) = F C^0(P)
     and FP a complete resolution: true since F (x)_E - is exact and preserves projectives.
 (c) Thm 8.4: "delta induces delta^a in cohomology": needs that chain-level F(g) f and f j represent
     F(g)v and v[a]j under H^a Hom = Ext-hat^a. True up to the sign conventions identifying degree-a
     cocycles with chain maps into shifts ("up to the signs of the shift"); such signs replace delta^a by
     (g,j) |-> ±F(g)v ± v[a]j, which has the same kernel/image dimensions, so the hypotheses of 8.4 are
     unaffected.
 (d) Ext^a_Lambda(Z,Z) = H^a Hom(P_Z,P_Z): uses only the isomorphism, not the clause.
 So the clause is used only in true forms. WORDING proposal: "The isomorphisms are induced by
 f |-> C^0(f); in particular they are compatible with composition of chain maps, and with every exact
 additive functor G for which G(P) and G(W) are again complexes of the same kind."
Comparison: report's route = my Phase A route.

## Lemma 8.3 — NO ERROR FOUND
(1) maps out of L_1M are determined by alpha (beta = eta' F(alpha)); maps out of L_2M are arbitrary
M -> N'; L_1M -> L_2N forced zero. (2) columns of Lambda; first component of a summand of Lambda^r is a
summand of E^r. (3) Hom_Lambda(L_1P,Lambda) ≅ Hom_E(P,E), Hom_Lambda(L_2P,Lambda) ≅ Hom_E(P,F) ⊕ Hom_E(P,E),
exact (_E F projective, P totally acyclic). All correct, same as Phase A.

## Theorem 8.4 — NO ERROR FOUND; WORDING (optional) on the two hypotheses

Proof checked step by step.
- Complete resolution P of S with P^1 = Q, d^0 = i eps_0: possible (E self-injective). Chain map
  f: P -> FP inducing v_0 on C^0 exists by Lemma 8.2 (FP exact of f.g. projectives, C^0(FP) = FS). V^n =
  (0, f^n): L_2P -> L_1P is a chain map (Lemma 8.3(1)).
- Cone sign: d_{P_Z} = [[L_1(d), V],[0, -L_2(d)]] on L_1P^n ⊕ L_2P^{n+1}; d^2 = 0 iff L_1(d)V = V L_2(d),
  true as V is a chain map. Standard cone. Degreewise split sequence 0 -> L_1P -> P_Z -> L_2P[1] -> 0,
  outer terms totally acyclic (Lemma 8.3(3)); exactness of P_Z and of Hom(P_Z,Lambda) by long exact
  sequences (Hom(-,Lambda) of a degreewise split sequence is short exact). Correct.
- C^0(P_Z): first component C^0(P) = S. Second component: coker of FP^{-1} ⊕ P^0 -> FP^0 ⊕ Q,
  (x,y) |-> (F(d)x + f^0 y, -i eps_0 y). Dividing first by im F(d) gives FS (right exactness), and the
  image of y becomes (v_0 eps_0 y, -i eps_0 y) (f induces v_0); eps_0 onto, so the cokernel is
  (FS ⊕ Q)/{(v_0 s, -i s)}, structure map induced by FS ⊆; (t,q) |-> (t,-q) gives C^0(P_Z) ≅ Z
  compatibly with iota. Correct. Hence Z Gorenstein-projective, Ext^a(Z,Lambda) = 0 (Lemma 8.2), f.d.
- delta: H^{⊕2} -> K, (g,j) |-> F(g)f - fj is a chain map (∂F(g) = F(∂g) since d_{FP} = F(d); f is a
  cocycle of degree 0). Induces delta^a: see Lemma 8.2 point (c) (true up to harmless signs).
- Hom_Lambda(P_Z,P_Z)^n ≅ H^n ⊕ H^n ⊕ K^{n-1} via the matrix [[L_1 g, (-1)^n h],[0, (-1)^n L_2 j]]
  (no L_1 -> L_2 maps). I recomputed ∂Phi = d Phi - (-1)^n Phi d:
    (1,1) L_1(∂g); (2,2) -(-1)^n L_2(dj) + L_2(jd) = (-1)^{n+1} L_2(∂j);
    (1,2) (-1)^n(dh + fj) - (-1)^n(F(g)f - (-1)^n hd) = (-1)^n(∂h - delta(g,j)), ∂h = dh + (-1)^n hd
          for h of degree n-1.
  So ∂(g,j,h) = (∂g, ∂j, delta(g,j) - ∂h), exactly as in the report. Degreewise split
  0 -> K[-1] -> Hom(P_Z,P_Z) -> H^{⊕2} -> 0 (K[-1] has differential -∂, consistent); connecting map
  = delta^a; (8.5) 0 -> coker delta^{a-1} -> H^a Hom(P_Z,P_Z) -> ker delta^a -> 0. Correct.
- a = 1: delta^0 onto, delta^1 injective; a >= 2: delta^{a-1}, delta^a bijective. Ext^a(Z,Z) = 0 for
  a > 0. Correct.
- Nonprojectivity: ker delta^0 ≠ 0 => End-stable(S) ≠ 0 => S nonprojective => Z nonprojective
  because the first component of a f.g. projective Lambda-module is projective (Lemma 8.3(2)). Correct.
Open point 2.
 - Symmetry of E: used only to make f.g. projectives injective and embed every module into a projective
   (self-injectivity), as Remark 8.6 itself says; no Tate duality. (Ext-hat is set up in Section 2.1 for
   symmetric algebras, so the statement is consistent with the document's conventions.)
   WORDING (optional): "self-injective" suffices; Remark 8.6 already records it.
 - ker delta^0 ≠ 0: used only to get S nonprojective. WORDING (optional): the hypothesis can be weakened
   to "S is not projective" (given delta^0 onto and delta^a bijective for a > 0). Not an error.
 - Exactness of (8.5) shows the delta-hypotheses (apart from ker delta^0 ≠ 0) are necessary and
   sufficient for Ext^{>0}(Z,Z) = 0, matching my Phase A criterion.
Comparison with Phase A: different and better route. Phase A worked in the homotopy category of totally
acyclic complexes with a triangle A_2 -> A_1 -> Z, needed an identification of the connecting morphism
with ±v (via Ext^1 classes and an exact functor) and a separate extension-closure argument for
Gorenstein-projectivity. The report builds P_Z explicitly as the cone of V and computes C^0(P_Z) ≅ Z
directly, so neither of those extra steps is needed; its Hom-complex computation (cocone of delta) gives
the same criterion. Nothing in the report's route needs anything mine did not. Nonprojectivity via Lemma
8.3(2) is simpler than my triangle argument.

## Remark 8.6 (not a statement; spot check)
(8.5) without hypotheses and "if delta^1 injective then Ext^1(Z,Z) ≅ coker delta^0": correct. The
dimension heuristic for applications: consistent. The Section 9 claim (Ext-hat^0(S,FS)
one-dimensional): out of scope.

## Cited results not checked
- [Ope26b, Theorem 1.1] (Cor 7.4 attribution), [Ope26b, Prop 5.1] (Remark 7.6), [AR75], [Ope26c]
  (Section 8 intro): external, attributions only; no proof depends on them.
- "by the proof of Proposition 4.4" (Cor 7.4): proof not in my material; fact verified independently.
- Background statements used as stated: 4.3, 4.4, 4.5, 5.17, 6.4, 6.18, 6.20.

## Summary table

| Statement | Verdict | Notes |
|---|---|---|
| Prop 7.2 | NO ERROR FOUND | Signs in R_Y(x)O ≅ P[b] ((-1)^{bn}) and P[b](x)N = (P(x)N)[b] verified; O pi_1 = 0 left implicit. gldim bound via simples correct. |
| Thm 7.3 | NO ERROR FOUND | One A for all Y; induction for Phi^{2r} implicit; bounds from Cor 4.5 (2t) and Prop 4.4. |
| Cor 7.4 | WORDING (minor) | "simple A = simple Delta by the proof of Prop 4.4": cite X^2 = 0 instead. 3(l+2), gldim <= l+2 correct. |
| Lemma 8.2 | WORDING | Proof correct. The vague compatibility clause is used only in true forms (C^0 functorial; exact F (x)_E -; delta induces delta^a up to harmless signs); proposed precise wording. |
| Lemma 8.3 | NO ERROR FOUND | |
| Thm 8.4 | NO ERROR FOUND (optional WORDING) | Cone sign and ∂(g,j,h) = (∂g,∂j,delta(g,j)-∂h) recomputed; C^0(P_Z) ≅ Z checked. Symmetry used only as self-injectivity; ker delta^0 ≠ 0 only for S nonprojective (could be weakened to "S not projective"). |

No ERROR and no GAP found in Sections 7-8.
