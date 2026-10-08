Model: GPT-6 (Codex); effort: unknown.

# D-D. The conversion principle — Result 8.1

Date: 2026-10-08. This is an AI-written proof dossier, not manuscript prose.
Conventions: `audit/report-notation.md` and `report/notes/outline.md`.
Only this note and `audit/D-D-preprint-issues.md` are edited for this job.

## 0. Independent attempt, recorded before reading the source proof

The following outline was obtained from the task statement before opening
`.cache/ar-src/01-stable.tex` or `.cache/ar-src/02-conversion.tex`. Its status
at this checkpoint is **plausible**; the detailed proof and source comparison
will follow below. An independently tasked agent obtained the same mechanism;
that agreement is a lead, not a proof certificate.

Let \(T_F=F\otimes_E-\). Take a complete cochain resolution \(P\) with
\(S=\operatorname{coker}d_P^{-1}\), and lift an ordinary representative
\(\bar v:S\to T_FS\) of the stable class \(v\) to a chain map
\(\widetilde v:P\to T_FP\). For the column functors
\[
 L_1(M)=(M,T_FM,1),\qquad L_2(M)=(0,M,0),
\]
this gives \(V:L_2P\to L_1P\). The candidate complete resolution is
\[
 P_Z=\operatorname{Cone}(V),\qquad
 d_{P_Z}^n=\begin{pmatrix}d_{L_1P}^n&V^{n+1}\\0&-d_{L_2P}^{n+1}\end{pmatrix}.
\]
Its cokernel in degree zero has top component \(S\) and bottom component
\[
 Y=(T_FS\oplus P^1)/\{(\bar v(s),-j(s)):s\in S\},
 \qquad j:S\hookrightarrow P^1,
\]
with structure map \(\iota(t)=[t,0]\).

The identities
\[
 \operatorname{Hom}_\Lambda(L_1M,L_2N)=0,\quad
 \operatorname{Hom}_\Lambda(L_iM,L_iN)=\operatorname{Hom}_E(M,N),\quad
 \operatorname{Hom}_\Lambda(L_2M,L_1N)=\operatorname{Hom}_E(M,T_FN)
\]
make the product-totalised endomorphism complex of \(P_Z\) the mapping
fibre of the difference map between two endomorphism complexes and one
mixed Hom complex. With the difference convention fixed below, this should give
\[
0\longrightarrow\operatorname{coker}\delta^{a-1}
\longrightarrow H^a\operatorname{Hom}_\Lambda^\bullet(P_Z,P_Z)
\longrightarrow\ker\delta^a\longrightarrow0.
\]
The remaining obligations are the complete-resolution comparison lemma,
total acyclicity of both columns, all shift signs, and the literal cokernel
calculation. Non-projectivity follows already from
\(\ker\delta^0\ne0\): it forces \(S\) to be non-projective, whereas the
first component of a projective \(\Lambda\)-module is projective.

This attempt uses only the projective–injective properties of \(E\).
It does not use a symmetrising trace or Tate duality. It retains minus signs,
so it suggests no restriction on the characteristic.

## 1. Statement and conventions

Let \(k\) be an arbitrary field, let \(E\) be a finite-dimensional symmetric
\(k\)-algebra, and let \({}_EF_E\) be a finite-dimensional bimodule that is
projective as a left module and as a right module separately. Let \(S\) be a
finite left \(E\)-module. All tensor products with \(F\) below are over \(E\).
Write \(T_F=F\otimes_E-\), and fix a stable morphism
\[
 v:S\longrightarrow T_FS.
\]
For each integer \(a\), use the report's Tate convention
\[
 \widehat{\operatorname{Ext}}_E^a(M,N)
   =\underline{\operatorname{Hom}}_E(M,N[a]),
 \qquad [1]=\Omega^{-1}.
\]
Here stable morphisms are ordinary maps modulo maps factoring through finite
projectives. Define the comparison map, including its sign, by
\[
 \delta^a:
 \widehat{\operatorname{Ext}}_E^a(S,S)^{\oplus2}
 \longrightarrow \widehat{\operatorname{Ext}}_E^a(S,T_FS),
 \qquad
 \delta^a(g,j)=T_F(g)v-v[a]j.                         \tag{1.1}
\]
The identification \(T_F(S[a])\simeq(T_FS)[a]\) is induced by applying
\(T_F\) to complete resolutions; §2 justifies it. Composition is written
right to left. The preprint uses a plus sign in characteristic two. If one
defines the comparison with a plus sign over another field, precomposing
with \((g,j)\mapsto(g,-j)\) recovers (1.1), so the hypotheses below do not
change.

**Result 8.1 (statement).** Suppose that \(\delta^0\) is surjective with
non-zero kernel, and that \(\delta^a\) is bijective for every integer
\(a>0\). Choose an ordinary representative \(v_0:S\to T_FS\) of \(v\)
and an injection \(i:S\hookrightarrow Q\), where \(Q\) is a finite
projective left \(E\)-module. Set
\[
 \Lambda=\begin{pmatrix}E&0\\ F&E\end{pmatrix},\qquad
 Y=(T_FS\oplus Q)/\{(v_0(s),i(s)):s\in S\},\qquad
 \iota(t)=[t,0],\qquad Z=(S,Y,\iota).                 \tag{1.2}
\]
Then \(Z\) is finite, non-projective and Gorenstein-projective, and
\[
 \operatorname{Ext}_\Lambda^a(Z,Z)=0
   =\operatorname{Ext}_\Lambda^a(Z,\Lambda)
 \qquad(a>0).
\]
These conclusions hold for every choice of \(v_0,i,Q\) as above. The proof
below works in every characteristic. The final status is recorded in §8.

For cochain complexes, the grading, shift and product Hom conventions are
\[
 P[a]^n=P^{n+a},\qquad d_{P[a]}^n=(-1)^a d_P^{n+a},
\]
\[
 \operatorname{Hom}_R^a(P,W)
    =\prod_{n\in\mathbb Z}\operatorname{Hom}_R(P^n,W^{n+a}),
 \qquad
 (\partial f)^n=d_W^{n+a}f^n-(-1)^a f^{n+1}d_P^n.     \tag{1.3}
\]
The Hom differential has square zero by expansion, using \(d_P^2=d_W^2=0\).
A degree-\(a\) cocycle is a chain map \(P\to W[a]\). Boundaries correspond
to chain homotopies: the Hom boundary of a degree-\(a-1\) element \(h\)
is the homotopy boundary for the map to \(W[a]\) with homotopy
\((-1)^a h\). Products in (1.3), not direct sums, permit infinitely many
non-zero components. Every differential component is a finite sum.
This convention agrees with Veliche, §1.1.1, p. 3, after reversing
homological indices; the pinned source is listed in §7.

For an exact cochain complex \(P\), put
\[
 C^n(P)=\operatorname{coker}(d_P^{n-1}:P^{n-1}\to P^n).
\]
Exactness gives an injection \(\jmath_n:C^n(P)\to P^{n+1}\) induced by
\(d_P^n\), and short exact sequences
\[
 0\longrightarrow C^n(P)\xrightarrow{\jmath_n}P^{n+1}
   \longrightarrow C^{n+1}(P)\longrightarrow0.        \tag{1.4}
\]
We call \(P\) totally acyclic if its terms are finite projective modules,
it is exact, and \(\operatorname{Hom}_R^\bullet(P,R)\) is exact, with
\(R\) placed in degree zero. This implies exactness into every projective
module: finite generation gives
\(\operatorname{Hom}_R^\bullet(P,R^{(I)})
 =\operatorname{Hom}_R^\bullet(P,R)^{(I)}\), degree by degree; direct sums
are exact, and every projective is a summand of a free module. A finite
module is Gorenstein-projective if it is \(C^0(P)\) for such a complex.
These are the finite-term instances of Veliche's definitions §2.1.1,
p. 7, and §2.3.1, p. 8. In this note a complete resolution means this
complex together with its specified degree-zero cokernel.

## 2. Complete resolutions and stable maps

### 2.1. The consequences of symmetry

Write \(D=\operatorname{Hom}_k(-,k)\). Symmetry gives
\({}_EE_E\simeq {}_E(DE)_E\). The left module \(DE\) is injective:
the isomorphism
\[
 \operatorname{Hom}_E(M,DE)\longrightarrow DM,
 \qquad f\longmapsto(m\mapsto f(m)(1))
\]
has inverse \(\lambda\mapsto(m\mapsto(a\mapsto\lambda(am)))\), and
\(D\) is exact on vector spaces. Thus every finite projective left
\(E\)-module is injective. Every finite left module \(M\) embeds in a
finite projective: dualise a surjection \(E_E^r\twoheadrightarrow DM\)
and use \(D(E_E^r)\simeq {}_EE^r\).

Successively taking finite projective surjections gives a resolution to
the left of \(S\). Starting with the prescribed \(i:S\to Q\),
successively embedding cokernels in finite projectives gives a coresolution
to the right. Splice them to obtain an exact cochain complex \(P\) with
\[
 C^0(P)=S,\quad P^1=Q,\quad d_P^0=i\epsilon,
 \qquad \epsilon:P^0\twoheadrightarrow S.             \tag{2.1}
\]
For every finite projective \(L\), \(\operatorname{Hom}_E(-,L)\) is
exact, so applying it to (1.4) makes
\(\operatorname{Hom}_E^\bullet(P,L)\) exact. Consequently \(P\) is
totally acyclic.

The right projectivity of \(F\) makes \(T_F\) exact. If \(U\) is a
finite projective left \(E\)-module, it is a summand of \(E^r\), so
\(T_FU\) is a summand of \(F^r\) and is projective by left projectivity
of \(F\). Therefore \(T_FP\) is an exact complex of finite projectives
with \(C^0(T_FP)=T_FS\). Its total acyclicity again follows from
injectivity of the finite projective targets.

This paragraph and the construction of projective embeddings are where
symmetry enters. No trace pairing or Tate duality is used.

### 2.2. Comparison lemma, including positive ordinary Ext

Let \(R\) be a finite-dimensional algebra over any field. Let \(P\) be
totally acyclic and \(W\) an exact complex of finite projective left
\(R\)-modules. Put \(M=C^0(P)\) and \(N=C^0(W)\). Then
\[
 H^a\operatorname{Hom}_R^\bullet(P,W)
 \simeq\underline{\operatorname{Hom}}_R(C^{-a}(P),N)
 \simeq\underline{\operatorname{Hom}}_R(M,C^a(W))       \tag{2.2}
\]
for all integers \(a\), and for \(a>0\) these groups are
\(\operatorname{Ext}_R^a(M,N)\). The comparison respects composition
and additive functors that act on the resolutions and on cokernels.
In this assertion no self-injectivity of \(R\) or total acyclicity of
\(W\) is assumed.

We give the proof. First, total acyclicity implies the following extension
property for every finite projective \(L\): every map
\(u:C^n(P)\to L\) extends across \(\jmath_n\) to \(P^{n+1}\).
Indeed, \(u\epsilon_n:P^n\to L\), where
\(\epsilon_n:P^n\twoheadrightarrow C^n(P)\), kills \(d_P^{n-1}\).
Exactness of \(\operatorname{Hom}_R^\bullet(P,L)\) yields a map
\(b:P^{n+1}\to L\) with \(b d_P^n=u\epsilon_n\) (absorbing the
scalar sign from (1.3) into \(b\)). Since \(\epsilon_n\) is surjective,
\(b\jmath_n=u\).

A chain map \(f:P\to W\) induces a map on \(C^0\). Conversely, let
\(u:M\to N\) be an ordinary map. Lift \(u\epsilon_0\) through
\(W^0\twoheadrightarrow N\) to \(f^0:P^0\to W^0\). To choose
\(f^{-1}\), lift \(f^0d_P^{-1}\), whose image is in
\(\ker(W^0\to N)=\operatorname{im}d_W^{-1}\), through
\(W^{-1}\twoheadrightarrow\operatorname{im}d_W^{-1}\).
Repeating this lifting with the projective modules \(P^{-2},P^{-3},\ldots\)
constructs every negative component. For the positive components,
\(d_W^0f^0\) kills \(\operatorname{im}d_P^{-1}\), so it factors through
\(C^0(P)\). The extension property with target \(W^1\) extends that map
across \(C^0(P)\hookrightarrow P^1\), producing \(f^1\) with
\(f^1d_P^0=d_W^0f^0\). At each subsequent degree, the already satisfied
chain equation makes \(d_W^nf^n\) kill \(\operatorname{im}d_P^{n-1}\);
extend its factor through \(C^n(P)\) to obtain \(f^{n+1}\).

If \(f=d_Wh+hd_P\) is nullhomotopic, its induced map on \(C^0\)
factors through \(P^1\): the term \(d_W^{-1}h^0\) vanishes in
\(C^0(W)\), leaving the map induced by \(h^1d_P^0\).
Conversely, suppose the induced map factors as \(M\to L\to N\) with
\(L\) finite projective. Extend \(M\to L\) to \(P^1\), and lift
\(L\to N\) to \(W^0\). Their composite is a homotopy component
\(h^1:P^1\to W^0\). Its boundary induces precisely this factorisation.
Subtract it and henceforth suppose that \(f\) induces zero on \(C^0\).

Set the new \(h^1=0\). Lift \(f^0\) through \(d_W^{-1}\) to
\(h^0:P^0\to W^{-1}\). For \(n<0\), once \(h^{n+1}\) is chosen,
the residual
\[
 f^n-h^{n+1}d_P^n
\]
has image in \(\ker d_W^n\): applying \(d_W^n\) and using the chain
equation and the homotopy equation at degree \(n+1\) gives zero.
Projectivity of \(P^n\) lifts it through \(d_W^{n-1}\) to \(h^n\).
For \(n\geq1\), once \(h^n\) is chosen, the residual
\[
 f^n-d_W^{n-1}h^n
\]
kills \(\operatorname{im}d_P^{n-1}\): composing with \(d_P^{n-1}\)
and using the homotopy equation at degree \(n-1\) gives zero.
It descends to \(C^n(P)\), and the extension property with target
\(W^n\) provides \(h^{n+1}:P^{n+1}\to W^n\). These two recursions
give \(f=d_Wh+hd_P\) in every degree. They define an element of the
full product Hom complex; neither requires convergence or finite support.
This gives (2.2) in degree zero. Passing to cokernels preserves
composition, and the construction modulo homotopy proves the stated
compatibilities.

Apply the degree-zero result to \(P[-a],W\) and to \(P,W[a]\).
The images of differentials are unchanged by their scalar shift signs,
so \(C^0(P[-a])=C^{-a}(P)\) and \(C^0(W[a])=C^a(W)\).
Chain maps and their homotopies are translated using (1.3), giving (2.2).
Finally, for \(a>0\), the projective resolution
\[
 \cdots\longrightarrow P^{-2}\longrightarrow P^{-1}
 \longrightarrow P^0\longrightarrow M\longrightarrow0
\]
computes \(\operatorname{Ext}_R^a(M,N)\) as maps
\(C^{-a}(P)\to N\) modulo those extending to \(P^{-a+1}\).
Every extending map factors through that projective. If a map instead
factors through another finite projective \(L\), the extension property
extends its first factor to \(P^{-a+1}\). Thus the two quotient spaces
are equal, also when \(a=1\). This completes the comparison proof.

Truncating a totally acyclic complex at degree zero also gives
\[
 \operatorname{Ext}_R^a(C^0(P),L)=0
 \quad(a>0,\ L\text{ projective}),                    \tag{2.3}
\]
since the positive Hom cohomology of the truncated resolution agrees
with that of the complete complex. This is the assertion recorded in
Veliche §2.3.2, p. 9; the argument here supplies it directly.

For the symmetric algebra \(E\), all finite modules have the complete
resolutions constructed in §2.1. The comparison lemma shows that different
choices are homotopy equivalent: lift the identity in both directions;
their composites induce identities and hence are homotopic to identities.
The cokernel functor therefore identifies the homotopy category of these
complexes with the stable category. By (1.4), shifting a complex by \([1]\)
is the cosyzygy functor on this category; the inverse shift is the syzygy
functor. Applying \(T_F\) preserves the complexes, cokernels, homotopies
and shifts. This supplies the shift identifications and composition
compatibility required in (1.1), and identifies the groups in (2.2) over
\(E\) with the report's Tate groups. No properties of stable triangles
are needed below.

## 3. Triangular modules, columns and projectives

An element of \(\Lambda\) is written \((a,f,b)\), with product
\[
 (a,f,b)(a',f',b')=(aa',fa'+bf',bb').
\]
Its two diagonal idempotents split every left module into components
\(M,N\); multiplication by the lower-left block gives an \(E\)-linear
map \(\eta:T_FM\to N\). Conversely the formula
\[
 (a,f,b)(m,n)=(am,\eta(f\otimes m)+bn)
\]
defines the module associated to \((M,N,\eta)\). Associativity is the
identity
\(\eta((fa'+bf')\otimes m)=\eta(f\otimes a'm)+b\eta(f'\otimes m)\),
which follows from balancing and \(E\)-linearity of \(\eta\).
A morphism \((\alpha,\beta)\) between triples satisfies
\[
 \beta\eta=\eta' T_F(\alpha).                        \tag{3.1}
\]
Kernels, images and cokernels of module maps are exact on each idempotent
component, so a sequence of triples is exact precisely when its two
component sequences are exact.

Define column functors
\[
 L_1(M)=(M,T_FM,1),\qquad L_2(N)=(0,N,0).
\]
Their adjunctions to component evaluation follow directly from (3.1):
\[
 \operatorname{Hom}_\Lambda(L_1U,(M,N,\eta))
   \simeq\operatorname{Hom}_E(U,M),\qquad
 \operatorname{Hom}_\Lambda(L_2U,(M,N,\eta))
   \simeq\operatorname{Hom}_E(U,N).                  \tag{3.2}
\]
In the first identification, a top map \(\alpha\) determines the bottom
map \(\eta T_F(\alpha)\); in the second, the bottom map is unrestricted.
The functor \(L_1\) is exact because \(F_E\) is projective; \(L_2\) is
exact by its definition. They send finite projectives to finite projectives:
\[
 L_1(E)=\Lambda e_1,\qquad L_2(E)=\Lambda e_2,
 \qquad {}_\Lambda\Lambda=L_1(E)\oplus L_2(E).       \tag{3.3}
\]
Taking sums and summands of these identities gives the assertion.

More precisely, a finite triple \((M,N,\eta)\) is projective if and only if
\(\eta\) is injective and both \(M\) and \(\operatorname{coker}\eta\)
are projective over \(E\). For the forward implication, the triple is a
summand of \(\Lambda^r\). Its structure map is a summand of the injective
structure map of \(\Lambda^r\), while its top and its structure-map
cokernel are summands of \(E^r\). For the reverse implication, split
\(0\to T_FM\xrightarrow{\eta}N\to\operatorname{coker}\eta\to0\)
using projectivity of the last term. This identifies the triple with
\[
 L_1(M)\oplus L_2(\operatorname{coker}\eta),
\]
which is projective by (3.3). In particular, the first component of every
finite projective \(\Lambda\)-module is projective over \(E\).
The general version of this criterion appears in Eshraghi–Hafezi–Salarian–Li,
Lemma 2.1, p. 3; their column adjunctions are in §2, pp. 2–3. The argument
here is a direct proof of the case needed.

Specialising (3.2) gives all four Hom spaces:
\[
\begin{aligned}
 \operatorname{Hom}_\Lambda(L_1M,L_1N)&\simeq\operatorname{Hom}_E(M,N),\\
 \operatorname{Hom}_\Lambda(L_2M,L_2N)&\simeq\operatorname{Hom}_E(M,N),\\
 \operatorname{Hom}_\Lambda(L_1M,L_2N)&=0,\\
 \operatorname{Hom}_\Lambda(L_2M,L_1N)&\simeq\operatorname{Hom}_E(M,T_FN).
\end{aligned}
                                                               \tag{3.4}
\]
For the zero Hom space, (3.1) forces the bottom map to vanish because the
source structure map is the identity. The identities hold degree by degree
for full Hom complexes. Postcomposition by an \(L_1\)-endomorphism
\(g\) acts on the last Hom space by \(T_F(g)\); precomposition by an
\(L_2\)-endomorphism \(j\) acts by \(j\).

## 4. The cone and the prescribed finite module

Use the complex \(P\) in (2.1), and set
\[
 G_0=L_1P,\qquad G_1=L_2P.
\]
Both complexes are exact with finite projective terms. By (3.3)–(3.4),
\[
\begin{aligned}
 \operatorname{Hom}_\Lambda^\bullet(G_0,\Lambda)
     &\simeq\operatorname{Hom}_E^\bullet(P,E),\\
 \operatorname{Hom}_\Lambda^\bullet(G_1,\Lambda)
     &\simeq\operatorname{Hom}_E^\bullet(P,F)
           \oplus\operatorname{Hom}_E^\bullet(P,E).
\end{aligned}
                                                               \tag{4.1}
\]
The right sides are exact because \(P\) is totally acyclic and \({}_EF\)
is finite projective. Hence both column complexes are totally acyclic.
In particular this argument uses no self-injectivity assumption on
\(\Lambda\). It supplies directly the preservation facts relevant to
Eshraghi–Hafezi–Salarian–Li, Lemma 2.2, pp. 3–4.

By §2.2, lift the actual map \(v_0:S\to T_FS\) to a chain map
\(f:P\to T_FP\) inducing exactly \(v_0\) on cokernels. Under (3.4)
it gives a chain map \(V:G_1\to G_0\) whose bottom component is \(f\).
Define
\[
 P_Z^n=G_0^n\oplus G_1^{n+1},\qquad
 d_{P_Z}^n=
 \begin{pmatrix}d_{G_0}^n&V^{n+1}\\0&-d_{G_1}^{n+1}\end{pmatrix}.
                                                               \tag{4.2}
\]
The upper-right entry of \(d_{P_Z}^{n+1}d_{P_Z}^n\) is
\(d_{G_0}^{n+1}V^{n+1}-V^{n+2}d_{G_1}^{n+1}=0\),
and the diagonal entries are zero. Thus (4.2) defines the cochain cone
\(P_Z=\operatorname{Cone}(V)\).

The sequence of complexes
\[
 0\longrightarrow G_0\longrightarrow P_Z
   \longrightarrow G_1[1]\longrightarrow0             \tag{4.3}
\]
splits in each degree. Since the outer complexes are exact, its cohomology
sequence makes \(P_Z\) exact. Applying
\(\operatorname{Hom}_\Lambda^\bullet(-,\Lambda)\) gives another short
exact sequence, now in the reverse direction: the splitting in each degree
ensures surjectivity of restriction. Its outer terms are exact by (4.1)
and the shift convention. Therefore \(P_Z\) is totally acyclic.

It remains to identify its degree-zero cokernel, not just its stable class.
Its top is \(C^0(P)=S\). Its bottom is the cokernel of
\[
 T_FP^{-1}\oplus P^0\longrightarrow T_FP^0\oplus P^1,
 \qquad (x,y)\longmapsto(T_F(d_P^{-1})x+f^0y,-d_P^0y).
                                                               \tag{4.4}
\]
First quotient by the image of the first summand. Since \(T_F\) is exact,
the bottom target becomes \(T_FS\oplus Q\). As \(f\) induces \(v_0\)
and \(d_P^0=i\epsilon\), the remaining relations are
\((v_0(s),-i(s))\), for all \(s\in S\). Hence the cokernel is
\[
 (S,Y_-,\iota_-),\qquad
 Y_-=(T_FS\oplus Q)/\{(v_0(s),-i(s)):s\in S\}.
\]
The automorphism \((t,q)\mapsto(t,-q)\) of \(T_FS\oplus Q\) sends
this relation submodule onto the relation submodule in (1.2), preserves
the first summand, and induces an isomorphism of triples
\[
 C^0(P_Z)\xrightarrow{\ \sim\ } Z.                   \tag{4.5}
\]
In characteristic two this is the identity on representatives. This sign
change is necessary for the literal plus-sign quotient (1.2) with the
signed cone (4.2).

For completeness, \(\iota:T_FS\to Y\) is injective: if
\((t,0)=(v_0(s),i(s))\), then \(i(s)=0\), hence \(s=t=0\).
The map \([t,q]\mapsto q+i(S)\) gives an exact sequence
\[
 0\longrightarrow T_FS\xrightarrow{\iota}Y
   \longrightarrow Q/i(S)\longrightarrow0.           \tag{4.6}
\]
Its kernel is the image of the first summand because a representative with
\(q=i(s)\) differs from \((t-v_0(s),0)\) by a relation.
All spaces are finite. More precisely,
\[
 \dim_k\Lambda=2\dim_kE+\dim_kF,\quad
 \dim_kY=\dim_kT_FS+\dim_kQ-\dim_kS,\quad
 \dim_kZ=\dim_kT_FS+\dim_kQ.
\]
By (4.5), total acyclicity gives both Gorenstein-projectivity of \(Z\)
and, by (2.3),
\[
 \operatorname{Ext}_\Lambda^a(Z,\Lambda)=0\qquad(a>0).
                                                               \tag{4.7}
\]

## 5. The self-extension calculation

Put
\[
 \mathcal H=\operatorname{Hom}_E^\bullet(P,P),\qquad
 \mathcal K=\operatorname{Hom}_E^\bullet(P,T_FP),\qquad
 \boldsymbol\delta(g,j)=T_F(g)f-fj.
                                                               \tag{5.1}
\]
The map \(\boldsymbol\delta:\mathcal H^{\oplus2}\to\mathcal K\)
is a chain map. Indeed, \(f\) is a degree-zero cocycle, and expansion of
(1.3) gives
\(\partial(T_F(g)f)=T_F(\partial g)f\) and
\(\partial(fj)=f\partial j\). Section 2 identifies
\[
 H^a(\mathcal H)=\widehat{\operatorname{Ext}}_E^a(S,S),\qquad
 H^a(\mathcal K)=\widehat{\operatorname{Ext}}_E^a(S,T_FS).
                                                               \tag{5.2}
\]
On these identifications, \(H^a(\boldsymbol\delta)=\delta^a\): the first
composition represents \(T_F(g)v\), while the second represents
\(v[a]j\). The comparison's compatibility with composition and shifts
justifies both identifications, including when \(a<0\).

There is no block from \(G_0\) to \(G_1[1]\), by (3.4).
Thus, for every integer \(n\), an endomorphism of \(P_Z\) of degree
\(n\) has unique coordinates
\[
 (g,j,h)\in\mathcal H^n\oplus\mathcal H^n\oplus\mathcal K^{n-1}.
\]
To specify the signs without an implicit shift convention, its component
from \(P_Z^r\) to \(P_Z^{r+n}\) is
\[
 \begin{pmatrix}
    L_1(g^r)&(-1)^n h^{r+1}\\
    0&(-1)^n L_2(j^{r+1})
 \end{pmatrix}.                                      \tag{5.3}
\]
The upper-right entry denotes the triangular-module map determined by
\(h^{r+1}:P^{r+1}\to T_FP^{r+n}\). Direct multiplication of (4.2)
and (5.3) in
\(\partial\Phi=d_{P_Z}\Phi-(-1)^n\Phi d_{P_Z}\) gives
\[
 \partial(g,j,h)=
  (\partial g,\partial j,\boldsymbol\delta(g,j)-\partial h).
                                                               \tag{5.4}
\]
Here is the off-diagonal computation with its indices suppressed only
after specifying (5.3). Its actual block is
\[
 (-1)^n\bigl(d_{T_FP}h+(-1)^n h d_P
                   +fj-T_F(g)f\bigr)
   =(-1)^n\bigl(\partial h-\boldsymbol\delta(g,j)\bigr).
\]
The coordinate in degree \(n+1\) has the extra factor \((-1)^{n+1}\),
which produces the third component of (5.4). The top block is
\(L_1(\partial g)\); the lower diagonal block is
\((-1)^{n+1}L_2(\partial j)\). This proves the entire formula.

Consequently there is a degreewise split short exact sequence of complexes
\[
 0\longrightarrow\mathcal K[-1]
  \xrightarrow{h\mapsto(0,0,h)}
   \operatorname{End}_\Lambda^\bullet(P_Z)
  \xrightarrow{(g,j,h)\mapsto(g,j)}
   \mathcal H^{\oplus2}\longrightarrow0.             \tag{5.5}
\]
The differential on \(\mathcal K[-1]\) is \(-\partial\), as required
by (5.4). If \((g,j)\) is a diagonal cocycle, its lift \((g,j,0)\)
has boundary \((0,0,\boldsymbol\delta(g,j))\). Hence the connecting
map from \(H^a(\mathcal H^{\oplus2})\) to
\(H^{a+1}(\mathcal K[-1])=H^a(\mathcal K)\) is exactly \(\delta^a\),
with the convention (1.1).

The cohomology sequence of (5.5) therefore gives, for every integer \(a\),
\[
 0\longrightarrow\operatorname{coker}\delta^{a-1}
 \longrightarrow H^a\operatorname{End}_\Lambda^\bullet(P_Z)
 \longrightarrow\ker\delta^a\longrightarrow0.       \tag{5.6}
\]
By the comparison lemma and (4.5),
\[
 H^a\operatorname{End}_\Lambda^\bullet(P_Z)
    \simeq\operatorname{Ext}_\Lambda^a(Z,Z)\qquad(a>0),
 \quad
 H^0\operatorname{End}_\Lambda^\bullet(P_Z)
    \simeq\underline{\operatorname{End}}_\Lambda(Z).
                                                               \tag{5.7}
\]
For \(a=1\), the left outer term in (5.6) vanishes by surjectivity of
\(\delta^0\), and the right one by injectivity of \(\delta^1\).
For \(a>1\), both vanish by the positive-degree bijectivity hypotheses.
Thus \(\operatorname{Ext}_\Lambda^a(Z,Z)=0\) for every \(a>0\).

Formula (5.6) is valid without the surjectivity or bijectivity hypotheses.
In particular, if \(\delta^1\) is injective, it identifies
\(\operatorname{Ext}_\Lambda^1(Z,Z)\) with
\(\operatorname{coker}\delta^0\). This explains the degree-one obstruction
tested in the part-I audits; none of those finite computations is a premise
of the all-degree argument here.

## 6. Non-projectivity and the hypotheses used

Since \(\ker\delta^0\ne0\), the vector space
\(\underline{\operatorname{End}}_E(S)^{\oplus2}\) is non-zero. If \(S\)
were projective, every map from \(S\) would factor through a projective,
contradicting that fact. Thus \(S\) is non-projective. The first component
of a projective \(\Lambda\)-module is projective by §3. The first component
of \(Z\) is \(S\), so \(Z\) is non-projective. This concludes Result 8.1.

There is also a proof using (5.6) at degree zero: the stable endomorphism
space in (5.7) surjects onto \(\ker\delta^0\ne0\). A projective module
has zero stable endomorphism space. This is the non-projectivity argument
used in the preprint. Neither proof requires any assertion about
\(\delta^{-1}\).

The assumptions enter as follows.

| Assumption | Uses in this proof |
|---|---|
| \(E\) symmetric | §2.1: \(E\simeq DE\) supplies injectivity of finite projectives and embeddings into finite projectives; these construct \(P\) and make \(P,T_FP\) totally acyclic. These consequences are then used in §§4–5. |
| \(F_E\) projective | §§2.1, 3, 4: exactness of tensoring, exactness of \(L_1\), the complete resolution \(T_FP\), and the quotient in (4.4). |
| \({}_EF\) projective | §2.1: projective terms of \(T_FP\); (4.1): exactness of \(\operatorname{Hom}_E(P,F)\). It is not needed merely for the column identity \(L_1(E)=\Lambda e_1\). |
| All algebra, bimodule and module data finite | Finite projective choices, finite terms, the finite quotient (1.2), and passage from Hom into the ring to Hom into arbitrary projectives. |
| \(\delta^0\) surjective | The \(a=1\) instance of (5.6). |
| \(\ker\delta^0\ne0\) | Non-projectivity only. |
| \(\delta^a\) bijective for \(a>0\) | For every \(a>0\), injectivity kills \(\ker\delta^a\); surjectivity kills the corresponding cokernel in degree \(a+1\). |
| Characteristic two | No step requires it. It makes every displayed minus sign equal to a plus sign and makes (4.5) the identity. |

In particular, the proof does not use bimodule projectivity over \(E^e\),
minimal resolutions, simplicity of \(S\), a stable endomorphism ring equal
to \(k\), or Tate duality. The algebra \(\Lambda\) need not be symmetric.
The same proof applies whenever finite \(E\)-modules have enough projective
embeddings and finite projectives are injective. Thus full symmetry is
stronger than the properties actually used. No weakening is needed to
apply the stated Result 8.1.

## 7. Sources and comparison

The source under examination is OpenAI, *An explicit counterexample to the
Auslander–Reiten conjecture*, dated 2026-09-23 in the supplied
`.cache/ar-src/main.tex`. The pinned input for this job is the local source
snapshot, not an inferred arXiv version. The source locators are
`01-stable.tex` (complete file) and `02-conversion.tex`, Proposition
`conv:proposition`, Lemma `conv:comparison`, and its subsequent proof.
The latter file is §3 in the current `main.tex` inclusion order; the
outline/plan description ‘AR §2’ is not the current section number.
Source hashes and detailed comparisons are in
[`audit/D-D-preprint-issues.md`](../../../audit/D-D-preprint-issues.md).

The following primary sources were read at the indicated locators on
2026-10-08. The preliminary library search found neither cited arXiv work;
they were read online without creating or importing a PDF.

| Reference and pinned version | Locators read and role here |
|---|---|
| Oana Veliche, *Gorenstein projective dimension for complexes*, [arXiv:math/0406057v1](https://arxiv.org/pdf/math/0406057) (v1 identified on the PDF) | §1.1.1, p. 3: product Hom and differential; §2.1.1, p. 7: total acyclicity; §2.2.1, p. 8: the more general complete-resolution diagram; §2.3.1, p. 8: Gorenstein-projective modules; §2.3.2, p. 9: vanishing against projectives. |
| H. Eshraghi, R. Hafezi, Sh. Salarian and Z. W. Li, *Gorenstein Projective Modules Over Triangular Matrix Rings*, [arXiv:1402.4595v1](https://arxiv.org/pdf/1402.4595v1) | §2, pp. 2–3: triples and column adjoints; Lemma 2.1, p. 3: projective triples; Lemma 2.2, pp. 3–4: columns on totally acyclic complexes. |

These citations identify the conventions and the standard facts referenced
by the preprint. No theorem from either source is used as an unexpanded
premise: §§2–4 supply the precise proofs required here. Short source
quotations and the scope of the locator check are in the issue record.
Veliche's homological indices are reversed in (1.3); the triangular-matrix
source already uses left modules and the lower-triangular orientation.

The independent attempt (§0) and the preprint use the same three-block
endomorphism calculation. The final dossier adds arbitrary-characteristic
signs, the explicit isomorphism (4.5), and the complete projective-triple
criterion. It gives the simpler first-component proof of non-projectivity
as well as the preprint's stable-endomorphism proof. No mathematical error
was found in the two source sections for their stated characteristic-two
conversion theorem.

## 8. Status and check record

**Result 8.1: AI-proved.** Sections 1–6 give the complete argument, including
the auxiliary comparison and triangular-algebra facts. All mathematical
assertions in those sections have this same status; the provisional status
of the independent outline in §0 is superseded by this completed proof.
There is no unresolved proof step or unverified citation locator used by
the result.

The proof covers all positive degrees over an arbitrary field. Symmetry is
used only through the properties identified in §2.1 and the table in §6;
characteristic two is not required. The degree-zero term in (5.7) is stable
endomorphisms, not ordinary endomorphisms.

The supplementary exact calculation
[`D-D-cone-signs.py`](../../../computations/D-D-cone-signs.py), with saved
[`output`](../../../computations/D-D-cone-signs.out), checks the formal
noncommutative block identities over \(\mathbb Z\) and modulo two for
both parities of the arbitrary degree. It tests (5.4), its square, and
the cone differential's square. Its scope is signs only; it supplies no
replacement for the complete-resolution or all-degree Ext arguments.

The points requiring the closest reader attention are the two unbounded
recursions in §2.2 and the shifted coordinates (5.3). The supplementary
[`same-model review`](../../../computations/D-D-review.md) found no
mathematical error or unresolved gap in §§1–6. It records its input scope,
including accidental exposure to part of the initial outline, and a separate
statement-only check of the comparison lemma. Two equation tags were moved
outside their aligned environments after that review; the mathematics was
unchanged. This is not human certification or formal verification. No Lean
formalisation or rerun of the part-I finite-module computations was performed.
