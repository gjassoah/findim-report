Model: unknown; effort: unknown.

# D-B independent odd-double attempt

Scope: report §6.3; triangulated category \(\mathcal T\), its additive idempotent completion, and an idempotent \(e\in\operatorname{End}_{\mathcal T}(L)\). Cohomological translation notation. This is a proof note, not a computation.

## Attempt recorded before consulting the preprint's proof

Let \(U=(L,e)\) and \(W=(L,1-e)\) in \(\operatorname{Kar}(\mathcal T)\). The decomposition \(L\simeq U\oplus W\) turns \(1-e\) into \(0_U\oplus1_W\). Its cone \(C\), chosen in \(\mathcal T\), is therefore \(U\oplus U[1]\) in the completion, provided one either uses the triangulated structure on the completion or supplies a direct splitting argument. The triangle \(L\xrightarrow{1-e}L\to C\to L[1]\) gives \([C]=0\) in \(K_0(\mathcal T)\).

Now take the map \(f:C[1]\to C\) whose matrix under \(C[1]\simeq U[1]\oplus U[2]\), \(C\simeq U\oplus U[1]\), has its only nonzero entry the identity from source \(U[1]\) to target \(U[1]\). Full faithfulness of \(\mathcal T\to\operatorname{Kar}(\mathcal T)\) gives a map in \(\mathcal T\). Its cone \(V_0\) is \(U\oplus U[3]\): the identity component has zero cone, while the zero component \(U[2]\to U\) has cone \(U\oplus U[3]\). Its actual triangle in \(\mathcal T\) gives \([V_0]=[C]-[C[1]]=2[C]=0\). No injectivity statement about the completion map on \(K_0\) is needed.

Status at this stage: plausible pending the elementary cone-splitting justification and source comparison. In particular, \(U\) is initially a formal retract; the statement does not claim it fails to descend for every input.

## Complete cone argument, independent of a triangulated structure on the completion

**Statement.** Let \(\mathcal T\) be a triangulated category with shift \([1]\). Given \(L\in\mathcal T\) and an idempotent \(e:L\to L\), set \(U=(L,e)\in\operatorname{Kar}(\mathcal T)\). There are objects \(C,V_0\in\mathcal T\) and isomorphisms in the additive idempotent completion
\[
C\simeq U\oplus U[1],\qquad V_0\simeq U\oplus U[3].
\]
If \(\mathcal T\) is essentially small, both \([C]\) and \([V_0]\) vanish in its triangle Grothendieck group. The conclusion for \([V_0]\) holds for every representative of \(U\oplus U[3]\) in \(\mathcal T\).

**Cone calculation.** Suppose that
\[
A\xrightarrow{f}B\xrightarrow{j}C\xrightarrow{q}A[1]
\]
is a triangle in \(\mathcal T\). Assume in its additive idempotent completion that
\[
A\simeq I\oplus A',\qquad B\simeq I\oplus B',\qquad
f=\begin{pmatrix}1_I&0\\0&0\end{pmatrix}.
\]
For each \(Z=(Z_0,p)\), the functor \(\operatorname{Hom}(Z,-)\) on the displayed triangle is the image of the idempotent chain endomorphism given by precomposition by \(p\) on \(\operatorname{Hom}_{\mathcal T}(Z_0,-)\). Images of idempotent chain endomorphisms form direct summand complexes; a direct summand of an exact complex is exact. Therefore, the representable long exact sequence remains exact for \(Z\).

The equations \(jf=0\) and \(f[1]q=0\) respectively make the restriction of \(j\) to \(I\) zero and the component of \(q\) into \(I[1]\) zero. Write the remaining maps as \(j':B'\to C\) and \(q':C\to A'[1]\). For every formal object \(Z\), the sequence
\[
0\longrightarrow\operatorname{Hom}(Z,B')
\xrightarrow{j'\circ-}\operatorname{Hom}(Z,C)
\xrightarrow{q'\circ-}\operatorname{Hom}(Z,A'[1])
\longrightarrow0
\]
is exact:

- If \(j'b=0\), the inclusion of \(b:Z\to B'\) into \(B\) factors through \(f\) by triangle exactness. Projection onto \(B'\) kills \(f\), hence \(b=0\).
- If \(q'c=0\), then \(qc=0\). Thus \(c=ja\) for a map \(a:Z\to B\), and \(c=j'\operatorname{pr}_{B'}a\).
- The inclusion into \(A[1]\) of every map \(a:Z\to A'[1]\) is killed by \(f[1]\), hence is \(qc\) for some \(c:Z\to C\). Projection onto \(A'[1]\) gives \(q'c=a\).

At \(Z=A'[1]\), choose a lift \(s:A'[1]\to C\) of \(1_{A'[1]}\). For every \(Z\), the map
\[
\operatorname{Hom}(Z,B'\oplus A'[1])\longrightarrow\operatorname{Hom}(Z,C),
\qquad (b,a)\longmapsto j'b+sa,
\]
is surjective: subtract \(sq'c\) from a given \(c\) and use middle exactness. It is injective: applying \(q'\) forces \(a=0\), then first exactness forces \(b=0\). Hence \((j',s):B'\oplus A'[1]\to C\) is an isomorphism. Indeed, surjectivity with \(Z=C\) gives a right inverse \(t\), and injectivity with \(Z=B'\oplus A'[1]\) applied to \((j',s)(t(j',s)-1)=0\) gives the left-inverse identity. No triangle in the completion was used.

Apply this calculation to a triangle for \(1-e:L\to L\), with identity summand \((L,1-e)\) and both zero complements \(U\). This constructs \(C\simeq U\oplus U[1]\). Shift this isomorphism and define
\[
f:C[1]\longrightarrow C,
\qquad
\begin{pmatrix}U[1]\\U[2]\end{pmatrix}
\xrightarrow{\left(\begin{smallmatrix}0&0\\1&0\end{smallmatrix}\right)}
\begin{pmatrix}U\\U[1]\end{pmatrix}.
\]
This morphism is in \(\mathcal T\), since both endpoints are in \(\mathcal T\) and the inclusion into the completion is full. Choose a triangle for \(f\). The cone calculation with identity summand \(U[1]\), source complement \(U[2]\), and target complement \(U\) gives \(V_0\simeq U\oplus U[3]\).

**Grothendieck group calculation.** Its defining relations are \([B]=[A]+[C]\) for triangles \(A\to B\to C\to A[1]\). A triangle \(A\to0\to A[1]\to A[1]\) gives \([A[1]]=-[A]\). The actual two triangles constructed above therefore give
\[
[C]=[L]-[L]=0,\qquad [V_0]=[C]-[C[1]]=2[C]=0.
\]
If another \(V_1\in\mathcal T\) represents the same formal object, the isomorphism \(V_1\simeq V_0\) in the completion and its inverse are morphisms in \(\mathcal T\) by full faithfulness. Thus they are isomorphic in \(\mathcal T\), so have the same class. In the report, \([V]=0\) in \(K_0(\mathcal Q)\) means the class of this representative, with \(\mathcal T=\mathcal Q\). The class \([U]\) in \(K_0(\mathcal Q)\) is not available unless \(U\) descends; an argument using only \([U]+[U[3]]=0\) in the completed category does not by itself give the required assertion in \(K_0(\mathcal Q)\).

**Status: AI-proved.** The proof uses only representable exactness for triangles, splitting of exact complexes by idempotent maps, full faithfulness, and the defining triangle relations in \(K_0\).

## Source comparison and audit conclusion

Source read after the initial attempt: `build/sections/03-localization-and-lifting.tex`, subsection *An odd double of a formal summand*, lines 170–259; Lemma `lem:odd-double`, statement lines 190–196 and proof lines 198–249.

The independently attempted construction agrees with the source. Its elementary Hom argument supplies exactly the direct cone calculation needed by the attempt; the detailed argument above expands the exactness and inverse-map steps. No issue found in the lemma or its application to \(\theta(e)\). The \(K_0(\mathcal Q)\) assertion is an additional consequence recorded here, not a repair of a preprint assertion. Balmer–Schlichting Theorem 1.5 is mentioned by the source but is not used by either this proof or the source's proof; its locator was not checked and supplies no dependency of this note.

The task wording “\(U\) only exists in the idempotent completion” must mean that the construction initially defines it there and does not ensure descent. It cannot mean universal failure of descent: for \(e=0\) it is zero, and for \(e=1\) it is \(L\). The preprint says only that it need not split, which is appropriately qualified.
