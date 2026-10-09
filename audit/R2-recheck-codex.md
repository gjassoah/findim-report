Model: GPT-6 (Codex; variant unknown); effort: unknown.

# R2-recheck

Scope: all 16 hunks in scratch/R2-report-math-diff.patch, checked against the current source, report/main.tex and audit/report-notation.md. Mathematical deductions below have status **AI-proved**, relative to the identified inputs. “No error found” is a bounded review verdict, not certification of the report. The forbidden reviews, round-2 notes, logs and Codex outputs were not opened. Only this file was modified.

## Verdict per hunk

Locations are current source lines in report/sections/.

| Hunk | Location | Verdict | Reason |
|---|---|---|---|
| Introduction: disclosure | 01-introduction.tex:17–18 | no error found | The parenthetical explicitly limits verification status; it adds no mathematical assertion or human certification. This recheck does not certify the report-wide assertion that all proofs are written out in full. |
| Proposition 3.5: “Moreover” | 03-criteria.tex:107 | no error found | The transpose–Ext identification follows from the initial projective-dimension-one hypothesis, independently of the three equivalent conditions. |
| Proposition 3.11: integer \(d\), \(\operatorname{Rep}_d(A)\) | 03-criteria.tex:309–310 | no error found | Total dimension fixes the sizes of the free-resolution tensor terms, as required by the rank argument. This representation variety exists for a general finite-dimensional algebra. |
| Stacks tag | 06-realisation.tex:59 | no error found | [Tag 04VL, Lemma 4.27.19](https://stacks.math.columbia.edu/tag/04VL) is precisely the canonical isomorphism between left and right fraction categories for a multiplicative system. |
| Section 6.3: quotient-image convention | 06-realisation.tex:228–230 | no error found | The convention distinguishes ambient categories without asserting that the quotient functor is faithful. |
| Paragraph after Proposition 6.7: unital action | 06-realisation.tex:471–473 | no error found | The action is unital on the idempotent summand, remains unital on its direct sum with its shift, and remains so after transport to \(V\). |
| Remark 6.14: remove \(a\le0\le b\) | 06-realisation.tex:600–601 | no error found | The terms of \(P=L_0\oplus L_1[1]\oplus L_2[2]\) are supported in \([a-2,b]\) for any integers \(a\le b\). |
| Corollary 7.4: square-zero ideal | 07-simulation.tex:173–174 | no error found | A square-zero ideal annihilates every simple module, and \(A/X=\Delta\). |
| Lemma 8.2: induced maps and functoriality | 08-conversion.tex:55–57 | no error found | Apply \(C^0\) to the shifted chain maps specified in the proof. Exactness supplies the identifications with cokernels; additive functors preserve chain homotopies. |
| Proposition 9.10: tensor-factor sign | 09-ar-counterexample.tex:374–375 | no error found | The interchange sign for two degree-three maps is \((-1)^9\), which is \(1\) in characteristic two. |
| Proposition 9.11: left multiplication | 09-ar-counterexample.tex:391–395 | no error found | The pairing makes negative left multiplication the transpose of positive right multiplication; the positive polynomial algebra is commutative, so this is also the stated positive left multiplication. |
| Proposition 9.14: \(w^*=f\) | 09-ar-counterexample.tex:640–641 | no error found | Only the basis element \(f\) acts nontrivially on the simple module at \(f\); its trace-dual partner is \(f^*\), scaled by \(\lambda\). |
| Proposition 9.16: added reference | 09-ar-counterexample.tex:732 | no error found | Proposition 9.10 identifies the monomial basis on both factors, so Lemma 9.9 gives the scalar \(H_i^{-m}\) on all of \(H^{3m}\). |
| Proposition 10.2: remove “if defined” | 10-obstructions.tex:73 | no error found | The quotient module and its complete resolution exist for every stable \(v\); the hypotheses on \(\delta\) are needed for self-extension vanishing, not for their construction. |
| Corollary 10.3: scope of the obstruction | 10-obstructions.tex:97–100 | no error found | “As in Proposition 10.2” retains the hypotheses on \(F\) and the triangle, including that the \(w_i\) are not both zero. Its proof supplies the missing vanishing for every such triangle. |
| Corollary 10.5: definedness | 10-obstructions.tex:164–171 | no error found | Both required consecutive composites vanish; the bracket has degree \(p-3\). The case \(p=3\) satisfies every hypothesis of Theorem 10.4, including nonprojectivity. |

## Corollary 10.5: composites, degree, and the case \(p=3\)

Write \(H^a=\underline{\operatorname{Hom}}_A(s,s[a])\). For classes \(x,y\) of degrees \(u,v\), respectively, composition in the report's convention gives \(xy=x[v]\circ y\). Represent the bracket by the following sequence of ordinary morphisms in the stable category:
\[
s\xrightarrow{\beta}s[-1]
 \xrightarrow{\beta[-1]}s[-2]
 \xrightarrow{\tau[-2]}s[p-2].
\]
In Section 2's notation, \(f=\beta\), \(g=\beta[-1]\) and \(h=\tau[-2]\). The required composites, in the required order, are
\[
gf=\beta[-1]\circ\beta=\beta^2\in H^{-2},\qquad
hg=\tau[-2]\circ\beta[-1]=(\tau\beta)[-1].
\]
The second lies in \(\operatorname{Hom}(s[-1],s[p-2])\cong H^{p-1}\). It is the product with \(\tau\) on the left; no vanishing of \(\beta\tau\) is needed.

Tate duality with \(a=1\) gives
\[
H^{-2}\cong DH^1=D\operatorname{Ext}^1_A(s,s)=0.
\]
Also \(H^{p-1}=\operatorname{Ext}^{p-1}_A(s,s)=0\), since \(0<p-1<p\) and the polynomial Ext algebra has no positive degrees below \(p\). Both defining-system conditions of Section 2 are therefore satisfied.

The target is
\[
\operatorname{Hom}(s[1],s[p-2])\cong H^{p-3},
\]
in agreement with the degree formula \(p+(-1)+(-1)-1=p-3\). For \(p>3\), this is positive and less than \(p\), so the target vanishes. Definedness makes the bracket nonempty, hence exactly \(\{0\}\). This also checks the boundary case \(p=4\). A sign choice cannot affect either vanishing.

For \(p=3\), the polynomial generator gives nonzero positive Ext, so \(s\) is nonprojective. The hypotheses yield \(\operatorname{Ext}^1=\operatorname{Ext}^2=\operatorname{Ext}^4=0\), exactly as required by Theorem 10.4, together with symmetry and \(\operatorname{End}_A(s)=k\). Its argument also checks definedness: \(\tau\beta\in H^2=0\) and \(\beta^2\in H^{-2}=0\). The target is \(H^0\), and the indeterminacy is
\[
\tau H^{-3}+H^1\beta=0.
\]
For nonzero \(\tau\), the nondegenerate composition pairing gives \(\gamma\in H^{-4}\) with \(\gamma\tau=\beta\), since \(H^{-1}\cong DH^0\cong k\). The bracket \(\langle\tau,\beta,\gamma\rangle\) is defined: \(\tau\beta=0\) as above and \(\beta\gamma\in H^{-5}=0\), the latter by duality with \(\operatorname{Ext}^4\). Its target is \(H^{-3}=0\). The precomposition inclusion of the juggling lemma supplies zero in \(\langle\tau,\beta,\gamma\tau\rangle\); its zero indeterminacy gives the singleton. For \(\tau=0\), a defining system with \(b=0\) supplies zero directly. Thus the cited theorem covers definedness as well as the conclusion.

## Checks behind the other potentially substantive changes

**Proposition 3.5.** From the minimal resolution \(0\to Q_0\to Q_1\to C\to0\), dualising gives
\[
\operatorname{Tr}C=\operatorname{coker}(Q_1^*\to Q_0^*)
 \cong\operatorname{Ext}^1_A(C,A).
\]
No condition in the equivalence is used. The new “Moreover” does not overstate the hypotheses needed for the identity.

**Proposition 3.11.** For representations on \(k^d\), a basis of \(A\) gives finitely many matrix variables with polynomial unit and multiplication relations. If \(Q_j=A^{r_j}\), then \(Q_j\otimes_A M\) has dimension \(r_jd\), independently of the representation. Exactness at the middle term is the condition
\[
\operatorname{rank}(d_{n+2})+\operatorname{rank}(d_{n+1})
 =r_{n+1}d.
\]
The sum cannot exceed this value, so its attaining that value is open. For finite-dimensional \(A\)-modules, the Tor criterion follows by using a minimal projective resolution: tensoring with \(A/J\) kills its differentials, and a nonzero finitely generated projective term has nonzero top. The resulting increasing open loci stabilize by noetherianity. The union of the finite-projective-dimension loci therefore has a bound. This argument concerns the \(A\)-modules over the stated field, as in the report; integer total dimension is sufficient. Empty representation loci and the zero module at \(d=0\) cause no problem. To deduce the final sentence, take the maximum of the bounds for the finitely many dimensions up to any fixed dimension bound.

**Unitality and support in Section 6.** The identity of \(U=(E_0^{\oplus n},\theta_n(\varepsilon))\) is \(\theta_n(\varepsilon)=\theta_n(\rho(1))\). The direct-sum action and conjugation by \(V\cong U\oplus U[3]\) preserve the identity and multiplication. The fully faithful inclusion into the idempotent completion identifies the resulting endomorphisms with those of \(V\) in \(\mathcal Q\). In rectification, each \(L_j\) is a sum of tensors of vector spaces in degree zero with the given complexes. The three supports are \([a,b]\), \([a-1,b-1]\) and \([a-2,b-2]\); no extra degree-zero summand is adjoined. Thus no condition placing zero between \(a\) and \(b\) is used.

**Lemma 8.2.** The formula \(f\mapsto C^0(f)\) is applied to degree-zero chain maps \(\mathbb P[-a]\to\mathbb W\) and \(\mathbb P\to\mathbb W[a]\), exactly as specified in the proof's final paragraph. It is not an assertion about taking an unshifted cokernel of a degree-\(a\) map. Cokernels preserve composition of chain maps. For an exact additive functor \(G\), the natural identification \(G(C^n(\mathbb P))\cong C^n(G\mathbb P)\) makes the comparison commute. Additivity preserves null-homotopies, and the assumed preservation of the kinds of complexes supplies projective terms on the target side. Even if \(G\) is not assumed to preserve every projective object, on these cokernel modules a stable-zero map is represented by a null-homotopic chain map, whose image is again null-homotopic. The restricted functoriality claimed is therefore sufficient and meaningful.

**Proposition 9.11 and its use in Proposition 9.13.** Let \(\eta\in H^{-3m-1}\) and \(r\in P_{m-1}\). The composition compatibility stated after Tate duality gives
\[
\langle r,\tau_i\eta\rangle=\langle r\tau_i,\eta\rangle
 =\langle\tau_i r,\eta\rangle.
\]
Only commutativity of the positive polynomial algebra is used in the last equality; commutativity with negative Tate classes is not assumed. This is precisely the claimed transpose identity. In the first cone sequence, postcomposition with the shifted \(\tau_1\) sends \(x\) to \(\tau_1x\), so the long exact sequence uses left multiplication. The action of \(\tau_2\) on the second tensor factor commutes with the first cone maps in characteristic two and induces the same left action on their kernels and cokernels. On dual monomial bases, \(\tau_i\) lowers the \(i\)-th exponent, annihilating exactly the dual of \(\tau_{3-i}^m\); at \(m=0\) it lands in \(H^2=0\). This matches both the proof and the subsequent cone calculation.

**Proposition 9.14.** In \(\xi_\lambda\otimes_Ts=\sum_w h_\lambda(w)\otimes_I(w^*\cdot s)\), radical basis elements act by zero, and the idempotent \(e\) acts by zero. The only surviving \(w^*\) is \(f\), so \(w=f^*\) and \(h_\lambda(w)=\lambda f^*\). Tensoring the two surviving terms gives the stated \(\lambda^2\), not \(\lambda\) or its inverse.

**Proposition 9.16.** By Proposition 9.10, the basis in degree \(3m\) consists of \(\tau_1^r\tau_2^{m-r}\). Lemma 9.9 scales these two factors by \(H_i^{-r}\) and \(H_i^{-(m-r)}\). Their product is \(H_i^{-m}\), independent of \(r\). Thus the added reference is the correct bridge from the single-factor twist to the scalar matrix on the tensor square. The determinant is \(H_1^{-m}+H_2^{-m}\ne0\) for \(m>0\), since \(H_1,H_2\) are independent variables.

**Proposition 10.2 and Corollary 10.3.** For any stable \(v:s\to Fs\), choose a representative \(v_0\) and an embedding \(i:s\to Q\) into a finite projective module. Symmetry supplies \(Q\). The graph quotient \((Fs\oplus Q)/\{(v_0(x),i(x))\}\), with its structure map from \(Fs\), always defines the module \(Z\). The complete-resolution construction and the exact sequence in Section 8 precede any use of the hypotheses on \(\delta\); in particular,
\[
0\to\operatorname{coker}\delta^0
 \to\operatorname{Ext}^1_\Lambda(Z,Z)\to\ker\delta^1\to0
\]
still applies.

For the triangle in Proposition 10.2, the first map in the displayed exact sequence is zero under its vanishing hypothesis, and the last has rank one. Thus \(\dim V^0=2\), whereas \(\delta^0(c,d)=(c-d)v\) has rank at most one, including when \(v=0\). Its nonzero cokernel embeds into self-Ext.

Corollary 10.3 supplies that vanishing for every \(w\in U^1\): choose \(\gamma\in H^{-4}\) with \(\gamma[3]\tau=\beta_0\), and use
\[
w[-1]\beta_0=(w[-4]\gamma)[3]\tau=0,
\qquad w[-4]\gamma\in U^{-3}=0.
\]
Consequently every \(F\) and triangle satisfying Proposition 10.2, and every stable \(v\) used in the formula, give nonzero self-Ext. The revised wording has exactly this scope; it does not assert an obstruction for bimodules without the specified triangle.

## Coverage and source state

All 16 hunks are covered; no errors or wording problems were found within this scope. The task's description of Corollary 10.5 as the “only change to a proof” is not literally exhaustive: several other hunks occur inside proofs, as its own item 2 also recognises. Those hunks were checked as well.

The changed Stacks locator was checked in the primary source on 2026-10-09. A short source quotation is: “The category of left fractions and the category of right fractions \(S^{-1}\mathcal C\) are canonically isomorphic.” The other checks use the report's supplied definitions, constructions and internal results; this was not a new audit of every external reference or every unchanged proof. No compilation or computational experiment was needed for these local symbolic checks.

SHA-256 of the input diff: 2f2b95e7b0e8e8af36a7ed94b41c639d9455fb48812bafbf7beb53463b5bd53e.

| Input | SHA-256 |
|---|---|
| report/main.tex | a556692c279a3abc001b104bdae6702085b7e5a24968f256c0d67f7977331668 |
| audit/report-notation.md | f69ee451cfbff429f46196434626154173f6ed52cc4657c8c8976e20fd6db8d5 |
| 01-introduction.tex | cb200cbf62143745eea36066d16fac5963bff38df11606fe5532dd11657dc48f |
| 02-preliminaries.tex | 546a4bc558bd98ff6d30d60783c3b114fc4c072859aaec786b0ce9b1a70b542a |
| 03-criteria.tex | aa7797ae38a253420cb07c62509c4a3aece0f7efee1a79cc0319e0ef5c1cce11 |
| 06-realisation.tex | a109168d8334daf173bf31194bf5465d21e2d4a74a1a98d519c613692231f185 |
| 07-simulation.tex | e82b296fe6ca6adc4227a52dd798d5c418c6f1380e85b1145d54b92f946af742 |
| 08-conversion.tex | 91daa8bfe5a2220f3b137d66e29b4059f60321c47426b522de907306daa011c7 |
| 09-ar-counterexample.tex | 6698e2f22643c8d3266cea6b723da77206c7e3245b72affb1f09296990d4826d |
| 10-obstructions.tex | dba31c60b67de508e4853f8641967d2231d0dc5ed707243514a3503c0c2ec23e |
