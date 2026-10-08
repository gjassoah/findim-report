Model: GPT-6; effort: unknown.

# D-E: ingredients of the Auslander–Reiten construction

This is an incremental proof dossier for report §§8.2–8.6, written on
2026-10-08. It is AI-generated research material, not author certification.
The report conventions in [audit omitted] and the symbol choices
in `report/notes/outline.md` apply. We work over
\(k=\mathbb F_2(q,H_1,H_2)\), with algebraically independent variables.
All modules are left modules. Complexes are cohomological, with
\(M[r]^n=M^{n+r}\); the source's homological term \(P_j\) is our
\(P^{-j}\). In the stable category, \([1]=\Omega^{-1}\).
We write \(H^a=\widehat{\operatorname{Ext}}_E^a(S,S)\).

The inputs `paper.pdf`, `build/` and `.cache/ar-src/` are read-only.
Existing computation scripts and outputs are leads to be read and rerun,
not certificates of statements in all degrees. The finite certificates
produced in this job are kept in `computations/08-D-E/`.

## Proof attempts before source comparison

The work is divided into algebra and resolution (§§8.2–8.3), cone profile
(§8.4), cocycle and lifts (§8.5), and fibre and comparison (§8.6).
The contribution records in `computations/08-D-E/` document the attempts
and source comparisons of the first three units. Preparatory arguments
occurring outside source proof environments are identified there rather
than counted as independent discoveries.

For §8.6, the first pass read the definitions and statements of
`07-branches.tex`, `08-consequences.tex` and the conversion statement in
`02-conversion.tex`, with proof environments suppressed. This reveals the
construction itself and some justifications outside proof environments.
The independent argument attempted before opening the source proofs was:

1. A free bimodule surjecting onto a finite representative of
   \(\mathcal C[3]\) makes the fibre an actual finite module. Splitting
   on each algebra side makes the fibre projective on both sides.
2. Evaluating the fibre triangle at \(S\), the profile
   \(W^a=\widehat{\operatorname{Ext}}_E^a(S,\mathcal CS)\), supported
   at 0 and 3, gives \(V^0\) as the diagonal line in \((H^0)^2\).
   The case \(a=1\) must be checked separately: the preceding map
   \((H^0)^2\to W^3\) must be surjective to obtain
   \(V^1\cong(H^1)^2\). For \(a\ge2\), both adjacent \(W\)-groups
   vanish and projection is an isomorphism.
3. Naturality of the two fibre projections turns the comparison into
   the scalar matrix
   \(\left(\begin{smallmatrix}H_1^{-m}&1\\H_2^{-m}&1\end{smallmatrix}\right)\)
   on every monomial of degree \(3m\). Its determinant is non-zero for
   \(m>0\) because distinct Laurent monomials in independent variables
   cannot cancel. At \(m=0\), the sum map has the diagonal kernel.
4. The conversion principle is an explicitly named dependency, report
   §8.1 / job D-D; this dossier does not silently replace its proof.

The proposed extra consequences in `08-consequences.tex` can be approached
by the nilpotent ideal of a triangular algebra, by tensoring semisimple
quotients, and by flat base change of finite projective resolutions. A
specific non-zero product for the radical-power assertion remained to be
supplied at that checkpoint; it is now given in (8.6.6).

## Assessment convention

The attempts above were provisional. The completed arguments follow;
the final table supersedes the intermediate conditional assessments once
the explicitly named dependencies have been discharged. No result is
assigned human certification or a formal-verification status.

## 8.2. The algebra C and its resolution

**Hypotheses and statement.** Let k be a field of characteristic two containing
an element q with q≠0 and q^m≠1 for every m≥1. The report uses the particular
field k=F₂(q,H₁,H₂), so these hypotheses hold. Let C have basis arranged as

| corner | basis |
|---|---|
| eCe | e,x,y,z |
| eCf | u,v |
| fCe | t,j |
| fCf | f,n |

The idempotents e,f are orthogonal, their sum is the identity, and the only
nonzero products of two basis vectors other than e,f are
\[
xy=qz,\quad yx=z,\quad xu=yu=v,\quad tx=j,\quad ty=q^2j,
\]
\[
ut=y+qx,\quad vt=qz,\quad uj=z,\quad tu=(1+q)n,
\quad nt=qj,\quad un=v.
\]
All unlisted products of radical basis vectors vanish; multiplication by e,f
is prescribed by the corners. Then C is an associative algebra, its radical
N is the span of its eight non-idempotent basis vectors, N⁵=0 and
utut=q(1+q)z≠0. Let s be its one-dimensional left f-simple and s^r the
right f-simple. Put ℓ_i=x+q^i y for i≥0. A minimal projective resolution is
\[
\cdots\longrightarrow Ce\xrightarrow{\cdot\ell_1}Ce
\xrightarrow{\cdot\ell_0}Ce\xrightarrow{\cdot u}Cf
\longrightarrow s\longrightarrow0,
\tag{F.1}
\]
where R⁰=Cf, R^{−i}=Ce for i≥1, d^{−1} is right multiplication by u,
and d^{−i−2} is right multiplication by ℓ_i. Moreover
\[
\operatorname{Ext}_C^a(s,s)=
\begin{cases}k&a=0,\\0&a>0,\end{cases}
\qquad
\operatorname{RHom}_C(s,C)\simeq s^{\mathrm r}[-2]
\quad\text{in }D(\mathrm{mod}\ C^{\mathrm{op}}).
\tag{F.2}
\]

**Algebra and radical.** The script `computations/08-D-E/foundations_certificate.py` checks all
1000 basis associators using exact polynomial arithmetic over F₂[q]. Its
multiplication table is given literally in the script; the script does not
consult earlier scripts or their outputs. Polynomial identities descend to
any characteristic-two field with a choice of q. Hence trilinearity gives
associativity over k. The corner rules make e+f a two-sided identity. The
specified basis defines the underlying ten-dimensional vector space, so no
linear independence or quotient-presentation assertion remains to check.

For an alternative finite hand check, after discarding idempotents,
incompatible corners and total degree greater than four, the only triples
are
\[
xut,yut,utx,uty,utu,unt,txu,tyu,tut,tun,ntu.
\]
Their common values under either bracketing are respectively
\[
qz,qz,z,q^2z,(1+q)v,qz,0,0,q(1+q)j,0,0.
\]
Here the degree assignment is deg(u)=deg(t)=1,
deg(x)=deg(y)=deg(n)=2, deg(v)=deg(j)=3, deg(z)=4. Each displayed
multiplication respects degree. N is a positive-degree ideal, so N⁵=0,
and C/N=k e⊕k f. To justify the radical identification: a nilpotent ideal
annihilates every simple module, since NM is either 0 or M for a simple M
and NM=M would imply N⁵M=M=0; thus N⊆rad C. Conversely, the image of
rad C in the semisimple quotient C/N is zero, hence rad C⊆N. The table
also gives ((ut)u)t=(1+q)vt=q(1+q)z, nonzero under the stated hypothesis.
The f-character C→k is the quotient map C→C/N followed by its f-projection,
so it defines s and s^r.

**Exactness in every degree.** Ce has basis e,x,y,z,t,j; Cf has basis
f,u,v,n. The right multiplication maps are given by
\[
\begin{array}{c|rrrrrr}
a&e&x&y&z&t&j\\\hline
au&u&v&v&0&(1+q)n&0\\
a\ell_i&\ell_i&q^{i+1}z&z&0&(1+q^{i+2})j&0.
\end{array}
\tag{F.3}
\]
For ·u the image is ⟨u,v,n⟩=ker(Cf→s) and the kernel is
⟨ℓ₀,z,j⟩. For ·ℓ_i, a kernel vector has zero e coefficient
because ℓ_i has a nonzero x coefficient, zero t coefficient because
1+q^{i+2}≠0, and coefficients satisfying a_y=q^{i+1}a_x. Thus
\[
\ker(\cdot\ell_i)=\langle\ell_{i+1},z,j\rangle,
\qquad
\operatorname{im}(\cdot\ell_i)=\langle\ell_i,z,j\rangle.
\tag{F.4}
\]
The image formula follows from the images of e,y,t in (F.3), using
1+q^{i+2}≠0. These formulas hold for every i≥0 and identify every
kernel with the next image in (F.1). They also give d²=0, including
ℓ₀u=0 and ℓ_{i+1}ℓ_i=0.

Each term is projective because C=Ce⊕Cf as a left C-module. Every
differential has image in N times its target, and each kernel of a
surjection R^{−i}→its syzygy lies in N R^{−i}. Such a surjection is a
projective cover: if a submodule U of R^{−i} plus its kernel is the whole
module, then U+N R^{−i}=R^{−i}, so the finite module R^{−i}/U satisfies
N(R^{−i}/U)=R^{−i}/U; iteration to N⁵=0 gives U=R^{−i}. Its kernel
is therefore superfluous. This supplies the minimality assertion explicitly.

**Derived Hom.** Evaluation at an idempotent identifies
Hom_C(Ce,s)=e s=0 and Hom_C(Cf,s)=f s=k. Applying Hom_C(−,s)
to (F.1) therefore gives (F.2)'s self-extension calculation, in all degrees.
Evaluation also identifies Hom_C(Ce,C)=eC and Hom_C(Cf,C)=fC as
right C-modules. A map determined by a∈eC sends ce to ca, and
precomposition with right multiplication by b is consequently left
multiplication by b on the representing element. Hence the Hom complex is
\[
fC\xrightarrow{u\cdot}eC\xrightarrow{\ell_0\cdot}eC
\xrightarrow{\ell_1\cdot}eC\longrightarrow\cdots.
\tag{F.5}
\]
Here fC has basis f,t,j,n and eC has basis e,x,y,z,u,v. Left multiplication
by u sends f,t,j,n to u,y+qx,z,v, which are linearly independent. For i≥0,
\[
\begin{array}{c|rrrrrr}
a&e&x&y&z&u&v\\\hline
\ell_i a&\ell_i&q^i z&qz&0&(1+q^i)v&0.
\end{array}
\tag{F.6}
\]
At i=0 its kernel is ⟨qx+y,z,u,v⟩, the image of u·, and its image is
⟨ℓ₀,z⟩. For every i≥1, the coefficient 1+q^i is nonzero, and (F.6)
gives kernel ⟨ℓ_{i−1},z,v⟩ and image ⟨ℓ_i,z,v⟩. Therefore (F.5) has
cohomology only in degree two, where the class of v is a basis.
Its right action is that of s^r: vf=v, ve=0, and among its right radical
products only vt=qz can be nonzero; z is a boundary in degree two.
Good truncations of (F.5) give a zigzag of quasi-isomorphisms to this
right module placed in degree two, namely s^r[−2].

**Source comparison and locators.** Definitions: `03-algebra.tex:12–33`,
Lemma `alg:C` at lines 35–62. Resolution and Ext statement:
`04-resolution.tex:22–44`, Lemma `res:base`; multiplication and kernel
calculations: lines 47–104. The independent attempt agrees with every displayed
kernel and image in that proof. The source does not explicitly state or prove
minimality in this lemma; the cover argument above adds it. The preprint's
homological resolution is written cohomologically here; its homological shift
s[2] corresponds to the same notation s[2] after translating indices, whereas
RHom_C(s,C) lies in cohomological degree +2 and is s^r[−2]. No mathematical
error was found in these source passages. No attribution claim about the
Schulz antecedent is used here.

polynomial calculation. All-degree exactness, minimality and derived Hom are
justified by (F.3)–(F.6), not inferred from finitely many resolution terms.

## 8.3. The symmetric algebra T and the Yoneda product

**Statement.** Under the hypotheses of 8.2 let D=Hom_k(−,k), L=DC,
and give L the C-bimodule structure
\[
(a\phi)(c)=\phi(ca),\qquad (\phi a)(c)=\phi(ac).
\]
Let T=C⋉L with product (a,φ)(b,ψ)=(ab,aψ+φb), and inflate s to a
left T-module through T→C. Then T is a twenty-dimensional symmetric
algebra; its radical is N⊕L, its radical sixth power is zero, and T/rad T=k².
There exists η∈Ext³_T(s,s) such that
\[
\operatorname{Ext}^{*}_T(s,s)=k[\eta],\qquad |\eta|=3.
\tag{F.7}
\]
Every nonzero class τ in Ext³ is also a polynomial generator. In particular,
τ=p(s) for the Hochschild cocycle of report 8.5, once that cocycle and its
specified two table values are certified there.

**Symmetry.** Associativity of C implies the bimodule identities for L by
evaluation on each c∈C; for example
((ab)φ)(c)=φ(cab)=(a(bφ))(c) and
((aφ)b)(c)=φ(bca)=(a(φb))(c). Expanding three factors in T now gives
(abc,abχ+aψc+φbc) under either bracketing, proving associativity.
The trace
\[
\mathrm{tr}(a,\phi)=\phi(1)
\]
satisfies
\[
\mathrm{tr}((a,\phi)(b,\psi))=\psi(a)+\phi(b).
\tag{F.8}
\]
This is symmetric and nondegenerate: if a≠0 choose ψ with ψ(a)≠0;
if a=0 and φ≠0 choose b with φ(b)≠0. Associativity of the pairing
follows from that of multiplication. Thus t↦(u↦tr(ut)) is a T-bimodule
isomorphism T→DT, which is the symmetric-algebra property. In the basis
consisting of a basis of C and its starred dual, tr(a b*)=δ_{a,b},
while pairings of two C letters or two L letters are zero. Thus each basis
letter has its starred letter as trace dual.

We will also use the following consequence of symmetry. For a finite
algebra \(A\), the natural isomorphism
\(\operatorname{Hom}_A(M,DA)\cong DM\) sends \(f\) to
\(m\mapsto f(m)(1)\); its inverse sends \(\ell\) to
\(m\mapsto(a\mapsto\ell(am))\). Thus \(DA\) is injective.
If \(A\cong DA\) is symmetric, finite projectives are injective.
Dualising a finite right-projective surjection onto \(DM\) embeds
\(M\) in a finite direct sum of copies of \(DA\cong A\).
These facts hold for opposite algebras as well. They justify the
projective embeddings and the separate left/right splitting arguments
used below.

Extend the grading in 8.2 by deg(a*)=5−deg(a). To check homogeneity,
a nonzero coefficient of c* in b a* means the coefficient of a in cb
is nonzero, so deg(c)+deg(b)=deg(a), and hence
\[
\deg(c^*)=5-\deg(c)=\deg(b)+\deg(a^*).
\]
The other dual action satisfies the same degree equation. Products in L²
are zero. All letters apart from e,f consequently have positive degrees
at most five; they span the ideal N⊕L, its sixth power is zero, and its
quotient is k². The nilpotent-ideal argument in 8.2 identifies it with rad T.

**The derived triangle.** For a finite projective left C-module V define
\[
\Phi_V:DC\otimes_C V\longrightarrow D\operatorname{Hom}_C(V,C),
\qquad
\Phi_V(\phi\otimes v)(g)=\phi(g(v)).
\tag{F.9}
\]
The balancing relation holds because g(cv)=c g(v). This map is an
isomorphism for V=C by evaluation at 1, and therefore for finite direct sums
and their summands, including every projective V under consideration. It is
left C-linear: acting by a on the left side changes its value to
φ(g(v)a), which is the left dual of the right action g↦g a on Hom.
It is natural in V. Applying it termwise to R gives an isomorphism of
complexes L⊗_C R≅D Hom_C(R,C). The cochain dual reverses degrees;
in characteristic two no sign adjustment is needed in the differential.
Duality is exact on vector spaces, and the preceding calculation of RHom
therefore gives cohomology s in degree −2 and zero elsewhere.
The left T-action on L⊗_C R factors through C because L²=0; thus good
truncations are T-linear and give L⊗_C R≃s[2].

View 0→L→T→C→0 as a short exact sequence of (T,C)-bimodules and
tensor with R termwise. Each R^n is projective as a left C-module, hence
flat, so this gives a short exact sequence of left T-module complexes
\[
0\longrightarrow L\otimes_C R\longrightarrow
\mathcal I:=T\otimes_C R\longrightarrow R\longrightarrow0,
\]
where R has its inflated T-action. With R≃s, its triangle is
\[
s[2]\longrightarrow\mathcal I\longrightarrow s
\xrightarrow{\eta}s[3].
\tag{F.10}
\]
The long exact cohomology sequence also shows that I has cohomology s in
degrees −2 and 0 and vanishes elsewhere. Consequently it represents an
object of D^b(T-mod), despite the chosen projective representative being
unbounded to the left.

Every term of I is projective over T: T⊗_C Ci≅Ti for i=e,f.
A bounded-above complex of projectives computes its derived maps. Here this
can be justified directly: given a chain map from it to an acyclic complex,
construct a nullhomotopy starting in its greatest nonzero degree and then
descending. At a given degree, the residual map lands in the cycles of the
acyclic target, and the preceding target differential surjects onto these
cycles; projectivity provides the next lift. Each degree requires only one
previous choice, so the induction continues over all degrees. Applying this
to cones of quasi-isomorphisms shows that localization does not change maps
out of I. Termwise induction-restriction adjunction and (F.2) now imply
\[
B^a:=\operatorname{Hom}_{D^b(T)}(\mathcal I,s[a])
=H^a\operatorname{Hom}_C(R,s)
=\begin{cases}k&a=0,\\0&a\ne0.\end{cases}
\tag{F.11}
\]

**Every degree and its multiplication.** Put
V^a=Hom_{D^b(T)}(s,s[a]). For a≥0 these are the ordinary Ext groups;
for a<0 they vanish, as is seen from any projective resolution concentrated
in nonpositive cohomological degrees. Also V⁰=End_T(s)=k. The exact
sequence obtained by applying Hom(−,s[a]) to (F.10) includes
\[
B^{a-1}\longrightarrow V^{a-3}
\xrightarrow{\mu_a}V^a\longrightarrow B^a,
\qquad
\mu_a(\beta)=\beta[3]\circ\eta.
\tag{F.12}
\]
For a=1 the middle-left and final groups are zero, so V¹=0.
For every a≥2 both B-groups vanish, so μ_a is an isomorphism. In
particular V²=0, μ₃ takes id_s to a nonzero η, and induction shows
V^{3m}=kη^m for every m≥0 while all other nonnegative degrees vanish.
The formula for μ_a is precisely Yoneda composition (with shifts).
Thus no power of η vanishes, and evaluation k[t]→Ext*_T(s,s), t↦η,
is bijective in each degree and preserves products. This gives (F.7) as a
graded algebra, not only as a graded vector space. Replacing η by any
nonzero scalar multiple preserves this conclusion.

**Normalization by the explicit cocycle.** The cocycle certificate in 8.5
has values p(t,x,J)=0 and p(t,y,J)=q³f. Here J=j* and the capital T in
the following bar words is the dual basis letter t*, not the algebra T.
The two-sided-simple bar chain
\[
\zeta=q^2[t|x|J]+[t|y|J]
\]
is a cycle: its outer terms vanish because radicals annihilate both endpoint
simples, while tx=j, ty=q²j, xJ=t*, and yJ=q²t* make its four internal
terms cancel in pairs. The evaluation of p on it is q³. Any coboundary
pairs to zero with a cycle because evaluation intertwines the cochain and
chain differentials. Since q≠0, p(s) is nonzero. The fact that p(s) is a
cocycle, and hence defines a cohomology class to which this argument applies,
is the finite Hochschild-cocycle identity supplied in 8.5; the two values
alone would not justify it. Consequently τ=p(s) is a permissible generator
in (F.7), independently of the scalar chosen in L⊗_C R≃s[2].

The nonzero Ext³ shows that s is not projective. Therefore stable End_T(s)=k
as well: a nonzero scalar endomorphism factoring through a projective would
make id_s factor through a projective and exhibit s as a projective summand.
This observation supplies the degree-zero ordinary/stable comparison used
later in the tensor-square calculation.

**Source comparison and locators.** `03-algebra.tex:80–124` contains the dual
actions and Lemma `alg:T`; `04-resolution.tex:114–200`, Lemma
`res:polynomial`, contains the triangle and multiplicative recurrence. The
cycle evaluation is `03-algebra.tex:189–212`, Lemma `coc:data`, with its
two entries also restated in `09-cochain.tex:119–124`. The independent
triangle attempt agrees with the source, including the a=1 endpoint and
β↦β[3]∘η orientation. The expanded K-projectivity and finite-projective
duality arguments above justify rather than merely name the facts used.
[verdict omitted] in these source passages. The source's
homological degree 2 is cohomological degree −2 here.

The normalization τ=p(s) is **[status omitted] conditional on the explicit finite
cocycle identity in the 8.5 contribution**; the cycle argument itself is
complete and makes the dependency explicit. No finite computation of Ext
is used to infer its all-degree structure.


## 8.4. The tensor square and the two-cone profile

### 8.4.1. The tensor-square Ext algebra

**Statement.** Work over k=F₂(q,H₁,H₂). Suppose T is the symmetric algebra of §8.3 and s its one-dimensional simple with Ext*_T(s,s)=k[τ], |τ|=3. Put E=T⊗ₖT and S=s⊗ₖs. Then E is symmetric and

\[
\operatorname{Ext}^*_E(S,S)=k[\tau_1,\tau_2],\qquad |\tau_i|=3,
\quad\tau_1=\tau\otimes1,\quad\tau_2=1\otimes\tau.
\tag{1}
\]

**Proof.** Let t:T→k be a symmetrizing form. The form t⊗t on E is symmetric because t(ab)=t(ba), associative because the induced pairing is (x,y)↦(t⊗t)(xy), and nondegenerate because the tensor product of the two nonsingular Gram matrices is nonsingular. Thus E≅DE as bimodules. The same argument applies to Eᵉ=E⊗Eᵒᵖ.

Choose a projective resolution Q→s in cohomological degrees ≤0 with finite terms. The total complex Q⊗ₖQ has finitely many summands in each degree and finite projective E-terms: tensor products of summands of finite free T-modules are summands of finite free E-modules. It resolves S. For the last assertion, choose vector-space splittings of boundaries and cycles in Q, expressing Q as its cohomology s in degree zero plus contractible two-term complexes. Tensoring a contractible complex with any complex is contractible by the tensor of its contracting homotopy with the identity (the signs vanish here). Therefore Q⊗Q has cohomology S in degree zero and no other cohomology.

Termwise Hom into S gives a canonical isomorphism of complexes

\[
\operatorname{Hom}_E(Q\otimes Q,S)
 =\operatorname{Hom}_T(Q,s)\otimes_k\operatorname{Hom}_T(Q,s).
\]

The same splitting argument gives the Künneth isomorphism on cohomology. Its multiplicative compatibility can be checked on comparison maps: represent τ by a lift Q→Q[3]. On Q⊗Q the two induced degree-three maps act on different tensor factors and commute in characteristic two. Their powers represent the external products τ^i⊗τ^j. In degree 3m these m+1 elements, for i+j=m, form the Künneth basis; all other positive degrees vanish. Hence there are no polynomial relations, and (1) follows.

Since S is one-dimensional, End_E(S)=k. Its degree-three Ext group is nonzero, so S is not projective. If a nonzero endomorphism of S factored through a projective, it would be a nonzero scalar multiple of the identity, making S a direct summand of that projective. This contradicts its nonprojectivity. Hence stable End_E(S)=k as well.


### 8.4.2. All Tate degrees and multiplication by τ₁,τ₂

Write H^a=Êxt^a_E(S,S). Let P_m=k[τ₁,τ₂]_m, assigning each variable polynomial degree one; set P_m=0 for m<0. Then

\[
H^{3m}=P_m,\qquad H^{-3m-1}=DP_m\quad(m\ge0),
\qquad H^a=0\text{ otherwise}.
\tag{2}
\]

Here the duality is the Tate duality for symmetric algebras, with [1]=Ω⁻¹. The source has been read in its pinned version: Markus Linckelmann, *Tate duality and transfer in Hochschild cohomology*, [arXiv:1211.5999v1](https://arxiv.org/abs/1211.5999v1), 26 November 2012, local file `Lin12a - Tate Duality and Transfer in Hochschild Cohomology.pdf`. The title, author, arXiv version and the convention of finite left modules were checked. Exact locators: §2, (2.1), p.3, gives

\[
\widehat{\operatorname{Ext}}^{n-1}_E(V,U)
 \cong D\widehat{\operatorname{Ext}}^{-n}_E(U,V).
\]

The text immediately following states, verbatim, “which is natural in U and V.” Formula (2.3), p.4, is its degree-zero stable-Hom form. Shift compatibility is (2.6), p.5. Compatibility with Yoneda composition is (2.7)–(2.8), pp.5–6; symmetry of the pairing is (2.10), p.6. These locators, including the displayed identities, were read, rather than inferred from the preprint's bibliography.

Applying (2.1) with U=V=S and n=-a proves (2). The action

\[
\tau_i:H^{-3m-1}=DP_m\longrightarrow
 H^{-3(m-1)-1}=DP_{m-1}\quad(m\ge1)
\tag{3}
\]

is the transpose of multiplication P_{m-1}→P_m by τ_i. To see the direction without an indexing guess, use the natural isomorphism D Hom(S,N)≅Hom(N,S[-1]) with N=S[a]. The transpose of postcomposition by τ_i[a]:S[a]→S[a+3] is precomposition by that same map, namely Hom(S[a+3],S[-1])→Hom(S[a],S[-1]). After shifting source and target, this is right multiplication by τ_i from H^{-a-4} to H^{-a-1}. For a=-3m-1 these degrees are 3m-3 and 3m, so they are the positive polynomial multiplication map. The shift identifications are compatible with the source's (2.6).

For an explicit basis, let ε_{ij}∈H^{-3(i+j)-1} be dual to τ₁^iτ₂^j. Then

\[
\tau_1\varepsilon_{ij}=\begin{cases}\varepsilon_{i-1,j}&i>0,\\0&i=0,\end{cases}
\qquad
\tau_2\varepsilon_{ij}=\begin{cases}\varepsilon_{i,j-1}&j>0,\\0&j=0.\end{cases}
\tag{4}
\]

The remaining product from H^{-1} lands in H²=0. Iterating (4) determines every action of a nonnegative-degree monomial on a negative group. Products of two negative classes vanish by (2), since their sum has degree -3r-2, which is outside the support. Right actions agree with (4), by symmetry of the duality pairing (2.10) and its composition compatibility (2.8). Thus this also specifies the full multiplication on the negative part; no finite truncation has been used.


### 8.4.3. Finite side-projective bimodule representing the two cones

**Statement and definitions.** Let P→T be the bimodule bar resolution, now written cohomologically in degrees ≤0. Assume a chain map p:P→P[3] represents a Hochschild class whose evaluation at s is τ. This is the cocycle input of report §8.5; it is not inferred merely from the positive Ext algebra. Put

\[
\mathcal L=\operatorname{Cone}(p[-3]:P[-3]\to P),\qquad
K=\mathcal L\otimes_k\mathcal L.
\tag{5}
\]

Set R=Eᵉ. For N≥1 put C_N=coker(K^{-N-1}→K^{-N}) and let 𝒞 be a finite R-module representing C_N[N] in stmod R. Then every term of K is a finite projective R-module, K is exact in degrees <0, and C_N and 𝒞 are projective separately as left and right E-modules. Evaluation on S gives exact stable triangles

\[
S[-3]\xrightarrow{\tau_1}S\longrightarrow Y\xrightarrow{\pi_1}S[-2],
\tag{6}
\]
\[
Y[-3]\xrightarrow{\tau_2}Y\longrightarrow \mathcal C\otimes_E S
 \xrightarrow{\pi_2}Y[-2].
\tag{7}
\]

The label τ₂ in (7) denotes the map induced by the comparison map on the second tensor factor. The top-cell projection is

\[
\pi=\pi_1[-2]\pi_2:\mathcal C\otimes_E S\longrightarrow S[-4].
\tag{8}
\]

**Proof.** Since the bar resolution is finite in every degree and bounded above, each degree of K contains finitely many external tensor summands. Every summand is projective over R, by the direct-summand argument used for (1). Put Q=P⊗P, a projective E-bimodule resolution of E. The four cone cells give a filtration of K with associated complexes Q, Q[-2]⊕Q[-2], Q[-4]. Their cohomology is supported in degrees 0,2,4 respectively. The long exact cohomology sequences of this finite filtration show that K and every filtration subcomplex have no cohomology in negative degrees.

Passing a degreewise split exact sequence of these complexes to cokernels in degree -N is exact. Here is the injectivity check. Suppose b∈B^{-N} becomes a boundary in V^{-N}, where 0→B→V→D→0 is such a sequence. Choose v∈V^{-N-1} with dv=b. Its image d̄ in D^{-N-1} is a cycle. Since H^{-N-1}(D)=0, it is the differential of an element of D^{-N-2}. Lift that element to V and subtract its differential from v. The result lies in B^{-N-1} and still has differential b. Thus b was already a boundary in B. Surjectivity and exactness in the middle follow by lifting representatives.

Consequently \(C_N\) has a filtration with factors \(Z_N(Q)\),
two copies of \(Z_{N+2}(Q)\), and \(Z_{N+4}(Q)\), where
\[
 Z_j(Q)=\operatorname{coker}(Q^{-j-1}\to Q^{-j}).
\]
These actual bar-resolution cokernels are stably isomorphic to
\(\Omega_R^jE\), but need not equal the minimal syzygies as modules.
Each factor is projective on both \(E\)-sides: the augmented resolution
of \(E\) splits on each side because \(E\) is projective there, and
induction on the split kernel sequences gives the same property for
every \(Z_j(Q)\). The short exact sequences of the filtration split on each side because their quotients are projective on that side. Hence C_N is side-projective.

An E-bimodule syzygy of a side-projective module is side-projective: take an R-projective surjection and split its kernel sequence on each side. An E-bimodule cosyzygy is likewise side-projective: R is symmetric, so a finite R-module embeds into a finite R-projective-injective module; side-projective modules are side-injective since E is symmetric, and the embedding splits on each E-side. Its cokernel is therefore projective on each side. Applying N cosyzygies produces the finite side-projective representative 𝒞.

The tail choice is independent of N. Exactness gives

\[
0\to C_{N+1}\to K^{-N}\to C_N\to0,
\]

so C_{N+1}≅C_N[-1] in stmod R and C_{N+1}[N+1]≅C_N[N]. A chain map on sufficiently negative tails induces maps of these cokernels. A homotopy changes the induced map by a map through a projective term; therefore the resulting stable maps are well-defined. Applying the preceding cokernel exactness to the degreewise split cone sequences shows that they give the corresponding triangles in stmod R, with connecting maps induced by the differential between cone cells.

The first-factor cone tensored externally with P is the first object used for (6). Acting on its second factor by p gives a chain map to its shift by three. Shifting this map by [−3] and then taking its cone gives exactly K, with the tensor differential. This is a chain-level assertion: each differential consists of the internal differential and one copy of p between its two cells, so grouping terms first by the second cone factor yields that cone, with no additional component. The two factor maps commute since they act in different tensor slots and characteristic two removes the tensor signs.

For any side-projective E-bimodule M, tensoring M⊗_E− is exact and sends projectives to projectives: a projective left module is a summand of E^r, and its image is a summand of M^r. Every R-projective also evaluates at S to an E-projective, since a free R-module evaluates to E⊗ₖS. All the short exact sequences above split on the right, so evaluation at S preserves them. Hence it preserves their stable triangles and shifts. This yields (6), (7), and the projection (8).

**Conventions compared with the source.** The source uses homological complexes and says K is exact in positive degrees, with cells in degrees 0,-2,-4. The cohomological translation here is exactness in negative degrees and cells in degrees 0,2,4. In both conventions the stable cells are S,S[-2]²,S[-4], and the tail is the N-fold cosyzygy of the indicated cokernel. No change to the stable shift has been made.


### 8.4.4. All-degree profile and the actual top projection

**Statement.** For the bimodule in (5), put W^a=Êxt^a_E(S,𝒞⊗_E S). Then, for every a∈Z,

\[
W^a=\begin{cases}k&a=0\text{ or }3,\\0&\text{otherwise.}\end{cases}
\tag{9}
\]

The bottom-cell inclusion S→𝒞⊗S induces H⁰≅W⁰. The actual projection (8) induces an isomorphism

\[
\pi[3]_*:W^3\xrightarrow{\sim}H^{-1}=k\varepsilon_{00}.
\tag{10}
\]

**Proof.** Put U^a=Êxt^a_E(S,Y). Apply stable Hom from S to (6). Exactness gives

\[
0\to\operatorname{coker}(\tau_1:H^{a-3}\to H^a)
\longrightarrow U^a\xrightarrow{\pi_1[a]_*}
\ker(\tau_1:H^{a-2}\to H^{a+1})\to0.
\tag{11}
\]

On the positive part of H, multiplication by τ₁ is injective and its cokernel is k[τ₂]; in degree zero this includes the cokernel of the zero map H^{-3}→H⁰. On the negative part it is the transpose of the injective map P_{m-1}→P_m, and hence surjective. Its kernel in DP_m is the line kε_{0m}. At m=0, its target is H²=0 and the same kernel description applies. No other degrees have a source or target. It follows that

\[
U^{3m}=kx_m\ (m\ge0),\qquad
U^{1-3m}=ky_m\ (m\ge0),\qquad U^a=0\text{ otherwise},
\tag{12}
\]

where x_m is the image of τ₂^m under H^{3m}→U^{3m}, and π₁[1−3m]_*(y_m)=ε_{0m}. The two lists in (12) do not overlap, because their degrees are incongruent modulo three. This also means that every nonzero U^a in (11) is identified canonically either with the cokernel on its left or with the kernel on its right; there is no choice of an extension splitting.

The second-factor comparison map acts on the entire triangle (6), by its commuting chain map described above. Therefore the maps in (11) commute with its action. Using (4),

\[
\tau_2x_m=x_{m+1}\quad(m\ge0),\qquad
\tau_2y_m=y_{m-1}\quad(m\ge1),\qquad \tau_2y_0=0.
\tag{13}
\]

The last equality also follows from U⁴=0. Thus multiplication by τ₂ on U has one-dimensional cokernel only at degree zero, and one-dimensional kernel only on U¹.

Apply stable Hom from S to (7). The result is

\[
0\to\operatorname{coker}(\tau_2:U^{a-3}\to U^a)
\to W^a\xrightarrow{\pi_2[a]_*}
\ker(\tau_2:U^{a-2}\to U^{a+1})\to0.
\tag{14}
\]

By (13), the first end of (14) is k only if a=0, while the second end is k only if a−2=1, namely a=3. Both ends vanish in every remaining degree. This gives (9), without a finite-range argument. In degree zero the isomorphism is induced by the bottom-cell inclusion. In degree three, (14) identifies W³ with U¹ via the second-cone projection, and (11) identifies U¹ with H^{-1} via the first-cone projection. Their composite is exactly π[3] from (8). Therefore (10) holds for the actual projection, not just for an abstract one-dimensional vector-space identification.


### 8.4.5. Comparison with the preprint and issues

After recording the independent attempt, the complete proofs of `.cache/ar-src/05-cones.tex`, Lemma `cone:finite` and Proposition `cone:profile`, were read. The source uses the filtration by the number of shifted factors and an exact Koszul row; this note uses two successive cone triangles. Both track the top projection. The source separately excludes the possible further top attaching map by examining its actual long exact sequence; the successive-cone proof incorporates that map from the outset. [verdict omitted] in those two source proofs.

Precise convention issue for the report: source homological support 0,-2,-4 translates into cohomological support 0,2,4, while the stable cells retain their shifts S,S[-2]²,S[-4]. Copying the source's assertion of exactness in positive complex degrees into cohomological conventions would reverse the assertion. The source itself is consistent.

Dependency to retain explicitly: the complex (5) requires a Hochschild representative evaluating to τ. The abstract polynomial Ext algebra alone does not supply that representative. The full dossier must link this input to its checked cocycle construction in §8.5; this note does not silently infer it from (1).

No bracket computation is required for §§1–4. The multiplication needed here is the Tate-duality action (4), not a claim about a Toda bracket. The source's full top-cell map is preserved by (8) and (10).


## 8.5. Twists, the cocycle and the bimodule lifts

### 8.5.1. The cochain and its boundary identity

Continue over \(k=\mathbb F_2(q,H_1,H_2)\). The finite identities below
also hold after characteristic-two specialisation with \(q\ne0\),
but identifying their evaluation as a polynomial generator uses the
infinite-order hypothesis on \(q\) in §8.3.
Use \(C,T,s\) from §§8.2–8.3. Put \(I=ke\oplus kf\) and
\(\mathfrak r=\operatorname{rad}T\). Capital letters in the finite
cochain table denote dual basis vectors; for example, its letters
\(E,T\) mean \(e^*,t^*\), not the algebras of those names. Put
\(\varepsilon(a)=0\) on lower-case letters and \(1\) on their capital
duals. All complexes below are cohomological. Define
\[
 P^{-n}=T\otimes_I\mathfrak r^{\otimes_I n}\otimes_I T\quad(n\ge0),
 \qquad P^j=0\quad(j>0).
\]
The differential sums adjacent multiplications and the augmentation
\(\pi:P^0\to T\) is multiplication. Each term decomposes into copies of
\(Ti\otimes_kjT\), \(i,j\in\{e,f\}\), so is projective as a bimodule.
For exactness, write \(a_0=a_0^I+\overline a_0\) according to
\(T=I\oplus\mathfrak r\), and insert \(\overline a_0\) as the first
bar, replacing the first coefficient by \(1\). In augmented degree send
\(a\) to \(1[]a\). In \(d\sigma+\sigma d\), all adjacent
multiplications except the first occur twice; the first contribution is
\(\overline a_0\), while balancing \(a_0^I\) over \(I\) supplies the
remaining \(a_0^I\). Thus \(d\sigma+\sigma d=1\). This contraction is
right linear, so \(P\otimes_Ts\) is a projective resolution of \(s\).

Define \(p:\mathfrak r^{\otimes_I3}\to T\) by the complete literal table
in the variable `table` of
`computations/08-D-E/finite_cochain_certificate.py`: a word \(abcv\)
in row \(d\) means that the coefficient of \(v\) in \(p(a,b,c)\) is
\(q^d\); all unlisted coefficients are zero. The script contains all 179
entries and the complete multiplication definition of \(C\), so this is a
self-contained finite definition.

For \(\lambda\in k^\times\), let
\[
 h_\lambda(c+\phi)=c+\lambda\phi,\qquad
 z_\lambda(a)=
 \begin{cases}
 \lambda q a,&a\in\{u,v,t,E,X,Y,Z,U,V\},\\
 0,&\text{otherwise}.
 \end{cases}
\]
Then \(h_\lambda\) is an automorphism, because \(DC\) is a square-zero
bimodule ideal and all mixed products are linear in that ideal.
The cochain \(p\) has dual-letter weight \(-1\), is a Hochschild
cocycle, has nonzero evaluation on \(s\), and satisfies
\[
 \sum_{w\in\mathcal B_{\mathfrak r}}p(a,b,h_\lambda(w))w^*
 =az_\lambda(b)+z_\lambda(ab)+z_\lambda(a)h_\lambda^{-1}(b)
 \quad(a,b\in\mathfrak r).                               \tag{8.5.1}
\]

Finite identity proof and scope. The new script represents polynomials
in \(\mathbb F_2[q]\) as exact binary coefficient vectors: addition is
XOR and multiplication is carry-free polynomial multiplication. It
constructs \(T\) from \(C\) using
\[
 \mu_{a,b^*}^{c^*}=\mu_{ca}^{b},\qquad
 \mu_{b^*,a}^{c^*}=\mu_{ac}^{b},\qquad (DC)^2=0.
\]
It checks all \(20^3=8000\) associativity triples. For every radical
four-word it computes
\[
 ap(b,c,d)+p(ab,c,d)+p(a,bc,d)+p(a,b,cd)+p(a,b,c)d
\]
as a complete coefficient vector and finds zero. The \(18^4=104976\)
inputs include every one of the 15250 composable four-words. The script
checks corners and
\(\varepsilon(a)+\varepsilon(b)+\varepsilon(c)-\varepsilon(v)=1\)
on each nonzero entry. Corner agreement supplies well-definedness over
\(I\); multilinearity gives the Hochschild and weight identities on all
inputs.

For (8.5.1) write \(z_\lambda(a)=\lambda\gamma_a a\). On each of the
324 radical input pairs, for each output letter \(v\), the script
checks both the constant and linear coefficients in \(\lambda\):
\[
 \varepsilon(b)\gamma_a\mu_{ab}^v,\qquad
 \bigl(\gamma_b+\gamma_v+(1-\varepsilon(b))\gamma_a\bigr)\mu_{ab}^v.
\]
These are exactly the right-hand coefficients, since its last term has
coefficient \(\lambda^{1-\varepsilon(b)}\gamma_a\mu_{ab}^v\).
Thus the identity holds over \(\mathbb F_2[q,\lambda]\), and hence
after every characteristic-two specialisation with \(\lambda\ne0\).
There is no numerical specialisation in this certificate.
Its saved output, `finite_cochain_certificate.out` in the same directory,
records 'all enumerated polynomial identities hold'.
The certificate covers precisely the stated finite multilinear identities,
the cycle and Casimir calculations below; it does not alone claim any
all-degree Ext or stable-category conclusion.

To establish nonzero evaluation, use the two-sided-simple bar cycle
\[
 \zeta=q^2[t|x|J]+[t|y|J]
 \in s^{\mathrm r}\otimes_TP^{-3}\otimes_Ts.
\]
Outer radical actions vanish, and
\(tx=j,\ ty=q^2j,\ xJ=T,\ yJ=q^2T\) make the inner differential terms
cancel in pairs. The table gives \(p(t,x,J)=0\) and
\(p(t,y,J)=q^3f\). Hence the simple-valued cochain evaluates to
\(q^3\ne0\) on \(\zeta\). A coboundary evaluates to zero on every cycle,
because its pairing is evaluation after the bar differential. Thus
\(\tau=[p\otimes_Ts]\ne0\); by 8.3 it is a choice of polynomial
generator.

Use the same letter for the comparison \(p:P\to P[3]\):
\[
 p(a_0[a_1|\cdots|a_n]a_{n+1})
 =a_0[a_1|\cdots|a_{n-3}]
      p(a_{n-2},a_{n-1},a_n)a_{n+1}\quad(n\ge3),
\]
and zero for \(n<3\). In \(dp+pd\), every multiplication strictly before
the last four bars occurs twice; the remaining five terms are the
Hochschild equation following the unchanged prefix. At \(n=3\), the
target differential has zero target and \(p\) vanishes on \(P^{-2}\).
The lower indices give zero too. This proves the chain identity at
every index.

the cycle calculation. Identification as a polynomial generator depends
on 8.3.

### 8.5.2. Twists on every homogeneous self-extension

For a left \(T\)-module \(M\), the map
\[
 T_{h_\lambda}\otimes_TM\longrightarrow{}_{h_\lambda^{-1}}M,\qquad
 a\otimes m\longmapsto h_\lambda^{-1}(a)m
\]
is a balanced left-module isomorphism, with inverse \(m\mapsto1\otimes m\).
The target action is \(b\cdot m=h_\lambda^{-1}(b)m\).
The character of \(s\) is fixed, giving a canonical identification of its
twist with \(s\).

On \(P\otimes_Ts\), applying \(h_\lambda^{-1}\) to the first coefficient
and all bars gives a comparison to this twisted resolution: it is left
linear for the specified action, commutes with every adjacent product,
and induces the identity on the augmented simple. Only weight-zero
outputs of \(p\) act nontrivially on \(s\). The weight identity therefore
says that every nonzero component of its simple-valued cochain has exactly
one capital input. The comparison multiplies it by \(\lambda^{-1}\).
Thus the exact tensor functor sends \(\tau\) to \(\lambda^{-1}\tau\).
It preserves splices of extensions, hence Yoneda products, and sends
\[
 \tau^m\longmapsto\lambda^{-m}\tau^m\qquad(m\ge0).
\]

Put \(E=T\otimes_kT\), \(S=s\otimes_ks\) and
\(E_\lambda=E_{h_\lambda\otimes h_\lambda}\). The tensor functor twists
both factors; under 8.4, it sends
\[
 \tau_1^r\tau_2^{m-r}\longmapsto
 \lambda^{-m}\tau_1^r\tau_2^{m-r}\quad(0\le r\le m).
\]
These monomials form a basis, so its action on all of
\(\widehat{\operatorname{Ext}}_E^{3m}(S,S)\) is the scalar
\(\lambda^{-m}\), including \(m=0\).

### 8.5.3. The lift to the two-cone bimodule

Let
\[
 K=\operatorname{Cone}(p[-3]:P[-3]\to P)\otimes_k
   \operatorname{Cone}(p[-3]:P[-3]\to P).
\]
Its cell indexed by \(J\subseteq\{1,2\}\) is
\(P^{\mathrm{tot}}[-2|J|]\), where \(P^{\mathrm{tot}}=P\otimes_kP\).
Let \(\mathcal C\) be its finite stable bimodule representative from 8.4.
For each \(\lambda\ne0\), there is a stable bimodule map
\[
 f_\lambda:E_\lambda\longrightarrow\mathcal C[3]            \tag{8.5.2}
\]
whose top projection to \(E[-1]\) is represented by
\[
 \beta_\lambda:E_\lambda\longrightarrow
 \Omega_{E^e}E\subset P^{\mathrm{tot},0},\qquad
 \beta_\lambda(1)=\xi_\lambda\otimes\xi_\lambda,\quad
 \xi_\lambda=\sum_{w\in\mathcal B}h_\lambda(w)\otimes_Iw^*.
\]
On evaluation at \(S\), the latter sends
\[
 1\longmapsto\lambda^2(f^*\otimes f^*)
 \in\Omega_ES=\operatorname{rad}(E)(f\otimes f).            \tag{8.5.3}
\]
This is nonzero stably, and hence so is the evaluation of \(f_\lambda\).

Here \(\Omega\) has the report's minimal-syzygy meaning. Indeed, writing
\(r\) for the four primitive vertex idempotents of \(E\), the module
\(P^{\mathrm{tot},0}\) is \(\bigoplus_r Er\otimes_k rE\).
Its top as an \(E^e\)-module is \(k^4\), and the augmentation induces
an isomorphism from that top onto
\(E/(\operatorname{rad}(E)E+E\operatorname{rad}(E))=E/\operatorname{rad}(E)
\cong k^4\). Its kernel lies in the radical of its projective source,
so it is a projective cover. To justify the last implication, a submodule
mapping surjectively to \(E\), together with the kernel, generates the
source; the quotient by that submodule is equal to its radical and must
be zero because the radical is nilpotent. On evaluation at \(S\), the
same augmentation is the cover \(E(f\otimes f)\to S\).

The Casimir identities. The tensor \(\sum w\otimes w^*\) corresponds
to the identity under
\[
 T\otimes_kT\longrightarrow\operatorname{End}_k(T),\quad
 x\otimes y\longmapsto(t\mapsto x\operatorname{tr}(yt)).
\]
Both its left multiplication by \(a\) and its right multiplication by
\(a\) correspond to \(t\mapsto at\). Applying \(h_\lambda\) to the
first factor and projecting to \(\otimes_I\) gives
\[
 h_\lambda(a)\xi_\lambda=\xi_\lambda a.                   \tag{8.5.4}
\]
Consequently \(b:T_{h_\lambda}\to P^0,\ b(x)=x\xi_\lambda\), is a
bimodule map. For a lower-case \(w\), the products \(ww^*\) and \(w^*w\)
are the duals of its left and right idempotents. The dual-action formulas
reduce this to the coefficient of \(w\) in \(cw\) and \(wc\); the
positive grading makes those coefficients zero for radical \(c\), while
idempotents give the claimed value. Since both the row and column
dimensions of \(C\) are \(6,4\), characteristic two gives
\[
 \pi\xi_\lambda=\sum_{w\in\mathcal B_C}ww^*
       +\lambda\sum_{w\in\mathcal B_C}w^*w=0.              \tag{8.5.5}
\]
Separating by left vertex and deleting its sole idempotent summand yields
\[
 \sum_{\substack{w\in\mathcal B_{\mathfrak r}\\
                   \operatorname{left}(w)=r}}
 h_\lambda(w)w^*=r^*\qquad(r=e,f).                       \tag{8.5.6}
\]
The certificate also checks both identities coefficientwise in
\(\lambda\). Since \(\pi b=0\), \(b\otimes_kb\) takes values in the
kernel of the augmentation to \(E\), as required for \(\beta_\lambda\).

The first homotopy. Set \(Q=P_{h_\lambda}\), with augmentation
\(\epsilon:Q^0\to T_{h_\lambda}\). Every map from \(Q\) to an
untwisted target is specified below on bar generators and extended by
\[
 \psi(a_0[a_1|\cdots|a_n]a_{n+1})
 =a_0\psi([a_1|\cdots|a_n])h_\lambda^{-1}(a_{n+1}),       \tag{8.5.7}
\]
where the last coefficient is its underlying element of \(T\).
This is exactly the twisted-source right-linearity rule.
Let \(D_b:Q\to P\) have degree-zero component \(b\epsilon\) and all
other components zero. It is a chain map since \(\epsilon d=0\).
Define
\[
 B_n:Q^{-n}\to P^{-n-1},\qquad
 B_n([a_1|\cdots|a_n])
 =\sum_w[a_1|\cdots|a_n|h_\lambda(w)]w^*\quad(n\ge0),     \tag{8.5.8}
\]
where \(w\) ranges over the composable radical letters.
Then \(dB+Bd=D_b\), as follows.

For a radical \(a\) with right vertex \(r\), project the first factor of
\(a\xi_\lambda=\xi_\lambda h_\lambda^{-1}(a)\) onto \(\mathfrak r\).
Deleting idempotent letters on the first side removes \(a\otimes r^*\);
on the second side the idempotent first factors project to zero. Hence
\[
 \sum_w ah_\lambda(w)\otimes_Iw^*
 +\sum_w h_\lambda(w)\otimes_Iw^*h_\lambda^{-1}(a)
 =a\otimes_Ir^*,                                        \tag{8.5.9}
\]
with \(w\) radical. At \(n>0\), all prefix multiplications in
\(dB_n+B_{n-1}d\) cancel pairwise. The two terms involving the old
last bar sum to \([a_1|\cdots|a_n]r^*\) by (8.5.9); the terminal
multiplication of the appended bar gives that same expression by
(8.5.6), so the total vanishes. At \(n=0\), on \(r[]r\), the
differential gives the radical part of \(r\xi_\lambda\) plus \(r[]r^*\),
which restores precisely its omitted idempotent summand. Its value is
therefore \(b\epsilon(r[]r)\). Bimodule linearity completes degree zero.

An explicit second homotopy. Set \(G_0=0\) and
\[
 G_n:Q^{-n}\to P^{-n+1},\qquad
 G_n([a_1|\cdots|a_n])
 =[a_1|\cdots|a_{n-1}]z_\lambda(a_n)\quad(n\ge1),          \tag{8.5.10}
\]
using (8.5.7). Corners are preserved, so these maps are well defined.
For \(n\ge2\), prefix cancellation in \(dG+Gd\) leaves
\[
 [a_1|\cdots|a_{n-2}]
 \bigl(a_{n-1}z_\lambda(a_n)+z_\lambda(a_{n-1}a_n)
       +z_\lambda(a_{n-1})h_\lambda^{-1}(a_n)\bigr).
\]
By (8.5.1), this equals \(pB_n\), since \(p\) evaluates the final
three bars of (8.5.8). At \(n=0,1\), both sides vanish:
\(pB_n\) has target \(P^{2-n}=0\), \(G_0=0\), and \(d:P^0\to P^1=0\).
It follows that
\[
 pB=dG+Gd                                                \tag{8.5.11}
\]
in every degree. The preprint obtains \(G_n\) by recursive projective
lifting; formula (8.5.10) is a direct alternative.

The tail map. The complex \(Q\otimes_kQ\) resolves \(E_\lambda\).
In \(K[3]\), the top cell is \(P^{\mathrm{tot}}[-1]\) and the
singleton cells are \(P^{\mathrm{tot}}[1]\). Define
\[
 \Phi_{\{1,2\}}=B\otimes D_b,\qquad
 \Phi_{\{2\}}=G\otimes D_b,\qquad
 \Phi_{\{1\}}=\Phi_\varnothing=0.
\]
The indicated degrees agree with (8.5.8) and (8.5.10).
The top internal defect is \(D_b\otimes D_b\). Deleting slot 1 gives
\(pB\otimes D_b\) in cell \(\{2\}\), cancelling its internal defect
\((dG+Gd)\otimes D_b\). Deleting slot 2 gives zero because \(pD_b=0\).
Thus only \(D_b\otimes D_b\) remains, supported at source degree zero.
The map commutes with the differential at every degree \(-n\), \(n>0\).

For \(n\ge4\), both relevant complexes are in their exact tails. Taking
cokernels at degree \(-n\) and then the stable shift \([n]\) gives
(8.5.2). At \(n=4\), the target is
\(\operatorname{coker}(K^{-2}\to K^{-1})[4]\), representing
\(\mathcal C[3]\). The top component has defect
\((b\otimes b)\epsilon^{\mathrm{tot}}\), so it is exactly the
resolution comparison of \(\beta_\lambda\) with its syzygy target.
This identifies the asserted top projection.

Stable nonzero evaluation. Tensoring \(\xi_\lambda\) with \(s\)
kills every term except the one whose terminal coefficient is \(f\).
That term has \(w=f^*\) and value \(\lambda f^*\). Taking the square
gives (8.5.3). The augmentation sequence is right split, so evaluation
preserves its kernel; its degree-zero evaluated projective is
\(E(f\otimes f)\), with kernel \(\operatorname{rad}(E)(f\otimes f)\).

A map \(S\to\Omega_ES\) factoring through a projective factors through
a finite free module. Each component \(S\to E\) takes values in the
left socle, since the radical annihilates \(S\). If \(u\) is in that
socle and \(j\) is radical, then for all \(a\in E\),
\[
 \operatorname{tr}(auj)=\operatorname{tr}(jau)=0,
\]
because \(ja\) is radical. Nondegeneracy gives \(uj=0\).
A left-module map \(E\to\Omega_ES\) is right multiplication by its
value at \(1\), which is radical, so it kills the socle. Every
projective factorisation in question is therefore zero. Since
\(\lambda^2(f^*\otimes f^*)\ne0\), (8.5.3) is nonzero stably.
This also makes the lift's evaluation nonzero. By the top projection
isomorphism of 8.4, it generates
\(\widehat{\operatorname{Ext}}_E^3(S,\mathcal C\otimes_ES)\).

from 8.4. The all-degree homotopies are written above; the finite
certificate is used only for the multilinear coefficient identities.

### 8.5.4. Source comparison

Read source locators: 03-algebra.tex, equations alg:bar,
coc:comparison, coc:boundary and Lemma coc:data; 09-cochain.tex, the
complete table and recurrences coc:transpose-recurrence,
coc:closure-recurrence, coc:boundary-constant and coc:boundary-linear;
06-lift.tex, Proposition lift:main and Lemmas lift:B, lift:G and
lift:evaluation; 07-branches.tex, Lemma branch:twist. The comparison is
to these supplied local source files, not to a bibliographic claim about
an externally obtained version.

[verdict omitted] in these source statements or proofs.

- The preprint uses homological indices \(P_n\); the report uses
  \(P^{-n}\). In particular \(B\) has cohomological degree \(-1\),
  \(G\) has degree \(1\), and the comparison \(p\) has degree \(3\).
  The top cell of \(K[3]\) is \(P^{\mathrm{tot}}[-1]\), not
  \(P^{\mathrm{tot}}[1]\).
- The right twist \(T_{h_\lambda}\) induces restriction by
  \(h_\lambda^{-1}\), giving the inverse eigenvalue
  \(\lambda^{-m}\). A direct twist would reverse this exponent;
  the source has the correct convention.
- Cocycle closure alone does not imply the existence of the cone lift:
  the extra boundary identity (8.5.1) is used in (8.5.11).
  The source explicitly identifies this dependency.
- The source's recursive construction of \(G_n\), at
  06-lift.tex lines 191–224, is valid. The explicit suffix formula
  (8.5.10) is an additional reconstruction that avoids choices and proves
  its homotopy identity at every index.
- The 179 entries are not a sample: the new certificate checks the full
  multilinear cocycle and boundary identities over a polynomial ring.
  The old script was read only after the independent script was complete,
  then rerun successfully with the system Python/Sage installation;
  its complete output is saved as `old_cochain_rerun.out`.
- Reading-order limitation: extraction of statements from 06-lift.tex
  also exposed explanations outside proof environments, and the twist
  proof of 07-branches.tex was read before its independent reconstruction.
  The initial homotopy attempt was saved before reading the proofs of
  Lemmas lift:B and lift:G. The finite certificate was written from
  definitions before reading the prior computation. This record does
  not claim full pre-reading independence for the twist argument.

Statuses at completion: cocycle/boundary **[status omitted]**; twist action
**[status omitted]** relative to 8.3–8.4; lift and nonzero evaluation
**[status omitted]** relative to the finite cone construction in 8.4.
These are AI assessments, not human certification.


## 8.6. The finite fibre and the comparison maps

**Statement.** Let
\(E=T\otimes_kT\) and \(S=s\otimes_ks\). Suppose that the preceding
construction supplies a finite bimodule \(C_1\), projective on each side,
with \(\mathcal C=C_1[1]\), the profile
\[
 W^a:=\widehat{\operatorname{Ext}}_E^a(S,\mathcal CS)
 =\begin{cases}k&a=0,3,\\0&\text{otherwise},\end{cases}
\]
and lifts \(\widetilde g_i:E_{\lambda_i}\to\mathcal C[3]\), for
\(\lambda_i=H_i\), whose evaluated top projections are
\(\lambda_i^2\beta_0\ne0\). Here
\(E_{\lambda}=E_{h_\lambda\otimes h_\lambda}\) has its ordinary left
action and the indicated right twist. Suppose also that
\(H^{\ge0}=k[\tau_1,\tau_2]\), \(|\tau_i|=3\), and this tensor
functor acts on \(H^{3m}\) as \(\lambda^{-m}\).
Then the following construction gives a finite bimodule \(F\),
projective on both sides, and a stable map \(v:S\to FS\) for which
\[
 \delta^a:(H^a)^2\longrightarrow
 V^a:=\widehat{\operatorname{Ext}}_E^a(S,FS),\qquad
 (g,j)\longmapsto F(g)v+v[a]j
\]
is an isomorphism for every \(a>0\), while \(\delta^0\) is
surjective with a one-dimensional kernel. We abbreviate
\(FM=F\otimes_EM\).

**Finite representatives.** Put \(R=E^e=E\otimes_kE^{\mathrm{op}}\).
The product of the symmetrising forms on the tensor factors makes \(R\)
symmetric. For a finite left \(R\)-module \(M\), define
\[
 I_R(M)=\operatorname{Hom}_k(R,M),\qquad
 (r\varphi)(t)=\varphi(tr),\qquad
 j_M(m)(t)=tm.
\]
The equality \(j_M(rm)(t)=trm=(rj_M(m))(t)\) gives linearity over
\(R\), and evaluation at \(1\) gives injectivity. As an \(R\)-module,
\(I_R(M)\cong DR\otimes_kM\cong R\otimes_kM\), where the second
factor on the right is only a vector space. Thus \(I_R(M)\) is finite
projective. Set \(\Sigma_RM=\operatorname{coker}j_M\). If \(M\)
is projective on either \(E\)-side, it is injective on that side
because \(E\) is symmetric. The injection into \(I_R(M)\) then
splits on that side. The cokernel is a summand of a projective module,
so \(\Sigma_RM\) is projective on both sides whenever \(M\) is.
It represents \(M[1]\) in \(\operatorname{stmod}R\).

Take the actual bimodule \(\mathcal Y=\Sigma_R^4 C_1\), which
represents \(\mathcal C[3]\). Each defining cosyzygy sequence splits
as a sequence of right \(E\)-modules. Tensoring it with \(S\)
preserves exactness and sends its middle projective bimodule to an
\(E\)-projective module. Consequently the evaluated cosyzygies
represent the same iterated stable shifts, so
\(\mathcal Y\otimes_ES\simeq\mathcal CS[3]\).
The top projection
\(W^3\to H^{-1}\) is an isomorphism. Multiplying
\(\widetilde g_i\) by \(\lambda_i^{-2}\) therefore makes both
evaluations the same non-zero \(w\in W^3\). Choose actual
bimodule-map representatives
\(g_i:E_{\lambda_i}\to\mathcal Y\) of the resulting stable classes.
Stable Hom is a quotient of ordinary Hom, so this choice requires no
lifting of a stable class to a new category.

Let \(Q=R\otimes_k\mathcal Y\), with the surjection
\(\pi(r\otimes y)=ry\), and define
\[
 0\longrightarrow F\longrightarrow
 E_{\lambda_1}\oplus E_{\lambda_2}\oplus Q
 \xrightarrow{(g_1,g_2,\pi)}\mathcal Y\longrightarrow0. \tag{8.6.1}
\]
Every term is finite. The rightmost term is projective as a left and
as a right \(E\)-module. Thus (8.6.1) splits on each side; its kernel
is projective on each side. Write \(\rho_i:F\to E_{\lambda_i}\)
for the projections.

The right splitting ensures that tensoring (8.6.1) with \(S\) stays
exact. Moreover, \(Q\otimes_ES\) is projective: a free
\(E^e\)-module evaluates to a free left \(E\)-module, since
\(E^e\otimes_ES\cong E\otimes_kS\). After the canonical
identifications \(E_{\lambda_i}\otimes_ES\cong S\), the stable
triangle is
\[
 FS\xrightarrow{(\rho_1,\rho_2)}S\oplus S
 \xrightarrow{(w,w)}\mathcal CS[3]\longrightarrow FS[1]. \tag{8.6.2}
\]
The tensor functor with \(F\) is exact because \(F_E\) is projective.
It preserves projectives because \({}_EF\) is projective, and hence
induces an exact functor on the stable category. The maps \(\rho_i\)
induce natural transformations of these functors, including their shift
identifications.

**The groups \(V^a\).** Applying stable Hom from \(S\) to (8.6.2)
gives
\[
 (H^{a-1})^2\longrightarrow W^{a+2}\longrightarrow V^a
 \xrightarrow{\rho}(H^a)^2\longrightarrow W^{a+3}. \tag{8.6.3}
\]
Since \(H^0=k\), \(W^2=0\), and \(W^3=kw\), degree zero identifies
\(V^0\) with the kernel of
\((c,d)\mapsto(c+d)w\). Thus \(V^0\) is the diagonal line.
There is a unique \(v\) with \(\rho_1v=\rho_2v=\operatorname{id}_S\),
and \(v\) spans \(V^0\). For \(a=1\), the preceding map
\((H^0)^2\to W^3\) is surjective, so its connecting map is zero;
\(W^4=0\) then makes \(\rho:V^1\to(H^1)^2\) an isomorphism.
For \(a\ge2\), both \(W^{a+2}\) and \(W^{a+3}\) vanish, giving
\[
 \rho:V^a\xrightarrow{\sim}(H^a)^2\quad(a>0). \tag{8.6.4}
\]
This proves the claims for every positive degree, not just degrees
in the support of \(H\).

**The comparison.** Naturality and \(\rho_iv=\operatorname{id}_S\)
give, for \(g,j\in H^a\),
\[
 \rho_i[a]F(g)v=E_{\lambda_i}(g),\qquad
 \rho_i[a]v[a]j=j.
\]
In degree zero, both tensor functors fix scalars, so
\(\delta^0(c,d)=(c+d)v\). Its image is \(V^0\) and its kernel is
\(k(1,1)\).
For \(a=3m>0\), (8.6.4) identifies \(\delta^a\) with
\[
 (g,j)\longmapsto
 (\lambda_1^{-m}g+j,\lambda_2^{-m}g+j). \tag{8.6.5}
\]
This is the matrix
\[
 \begin{pmatrix}\lambda_1^{-m}&1\\\lambda_2^{-m}&1\end{pmatrix}
 \otimes\operatorname{id}_{H^{3m}},\qquad
 \dim_kH^{3m}=m+1.
\]
Its scalar determinant is
\(\lambda_1^{-m}-\lambda_2^{-m}
 =\lambda_1^{-m}+\lambda_2^{-m}\).
If it vanished, multiplication by \(\lambda_1^m\lambda_2^m\)
would give \(H_1^m+H_2^m=0\). These are distinct monomials in the
polynomial domain \(\mathbb F_2[q,H_1,H_2]\); their sum remains
non-zero in its fraction field. This also covers even \(m\).
Therefore (8.6.5) is invertible for every \(m>0\). For positive
\(a\) not divisible by 3, both sides of \(\delta^a\) are zero by
(8.6.4). This completes the comparison argument.

**The conversion dependency.** Report §8.1 (job D-D), with precisely
these hypotheses, constructs the triangular algebra and module
\[
 \Lambda=\begin{pmatrix}E&0\\F&E\end{pmatrix},\qquad
 Y=(FS\oplus P)/\{(v_0(s),i(s)):s\in S\},\qquad
 Z=(S,Y,\iota),
\]
where \(v_0\) represents \(v\), \(i:S\hookrightarrow P\) is an
embedding into a finite projective module, and \(\iota:FS\to Y\)
is induced by inclusion of the first summand. Its conclusion is that
\(Z\) is finite, nonprojective and Gorenstein-projective and
\[
 \operatorname{Ext}^a_\Lambda(Z,Z)=0
 =\operatorname{Ext}^a_\Lambda(Z,\Lambda)\quad(a>0).
\]
The completed conversion proof was read in
`report/notes/proofs/D-D-conversion.md`, §§1–6, specifically its
statement (1.1)–(1.2), cone identification (4.5), and exact sequence
(5.6). Its signed comparison is identical to ours in characteristic two.
Thus this application uses the completed argument, not the earlier task
statement or another agent's status label. The source statement is
`.cache/ar-src/02-conversion.tex:28–59`.

**Source comparison.** The argument agrees with
`07-branches.tex`, Lemma `branch:profile` (lines 100–131) and
Proposition `branch:comparison` (lines 176–221). The source explicitly
handles degree one and the characteristic-divisible values of \(m\);
no gap was found in these two steps. We have translated \(A,X,U_H\)
to \(E,S,E_\lambda\), kept its right-twist convention, and made the
dependency on the preceding profile and evaluation assertions explicit.

construction, and the completed conversion proof at the exact locators
above supplies the conclusion of Theorem AR.

### Consequences included in Theorem AR

The same \(\Lambda,Z\) have the remaining properties of the source
theorem, by the following argument.

The positive grading of \(C\), with degree-zero part \(ke\oplus kf\),
gives \(C/\operatorname{rad}C\cong k^2\). In its trivial extension,
\[
 J_T=\operatorname{rad}C\oplus DC,\qquad T/J_T\cong k^2.
\]
Indeed, the displayed ideal is nilpotent: a non-zero expanded product
can contain at most one factor from \(DC\), since \((DC)^2=0\),
and sufficiently many factors from \(\operatorname{rad}C\) force
one of the two flanking radical powers to vanish. Its quotient is
semisimple, which identifies the ideal as the Jacobson radical.
For the tensor square,
\[
 J_E=J_T\otimes_kT+T\otimes_kJ_T,
 \qquad E/J_E\cong k^4.
\]
The two displayed ideals commute and are nilpotent, so their sum is
nilpotent; the quotient is the tensor product of the split semisimple
quotients. In the triangular algebra,
\[
 J_\Lambda=\begin{pmatrix}J_E&0\\F&J_E\end{pmatrix},
 \qquad\Lambda/J_\Lambda\cong k^8.
\]
A matrix product contains at most one off-diagonal factor. If
\(J_E^N=0\), a product of \(2N\) factors in this ideal vanishes,
because a possible off-diagonal term has powers of \(J_E\) on its
two sides with total exponent \(2N-1\). The quotient is semisimple,
so this ideal is the radical. It follows that \(\Lambda\) is split
with eight simple-module isomorphism classes.

There are surjective algebra maps
\[
 \Lambda\longrightarrow E\xrightarrow{1\otimes\chi}T
 \longrightarrow C,
\]
where \(\chi\) is the character of \(s\). The multiplication table
in §8.2 gives
\[
 (ut)^2=(y+qx)^2=q(1+q)z\ne0. \tag{8.6.6}
\]
Both \(u\) and \(t\) are radical elements. Under a surjective map
of finite-dimensional algebras, the radical maps onto the radical:
its image is nilpotent, and the quotient by that image is a quotient
of a semisimple algebra, hence semisimple. Thus (8.6.6) implies
\(J_\Lambda^4\ne0\). Finally, \(eu=u\) and \(ue=0\), with
\(u\ne0\), so the quotient \(C\), and consequently \(\Lambda\),
is noncommutative.

Let \(K/k\) be a field extension. A projective resolution of a finite
\(\Lambda\)-module \(M\) can be chosen with finite projective terms.
For every such term \(P_i\) and every finite \(N\),
\[
 K\otimes_k\operatorname{Hom}_\Lambda(P_i,N)
 \cong\operatorname{Hom}_{\Lambda_K}(K\otimes_kP_i,K\otimes_kN).
\]
For a finite free module the equality is the coordinatewise tensor
identification; passing to direct summands gives it for \(P_i\).
Exactness of tensoring with a field extension then gives, for all
\(i\ge0\),
\[
 K\otimes_k\operatorname{Ext}^i_\Lambda(M,N)
 \cong\operatorname{Ext}^i_{\Lambda_K}(M_K,N_K). \tag{8.6.7}
\]
The two positive Ext vanishings survive. Tensoring the complete
projective resolution of \(Z\) with \(K\) preserves its exactness;
the same termwise Hom identity, with target \(\Lambda\), preserves
exactness of its dual. Thus \(Z_K\) is Gorenstein-projective.
A finite projective surjection \(P\twoheadrightarrow Z\) does not
split. Its extension class in \(\operatorname{Ext}^1_\Lambda(Z,N)\),
where \(N\) is its kernel, stays non-zero by (8.6.7) and faithful
flatness. Hence \(Z_K\) remains nonprojective. Finally,
\(K\otimes_kJ_\Lambda\) is a nilpotent ideal with quotient \(K^8\),
so it equals \(\operatorname{rad}\Lambda_K\). Under the surjection
\(\Lambda_K\to C_K\), its fourth power maps onto
\((\operatorname{rad}C_K)^4\), which contains the surviving non-zero
element (8.6.6). Hence its fourth power is non-zero. The same
commutator in the quotient \(C_K\) survives scalar extension.

**Source comparison:** `08-consequences.tex`, Proposition `prop:radical`
(lines 7–45) and Proposition `prop:basechange` (lines 47–79).
No mathematical discrepancy was found. These arguments additionally
spell out a nilpotence bound and the finite-projective reduction in the
Hom base-change identity. They do not use numerical experiments.

conversion proof. In particular, extending scalars to an algebraic closure
retains the transcendental parameters; this is not a specialisation to
an algebraic extension of \(\mathbb F_2\).

## Computation receipts and their scope

The new scripts and their saved outputs are under
`computations/08-D-E/`. The first two certificates were written from
mathematical definitions and the literal table before consulting the
older implementations. They use exact polynomial arithmetic, not
floating-point arithmetic or numerical samples.

| Script or replay | Saved output | Exact scope |
|---|---|---|
| `foundations_certificate.py` | `foundations_certificate.out` | All 1,000 basis associators of \(C\), all 8,000 of \(T\), every grading check and all 400 trace-pairing entries over \(\mathbb F_2[q]\); the displayed fourth radical product. |
| `finite_cochain_certificate.py` | `finite_cochain_certificate.out` | The 179 cochain entries and their corners/weights; all 104,976 radical four-words, including all 15,250 composable words; all 324 boundary pairs coefficientwise in \(\lambda\); the explicit cycle and Casimir endpoint identities. |
| `certificate_receipt.py` | `certificate_receipt.out` | Exact equality of the new literal table with the source's 179 entries; fresh execution of both new certificates equals their saved output; SHA-256 digests pin the seven source files and the certificates. |
| Earlier `02-ar-finite-data/01_algebra.py` through `04_trivial_extension.py`, read and rerun | `reused_01_algebra.out` through `reused_04_trivial_extension.out` | Algebra identities over \(\mathbb F_2(q)\) and one \(\mathbb F_{2^{16}}\) specialisation; resolution and \(\operatorname{Ext}_C(s,C)\) in degrees 0–8; \(T\)-Ext dimensions in degrees 0–9. The last calculation does not check Yoneda multiplication. |
| Earlier `02-ar-finite-data/05_cochain.py`, read and rerun | `old_cochain_rerun.out` | Complete cochain and boundary checks over \(\mathbb F_2(q)\), \(\mathbb F_2(q,H)\), and a specified \(\mathbb F_{2^{16}}\) specialisation. |
| `replay_cones.py`, using the read-only `06-two-factor` artifacts | `replay_cones-repeat.out`, `replay_cones.json` | Recomputed ranks and consecutive products of saved Hom matrices; \(W^a\) for \(-4\le a\le7\), and direct degree-zero/degree-minus-one checks, in the saved seed-10102026 case over \(\mathbb F_{2^{16}}\). This is a replay of linear algebra on saved inputs, not a rebuild of their resolution or cone. |
| `rerun_bracket_witness.py`, executing the read earlier `04-toda-bracket/witness.py` | `bracket-witness-rerun.out` | Explicit finite syzygy, linearity and nullhomotopy identities over \(\mathbb F_2(q)\) and primitive parameters in \(\mathbb F_{2^8},\mathbb F_{2^{12}},\mathbb F_{2^{16}}\). These bracket witnesses are supplementary and unused in the all-degree cone proof. |

For the saved cone matrices the ranks in degrees \(-5\) through 7 are
\[
 276,148,92,36,0,35,93,147,276,444,612,888,1224.
\]
The resulting cohomology dimensions are 1 at 0 and 3 and zero at the
other computed degrees. The direct checks give
\(\dim\operatorname{Hom}(S,M)=1\),
\(\dim\operatorname{Hom}(M,S)=0\), and projective-factor rank zero.
The first optional seam calculation was interrupted; the full completed
rerun is `replay_cones-repeat.out`. The shorter `replay_cones.out`
packages earlier completed ranks and recomputes the reduced seam system;
it must not be mistaken for an additional independent full run.

The universal finite certificates can be rerun with the system Python:

```sh
python3 -B computations/08-D-E/foundations_certificate.py
python3 -B computations/08-D-E/finite_cochain_certificate.py
python3 -B computations/08-D-E/certificate_receipt.py
```

The saved-matrix replay and bracket wrapper additionally use the installed
Sage modules. Their scripts place runtime state in the new computation
directory. The older scripts and outputs remain read-only inputs.
The infinite resolution, Yoneda products, Tate contractions, cone
sequences, bar homotopies and determinant argument are the written
all-degree proofs; none is inferred from the bounded degree tables.

## Review record and final statuses

The contributions were cross-read without taking their status labels as
evidence. The records are
`computations/08-D-E/foundations-review.md` and
`computations/08-D-E/lifts-review.md`, with a final bounded cone review
in `computations/08-D-E/cones-review.md`; the fibre review is at the end of
`computations/08-D-E/foundations.md`. They found no substantive error.
Their precision requests concerning the radical product in a quotient,
evaluated cosyzygies, the minimal projective-cover notation, and the
hypothesis on \(q\) were incorporated. A further integration correction
distinguishes actual nonminimal bar cokernels from minimal syzygies in
§8.4.3. These are reviews of the stated arguments, not human
certification or formalisation.

The dependence is acyclic: §8.2 gives the abstract polynomial algebra in
§8.3; the finite cocycle and cycle in §8.5.1 choose its generator;
§8.4 uses that representative to form its cones and compute their
profile; §§8.5.2–8.5.3 give the twists and lifts; §8.6 applies the
separately completed and read conversion proof. Thus the forward
references in the section numbering do not assume the result being
constructed.

| Result | Final status | Reason |
|---|---|---|
| 8.2: algebra \(C\), radical and simple, minimal resolution, \(\operatorname{RHom}_C(s,C)\simeq s^{\mathrm r}[-2]\) | [status omitted] | Exact finite algebra certificate and uniform kernel/image formulas for every index. |
| 8.3: \(T\) symmetric and \(\operatorname{Ext}_T^*(s,s)=k[\tau]\) | [status omitted] | Explicit symmetric trace; derived triangle; multiplicative recurrence and non-zero cocycle evaluation. |
| 8.4: tensor polynomial ring, finite two-cone bimodule, all-integer Tate profile and top projection | [status omitted] | Tensor comparison maps, read Tate-duality locator, actual projective tails, and two long exact sequences. |
| 8.5: inverse twist action, cocycle/boundary, stable lifts and their non-zero evaluations | [status omitted] | Complete polynomial identities and explicit homotopies in every bar degree. |
| 8.6: finite \(F\), stable \(v\), all comparison maps and Theorem AR | [status omitted] | Both-side splitting, exact stable sequence, every-degree scalar determinant, and Result 8.1 in the completed D-D dossier, §§1–6. |
| Eight simples, non-zero fourth radical power, noncommutativity and every field extension | [status omitted] | Nilpotent-ideal calculations and termwise finite-projective base change. |

No mathematical gap remains in these arguments as assessed in this job.
The points deserving the closest further review are the stable-tail
construction, the actual top projection, and the two all-degree bar
homotopies. The requested pre-reading proof attempt was not achieved for
the twist lemma: its source proof was exposed during extraction. This
process limitation is recorded in §8.5.4 and in the issue file; it is not
hidden by the final mathematical status. No novelty or priority claim is
made. The review is limited to the specified local preprint snapshot.
