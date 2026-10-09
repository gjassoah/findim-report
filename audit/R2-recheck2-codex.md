Model: GPT-6 (exact variant unknown); effort: unknown.

# R2-recheck2

Scope: the eight hunks of `scratch/R2-recheck2.patch`, checked against the current
Sections 3, 5 and 8, `report/main.tex` and `audit/report-notation.md`.
The excluded directories and the outputs of previous checks were not opened.
All mathematical reasoning recorded below has status **AI-proved** (an AI check,
not human certification); verdicts concern the specified hunks only.

## Example 3.9 — no error found

Location: `report/sections/03-criteria.tex:258–269`.
With the stated path convention, \(e=e_3\), \(f=e_1+e_2\),

\[
B=\langle e_1,e_2,a\rangle_k=k(1\xrightarrow a2),\qquad
M=e_3Af=kb.
\]

The right action satisfies \(be_2=b\), \(be_1=0\), \(ba=0\), so \(M\) is the
right simple at 2. The resolution is

\[
0\longrightarrow e_1B\xrightarrow{x\mapsto ax}e_2B
\xrightarrow{x\mapsto bx}kb\longrightarrow0.
\]

Here \(e_1B=ke_1\), \(e_2B=ke_2\oplus ka\), and the second map has kernel \(ka\).
Applying \(\operatorname{Hom}_{B^{\mathrm{op}}}(-,B)\) gives the map

\[
Be_2\longrightarrow Be_1,\qquad y\longmapsto ya,
\]

whose image is \(ka\), since \(Be_2=ke_2\) and \(Be_1=ke_1\oplus ka\). Thus

\[
\operatorname{Ext}^1_{B^{\mathrm{op}}}(M,B)=Be_1/ka\ne0.
\]

For the surrounding hypothesis, the projective resolution over \(A\) has maps
left multiplication by \(a\) and \(b\). Its dual is

\[
0\longrightarrow Ae_3\xrightarrow{y\mapsto yb}Ae_2
\xrightarrow{y\mapsto ya}Ae_1\longrightarrow0.
\]

The spaces have bases \((e_3)\), \((e_2,b)\), \((e_1,a)\); the first image and
second kernel are both \(kb\). Consequently Hom and Ext in degree 1 vanish,
whereas Ext in degree 2 is \(Ae_1/ka\ne0\). Additivity in the second variable
then gives \(\operatorname{Ext}^1(M,B\oplus M)\ne0\).
This refutes the last conclusion of Proposition 3.8 **under only its first two
vanishing conditions**. It does not contradict the proposition with its stated
all-degree hypothesis. The example makes that distinction correctly.

## Remark 8.6 — no error found

Location: `report/sections/08-conversion.tex:337–344`; dependency checked:
Theorem 8.4, lines 204–332.
The construction of the complete resolution, its identification with \(Z\),
total acyclicity, and the endomorphism-complex exact sequence use no hypothesis
on the maps \(\delta^a\). Positive self-extension vanishing uses surjectivity
of \(\delta^0\) and bijectivity of \(\delta^a\) for \(a>0\), but not
\(\ker\delta^0\ne0\). The latter occurs only at lines 330–332: its nonzero
kernel forces \(\underline{\operatorname{End}}_E(S)\ne0\), so \(S\) is
nonprojective, and the first component then makes \(Z\) nonprojective.
There is no hidden extra use in the complete-resolution lemmas. In fact the
diagonal pair \((1_S,1_S)\) is in the kernel, so nonprojectivity of \(S\)
also implies the kernel condition; projective \(S\) gives zero domain.

## Proposition 3.5 — no error found

Location: report/sections/03-criteria.tex, lines 111–124.
Write the chosen minimal presentation as \(Q_0\xrightarrow dQ_1\to C\to0\).
Duality on finitely generated projectives preserves radical morphisms, so
\(Q_0^*\to E=\operatorname{coker}d^*\) is a projective cover.
The map \(Q_1^*\to\operatorname{im}d^*\) is also a projective cover: otherwise,
splitting off a redundant projective summand gives a nonzero summand
\(L\subseteq Q_1^*\) killed by \(d^*\). Dualising the decomposition would give
the nonzero projective summand \(L^*\) of \(\operatorname{coker}d=C\), contrary
to the hypothesis. Thus \(Q_1^*\to Q_0^*\to E\to0\) is a minimal presentation.
Reflexivity of the projective terms gives
\(\operatorname{Tr}E\cong\operatorname{coker}d^{**}\cong C\), as an actual
module isomorphism, not merely in the stable category.

Under (1), the entire dual resolution of \(E\) is exact. Its first cokernel
can consequently be identified with \(C\), and its tail gives (3). To check
the approximation assertion, a map from such a cokernel into \(A\) corresponds
to an element of the kernel in the original projective resolution; exactness
there supplies its lift from the next projective term. This is precisely
surjectivity after applying \(\operatorname{Hom}_A(-,A)\), and the same holds
for every object of \(\operatorname{add}A\). The converse splice in lines
121–124 introduces no extra reflexivity assumption on \(C\).

Source cross-check: Angeleri Hügel, *An Introduction to Auslander-Reiten
Theory*, lecture notes updated 2 June 2006, §2.2, printed p. 9, explicitly
uses modules without nonzero projective summands over a semiperfect ring and
says that dualising the minimal presentation gives “a minimal projective
presentation”. These hypotheses apply here; the argument above checks the
part needed independently.
[Author-hosted notes](https://profs.scienze.univr.it/~angeleri/trieste.pdf).

## Corollary 3.6 — no error found

Location: report/sections/03-criteria.tex, lines 134–139.
Exactness in Theorem 3.3 gives
\[
C_n=\operatorname{coker}(P_{n-1}^*\to P_n^*)
 \cong\operatorname{im}(P_n^*\to P_{n+1}^*)\subseteq P_{n+1}^*
\quad(n\ge1).
\]
The index \(n+1\) is correct. Restriction embeds every indecomposable summand
into this projective module, and each summand has finite projective dimension.
A finite list of isomorphism classes would bound the projective dimensions of
all their finite direct sums, contradicting \(\operatorname{pd}C_n=n\).

## Proposition 3.8 — no error found

Location: report/sections/03-criteria.tex, lines 245–254.
Put \(\Delta=\operatorname{End}_{A^{\mathrm{op}}}(S)\).
In a minimal injective resolution, \(\ker(I^j\to I^{j+1})\) is essential
in \(I^j\), including \(j=0\). Every simple submodule therefore lies in
this kernel. Applying \(\operatorname{Hom}_{A^{\mathrm{op}}}(S,-)\)
gives zero differentials, hence
\[
\operatorname{Ext}^j_{A^{\mathrm{op}}}(S,A)
\cong\operatorname{Hom}_{A^{\mathrm{op}}}(S,I^j).
\]
The latter is a right \(\Delta\)-vector space by precomposition.
Each indecomposable injective with socle isomorphic to \(S\) contributes
one copy of \(\Delta\); all other indecomposable injectives contribute zero.
Thus its dimension counts those indecomposable summands, with multiplicity.
No split-field or basic-algebra hypothesis is needed. “Summands with socle
\(S\)” has this usual decomposition meaning; no wording repair is necessary.

## Proposition 5.13 — no error found

Location: report/sections/05-selection.tex, lines 345–354; defining relations
at lines 190–210.
The four displayed relations respectively acquire U-parameters \(r+c\);
\((r+c,s+c)\); \(r+c\) with the V-parameter \(s\) unchanged; and \(r+c\)
with the W-parameter \(s\) unchanged. The mixed noncommuting relation becomes
\[
[U_i(r+c),W_{ij}(s)]=U_j(r+s+c).
\]
Thus the new wording shifts exactly the U-parameters, and matches the stated
automorphism. It does not incorrectly shift parameters belonging to V or W.

## Proposition 5.14 — no error found

Location: report/sections/05-selection.tex, lines 366–393.
The coefficient ring is \(S_m=\mathbb F_2[t]/(t^m-1)\), for \(m\ge1\).
It has characteristic two even when it is not reduced. Since a matrix unit
\(A=E_{ab}\) with \(a\ne b\) has \(A^2=0\), scalar multiplication by
\(x\in S_m\) gives
\((\mathbf1+xA)^2=\mathbf1+2xA+x^2A^2=\mathbf1\).
This includes \(m=1\); no assumption about odd \(m\) or reducedness is used.

## Theorem 5.17 — no error found

Location: report/sections/05-selection.tex, lines 519–526; Lemma 5.16 at
lines 460–481 and the twist convention at lines 35–43.
The isomorphism is specifically
\[
H^jY_m\cong{}_{\alpha^j}(p_jY_m).
\]
Indeed \(HY\cong{}_\alpha(eY)\); applying H to
\({}_{\alpha^j}(p_jY)\) selects \(\alpha^j(e)p_jY=p_{j+1}Y\), and
the new action is through \(\alpha^{j+1}\).
The phrase “which is \(Y_m\)” refers to the untwisted subspace \(p_jY_m\),
not to an identification of the twisted R-module with the original \(Y_m\).
For \(j<m\) all factors of \(p_j\) act as the identity; for \(j\ge m\)
the zero-acting factor \(e_{m-1}\) occurs. This includes \(j=0\), with the
empty product \(p_0=1\), and \(m=1\). The twist does not affect vanishing,
so the revised sentence gives the claimed extinction time.

## Completed coverage

| Hunk | Verdict |
|---|---|
| Proposition 3.5: double transpose | no error found |
| Corollary 3.6: torsionless embedding | no error found |
| Proposition 3.8: injective multiplicity | no error found |
| Example 3.9: corner and nonzero Ext | no error found |
| Proposition 5.13: parameter shifts | no error found |
| Proposition 5.14: characteristic two | no error found |
| Theorem 5.17: twisted subspace | no error found |
| Remark 8.6: use of the kernel hypothesis | no error found |

No mathematical error or wording problem was found in these eight hunks.
The check used direct algebraic calculations and dependency tracing; it was
not a verification of the whole report, a computer algebra computation, or
a formal proof. No manuscript edits or build were performed.

Input SHA-256 hashes:

    scratch/R2-recheck2.patch
      3159bd0d872d842fb92fd27f77138bbe583314c974997b4d2bcb9201417ab34c
    report/sections/03-criteria.tex
      1539ded31a7064d66ef765b82df25ecb204f88ffcb7579cf6100743d9ec38516
    report/sections/05-selection.tex
      03cabf89c7e751b94c4d4e9bb13ed0d4abf0069b5ce1ce1460eb3e6115503628
    report/sections/08-conversion.tex
      37052c37cf9d9a1a1a789e6cbaae3add8f0e77b17d7e085eb26d253b4bfa14f6
    report/main.tex
      d32d022fecebd08095f7a7cdf10ae82393966b06c0d70621a25f4ecb14689577
    audit/report-notation.md
      f69ee451cfbff429f46196434626154173f6ed52cc4657c8c8976e20fd6db8d5
