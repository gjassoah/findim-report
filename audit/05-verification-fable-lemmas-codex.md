Model: GPT-6 (Codex); effort: unknown.

# Independent verification of the frozen structural lemmas

Date: 2026-10-07. Completed after incremental step checks and literature reads.
The sole source of claims is `scratch/05-frozen-fable-lemmas.md`, SHA-256
`d76b3fd66611ac9d31d040dc3c8ff3e965805c7ac7a896a8f7e2339ebe2d9bf5`.
The excluded directories and files were not opened. References to O.2, O.4
and O.5 are not accepted as evidence; any needed implication is checked here.
Only this report was modified by this job. This is an AI audit, not human
certification.

Conventions: `Ext_{A^op}` denotes Ext of right A-modules, and `Ext_A`
denotes Ext of left A-modules. Transposes use minimal projective
presentations. Complexes are cohomological, with `H^n(K[s])=H^{n+s}(K)`.
Every argument supplied in this report has status **AI-proved**, unless
explicitly labelled supported, plausible, or cited. Verdicts concern the
frozen text and do not confer the author's status “proved”.

## Lemma 1

Verdict: **error found** in the literal correspondence (lines 7–13) and
in the dual-coresolution sentence (lines 26–28). The existence equivalence,
coresolution criterion and projective-dimension conclusion survive the
corrections below (AI-proved).

1. The group in (ii) must be `Ext^i_{A^op}(Tr C,A)`. Its first
   argument is a right module. The same convention applies whenever the
   proof writes Ext of E without a side.
2. Minimal transpose gives `Tr Tr C ≅ C_np`, where C_np is C with its
   projective direct summands removed. Condition (ii) allows `C_np ⊕ R`
   for every projective R, and transpose does not distinguish these
   modules. Thus the constructions are mutually inverse on isomorphism
   classes only after requiring C to have no non-zero projective direct
   summand; alternatively the correspondence on the C side is stable.
   The E side needs no extra restriction: `Hom_{A^op}(E,A)=0` already
   excludes non-zero projective summands. This is a structural defect in
   the proposed inverse, not a claim to have constructed a small module
   satisfying all the infinite vanishing conditions.
3. Dualising a minimal resolution of E gives exactly the indicated
   exact complex Q. The cokernel defining C is the minimal transpose.
   Its projective dimension is at most one. If C were projective, the
   injection `Q_0→Q_1` would split, hence its dual `P_1→P_0` would be
   surjective, contradicting its non-zero cokernel E. Minimality is not
   needed for this last contradiction, but is needed for the transpose
   convention. In particular, `pd C=1`. Since E has no projective
   summands, double transpose gives `Tr C≅E`, verifying the positive
   Ext condition in (ii), as well as the inverse on the E side.
4. The augmented coresolution dual is
   `…→P_3→P_2→C*→0`, and is exact, including at C*. Indeed,
   `C*=ker(P_1→P_0)=im(P_2→P_1)`. It does **not** have H^0 equal
   to E. That homology belongs to the different, full complex
   `…→P_2→P_1→P_0→0`, at P_0. Omitting C* from the first displayed
   dual leaves terminal homology C*, again not E.
5. Conversely, a minimal length-one resolution
   `0→Q_0→Q_1→C→0` gives
   `E=coker(Q_1*→Q_0*)=Ext^1_A(C,A)`. Applying Hom to this
   cokernel identifies E* with the kernel of the original injection,
   hence E*=0. If E=0, `Q_1*→Q_0*` splits onto the projective Q_0*;
   dualising would make C projective. Thus E is non-zero. The positive
   Ext vanishing is precisely the corrected hypothesis (ii).
6. The formulas at lines 32–37 are correctly indexed for the full Q*:
   `H_m(Q*)=Ext^1_A(C_{m+1},A)` for m≥1 and
   `H_0(Q*)=Ext^1_A(C_1,A)`. The approximation condition concerns
   m≥2, not the initial injection `C_0→Q_1`. For m≥2, dualising
   `0→C_{m-1}→Q_m→C_m→0` identifies its obstruction to surjectivity
   onto C_{m-1}* with `Ext^1_A(C_m,A)`. Surjectivity for target A
   is equivalent to factorisation for every target in add(A), by finite
   direct sums and direct summands.
7. This also fills in the stated coresolution equivalence without using
   an external O.4. Given such a coresolution and a length-one projective
   resolution of C, splice them to form Q. Its dual is a projective
   resolution of the non-zero E above: exactness at Q_1* is the
   surjectivity `Q_2*→C*`, and exactness further left is the other
   approximation conditions. Dualising again computes all Ext of E and
   gives zero. Conversely, start from E as in step 5 and use its minimal
   resolution to coresolve `Tr E=C_np`. Add the omitted projective R
   to both C_np and the first coresolution term, with the identity on R.
   This gives the required coresolution of the original C.
8. For every m≥1 the short exact sequence with middle term Q_{m+1}
   gives `pd C_{m+1}=pd C_m+1`, since `pd C_m≥1` and is finite.
   More explicitly, the upper bound follows by splicing resolutions;
   for a module T with `Ext^m_A(C_m,T)≠0`, dimension shifting gives
   `Ext^{m+1}_A(C_{m+1},T)≠0`. Induction starts at `pd C_1=1`.
   No minimality of the chosen coresolution is necessary.

The search interpretation at lines 39–44 is valid with these corrections.
A torsionless module's left add(A)-approximation is injective, because
an embedding into a projective factors through it. If one iteration is
not injective, the infinite criterion fails. Infinitely many
indecomposable torsionless modules follow directly from unbounded
projective dimensions: a finite list of possible indecomposable summands
of the C_m would give a finite maximum of their finite projective
dimensions. Unbounded vector-space dimensions alone would not justify
that inference (arbitrary direct sums already have that property).
The external assertion labelled O.2 was not read or used.

Small checks (supported by explicit hand calculations):

- For `A=k(1→2)`, with `α=e_2αe_1`, the left simple S_1 has
  resolution `0→Ae_2→Ae_1→S_1→0`. Its transpose is the right
  simple S_2. Here `Hom_{A^op}(S_2,A)=0` but
  `Ext^1_{A^op}(S_2,A)≅S_1≠0`. Thus pd≤1 does not supply the
  missing torsionfree hypothesis. The left S_1 is not torsionless.
- For `A=k[ε]/(ε²)`, the simple k has a dual-exact periodic
  projective coresolution with maps multiplication by ε; it has infinite
  projective dimension. This tests the need for the finite-pd hypothesis.
  Also `Tr Tr(k⊕A)≅k`, not k⊕A, explicitly exhibiting the
  projective-summand issue when the pd hypothesis is only partially met.
- For C=A, the transpose is zero: the nonprojective restriction is needed.

Literature: Angeleri Hügel's ICTP 2006 notes, updated 2006-10-13,
Section 2.2, page 9,
state the double-transpose assertion only for modules without non-zero
projective summands; Proposition 2.2.1, page 10, is the stable duality.
These statements and the semiperfect-ring hypothesis were read in
[the author's PDF](https://webusers.imj-prg.fr/~bernhard.keller/ictp2006/lecturenotes/angeleri.pdf).
The relevant restriction is “modules without non-zero projective summands”.
Lu, *A note on the ℧-quiver*,
[arXiv:2608.16695v1](https://arxiv.org/abs/2608.16695v1), pages 2–3,
Proposition 2.1 and Theorem 2.2(2′), were read in the Library copy.
They give the minimal-approximation formulation and the infinite-path
criterion for indecomposable nonprojectives, explicitly attributing them
to Ringel–Zhang. This is a secondary citation, not an independently read
locator in Auslander–Bridger or Ringel–Zhang. Projective summands and finite
direct sums are handled explicitly above.

## Lemma 2

Verdict: **no error found** in the lemma and its proof, provided “the
primitive idempotents of S” means all primitive summands whose projective
tops are isomorphic to S, and “number of simples” means number of
isomorphism classes. In the report's consistent notation the hypotheses
are `Hom_{A^op}(S,A)=Ext^1_{A^op}(S,A)=0`.

The checks of the individual steps are as follows (AI-proved).

1. For a right B-module N, `W=Hom_B(Af,N)` is a right A-module via
   `(h·a)(x)=h(ax)`. This makes η_V right A-linear. Since Af is a
   projective left A-module, `V↦Vf=V⊗_A Af` is exact.
2. Restriction identifies Wf with `Hom_B(fAf,N)≅N`. The inverse
   sends n to the map `x↦n(fx)`. Under this identification `(η_V)f`
   is the identity of Vf. Both kernel and cokernel are therefore killed
   by f. Their composition factors are S because all other primitive
   types remain in f.
3. Any non-zero finite-length kernel has a simple submodule S, so
   `Hom(S,V)=0` makes η_V injective. For an extension
   `0→T'→T→S→0`, the segment
   `Ext^1(S,V)→Ext^1(T,V)→Ext^1(T',V)` proves the required
   Ext^1 vanishing by induction on length. No Ext^2 vanishing is needed.
4. The cokernel T consequently splits off W. Adjunction gives
   `Hom_A(T,W)≅Hom_B(Tf,Vf)=0`, so that summand must be zero.
   All occurrences of Hom_A in this step refer to right-module maps.
5. At V=A the map is left multiplication on Af. With multiplication
   in End defined by composition, `L_a L_b=L_{ab}`: no opposite
   algebra belongs in the conclusion.
6. The corner B has precisely the simple types not removed by e.
   If M were projective, B⊕M would be a projective generator and its
   endomorphism algebra would be Morita equivalent to B, contradicting
   the difference of one simple type. The degenerate possibility f=0
   cannot satisfy the hypotheses: then A has only type S, and its
   non-zero right socle supplies a map S→A.

Small checks (supported): for the same three-dimensional path algebra
`k(1→2)`, take right S=S_2. Hom vanishes, but Ext^1 does not, and
`A→End_k(Ae_1)=M_2(k)` is injective but not surjective. Conversely,
for `A=k×k` and either simple S, Ext^1 vanishes but Hom does not;
the map to the surviving corner has a non-zero kernel. Both low-degree
hypotheses are essential to this argument.

### Statements following Lemma 2

The dimension formula at line 67 has an **error**. The block decomposition
gives

`dim End_B(B⊕M) = dim B + dim M + dim Hom_B(M,B) + dim End_B(M)`.

There is no general equality between the two middle dimensions. For
`B=k[x,y]/(x,y)²` and M=k, they are 1 and 2. The endomorphism
algebra has dimension 7, whereas the frozen formula gives 6.

The literal identification of S at line 63 also needs a multiplicity
qualification outside the basic case. In fact
`Hom_B(B⊕M,M)≅eA`, whose top is `S^{⊕r}`, where r is the
number of primitive summands collected in e. Choose one such primitive
summand to obtain S itself. In a basic algebra r=1. These observations
do not change the lemma's double-centralizer conclusion.

The higher-Ext assertion and its literature comparison are checked below
in the final literature section; O.5 itself is outside the permitted input.

## Lemma 3

Verdict: **gap** at the assertion `Z∈D^b(mod B)` (line 73).
The proof supplies no boundedness of `Y⊗^L_C M`. The replacement
`Z∈D^-(mod B)` suffices for the full dichotomy, for which **no error
was found** after that replacement (AI-proved). The small example below
disproves automatic boundedness for general triples; it is not a
counterexample satisfying the additional RHom-vanishing hypothesis.
Boundedness under that full hypothesis is not settled by this audit.

### Functors, sides and triangle

For a right A-module, put `X=Ee_B` and `Y=Ee_C`. Right multiplication
by M gives precisely `φ:Y⊗_C M→X`. Thus both projective triples in
line 77 have the right orientation. The following are the relevant
functors on module categories:

| Functor | Formula | Exactness on module categories |
|---|---|---|
| i_* | `U↦(U,0,0)` | exact; preserves projectives |
| i^* | `E↦coker φ` | right exact; left adjoint to i_* |
| i^! | `E↦X` | exact; right adjoint to i_* |
| j^* | `E↦Y=Ee_C` | exact |
| j_! | `V↦V⊗_C e_CA` | right exact; left adjoint to j^* |

In particular j_! is not automatically exact on modules: its X
component is tensor by the left C-module M. Exactness of j^* follows
from the projectivity of the left A-module Ae_C. All derived functors
used here are triangulated; that notion of exactness must not be
confused with exactness of the underived functors on modules.

The underived i^* is tensor by the quotient `(A,B)`-bimodule B.
On right A-projectives it sends e_BA to B and e_CA to zero.
To check the derived identification directly, take a projective
resolution P→E. At each degree there is a split exact sequence of
right B-modules

`0→(Pe_C)⊗_C M→Pe_B→i^*P→0`.

Here Pe_C is a projective C-resolution of Y and Pe_B resolves X.
Consequently `Li^*E≅cone(Y⊗^L_C M→X)=Z` in D^-(mod B).
This construction also makes the derived lift of φ unambiguous.

The relevant distinguished triangle, including its fourth arrow, is

`Lj_!Y → E → i_*Z → (Lj_!Y)[1]`.

The first map is the adjunction counit, represented by `(φ,id)` after
resolving Y and lifting to E. Its cone has acyclic C component and B
component Z. Writing its C component as Y is a derived shorthand:
an actual projective model has the resolution Pe_C there.

It is the adjunction `Li^* ⊣ i_*`, not `i_* ⊣ Ri^!`, that gives

`RHom_{A^op}(E,e_BA) ≅ RHom_{B^op}(Z,B)`.

The left side vanishes because e_BA is a direct summand of A_A.
If Z=0, the triangle gives `E≅Lj_!Y`. Now use `Lj_! ⊣ j^*`:

`RHom_{A^op}(E,A) ≅ RHom_{C^op}(Y,Ae_C)
                    ≅ RHom_{C^op}(Y,C)`.

Indeed `Ae_C` is the column `(0,C)`, so its underlying right C-module
is C. Replacing it by e_CA would be a side error. Since E is a module,
`Lj_!Y≅E` forces `Tor_i^C(Y,M)=0` for i>0 and φ to induce
`Y⊗_C M≅X`. Taking H^0 therefore justifies the statement's
ordinary-tensor formula `E≅Y⊗_C e_CA`. Non-zero E implies Y≠0.
The infinite left finitistic dimension of C then follows from the
corrected Lemma 1 and its dimension-shifting argument above.

### Minimal complex and splitting

Every object of D^-(mod B) has a bounded-above resolution by finitely
generated projectives; using projective covers and removing contractible
projective pairs makes it minimal. For non-zero Z its minimal model P
is non-zero, so its non-zero degrees have a largest integer b.
The dual complex computes `RHom_{B^op}(Z,B)`: bounded-above
projective complexes are K-projective. Up to the harmless differential
signs in the Hom complex, this is the exact sequence

`0→(P^b)*→(P^{b-1})*→(P^{b-2})*→…`.

Set P^n=0 for n>b. For every n≤b define C_n as in the frozen text.
Exactness gives `C_b=(P^b)*` and, for n<b,

`0→C_{n+1}→(P^n)*→C_n→0`.

The initial finite segment is a projective resolution of C_n of length
at most b−n. Minimality of P is preserved by projective duality
(the radical of the category of finitely generated projectives is
preserved by an equivalence). Thus `(P^n)*→C_n` is a projective
cover, and the asserted syzygy equality is correct, up to isomorphism.
Without minimality it would only be an equality for this chosen
projective resolution; the dimension-shifting argument would still work.

If the left little finitistic dimension of B is d<∞, take specifically
`n=b−1−d`. The d-th syzygy of C_n is C_{b−1}, and is projective
because C_n has finite pd≤d. The sequence

`0→(P^b)*→(P^{b-1})*→C_{b-1}→0`

then splits. Dualising its retraction gives a section of
`P^{b-1}→P^b`. But a differential in a minimal complex has image
in `rad(P^b)`, and cannot surject onto the non-zero P^b. This is
the required contradiction. The case d=0 is included. There is no
reversal of the splitting implication, no missing shift, and no need
for Z to be bounded below. In line 85 “for all n” should be understood
within the displayed index range, or replaced by the single choice above.

### Small checks and the adjacent consequence

For `B=k`, `C=k[ε]/(ε²)`, `M=k` with ε acting by zero, and
`E=(0,k,0)`, the periodic resolution of k over C gives
`Tor_i^C(k,k)=k` for every i≥0. Hence
`Z=(k⊗^L_C k)[1]` has non-zero cohomology in every degree ≤−1.
It is not bounded. This example also checks the shift: H^−1(Z)=k.
It does not satisfy the lemma's vanishing: its RHom into e_BA is
non-zero. The point is that the triangular structure and finite
generation alone do not license the D^b assertion (supported).

With `B=C=k` and `M=k`, the module `(0,k,0)` has Z=k[1]; its
Ext^1 into e_BA is k. This checks the same shift with bounded tensor
and shows why the RHom hypothesis is essential. With M=0 the triangle
is the split decomposition `E=(X,0)⊕(0,Y)` and Z=X. For
`B=C=k`, every non-zero such E has a non-zero Hom into A (supported).

The assertion at line 91 that **all idempotent ideals of a candidate
must be non-stratifying is an error in the inference**. The argument
only forces a piece to retain an obstruction. It does not prohibit
decompositions with a bad piece. Given any pair (R,T) with
`T≠0` and `RHom_{R^op}(T,R)=0`, the algebra `R×k` and
module `(T,0)` satisfy the same hypothesis and have the non-trivial
stratifying ideal `0×k`: the multiplication map for that central
idempotent is an isomorphism and all higher Tor vanish. Thus, conditional
on the existence of a candidate at all, the proposed universal
restriction fails. Even a minimality restriction would require an
applicable reduction theorem with its boundedness hypotheses; none is
stated here. The trivial ideals 0 and A are another literal exception.
A square-zero ideal says nothing by itself about other idempotent
ideals. The assertions about M1 and M2 were not checked against the
preprints, which are outside this job's permitted claim input.

Literature (cited): Cummings, *Ring constructions and generation of the
unbounded derived module category*, published version, Algebras and
Representation Theory 26 (2023), Definition 6.1, page 298, and Example
6.2, page 299, were read in the Library copy. They give the adjunctions,
the triangle and the triangular-ring recollement on unbounded derived
categories. Page 298 was also rendered in memory to check the diagram.
Swapping the two diagonal positions in that source gives
the frozen convention. The displayed triangle begins `j_!j^*X→X→i_*i^*X`.
See [the published article](https://doi.org/10.1007/s10468-021-10094-2).

Green–Psaroudakis–Solberg, *Reduction techniques for the finitistic
dimension*, published version, Transactions AMS 374 (2021), Theorem 5.1,
page 6865, and Theorem 5.2, page 6866, were read in the Library copy.
They state respectively the bounded-derived-recollement equivalence and
the triangular bound recalled in lines 88–90, crediting Happel and
Fossum–Griffith–Reiten. These are secondary citations; the originals
were not read, so no original theorem numbers are claimed here.
Their convention is right modules. Apply their upper bound to A^op
and exchange the diagonal positions to obtain the left-module bound.
See [the published article](https://doi.org/10.1090/tran/8409).

## Claim 4: finite extinction times

Verdict: **no error found**, with extinction time defined as
`t(V)=min{n≥0:F^n(V)=0}` when that set is non-empty (AI-proved).
The quantifier is over V that eventually vanish. The claim does not
assert that F is nilpotent on the entire derived category.

Write U_1,…,U_N for representatives of the indecomposable left
D-modules. Since D is hereditary, every bounded complex is a finite
direct sum of modules U_i[s]. One direct check is to split successive
truncation triangles: their connecting maps are Ext groups of degrees
at least two, so vanish. Krull–Schmidt decomposition of the finitely
many cohomology modules finishes the decomposition. No algebraically
closed ground field is required.

The functor `F=X⊗^L_D−` is well-defined on D^b(mod D). A bounded
complex has a bounded resolution by finitely generated projectives,
as D has global dimension at most one; tensoring it with the finite
bimodule X remains bounded and finite-dimensional. In particular no
projectivity assumption on X as a bimodule is needed. This tensor
orientation uses left D-modules; for right modules it is `−⊗^L_D X`.

Define a directed graph on {1,…,N}, putting an edge i→j whenever
some shift U_j[s] occurs as a direct summand of F(U_i). For an object
V, let supp(V) forget the shifts and multiplicities. Additivity and
commutation with shifts give the exact equality

`supp(FV) = ⋃_{i∈supp(V)} supp(FU_i)`.

There is no cancellation: these are direct-sum decompositions, not
alternating sums in a Grothendieck group. Induction says F^nV≠0
exactly when the graph has a walk of length n beginning in supp(V).
If a walk repeats a vertex, its cycle can be repeated indefinitely,
so V cannot have finite extinction time. If t(V) is finite, no walk
from its support repeats a vertex. Such walks have length at most
N−1, hence `F^N(V)=0` and `t(V)≤N`. For V=0 the time is 0.
Equivalently, the Boolean matrix has entry (j,i) equal to one exactly
for i→j; it acts on the column indicator vector of the support.

Small checks (supported):

- D=k, X=0: non-zero objects have time 1=N. With X=k, the identity
  functor has no non-zero objects of finite extinction time.
- D=k×k and the one-dimensional bimodule with `e_2Xe_1=k`:
  `F(S_1)=S_2`, `F(S_2)=0`. The times are 2 and 1; the bound N=2
  is attained. This also checks that the bound is N, not N−1.
- For `D=k(1→2)`, `X=De_2⊗_k e_1D`, the three indecomposables
  are S_1, S_2 and De_1. Their images are S_2, 0 and S_2, respectively,
  so their times are 2, 1 and 2. Direct sums and arbitrary shifts
  give the same support calculation.
- Dropping heredity breaks the supporting argument even for finite
  representation type: for `D=k[ε]/(ε²)` the perfect complex
  `[D --ε→ D]` is not the sum of its two cohomology modules shifted
  into place. Each cohomology is k, which has infinite pd; such a
  decomposition would make k a direct summand of a perfect object.
  Also `k⊗^L_D−` does not preserve D^b, since its value on k has
  non-zero cohomology in every non-positive degree.

Literature (cited): Keller, *Derived categories and tilting*, author PDF
dated November 2003, last modified 2004-04-21, Section 2.5, page 6,
was read, including its proof of decomposition into shifted cohomology.
Section 2.4 fixes the same shift convention. This locator belongs to
[that PDF](https://webusers.imj-prg.fr/~bernhard.keller/ictp2006/lecturenotes/keller.pdf),
not to the later Handbook pagination. The source writes the summands
as `(H^nM)[−n]`. The finite-graph extinction argument is supplied above;
no source for that exact bound was identified in the searches.

## Higher Ext and the literature for Lemma 2

The all-degree correspondence at lines 63–65 is valid after the
multiplicity correction (AI-proved using the cited grade formula).
Here is the precise application; it does not use O.5.

Put `N=B⊕M` and `Q=A/AfA`. The quotient Q has just the simple type
S. If every Ext from S to A vanishes, induction on composition length
gives the same vanishing for Q. Conversely,

`Ext^p_{Q^op}(S,Ext^q_{A^op}(Q,A)) ⇒ Ext^{p+q}_{A^op}(S,A)`

is the change-of-rings spectral sequence, with all terms interpreted
for right modules. Thus vanishing for Q implies vanishing for S.
In the endomorphism description, AfA consists precisely of maps N→N
factoring through add(B), so Q is the stable endomorphism ring of N.
The cited grade formula below therefore identifies vanishing for Q
with `Ext^i_{B^op}(N,N)=0` for all i≥1, equivalently
`Ext^i_{B^op}(M,B⊕M)=0` for all i≥1. The converse applies to
such an endomorphism algebra when its complementary quotient has one
simple type; without that restriction it gives a quotient with possibly
several missing simple types, not the stated literal pair with a simple.

The most directly applicable source read is Buchweitz, *Morita Contexts,
Idempotents, and Hochschild Cohomology—with Applications to Invariant
Rings*, [arXiv:math/0301347v1](https://arxiv.org/html/math/0301347v1).
Section 1.8 uses right modules, denoted there by subscripts A rather
than A^op. Proposition 2.9(2) gives precisely the double-centralizer
criterion with grade at least two. Definition 2.1 and Theorem 2.13
give, for a generator N,

> `grade_End(N)(stable End(N)) = 1 + inf{i≥1 : Ext^i(N,N)≠0}`.

The statements, standing conventions, Lemma 2.2 and the proof of
Theorem 2.13 were read. This is a cited input, not a new verification of
all of Buchweitz's spectral-sequence arguments.

Auslander–Reiten, *On a generalized version of the Nakayama conjecture*,
Proceedings AMS 52 (1975), Section 1, pages 70–72, particularly
Theorem 1.1, was also read in the Library's published PDF. Page 71
was rendered in memory to check the inequality i≥1, which text
extraction had garbled. This source uses left modules and opposite
endomorphism rings. Its theorem relates missing injectives to
nonprojective self-orthogonal generators; in part (a) it chooses the
projective types that occur in the entire injective resolution. It does
not literally state the fixed-single-simple corner formula in the
frozen text. Buchweitz's criterion above supplies that application.
The short source phrase “nonprojective generator” describes the
counterexample on the smaller algebra.
See [the published source](https://doi.org/10.1090/S0002-9939-1975-0389977-6).

## Scope and final verdicts

| Item | Verdict on the frozen text | Disposition |
|---|---|---|
| Lemma 1 | error found | Restrict C to modules without projective summands (or use stable classes); correct the side of Ext and the dual-coresolution homology sentence. The existence criterion and pd C_m=m are AI-proved above. |
| Lemma 2 | no error found | Fix right-module notation and spell out the idempotent convention. The subsequent dimension formula is erroneous as a general endomorphism formula; the subsequent simple-top identification misses multiplicity. |
| Lemma 3 | gap | D^b-membership is not justified. The D^- version, adjunctions, triangle, and splitting argument are AI-proved above. The universal non-stratifying consequence is invalid. |
| Claim 4 | no error found | The support graph gives t(V)≤N for every eventually vanishing V, uniformly in shifts and multiplicities. |

The searches covered the local Library bibliography and relevant PDFs,
the open web, arXiv, and searches restricted to MathSciNet and zbMATH.
The last two did not return usable records in this session; no claim
of exhaustive database coverage or novelty is made. No papers were
imported and no Library files were modified. Primary sources and
explicitly identified secondary expositions are distinguished above.
No locator was taken merely from a search snippet or an unread reference.

Checks consisted of algebraic derivations, the displayed small hand
calculations, and source reads. There was no computer algebra or Lean
verification. No example in this audit is advertised as a small
counterexample to the strong Nakayama conjecture. The unresolved point
is boundedness of Z under the full hypotheses of the original Lemma 3;
the corrected dichotomy does not depend on resolving it.
