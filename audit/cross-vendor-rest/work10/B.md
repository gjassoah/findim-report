# Phase B check of Section 10 (report pp. 43–46) — Claude Opus 5.5, effort unknown
Compared against my Phase A file A.md (same directory). Conventions as in A.md.

## Prop 10.1 — NO ERROR FOUND
- Exact sequence 0 -> coker(tau: H^{a-3}->H^a) -> U^a -> ker(tau: H^{a-2}->H^{a+1}) -> 0: correct (Hom(s,-[a])
  on the triangle; the connecting map is ±tau, sign irrelevant). Same as A.md.
- Cited iso H^{-3m-1} -> H^{-3m+2} "by the argument of Proposition 9.11": I could not check 9.11 (not available).
  Repair/independent check: A.md, Claim (duality pairing + compatibility, Thm 2.1); it holds for left and right
  multiplication. The proof uses left multiplication (postcomposition) and does not say so; harmless.
- Injectivity of tau on H^{3m} (needed for "only nonzero kernel") is implicit; true since k[tau] is a domain.

## Prop 10.2 — first claim NO ERROR FOUND; second claim GAP (cited formula (8.5) not checkable here) + WORDING
- delta^0 part: identical to A.md (sequence (H^{-1})^2 -> U^0 -> V^0 -> (H^0)^2 -> U^1, dim V^0 = 2,
  im delta^0 = k v). Correct.
- "By the exact sequence (8.5) for a = 1, the cokernel of delta^0 embeds into Ext^1_Lambda(Z,Z)": (8.5) is not in the
  statements or in the pages provided, so I cannot check it, nor whether it needs hypotheses of Thm 8.4 (the
  conclusion of Thm 8.4 is not available here). Independent repair: A.md 10.2 Steps a–f prove, from Lemma 8.3 and
  0 -> L1 s -> Z -> L2(Q/s) -> 0 only, that Ext^1_Lambda(Z,Z) ≅ [s,Fs]^0 / k e with e = ±v, i.e. ≅ coker delta^0,
  using H^0 = k and H^1 = 0. So the conclusion stands; the report's step rests on an unchecked citation.
- WORDING: "if defined": Z is always defined by the formula (needs only v0 and an injection into a projective);
  the proof does not address this phrase. Suggest deleting it.

## Cor 10.3 — NO ERROR FOUND (proof); WORDING (second sentence)
- Report route: gamma in H^{-4} with gamma[3]∘tau = beta0, then w[-1]∘beta0 = (w[-4]∘gamma)[3]∘tau with
  w[-4]∘gamma in U^{-3} = 0. Checked: degrees (gamma[3]: s[3] -> s[-1]; w[-1]∘gamma[3] = (w[-4]∘gamma)[3];
  w[-4]∘gamma: s -> X[-3]). Existence of gamma: <gamma tau, 1> = <gamma, tau> (Thm 2.1 compatibility, pairing
  H^{-4} x H^3 nondegenerate, tau ≠ 0), so gamma ↦ gamma tau is nonzero onto the 1-dim H^{-1}. Correct.
- Route comparison: mine (A.md) avoids the pairing (uses zeta with zeta∘i = beta0 and U^4 = 0); the report uses
  the pairing and U^{-3} = 0. Both correct; the report's is shorter and needs only Thm 2.1 and 10.1.
- "a single cone as above": in the report's text this can only refer to the data of Prop 10.2 (X the cone of tau,
  F with a triangle Fs -> s⊕s -> X[1], w1, w2 not both zero, any v); the phrase "in the situation of
  Proposition 10.1" is too weak (10.1 has no F, v). No definition of "single cone construction" in general is
  given; the second sentence is proved only for that data, by 10.2. The excluded case w1 = w2 = 0 is not covered
  by the report but also holds (A.md: dim[s,Fs]^0 = 3, Ext^1 ≠ 0). Repair: "Hence, in the situation of
  Proposition 10.2 (with or without the condition that w1, w2 are not both zero), ..."

## Thm 10.4 — NO ERROR FOUND (minor WORDING on shifts)
- Bracket convention (2.2), h = tau, g = beta, f = beta; defined (tau beta in H^2 = 0, beta^2 in H^{-2} = 0);
  degree 0; indeterminacy tau H^{-3} + H^1 beta = 0: all correct, same as A.md.
- gamma in H^{-4} with gamma tau = beta: as in 10.3 (if beta = 0, gamma = 0). Correct.
- <tau,beta,gamma>: defined (beta gamma in H^{-5} ≅ DH^4 = 0, tau beta = 0), degree 3-1-4-1 = -3, H^{-3} = 0,
  so it is {0}. Correct.
- Lemma 2.2 application, checked with explicit shifts: X = s, f = gamma: s -> s[-4], g = beta[-4],
  h = tau[-5], W = s[-2]; u = tau[-3]: s[-3] -> s, f u = (gamma tau)[-3] = beta[-3]. Then
  <h,g,f>∘u[1] ⊆ <h,g,fu>, and <h,g,fu> is <tau,beta,beta> realised with all objects shifted by [-3].
  Lemma 2.2 itself is immediate (if (a,b) is a defining system for <h,g,f>, then (a∘u[1], b) is one for <h,g,fu>);
  checked.
- WORDING: the identification of the [-3]-shifted realisation with <tau,beta,beta> is tacit; shifting a defining
  system changes it at most by signs, which keeps 0 in the bracket. Harmless.
- Route comparison: report uses Ext^4 = 0 as H^{-5} = 0 (duality) plus Lemma 2.2; mine (A.md) uses H^4 = 0 directly
  via the cone of beta and an indecomposability argument (needs splitting of idempotents and a standard
  triangle lemma). The report's route needs less and is correct.

## Cor 10.5 — GAP (minor): definedness for p > 3 not shown
- Settling my observation: for p ≥ 4 the report does NOT use Theorem 10.4; it argues that the bracket lies in
  Ext^{p-3} = 0 (0 < p-3 < p). So no error from the failing hypothesis Ext^4 = 0 at p = 4.
- GAP: "⟨tau,beta,beta⟩ = {0}" asserts the bracket is defined (nonempty); for p > 3 the proof does not check
  gf = beta^2 = 0 and hg = tau beta = 0. Repair: beta^2 in H^{-2} ≅ DH^1 = 0, tau beta in H^{p-1} = Ext^{p-1} = 0
  since 0 < p-1 < p. Then the bracket is nonempty and contained in H^{p-3} = 0.
- p = 3: hypotheses of 10.4 hold (s nonprojective since Ext^3 ≠ 0, Ext^1 = Ext^2 = Ext^4 = 0); the report does not
  say "nonprojective", tacitly fine.

## Remark 10.6 and other text (not numbered statements)
- Weight argument relies on Lemma 9.9, the twists h_lambda (9.3), and the claim delta(beta0) = 1: could not check
  (not available). The arithmetic -1 + 1 + 1 ≠ 0 is fine.
- My Nakayama example (symmetric Nakayama, two simples, P_s = s/t/s, P_t = t/s/t; dimension 6, Omega-period 4,
  Ext^4 ≠ 0, nonzero <tau,beta,beta>) is consistent with the report's "six-dimensional example in which ... a
  bracket of the form <tau,beta,beta> is nonzero ... periodic, not polynomial, Ext algebra"; it is plausibly the
  same example (could not check Appendix B).
- Paragraph after 10.5 (tensor square S satisfies 10.4's hypotheses; W^2 = 0 replaces U^0) and the paragraph before
  10.2 (degrees 3m and 1-3m after the first cone over T⊗T): rely on Section 9 results (9.13, Künneth); not checked.
- 10.3 computational evidence: "(8.5)" predicts the surviving class as coker delta^0; consistent with A.md
  (Ext^1 ≅ coker delta^0 in the setting of 10.2); scripts not checked.

## Cited results I could not check
Prop 9.11 (tau-isomorphism; independently reproved), exact sequence (8.5) (independently reproved in the 10.2
setting), Lemma 9.9 and Section 9.3 (Remark 10.6 only), Prop 9.13 and Appendix B (commentary only).

## Summary
| Statement | Verdict | Issue / repair |
|---|---|---|
| Prop 10.1 | NO ERROR FOUND | cites 9.11 for tau-isos (unchecked; reproved via Thm 2.1 in A.md) |
| Prop 10.2 | GAP (citation) + WORDING | last step cites (8.5), unavailable; independent proof Ext^1_Lambda(Z,Z) ≅ [s,Fs]^0/kv ≅ coker delta^0 in A.md. "if defined" is vacuous |
| Cor 10.3 | NO ERROR FOUND; WORDING | proof via gamma in H^{-4} and U^{-3} = 0 is correct. "single cone as above" should be "in the situation of Prop 10.2"; the case w1=w2=0 also holds |
| Thm 10.4 | NO ERROR FOUND | shifts and Lemma 2.2 application checked; identification of shifted bracket tacit |
| Cor 10.5 | GAP (minor) | p ≥ 4 does not use 10.4 (no error); definedness for p > 3 not shown: repair beta^2 in H^{-2}=0, tau beta in H^{p-1}=0 |
