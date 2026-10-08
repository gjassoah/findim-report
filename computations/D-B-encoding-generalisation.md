Model: unknown; effort: unknown.

# D-B subtask: encoding and projective-bimodule generalisation

Claim: report 6.1 and optional 5.3. Scope: all fields, finitely presented
unital k-algebras, and k-central bimodules finitely generated projective on
the right. Conventions: left modules except where stated, paths composed
right to left, and cohomological shifts. This is proof scratch, not a
computational verification.

## Independent attempt before reading proof environments

The source was first filtered to remove proof environments. The inline
quadraticisation explanation at source lines 27–32 was thereby read before
an independent attempt. This subclaim does not satisfy independent-first
provenance. The directed-bound proof environment has not yet been read.

### Directed bound: independent proof

Let Λ be finite dimensional over k, with complete orthogonal idempotents
ε_0,...,ε_{n−1}, diagonal corners k ε_i and ε_jΛε_i=0 for j<i.
Set J=⊕_{j>i} ε_jΛε_i. Multiplication of corner components shows that J
is a two-sided ideal and J^n=0; Λ/J is the product of the n copies of k
(omit a zero idempotent if the convention permits it). Thus J=rad Λ:
a nilpotent ideal is contained in the radical, and the radical maps to
zero in the semisimple quotient.

For an arbitrary left Λ-module N supported at vertices i≥m, choose a
k-basis of every ε_i(N/JN), lift it to ε_iN, and form the projective
module P=⊕_i(Λ ε_i)^{(basis_i)}. The resulting map P→N is surjective:
its cokernel C has C=JC, whence C=J^nC=0. At vertex m it is an
isomorphism, since ε_mJN=0 and ε_mΛε_i=0 for i>m. Hence the kernel
is supported at vertices i≥m+1. Starting at m=0 and repeating gives
a projective resolution of length at most n−1; a module supported only
at n−1 is a sum of Λ ε_{n−1}=k ε_{n−1}. This works for arbitrary
modules, so bounds the ordinary left global dimension. Apply the same
argument to Λ^op with idempotents in reverse order for the right bound.

### Generalisation: independent proof plan

Let R be a finitely presented unital k-algebra. Take an idempotent
ε∈M_n(R) and a unital k-algebra map ρ:R→εM_n(R)ε, where the unit
of the corner is ε. Give Ψ=εR^n the left action ρ, using right-module
columns. Then HY=Ψ⊗_R Y identifies with ε_Y Y^n, with r acting by
the matrix ρ(r)_Y. This is finite dimensional for finite-dimensional Y,
and exact because Ψ_R is projective.

Assume the quotient-action, odd-double, finite-diagram lifting and
rectification results of report 6.2–6.6. Apply θ entrywise to matrices
and put U=(E_0^n,θ_n(ε)) in Kar(𝒬). The map θ_n∘ρ is a unital
R-action on U. Form the odd double V=U⊕U[3] and represent it by an
object of 𝒬. Transport the diagonal R-action to that representative,
then use the encoding quiver with this object at each vertex. Evaluation
at Y gives HY⊕HY[3] and precisely its R-action. Lifting and
rectification have only this finite diagram as input. Hence the same
P satisfies P⊗^L_B M(Y)≃M(HY)⊕M(HY)[3]. All choices precede Y.

The potential obstacles were tested before source comparison: n=1,
ε=0 gives H=0; ε=1 and ρ=id gives the identity functor; noncentral
ε is harmless because ρ already has image in its corner. A ring map
ρ which is not a k-algebra map is not enough for the k-linear diagram.
Finite presentation of R and finite right projectivity of Ψ are the
hypotheses used by this construction, not disposable assumptions.

Status at this checkpoint: directed bound AI-proved by the written
argument; generalised realisation plausible pending inspection of all
interfaces in the source and parent dossiers. Quadraticisation still
requires its expanded proof below.

## Final §6.1 fragment

**Statement (AI-proved).** Let k be a field and R a finitely presented
unital k-algebra. There is a finite presentation
\[
 R=k\langle x_1,\ldots,x_d\rangle/(p_1,\ldots,p_t),
 \qquad \deg p_j\leq2,
\]
where constants and linear terms are allowed. Define the quiver with
vertices 0,1,2, arrows s,a_1,...,a_d:0→1 and s',a'_1,...,a'_d:1→2,
and no other arrows. Let W be the subspace of its length-two path space
spanned by a'_h s−s'a_h and the homogenisations \(\widetilde p_j\),
using
\[
 x_hx_l\mapsto a'_ha_l,\qquad x_h\mapsto s'a_h,
 \qquad 1\mapsto s's.
\]
For B=kQ/(W), its vertex idempotents are denoted \(\mathbf e_i\).
If r=dim_k W, then
\[
 \dim_k B=3+2(d+1)+(d+1)^2-r,
 \qquad \operatorname{gldim} B\leq2
\]
on both sides. Every finite-dimensional left R-module Y defines a
left B-module M(Y), with Y at every vertex, s,s' the identity, and
a_h,a'_h the action of x_h. This gives an exact fully faithful functor
from finite-dimensional left R-modules to finite-dimensional left
B-modules, and dim_k M(Y)=3 dim_k Y.

**Quadraticisation.** Start with a finite presentation on letters
y_1,...,y_m. For each word w=y_{i_1}...y_{i_L} of length L≥3 which
occurs in any defining relation, introduce fresh letters z_{w,q},
2≤q≤L−1. Add the relations
\[
 z_{w,2}=y_{i_1}y_{i_2},\qquad
 z_{w,q}=z_{w,q-1}y_{i_q}\quad(3\leq q\leq L-1).
\]
Replace this occurrence of w in every old relation by
z_{w,L−1}y_{i_L}; leave words of length at most two unchanged. The
new presentation has finitely many letters and relations, all of degree
at most two. Sending each z_{w,q} to the corresponding prefix of w
defines a homomorphism from the new algebra to the old. Sending each
old letter to itself defines a homomorphism in the other direction:
the binary relations identify z_{w,q} with its prefix, and hence the
new version of each old defining relation is the old relation. These
maps are inverse on old and new generators. This justifies the claimed
presentation without a homogeneous-quadratic assumption on R.

**Path-space calculation.** There are three length-zero paths,
2(d+1) length-one paths, and (d+1)^2 length-two paths. All length-two
paths go from 0 to 2. Multiplication of such a path by any composable
positive-length path on either side is impossible. Consequently the
two-sided ideal generated by W is exactly W as a vector subspace;
the three path-length spaces remain separate in B. This gives the
dimension formula. It also gives
\[
 \mathbf e_iB\mathbf e_i=k\mathbf e_i,
 \qquad \mathbf e_jB\mathbf e_i=0\quad(j<i).
\]
In particular any basis \(\mathcal R\) of W generates the relation
ideal and is linearly independent in the free length-two path space.

**Directed dimension bound, for arbitrary modules.** More generally,
let Λ be a finite-dimensional k-algebra with a decomposition of 1
into n pairwise orthogonal nonzero idempotents ε_i such that
\(\varepsilon_i\Lambda\varepsilon_i=k\varepsilon_i\) and
\(\varepsilon_j\Lambda\varepsilon_i=0\) for j<i. Write
\(J=\bigoplus_{j>i}\varepsilon_j\Lambda\varepsilon_i\).
The corner multiplication rule makes J a two-sided ideal with J^n=0;
the diagonal-corner map identifies Λ/J with k^n. For completeness,
J is the radical: 1−ax is invertible by a finite geometric series for
every a∈Λ and x∈J, while the kernels of the n maps Λ→k show that
the radical is contained in J.

Suppose a left module N is supported at vertices i≥m. For each i
choose a k-basis of ε_i(N/JN), with lifts in ε_iN. Mapping the
corresponding copies of Λ ε_i to these lifts gives a map P→N
from a projective module. Its cokernel C satisfies C=JC, hence C=0
because J^n=0. At vertex m this map is an isomorphism: ε_mJN=0;
only i=m contributes to ε_mP; and ε_mΛε_m=k ε_m. Its kernel
therefore has support at vertices i≥m+1. Starting at m=0, each
kernel advances the lower endpoint of its support. The (n−1)st
kernel has support only at vertex n−1 and is a direct sum of copies
of Λ ε_{n−1}=k ε_{n−1}, hence projective. This constructs a
projective resolution of length at most n−1 for every left module,
including modules which are not finitely generated. For n=1 the
starting module itself is projective. The opposite algebra with its
idempotents ordered in reverse satisfies the same hypotheses, so the
right global dimension has the same bound. Taking Λ=B and n=3 gives
the assertion.

**Modules.** The commutation relation a'_h s=s'a_h becomes equality
of the two operators x_h on Y. Each \(\widetilde p_j\) acts as p_j,
which is zero on Y, so M(Y) is defined. An R-module homomorphism
u:Y→Z gives the B-module map with u at each vertex. Conversely, a
B-module map has equal components at all vertices because it
commutes with s and s', and this common component commutes with
every x_h because it commutes with a_h. It is therefore R-linear.
This proves full faithfulness. Exactness follows because kernels and
cokernels of a map of representations are formed at each vertex;
equivalently applying \(\mathbf e_i(-)\) is exact and the three
vertex functors detect exactness. The dimension formula for M(Y)
follows from its direct-sum decomposition by vertex idempotents.

**Comparison with the source.** Source locators:
`build/sections/03-localization-and-lifting.tex`, lines 23–64
(quadratic presentation and B), Lemma `lem:directed-bound`, lines
69–107 (both-sided global dimension), and lines 109–112 (M(Y)).
No mathematical issue found in these passages. The independent
directed-bound argument used projective generators of the top N/JN;
the source uses the larger direct sum \(\bigoplus_i\Lambda
\varepsilon_i\otimes_k\varepsilon_iN\), which has the same support
property and avoids introducing J. The dimension formula and full
faithfulness here are additional deductions, not assertions quoted
from the preprint. The inline quadraticisation proof was read before
the independent attempt, as recorded above. No NRS attribution is
used in this proof.

## Final §5.3 fragment

**Statement (AI-proved, using dossier 6.2–6.6).** Let k be a field, R
a finitely presented unital k-algebra, and Ψ an R-bimodule whose two
actions of k agree. Assume that Ψ is finitely generated projective as
a right R-module. Put H=Ψ⊗_R− on finite-dimensional left R-modules.
Choose B and M from §6.1. There is a bounded complex P of
finite-dimensional B-bimodules, termwise projective on the right,
chosen independently of Y, for which
\[
 P\otimes_B^{\mathbf L}M(Y)
 \simeq M(HY)\oplus M(HY)[3]
 \quad\text{in }\mathbf D^b(B\text{-}\mathrm{mod})
\]
for every finite-dimensional left R-module Y. If
\(\mathcal F=P\otimes_B^{\mathbf L}-\), then
\[
 \mathcal F^j M(Y)\simeq
 \bigoplus_{q=0}^j
 M(H^{\circ j}Y)[3q]^{\oplus\binom jq}
 \qquad(j\geq0).
\]
Thus the replacement of the original selection datum by (R,Ψ) requires
only a matrix version of the formal summand and its action; the
lifting and rectification formulas themselves do not change.

**1. Matrix presentation of the bimodule.** Choose a surjection of
right modules p:R^n→Ψ with a section s:Ψ→R^n. The right-linear
endomorphism ε=sp of the column module R^n is a matrix in M_n(R)
with ε²=ε. The maps s and p identify Ψ with εR^n. A right-linear
endomorphism f of εR^n corresponds to the matrix of the composite
\(R^n\xrightarrow{\varepsilon}\varepsilon R^n
\xrightarrow{f}\varepsilon R^n\hookrightarrow R^n\).
This gives an algebra isomorphism
\[
 \operatorname{End}_{R^{\mathrm{op}}}(\varepsilon R^n)
 \cong\varepsilon M_n(R)\varepsilon,
\]
whose unit is ε. Transferring the left R-action gives a unital
k-algebra homomorphism
\[
 \rho:R\longrightarrow\varepsilon M_n(R)\varepsilon,
 \qquad \rho(1)=\varepsilon.
\]
The agreement of the two k-actions is exactly what ensures
ρ(λ1_R)=λε. Conversely, such (ε,ρ) defines a k-central bimodule
with underlying right module εR^n. This establishes the equivalence
of the bimodule and matrix formulations in the question.

**2. Tensor evaluation.** The right-module isomorphism
\(R^n\otimes_R Y\cong Y^n\) sends a column r tensored with y
to the column with entries r_i y. Under this isomorphism ε⊗1 is
the operator ε_Y obtained by letting each matrix entry act on Y.
Since εR^n is a direct summand of R^n, restriction gives a natural
vector-space isomorphism
\[
 HY\cong\varepsilon_Y(Y^n).
\]
The operator representing r∈R on this image is ρ(r)_Y. Because
ρ(r)=ερ(r)ε, it both preserves the image and vanishes on the
complementary summand. Its unit acts as the identity on the image,
and its product law is matrix multiplication. In particular
dim_k HY≤n dim_k Y. The functor H is exact because Ψ_R is a direct
summand of a finite free right module, so tensoring with Ψ is a
direct summand of an exact functor. Exactness is detected on the
underlying k-vector spaces.

**3. Action in the quotient.** Use the exact quotient and action of
§6.2,
\[
 \mathcal Q=\mathbf K^b(\mathrm{proj}\text{-}B)/\mathcal S,
 \qquad \theta:R\to\operatorname{End}_{\mathcal Q}(E_0).
\]
The direct sum E_0^n identifies its endomorphism algebra with
M_n(End_𝒬(E_0)), with usual matrix composition. Applying θ
entrywise gives an algebra map θ_n from M_n(R). Set
\[
 U=(E_0^n,\theta_n(\varepsilon))\in\operatorname{Kar}(\mathcal Q).
\]
Since every ρ(r) is sandwiched by ε, the maps θ_n(ρ(r)) are
endomorphisms of U. Their product law follows from the two algebra
maps, and θ_n(ρ(1))=θ_n(ε)=id_U. Thus U has a unital k-linear
R-action. Evaluation extends to the idempotent completion (§6.3)
and sends this object and action to the vector space HY and its
R-action described in step 2.

**4. Odd double and finite diagram.** By §6.3, choose an object
V_0∈𝒬 representing U⊕U[3]. Transport the diagonal R-action
along this fixed isomorphism. Put V_0 at all three vertices of B,
put the identity on s,s', and put the transported action of x_h
on a_h,a'_h. The commutation relations follow because s,s' are
identities. The homogenised relations follow by applying the
k-algebra action to p_j=0. Hence this is a B-diagram in 𝒬.
Its evaluation at Y has HY⊕HY[3] at each vertex and the R-action
of HY on both summands. Every choice so far depends only on R,Ψ,
their presentations, and the fixed quotient.

The K₀ issue creates no new obstruction for this matrix idempotent.
In the odd-double construction, S is a cone of 1−θ_n(ε) on E_0^n,
so [S]=0 in K₀(𝒬). The object V_0 is then a cone of a morphism
S[1]→S, so [V_0]=[S]−[S[1]]=2[S]=0 in K₀(𝒬).
The notation [U] in K₀(𝒬) is not used: U is initially only an
object of Kar(𝒬), and there need not be a representative in 𝒬.

**5. Lifting, rectification, and splitting.** Apply §6.4 to the
single finite diagram of step 4 and choose representative complexes,
chain maps, and null-homotopies for its finitely many relations.
Apply §6.5 to obtain P. Neither lemma has a hypothesis concerning
central idempotents or endomorphisms of R: their input is precisely
a B-diagram and its lifted chain data. Their evaluation conclusion
gives, for T_Y=P⊗^L_B M(Y),
\[
 H^q(T_Y)\cong
 \begin{cases}M(HY),&q=0,-3,\\0,&\text{otherwise},\end{cases}
\]
including all arrow actions. The truncation triangle has connecting
map in
\[
 \operatorname{Hom}(H^0(T_Y),H^{-3}(T_Y)[4])
 =\operatorname{Ext}_B^4(H^0(T_Y),H^{-3}(T_Y))=0
\]
because gldim B≤2. It therefore splits by §6.6, giving the claimed
isomorphism. No natural choice of this splitting is required. The
iterate formula follows by induction using the formula just obtained
with H^{\circ j}Y in place of Y, finite dimensionality from step 2,
preservation of shifts and finite sums by derived tensor, and
\(\binom jq+\binom j{q-1}=\binom{j+1}q\).

**Scope and comparison.** No centrality of ε, no projectivity on
the left, and no injectivity or surjectivity of ρ is needed. For
the original data, take n=1, ε=e and ρ(r)=eα(r)e; centrality of
e in the original setting makes this a corner-valued homomorphism,
and its action on eR recovers \({}_{\alpha}(eR)\). If e is not
central, one can instead start with any unital k-algebra homomorphism
ρ:R→eRe. Here 'unital' means ρ(1)=e, not necessarily ρ(1)=1_R.

The finite-presentation hypothesis on R supplies a finite encoding
algebra B. Finite right projectivity supplies the finite matrix
idempotent used in step 3 and the preservation of finite-dimensional
modules. Without these hypotheses the displayed argument does not
apply; no assertion of impossibility is made. If 'homomorphism'
means only a ring homomorphism, k-linearity must be added: otherwise
ρ(λ) need not equal λε and step 3 is not an action of R as a
k-algebra. With the customary k-central meaning of 'R-bimodule',
this is already part of the assumptions.

Remark O.3' in `notes/02-constraints-and-criteria.md`, lines 72–77,
was a sketch, not a claim made by the preprint. The source passages
which change are `03-localization-and-lifting.tex`, lines 252–284:
replace E_0 and θ(e) by E_0^n and θ_n(ε), and replace eα(r)e by
ρ(r). The lifting proposition, lines 401–443, then has HY in place
of eY with its old twisted action. The rectification lemma in
`04-tensor-realization.tex`, lines 36–224, has no R,e,α-dependent
input. Its theorem proof, lines 235–281, uses only the evaluated
diagram and gldim B≤2; its iterate proof, lines 295–303, uses
only finite dimensionality of every H^{\circ j}Y. Thus all these
interfaces were checked against the source; no failure was found.

For stages S2–S4 as phrased in Remark O.3', S4 takes only the fixed
bounded right-projective complex P as input (see the opening of
`05-ordinary-simulation.tex`, lines 4–10). The generalisation gives
exactly that input. The later extinction implication consequently
remains conditional on the report's simulation and detection lemmas;
it imposes no additional condition on ρ. If a family Y_m has
H^{\circ(m-1)}Y_m≠0=H^{\circ m}Y_m, the even-iterate formula in
`06-square-zero-and-conclusion.tex`, lines 291–334, uses no other
property of the original central-idempotent selection process.

**Status.** AI-proved as an application of dossier 6.1–6.6, with
every new matrix-action and bimodule-identification step written
above. It is not a claim of independent verification of the parent
dossier's localization or rectification proofs. No preprint issue
arises from this optional extension. The potentially weakest
interface was k-linearity of ρ; it is now explicit in the statement.
