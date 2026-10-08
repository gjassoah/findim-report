Model: GPT-6 (Codex; exact variant unknown); effort: unknown.

# V-B: adversarial check of the frozen dossier

Date: 2026-10-08. This is an AI review, not author certification.
The claims and proofs under review are exclusively those in
`scratch/V-B-frozen.md`; the binding conventions are exclusively those in
`audit/report-notation.md`. Mathematical conclusions below carry the
status **AI-proved** where a complete argument is checked; finite hand
examples carry the status **supported**. These statuses describe this
review, not a promotion of any repository ledger.

Input SHA-256:

- Frozen dossier: `81dfce8657c421a23a91a132cc9b988e989c3ab3b974335f287a7de98e80f0aa`.
- Conventions at the initial reading: `18f7d074a008866cefe229e6c2d8cd0025dc5d71874adf5c5427958919227488`.
- Conventions at final rereading: `f69ee451cfbff429f46196434626154173f6ed52cc4657c8c8976e20fd6db8d5`.

The conventions file changed concurrently during this review. Its
syzygy and Toda-bracket entries were amended; neither enters the
statements checked here. The final version was reread, and the relevant
field, module-side, composition, shift, and derived-tensor conventions
are unchanged. The frozen dossier and the three preprint source hashes
below were unchanged at the final check.

The required governing instructions, README, and task V-B were read.
The latest task's restriction took precedence over the general instruction
to read PROGRESS. No prohibited notes, other audit files, logs, ledger,
escalations, or previous agent outputs were opened. Three fresh subagents
checked disjoint groups of statements without editing files. Their
arguments are leads that the root reviewer checks, not independent evidence
of correctness. Their exact model variants and effort settings are unknown;
no different-model verification is claimed.

## Verdicts

| Statement | Verdict | Principal checks |
|---|---|---|
| 2.3 | no error found | Right Ore and cancellation; common sources; simultaneous zero detection |
| 6.1 | no error found | Quadraticisation; both global dimensions; exact fully faithful encoding |
| 6.2 | no error found | Right projectives, multiplication order, and exact evaluation through the quotient |
| 6.3 | no error found | Formal cone lemma, odd double, actual K0 classes, selection action |
| 6.4 | no error found | Finite roof lifting; homotopies; every construction choice precedes Y |
| 6.5 | no error found | All entries of the differential square; vertex equivalences; arrow homotopies |
| 6.6 | no error found | Full cohomology modules; Ext^4 splitting; objectwise binomial iteration |
| 5.3 | no error found | Matrix corner, both module sides, evaluation and the generalised interfaces |

These are verdicts on the mathematical statements in their categorical
sense, with the wording correction to 6.4 recorded separately below.
No mathematical counterexample or unresolved proof gap was found.
The stepwise mathematical checks in this section have status **AI-proved**;
this does not assert formal verification or human certification.

### 2.3: right fractions

Frozen lines 68–156. The octahedral triangle supplies composition and
two-out-of-three for the cone class. In the Ore construction, the cone
of v is the same S as the cone of u, and exactness gives `ug=fv`.
The denominator points into the original source X. Cancellation uses
the rotated triangle and factors `f-g` through S[-1]; completing that
factor gives `fv=gv`. This is the right, not the left, multiplicative
system convention of Stacks Definition 4.27.1.

The equivalence of roofs and the localisation universal property are
the cited right-fraction construction and Lemmas 4.27.11 and 4.27.16.
The dossier orders the pair as (denominator,numerator), while Stacks
orders it as (numerator,denominator); both represent `q(f)q(u)^(-1)`.
This is a notation difference with no reversal of composition.
Applying Ore to two denominators gives a common source. The second
refining map belongs to W by two-out-of-three. Induction handles a
finite family, and identity handles the empty family. Equality with
the zero roof supplies one source denominator killing a map; taking
the finite direct-sum map kills the entire finite family. The hypothesis
of essential smallness prevents a size obstruction to the roof category.

### 6.1: presentation, dimension bound, and modules

Frozen lines 161–277. Each auxiliary prefix generator has one defining
quadratic relation. Eliminating them gives inverse maps between the old
and new presentations, including the constant and linear terms.
The right-to-left path convention sends `x_h x_l` to `a'_h a_l`, so
its evaluation is the required ordered product. All defining relations
have path length two. No positive-length path can multiply one without
giving zero; hence the ideal is precisely J2 in the free path space,
and the displayed dimension formula follows.

For the directed-dimension lemma, the displayed surjection is projective
also for an infinite module: its summands are direct sums of vertex
projectives. Its kernel loses the least possible support vertex.
After n-1 steps the kernel is supported at the terminal vertex, whose
left projective is just its one-dimensional diagonal corner. This
supplies the global-dimension bound for all modules. Applying the same
argument to the opposite algebra requires reversing the vertex order,
as the proof does. The case n=1 is included.

In M(Y), both kinds of relations evaluate to zero. A morphism of these
representations has identical vertex components because of s and s',
and those components commute with all generator actions. Thus it is
exactly an R-module morphism. Exactness is vertexwise, and the vertex-0
component detects the zero module.

### 6.2: quotient action and evaluation

Frozen lines 282–359. For right projectives E_i=e_iB, an arrow in
e_jBe_i acts by left multiplication from E_i to E_j. Composition
therefore has the displayed order. The calculation with `(s's)^(-1)`
turns quadratic, linear, and constant homogenised terms into their
original terms under theta. There is no missing opposite algebra.

Termwise tensor is compatible with shifts, cones, and homotopies.
A finite filtration by the terms of a bounded right-projective complex
shows that it tensors acyclic complexes to acyclic complexes, so the
ordinary tensor here computes the derived tensor. The maps
`e_iB tensor_B M(Y) -> e_iM(Y)` and their stated inverses are balanced.
Evaluation kills the two generating cones and then their thick closure.
It inverts every denominator and consequently factors through the
quotient. Stacks Lemma 13.6.8(2) supplies exactness of this factorisation.
The evaluated generator theta(x_h) is x_h, as a left action on Y.

### 6.3: formal cone lemma and odd double

Frozen lines 363–453. For Z=(Z0,p), precomposition by p is a natural
idempotent on the entire representable exact sequence for Z0. Its image
is an exact direct summand. This justifies the use of Hom exactness on
formal objects without first triangulating the completion. For
`f=diag(1_I,0)`, the factorisations of j and v give exactly the short
exact Hom sequence in the dossier. Its surjectivity at Z=A'[1] supplies
a section; injectivity and middle exactness show that `(j',sigma)`
induces a bijection on every Hom. The explicit inverse argument is valid.

The first cone is the cone of **1-epsilon**, so its zero summand is U
and its formal value is U+U[1]. Fullness allows the second map to be
formed in the original category. Its identity summand is U[1], source
complement U[2], and target complement U. Its cone is therefore
U+U[3]. Both actual cone triangles give the stated zero classes in
K0(T). There is no assumed injection from K0(T) to K0(Kar(T)).

Frozen lines 455–489. Centrality of e implies that `e alpha(r)e`
is a multiplicative corner action with identity e; alpha(e)=e is
not needed. Bounded vector-space complexes split into cohomology and
contractible parts, so their derived category splits idempotents.
Evaluation takes the formal summand to eY and the action to the
restriction of alpha(r). Shift [3] places the second copy in degree -3.
This gives the stated B-diagram with its complete arrow actions.

### 6.4: lifting and quantifiers

Frozen lines 504–575. The first common denominator replaces vertex 1
against fixed vertex 2. The second replaces vertex 0 against the now
fixed vertex 1. The displayed squares then conjugate each relation
error to the zero relation of the prescribed diagram. One further
denominator into vertex 0 annihilates the finite family of errors.
Precomposing all source-zero arrows by this denominator leaves every
other square intact. There are no incoming arrows at 0, no outgoing
arrows at 2, and no additional path overlaps to repair. Vanishing of
the basis relations suffices for all relations.

Passing from the homotopy category to chosen chain representatives
gives right-linear degree -1 homotopies with `dh+hd=f_rho`.
The presentation, relation basis, quotient, cones, formal isomorphisms,
action, roofs, refinements, representatives, and homotopies are all
chosen using the fixed input, before introducing Y. Evaluation of the
fixed squares works for every Y. An isomorphism or a truncation splitting
chosen later at a particular Y changes none of these data and does not
change P.

Frozen lines 577–612. With supports of the D_i in [a,b], the shifted
columns of 6.5 have union of supports contained in [a-2,b]. The width
b-a+2 is correct. The argument supplies no numerical bound on a,b for
the main example and makes no computability or impossibility claim.
That limitation is not a gap in the stated existence result.

### 6.5: differential, vertex comparison, and arrow homotopies

**Verdict: no error found.** The source comparison has also been completed.

At frozen lines 633–699, each matrix entry has total degree one on
`L0 + L1[1] + L2[2]`. In particular, eta decreases internal degree by
one while moving from column 2 to column 0. The composite
partial1 partial2 is minus the relation endomorphism in the vertex-2
summand; its vertex-0 part vanishes in B and its two vertex-1 parts
cancel. Thus `d0 eta + eta d2 = -partial1 partial2`. The signs
`+,-,+` give exactly the three off-diagonal zero equations displayed
in the dossier. This uses no assumption on the characteristic.

At lines 706–769, the filtration by the source of the second tensor
factor is preserved: the f terms and eta increase that source.
The diagonal piece is precisely the injected D_i. The remaining adjacent
pieces have an identity arrow-space differential. The (0,2) piece is
the exact sequence from the basis of J2 to the free length-two path
space to its quotient. In particular, injectivity here really needs
a basis, not a redundant generating list. Tensoring its contraction
with D_j has cancelling internal signs. Finite filtration then gives
acyclicity. The quotient is bounded and termwise right-projective;
splitting from the highest degree proves contractibility.

At lines 771–786, the explicit inverse also has the right sign:
from `d_D t + t d_C = 0` and `d_C s + s d_C = 1`,
`d_D(x-tsc) = d_D x + t d_C s c = r d_P(x,c)`.
The displayed K satisfies `d_P K + K d_P = 1 - iota_i r`.
At lines 788–807, H_a has degree -1, and its internal terms cancel
against the minus sign on L1[1], leaving
`a iota_i - iota_j f_a`. There are no longer paths requiring a further
coherence equation. All tensor factors and maps have the stated sides.

### 6.6: realisation, splitting, and iterates

Frozen lines 832–908. Right projectivity justifies using ordinary tensor
with M(Y), and tensoring preserves the constructed right-linear homotopy
identities. The arrow homotopies, together with the fixed quotient
diagram isomorphisms, identify cohomology as full left B-modules.
The argument does not infer a derived B-module isomorphism merely from
an isomorphism of diagrams in D^b(k). Instead it next uses the two
cohomology degrees 0 and -3.

The good truncation in [-3,0] has A_{-3} as its degree -3 cycle
submodule. Quotienting out A_{-3}[3] leaves a complex with only A_0
as cohomology. This gives the stated triangle. In particular, its
connecting map is from A_0 to A_{-3}[4], not to A_{-3}[3] or
A_{-3}[-4]. A left-projective resolution of A_0 of length at most
two has no degree-four Hom term against A_{-3}; the connecting map
therefore vanishes. Lifting the identity to a section and taking its
sum with the first triangle map gives an isomorphism on both
cohomology groups, hence a derived isomorphism.

Frozen lines 910–920. H preserves finite dimensionality; in particular
the theorem can be applied to H^jY at every finite stage. The tensor
functor preserves finite sums, shifts, and isomorphisms. The induction
then gives Pascal's coefficients, including j=0 and the endpoints.
Objectwise isomorphisms suffice: no natural splitting is being used.

### 5.3: general finite right-projective selection bimodule

Frozen lines 933–990. A split right-linear presentation gives
epsilon=sp on the right free column R^n. Its endomorphisms act by
left matrix multiplication, and restriction gives the corner
epsilon M_n(R)epsilon. Thus End_{R^op}, rather than End_R of a
left free module, is the correct endomorphism ring, without another
opposite on the corner. The transferred action has identity epsilon;
agreement of the two k-actions supplies its k-linearity.

The balanced map `R^n tensor_R Y -> Y^n` identifies the direct
summand with the image of epsilon_Y, with action rho(r)_Y. It gives
dimension at most n dim(Y). Right projectivity makes H exact; all
its finite iterates remain finite dimensional. The zero bimodule is
explicitly covered by epsilon=0.

Frozen lines 992–1051. Entrywise theta respects ordinary matrix
multiplication. The corner equations give an action on the formal
summand, and evaluation gives precisely the module just described.
The general odd-double lemma accepts E_0^n. The arbitrary-diagram
statement of 6.4 and the chain-data statement of 6.5 require neither
centrality nor an endomorphism of R. They therefore apply to this
fixed diagram without a changed hypothesis. The cohomology and
Ext^4 argument of 6.6 then applies, as does its induction.
Every choice defining P precedes Y; increasing n changes these
choices, not the encoding algebra B. No left projectivity or
injectivity/surjectivity of rho has slipped into the proof.

## Wording versus proof

- **6.4, frozen lines 519–521:** replace “their evaluated diagram is
  the diagram” by “their evaluated diagram is isomorphic, as a diagram
  in D^b(k-mod), to the diagram”. The maps used in the proof provide
  this isomorphism. They do not identify chain complexes literally.
  This is a wording correction, not a counterexample to diagram lifting.

No other mathematical statement/proof mismatch was found. In particular,
6.3 does not assert that U always fails to descend, 6.4 does not assert
an effective numerical length bound, and 6.6 does not assert natural
splitting isomorphisms. The matrix replacements in 5.3 are explicitly
made before the unchanged lifting and rectification arguments are used.

## Small and boundary checks

These are finite or special-case hand checks, status **supported**.
They are not a substitute for the universal arguments above.

- With R=k and no generators or relations, B is k(0->1->2), of
  dimension 6, and M(Y) has identity structure maps. The directed
  lemma at n=1 gives global dimension 0. Y=0 is consistent throughout.
- With epsilon=0 the two formal cones represent zero. With epsilon=1
  they represent L+L[1] and L+L[3]; their K0 classes vanish. These
  check the choice of 1-epsilon and the positive odd shift.
- Empty relation space causes no failure: the final killing denominator
  can be the identity and column L2 is absent. For the opposite extreme,
  when J2 is the entire length-two path space, (6.5.4) has zero rightmost
  term and its first nonzero map is an isomorphism. With no arrows,
  P=L0 and each vertex comparison is the identity.
- A nonzero-homotopy sign check over Q: let
  `B=Q(0 -a-> 1 -b-> 2)/(ba)` and let all D_i be
  `B^2 --(2,0)--> B` in internal degrees 0,1. Let pi project onto
  the contractible first-coordinate summand, take f_a=3 id,
  f_b=5 pi, and let h send w in degree 1 to `(15w/2,0)` in
  degree 0. Then `dh+hd=15 pi=f_b f_a`. On a relation-column
  input in internal degree 0, the vertex-2 contribution to d_P^2
  is `-15 pi + h d = 0`; in internal degree 1 it is
  `d h - 15 id = 0`. The two vertex-1 terms cancel and ba=0
  kills the vertex-0 term. These are all potentially nonzero
  relation-column inputs (total degrees -2,-1). If eta is omitted,
  the first input `(1_B,0)` leaves `-15(1_B,0)` and the second
  input `1_B` leaves `-15 1_B`, both nonzero. Thus this check would
  detect omission of the correction term or its opposite sign.
- For a noncentral matrix example, set R=T_2(k), e=e_11, f=e_22,
  p(u,v)=u+v, and s(r)=(er,fr). Then ps=1,
  `epsilon=[[e,e],[f,f]]`, and
  `rho(r)=[[er,er],[fr,fr]]`. Direct multiplication using e+f=1
  gives epsilon^2=epsilon, rho(r)rho(t)=rho(rt), and
  epsilon rho(r) epsilon=rho(r). At any Y, its image is
  `{(ey,fy):y in Y}`, with inverse `(u,v)->u+v`, and rho recovers
  the original left action. This checks the matrix order and evaluation
  without assuming centrality of epsilon.

No computation scripts or prior saved outputs were read or run. The
explicit instruction to modify only this audit file was respected;
the small checks above are recorded as hand calculations.

## Sources and locators actually read

The root reviewer read the following primary passages directly, in
addition to the subagents' checks. Every local preprint locator cited
in the frozen dossier was compared with the corresponding source.

| Source/version | Passages read | Result of locator check |
|---|---|---|
| Main preprint, September 23, 2026, local `build/` | `paper.tex` title/date; section 03 lines 1–284 and 286–444 | All cited ranges 23–112, 116–169, 190–284, 292–335, 337–444 match the stated constructions |
| Same preprint | section 04 lines 1–304 | Ranges 36–224, 226–233, 235–303 match rectification, coherence scope, splitting and iteration |
| Same preprint | section 05 lines 1–110 | Read only to check the subsequent simulation's input requirements; its proof was not audited |
| Stacks Project, live version accessed 2026-10-08 | [§4.27, Definition 4.27.1 and right-roof construction](https://stacks.math.columbia.edu/tag/04VB) | Hypotheses and source-denominator orientation match |
| Stacks, same access date | [Lemma 4.27.11, 04VH](https://stacks.math.columbia.edu/tag/04VH) | Equivalence relation, composition, associativity; short anchor: “The relation on pairs defined above is an equivalence relation.” |
| Stacks, same access date | [Lemma 4.27.16, 04VK](https://stacks.math.columbia.edu/tag/04VK) | Right-system localisation and its universal property; anchor: “a right multiplicative system” |
| Stacks, same access date | [Lemma 4.27.14, 04VJ](https://stacks.math.columbia.edu/tag/04VJ) | Equality with a common denominator is detected after source refinement; anchor: “The following are equivalent” |
| Stacks, same access date | [§13.6, Lemma 13.6.6 and Definition 13.6.7, 05RA](https://stacks.math.columbia.edu/tag/05RA) | Cone system and Verdier quotient definition match; anchor: “compatible with the triangulated structure” |
| Stacks, same access date | [Lemma 13.6.8(2), 05RJ](https://stacks.math.columbia.edu/tag/05RJ) | Exact functor killing the subcategory factors exactly; anchor: “an exact functor too” |
| Balmer–Schlichting, Journal of Algebra 236 (2001) | [Theorem 1.5, printed p. 821](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/balmschl.pdf), including the preceding definitions | The contextual locator agrees: completion admits a triangulation making the inclusion exact. Anchor: “Let K be a triangulated category.” The dossier does not use this theorem |

The Balmer–Schlichting theorem was read through extracted PDF text;
the requested browser screenshot failed. No claim about visual inspection
of that page or verification of the theorem's full proof is made.
The theorem's readable statement is enough for this contextual locator
check; the cone lemma above is checked directly.

Local source SHA-256:

- Section 03: `0a79346e7f7d6584c12afb45c48efd1d1c1dc8467867e8d7cd687e6a1d4dcc48`.
- Section 04: `4e8d713c6728c3a4120896dde1c8660a12b22153538d7860043352d50b270f60`.
- Section 05: `8efe5824ab2dd08526594ff50fecc3be0683360ecc25d62f4dfc3ec9e20401f8`.

Not opened under the fresh-context restriction: Remark O.3' in the
notes, the dossier's earlier review/computation records, its other
audit file, and the outline. Their historical or provenance claims
are not verified here. In particular, the dossier's assertion that an
earlier script was run is not evidence used by this audit. No group
construction, ordinary-bimodule simulation proof, finitistic-dimension
conclusion, Lean formalisation, or full-preprint verification is claimed.

Only `audit/V-B-codex.md` was written by this verifier team.
