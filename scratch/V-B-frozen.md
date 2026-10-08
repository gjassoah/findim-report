Model: unknown; effort: unknown.

# D-B: realisation by a bimodule complex

Date: 2026-10-08. This is an AI-written proof dossier for report §§2.3,
6.1–6.6 and 5.3, not an author-certified manuscript. Conventions are those
of audit/report-notation.md and report/notes/outline.md. All modules
are left modules except the explicitly specified projective right modules
in the homotopy category. Paths and composition run from right to left.
The shift is cohomological: \(C[t]^n=C^{n+t}\), with differential
\((-1)^t d_C\). Each final result receives a status below.

## Record of independent attempts and scope

The first statement extraction suppressed proof environments. Some
source arguments occur outside those environments: quadraticisation,
the quotient action, evaluation, and fractions were exposed during that
extraction. The root agent therefore cannot claim an independent attempt
before source exposure for these subclaims. A later fresh-context agent,
given their statements but neither the source nor this dossier, wrote
independent attempts before reading either. Its chronology and subsequent
comparison are in computations/D-B-fresh-attempt-review.md. This supplies
a separate independent-first attempt without rewriting the earlier
chronology.

Before reading their proof environments, the following attempts were made.

- **6.3:** form \(C=\operatorname{Cone}(1-\epsilon)\), expected to represent
  \(U\oplus U[1]\). A map \(C[1]\to C\) identifying the common \(U[1]\)
  summand should have cone \(U\oplus U[3]\). The triangles give
  \([C]=0\) and hence \([V_0]=[C]-[C[1]]=0\) already in \(K_0(\mathcal T)\).
  The needed check was the summand calculation without presupposing a
  triangulation on the idempotent completion.
- **6.4:** fix the terminal vertex; clear the finitely many denominators
  for arrows \(1\to2\), then those for \(0\to1\). Kill the finite family
  of relation errors by one further denominator at vertex zero. This
  order preserves the arrows already lifted.
- **6.5:** a delegated independent attempt used the vertex, arrow, and
  relation columns, shifted by \(0,1,2\), with internal differential signs
  \(+,-,+\). The relation homotopy supplies the remaining off-diagonal
  term. The formulas and checks appear below.
- **6.6:** vertexwise evaluations have cohomology only in degrees
  \(0,-3\). Arrow homotopies identify both cohomology modules with
  \(M(HY)\). The truncation obstruction belongs to
  \(\operatorname{Ext}^4_B(M(HY),M(HY))=0\); additivity and shift
  compatibility give the binomial iterate formula.
- **5.3:** replace \(E_0\) by \(E_0^{\oplus n}\), the idempotent by
  \(\theta_n(\varepsilon)\), and the twisted action by
  \(\theta_n\rho\). Evaluation should identify its image with
  \(\Psi\otimes_RY\). This needs a finitely presented \(R\), a specified
  finite right-projective presentation, and a unital \(k\)-linear left
  action. No centrality assumption on the matrix idempotent is expected.

The directed-bound attempt and further details of the matrix extension
are in computations/D-B-encoding-generalisation.md. The odd-double and
rectification fragments are in computations/D-B-odd-double.md and
computations/D-B-rectification-proof.md. They are working records; the
self-contained final statements and proofs are in this dossier.

Only the two named deliverables and new files in computations/ are
written. The preprint and build/ remain inputs. Other agents' arguments
were treated as leads and checked by the root agent. The fresh review
does not independently identify its model, and no result here is assigned
[status omitted] status.

## 2.3. Right fractions in the Verdier quotient

**Statement.** Let \(\mathcal K\) be an essentially small triangulated
category, let \(\mathcal S\) be a strictly full thick triangulated
subcategory, and write
\[
 \mathcal W=\{u:\operatorname{Cone}(u)\in\mathcal S\},\qquad
 q:\mathcal K\longrightarrow\mathcal Q=\mathcal K/\mathcal S.
\]
Every morphism \(qX\to qY\) is \(q(f)q(u)^{-1}\), where
\(u:X'\to X\) belongs to \(\mathcal W\) and \(f:X'\to Y\).
The two consequences used below are:

1. For finitely many morphisms \(\gamma_i:qX\to qY_i\), there is one
   \(u:X'\to X\) in \(\mathcal W\) and maps \(f_i:X'\to Y_i\)
   such that \(\gamma_i=q(f_i)q(u)^{-1}\).
2. If finitely many \(g_i:X\to Y_i\) satisfy \(q(g_i)=0\), there is
   one \(v:X'\to X\) in \(\mathcal W\) with \(g_iv=0\) in
   \(\mathcal K\) for every \(i\).

**Proof.** Identities belong to \(\mathcal W\). For composable maps
\(u,v\), the octahedron gives a triangle between
\(\operatorname{Cone}(u),\operatorname{Cone}(vu),\operatorname{Cone}(v)\).
Thus \(\mathcal W\) is closed under composition and satisfies
2-out-of-3, because \(\mathcal S\) is closed under triangles.

For the right Ore condition, take \(u:Y'\to Y\) in \(\mathcal W\)
and \(f:X\to Y\). Choose triangles
\[
 Y'\xrightarrow{u}Y\xrightarrow{c}S\longrightarrow Y'[1],\qquad
 X'\xrightarrow{v}X\xrightarrow{cf}S\longrightarrow X'[1].
\]
Here \(S\in\mathcal S\), so \(v\in\mathcal W\). Since
\(cfv=0\), exactness of \(\operatorname{Hom}(X',-)\) on the first
triangle gives \(g:X'\to Y'\) with \(ug=fv\).

For right cancellation, suppose \(u:Y\to Y'\) is in
\(\mathcal W\) and \(u(f-g)=0\) for \(f,g:X\to Y\).
A rotated triangle for \(u\) and exactness give a factorisation
\(f-g=ab\), with \(b:X\to S[-1]\) and \(S\in\mathcal S\).
Complete \(b\) to
\[
 X'\xrightarrow{v}X\xrightarrow{b}S[-1]\longrightarrow X'[1].
\]
Then \(v\in\mathcal W\), \(bv=0\), and \(fv=gv\).
These are the right multiplicative-system axioms.

For precision, the categorical construction from these axioms is the
right-fraction construction in the Stacks Project, §4.27 immediately
before Lemma 4.27.11, and
[Lemma 4.27.11, Tag 04VH](https://stacks.math.columbia.edu/tag/04VH).
Its identification with localisation is
[Lemma 4.27.16, Tag 04VK](https://stacks.math.columbia.edu/tag/04VK).
A roof is a pair \((u,f)\) as in the statement. Two roofs are equivalent
when there is a common refinement on which both numerators and both
maps to \(X\) coincide, the common map to \(X\) being in
\(\mathcal W\). Composition uses the Ore square. These cited results
supply well-definedness, associativity and the universal property.
For this Verdier quotient the localisation description is
[Stacks, Definition 13.6.7 and Lemma 13.6.6](https://stacks.math.columbia.edu/tag/05RA).

Here are direct deductions of the two consequences. Given two roofs
with denominators \(u_i:X_i\to X\), apply the Ore condition to
\(u_1,u_2\). It gives \(v:Z\to X_1\) in \(\mathcal W\) and
\(w:Z\to X_2\) with \(u_1v=u_2w\). The common composite belongs
to \(\mathcal W\), and 2-out-of-3 also puts \(w\) in
\(\mathcal W\). Precompose the two numerators by \(v,w\).
Induction gives (1); the empty family uses \(\operatorname{id}_X\).
For one map in (2), equality of roofs \((\operatorname{id}_X,g_i)\)
and \((\operatorname{id}_X,0)\) supplies a common refinement
\(v\in\mathcal W\) with \(g_iv=0\). This is also the
same-denominator criterion in
[Lemma 4.27.14, Tag 04VJ](https://stacks.math.columbia.edu/tag/04VJ).
For several maps, apply the one-map conclusion to their direct-sum
map \(X\to\bigoplus_iY_i\). This proves (2).

**Source comparison.** Section 03, lines 292–335, has the same Ore and
cancellation arguments and correct roof orientation. This dossier
makes the abstract fraction construction an exact citation and supplies
separate proofs for the two finite-family consequences. No mathematical
error was found in that passage.

**Citation record.** The linked Stacks statements and their hypotheses
were read in the live version on 2026-10-08. Short verbatim anchors:
Tag 04VH: “The relation on pairs defined above is an equivalence relation.”
Tag 04VK: “Let $S$ be a right multiplicative system of morphisms of
$\mathcal{C}$.” Tag 04VJ: “The following are equivalent”. For the
Verdier construction, Definition 13.6.7 explicitly defines the quotient
as localisation at the cone system. These are cited inputs; no
unread lemma locator is used.

fractions; both consequences and the requisite Ore/cancellation
conditions have written proofs here.

## 6.1. Quadratic presentations, the encoding algebra, and its modules

**Statement.** Let \(k\) be a field and \(R\) a finitely presented
unital \(k\)-algebra, not assumed finite dimensional. There is a finite
presentation
\[
 R=k\langle x_1,\ldots,x_d\rangle/(p_1,\ldots,p_t),\qquad
 \deg p_j\leq2,
\]
where constants and linear terms are allowed. Define \(B\) from the
three-vertex quiver
\[
 0\mathrel{\substack{\longrightarrow\\[-5pt]\longrightarrow}}1
 \mathrel{\substack{\longrightarrow\\[-5pt]\longrightarrow}}2,
 \quad
 \mathcal A_{01}=\{s,a_1,\ldots,a_d\},\quad
 \mathcal A_{12}=\{s',a'_1,\ldots,a'_d\},
\]
where each displayed pair stands for the entire indicated arrow set.
Impose \(a'_hs-s'a_h=0\) and the homogenisations \(\widetilde p_j=0\)
obtained by
\[
 x_hx_l\longmapsto a'_ha_l,\qquad
 x_h\longmapsto s'a_h,\qquad 1\longmapsto s's.
\]
Let \(J_2\) be the span of these relations in the free vector space on
length-two paths, and choose a vector-space basis \(\mathcal R\) of
\(J_2\). Thus
\[
 \rho=\sum_{a\in\mathcal A_{01},\ b\in\mathcal A_{12}}
                \rho_{ba}ba\qquad(\rho\in\mathcal R).
\]
Then \(B\) is finite dimensional and has global dimension at most two
on both sides. For every finite-dimensional left \(R\)-module \(Y\),
the representation \(M(Y)\), with \(Y\) at each vertex, identity maps
for \(s,s'\), and \(x_h\) for \(a_h,a'_h\), is a left
\(B\)-module. This defines an exact fully faithful \(k\)-linear
functor on finite-dimensional modules; in particular, \(M(Y)=0\) if
and only if \(Y=0\).

**Quadratic presentation.** Start with any finite list of generators
and polynomial relations. For each monomial of length at least three
occurring in a relation, introduce symbols for its initial subwords of
length two through length one less than its full length. Impose the
relations saying that the length-two symbol is the product of its two
letters and that each subsequent symbol is the preceding symbol times
the next letter. Replace the original monomial by its penultimate
symbol times its final letter. There are finitely many additions. Every
new relation has degree at most two. Sending the new symbols to their
specified words gives a map from the new quotient to the original
one. Sending the old generators to their new classes gives its inverse:
induction through the auxiliary relations expresses every new symbol
as the prescribed word, and the modified original relations recover
the originals. The two presentations therefore define isomorphic
unital \(k\)-algebras.

**Directed dimension bound.** More generally, let \(\Lambda\) be a
finite-dimensional \(k\)-algebra with orthogonal idempotents
\(\varepsilon_0,\ldots,\varepsilon_{n-1}\), \(n\geq1\), satisfying
\[
 \sum_i\varepsilon_i=1,\qquad
 \varepsilon_i\Lambda\varepsilon_i=k\varepsilon_i,\qquad
 \varepsilon_j\Lambda\varepsilon_i=0\quad(j<i).
\]
Its left and right global dimensions are at most \(n-1\). To include
all modules in the global-dimension assertion, take an arbitrary left
module \(N\) supported at vertices at least \(p\), and use
\[
 P(N)=\bigoplus_{i=p}^{n-1}
       \Lambda\varepsilon_i\otimes_k\varepsilon_iN
 \longrightarrow N,\qquad c\otimes v\longmapsto cv.
\]
This map is surjective since \(v=\sum_i\varepsilon_i v\).
Each summand is a direct sum of copies of \(\Lambda\varepsilon_i\),
so \(P(N)\) is projective. Components below \(p\) vanish. At vertex
\(p\), all summands except \(i=p\) vanish, and that summand maps
isomorphically onto \(\varepsilon_pN\). Its kernel is consequently
supported at vertices at least \(p+1\). After \(n-1\) repetitions,
the remaining kernel is supported only at \(n-1\), hence is a direct
sum of copies of
\(\Lambda\varepsilon_{n-1}=k\varepsilon_{n-1}\). This gives a
projective resolution of length at most \(n-1\). For \(n=1\),
this last observation applies at the outset. In \(\Lambda^{\mathrm{op}}\)
with reversed idempotent order, the same displayed hypotheses hold,
so the argument gives the right bound as well.

For \(B\), there are three paths of length zero, \(2(d+1)\) of
length one, and \((d+1)^2\) free paths of length two. No path has
length three. Multiplying a relation by a nonidentity path on either
side gives zero because no positive-length path enters vertex zero
or leaves vertex two. Thus the relation ideal is exactly \(J_2\),
inside the length-two path space. In particular,
\[
 \dim_k B=3+2(d+1)+(d+1)^2-\dim_k J_2.
\]
Writing its vertex idempotents as \(\mathbf e_i\), we have
\(\mathbf e_iB\mathbf e_i=k\mathbf e_i\) and
\(\mathbf e_jB\mathbf e_i=0\) for \(j<i\). The bound just given
applies with \(n=3\).

**Modules.** In \(M(Y)\), the commutation relation evaluates to
\(x_h-x_h=0\), while \(\widetilde p_j\) evaluates to \(p_j\),
which annihilates \(Y\). An \(R\)-linear map gives the same linear
map at all three vertices, hence a \(B\)-linear map. Conversely, a
\(B\)-linear map is a triple of linear maps; the two identity arrows
force them to coincide, and the other arrows force that common map
to commute with every \(x_h\). It is therefore \(R\)-linear.
Exactness follows vertexwise, since multiplication by each vertex
idempotent is an exact functor on modules. The assertion about zero
objects follows from \(\mathbf e_0M(Y)=Y\).

**Source comparison.** Section 03, lines 23–112, gives this
construction. The quadraticisation paragraph is expanded here with
mutually inverse maps. The directed-bound proof agrees with the
source and applies to arbitrary modules, not merely finite-dimensional
ones. Full faithfulness and the dimension formula are additional
consequences. No source error was found. A basis of \(J_2\), rather
than a redundant generating list, is essential in §6.5.


## 6.2. The quotient action and evaluation functors

**Statement.** For the algebra \(B\) of §6.1, set
\[
 \mathcal K=K^b(\operatorname{proj}B_B),\qquad E_i=\mathbf e_iB,
 \qquad
 \mathcal S=\operatorname{thick}\bigl(\operatorname{Cone}(s),
                          \operatorname{Cone}(s')\bigr),
 \qquad \mathcal Q=\mathcal K/\mathcal S.
\]
Here \(\operatorname{proj}B_B\) means finitely generated projective
**right** modules. An arrow \(a:i\to j\), viewed as an element of
\(\mathbf e_jB\mathbf e_i\), acts by left multiplication
\(E_i\to E_j\). There is a unital \(k\)-algebra homomorphism
\[
 \theta:R\longrightarrow\operatorname{End}_{\mathcal Q}(E_0),
 \qquad \theta(x_h)=s^{-1}a_h.
\]
For each finite-dimensional left \(R\)-module \(Y\), the exact
functor
\[
 \operatorname{ev}_Y:\mathcal K\longrightarrow D^b(k\text{-mod}),
 \qquad T\longmapsto T\otimes_BM(Y)
\]
factors through an exact functor on \(\mathcal Q\). Under
\(E_i\otimes_B M(Y)\simeq Y\), its evaluation of \(\theta\)
is the original \(R\)-action on \(Y\).

**Proof.** The cones used to define \(\mathcal S\) vanish in the
quotient, so \(s,s'\) are invertible there. In \(\mathcal Q\),
\(a'_hs=s'a_h\) implies \(a'_h=s'a_hs^{-1}\). Consequently,
\[
 (s's)^{-1}a'_ha_l
 =s^{-1}(s')^{-1}s'a_hs^{-1}a_l
 =(s^{-1}a_h)(s^{-1}a_l),
\]
while \((s's)^{-1}s'a_h=s^{-1}a_h\) and
\((s's)^{-1}s's=1_{E_0}\). Multiplying each homogenised relation
by \((s's)^{-1}\) on the left therefore gives exactly
\(p_j(s^{-1}a_1,\ldots,s^{-1}a_d)=0\), including its constant
term. The homomorphism from the free unital algebra factors through
\(R\). This checks multiplication in its stated order: no opposite
algebra occurs in \(\theta\).

Termwise tensor sends chain homotopies to chain homotopies and mapping
cones to mapping cones, and commutes with shifts. It therefore gives
the displayed exact functor. The complex is bounded and its terms
finite dimensional. A bounded complex of projective right modules is
flat for derived tensor: tensoring it with an acyclic complex is
acyclic, by filtering the bounded complex by its terms and using
exactness of tensor with each projective. Thus this ordinary tensor
also computes the derived tensor product.

The identification \(\mathbf e_iB\otimes_BM(Y)\to\mathbf e_iM(Y)\)
sends \(c\otimes v\) to \(cv\); its inverse sends \(v\) to
\(\mathbf e_i\otimes v\). In these coordinates, left multiplication
by an arrow becomes that arrow's action on \(M(Y)\). In particular,
\(s,s'\) evaluate to identities. Their cones evaluate to zero.
The objects killed by an exact functor are closed under shifts and
triangles, by exactness, and under direct summands, by additivity.
They therefore include \(\mathcal S\).

If \(u\in\mathcal W\), applying evaluation to a triangle for \(u\)
shows that \(\operatorname{ev}_Y(u)\) is invertible. On a roof
\((u,f)\), define the factorisation by
\(\operatorname{ev}_Y(f)\operatorname{ev}_Y(u)^{-1}\).
Common refinements leave this value unchanged, and the Ore square
makes it compatible with composition. It is exact by the universal
property of the Verdier quotient; the precise cited statement is
[Stacks, Lemma 13.6.8(2), Tag 05RJ](https://stacks.math.columbia.edu/tag/05RJ),
whose hypotheses and statement were read on 2026-10-08. A short
verbatim anchor is “$F'$ is an exact functor too.” Finally,
\(s^{-1}a_h\) evaluates to \(1^{-1}x_h=x_h\), as required.

**Source comparison.** Section 03, lines 116–169, has the same
handedness and calculation. No source error was found. Neither an
identification of \(\mathcal Q\) with a derived category of \(R\)
nor stable flatness of a universal localisation is used.

universal property cited at its read locator.

## 6.3. The odd double and its Grothendieck class

**Statement.** Let \(\mathcal T\) be an essentially small triangulated
category, let \(L\in\mathcal T\), and let
\(\epsilon\in\operatorname{End}_{\mathcal T}(L)\) satisfy
\(\epsilon^2=\epsilon\). In its additive idempotent completion put
\(U=(L,\epsilon)\). There exist \(C,V_0\in\mathcal T\) with
\[
 C\simeq U\oplus U[1],\qquad V_0\simeq U\oplus U[3]
 \quad\text{in }\operatorname{Kar}(\mathcal T),
 \qquad [C]=[V_0]=0\quad\text{in }K_0(\mathcal T).
\]
In particular, apply this with \(\mathcal T=\mathcal Q\),
\(L=E_0\), and \(\epsilon=\theta(e)\). The notation
\([V]=0\) in \(K_0(\mathcal Q)\), where \(V=U\oplus U[3]\),
means the class of its representative \(V_0\). The summand \(U\)
is initially defined only in the completion; descent of \(U\) is
not asserted or needed.

**Cone calculation.** The objects of \(\operatorname{Kar}(\mathcal T)\)
are pairs \((Z,p)\), and a morphism \(u:(Z,p)\to(Z',p')\) is a
morphism of \(\mathcal T\) satisfying \(u=p'up\). Its identity
is \(p\). The inclusion \(Z\mapsto(Z,1)\) is fully faithful.
Consider a triangle in \(\mathcal T\)
\[
 A\xrightarrow{f}B\xrightarrow{j}C\xrightarrow{v}A[1]
\]
and decompositions in the completion such that
\[
 A=I\oplus A',\qquad B=I\oplus B',\qquad
 f=\begin{pmatrix}1_I&0\\0&0\end{pmatrix}.
\]
We claim \(C\simeq B'\oplus A'[1]\) in the completion.
For a formal object \(Z=(Z_0,p)\), its representable sequence on
this triangle is the image of the idempotent given by precomposition
by \(p\) on the exact representable sequence for \(Z_0\).
An idempotent chain map splits an exact sequence into two direct
summand complexes; both summands are exact. Thus triangle exactness
continues to hold for this formal \(Z\).

The equations \(jf=0\) and \(f[1]v=0\) give maps
\(j':B'\to C\) and \(v':C\to A'[1]\) through which \(j,v\)
factor. For every formal \(Z\), there is an exact sequence
\[
 0\longrightarrow\operatorname{Hom}(Z,B')
 \xrightarrow{j'_*}\operatorname{Hom}(Z,C)
 \xrightarrow{v'_*}\operatorname{Hom}(Z,A'[1])
 \longrightarrow0.
\]
For injectivity, include a map killed by \(j'\) into \(B\).
Triangle exactness makes it factor through \(f\); projection back
to \(B'\) makes it zero. For middle exactness, a map killed by
\(v'\) is killed by \(v\), hence factors through \(j\) and then
through \(j'\). For surjectivity, include a map to \(A'[1]\)
into \(A[1]\); it is killed by \(f[1]\), so triangle exactness
lifts it through \(v\).

Taking \(Z=A'[1]\) gives \(\sigma:A'[1]\to C\) with
\(v'\sigma=1\). The map \((j',\sigma):B'\oplus A'[1]\to C\)
induces a bijection on every \(\operatorname{Hom}(Z,-)\): subtract
\(\sigma v'c\) from a map \(c:Z\to C\) for surjectivity, and
apply \(v'\) followed by injectivity of \(j'_*\) for injectivity.
These bijections imply it is an isomorphism. Explicitly, taking
\(Z=C\) gives a right inverse; injectivity at
\(Z=B'\oplus A'[1]\) gives the other inverse identity. This proves
the cone calculation without a triangulated structure on the completion.

**Two cones.** Choose \(C=\operatorname{Cone}(1-\epsilon:L\to L)\)
in \(\mathcal T\). The decomposition
\(L=(L,1-\epsilon)\oplus U\) makes \(1-\epsilon\) identity on
the first summand and zero on the second. The calculation gives
\(C\simeq U\oplus U[1]\). In these coordinates define
\[
 C[1]\simeq U[1]\oplus U[2]
 \xrightarrow{\left(\begin{smallmatrix}0&0\\1&0\end{smallmatrix}\right)}
 U\oplus U[1]\simeq C.
\]
This is a morphism between objects of \(\mathcal T\) by fullness.
Take its cone \(V_0\) in \(\mathcal T\). The identity component
is \(U[1]\), the source complement is \(U[2]\), and the target
complement is \(U\). Thus \(V_0\simeq U\oplus U[3]\).

The defining triangle relations in \(K_0(\mathcal T)\) give
\[
 [C]=[L]-[L]=0,\qquad
 [V_0]=[C]-[C[1]]=2[C]=0.
\]
Here \([C[1]]=-[C]\) follows from the triangle
\(C\to0\to C[1]\to C[1]\). Any other representative of the
same formal object is isomorphic to \(V_0\) already in
\(\mathcal T\), since the fully faithful inclusion reflects
isomorphisms. Its class is therefore also zero. No claim about
injectivity of a map on Grothendieck groups has entered the argument.

**The selection action.** Suppose now that \(e\in R\) is a central
idempotent and \(\alpha:R\to R\) is a unital \(k\)-algebra
endomorphism. On \(U=(E_0,\theta(e))\), define
\[
 r\longmapsto\theta(e\alpha(r)e).
\]
The value lies in the required corner. Centrality gives
\[
 (e\alpha(r)e)(e\alpha(t)e)=e\alpha(rt)e,
 \qquad e\alpha(1)e=e.
\]
Thus this is a unital action, with identity \(\theta(e)=1_U\).
Act diagonally on \(U\oplus U[3]\), and transport this action to
\(V_0\). Put \(V_0\) at each vertex, use identities for \(s,s'\),
and the action of \(x_h\) for \(a_h,a'_h\). The defining relations
of \(B\) hold by the \(R\)-action, so this is a \(B\)-diagram
in \(\mathcal Q\).

Idempotents split in \(D^b(k\text{-mod})\): choose complements to
boundaries inside cycles and complements to cycles in each term of a
bounded vector-space complex. Its contractible summands split off,
leaving its cohomology with zero differential. Maps between graded
vector spaces in this derived category have only degree-preserving
components, and each degreewise idempotent has its image as a
summand. Evaluation therefore extends to the additive completion by
taking images of evaluated idempotents. It takes \(U\) to \(eY\)
and the action just defined to \(\alpha(r)|_{eY}\). Thus the
\(B\)-diagram evaluates to
\[
 eY\oplus eY[3]
\]
at each vertex, with identities on \(s,s'\) and \(\alpha(x_h)\)
on each summand of the other arrows. This is the vertex diagram
associated with \(M(HY)\oplus M(HY)[3]\), where
\(H(Y)={}_{\alpha}(eY)\).

**Source comparison.** Section 03, lines 190–284, has the same two
cones, a correct representable-sequence proof, and the correct action.
The \(K_0(\mathcal Q)\) calculation above is additional. The
Balmer–Schlichting theorem mentioned as context in the source is not
used here; its locator was not checked. “Only exists in the completion”
must not be read as universal failure of descent: \(e=0\) gives
\(U=0\), and \(e=1\) gives \(U=E_0\). The preprint's qualified
wording (“need not split”) does not make that stronger assertion.

category, the transported action and its evaluations have direct proofs.

## 6.4. Lifting a finite diagram and the uncontrolled length

**Statement.** Let \(B\) be the algebra of §6.1 and let
\(q:\mathcal K\to\mathcal Q\) be the quotient of §6.2. Every
\(B\)-diagram in \(\mathcal Q\) is isomorphic to the image of a
\(B\)-diagram in \(\mathcal K\). Here a diagram consists of three
objects and one morphism for each arrow, satisfying all relations as
morphism identities in the indicated category. In particular, for
the diagram of §6.3 there are bounded complexes \(D_i\) of finitely
generated projective right \(B\)-modules, chain maps
\(f_a:D_i\to D_j\) for every \(a:i\to j\), and degree \(-1\)
right-linear maps \(h_\rho:D_0\to D_2\) such that
\[
 d_{D_2}h_\rho+h_\rho d_{D_0}
       =f_\rho:=\sum_{b,a}\rho_{ba}f_bf_a.
 \tag{6.4.1}
\]
All these data are independent of \(Y\). For every finite-dimensional
left \(R\)-module \(Y\), their evaluated diagram is the diagram
of §6.3 on \(eY\oplus eY[3]\).

**Proof.** Denote the prescribed objects by \(W_i\) and arrows by
\(t_a\). Choose \(C_i\in\mathcal K\) and isomorphisms
\(\psi_i:qC_i\to W_i\). First apply §2.3(1) to the finite
family
\[
 \psi_2^{-1}t_b\psi_1:qC_1\longrightarrow qC_2,
 \qquad b\in\mathcal A_{12}.
\]
Obtain a common denominator \(u_1:D_1\to C_1\) and maps
\(f_b:D_1\to C_2\). Put \(D_2=C_2\),
\(\phi_1=\psi_1q(u_1)\), and \(\phi_2=\psi_2\). Then
\(\phi_2q(f_b)=t_b\phi_1\).

Next apply §2.3(1) to
\[
 \phi_1^{-1}t_a\psi_0:qC_0\longrightarrow qD_1,
 \qquad a\in\mathcal A_{01}.
\]
Obtain \(u_0:D_0\to C_0\) in \(\mathcal W\) and
\(f_a:D_0\to D_1\), and put \(\phi_0=\psi_0q(u_0)\).
For every arrow, we now have
\[
 \phi_jq(f_a)=t_a\phi_i. \tag{6.4.2}
\]
For every basis relation let
\(g_\rho=\sum_{b,a}\rho_{ba}f_bf_a:D_0\to D_2\) in
\(\mathcal K\). Equation (6.4.2) gives
\[
 \phi_2q(g_\rho)
 =\Bigl(\sum_{b,a}\rho_{ba}t_bt_a\Bigr)\phi_0=0.
\]
Since \(\phi_2\) is invertible, \(q(g_\rho)=0\).
By §2.3(2), choose one \(v:D'_0\to D_0\) in
\(\mathcal W\) annihilating every \(g_\rho\). Replace
\(D_0,f_a,\phi_0\), for source-zero arrows, by
\(D'_0,f_av,\phi_0q(v)\). Equations (6.4.2) remain valid, and
\[
 \sum_{b,a}\rho_{ba}f_b(f_av)=g_\rho v=0
 \quad\text{in }\mathcal K.
\]
All relations now hold. There are no incoming arrows at zero, and
all relation paths end at two. Thus these replacements impose no
additional arrow or relation compatibility. The \(\phi_i\) form
an isomorphism of the entire diagrams in \(\mathcal Q\).

Choose bounded complex representatives for the new objects and chain
map representatives for their arrows. A relation zero in the homotopy
category is, by its definition, null-homotopic. Choose one homotopy
for each \(\rho\in\mathcal R\); it satisfies (6.4.1), with a
plus sign because the homotopy has degree \(-1\). There are finitely
many choices, all made from the fixed quotient diagram. Applying
\(\operatorname{ev}_Y\) to (6.4.2) proves the evaluated-diagram
assertion for every \(Y\) at once.

**Choices and length.** Quadraticisation is a finite substitution
procedure. Choosing a relation basis is finite-dimensional linear
algebra. Choosing cones of specified chain maps also has an explicit
formula once those maps are supplied. The proof becomes existential
at the following points: it chooses the splitting maps from the exact
Hom sequences in §6.3, represents the resulting quotient morphisms by
roofs, chooses common Ore refinements, and chooses a denominator that
annihilates the relation errors. None of these steps in the proof
specifies matrices for the required roofs or bounds the support of
their source complexes. A statement that a cone belongs to the thick
subcategory does not, by itself, specify a bounded number of cone,
shift, and retract operations witnessing that membership.

After chain representatives are fixed, choosing the relation homotopies
amounts to solving finite linear equations in the finite-dimensional
spaces of graded maps. Rectification in §6.5 is then explicit. Choose \(a\leq0\leq b\)
containing the supports of all
\(D_i\). That construction then has support
in \([a-2,b]\). Thus a support width \(l=b-a+2\) is available
*from supplied representatives*. The present argument gives neither
such representatives for the main example nor an a priori numerical
bound on \(b-a\). The later simulation therefore receives an
unspecified finite \(l\). This is absence of a bound or algorithm in
this argument; no impossibility theorem about computing or bounding
\(l\) is asserted. In particular, the fact that choices are
noncanonical alone would not imply noncomputability.

**Source comparison.** Section 03, lines 337–444, follows precisely
the same terminal-to-initial order, and its replacement at vertex zero
preserves all previously obtained squares. Its chain-level conclusion
correctly asserts relations up to specified homotopy. No error was
found. The preceding paragraph isolates what the existential proof
does and does not control; it adds no effectiveness claim to the source.

from the fraction facts; a numerical length bound for the main example
remains **open in this dossier**.

## 6.5. Rectification to a three-column complex

**Statement.** More generally, let \(B=kQ/(J_2)\), where \(Q\)
has vertices \(0,1,2\), finite arrow sets \(\mathcal A_{01}\) and
\(\mathcal A_{12}\), and no other arrows; let \(J_2\) be a
subspace of the free length-two path space, with basis
\(\mathcal R\). Suppose given bounded complexes \(D_i\) of
finitely generated projective right \(B\)-modules, right-linear
chain maps \(f_a:D_i\to D_j\) for arrows \(a:i\to j\), and
right-linear degree \(-1\) maps \(h_\rho\) satisfying (6.4.1).
There is a bounded complex \(P\) of finite-dimensional
\(B\)-bimodules, projective termwise on the right, with homotopy
equivalences of right-module complexes
\[
 \iota_i:D_i\longrightarrow\mathbf e_iP
\]
and homotopies \(a\iota_i\simeq\iota_jf_a\) for every arrow.
No compatibility among the \(h_\rho\) beyond (6.4.1) is required.

**Construction.** All tensor products in this paragraph are over
\(k\). Form unshifted complexes
\[
 L_0=\bigoplus_i B\mathbf e_i\otimes D_i,
 \quad L_1=\bigoplus_{a:i\to j}B\mathbf e_j\otimes D_i,
 \quad L_2=\bigoplus_{\rho\in\mathcal R}B\mathbf e_2\otimes D_0,
\]
with internal differentials \(d_0,d_1,d_2\) acting on the second
factor. The first factor carries the left \(B\)-action, the second
its right action. Define the unshifted degree-zero maps
\(\partial_1:L_1\to L_0\), \(\partial_2:L_2\to L_1\), and
degree \(-1\) map \(\eta:L_2\to L_0\) by
\[
 \begin{aligned}
 \partial_1(c\otimes v)_a
   &=(ca\otimes v)_i-(c\otimes f_a v)_j, && a:i\to j,\\
 \partial_2(c\otimes v)_\rho
   &=\sum_{b,a}\rho_{ba}
          \bigl((cb\otimes v)_a+(c\otimes f_a v)_b\bigr),\\
 \eta(c\otimes v)_\rho&=(c\otimes h_\rho v)_2.
 \end{aligned} \tag{6.5.1}
\]
The subscripts identify summands in the relevant column. These maps
are bimodule-linear because path multiplication acts on the first
factor and \(f_a,h_\rho\) are right-linear on the second. The
chain-map identities for \(f_a\) give
\(d_0\partial_1=\partial_1d_1\) and
\(d_1\partial_2=\partial_2d_2\).

Every term in the horizontal composite is accounted for by
\[
 \begin{aligned}
 \partial_1\partial_2(c\otimes v)_\rho
 =\sum_{b,a}\rho_{ba}\bigl(
 &(cba\otimes v)_0-(cb\otimes f_av)_1\\
 &+(cb\otimes f_av)_1-(c\otimes f_bf_av)_2\bigr)
 =-(c\otimes f_\rho v)_2.
 \end{aligned}
\]
The middle terms cancel and the vertex-zero term is zero because
\(\rho=0\) in \(B\). Equation (6.4.1) now says
\[
 d_0\eta+\eta d_2=-\partial_1\partial_2. \tag{6.5.2}
\]
Set
\[
 P=L_0\oplus L_1[1]\oplus L_2[2],\qquad
 d_P=\begin{pmatrix}
 d_0&\partial_1&\eta\\
 0&-d_1&\partial_2\\
 0&0&d_2
 \end{pmatrix}. \tag{6.5.3}
\]
In total degree \(n\), the column degrees are \(n,n+1,n+2\).
Hence \(\partial_1,\partial_2\) and \(\eta\) all have total
degree one, including \(\eta\), which decreases the internal
degree by one and the column index by two. The diagonal signs
\(+,-,+\) are precisely the cohomological shift signs. All
potentially nonzero entries of the square are
\[
 d_0^2, d_1^2, d_2^2,\quad
 d_0\partial_1-\partial_1d_1,\quad
 -d_1\partial_2+\partial_2d_2,\quad
 d_0\eta+\partial_1\partial_2+\eta d_2.
\]
Each is zero by the preceding identities. This proves \(d_P^2=0\)
in every degree, in every characteristic.

There are finitely many summands and each \(D_i\) is bounded.
Every \(B\mathbf e_j\otimes_kD_i^n\), as a right module, is a
finite direct sum of copies of the projective module \(D_i^n\).
This gives all asserted boundedness, finiteness, and right projectivity.

**Vertex equivalences.** Define
\[
 \iota_i(v)=(\mathbf e_i\otimes v)_i\in\mathbf e_iL_0.
\]
It is a chain map and a degreewise split right-linear injection.
For fixed \(i\), filter \(\mathbf e_iP\) decreasingly by the
source index \(j\) of its second tensor factor \(D_j\):
\(F^r\) consists of summands with \(j\geq r\), for
\(r=0,1,2,3\). Internal differentials and path-multiplication
terms preserve \(j\). The \(f_a\) terms increase it, and
\(\eta\) increases it from zero to two. These are therefore
subcomplexes, and the quotient
\(C_i=\mathbf e_iP/\iota_i(D_i)\) inherits the filtration.

The piece indexed by \(j=i\) disappears in this quotient: the
only such term in \(\mathbf e_iP\) is
\(\mathbf e_i\otimes D_i\). Pieces with \(j>i\) vanish since
there are no paths from \(j\) to \(i\). For adjacent indices
\((j,i)=(0,1),(1,2)\), the remaining piece is the total complex
of \(D_j\) tensored with
\[
 0\longrightarrow k\{a:j\to i\}
   \xrightarrow{a\mapsto a}\mathbf e_iB\mathbf e_j
   \longrightarrow0
\]
in horizontal degrees \(-1,0\). This map is an isomorphism because
all relations have length two. For \((j,i)=(0,2)\), it is the
total tensor with
\[
 0\longrightarrow k\mathcal R
  \xrightarrow{\rho\mapsto\sum\rho_{ba}(b,a)}
 k\{(b,a)\}
  \xrightarrow{(b,a)\mapsto ba}\mathbf e_2B\mathbf e_0
 \longrightarrow0, \tag{6.5.4}
\]
in horizontal degrees \(-2,-1,0\). This is exact: the relation
basis gives an injection, its image is exactly \(J_2\), and the
last space is the free path space modulo \(J_2\), as explained
in §6.1. This is the point where a basis, rather than a redundant
list of relations, is necessary.

Each displayed exact vector-space complex \(K\) is contractible.
To construct a contraction, choose a complement to its boundaries
in each degree. Its differential identifies that complement with the
boundaries in the next degree; use the inverse there and zero on the
complement. If \(s\) is this degree \(-1\) contraction, then
\(s\otimes1\) contracts the total complex \(K\otimes D_j\).
Indeed, on horizontal degree \(p\) the total differential is
\(\partial_K\otimes1+(-1)^p1\otimes d_{D_j}\). The two internal
terms in its anticommutator with \(s\otimes1\) have signs
\((-1)^{p-1}\) and \((-1)^p\) and cancel, while the horizontal
terms sum to the identity. This agrees with (6.5.3).

Thus all associated graded pieces of \(C_i\) are acyclic. In a
short exact sequence of complexes with acyclic subcomplex and quotient,
a cycle in the middle maps to a boundary in the quotient; subtract
the differential of a lift, then fill the remaining cycle in the
subcomplex. Induction through this finite filtration makes \(C_i\)
acyclic. Its terms are projective right modules, since the inclusion
\(\iota_i\) splits degreewise. A bounded acyclic complex of
projectives is contractible: at its last nonzero degree, split the
surjection onto that projective term; its kernel is projective, so
repeat in descending degrees. This writes the complex as a finite
sum of contractible two-term identity complexes.

For an explicit passage to homotopy equivalence, choose a graded
splitting \(\mathbf e_iP=D_i\oplus C_i\), giving differential
\[
 \begin{pmatrix}d_D&t\\0&d_C\end{pmatrix},\qquad
 d_Dt+td_C=0.
\]
Choose a right-linear contraction \(s\) of \(C_i\). Put
\[
 r(x,c)=x-tsc,\qquad K(x,c)=(0,sc).
\]
Using \(d_Cs+sd_C=1\), we get
\(d_Dr=r d_P\), \(r\iota_i=1\), and
\[
 (d_PK+Kd_P)(x,c)=(tsc,c)=(1-\iota_i r)(x,c).
\]
Thus \(r\) is a chain homotopy inverse of \(\iota_i\).

**Arrow homotopies.** For \(a:i\to j\), set
\[
 H_a(v)=(\mathbf e_j\otimes v)_a
          \in\mathbf e_jL_1[1].
\]
This is right-linear and has degree \(-1\). The column-one
component of \(d_PH_a\) is \(-\mathbf e_j\otimes d_{D_i}v\),
which cancels \(H_ad_{D_i}\). The column-zero component is
\[
 \partial_1(\mathbf e_j\otimes v)_a
  =(a\otimes v)_i-(\mathbf e_j\otimes f_av)_j.
\]
There are no other components, so
\[
 d_PH_a+H_ad_{D_i}=a\iota_i-\iota_jf_a. \tag{6.5.5}
\]
This completes the asserted chain-level data. Every relation starts
at zero and ends at two, and cannot meet a further nonidentity path.
The three off-diagonal square equations above exhaust the coherence
conditions for this construction.

**Source comparison and computation.** Section 04, lines 36–224,
has the same construction and signs; its lines 226–233 explain the
absence of additional coherences. The names \(\partial_1,\partial_2\)
here replace the source's \(p,q\) to distinguish them from the
quotient functor. The filtration proof is expanded with a tensor
contraction and a homotopy inverse. No source error was found.

The script `computations/D-B-rectification-check.py`, with saved
output `computations/D-B-rectification-check.out`, uses exact rational
arithmetic for
\(B=\mathbb Q(0\xrightarrow a1\xrightarrow b2)/(ba)\), and
\(D_i=(B\oplus B\xrightarrow{(1,0)}B)\) in degrees zero and one.
It takes \(f_a=1\), \(f_b\) the projection onto the contractible
summand, and \(h_{ba}\) its contraction. It checks every differential
square, both arrow homotopies, and the induced cohomology isomorphisms
for all three inclusions in this example. Omitting \(\eta\) yields
nonzero squares in two degrees. This is one finite example; the
all-degrees, arbitrary-input argument is (6.5.1)–(6.5.5).

the computation supplies a separate finite check of its signs.

## 6.6. Realisation and iterates

**Statement.** Let \(k\) be a field, \(R\) a finitely presented
unital \(k\)-algebra, \(e\in R\) a central idempotent, and
\(\alpha:R\to R\) a unital \(k\)-algebra endomorphism. With
\(B,M\) as in §6.1 and \(H(Y)={}_{\alpha}(eY)\), there is a
single bounded complex \(P\) of finite-dimensional \(B\)-bimodules,
termwise projective on the right, such that
\[
 P\otimes_B^{\mathbf L}M(Y)
   \simeq M(HY)\oplus M(HY)[3]
       \quad\text{in }D^b(B\text{-mod}) \tag{6.6.1}
\]
for every finite-dimensional left \(R\)-module \(Y\).
All choices defining \(P\) precede the choice of \(Y\). Writing
\(\mathcal F=P\otimes_B^{\mathbf L}-\), for every integer
\(j\geq0\) there is an isomorphism
\[
 \mathcal F^j M(Y)\simeq
 \bigoplus_{r=0}^j
 \bigl(M(H^{\circ j}Y)[3r]\bigr)^{\oplus\binom jr}.
 \tag{6.6.2}
\]
Here \(\mathcal F\) is a local name for the complex-tensor functor;
the report reserves \(\Phi\) for the ordinary-bimodule functor
in the later simulation. No assertion of natural choices of the
isomorphisms in (6.6.1) is needed for (6.6.2).

**Proof.** Take the chain data of §6.4 and apply §6.5 once. Bounded
right projectivity permits ordinary tensor to compute derived tensor.
Tensoring the identities for \(\iota_i\), their homotopy inverses,
and the arrow homotopies preserves all those identities: they are
identities of right-linear maps. For
\(T_Y=P\otimes_B^{\mathbf L}M(Y)\), it follows that its vertex
complexes and arrows, viewed in \(D^b(k\text{-mod})\), form the
evaluated diagram of §6.3. Taking cohomology gives isomorphisms of
left \(B\)-modules, including all arrow actions,
\[
 H^n(T_Y)\simeq
 \begin{cases}
 M(HY),&n=0,-3,\\
 0,&n\notin\{0,-3\}.
 \end{cases} \tag{6.6.3}
\]
The identification is as modules because (6.5.5) makes the vertex
cohomology identifications commute with each arrow, and the arrows
and vertex idempotents generate \(B\).

Put \(A_{-3}=H^{-3}(T_Y)\) and \(A_0=H^0(T_Y)\). The truncation
triangle is
\[
 A_{-3}[3]\longrightarrow T_Y\longrightarrow A_0
     \xrightarrow{\delta} A_{-3}[4]. \tag{6.6.4}
\]
One chain-level construction of this triangle is as follows. Replace a
bounded representative of \(T_Y\) by its good truncation in degrees
\([-3,0]\): use the quotient by boundaries in degree \(-3\) and
the cycles in degree zero. The maps to and from this truncation are
quasi-isomorphisms by (6.6.3). Its degree \(-3\) kernel is
\(A_{-3}\); inclusion gives a subcomplex \(A_{-3}[3]\).
The quotient complex has only \(H^0=A_0\) and maps
quasi-isomorphically to \(A_0\) by its cohomology projection.
The triangle of this short exact sequence of complexes is (6.6.4).

Since \(\operatorname{gldim}B\leq2\), choose a projective
resolution of \(A_0\) concentrated in degrees \(-2,-1,0\).
Its Hom complex with \(A_{-3}\) has no degree-four term, so
\[
 \operatorname{Hom}_{D^b(B)}(A_0,A_{-3}[4])
      =\operatorname{Ext}^4_B(A_0,A_{-3})=0.
\]
Thus \(\delta=0\). Applying \(\operatorname{Hom}(A_0,-)\)
to (6.6.4) lifts \(1_{A_0}\) to a section \(s:A_0\to T_Y\)
of its middle map. The sum of \(s\) and the first map of the
triangle yields
\(A_{-3}[3]\oplus A_0\to T_Y\), which induces an isomorphism
in every cohomological degree by (6.6.3) and the long exact sequence
of (6.6.4). Its cone is acyclic, so it is an isomorphism in the
derived category. This is (6.6.1).

For \(j=0\), formula (6.6.2) has just the summand \(M(Y)\).
Assume it for \(j\). The functor \(\mathcal F\) preserves finite
sums and shifts. Apply (6.6.1) to \(H^{\circ j}Y\), which is
finite dimensional because taking \(e\)-images and restricting
scalars preserve finite dimensionality. Each summand of shift \(3r\)
splits into shifts \(3r\) and \(3(r+1)\) of
\(M(H^{\circ(j+1)}Y)\). The multiplicity of shift \(3r\) is
\(\binom jr+\binom j{r-1}=\binom{j+1}r\), with coefficients
outside \(0,\ldots,j\) taken as zero. This proves the induction.
Choices of splitting at the finitely many objects in each induction
are sufficient; a natural family is not required.

**Source comparison.** Section 04, lines 235–303, uses this
cohomology argument and the same degree-four extension obstruction.
The shift \([3]\) places the second cohomology module in degree
\(-3\), not degree \(3\); the source uses this correctly.
[verdict omitted]. The chain description of the truncation triangle
and the section argument expand steps left implicit there.

all choices independent of \(Y\) where asserted.

## 5.3. Generalised selection data

**Statement.** Let \(k\) be a field, let \(R\) be a finitely
presented unital \(k\)-algebra, and let \(\Psi\) be an
\(R\)-bimodule whose two scalar actions of \(k\) agree. Suppose
that \(\Psi_R\) is finitely generated projective. Then the
realisation theorem and iterate formula of §6.6 hold with
\[
 H=\Psi\otimes_R-.
\]
Equivalently, choose a finite integer \(n\geq1\), an idempotent
\(\varepsilon\in M_n(R)\), and a unital \(k\)-algebra map
\[
 \rho:R\longrightarrow\varepsilon M_n(R)\varepsilon,
 \qquad \rho(1)=\varepsilon,
\]
and give the right column module \(\varepsilon R^n\) its left
\(R\)-action through \(\rho\). There is a bounded right-projective
complex \(P\) of finite-dimensional \(B\)-bimodules, fixed before
\(Y\), such that
\[
 P\otimes_B^{\mathbf L}M(Y)
      \simeq M(\Psi\otimes_RY)\oplus M(\Psi\otimes_RY)[3]
\]
for every finite-dimensional left \(R\)-module \(Y\), with iterates
as in (6.6.2). The encoding algebra \(B\) depends on the chosen
presentation of \(R\), not on \(n\).

**Matrix description.** Choose a split surjection \(p:R^n\to\Psi\)
of right modules and a section \(s\). The right-linear map
\(\varepsilon=sp\) is idempotent and identifies
\(\Psi_R\) with \(\varepsilon R^n\). An endomorphism of a
right free column module is left multiplication by a matrix with
entries in \(R\); composition is usual matrix multiplication in
its stated order. Extending a map of \(\varepsilon R^n\) by zero
on \((1-\varepsilon)R^n\) consequently gives
\[
 \operatorname{End}_{R^{\mathrm{op}}}(\varepsilon R^n)
           =\varepsilon M_n(R)\varepsilon.
\]
The left \(R\)-action transfers to \(\rho\) with unit
\(\varepsilon\). Its \(k\)-linearity is exactly the agreement of
the two scalar actions. Conversely, such a \(\rho\) makes
\(\varepsilon R^n\) a bimodule with these properties. The zero
bimodule is allowed, for example with \(n=1,\varepsilon=0\).

The identification \(R^n\otimes_RY\simeq Y^n\) sends
\((r_i)_i\otimes y\) to \((r_i y)_i\). Let
\(\varepsilon_Y\) denote the matrix operator whose entries act on
\(Y\). Restricting the preceding identification to the direct
summand gives
\[
 HY\simeq\varepsilon_Y(Y^n),\qquad
 r\text{ acts by }\rho(r)_Y. \tag{5.3.1}
\]
The identity \(\rho(r)=\varepsilon\rho(r)\varepsilon\) ensures
this action is supported on that image. In particular,
\(\dim_k HY\leq n\dim_k Y\). Tensor with \(\Psi_R\) is a
direct summand of tensor with \(R^n\), so it is exact. Thus all
finite iterates of \(H\) remain finite dimensional.

**Formal summand and action.** Apply \(\theta\) entrywise to obtain
\[
 \theta_n:M_n(R)\longrightarrow
          \operatorname{End}_{\mathcal Q}(E_0^{\oplus n}),
 \qquad
 U=(E_0^{\oplus n},\theta_n(\varepsilon))
          \in\operatorname{Kar}(\mathcal Q).
\]
The endomorphism matrices on a direct sum compose by ordinary matrix
multiplication, so \(\theta_n\) is an algebra map. The maps
\(\theta_n(\rho(r))\) lie in the corner defining
\(\operatorname{End}(U)\); their products respect multiplication
in \(R\), and their unit is \(\theta_n(\varepsilon)=1_U\).
Evaluation sends the object and action to precisely (5.3.1).

Apply §6.3 to choose a representative \(V_0\) of
\(U\oplus U[3]\) in \(\mathcal Q\), transport the diagonal
\(R\)-action to it, and place \(V_0\) at all three vertices.
Set \(s,s'\) equal to identities and use the action of \(x_h\)
for the other arrows. The \(k\)-algebra action makes the
homogenised relations vanish, so this is a \(B\)-diagram. At
\(Y\) it evaluates to the diagram with \(HY\oplus HY[3]\)
and its full \(R\)-action. The same two actual cone triangles
give \([V_0]=0\) in \(K_0(\mathcal Q)\), now starting with
\(E_0^{\oplus n}\) instead of \(E_0\).

**Remaining steps.** The statement of §6.4 accepts an arbitrary
\(B\)-diagram in \(\mathcal Q\), and §6.5 accepts its lifted
complexes, arrows, and relation homotopies. Neither assumes a central
idempotent in \(R\) or an endomorphism of \(R\). Apply them to
this single diagram. Its tensor evaluation has cohomology
\(M(HY)\) in degrees zero and \(-3\) with all arrow actions,
by the same argument as (6.6.3). The extension obstruction in
\(\operatorname{Ext}_B^4\) vanishes by §6.1, so the written
splitting argument in §6.6 gives the claimed realisation.
Finite dimensionality in (5.3.1) makes the induction for (6.6.2)
apply without further change.

**What “verbatim” permits.** The formal object and action must be
replaced by their matrix versions. After that substitution, the
lifting, rectification, splitting, and iterate proofs use exactly
the same inputs and equations. No centrality of \(\varepsilon\),
left projectivity of \(\Psi\), or injectivity or surjectivity of
\(\rho\) is needed. The original case is recovered with
\(n=1\), \(\varepsilon=e\), and \(\rho(r)=e\alpha(r)e\).
For a noncentral idempotent \(e\), one can instead start with a
unital \(k\)-algebra map \(R\to eRe\), whose unit condition is
\(1\mapsto e\); the operator \(r\) on \(eY\) is then this
corner-valued image, without invoking restriction along an
endomorphism \(R\to R\).

Finite presentation of \(R\) is needed here to form the finite
encoding quiver with finitely many relations. Finite right
projectivity of \(\Psi\) supplies the finite matrix idempotent.
Without these hypotheses this proof does not apply; it does not
assert that a different construction is impossible. If \(\rho\)
is meant only as a ring homomorphism, \(k\)-linearity must be
added: otherwise \(\rho(\lambda 1_R)\) need not be
\(\lambda\varepsilon\), so the proposed action is not an action
of \(R\) as a \(k\)-algebra in the \(k\)-linear quotient.

**Source comparison and later scope.** This completes the sketch in
Remark O.3', `notes/02-constraints-and-criteria.md:72–77`; it is an
extension of the preprint rather than a claim made there. The only
changes to section 03 are its lines 252–284, defining the summand,
action, and evaluated diagram. Section 04, lines 36–224 and 235–303,
uses exactly the resulting chain data and cohomology pattern. No
failure of these interfaces was found. The resulting \(P\) has
precisely the input properties of the subsequent ordinary-bimodule
simulation. The simulation and finitistic-dimension conclusions
remain dependencies assigned to D-A; this dossier does not recheck
their proofs.

the displayed hypotheses, with the matrix substitutions just specified.

## Final result record and review scope

| Report result | Status | Basis |
|---|---|---|
| 2.3 | [status omitted] | Triangle proofs of Ore and cancellation; cited fraction construction; direct finite-family deductions |
| 6.1 | [status omitted] | Explicit presentation equivalence, directed resolutions on both sides, and module construction |
| 6.2 | [status omitted] | Multiplication-order calculation and evaluation on the quotient |
| 6.3 | [status omitted] | Two cones in the original category, formal Hom calculation, and its actual triangle relations in \(K_0\) |
| 6.4 | [status omitted] | Three finite denominator steps and chosen chain homotopies; no numerical bound on their supports |
| 6.5 | [status omitted] | Full differential-square calculation, filtered vertex comparison, explicit inverses and arrow homotopies |
| 6.6 | [status omitted] | Cohomology as \(B\)-modules, vanishing of the degree-four obstruction, and binomial induction |
| 5.3 | [status omitted] | Finite matrix idempotent, corner-valued \(k\)-algebra action, and applications of 6.2–6.6 |

No unresolved mathematical GAP remains in these written proofs. The
numerical length of the complex for the particular main-preprint
selection data is not obtained. The highest-risk steps for subsequent
author review are the formal cone splitting in §6.3, the common
denominator use in §6.4, and the filtered comparison in §6.5.

The independent attempt and adversarial rereading are recorded in
computations/D-B-fresh-attempt-review.md, with their chronology and the
hash of the inspected proof text. The reviewer found no substantive
mathematical error or gap in the assigned results. It found two
LaTeX-escape defects in this dossier, which were corrected. This is an
AI review, not human certification. No independence of model identity
is asserted.

The root agent read and reran computations/D-B-rectification-check.py;
its output agreed with computations/D-B-rectification-check.out.
Its scope is the single rational example stated in §6.5. No Lean
formalisation, manuscript compilation, group-construction check, or
simulation proof was performed in this job. The preprint comparison,
source hashes, citation coverage and limitations are recorded in
audit/D-B-preprint-issues.md.
