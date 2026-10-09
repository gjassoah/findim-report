Model: GPT-6 (Codex); effort: unknown.

# CAL-V-D: adversarial verification of Result 8.1

Date: 2026-10-09. Completed; the report was written incrementally.

Scope: `scratch/V-D-frozen.md`, with binding conventions in
`audit/report-notation.md`. No earlier audit, proof notes, ledger, log,
escalation, or Codex output was consulted. The frozen input itself retains
earlier confidence and review claims in §§0, 7–8; these are not evidence here.
Three same-configuration read-only subchecks assisted this review; their
conclusions were leads and were rechecked by the reporting verifier. Exact
model variant and effort were not exposed. This is an AI review,
not human certification or formal verification.

Input SHA-256:

- Frozen dossier: `45c120b5684400c2961945468e60d865a4beb558baa3e14e4ea48dd9ee183b7b`.
- Conventions: `f69ee451cfbff429f46196434626154173f6ed52cc4657c8c8976e20fd6db8d5`.

Repository setup: `PROGRESS.md` and `docs/WORKING_RULES.md` are absent in this
checkout. The available global instructions, `AGENTS.md`, `README.md`, and
`codex/tasks/CAL-V-D.md` were read; this task supplies the complete restricted
verification scope. Only this output file is modified.

## Finding F1: a missing degree-zero hypothesis

**Verdict: error found; Result 8.1 as stated has a counterexample.**
Status of the diagnosis and the counterexample below: AI-proved. The initial
missing-premise finding has now been strengthened by an explicit example.

The hypotheses at frozen lines 92–96 require a non-zero kernel of
\(\delta^0\) and bijectivity of \(\delta^a\) for \(a>0\). They do not
require \(\delta^0\) to be surjective. The degree-one argument at lines
567–568 nevertheless invokes that surjectivity. In fact (5.6), together
with injectivity of \(\delta^1\), gives
\[
 \operatorname{Ext}^1_\Lambda(Z,Z)\simeq
 \operatorname{coker}\delta^0.
\]
Thus that calculation leaves exactly this obstruction. No implication
from the stated assumptions to its vanishing has been supplied.

Proposed minimal repair: at lines 92–94 say that \(\delta^0\) is
surjective with non-zero kernel, retaining positive-degree bijectivity.
Alternatively retain the hypotheses and conclude self-extension vanishing
only for \(a\geq2\), together with the displayed degree-one formula.
The finite, Gorenstein-projective and non-projective conclusions and
vanishing against \(\Lambda\) do not use the missing surjectivity.

This is also a statement/proof wording mismatch: the hypothesis table in
§6 lists an assumption absent from Result 8.1. The other stated assumptions
do not force surjectivity, as the following example demonstrates.

### Explicit counterexample (AI-proved)

Take \(k=\mathbb Q\), \(E=k[\varepsilon]/(\varepsilon^2)\), and the
automorphism \(\sigma(\varepsilon)=2\varepsilon\). Write
\(B={}_EE_\sigma\), meaning that the left action is regular and
\(b\cdot e=b\sigma(e)\) on the right, and put
\[
 F=E\oplus B,\qquad S=E/(\varepsilon),\qquad
 v_0:S\longrightarrow F\otimes_E S\simeq S^2,
 \quad s\longmapsto(s,s).
\]
The coefficient-of-\(\varepsilon\) functional is a symmetrising trace on
\(E\): its pairing in the basis \(1,\varepsilon\) has matrix
\(\begin{pmatrix}0&1\\1&0\end{pmatrix}\). Both summands of \(F\) are
free of rank one on each side; the right-module isomorphism
\(E\to B\) is \(e\mapsto\sigma(e)\). Thus every algebra, module,
finiteness, symmetry and separate-projectivity hypothesis is satisfied.

Use \(Q=E\), \(i(1)=\varepsilon\), and the complete cochain resolution
\(P^n=E\), \(d_P^n=\varepsilon\) for every \(n\in\mathbb Z\).
Its kernel and image at every term are \(\varepsilon E\), and its dual
has the same property. Under
\(B\otimes_E E\to E\), \(b\otimes e\mapsto b\sigma(e)\), the
twisted summand of \(T_FP\) has differential \(2\varepsilon\).
The lift of \(v_0\) is
\[
 f^n=(1,2^n):P^n\longrightarrow (T_FP)^n.
\]
Indeed, \(d_{T_FP}f^n=f^{n+1}d_P\), and \(f^0\) induces \(v_0\).

For completeness, let \(W_c\) have terms \(E\) and differential
\(c\varepsilon\), where \(c\in k^\times\). A degree-\(a\) cochain
\(P\to W_c\) is multiplication in component \(n\) by
\(x_n+y_n\varepsilon\). Its cocycle condition is
\(x_{n+1}=(-1)^a c x_n\). Every sequence \((y_n)\) is a boundary:
the scalar components \(b_n\) of a degree-\(a-1\) cochain need only
satisfy
\[
 c b_n+(-1)^a b_{n+1}=y_n.
\]
Choose \(b_0\) and solve forwards and backwards; both coefficients are
invertible. The full product Hom convention allows these sequences.
Consequently its degree-\(a\) cohomology has basis represented by
\(c^n(-1)^{an}\), for every integer \(a\).

Use \((-1)^{an}\) for the basis of \(H^a\mathcal H\) and the two
bases \((-1)^{an},\ 2^n(-1)^{an}\) for \(H^a\mathcal K\).
The two compositions in (5.1) are, componentwise,
\(T_F(g)^nf^n\) and \(f^{n+a}j^n\). Therefore (1.1) is represented by
\[
 \delta^a(g,j)=(g-j,\ g-2^a j),\qquad
 [\delta^a]=\begin{pmatrix}1&-1\\1&-2^a\end{pmatrix}.
\]
Its determinant is \(1-2^a\), which is non-zero for every integer
\(a>0\). At \(a=0\) its kernel and cokernel both have dimension one.
This verifies the positive-degree condition in all degrees, rather than
in a finite range. Equation (5.6) then gives
\(\operatorname{Ext}^1_\Lambda(Z,Z)\simeq k\).

Here \(\dim_k\Lambda=8\) and \(\dim_k Z=4\). The following direct
calculation also checks the non-zero Ext group without using (5.6).
The bottom component of \(Z\) has basis \(t_1,t_2,z\), with
\[
 \varepsilon t_1=\varepsilon t_2=0,\qquad
 \varepsilon z=-t_1-t_2,
\]
and its structure map sends the two basis vectors of \(F\otimes S\)
to \(t_1,t_2\). There is a projective surjection
\(A_0=L_1(E)\oplus L_2(E)\twoheadrightarrow Z\), whose top map is
reduction modulo \(\varepsilon\), and whose bottom map is
\((f_1,f_2,q)\mapsto[\overline f_1,\overline f_2,q]\).
Its kernel \(K\) has top \(\varepsilon E\simeq S\) and bottom basis
\[
 u_1=(\varepsilon,0,0),\quad
 u_2=(0,\varepsilon,0),\quad
 u_3=(1,1,\varepsilon),\qquad
 \varepsilon u_3=u_1+u_2.
\]
The kernel's structure map sends the basis of \(F\otimes S\) to
\(u_1,2u_2\); the factor 2 comes from the right action on \(B\).
A map \(K\to Z\) with top scalar \(a\) must satisfy
\[
 \beta u_1=a t_1,\quad \beta u_2=(a/2)t_2,\quad
 \beta u_3=x t_1+y t_2+c z.
\]
Linearity for \(\varepsilon u_3\) forces \(a=-c=a/2\), hence
\(a=c=0\). Thus \(\operatorname{Hom}_\Lambda(K,Z)\simeq k^2\),
with coordinates \((x,y)\). A map \(A_0\to Z\) is determined by a
top scalar \(b\) and the image \(r t_1+s t_2+d z\) of the generator
of the \(L_2(E)\) summand. Its restriction sends
\(u_3\) to \((b-d)(t_1+t_2)\), so the image of restriction is exactly
the diagonal line. Applying \(\operatorname{Hom}_\Lambda(-,Z)\) to
\(0\to K\to A_0\to Z\to0\) gives
\[
 \operatorname{Ext}^1_\Lambda(Z,Z)\simeq
 k^2/k(1,1)\simeq k\ne0.
\]
All these computations are exact hand calculations recorded here; no
script or other file was created.

## Statement-by-statement verdicts

Line numbers in this section refer to the frozen dossier. All mathematical
checks reported here have status **AI-proved**, meaning that the arguments
are supplied or checked in this AI review, not that a human has certified
them. The separate finite sign example below has status **supported**.
“No error found” records the outcome of this review, not a guarantee.

| Statement / location | Verdict | Check and consequence |
|---|---|---|
| §0, lines 17–58: preliminary cone outline | No error found | Cone, four Hom spaces and the proposed kernel/cokernel sequence agree with the calculations in §§3–5. The outline does not itself supply the missing surjectivity. Historical claims about how it was obtained were not audited. |
| §1, lines 62–90: tensor functor, Tate groups and (1.1) | No error found | Separate left/right projectivity has the correct roles. The shift identification is induced by exact tensoring on complete resolutions. Both terms have target \((T_FS)[a]\); the second is \(v[a]j\), not \(vj\). Replacing \(j\) by \(-j\) converts the alternate plus convention and preserves the non-zero-kernel and surjectivity conditions. |
| Result 8.1, lines 92–109 | **Error found** | F1: missing surjectivity of \(\delta^0\). The explicit example above satisfies every stated hypothesis and has \(\operatorname{Ext}^1(Z,Z)\ne0\). |
| (1.3), lines 111–128: full Hom, shifts and homotopies | No error found | Differential squares to zero. A degree-\(a\) cocycle is a chain map into \(W[a]\); a boundary \(\partial h\) is the chain-homotopy boundary with homotopy \((-1)^a h\). No finite-support assumption is introduced. |
| (1.4), lines 130–138: cokernel sequences | No error found | Exactness identifies \(C^n(P)\) with \(\operatorname{im}d_P^n\subseteq P^{n+1}\), and the following quotient is \(C^{n+1}(P)\). |
| Lines 140–150: total acyclicity and projective targets | No error found | For a target module concentrated in degree zero, each Hom degree has only one potentially non-zero component. Finite generation therefore permits the claimed direct-sum equality; this does not incorrectly interchange an infinite product with a direct sum. Summands then give arbitrary projective targets. |
| §2.1, lines 156–167: symmetry and projective embeddings | No error found | The inverse to evaluation at 1 uses \(\lambda(am)\), agreeing with the left action on \(DE\). Dualising a surjection of right modules gives a left-module embedding; symmetry supplies \(DE\simeq E\). |
| (2.1), lines 169–180: resolution with prescribed \(i,Q\) | No error found | A resolution by finite projectives on the negative side splices with the chosen injection into \(P^1=Q\). Each later cokernel admits a finite projective embedding. Injective projective targets make the resulting exact complex totally acyclic. |
| Lines 182–190: \(T_FP\) | No error found | \(F_E\) projective makes tensoring exact; \({}_EF\) projective makes its terms projective. Self-injectivity supplies total acyclicity. No \(E^e\)-projectivity is assumed. |
| §2.2, lines 208–216: extension property | No error found | Exactness of \(\operatorname{Hom}(P,L)\) yields \(bd_P^n=u\epsilon_n\), with the scalar sign absorbed into \(b\); surjectivity of \(\epsilon_n\) gives the extension across \(\jmath_n\). |
| Lines 218–231: lifting ordinary maps | No error found | Negative recursion uses projectivity of the source terms and exactness of \(W\). Positive recursion uses total acyclicity of \(P\) with projective targets \(W^{n+1}\). It lifts the actual map on cokernels, not only its stable class. |
| Lines 233–260: nullhomotopy versus projective factorisation | No error found | A nullhomotopy factors through \(P^1\) on cokernels. Conversely the initial projective factorisation is removed by one homotopy component; both residual recursions then satisfy the asserted vanishing identities. Every component is assigned without changing an earlier equation. |
| (2.2), lines 194–206 and 261–279: comparison in all degrees | No error found | Shifting \(P[-a]\) or \(W[a]\) gives exactly \(C^{-a}(P)\) and \(C^a(W)\). For \(a>0\), the ordinary Ext quotient is by maps extending to \(P^{-a+1}\); the extension property identifies these with all projective factorisations, including \(a=1\). Neither self-injectivity of \(R\) nor total acyclicity of \(W\) is used. |
| (2.3), lines 281–288: Ext against projectives | No error found | Positive degrees of the Hom complex of the resolution tail coincide with those of the complete resolution. The statement includes arbitrary projective targets by lines 140–146. |
| Lines 290–301: stable equivalence, shifts and functor compatibility | No error found | Identity lifts compose to maps inducing identity on cokernels, hence to homotopy identities by the preceding criterion. \([1]\) is cosyzygy, and \(T_F\) preserves the relevant complexes, cokernels, homotopies and shifts. Composition on cokernels agrees with (1.1). |
| §3, lines 305–325: lower-triangular left modules | No error found | Multiplication is \((aa',fa'+bf',bb')\), and balancing and left linearity give the asserted action. The morphism equation is \(\beta\eta=\eta'T_F(\alpha)\). No opposite algebra is missing. Exactness is componentwise. |
| (3.2)–(3.3), lines 327–346: columns and projectives | No error found | \(L_1,L_2\) are left adjoints to the respective evaluations. \(L_1(E)=\Lambda e_1\) and \(L_2(E)=\Lambda e_2\) are left columns. Tensor exactness is needed for \(L_1\) exactness, not for its preservation of projectives. |
| Lines 348–363: projective-triple criterion | No error found | A summand of \(\Lambda^r\) has injective structure map, projective top and projective structure-map cokernel. Conversely splitting the cokernel sequence identifies the triple with \(L_1(M)\oplus L_2(\operatorname{coker}\eta)\). |
| (3.4), lines 365–379: four Hom blocks | No error found | The vanishing direction is \(L_1\to L_2\). The other off-diagonal space is \(\operatorname{Hom}_E(M,T_FN)\), with postcomposition by \(T_F(g)\) and precomposition by \(j\). |
| (4.1), lines 383–402: total acyclicity of columns | No error found | Hom into \(\Lambda\) gives precisely the displayed summands. \({}_EF\) projective makes \(\operatorname{Hom}_E(P,F)\) exact. No self-injectivity of \(\Lambda\) is needed. |
| (4.2)–(4.3), lines 404–429: cone | No error found | The chain-map equation kills the upper-right entry of \(d^2\). The quotient is \(G_1[1]\), with its negative differential. Dualising the termwise split sequence preserves exactness and gives total acyclicity. |
| (4.4)–(4.5), lines 431–454: literal cokernel | No error found | Quotienting first by \(T_Fd^{-1}\) leaves relations \((v_0(s),-i(s))\). The map \((t,q)\mapsto(t,-q)\) gives the specified plus-sign quotient and fixes the structure map. The argument accommodates every allowed representative and embedding. |
| (4.6)–(4.7), lines 456–475: finiteness, dimensions and GP conclusion | No error found | Injectivity of \(i\) gives injectivity of \(\iota\), the exact sequence and all three dimensions. Total acyclicity gives Gorenstein-projectivity and positive Ext vanishing against \(\Lambda\), independently of F1. |
| (5.1)–(5.2), lines 480–500: difference map | No error found | The degree-zero cocycle \(f\) gives \(\partial\boldsymbol\delta=\boldsymbol\delta\partial\). Its cohomology map is the stated \(\delta^a\) in positive, zero and negative degrees. |
| (5.3)–(5.4), lines 502–535: signed block differential | No error found | \(h\) has degree \(n-1\). Matrix multiplication gives off-diagonal block \((-1)^n(\partial h-\boldsymbol\delta)\); dividing by the coordinate sign in degree \(n+1\) gives \(\boldsymbol\delta-\partial h\). Both diagonal signs also agree. |
| (5.5)–(5.6), lines 537–557: exact sequence and connecting map | No error found | The kernel differential is \(-\partial\), so it is \(\mathcal K[-1]\). Lifting \((g,j)\) by \((g,j,0)\) gives connecting map \(+\delta^a\); its cokernel occurs in degree \(a-1\) and its kernel in degree \(a\). |
| (5.7), lines 558–565 | No error found | The comparison applies to the totally acyclic \(P_Z\). Positive cohomology is ordinary Ext, and degree zero is stable End, not ordinary End. |
| Lines 567–570: all positive self-extensions vanish | **Error found** | At \(a=1\), surjectivity of \(\delta^0\) is invoked without a hypothesis. At \(a\geq2\) the argument is valid. F1 supplies the repair and counterexample. |
| Lines 572–577: degree-one obstruction | No error found | Under injectivity of \(\delta^1\), (5.6) identifies \(\operatorname{Ext}^1(Z,Z)\) with \(\operatorname{coker}\delta^0\). This paragraph exposes the missing assumption. Prior computations mentioned there were not consulted. |
| §6, lines 581–592: non-projectivity, both arguments | No error found | The non-zero kernel forces \(S\) non-projective, hence the top of \(Z\) is non-projective. Alternatively stable End of \(Z\) surjects onto this kernel. Neither uses \(\delta^{-1}\). The sentence claiming completion of Result 8.1 is affected by F1. |
| Lines 594–613: hypothesis accounting and weakening of symmetry | No error found in the individual uses; **error found** in their agreement with the statement | The listed uses are accurate, including the fact that characteristic two is unnecessary for the signed argument. Enough finite projective embeddings and injectivity of finite projectives suffice in place of symmetry. The surjectivity row, however, records an unstated assumption. |
| §8, lines 654–664: completeness and all-positive-degree claims | **Error found** | These claims do not hold for the frozen Result 8.1. The counterexample and the unlicensed use at lines 567–568 contradict them. The degree-zero stable-End description remains consistent. |

### Checks of the delicate recursions and signs

For the negative nullhomotopy recursion, assuming the equation at \(n+1\),
\[
 d_W^n(f^n-h^{n+1}d_P^n)
 =f^{n+1}d_P^n-(f^{n+1}-h^{n+2}d_P^{n+1})d_P^n=0.
\]
For the positive recursion, assuming the equation at \(n-1\),
\[
 (f^n-d_W^{n-1}h^n)d_P^{n-1}
 =d_W^{n-1}(f^{n-1}-h^nd_P^{n-1})=0.
\]
Thus only exactness and the specified projectivity/extension property are
used. No hidden boundedness condition is needed.

Writing \(s=(-1)^n\), the upper-right block of the endomorphism
differential in (5.3) is
\[
 s d_{G_0}h+sV(L_2j)-s(L_1g)V+h d_{G_1}
 =s(\partial h-\boldsymbol\delta(g,j)).
\]
Here the composition \((L_1g)V\) has bottom component \(T_F(g)f\).
Since the next coordinate has sign \(-s\), its third component is
\(\boldsymbol\delta-\partial h\). Its square has third component
\(\boldsymbol\delta\partial-\partial\boldsymbol\delta=0\).

A separate hand check (status **supported**, only this finite case) takes
\(E=F=S=Q=k\), \(i=v_0=1\), over characteristic different from two,
with \(P^0\xrightarrow{1}P^1\) and other terms zero. The cone bottom
is \(k^2/\langle(1,-1)\rangle\), while (1.2) prescribes
\(k^2/\langle(1,1)\rangle\). The sign change in (4.5) identifies them
and fixes \([t,0]\). This checks the quotient convention, not the main
theorem's non-projectivity hypothesis. For \(S=0\), or semisimple \(E\),
the non-zero-kernel hypothesis fails; no non-projective conclusion is
silently inferred in those degenerate cases.

## Cited locators read

The reporting verifier read the following primary-source passages directly.
The local PDFs were located through the author's library file, read with
`pdftotext -layout`, and their title/version pages inspected as extracted
text. Online copies were also reached; no PDF was downloaded or modified.
The cited claims are expanded in the dossier rather than used as unexplained
premises.

| Source and pinned version | Locators actually read | Result of comparison |
|---|---|---|
| OpenAI, *An explicit counterexample to the Auslander–Reiten conjecture*, local snapshot dated 2026-09-23 | Complete `.cache/ar-src/01-stable.tex` and `.cache/ar-src/02-conversion.tex`; title/date and inclusion order in `main.tex` | Source uses left modules and homological degrees. The conversion file is §3. Proposition `conv:proposition`, lines 42–43, explicitly requires: “Assume that $\delta^0$ is surjective with nonzero kernel”. Lemma `conv:comparison` and its proof, lines 78–158, agree with the translated comparison argument. The conversion proof, lines 163–302, and its last paragraph, lines 304–308, retain the degree-zero assumption. The missing hypothesis is in the frozen statement, not in this source proposition. |
| Veliche, [arXiv:math/0406057v1](https://arxiv.org/pdf/math/0406057) | §1.1.1, p. 3; §2.1.1, p. 7; §2.2.1, p. 8; §2.3.1, p. 8; §2.3.2, p. 9, with surrounding conventions | All locators match. Product Hom and its sign translate by reversing homological indices. Total acyclicity requires “every projective R-module Q” as target; the dossier justifies its finite-term equivalent. The more general complete-resolution diagram is distinguished from the dossier's convention. The cited GP definition and positive Ext vanishing match. |
| Eshraghi–Hafezi–Salarian–Li, [arXiv:1402.4595v1](https://arxiv.org/pdf/1402.4595v1) | §2, pp. 2–3; Lemma 2.1, p. 3; Lemma 2.2 and proof, pp. 3–4; preceding left-module/lower-triangular conventions | All locators match. Lemma 2.1 requires an injective structure map, projective top and projective cokernel. Lemma 2.2(i) requires preservation of acyclicity by tensoring; (ii) requires \(\operatorname{Add}({}_EF)\subseteq\operatorname{GProj}(E)^\perp\). Right projectivity ensures (i); left projectivity ensures (ii), since projective targets have vanishing positive Ext from GP modules. The dossier supplies the finite-complex argument directly. |

Source SHA-256 values:

- `.cache/ar-src/main.tex`: `c4da7a8976713e71ad392c2dfa451c216436f5fcf09cce609f85236abfe64208`.
- `.cache/ar-src/01-stable.tex`: `598837f4705df91bbae832abe9809bd601fef9c636a7395aa670e97a7d61edeb`.
- `.cache/ar-src/02-conversion.tex`: `816fd48bbb39b30678b89175bfbafc2b06dbca4ab244935d17ecb37a2c76daca`.
- Library `Vel04 - Gorenstein Projective Dimension for Complexes.pdf` (v1): `ffe85ecf4a3c91ea1b8e6a9790babaebe4e47122af011820d06f5259c8bfd6cb`.
- Library `EHSL14 - Gorenstein Projective Modules over Triangular Matrix Rings.pdf` (v1): `a8b01d03bd5a2fe044e66f50522511ad1271c3aa34691bbce7ab1d118f2a21fe`.

No mathematical citation used for Result 8.1 remains unread. The dossier's
links to previous audits, proof outlines, the earlier sign script and its
output, and the same-model review were not followed: they are outside this
job's input scope. The claims about those earlier checks are not endorsed.
The convention file's Tate-duality citation was not needed: neither the
dossier's proof nor the counterexample uses Tate duality.

## Wording that does not match the proof

1. **Result 8.1, lines 92–109:** its wording omits \(\delta^0\) surjective,
   while lines 567–568 and the table row 602 use it. This is the only
   independent mathematical statement/proof mismatch found among the
   theorem and its auxiliary lemmas.
2. **Completion claims, lines 586, 613 and 654–664:** these inherit the
   same mismatch; the argument covers the repaired theorem, not the
   frozen statement. They should be revised together with the statement.

The proposed minimal statement edit is

```diff
@@ -92,3 +92,3 @@
-**Result 8.1 (statement).** Suppose that \(\delta^0\) has
-non-zero kernel, and that \(\delta^a\) is bijective for every integer
+**Result 8.1 (statement).** Suppose that \(\delta^0\) is surjective
+with non-zero kernel, and that \(\delta^a\) is bijective for every integer
 \(a>0\). Choose an ordinary representative \(v_0:S\to T_FS\) of \(v\)
```

This edit is proposed only; the frozen dossier was not changed. With that
additional hypothesis, no further error or gap was found in the supplied
argument. The present report does not assign human-verified status to the
repaired result, and it does not audit the rest of the research report.
