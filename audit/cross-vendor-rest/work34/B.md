# Phase B: report proofs of Sections 3–4 vs. Phase A

Checker: Claude Opus 5.5 (claude-opus-5-5), effort unknown. Input: report-sec3-4.pdf, pages 1–8 (report pp. 5–12),
plus my Phase A record A.md. All verdicts are AI checks.

Verdict scale: NO ERROR FOUND / ERROR / GAP / WORDING.

## Prop 3.1 — NO ERROR FOUND
The proof shows pd c_{n+1} <= pd c_n + 1 by induction and gets equality from Ext^{j+1}(c_{n+1},V) = Ext^j(c_n,V) with
j = n >= 1. This is the same as my Phase A route. Remark 3.2 claims a Lean formalisation (Appendix B); I could not
check it.

## Thm 3.3 — NO ERROR FOUND
- The steps match my Phase A route: exactness of the dual complex, the short exact sequences with C_0 = P_0^*,
  "C_1 projective => P_1 -> P_0 split epi => E = 0", and the minimal presentation of Omega^{n-1}E.
- Orientation is consistent. E is a right module, the C_n are left modules, and the conclusion findim A = infinity
  is about left modules. The lead-in sentence "findim A^op < infinity implies the strong Nakayama conjecture for A
  (left modules)" is the same theorem applied to A^op, so it is consistent too.
- Cited and not checked: [Cra, §3.2, Prop. 5] and the Lean claim in Remark 3.4. Neither is needed.

## Prop 3.5 — NO ERROR FOUND (one implicit standard fact; one WORDING)
- **Indexing.** The report writes the resolution as 0 -> Q_0 -> Q_1 -> C, with Q_1 the cover. Then
  E = coker(Q_1^* -> Q_0^*) = Ext^1(C,A), and E^* = ker(Q_0 -> Q_1) = 0. Correct.
- **Where "no projective summands" is used.** It is used, implicitly. In (1)=>(3) the report dualises a *minimal*
  resolution of E and says its first cokernel is "Tr E = C". That needs Tr Tr C = C, which holds exactly because C
  has no projective summands (standard, ARS IV.1; not cited). The hypothesis is dispensable: my Phase A route takes a
  resolution of E that extends the presentation Q_1^* -> Q_0^*. Its dual begins 0 -> Q_0 -> Q_1, with cokernel C, so
  no Tr Tr is needed.
- **"C is not projective" in (2) and (3).** The text gives no separate argument. It is implied by pd C = 1, so it is
  harmless redundancy.
- **(3)=>(1).** Correct, same as my route.
- WORDING: "In this case E = Ext^1_A(C,A)". The proof shows this for every C of projective dimension one. Suggest:
  "Moreover E = Ext^1_A(C,A)." Optionally add "(the first condition in (2) and (3) is automatic since pd C = 1)".

## Cor 3.6 — NO ERROR FOUND
The proof uses that C_n is torsionless. That holds because C_n is a submodule of P_{n+1}^*, from the sequences in the
proof of Theorem 3.3, but the report leaves this implicit.

## Thm 3.7 — NO ERROR FOUND
- The resolution of S is the same as mine: F G_j -> F G_{j-1} -> ... -> F P -> F M, with surjective right add
  G-approximations.
- For exactness the report uses a shorter route than mine. The sequence ... -> G_0 -> P -> M -> 0 is exact and its
  terms are Hom(-,G)-acyclic (because Ext^{>=1}(G,G) = 0), so it computes Ext^*(M,G), which vanishes in positive
  degrees. I re-indexed it: Gamma-degree i >= 2 corresponds to Ext^{i-1}(M,G) = 0; degree 1 is exact because the
  kernel of Hom(P,G) -> Hom(G_0,G) is Hom(M,G); degree 0 is exact because pi is epi. Correct.
- Conventions: F = Hom_Lambda(G,-) lands in left Gamma-modules, Hom_Gamma(F Y, Gamma) = Hom_Lambda(Y,G), and the
  final step applies Theorem 3.3 to Gamma^op = End(G). All consistent.
- The proof of S != 0 is correct.
- Cited and not checked: [AR75, Thm 1.1(b)]. It is not used in the proof.

## Prop 3.8 — NO ERROR FOUND (one unproved standard fact)
- **Isomorphism.** eta_V : V -> Hom_{B^op}(Af, Vf). Multiplying by f gives the identity of Vf, so the kernel and
  cokernel are killed by f. Hom(S,V) = 0 gives injectivity. Ext^1(S,V) = 0 gives Ext^1(coker, V) = 0, so the
  sequence splits; the cokernel T then embeds in Hom_B(Af,Vf), and Hom_A(T, Hom_B(Af,Vf)) = Hom_B(Tf,Vf) = 0, so
  T = 0. I checked every step. This is a different route from my Phase A one (I factored the multiplication map),
  and it is equally valid.
- **Simple count.** "Passing from A to B removes exactly the class of S" is stated without proof or citation. It is
  standard (simple fAf-modules correspond to simple modules T with Tf != 0).
- **M not projective.** Argued via Morita equivalence, as I did.
- **Last part.** A minimal injective resolution I^. of A_A has no summand with socle S, since Hom(S,I^j) = Ext^j(S,A)
  for a minimal resolution. So each I^j is a sum of D(Ae_t) with e_t <= f. Then
  I^j f = sum of D(fAe_t) = sum of D(Be_t), which is injective over B. I^. f is an injective resolution of Af, and
  eta for each I^j is an isomorphism (Hom(S,I^j) = 0 and Ext^1 = 0). So Hom_B(Af, I^.f) = I^., giving
  Ext^{>0}_B(Af,Af) = 0. Correct.
- This route differs from mine (derived adjunction plus dévissage of a cone). It needs only the standard fact above
  about minimal injective resolutions.

## Example 3.9 (remark) — WORDING
- The computation is correct; I redid it: resolution 0 -> e1A -> e2A -> e3A -> S, Hom = Ext^1 = 0, and
  Ext^2 = Ae_1/ka != 0.
- But the claim "the two conditions do not suffice for the last assertion" requires that the *conclusion* fails.
  The text only shows that the hypothesis Ext^2(S,A) = 0 fails.
- I checked that the conclusion does fail. Here B = k(1 -a-> 2) and M = kb is the simple top of e_2B, with
  resolution 0 -> e_1B -> e_2B -> M -> 0. Then Ext^1_B(M,B) = coker(Be_2 -> Be_1) = k e_1, which is nonzero.
- Suggest adding: "and Ext^1_{B^op}(M,B) != 0 for B = k(1 -> 2) and M the simple top of e_2B".

## Prop 3.10 — NO ERROR FOUND (two routine steps compressed)
- The route is the same as mine. The report's e = diag(1,0) is my e1 and its f = diag(0,1) is my e2. j_!Y = Y (x)^L_C fA.
- (a) The triangle j_!Y -> E -> i_*Z -> asserts without argument that the cone of the counit is i_*Z. Routine: the
  e2-part of the cone is acyclic and its e1-part is cone(Y (x)^L M -> X).
- (b) "Adjunction gives RHom(Z,B) = RHom(E,eA)" also uses RHom(j_!Y, eA) = RHom_C(Y, eAf) = 0 (eAf = 0). This is not
  stated.
- **Complex-to-module step (my Phase A observation).** The report does it, the same way I did: minimal complex P^.,
  the dual 0 -> (P^m)^* -> (P^{m-1})^* -> ... is exact, its first cokernel is not projective by minimality, then
  Proposition 3.1. Settled. The existence of minimal complexes is not cited, but the proof of Lemma 4.3 constructs
  them.
- In the case Z = 0: E = j_!Y gives Y != 0, and RHom_C(Y,C) = RHom_A(j_!Y, fA) = 0. Correct.
- Orientation: left B-modules get unbounded projective dimension, consistent with the left findim convention.

## Prop 3.11 — NO ERROR FOUND; WORDING on "dimension vector"
- The proof is the same as my Phase A proof (Tor_{n+1}(A/J,-), a free resolution of the right module A/J, rank
  semicontinuity, a noetherian chain).
- "Dimension vector" and "module variety Rep_d(A)" are never defined for a general A over an arbitrary field. The
  proof uses only that Rep_d(A) is a Zariski-closed set of k-points on which the action matrices are polynomial. That
  holds for Rep_d with d an integer (as in §4.3), and for any dimension-vector subvariety. So the use is correct
  under either reading.
- WORDING: replace "d a dimension vector" by "d >= 0 an integer, Rep_d(A) the set of A-module structures on k^d
  (as in Section 4.3)", or define Rep_d for a dimension vector.
- Cited and not checked: [Hap90 §2.3], [GLS24 Cor. 2.6], [Sch95 Ex. 7]. None is needed.
- The remark dim Tr N <= (dim A)^2 dim N is correct.

## Thm 4.1 — NO ERROR FOUND
This is a different route from mine: a bar resolution over the dg algebra Ã = Δ ⊕ X̃. Mine was a splitting by
truncation, then iteration. I checked:
- **The F_r are bounded-above complexes of projective Δ-modules.** V (x)_Δ L is a summand of a sum of Δ (x)_k L.
  Degreewise finiteness holds because all factors are in nonpositive degrees.
- **Signs.** D = d' + b with d'(s^r w) = (-1)^r s^r dw.
  - d'^2 = 0.
  - b^2 = 0 because X̃^2 = 0.
  - d'b + bd' = ((-1)^{r-1} + (-1)^r) s^{r-1} m(dw) = 0, using that multiplication m is a chain map (Leibniz in Ã).
  - Ã-linearity:
    - On the b part, b(a·z) = (-1)^{|a|} a·b(z), since (-1)^{r|a|} / (-1)^{(r-1)|a|} = (-1)^{|a|}.
    - On the d' part I verified D(a·s^r w) = da·s^r w + (-1)^{|a|} a·D(s^r w) directly.
- **ε is a chain map.** The index-1 part goes to aq (x) v, which ε kills.
- **Contractibility.** The decomposition into Ñ and F_r[r] ⊕ F_r[r-1] is preserved by D: on the Δ-leading part
  d(δ) = 0, and b sends Δ-leading to X̃-leading; on the X̃-leading part b = 0 since X̃^2 = 0. Each piece is the cone
  of an isomorphism, hence contractible.
- **K-flatness and base change.** The filtration is split as graded modules. Z (x)_Ã (Ã (x)_Δ F_r) = Z (x)_Δ F_r is
  acyclic since F_r is K-flat, so B is K-flat over Ã. B -> L = A (x)_Ã B is a quasi-isomorphism. ε factors through L
  because N is an A-module, and 2-out-of-3 gives L -> N quasi-iso. L consists of projective A-modules
  A (x)_Δ F_r^j, vanishes in positive degrees, and has finitely many r per degree.
- **Δ (x)_A L.** The bar differential dies because aq_1 lies in X. The differential (-1)^r d_{F_r} is that of
  F_r[r] under the convention d_{K[s]} = (-1)^s d_K.
- **F_r represents Φ^r N.** This uses K-flatness of F_{r-1}. Naturality comes from a functorial Ñ.

No flatness of X is used; as with my route, nothing beyond the definitions is needed.

Cited and not checked: [MY20, Lemma 4.13(4), proof of Thm 4.17], and the claim about how the source states the
result. The proof is self-contained.

## Example 4.2 (remark) — NO ERROR FOUND
I checked:
- dim Δ = 6.
- A = kQ/(ax, xb) (ax = 0 because a kills S_0; xb = 0 because S'_2 b = 0).
- X (x)_Δ S_1 = 0.
- The resolution of S'_2 gives Φ S_1 = S_0[1] and Φ^2 S_1 = 0.
- The minimal resolution 0 -> Ae_1 -> Ae_0 -> Ae_2 -> Ae_1 -> S_1 has length 3. Recomputed:
  - the kernel of Ae_1 -> S_1 is kb;
  - the kernel of ·b is kx;
  - the kernel of ·x is {a, ba}, isomorphic to Ae_1.
- pd_Δ S_1 = 1 and pd_Δ S_0[1] + 1 = 3. Consistent with Proposition 4.4.

## Lemma 4.3 — NO ERROR FOUND
- The report reduces to a minimal complex by cancelling invertible components between tops, from the highest degree
  downwards. Restricting a differential to a complement keeps its image in the radical, and each degree is changed
  only finitely often, so the limit is legitimate.
- The rest is the same as my Phase A route.

## Prop 4.4 — NO ERROR FOUND
- The proof that simple A-modules are killed by X is correct (XS = S would give S = X^2 S = 0).
- Adjunction and the product formula are correct, and the factors with r > n vanish.
- "pd Φ^r N >= 0 by Lemma 4.3" is terse. It holds because for top cohomology degree t <= 0,
  Hom(C, S[-t]) = Hom(H^t C, S) != 0.
- Cited and not checked: [MY20, Cor. 4.11].

## Cor 4.5 — NO ERROR FOUND
- X' -> X is the truncation at the d_R-th syzygy; it is right-projective and lives in degrees [-d_R, 0].
- Tensor powers of X' compute Φ^r, so Φ^r N lies in [-r d_R, 0].
- pd C <= d_L - u by dévissage over the truncation triangles together with Lemma 4.3.
- So pd Φ^r N + r <= d_L + r(d_R + 1). Both directions and the last assertion are correct. The bounds and shifts
  agree with my Phase A computation.
- Remark (not an error): d_L = d_R for finite-dimensional algebras.

## Remark 4.6 — NO ERROR FOUND (in scope part)
- The nilpotence argument on the generalised kernel in Q^n is correct, and K_0 = Z^n holds for finite global
  dimension.
- Its reference to Proposition 7.2 and Theorem 6.18 is outside scope.

## Prop 4.7 — NO ERROR FOUND
- This is a different route from mine; I went through Corollary 4.5 and Proposition 3.11 for A. The report argues
  directly:
  - Rep_d(Δ) splits into finitely many clopen pieces on which the dim f_i N are constant. Idempotent ranks are
    locally constant because rank f_i >= c and rank(1 - f_i) >= d - c are open conditions and the ranks sum to d.
  - The terms of X'^{(x)t} (x) N are subspaces ε_j N^{n_j} of constant dimension.
  - Exactness is the open condition rank D^{j-1} + rank D^j >= dim C^j, with finitely many j since X'^{(x)t} is
    bounded.
  - The chain U_t is ascending and stabilises in a noetherian piece.
- I checked each step.
- The proof uses only that pd(X_Δ) is finite, which is weaker than finite right global dimension. Observation only.
- The bimodule differential is a right-module map, so it is a matrix over Δ acting on N^{n_j}, which is polynomial
  in N. Correct.

## Summary table

| Item | Verdict | Note |
|---|---|---|
| Prop 3.1 | NO ERROR FOUND | same route |
| Thm 3.3 | NO ERROR FOUND | same route; orientation consistent |
| Prop 3.5 | NO ERROR FOUND + WORDING | "no proj. summands" used implicitly via Tr Tr C = C (uncited, standard, avoidable); "C not projective" redundant; "In this case" -> "Moreover" |
| Cor 3.6 | NO ERROR FOUND | torsionless via C_n subset P_{n+1}^* implicit |
| Thm 3.7 | NO ERROR FOUND | acyclic-resolution route, shorter than mine |
| Prop 3.8 | NO ERROR FOUND | eta_V-splitting and injective-resolution routes, both correct; simple count uncited (standard) |
| Ex 3.9 | WORDING | shows only that the hypothesis fails; conclusion does fail (Ext^1_B(M,B) = k), add this |
| Prop 3.10 | NO ERROR FOUND | cone = i_*Z and RHom(j_!Y,eA) = 0 left implicit; complex-to-module step present |
| Prop 3.11 | NO ERROR FOUND + WORDING | "dimension vector" undefined; proof works for Rep_d, d integer |
| Thm 4.1 | NO ERROR FOUND | bar resolution over dg Ã; signs, D^2 = 0, Ã-linearity, K-flatness checked |
| Ex 4.2 | NO ERROR FOUND | recomputed |
| Lemma 4.3 | NO ERROR FOUND | |
| Prop 4.4 | NO ERROR FOUND | |
| Cor 4.5 | NO ERROR FOUND | shifts and bound agree with Phase A |
| Rem 4.6 | NO ERROR FOUND | in-scope part |
| Prop 4.7 | NO ERROR FOUND | direct route; needs only pd(X_Δ) finite |

Errors found: none. Gaps: only routine implicit steps (3.5 Tr Tr C = C; 3.10 cone identification and
RHom(j_!Y,eA) = 0; 3.6 torsionless). Every Phase A observation is settled above.

Cited results I could not check (none is needed by the proofs as written):
- [Cra §3.2 Prop 5]
- [AR75 Thm 1.1(b)]
- [MY20 Lemma 4.13(4), Thm 4.17, Cor 4.11]
- [Hap90 §2.3]
- [GLS24 Cor 2.6]
- [Sch95 Ex 7]
- the Lean claims in Remarks 3.2 and 3.4 (Appendix B)
