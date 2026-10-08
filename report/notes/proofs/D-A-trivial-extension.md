Model: unknown; effort: unknown.

# D-A: trivial extensions, simulation and the main theorem

AI-written proof dossier, 2026-10-08. Conventions and numbering follow
`audit/report-notation.md` and `report/notes/outline.md`. This is a new
research note, not a revision of the preprint. The actual model identifier
and effort setting are not available to this session; the task's requested
model is not used to infer them.

## Reading order and scope

The arguments under each result were attempted before reading its proof
in the main preprint. The independent attempts and the subsequent source
comparisons are distinguished below. Results 6.1 and 6.6 of D-B are
explicit black-box inputs; this note does not re-examine their proofs.
The main theorem is consequently an implication from selection and
realisation, not an independent validation of those inputs.

The algebras \(\Delta\), \(A\), \(B\), \(B_1\) and \(K_l\) are
finite-dimensional over a field \(k\); the selection algebra \(R\) in 7.2
need not be finite-dimensional (repair after V-A). Modules are finite-dimensional left modules. Write
\(C[s]^n=C^{n+s}\) and \(d_{C[s]}=(-1)^s d_C\). Tensor differentials are
\(d(u\otimes v)=du\otimes v+(-1)^{|u|}u\otimes dv\).
The zero object has projective dimension \(-\infty\).

## 4.1. The derived bar decomposition

### Statement

Let \(\Delta\) be a finite-dimensional \(k\)-algebra, let \(X\) be a
finite-dimensional \(\Delta\)-bimodule, and set
\[
 A=\Delta\ltimes X,
 \qquad (d,x)(d',x')=(dd',dx'+xd'),
 \qquad \Phi=X\otimes_\Delta^{\mathbf L}-.
\]
For a finite-dimensional left \(\Delta\)-module \(N\), give \(N\) its
inflated \(A\)-action through \(A\twoheadrightarrow\Delta\). There is
an isomorphism in \(D^-(\Delta\text{-Mod})\), natural in \(N\),
\[
 \Delta\otimes_A^{\mathbf L}N
 \simeq \bigoplus_{r\geq0}\Phi^rN[r],
 \qquad \Phi^0N=N.                                      \tag{4.1}
\]
Neither side of \(X\) is assumed flat. Finite global dimension of
\(\Delta\) is not needed here.

### Independent attempt, recorded before consulting the preprint

The ordinary relative bar complex cannot simply be declared a projective
resolution when \(X\) is not flat. Replace \(X\) by a non-positive
projective bimodule resolution \(Q\), form the dg algebra
\(\widetilde A=\Delta\ltimes Q\), and resolve an inflated module over
\(\widetilde A\) by the relative bar construction. Its only non-zero
bar face multiplies the leading factor by the first ideal factor.
The dg algebra map \(\widetilde A\to A\) is a quasi-isomorphism.
A length filtration should show that base change of the bar resolution
along this map still resolves \(N\). After tensoring with \(\Delta\),
the remaining face vanishes and the length summands split.

### Proof with the signs specified

Choose a resolution \(Q\to X\) by finite projective
\(\Delta\otimes_k\Delta^{\mathrm{op}}\)-modules, with \(Q^j=0\)
for \(j>0\), and a projective resolution \(E\to N\) over \(\Delta\)
with the same degree convention. These resolutions may be unbounded to
the left. Put \(\widetilde A=\Delta\oplus Q\), with \(Q^2=0\) and
the differential induced from \(Q\). Multiplication uses the
\(\Delta\)-bimodule structure; the dg Leibniz rule holds because every
product of two elements of \(Q\), including their differentials, is zero.
The augmentation \(f:\widetilde A\to A\) is a quasi-isomorphism.

For \(r\geq0\), put
\[
 T_r=\widetilde A\otimes_\Delta Q^{\otimes_\Delta r}
             \otimes_\Delta E,
 \qquad \mathcal B=\bigoplus_{r\geq0}T_r[r].
\]
Write \(s^rv\) for an element of \(T_r[r]\); it has degree
\(|v|-r\). The shifted left action is
\(a\cdot s^rv=(-1)^{r|a|}s^r(av)\). On homogeneous tensors the
unshifted internal differential is
\[
\begin{aligned}
 d_{\mathrm{int}}(a\otimes q_1\otimes\cdots\otimes q_r\otimes v)
 &= da\otimes q_1\otimes\cdots\otimes q_r\otimes v\\
 &\quad+\sum_{j=1}^r(-1)^{|a|+\sum_{i<j}|q_i|}
 a\otimes q_1\otimes\cdots\otimes dq_j\otimes\cdots
       \otimes q_r\otimes v\\
 &\quad+(-1)^{|a|+\sum_{i=1}^r|q_i|}
 a\otimes q_1\otimes\cdots\otimes q_r\otimes dv.
\end{aligned}
\]
Define the degree-one bar differential by
\[
 b(s^r(a\otimes q_1\otimes\cdots\otimes q_r\otimes v))
 =s^{r-1}(aq_1\otimes q_2\otimes\cdots\otimes q_r\otimes v)
 \quad(r>0),
\]
and set \(b=0\) on \(T_0\). The full differential is
\[
 D(s^rw)=(-1)^rs^r d_{\mathrm{int}}w+b(s^rw).       \tag{4.1a}
\]
This is a convention in which the shift is applied to the entire length
summand, rather than to the individual ideal factors. In this convention
there is no additional sign in \(b\).

Multiplication \(T_r\to T_{r-1}\) is a chain map for the unshifted
internal differentials. The mixed terms in \(D^2\) therefore have
coefficients \((-1)^r+(-1)^{r-1}=0\). The equation \(b^2=0\) follows
from \(q_1q_2=0\), and the internal square is zero. Moreover,
\(b(az)=(-1)^{|a|}a b(z)\) for the shifted action, since
\(r|a|\equiv |a|+(r-1)|a|\pmod2\). Thus \(\mathcal B\) is a left
dg \(\widetilde A\)-module. The other relative bar faces vanish:
interior faces multiply two ideal elements, and the last face is the
zero action of \(Q\) on \(E\).

The augmentation \(\epsilon:\mathcal B\to E\) uses
\(\widetilde A\to\Delta\) in length zero and is zero in positive
lengths. Here \(E\) is inflated to \(\widetilde A\). To check that
\(\epsilon\) is a quasi-isomorphism, split the leading factor as
\(\Delta\oplus Q\), only as a complex of left \(\Delta\)-modules.
Besides the copy of \(E\) in length zero, the summands occur in pairs
\[
 (Q^{\otimes r}\otimes_\Delta E)[r]
 \xrightarrow{\ 1\ }
 (Q^{\otimes r}\otimes_\Delta E)[r-1],\qquad r\geq1.
\]
The first member has leading factor \(\Delta\) in length \(r\);
the second has leading factor \(Q\) in length \(r-1\).
Their internal differentials differ by a sign. The degree-minus-one map
from the second member to the first, given by the identity on the
unshifted tensor, is a contraction. Equivalently, it inserts a unit
before a leading ideal element and is zero on the leading
\(\Delta\)-part. It satisfies
\(Dh+hD=1-\iota\epsilon\), where \(\iota:E\to\mathcal B\) is the
length-zero inclusion. This proves the required quasi-isomorphism.

The passage from \(\widetilde A\) to \(A\) requires a homological
check. Put \(F_r=Q^{\otimes r}\otimes_\Delta E\). Each \(F_r\) is a
bounded-above complex of projective left \(\Delta\)-modules. For
\(r>0\), this follows term by term: if \(V\) is projective over
\(\Delta\otimes_k\Delta^{\mathrm{op}}\), then \(V\otimes_\Delta L\)
is a direct summand of a finite sum of modules \(\Delta\otimes_kL\),
which are projective on the left. The case \(r=0\) is the choice of
\(E\). Bounded-above complexes of flat modules preserve acyclicity on
tensoring: each finite stupid truncation in degrees at least \(-s\)
has this property by induction on its number of terms, and these
subcomplexes have exhaustive direct limit equal to the original complex.
Tensor and filtered direct limits commute, and filtered direct limits
of modules preserve exactness.

More explicitly for the present dg module, filter \(\mathcal B\) by
length at most \(r\). This filtration is stable under \(D\), and its
successive quotients are \((\widetilde A\otimes_\Delta F_r)[r]\).
It is split as a filtration of graded \(\widetilde A\)-modules,
so tensoring its short exact sequences preserves exactness.
For every acyclic right dg \(\widetilde A\)-module \(Z\), the tensor
of such a quotient with \(Z\) is acyclic, because the restriction of
\(Z\) to \(\Delta\) is acyclic and \(F_r\) is K-flat. Induction on
the filtration length, followed by exactness of filtered direct limits,
gives acyclicity of \(Z\otimes_{\widetilde A}\mathcal B\).
Thus \(\mathcal B\) is K-flat over \(\widetilde A\).

The tensor/shift identification just used, including its sign, is
\[
 Z\otimes_{\widetilde A}(\widetilde A\otimes_\Delta F_r)[r]
 \longrightarrow (Z\otimes_\Delta F_r)[r],
 \quad z\otimes s^r(a\otimes v)
 \longmapsto(-1)^{r|z|}s^r(za\otimes v).
\]
The twisted shifted action makes this balanced; the tensor differential
gives the same sign on both sides. For the base changes with \(A\)
and \(\Delta\) below, the leading element has degree zero and this
sign is one.

Tensor the quasi-isomorphism \(f\), regarded as a map of right
\(\widetilde A\)-modules, with \(\mathcal B\). It follows that
\[
 \mathcal B\longrightarrow
 L:=A\otimes_{\widetilde A}\mathcal B
\]
is a quasi-isomorphism. Its composite with the augmentation \(L\to N\)
is \(\mathcal B\to E\to N\), also a quasi-isomorphism. Hence
\(L\to N\) is a quasi-isomorphism. Each term of \(L\) is projective
over \(A\), since its graded pieces are \((A\otimes_\Delta F_r)[r]\).
All terms have degree at most zero. In a fixed total degree only
finitely many lengths and internal degree decompositions occur.
Consequently \(L\) is a bounded-above projective resolution of \(N\).

After applying \(\Delta\otimes_A-\), the bar differential is zero:
its image contains a factor in the ideal \(X\), which acts by zero on
\(\Delta\). The resulting complex is exactly
\[
 \Delta\otimes_A L
 =\bigoplus_{r\geq0}(Q^{\otimes_\Delta r}\otimes_\Delta E)[r],
\]
with internal differential \((-1)^r d_{F_r}\) on length \(r\).
Projectivity of \(Q\) on both sides makes \(F_r\) a model for
\(\Phi^rN\), and this proves (4.1). Fixing \(Q\) and taking a
functorial projective resolution of \(N\) gives the stated naturality.

### Comparison and status

The source is Proposition 6.1, PDF pages 19--20,
`build/sections/06-square-zero-and-conclusion.tex:19-153`. Its proof uses
the free bar resolution over \(k\), splits words according to their
number of \(X\)-entries, and identifies each part with a multiple bar
resolution over \(\Delta\). The proof here instead uses a projective
bimodule resolution and a square-zero dg algebra. Both constructions
resolve the non-flat tensor factors; neither substitutes ordinary
powers of \(X\) for derived powers.

For comparison, the source's multiple-bar sign can be checked directly.
For a word with \(r\) ideal entries and \(i_j\) intervening algebra
entries in block \(j\), write
\[
 \eta(\boldsymbol i)=\sum_{j=0}^r(r-j)i_j.
\]
A local face numbered \(t\) in block \(j\) has source sign
\((-1)^{j+\sum_{h<j}i_h+t}\). The multiple-bar differential shifted
by \(r\) has sign \((-1)^{r+\sum_{h<j}i_h+t}\). If that face is
non-zero, it reduces \(i_j\) by one, and
\[
 j+\eta(\boldsymbol i-\boldsymbol e_j)
 \equiv r+\eta(\boldsymbol i)\pmod2.
\]
Thus multiplication by \((-1)^{\eta(\boldsymbol i)}\) intertwines
the differentials. An empty block between ideal entries or at an
endpoint has zero face; when \(r=0=i_0\), the augmentation is kept
separate. This checks the sign in source lines 90--111, including the
boundary cases. The left-module bar resolutions over the field used
in lines 113--139 justify the derived factors without flatness.

The MY attribution in source lines 13--16 is accurate in the pinned
v1: Lemma 4.13(4), page 18, and the displayed formula in the proof of
Theorem 4.17, page 20, give the graded components of this decomposition.
The explicit change of handedness is recorded under the source record
below. No error or unresolved gap was found in Proposition 6.1.

Status: **AI-proved** by the construction and contraction above. The
multiple-bar parity calculation is also an all-length calculation;
the script mentioned below tests only its stated finite ranges.

## 4.2. Projective dimension and extinction

### Statement and projective dimension for complexes

For a non-zero object \(C\in D^-(\Delta\text{-mod})\), define
\(\operatorname{pd}_\Delta C\) as the least integer \(p\) for which
\(C\) has a bounded-above projective representative zero in degrees
less than \(-p\); put \(\operatorname{pd}_\Delta C=\infty\) if there
is no such integer. This agrees with module projective dimension, and
\[
 \operatorname{pd}_\Delta(C[s])
 =\operatorname{pd}_\Delta C+s
\]
when \(C\ne0\), with the extended-integer convention for infinity.
This is projective dimension of a complex, not the maximum of the
projective dimensions of its cohomology modules without their degrees.

Under the hypotheses of 4.1, the following exact formula holds:
\[
 \operatorname{pd}_A N
 =\sup_{r\geq0}\{\operatorname{pd}_\Delta(\Phi^rN)+r\}.
                                                               \tag{4.2}
\]
For non-zero \(N\), this equality takes values in
\(\mathbb N\cup\{\infty\}\); zero summands contribute
\(-\infty\). In particular,
\[
 \Phi^rN\not\simeq0\quad\Longrightarrow\quad
 \operatorname{pd}_A N\geq r.                                  \tag{4.2a}
\]
Suppose in addition that the left and right global dimensions of
\(\Delta\) are finite, with bounds \(d_L,d_R\), respectively. Then
\[
 \operatorname{pd}_A N<\infty
 \quad\Longleftrightarrow\quad
 \Phi^tN\simeq0\text{ for some integer }t\geq1.                \tag{4.2b}
\]
If \(N\ne0\) and \(\Phi^tN\simeq0\), one also has
\[
 \operatorname{pd}_A N
 =\max_{0\leq r<t}\{\operatorname{pd}_\Delta(\Phi^rN)+r\}
 \leq d_L+(t-1)(d_R+1).                                        \tag{4.2c}
\]
In the other direction, for \(N\neq0\), \(\operatorname{pd}_A N=p<\infty\)
implies \(\Phi^{p+1}N\simeq0\); for \(N=0\) every iterate is zero
(wording repaired after V-A).

### Independent attempt, recorded before consulting the preprint

The lower bound should follow because a non-zero length-\(r\) summand
in (4.1) has some cohomology in degree at most \(-r\). For the upper
bound, restriction of an \(A\)-projective module to \(\Delta\) is
not an adequate argument: it need not be projective. Instead, every
simple \(A\)-module is inflated from \(\Delta\), since \(X\) is a
square-zero ideal. Derived adjunction and (4.1) should therefore detect
the length of a minimal \(A\)-resolution through Ext groups to those
simples. This gives equality in (4.2), not only the requested upper
bound. Finite global dimension is needed to turn finitely many surviving
iterates into objects of finite projective dimension, not for the formula.

### Proof

We use the following elementary detection fact for a finite-dimensional
algebra \(R_0\). For \(C\in D^-(R_0\text{-mod})\),
\[
 \operatorname{pd}_{R_0}C
 =\sup\{n\in\mathbb Z:
       \operatorname{Hom}_{D(R_0)}(C,S[n])\ne0
       \text{ for some simple left }R_0\text{-module }S\}.
                                                               \tag{4.2d}
\]
To justify it, start with a bounded-above representative by finite
projectives. It can be made minimal, with every differential having image
in the radical of its target, by cancelling contractible isomorphism
blocks. A differential between finite projectives that has a non-zero
map on their semisimple tops has an invertible component between
isomorphic indecomposable projective summands; row and column changes
isolate that component. The equation \(d^2=0\) separates it as a
two-term contractible summand. Perform these cancellations from the
highest degree downwards. There are finitely many summands to cancel in
each degree, and each fixed degree stabilises. This constructs a minimal
bounded-above complex \(J\) representing \(C\).

The complex \(\operatorname{Hom}_{R_0}(J,S)\) has zero differential.
If \(J^{-n}\ne0\), its non-zero top has a simple quotient, so
\(\operatorname{Hom}_{R_0}(J^{-n},S)\ne0\) for some \(S\).
Conversely, the absence of \(J^{-n}\) makes all these groups zero.
Bounded-above complexes of projectives compute the indicated derived
Hom groups. This proves (4.2d), including infinite projective dimension:
a representative with a finite lower endpoint would force all these
groups to vanish above that endpoint.

Every simple \(A\)-module is annihilated by \(X\). Indeed, for a
simple \(S\), the submodule \(XS\) is either zero or \(S\). The
second possibility would imply \(S=XS=X^2S=0\). Thus the simple
modules of \(A\) are exactly the inflated simple modules of
\(\Delta\).

For such a simple module \(S\), projective resolutions give derived
adjunction, and (4.1) gives
\[
\begin{aligned}
 \operatorname{Ext}_A^n(N,S)
 &\cong\operatorname{Hom}_{D(\Delta)}
       (\Delta\otimes_A^{\mathbf L}N,S[n])\\
 &\cong\prod_{r\geq0}
       \operatorname{Hom}_{D(\Delta)}(\Phi^rN,S[n-r]).
                                                               \tag{4.2e}
\end{aligned}
\]
For a direct chain-level check of the first line, use the resolution
\(L\) in 4.1. The complex \(\Delta\otimes_A L\) is itself
bounded above and projective over \(\Delta\); adjunction is the
degreewise isomorphism of Hom complexes. The last line follows because
Hom out of a direct sum is a product; products of complexes of vector
spaces commute with cohomology. In fact, when \(n\geq0\), the factors
with \(r>n\) vanish: \(\Phi^rN\) has a projective representative
concentrated in non-positive degrees, and
\(\operatorname{Hom}_{D(\Delta)}(\Phi^rN,S[j])=0\) for \(j<0\).

Taking the supremum over \(n\) and all simple \(S\) in (4.2e),
and using (4.2d) for both algebras, yields (4.2). If
\(\Phi^rN\ne0\), its minimal projective representative has a
non-zero term in a non-positive degree, so its projective dimension is
at least zero. This gives (4.2a).

Suppose now that \(d_L,d_R\) are finite. Truncating a bimodule
resolution of \(X\) at its \(d_R\)-th right syzygy produces a
resolution \(Q'\to X\) in degrees \([-d_R,0]\), whose terms are
projective as right \(\Delta\)-modules and retain their left
\(\Delta\)-action. The terminal syzygy is right projective because
right global dimension is at most \(d_R\). For \(d_R=0\), use
\(Q'=X\). Iterating tensor with \(Q'\) computes \(\Phi^rN\)
and shows that its cohomology lies in \([-r d_R,0]\).

If a finite-cohomology complex \(C\) has cohomology in \([u,0]\),
successive cohomology truncation triangles and the left bound \(d_L\)
give
\[
 \operatorname{pd}_\Delta C
 \leq\max_{u\leq i\leq0}
       \{\operatorname{pd}_\Delta H^i(C)-i\}
 \leq d_L-u.
\]
For the first inequality, apply Hom into each \(S[n]\) to the
truncation triangles. In a triangle \(C_1\to C\to C_2\), vanishing
of both outer Hom groups forces vanishing of the middle one, so (4.2d)
bounds the dimension of \(C\) by the larger of those of \(C_1,C_2\).
Each cohomology piece is \(H^i(C)[-i]\), explaining the sign \(-i\).
It follows that
\(\operatorname{pd}_\Delta\Phi^rN\leq d_L+r d_R\).

If \(\Phi^tN=0\), applying \(\Phi\) repeatedly gives zero for
all later iterates. Formula (4.2) is then a finite maximum and yields
(4.2c). Conversely, if \(\operatorname{pd}_A N=p<\infty\),
(4.2a) excludes every non-zero iterate with \(r>p\). This proves
(4.2b). The case \(N=0\) satisfies all vanishing assertions separately.

### Comparison and status

The source is Corollary 6.2 and its following remark, PDF pages 21--22,
`build/sections/06-square-zero-and-conclusion.tex:157-249`. Its first
direction tensors the bar decomposition further with
\(A/\operatorname{rad}A\) and detects the length of a minimal
resolution. Its second direction detects cohomology in degree
\(q-r\leq-r\). Both arguments apply with the stated hypotheses.
The converse follows from the second direction, as shown above.

The proof here uses Ext to simple modules and obtains equality (4.2).
This is also exactly the opposite-algebra translation of MY,
Corollary 4.11, v1 page 18. MY, Definition 3.2, page 11, uses the
same projective-dimension convention for complexes. Proposition 2.5,
page 6, identifies graded and ungraded dimension for modules; Lemma
3.6, page 12, does so for complexes over a finitely graded algebra.
Thus the main preprint's locators and its convention in lines 230--246
are consistent with v1. The equality is not a new attribution to this
dossier. No error or unresolved gap was found in Corollary 6.2 or in
that remark.

Status: **AI-proved**, including the equality, converse and explicit
upper bound, under the hypotheses stated above.

## 7.1. Simulation by ordinary bimodules

### Statement

Let \(B\) be a finite-dimensional \(k\)-algebra whose left and right
global dimensions are bounded by \(d_L,d_R<\infty\). Let \(P\) be a
bounded complex of finite-dimensional \(B\)-bimodules that are
projective as right \(B\)-modules, with
\(P^j=0\) for \(j\notin[a,b]\), and put \(l=b-a\geq0\).
There are ordinary finite-dimensional bimodules \(O,Y\) over
\[
 B_1=B\otimes_k K_l,\qquad \Delta=B\times B_1,
\]
where \(K_l\) is the radical-square-zero algebra of a line with
\(l+1\) vertices, such that
\[
 Y\otimes_{B_1}^{\mathbf L}O\simeq P[b],
 \qquad
 \Phi^2(N,0)\simeq(P[b]\otimes_B^{\mathbf L}N,0),
 \qquad \Phi=(O\oplus Y)\otimes_\Delta^{\mathbf L}-.
                                                               \tag{7.1}
\]
For every complex \(N\) of left \(B\)-modules the second
isomorphism in (7.1) is an isomorphism in \(D(\Delta\text{-Mod})\)
supported on the first factor. The first is an isomorphism in
\(D(B\otimes_kB^{\mathrm{op}}\text{-Mod})\).
The global-dimension bounds are
\(\operatorname{gldim}_L\Delta\leq d_L+l\) and
\(\operatorname{gldim}_R\Delta\leq d_R+l\).

### Independent attempt before consulting the preprint

The independent indexing of the construction was as follows. Take
vertices \(0,\ldots,l\) and arrows
\(\varepsilon_i:i\to i-1\), so
\(\varepsilon_i\in e_{i-1}K_le_i\); quotient by all paths of length
two. Let \(W\) be the right simple at vertex zero. Its proposed right
projective resolution has \(e_iK_l\) in degree \(-i\), with map
\(e_iK_l\to e_{i-1}K_l\) given by left multiplication by
\(\varepsilon_i\).

Set \(e_iO=P^{b-i}\), let \(\varepsilon_i\) act by
\(d_P^{b-i}\), and keep both \(B\)-actions of \(P\). This makes
\(O\) a \((B_1,B)\)-bimodule because \(d_P^2=0\). Set
\(Y=B\otimes_k W\), a \((B,B_1)\)-bimodule. Tensoring the proposed
resolution of \(Y\) with \(O\) gives \(P^{b-i}\) in degree
\(-i\), with differential \(d_P\). To identify it with \(P[b]\),
whose differential is \((-1)^b d_P\), multiply the degree-\(-i\)
term by \((-1)^{bi}\). The chain-map equation is
\[
 (-1)^{b(i-1)}d_P=(-1)^b d_P(-1)^{bi}.
\]
This attempt also covers \(l=0\) and negative \(a,b\).

For the global-dimension bound, the nilpotent ideal
\(\operatorname{rad}B\otimes K_l+B\otimes\operatorname{rad}K_l\)
has quotient \((B/\operatorname{rad}B)^{l+1}\). The simples of
\(B_1\) are therefore the external products of a simple \(B\)-module
and a vertex simple of \(K_l\). Tensoring their finite projective
resolutions over the field gives the claimed bounds. This argument does
not require that \(k\) be perfect.

### Final construction and proof

We use the preprint's increasing vertex order in the final construction.
This is the relabelling \(i\mapsto l-i\) of the independent attempt.
Let
\[
 K_l=k(0\xrightarrow{c_1}1\xrightarrow{c_2}\cdots
              \xrightarrow{c_l}l)/(\text{all paths of length two}),
 \qquad c_i\in\varepsilon_iK_l\varepsilon_{i-1},
\]
and let \(W\) be the simple right module at vertex \(l\).
Put \(R_W^n=\varepsilon_{l+n}K_l\) for \(-l\leq n\leq0\)
and zero otherwise. Its differential in degree \(n<0\) is left
multiplication by \(c_{l+n+1}\), and \(R_W^0\to W\) is the
quotient onto the top. For \(i>0\), the right projective
\(\varepsilon_iK_l\) has basis \(\varepsilon_i,c_i\).
Its radical is the simple at \(i-1\). The indicated map sends
\(\varepsilon_{i-1}\) to \(c_i\), and sends \(c_{i-1}\), when
present, to zero. Its kernel is therefore the radical of its source
and its image the radical of its target. At the left endpoint
\(\varepsilon_0K_l\) is one-dimensional, so the first map is
injective. These statements give exactness of \(R_W\to W\).
For \(l=0\), the augmentation is an isomorphism.

Define the ordinary \((B_1,B)\)-bimodule \(O\) by
\[
 \varepsilon_iO=P^{a+i},\qquad
 c_i:\varepsilon_{i-1}O\longrightarrow\varepsilon_iO,
 \quad c_i=d_P^{a+i-1}.
\]
The two \(B\)-actions are the given actions on the terms of \(P\).
Each relation \(c_{i+1}c_i=0\) is the equation \(d_P^2=0\);
linearity of \(d_P\) ensures that both \(B\)-actions commute with
the \(K_l\)-action. Its underlying right \(B\)-module is the finite
direct sum of the terms of \(P\), and is projective.

Set \(Y=B\otimes_kW\). Its left \(B\)-action and right
\(B_1\)-action are
\[
 b'\cdot(b\otimes w)=b'b\otimes w,
 \qquad (b\otimes w)\cdot(b'\otimes c)=bb'\otimes wc.
\]
Let \(\pi_0,\pi_1\) denote the central idempotents of
\(\Delta=B\times B_1\). Regard these as \(\Delta\)-bimodules by
\[
 O=\pi_1O\pi_0,\qquad Y=\pi_0Y\pi_1,
 \qquad X=O\oplus Y.
\]
The other block actions are zero. This specifies every action entering
the ordinary trivial extension \(\Delta\ltimes X\).

The complex \(R_Y=B\otimes_kR_W\to Y\) is a right
\(B_1\)-projective resolution preserving the left \(B\)-action.
Indeed, its degree-\(n\) term is the right idempotent ideal
\[
 B\otimes_k\varepsilon_{l+n}K_l
 =(1\otimes\varepsilon_{l+n})B_1.
\]
Consequently \(R_Y\otimes_{B_1}O\) computes
\(Y\otimes_{B_1}^{\mathbf L}O\). In degree \(n\in[-l,0]\),
\[
 (B\otimes\varepsilon_{l+n}K_l)\otimes_{B_1}O
 \longrightarrow \varepsilon_{l+n}O=P^{b+n},
 \qquad (b\otimes u)\otimes o\longmapsto b\,u o,
                                                               \tag{7.1a}
\]
is a bimodule isomorphism. Its inverse sends
\(o\in\varepsilon_{l+n}O\) to
\((1\otimes\varepsilon_{l+n})\otimes o\). Under this map the
differential is \(d_P^{b+n}\), since the right-resolution map is
left multiplication by \(c_{l+n+1}\).

The target complex \(P[b]\) has the same terms and differential
\((-1)^bd_P\). Define
\[
 f^n=(-1)^{bn}\operatorname{id}_{P^{b+n}}.
                                                               \tag{7.1b}
\]
The equation \((-1)^{b(n+1)}=(-1)^b(-1)^{bn}\) shows that
\(f^{n+1}d_P=d_{P[b]}f^n\). Each \(f^n\) commutes with both
\(B\)-actions and is invertible. This gives the first isomorphism
in (7.1), with its sign specified in every degree.

The block complex \(R_X=O\oplus R_Y\to X\) is bounded and
projective as a right \(\Delta\)-module in every degree, and
retains its left \(\Delta\)-action. It can therefore compute
\(\Phi\) on every complex, including unbounded ones: a bounded
complex of right projectives is K-flat. Starting with \((N,0)\),
one tensor step is \((0,O\otimes_BN)\); the next is
\[
 (R_Y\otimes_{B_1}(O\otimes_BN),0)
 \cong((R_Y\otimes_{B_1}O)\otimes_BN,0).
\]
There is no associativity sign: the order of homogeneous factors is
unchanged. Applying (7.1b) tensored with \(N\) gives the stated
\((P[b]\otimes_B^{\mathbf L}N,0)\). It computes the derived
tensor because \(P[b]\) is bounded and right projective termwise.
Explicitly, if an element in the first factor has degree \(n\),
the differential on its tensor with \(N\) has the second-factor
sign \((-1)^n\) on both sides, and the first-factor signs match by
(7.1b). This proves the functor identity on the entire first factor.

It remains to justify the dimension bounds. The left simple at vertex
\(i\) of \(K_l\) has successive syzygies at
\(i+1,\ldots,l\), using the projectives \(K_l\varepsilon_j\).
Its projective dimension is at most \(l-i\). For right simples the
resolution just described, ending at any vertex \(i\), has length
\(i\). Thus both global dimensions are at most \(l\).

Write \(J_B=\operatorname{rad}B\) and \(J_K=\operatorname{rad}K_l\).
The ideal
\[
 I=J_B\otimes_kK_l+B\otimes_kJ_K\ \subseteq B_1
\]
is nilpotent: its two summand ideals commute, and each is nilpotent.
Its quotient is
\((B/J_B)\otimes_k k^{l+1}\cong(B/J_B)^{l+1}\), which is
semisimple. Hence \(I=\operatorname{rad}B_1\): a nilpotent ideal
lies in the radical, and a semisimple quotient has zero radical.
It follows that every left simple of \(B_1\) is \(S\otimes_kL_i\)
with \(S\) a simple left \(B\)-module and \(L_i\) a vertex simple
of \(K_l\). Tensor a projective resolution of \(S\) of length at
most \(d_L\) with one of \(L_i\) of length at most \(l\).
Each term is projective over \(B_1\), and the tensor augmentation
is a quasi-isomorphism because tensor over a field preserves
acyclicity. The total length is at most \(d_L+l\).
The same construction with right modules gives \(d_R+l\).

These bounds on simples bound all modules: the nilpotent radical gives
every module a finite filtration with semisimple quotients; arbitrary
semisimple modules are direct sums of simples; direct sums of the
bounded projective resolutions remain bounded projective resolutions;
and the long exact Ext sequence preserves the common bound across a
short exact sequence. Finally, modules and their resolutions over
\(B\times B_1\) split into the two factors. Therefore
\[
 \operatorname{gldim}_L\Delta\leq d_L+l,
 \qquad \operatorname{gldim}_R\Delta\leq d_R+l.                \tag{7.1c}
\]
For the encoding algebra of D-B, both bounds are \(l+2\).

### Comparison and status

The source is Proposition 5.1, PDF page 18, together with its preceding
construction on page 17;
`build/sections/05-ordinary-simulation.tex:9-149`. The independent
attempt reversed the vertex numbering; the final construction has the
source's orientation. The translations of symbols are
\(C\mapsto K_l\), \(T\mapsto Y\), \(D\mapsto\Delta\),
\(F\mapsto\Phi\), and \((a_*,b_*)\mapsto(a,b)\).
Under the relabelling, \((-1)^{bi}\) in independent degree \(-i\)
is precisely the source's \((-1)^{bn}\). In particular, the shift is
\([b]\), not \([-b]\), and \(W\) is a right simple.

The source proves the sufficient bound \(3l+2\) by a directed-vertex
argument. Equation (7.1c) gives the stronger bound \(l+2\) in this
case. This is an improvement of a non-optimal estimate, not a defect in
the source. The source requires its support interval to contain zero;
the simulation calculation itself only needs \(a\leq b\).
For the main construction below we also choose \(a\leq0\leq b\).
The termwise right-projectivity used in source lines 119--146 is part
of the realisation theorem's statement, not an omitted flatness
assumption. No error or unresolved gap was found in this section.

Status: **AI-proved** for the stated data, including the signs,
boundary case \(l=0\), and both global-dimension bounds.

## 7.2. Assembly and the quantifier order

### Statement of the inputs and independent attempt

The selection input needed from report 5.2 is a finitely presented
unital \(\mathbb C\)-algebra \(R\), a central idempotent \(e\in R\),
and a unital automorphism \(\alpha:R\to R\), all fixed, such that
for every integer \(m\geq1\) there is a finite-dimensional left
\(R\)-module \(Y_m\) satisfying
\[
 H^{\circ m}Y_m=0,\qquad H^{\circ(m-1)}Y_m\ne0.             \tag{7.2a}
\]
Here \(H(Y)={}_\alpha(eY)\), equivalently
\(H=\Psi\otimes_R-\) for \(\Psi={}_\alpha(eR)\).
This additive functor preserves zero and finite dimensionality.
Selection is an external input to D-A, report 5.2, matching the main
preprint's Proposition 2.1 and equation (2.2). Only the two endpoint
conditions in (7.2a) are used here.

The realisation input is precisely the interface of report 6.1 and 6.6
(D-B): a single finite-dimensional algebra \(B\), of left and right
global dimension at most two, a single bounded complex \(P\) of
finite-dimensional bimodules projective as right \(B\)-modules, and
modules \(M(Y)\) for finite-dimensional \(R\)-modules,
with \(M(Y)=0\) exactly when \(Y=0\), such that
\[
 P\otimes_B^{\mathbf L}M(Y)
 \simeq M(HY)\oplus M(HY)[3]                                \tag{7.2b}
\]
for every such \(Y\). These are the explicitly authorised black-box
results, and the D-A conclusion is conditional on them. The
right-projectivity and independence from \(Y\) are explicit in the
main preprint's Theorem 4.1,
`build/sections/04-tensor-realization.tex:8-24`.

The required conclusion is that there is a **single** finite-dimensional
\(\mathbb C\)-algebra \(A\) and, for every \(m\geq1\), a
finite-dimensional left \(A\)-module \(N_m\) such that
\[
 2m-2\leq\operatorname{pd}_A N_m<\infty.
                                                               \tag{7.2c}
\]

Independent attempt: first fix \((R,H)\), then fix all the realisation
choices \(B,P\), then choose an interval \([a,b]\) containing the
support of this single \(P\), and then perform 7.1. Set
\(X=O\oplus Y\), \(A=\Delta\ltimes X\); only after these choices
are fixed let \(m\) vary and put \(N_m=(M(Y_m),0)\), inflated to
\(A\). The symbol \(Y\) here is the simulation bimodule and is
distinct from the selection modules \(Y_m\).

Writing \(G=P\otimes_B^{\mathbf L}-\), iterating (7.2b) gives
\[
 G^rM(Y_m)\simeq
 \bigoplus_{j=0}^r M(H^{\circ r}Y_m)[3j]^{\oplus\binom rj}.
\]
The proposed simulation therefore gives
\[
 \Phi^{2r}N_m\simeq
 \left(\bigoplus_{j=0}^r
 M(H^{\circ r}Y_m)[rb+3j]^{\oplus\binom rj},0\right).        \tag{7.2d}
\]
At \(r=m\) this is zero; at \(r=m-1\) it is non-zero.
Result 4.2 then gives (7.2c). No assertion that the last odd iterate is
non-zero is needed. The support bound \(l\), and hence \(A\), must
not be reselected for each \(m\).

### Final proof

Fix \(R,e,\alpha\) from selection and fix the algebra \(B\), the
functor \(M\), and the one complex \(P\) from realisation. Choose
integers \(a\leq0\leq b\) with \(P^n=0\) outside \([a,b]\).
Such integers exist because \(P\) is bounded. Applying 7.1 produces
\(K_l,W,O,Y,\Delta,X\), where \(l=b-a\); fix all these objects and
set \(A=\Delta\ltimes X\). This is a finite-dimensional unital
\(\mathbb C\)-algebra, since every summand defining \(\Delta\)
and \(X\) is finite-dimensional. These choices precede the choice
of every test module \(Y_m\).

For a finite-dimensional \(R\)-module \(V_R\), regard \(M(V_R)\) as a
\(\Delta\)-module supported on the first factor. By 7.1 and (7.2b),
\[
 \Phi^2(M(V_R),0)
 \simeq (M(HV_R)[b]\oplus M(HV_R)[b+3],0).                  \tag{7.2e}
\]
The shift here has the same sign as in 7.1. To make the shift
compatibility used in iteration explicit, for homogeneous
\(p\in P\) the isomorphism
\[
 P\otimes_B C[s]\longrightarrow(P\otimes_B C)[s],
 \qquad p\otimes s^sv\longmapsto
               (-1)^{s|p|}s^s(p\otimes v)
\]
is a chain map by the tensor and shift differential conventions.
The map \(P[b]\otimes_B C\to(P\otimes_B C)[b]\) is the identity
on underlying tensors. These formulas justify commuting derived tensor
with the shifts in (7.2e).

For each \(r\geq0\), repeated application of (7.2e) gives
\[
 \Phi^{2r}(M(V_R),0)
 \simeq
 \left(\bigoplus_{j=0}^r
       M(H^{\circ r}V_R)[rb+3j]^{\oplus\binom rj},0\right).
                                                               \tag{7.2f}
\]
For \(r=0\) this is the identity. For the inductive step, apply
\(\Phi^2\) to each summand at stage \(r\). Its two descendants
have shifts \((r+1)b+3j\) and \((r+1)b+3(j+1)\).
The multiplicity at index \(j\) is
\(\binom rj+\binom r{j-1}=\binom{r+1}j\), with out-of-range
binomial coefficients zero. This proves the formula, including its
endpoints. It uses a realisation isomorphism for the individual module
\(H^{\circ r}V_R\) at each stage. It does not require a splitting
natural in \(V_R\).

Now let \(m\geq1\), choose \(Y_m\) from (7.2a), and set
\(N_m=(M(Y_m),0)\), first over \(\Delta\) and then inflated to
\(A\). Formula (7.2f) gives
\[
 \Phi^{2m}N_m\simeq0,\qquad
 \Phi^{2m-2}N_m\not\simeq0.                                \tag{7.2g}
\]
For the second assertion, \(M(H^{\circ(m-1)}Y_m)\ne0\) by the
zero-detection part of realisation. A finite direct sum of its shifts
has it, up to shift, as a direct summand, so cannot be zero in the
derived category. Shifts do not change zero versus non-zero.

By (7.1c), \(\Delta\) has finite global dimension on both sides,
with the common bound \(l+2\). Apply (4.2b) to the vanishing in
(7.2g), and (4.2a) to its non-vanishing, with the iterate index
\(r=2m-2\). This gives exactly
\[
 2m-2\leq\operatorname{pd}_A N_m<\infty.
\]
In particular, \(m=1\) gives a non-zero module of finite projective
dimension and the lower bound zero; there is no omitted endpoint case.
If an explicit finite upper estimate is wanted, (4.2c) gives
\[
 \operatorname{pd}_A N_m
 \leq(l+2)+(2m-1)(l+3),                                    \tag{7.2h}
\]
using \(t=2m\). This estimate need not be optimal.

Every \(N_m\) is finite-dimensional, hence finitely generated over
the fixed algebra \(A\). Given an integer \(L\), choose \(m\)
with \(2m-2>L\). The set defining the little left finitistic
dimension of this same \(A\) then contains a finite projective
dimension greater than \(L\). Therefore \(\operatorname{findim}A
=\infty\), subject to the two input theorems stated above.

The quantifiers are
\[
 \exists(R,e,\alpha)\;\exists(B,M,P,a,b,\Delta,X,A)\;
 \forall m\geq1\;\exists Y_m\;\exists N_m.
\]
The selection and realisation theorems give exactly this order:
realisation applies uniformly to every finite-dimensional module over
the fixed selection algebra. Choosing a separate \(P_m\) or an
unbounded sequence of algebras \(A_m\) would not suffice, but neither
choice is made here.

### Comparison and status

The source is the proof of Theorem 1.1, PDF page 22,
`build/sections/06-square-zero-and-conclusion.tex:253-341`.
Its fixed/varying table, binomial formula (6.4), and final application
of Corollary 6.2 agree with the argument above. Source lines 309--311
explicitly dispense with naturality of the splitting; lines 324--328
explicitly use the iterate index, rather than infer a new bound from
the cohomological shifts. The lower bound \(2m-2\) has no missing
factor or sign. No error or unresolved gap was found in the assembly.

Status: **AI-proved as an implication from report 5.2 and D-B 6.1,
6.6**. Those input results are used in their stated scope and are not
independently re-examined here. No claim of author certification or of
an independent validation of all of the preprint is made.

## Pinned source record: Minamoto--Yamaura

The source is Hiroyuki Minamoto and Kota Yamaura, *Homological dimension
formulas for trivial extension algebras*,
[arXiv:1710.01469v1](https://arxiv.org/abs/1710.01469v1), 30 pages.
The Library entry `MY17` points to v1 and the local file is
`MY17 - Homological Dimension Formulas for Trivial Extension Algebras.pdf`.
The first-page arXiv stamp is 4 October 2017; the title-page date is
5 October 2017. All locators below refer to v1's printed page numbers,
which equal its PDF page numbers. The local PDF's hash is recorded in
the audit. Pages 18 and 20 were also rendered and inspected visually.

The statements and standing assumptions were read, rather than inferred
from the main preprint's citations:

| Locator in v1 | Statement or convention used for comparison |
|---|---|
| Introduction, page 1; Section 1.1, page 4 | The base ring is commutative, bimodules are central over it, and modules are right modules unless otherwise stated. Complex degrees are cohomological. |
| Section 2.1 and Section 2.2, page 5 | Internal grading is distinct from cohomological grading; the algebras under consideration here are non-negatively and finitely graded. Our trivial extension has internal degrees zero and one. |
| Proposition 2.5, page 6 | Graded and ungraded projective dimensions agree for a graded module. |
| Definition 3.2, page 11; Lemma 3.5(2), page 12 | Projective dimension is measured by the lower endpoint of a projective resolution in cohomological degrees; a shift by \([s]\) adds \(s\) to projective dimension. |
| Lemma 3.6, page 12 | The graded/ungraded equality also holds for a complex over a finitely graded algebra. |
| Section 4, page 12; Section 4.2 and Remark 4.9, page 17 | Here \(A=\Lambda\oplus C\); \(M\otimes_\Lambda^{\mathbf L}C^a\) denotes the \(a\)-fold iterate of the derived functor, including the identity at \(a=0\). It is not an ordinary tensor power. |
| Corollary 4.11, page 18 | The projective-dimension formula holds for \(M\in D(\mathrm{Mod}\,\Lambda)\), inflated to the trivial extension. |
| Lemma 4.13(4), page 18; proof of Theorem 4.17, page 20 | The internal degree-\(i\) part of \(M\otimes_A^{\mathbf L}\Lambda\) is the complex of generators \(p_iP\); for \(M\) internally concentrated in degree zero, it is \(M\otimes_\Lambda^{\mathbf L}C^i[i]\) for \(i\geq0\), and zero for \(i<0\). |
| Theorem 4.17, page 20 | An inflated \(M\) is graded perfect over \(A\) exactly when all iterates are perfect over \(\Lambda\) and the iterates vanish for all sufficiently large indices. |

The formula of Corollary 4.11, transcribed in its own handedness, is
\[
 \operatorname{pd}_A M
 =\sup\{\operatorname{pd}_\Lambda
              (M\otimes_\Lambda^{\mathbf L}C^a)+a\mid a\geq0\}.
                                                               \tag{MY}
\]
Its short introductory clause is: “For \(M\in D(\mathrm{Mod}\,
\Lambda)\), we have”. No flatness condition on \(C\) occurs in the
statement or the standing hypotheses of Section 4.

To translate, apply this to \(\Lambda=\Delta^{\mathrm{op}}\),
\(C=X^{\mathrm{op}}\), and the trivial extension
\(A^{\mathrm{op}}\). A left \(\Delta\)-module is a right
\(\Delta^{\mathrm{op}}\)-module via \(n\cdot d^{\mathrm{op}}=dn\).
Reversing the factors of a tensor of complexes uses
\[
 u\otimes v\longmapsto(-1)^{|u||v|}v\otimes u.
\]
The balancing relations become the original \(\Delta\)-balancing
relations, with the two actions of the opposite bimodule interchanged;
the Koszul sign makes this reversal a chain map. Thus the right-module
iterate in (MY) becomes exactly \(\Phi^aN\), and (MY) becomes (4.2).
The shift remains \([a]\). The direct sum of the internal components
in Lemma 4.13(4) and the proof of Theorem 4.17 likewise becomes (4.1).

For Theorem 4.17, the hypotheses are that every iterate is perfect and
that sufficiently late iterates vanish; finite global dimension is
not part of that theorem's statement. In our application the
boundedness and finite-dimensionality in 4.2, together with finite
global dimension of \(\Delta\), supply perfectness of each iterate.
Proposition 2.5 already suffices to forget the grading for the module
\(N\); Lemma 3.6 covers the more general complex formulation.

Two notation slips in MY do not affect these uses. The opening of
Lemma 4.13 on page 18 prints \(D(\mathrm{Mod}\,A)\), although its
internal truncation \(M_{<0}\), graded resolution, and subsequent
components require \(D(\mathrm{Mod}^{\mathbb Z}A)\). The surrounding
Section 4 and Lemma 4.14 make the graded interpretation explicit.
In part (3), the final right-hand side is printed as
\(M\otimes_\Lambda^{\mathbf L}N\), where the degree-zero component
\(M_0\) is needed. Literally read, that displayed equality is
**refuted** already by \(A=\Lambda=k\), \(C=0\), \(N=k\), and
\(M=k\) in internal degree one and cohomological degree zero: its
left side is zero and its right side is not. Part (3) is not used here.
These are issues in MY's printed notation, not errors in the main
preprint's attribution to part (4).

These literature statements have status **cited**. The main arguments
4.1 and 4.2 above do not rely on an unexamined literature proof.

## Exact computations and boundary cases

The new script `computations/D-A-checks.py` uses only Python's standard
library and exact rational arithmetic; its saved output is
`computations/D-A-checks.out`. It was run successfully on 2026-10-08.
No prior computation script was imported. Its scope is:

- The multiple-bar rescaling: \(0\leq r\leq5\), every
  \(i_j\in\{0,1,2,3\}\), every local face in a non-empty block;
  69,633 parity comparisons.
- The dg shifted differential and left-action parity identities:
  \(0\leq r\leq6\), internal degrees in \(\{-2,-1,0\}\);
  73,791 mixed-term and 29,511 action comparisons.
- The simulation sign: \(-3\leq b\leq4\), \(0\leq l\leq6\),
  every non-terminal degree; 168 comparisons.
- Two monomial path algebras over \(\mathbb Q\), constructed from
  their surviving paths. Associativity, differential compositions,
  ranks, exactness in the indicated range, and the resulting homology
  dimensions are checked by rational row reduction.

For the infinite-range diagnostic, take
\(\Delta=k(0\xrightarrow a1)\),
\(X=S_0\otimes_k S_1^{\mathrm{right}}\), and \(N=S_0\).
The ordinary tensor \(X\otimes_\Delta N\) is zero, but the
two-term right projective resolution of \(S_1^{\mathrm{right}}\)
gives \(\Phi N\simeq S_0[1]\). The trivial extension is the
radical-square-zero two-cycle. The script checks its alternating
projective resolution through index nine and the homology of
\(\Delta\otimes_A-\) through index eight: dimensions
\(1,0,1,0,1,0,1,0,1\). These agree with the summands \(N[r][r]\)
in those degrees. The finite computation alone makes no claim about
all later degrees.

There is also a complete finite diagnostic. Take
\[
 \Delta=k(0\xrightarrow a1\xrightarrow b2),\quad
 X=S_0\otimes_kS_2^{\mathrm{right}},\quad N=S_1.
\]
Then \(A\) adds an arrow \(x:2\to0\), with \(ax=0=xb\);
the path \(ba\) survives. Thus \(\dim_k\Delta=6\) and
\(\dim_k A=7\). The right-simple resolution
\(0\to\varepsilon_1\Delta\xrightarrow{b\cdot}
\varepsilon_2\Delta\to S_2^{\mathrm{right}}\to0\) gives
\(\Phi N=S_0[1]\) and \(\Phi^2N=0\), whereas
\(X\otimes_\Delta N=0\). There is an exact minimal resolution
\[
 0\longrightarrow A\varepsilon_1
 \xrightarrow{\ -\cdot a\ }A\varepsilon_0
 \xrightarrow{\ -\cdot x\ }A\varepsilon_2
 \xrightarrow{\ -\cdot b\ }A\varepsilon_1
 \longrightarrow S_1\longrightarrow0.
\]
Here \(-\cdot a\) denotes right multiplication by \(a\), not a
negative sign. The respective projective bases are
\((\varepsilon_1,b)\), \((\varepsilon_0,a,ba)\),
\((\varepsilon_2,x)\), and \((\varepsilon_1,b)\).
The first map has image spanned by \(a,ba\); the second has image
spanned by \(x\); the third has image spanned by \(b\).
These descriptions give all kernels and show exactness and minimality.
The last non-zero projective is in resolution index three, so
\(\operatorname{pd}_A N=3\). The two surviving terms of (4.2) are
\(1\) and \((\operatorname{pd}_\Delta S_0+1)+1=3\).
This is an explicit reason that ordinary tensor extinction cannot
replace derived tensor extinction in the projective-dimension formula.

The finite sign and matrix outputs have status **supported** in precisely
the ranges stated. The displayed finite resolution has status
**AI-proved**, by its bases and kernels. The all-degree results of this
dossier use the written proofs, not an extrapolation from the script.

Other boundary cases follow directly from the constructions: for
\(X=0\), (4.1) consists only of \(N\), and (4.2) reduces to
\(\operatorname{pd}_A N=\operatorname{pd}_\Delta N\); for
\(N=0\), all summands vanish and the dimensions are \(-\infty\).
For \(l=0\), the simulation resolution is the single right projective
\(W=k\) and the result is \(P^b=P[b]\) in degree zero. These
boundary claims inherit the **AI-proved** status of their proofs above.

## Final statuses and remaining scope

| Result | Status | Reason |
|---|---|---|
| 4.1 | AI-proved | Explicit signed dg resolution, contraction, K-flat base change and direct-sum decomposition; no flatness of \(X\) assumed. |
| 4.2 | AI-proved | Ext to all simple modules gives the exact formula; boundedness of iterates gives extinction if and only if finite projective dimension. |
| 7.1 | AI-proved | Right-simple resolution, ordinary bimodule actions and chain sign supplied; global dimensions bounded by \(d_L+l,d_R+l\). |
| 7.2 | AI-proved relative to the stated inputs | Selection 5.2 and realisation D-B 6.1, 6.6 are black boxes; the fixed-algebra assembly and bound \(2m-2\) follow as written. |

There are no unresolved local proof steps or unlocated citations in
these four arguments. The inputs to 7.2 remain the scope limitation:
this note does not supply the selection-group proof or the quotient,
lifting and rectification proofs of D-B. The step most worth a separate
review within D-A is the dg bar resolution's K-flat base change in
4.1; the square-zero and non-positive-degree hypotheses used there
are explicit. No fresh-context verification of this new dossier and
no formalisation were performed in this job.
