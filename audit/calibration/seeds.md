# Sealed seed list of the calibration run (round 2)

Every entry below is a deliberately false statement inserted into a *copy* of a frozen dossier; none of them is in the real notes or in the report. Written by Claude Opus 5.5 (seeder session); the checkers never saw this file. Released here after scoring.

Pristine copies: <sealed directory>/orig/. Line numbers refer to the seeded files.

## 1. V-A-frozen.md, line 494 (Section 7.1, final construction of K_l)

- Original: ` \qquad c_i\in\varepsilon_iK_l\varepsilon_{i-1},`
- Modified: ` \qquad c_i\in\varepsilon_{i-1}K_l\varepsilon_i,`
- Type: convention (left/right; order of path composition).
- Correct statement: with the report's right-to-left composition convention, an arrow a : i -> j lies in
  e_j A e_i, so the arrow c_i : i-1 -> i lies in eps_i K_l eps_{i-1} (as the independent attempt also
  has, eps_i in e_{i-1} K_l e_i for an arrow i -> i-1).
- Why it breaks: with the seeded membership, c_i lies in eps_{i-1}K_l, not in eps_iK_l. The following
  claims then fail as written: "the right projective eps_iK_l has basis eps_i, c_i", "its radical is the
  simple at i-1", the differential of R_W ("left multiplication by c_{l+n+1}" would go from
  eps_{l+n+1}K_l to eps_{l+n}K_l, the wrong direction), and the definition of O
  ("c_i : eps_{i-1}O -> eps_iO" would be reversed). The resolution R_W -> W and the identification (7.1a)
  are no longer correct as stated.
- Severity: moderate. The construction in the proof of 7.1 is inconsistent as written (the stated
  resolution is not a complex of the stated shape); 7.1 itself remains true and the proof is repaired by
  restoring the convention. Does not invalidate 7.2 once repaired.

## 2. V-A-frozen.md, line 285 (Section 4.2, statement, formula (4.2c))

- Original: ` \leq d_L+(t-1)(d_R+1).                                        \tag{4.2c}`
- Modified: ` \leq d_L+(t-1)d_R.                                             \tag{4.2c}`
- Type: constant (wrong constant in a formula later used in (7.2h)). [Statement-level edit 1 of 2.]
- Correct statement: pd_A N = max_{0<=r<t}{pd_Delta(Phi^r N)+r} <= d_L+(t-1)(d_R+1), because
  pd_Delta Phi^r N <= d_L + r d_R and the formula (4.2) adds r.
- Why it breaks: the seeded bound forgets the "+r" in (4.2). Counterexample: Delta = k x k (d_L=d_R=0),
  X = one arrow 1 -> 2, A = k(1 -> 2), N = S_1: Phi N = S_2, Phi^2 N = 0, t = 2, pd_A N = 1 > 0 = seeded
  bound. The sentence "Formula (4.2) is then a finite maximum and yields (4.2c)" becomes false.
  (7.2h) still reads (l+2)+(2m-1)(l+3), which is the correct consequence of the true (4.2c) but no longer
  matches the seeded (4.2c) (which would give (l+2)+(2m-1)(l+2)).
- Severity: low to moderate. Invalidates the displayed upper bound (4.2c) of Result 4.2; (4.2), (4.2a),
  (4.2b) and the main theorem 7.2 (lower bound 2m-2 and finiteness) are unaffected; (7.2h) remains true.

## 3. V-B-frozen.md, line 651 (Section 6.5, definition (6.5.1) of the map partial_2)

- Original: `          \bigl((cb\otimes v)_a+(c\otimes f_a v)_b\bigr),\\`
- Modified: `          \bigl((cb\otimes v)_a-(c\otimes f_a v)_b\bigr),\\`
- Type: sign (a sign error that matters).
- Correct statement: partial_2(c (x) v)_rho = sum rho_{ba}((cb (x) v)_a + (c (x) f_a v)_b).
- Why it breaks: with the minus sign, partial_1 partial_2(c (x) v)_rho
  = sum rho_{ba}((cba (x) v)_0 - 2(cb (x) f_a v)_1 + (c (x) f_b f_a v)_2)
  = -2 sum rho_{ba}(cb (x) f_a v)_1 + (c (x) f_rho v)_2.
  The middle terms no longer cancel, and the column-two term has the wrong sign, so
  d_0 eta + partial_1 partial_2 + eta d_2 = 2(c (x) f_rho v)_2 - 2 sum(...)_1, which is non-zero in every
  characteristic other than two. The displayed computation of partial_1 partial_2 (lines 665-669) and
  (6.5.2) are then wrong, and d_P^2 = 0 fails ("in every characteristic" is false). The main construction
  is over C, so this matters.
- Severity: high. P is not a complex in characteristic not 2, so Result 6.5 as written fails, and with it
  6.6 (realisation), 5.3, and the realisation input of the main theorem (D-A 7.2) over C. Repaired by
  restoring the plus sign.

## 4. V-B-frozen.md, line 963 (Section 5.3, proof, "Matrix description")

- Original: `right free column module is left multiplication by a matrix with`
- Modified: `right free column module is right multiplication by a matrix with`
- Type: convention (left/right; op).
- Correct statement: an endomorphism of the right module R^n (columns) is left multiplication by a
  matrix in M_n(R); composition is matrix multiplication in the stated order, so
  End_{R^op}(R^n) = M_n(R) and End(eps R^n) = eps M_n(R) eps.
- Why it breaks: right multiplication by a matrix is not right R-linear unless the entries are central
  (and does not even act on columns); if one insisted on it, composition would reverse the order and the
  endomorphism ring would be M_n(R)^op, so "composition is usual matrix multiplication in its stated
  order" and End_{R^op}(eps R^n) = eps M_n(R) eps would no longer follow; the transferred left action
  rho : R -> eps M_n(R) eps would be an anti-homomorphism.
- Severity: moderate. The identification step of the matrix description in 5.3 is unjustified/false as
  written; the result 5.3 is true and the proof is repaired by restoring "left". No effect on 6.1-6.6 or
  on the main theorem (which uses the n = 1 case).

## 5. V-D-frozen.md, line 92 (Section 1, statement of Result 8.1)

- Original: `**Result 8.1 (statement).** Suppose that \(\delta^0\) is surjective with`
- Modified: `**Result 8.1 (statement).** Suppose that \(\delta^0\) has`
  (line 93, `non-zero kernel, and that ...`, is unchanged; the sentence now reads "Suppose that delta^0 has
  non-zero kernel, and that delta^a is bijective for every integer a>0.")
- Type: dropped hypothesis. [Statement-level edit 2 of 2.]
- Correct statement: delta^0 is surjective with non-zero kernel, and delta^a is bijective for a > 0.
- Why it breaks: by (5.6) with a = 1 (valid without hypotheses), and injectivity of delta^1,
  Ext^1_Lambda(Z,Z) = coker delta^0. Without surjectivity of delta^0 this need not vanish, so the
  conclusion Ext^a_Lambda(Z,Z) = 0 for a > 0 fails in degree 1 in general. The proof step "For a=1, the
  left outer term in (5.6) vanishes by surjectivity of delta^0" (line 567) now uses a hypothesis that is
  not assumed. (The table in Section 6 still lists "delta^0 surjective", far from the statement.)
- Severity: high for Result 8.1 as stated (the stated theorem is false/unproved: Ext^1(Z,Z) = 0 is not
  justified). The application in D-E 8.6 is unaffected because 8.6 proves surjectivity of delta^0
  separately.

## 6. V-E-frozen.md, line 441 (Section 8.4.2, quotation of Linckelmann's Tate duality (2.1))

- Original: `\widehat{\operatorname{Ext}}^{n-1}_E(V,U)`
- Modified: `\widehat{\operatorname{Ext}}^{n}_E(V,U)`
  (the displayed formula now reads Ext^n_E(V,U) = D Ext^{-n}_E(U,V)).
- Type: misquoted citation.
- Correct statement: Linckelmann, arXiv:1211.5999v1, (2.1): Ext^{n-1}(V,U) = D Ext^{-n}(U,V), i.e.
  D H^a(X,Y) = H^{-1-a}(Y,X) (as in the report conventions).
- Why it breaks: the next step "Applying (2.1) with U=V=S and n=-a proves (2)" would, with the seeded
  formula, give H^{-a} = D H^a, i.e. H^{-3m} = DP_m, not H^{-3m-1} = DP_m as stated in (2). The derivation
  of (2) from the cited result is invalid; the later identification D Hom(S,N) = Hom(N,S[-1]) (line 455)
  also no longer matches the quoted formula. The symmetric-algebra shift by -1 is lost.
- Severity: moderate. The proof of (2) (all Tate degrees of E) is broken as written; (2) itself is true
  with the correct citation, so the downstream profile (9)-(10), 8.6 and Theorem AR survive after repair.

## 7. V-E-frozen.md, line 1041 (Section 8.6, Finite representatives)

- Original: `Take the actual bimodule \(\mathcal Y=\Sigma_R^4 C_1\), which`
- Modified: `Take the actual bimodule \(\mathcal Y=\Sigma_R^3 C_1\), which`
- Type: degree (off-by-one in a shift).
- Correct statement: C = C_1[1], so C[3] = C_1[4] is represented by Sigma_R^4 C_1 (consistent with 8.5.3:
  coker(K^{-2} -> K^{-1})[4] represents C[3]).
- Why it breaks: Sigma_R^3 C_1 represents C_1[3] = C[2], not C[3]. The lifts g~_i : E_lambda -> C[3]
  then have no representatives g_i : E_lambda -> Y of the stated classes, the evaluated triangle (8.6.2)
  would end in CS[2], and the long exact sequence (8.6.3) would involve W^{a+1}, W^{a+2} instead of
  W^{a+2}, W^{a+3}; the computation of V^0 (diagonal line) and of V^a for a > 0 no longer follows as
  written. With the seeded shift one would get V^0 = (H^0)^2 (so ker delta^0 = 0, contradicting the
  required non-zero kernel) and V^2 containing W^3 = k although H^2 = 0 (so delta^2 not surjective).
- Severity: moderate to high. The fibre construction of 8.6 (and hence the comparison maps delta^a and
  the hypotheses fed into Result 8.1 for Theorem AR) is unjustified as written; repaired by restoring
  the fourth cosyzygy.

## 8. V-E-frozen.md, lines 1096-1097 (Section 8.6, the groups V^a, degree a = 1)

- Original (line 1096 of the pristine file):
  `\((H^0)^2\to W^3\) is surjective, so its connecting map is zero;`
- Modified (lines 1096-1097):
  `\((H^0)^2\to W^3\) is surjective, since its source has the larger`
  `dimension, so its connecting map is zero;`
- Type: dimension inference (invalid inference from dimensions).
- Correct statement: the map (H^0)^2 -> W^3 is (c,d) |-> (c+d)w, surjective because w != 0, i.e.
  because the evaluated lifts are non-zero (8.5.3) and have been normalised to the same w.
- Why it breaks: dim 2 > dim 1 does not imply surjectivity (the zero map is a counterexample). The
  stated reason hides the real input, the non-vanishing of the evaluations of the lifts g_i: if they
  evaluated to zero, the map would be zero, the connecting map W^3 -> V^1 would be injective, V^1 = W^3
  = k while (H^1)^2 = 0, and delta^1 would not be surjective (so Ext^2_Lambda(Z,Z) would not vanish).
- Severity: low to moderate. The step a = 1 of (8.6.4) is unjustified as written; the conclusion is true
  (by the explicit formula two lines above), so 8.6 and Theorem AR survive after repair.


## Diff confirmation

Pristine copies verified against orig.sha256 (all OK). The diffs below contain exactly entries 1-8 and
nothing else (V-C1 unchanged). Note: entry 8 adds one line, so V-E lines after 1096 are shifted by one.

```
=== diff orig/V-A-frozen.md scratch/V-A-frozen.md
285c285
<  \leq d_L+(t-1)(d_R+1).                                        \tag{4.2c}
---
>  \leq d_L+(t-1)d_R.                                             \tag{4.2c}
494c494
<  \qquad c_i\in\varepsilon_iK_l\varepsilon_{i-1},
---
>  \qquad c_i\in\varepsilon_{i-1}K_l\varepsilon_i,
=== diff orig/V-B-frozen.md scratch/V-B-frozen.md
651c651
<           \bigl((cb\otimes v)_a+(c\otimes f_a v)_b\bigr),\\
---
>           \bigl((cb\otimes v)_a-(c\otimes f_a v)_b\bigr),\\
963c963
< right free column module is left multiplication by a matrix with
---
> right free column module is right multiplication by a matrix with
=== diff orig/V-C1-frozen.md scratch/V-C1-frozen.md
=== diff orig/V-D-frozen.md scratch/V-D-frozen.md
92c92
< **Result 8.1 (statement).** Suppose that \(\delta^0\) is surjective with
---
> **Result 8.1 (statement).** Suppose that \(\delta^0\) has
=== diff orig/V-E-frozen.md scratch/V-E-frozen.md
441c441
< \widehat{\operatorname{Ext}}^{n-1}_E(V,U)
---
> \widehat{\operatorname{Ext}}^{n}_E(V,U)
1041c1041
< Take the actual bimodule \(\mathcal Y=\Sigma_R^4 C_1\), which
---
> Take the actual bimodule \(\mathcal Y=\Sigma_R^3 C_1\), which
1096c1096,1097
< \((H^0)^2\to W^3\) is surjective, so its connecting map is zero;
---
> \((H^0)^2\to W^3\) is surjective, since its source has the larger
> dimension, so its connecting map is zero;
```
