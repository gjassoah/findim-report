Model: unknown; effort: unknown.

# Foundations contribution for dossier D-E (report 8.2–8.3)

## Provenance and independent attempt, before source proofs

On 2026-10-08 the definitions and lemma statements of `03-algebra.tex` and
`04-resolution.tex` were extracted with every `proof` environment suppressed.
The following attempt precedes reading their proofs. Conventions: characteristic
2, q transcendental over the prime field; left modules, cohomological complexes,
right-to-left products. Write R^{-i}=R_i for a resolution indexed by i≥0.

1. Give u,t degree 1; x,y,n degree 2; v,j degree 3; z degree 4.
   Every nonzero radical product respects degree. Associativity reduces to
   the finite multiplication table and can be checked on all 1000 triples.
2. For right multiplication u: Ce→Cf, image has basis u,v,n and kernel
   has basis x+y,z,j. Right multiplication ℓ_i=x+q^i y on Ce has image
   ⟨ℓ_i,z,j⟩ and kernel ⟨ℓ_{i+1},z,j⟩ because
   tℓ_i=(1+q^{i+2})j and ℓ_{i+1}ℓ_i=0. Thus all degrees are exact;
   differentials have radical image, giving minimality.
3. After Hom_C(−,C), u acts on fC injectively, with image
   ⟨u,y+qx,z,v⟩=ker(ℓ_0·). Left multiplication ℓ_0 has image
   ⟨ℓ_0,z⟩. For i≥1, left multiplication ℓ_i has image ⟨ℓ_i,z,v⟩
   and kernel ⟨ℓ_{i−1},z,v⟩. Hence only Ext² survives, represented
   by v; its right C-action is the f-simple action, since vt=qz is a
   boundary. Thus RHom_C(s,C)≃s^r[−2].
4. Dualising the finite projective resolution gives
   DC⊗_C^L s≃s[2]. The triangle from 0→DC→T→C→0 is therefore
   s[2]→T⊗_C^L s→s→s[3]. Derived adjunction gives
   RHom_T(T⊗_C^L s,s)≃RHom_C(s,s)≃k.
   Its long exact sequence should identify multiplication by the connecting
   class η∈Ext³_T(s,s) with the isomorphisms Ext^{a−3}→Ext^a
   for a≥2; low-degree groups then imply k[η]. Need check the a=1
   boundary and exact Yoneda multiplication orientation when reading source.
5. Symmetry is direct: t(a,φ)=φ(1), t((a,φ)(b,ψ))=ψ(a)+φ(b),
   a symmetric nondegenerate form on C⊕DC. This also identifies the trace
   dual basis, which is needed later for the boundary identity.

These are independent proof attempts, not yet final statuses. Source comparison
and detailed conclusions are appended below.

## Report 8.2: C and its resolution (AI-proved)

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

**Algebra and radical.** The script `foundations_certificate.py` checks all
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

**Status: AI-proved.** Finite associativity is certified by an exhaustive exact
polynomial calculation. All-degree exactness, minimality and derived Hom are
justified by (F.3)–(F.6), not inferred from finitely many resolution terms.

## Report 8.3: symmetric T and the Yoneda product (AI-proved)

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
No mathematical error was found in these source passages. The source's
homological degree 2 is cohomological degree −2 here.

**Status: AI-proved** for symmetry and the abstract polynomial-algebra result.
The normalization τ=p(s) is **AI-proved conditional on the explicit finite
cocycle identity in the 8.5 contribution**; the cycle argument itself is
complete and makes the dependency explicit. No finite computation of Ext
is used to infer its all-degree structure.

## Finite computation receipt

The new, independently written `foundations_certificate.py` was run with
`python3`; exact output is in `foundations_certificate.out`. It certifies
1000 C associators, 8000 T associators, homogeneous multiplication and all
400 entries of the T trace pairing over F₂[q]. It also reproduces the
complete list of eleven compatible positive-degree triples of total degree
at most four. Thus the source's finite associativity list is complete.

The existing scripts `computations/02-ar-finite-data/01_algebra.py`,
`02_resolution.py`, `03_ext_C.py` and `04_trivial_extension.py` were each
read and rerun. The current Sage launcher does not accept `-python`; the
successful command was `python3 SCRIPT`, with
`DOT_SAGE="$PWD/computations/08-D-E/sage-state"` and
`PYTHONDONTWRITEBYTECODE=1`. Their new outputs are respectively
`reused_01_algebra.out`, `reused_02_resolution.out`, `reused_03_ext_C.out`
and `reused_04_trivial_extension.out`, all in this directory. The runs cover
both exact F₂(q) and the stated specialization in F_(2^16); the resolution
script additionally checks a symbolic rank-three minor 1+q²r. These are
finite corroboration, not the basis of the all-degree arguments above.

| reused script | scope actually rerun | recorded result |
|---|---|---|
| 01 | algebra, all 1000 associators, radical powers | dimensions 8,5,3,1,0 |
| 02 | C-resolution exactness/minimality through degree 8; symbolic parameter r | all checks pass; pivot 1+q²r |
| 03 | Ext_C(s,C) through degree 8; right action in degree 2 | dimensions 0,0,1,0,0,0,0,0,0 |
| 04 | T structure, minimal covers through degree 9 | Ext dimensions 1,0,0,1,0,0,1,0,0,1 |

The finite-field specialization has q of order 65535. It cannot support any
assertion requiring q^m≠1 for every m>0. Only the exact parameter argument
in (F.3)–(F.6) supplies those assertions.

## Adversarial read of the root's 8.6 draft

Scope: the root-written `report/notes/proofs/D-E-ar-ingredients.md` section
8.6, read on 2026-10-08 before integration of the other contributions; the
conversion statement was checked against `02-conversion.tex:28–59`, and
the radical/base-change source against `08-consequences.tex:7–79`.
No substantive error was found in the fibre sequence, the exceptional
a=1 argument, naturality of the comparison, the determinant, or the
base-change proof. The assertion that the triangular radical has nilpotence
exponent at most 2N when J_E^N=0 is valid: a nonzero off-diagonal word of
length 2N would have flanking exponents totalling 2N−1, forcing one to
be at least N. The Hom base-change reduction uses finite projectives and
is valid also for the doubly infinite totally acyclic complex term by term.
The non-split extension argument correctly preserves nonprojectivity.

Two precision points were sent to the root:

1. At the end, the words “its fourth power contains the surviving non-zero
   element (8.6.6)” place an element of the quotient C inside Λ. Replace
   them by the nonzero image assertion under Λ_K→C_K, or choose radical
   lifts of u,t and use their product. This is a location imprecision,
   not a failure of the radical-power conclusion.
2. For the finite representative Y=Σ_(E^e)^4 C₁, explicitly state why
   tensoring with S represents C S[3]: each cosyzygy defining sequence
   splits as right E-modules, remains exact under −⊗_E S, and its
   E^e-projective middle term evaluates to an E-projective. Therefore
   each step induces the required stable shift. The necessary ingredients
   are already in the draft, but this connects them at the use site.

These are dossier precision suggestions; neither is recorded as an error in
an examined preprint proof. The conversion principle remains a separate
D-D obligation, as the root draft correctly states.
