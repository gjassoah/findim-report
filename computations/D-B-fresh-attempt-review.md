Model: unknown; effort: unknown.

# D-B independent attempt and adversarial review

Date: 2026-10-08. Scope: report §2.3, §6.1 and §6.2, followed by review of the
completed D-B dossier. This is an AI-authored research note; no human
certification is claimed.

## Chronology and independence

The parent supplied statements (a)–(c), the arrow conventions and the intended
evaluation construction, but no proofs. Before writing §§A–C below, this agent
read the repository instructions, global research/writing/review instructions,
the D-B task, the notation table and report outline. It did not read the
preprint, the existing dossier, or the other agents' mathematical notes. The
README gives a broad description of the construction but no proof of the
statements considered here. A memory-registry search returned no relevant hit.

The parent's earlier exposure to inline source proofs is not undone by this
attempt. The narrower independent contribution recorded here is the argument
in §§A–C. Source comparison and dossier review will be appended afterwards.

## A. Quadratic presentation

**Statement; status: AI-proved by the argument below.** A finitely presented
unital algebra over a field admits a finite presentation whose relations have
degree at most two. Constants and linear terms are permitted.

Write the algebra as the quotient of the free unital algebra on a finite set
of letters by finitely many polynomials. Let \(\mathcal P\) be the finite set
of all prefixes of length at least two of the non-empty words that occur in
these polynomials. For each \(w\in\mathcal P\), introduce a letter \(t_w\).
For a prefix \(w=vx\), impose
\[
t_w-t_vx=0 \quad(|v|\ge2),\qquad
t_{yx}-yx=0\quad(|v|=1).
\]
Replace each word of length at least two in the original polynomials by its
letter \(t_w\). The substituted original relations have degree at most one;
the auxiliary relations have degree at most two.

There is a homomorphism from the new quotient to the original algebra sending
each original letter to itself and \(t_w\) to the word \(w\). Induction on
word length in the auxiliary relations gives \(t_w=w\) in the new quotient.
Consequently, the original relations hold there, and the map from the original
algebra sending its letters to their new classes is defined. The two maps are
inverse on original letters and on every \(t_w\), so they are inverse algebra
homomorphisms. Finiteness follows from finiteness of the original list of
words. No generators are needed when there are no words of length at least
two. A non-zero constant relation also causes no exception if the zero unital
algebra is allowed; otherwise that case is excluded by the input hypothesis.

## B. Fractions and source refinements

**Statement; status: AI-proved by the argument below, using the ordinary
localisation construction by roofs.** Let \(\mathcal K\) be a triangulated
category, let \(\mathcal S\) be a thick subcategory, and put
\[
\mathcal W=\{s\mid\operatorname{Cone}(s)\in\mathcal S\}.
\]
Assume the localisation is taken in a universe in which its Hom collections
are sets, for example that \(\mathcal K\) is essentially small. Composition
is right to left. A roof for a morphism from \(X\) to \(Y\) is
\(X\xleftarrow{s}X'\xrightarrow{f}Y\), with \(s\in\mathcal W\).

The octahedral axiom gives a triangle
\[
\operatorname{Cone}(s)\longrightarrow\operatorname{Cone}(ts)
\longrightarrow\operatorname{Cone}(t)\longrightarrow
\operatorname{Cone}(s)[1].
\]
Thus, two of \(s,t,ts\) lying in \(\mathcal W\) imply that the third does.
Identities belong to \(\mathcal W\).

For the source-refining Ore square, let \(f:X\to Y\) and
\(s:Y'\to Y\) with \(s\in\mathcal W\). Complete \(s\) to a triangle
\(Y'\xrightarrow{s}Y\xrightarrow{c}C\to Y'[1]\), and complete \(cf\)
to a triangle
\[
X'\xrightarrow{t}X\xrightarrow{cf}C\longrightarrow X'[1].
\]
The cone of \(t\) is \(C\), so \(t\in\mathcal W\). Exactness of
\(\operatorname{Hom}(X',-)\) gives \(f':X'\to Y'\) with
\(sf'=ft\), since \(cft=0\). This constructs the required square.

For cancellation, let \(f,g:X\to Y\) and \(s:Y\to Y'\) lie in the
indicated Hom sets, with \(s\in\mathcal W\) and \(sf=sg\). In the
rotated cone triangle \(C[-1]\xrightarrow{j}Y\xrightarrow{s}Y'\to C\),
exactness gives \(h:X\to C[-1]\) with \(f-g=jh\). Complete \(h\) to
\(X'\xrightarrow{t}X\xrightarrow{h}C[-1]\to X'[1]\). Then
\(t\in\mathcal W\) and \(ft=gt\).

In the roof construction, two roofs are identified precisely when they admit
a common source refinement with equal numerator and denominator. The Ore and
cancellation properties give this description: Ore supplies a comparison of
two denominators, and cancellation supplies a further refinement when the
comparison equalities hold only after a denominator. The two-out-of-three
property above makes both refinement legs denominators whenever the
composite denominator is one. In particular, the roofs \((1_X,f)\) and
\((1_X,0)\) agree precisely when \(ft=0\) for some
\(t:X'\to X\) in \(\mathcal W\).

For finitely many denominators \(s_i:X_i\to X\), apply the Ore square to
\(s_1\) and \(s_2\). It yields maps \(u:Z\to X_1\) in \(\mathcal W\)
and \(v:Z\to X_2\) with \(s_1u=s_2v\). The common composite is in
\(\mathcal W\), and two-out-of-three also gives \(v\in\mathcal W\).
Induction gives a common denominator for every finite family of roofs with
source \(X\), even if their targets differ. If finitely many actual maps
\(f_i:X\to Y_i\) become zero in the quotient, apply the preceding zero
criterion to each and take a common refinement of their annihilating
denominators. Every \(f_i\) then vanishes after the same source refinement.
For the empty family, use the identity denominator.

## C. Encoding and evaluation

**Statement; status: AI-proved by the argument below.** Let
\(R=k\langle x_1,\ldots,x_d\rangle/(p_1,\ldots,p_r)\), where every
\(p_j\) has degree at most two. Let \(B\) be the quotient of the path
algebra on vertices \(0,1,2\), arrows \(s,a_h:0\to1\) and
\(s',a'_h:1\to2\), by
\[
a'_h s-s'a_h,
\qquad
\widetilde p_j,
\]
where homogenisation sends \(x_hx_l\) to \(a'_h a_l\), \(x_h\) to
\(s'a_h\), and \(1\) to \(s's\). All these relations are homogeneous
linear combinations of paths of length two, including those originating
from constant and linear terms of the \(p_j\).

Put \(E_i=e_iB\), a right projective, and use
\(\mathcal K=K^b(\operatorname{proj}B)\) for right projectives here. An
arrow \(a:i\to j\) is in \(e_jBe_i\), and left multiplication by it is
the right-module map \(E_i\to E_j\). Let \(\mathcal S\) be the thick
subcategory generated by the two arrow cones of \(s\) and \(s'\), and let
\(\mathcal Q=\mathcal K/\mathcal S\). Suppress the quotient functor from
the notation for arrows in the next calculation.

Both \(s\) and \(s'\) are invertible in \(\mathcal Q\). Define
\(b_h=s^{-1}a_h\in\operatorname{End}_{\mathcal Q}(E_0)\). The
commutation relation gives \(a'_h=s'a_hs^{-1}\), so
\[
a'_h a_l=(s's)b_hb_l,\qquad
s'a_h=(s's)b_h,\qquad s's=(s's)1_{E_0}.
\]
Therefore \(\widetilde p_j=(s's)p_j(b_1,\ldots,b_d)=0\); multiplying
by \((s's)^{-1}\) shows \(p_j(b_1,\ldots,b_d)=0\). The free unital
algebra map factors to
\[
\theta:R\longrightarrow\operatorname{End}_{\mathcal Q}(E_0),
\qquad x_h\longmapsto b_h.
\]
The order of the factors is the displayed order, with no opposite algebra.

For a finite-dimensional left \(R\)-module \(Y\), define a left
\(B\)-module \(M(Y)\) by putting \(Y\) at each vertex, using identity
maps for \(s,s'\), and using the action of \(x_h\) for both \(a_h,a'_h\).
The commutation relations evaluate to the difference of the same operator.
The homogenised relations evaluate to \(p_j\) acting on \(Y\), which is
zero. A map of left \(R\)-modules gives the same map at all vertices, so
this construction is functorial and exact.

The complex tensor functor
\[
T\longmapsto T\otimes_B M(Y)
\]
from \(\mathcal K\) to \(K^b(\operatorname{fd}k)\) is exact: it
preserves shifts and the displayed mapping-cone construction term by term.
Its values on the two generating cones are the cones of \(1_Y\), hence
zero. Its kernel is thick, since exact additive functors preserve shifts,
triangles and retracts. It therefore kills \(\mathcal S\), sends every
map in \(\mathcal W\) to an isomorphism, and factors through the quotient.
This factorisation can be written on a roof as
\[
(s,f)\longmapsto(f\otimes1)(s\otimes1)^{-1}.
\]
Under \(E_i\otimes_BM(Y)\cong e_iM(Y)=Y\), an arrow map is the
specified arrow action. Thus, evaluation of \(s^{-1}a_h\) is
\(1_Y^{-1}x_h=x_h\), and evaluation of \(\theta(r)\) is the given
action of \(r\) on \(Y\), for every \(r\in R\). The same construction
lands in \(D^b(\operatorname{fd}k)\), since bounded acyclic complexes of
vector spaces are contractible.

The least expanded ingredient above is the general roof-construction theorem
in §B. The explicit Ore and cancellation arguments and both finite-family
consequences have been supplied, but associativity of roof composition is
being used as part of the ordinary localisation construction, rather than
reconstructed here from category axioms.

## D. First source comparison and dossier review

After saving §§A–C, this agent read all of
`build/sections/03-localization-and-lifting.tex` and the then-complete
§§2.3 and 6.1–6.4 of `report/notes/proofs/D-B-realisation.md` (605 lines at
the first inspection). The source is the supplied preprint dated
2026-09-23; it was not modified.

**Verdict for the inspected mathematical content: no error found.** The
independent argument and the source agree on the Ore square, cancellation,
handedness, homogenisation, and order of multiplication in \(\theta\).
The independent quadraticisation introduces also a symbol for each full
word, whereas the source and dossier leave a final quadratic product; both
have inverse maps obtained by eliminating the auxiliary generators.

The following potentially delicate points were checked directly.

- The finite denominator statement concerns a fixed common source and may
  have different targets. Combining maps into a direct sum or inductively
  refining roofs gives the stated conclusion.
- The proof of the directed dimension bound covers arbitrary modules:
  the surjecting module is a possibly infinite direct sum of projectives.
  Its component at the lowest support index maps isomorphically, so each
  kernel raises that index. The bound is \(n-1\), including \(n=1\).
- The relation ideal is exactly its length-two span, because no positive
  path enters vertex zero or leaves vertex two. The dimension formula and
  choice of a relation basis follow.
- Maps of the modules \(M(Y)\) are forced by the two identity arrows to
  have equal vertex components. The remaining arrows impose precisely
  \(R\)-linearity. Thus the added full-faithfulness claim is justified.
- The odd-double proof only needs exact representable sequences restricted
  to retracts; it does not assume an unconstructed triangulation on the
  additive idempotent completion. The second cone has source complement
  \(U[2]\) and target complement \(U\), producing \(U\oplus U[3]\).
- The class of the cone representative is zero already in
  \(K_0(\mathcal Q)\). No inference from a vanishing class in
  \(K_0(\operatorname{Kar}(\mathcal Q))\) is made.
- Lifting starts at the terminal vertex. The last replacement affects only
  vertex zero and outgoing arrows, so it preserves the previously lifted
  arrow squares and annihilates every relation error simultaneously.
- The choices are made before \(Y\); evaluation of the fixed quotient
  diagram therefore applies to every \(Y\) using the same complexes and
  homotopies. The lack of a numerical support bound is correctly stated as
  a limitation of the argument, not as a noncomputability theorem.

The Stacks locators in the dossier were independently opened on 2026-10-08:
[04VH](https://stacks.math.columbia.edu/tag/04VH),
[04VK](https://stacks.math.columbia.edu/tag/04VK),
[04VJ](https://stacks.math.columbia.edu/tag/04VJ),
[05RA](https://stacks.math.columbia.edu/tag/05RA), and
[05RJ](https://stacks.math.columbia.edu/tag/05RJ). Their hypotheses and
conclusions match the uses in §§2.3 and 6.2. In particular, 04VJ is the
same-denominator equality criterion, and 05RJ supplies exactness of the
factored functor. This also supplies a read source for the ordinary
localisation construction left unexpanded in §B above; its formula for
roofs has the same orientation.

One presentational issue was sent to the parent: the initial attempt record
contains damaged mathematical escapes (`operatorname` without its
backslash, a tab before `heta_n`, and `Psi` without a backslash). These
occur outside the final mathematical arguments and are not mathematical
counterexamples. The parent owns the dossier and will decide its repair.

This fresh-context reading by an agent of the same unspecified model does
not by itself assign AI-verified status to the dossier. The result statuses
of §§A–C remain AI-proved, with the explicitly cited general localisation
construction as an input. The reviewed statements of §§2.3 and 6.1–6.4
have complete arguments in the dossier; no independent human check is
recorded here.

## E. Rectification review

After the first comparison, this agent read all of source section 04 and
then the dossier's appended §6.5 (lines 607–822 at that inspection).
**Verdict: no mathematical error or gap found.** The construction was
checked directly, including the following sign and exactness points.

The two middle summands in \(\partial_1\partial_2\) cancel; the path
term vanishes in \(B\), leaving \(-f_\rho\) in the terminal summand.
The displayed homotopy relation then gives
\(d_0\eta+\eta d_2=-\partial_1\partial_2\). The shifts by \(1\)
and \(2\) require the internal signs \(+,-,+\), so the remaining
off-diagonal square is exactly zero with the source's signs.

The source-index filtration is preserved by every differential component:
the terms involving \(f_a\) strictly increase the source index, and
\(\eta\) increases it from zero to two. For the source-zero part of
vertex two, the associated graded horizontal complex is the presentation
of the path space modulo the relation subspace. Its first map is injective
because the indexing list is a basis. This verifies the point at which
using a redundant relation list would invalidate the stated argument.

The dossier's tensor contraction has the required signs: the internal
differential terms in \(d(s\otimes1)+(s\otimes1)d\) have signs
\((-1)^{p-1}\) and \((-1)^p\). The quotient by \(\iota_i(D_i)\)
is degreewise projective because the displayed inclusion splits as graded
right modules. Bounded acyclicity therefore supplies a right-linear
contraction. For the final block differential, a direct substitution gives
\[
d_D(x-tsc)=d_Dx+t d_Csc
=d_Dx+tc-tsd_Cc=r\,d_P(x,c).
\]
The claimed homotopy \(K(x,c)=(0,sc)\) gives
\(d_PK+Kd_P=(tsc,c)=1-\iota_i r\). Thus the explicit inverse
calculation added by the dossier is consistent.

Finally, the arrow homotopy lands in column one and has total degree
\(-1\). Its internal terms cancel because that column has differential
\(-d\), while its column-zero term is precisely
\(a\iota_i-\iota_jf_a\).

The dossier's finite computation was not independently rerun by this agent;
the present review concerns the universal written argument and its match
with the source. A minor display typo (`quad` without its backslash) was
reported to the parent and does not change any coefficient or sign.

## F. Realisation review

The appended dossier §6.6 was read at lines 824–924.
**Verdict: no mathematical error or gap found.** Its vertex cohomology
identifications commute with the arrows by the specified homotopies, so
they determine the asserted left \(B\)-module isomorphisms. The fact that
cohomology occurs in degrees \(-3\) and zero gives the triangle
\[
H^{-3}(T_Y)[3]\longrightarrow T_Y\longrightarrow H^0(T_Y)
\longrightarrow H^{-3}(T_Y)[4].
\]
The added construction by good truncation is valid: after quotienting by
boundaries in degree \(-3\), its kernel there is \(H^{-3}\); quotienting
by that subcomplex leaves only degree-zero cohomology. The degree-four
Hom group vanishes for a module having a projective resolution supported
in degrees \(-2,-1,0\). Lifting the identity of \(H^0\) gives a section,
and the resulting sum map is an isomorphism on both non-zero cohomology
groups. This verifies the splitting as an object of \(D^b(B\text{-mod})\).

The induction for iterates applies the same fixed tensor functor to
objectwise isomorphisms and to finite sums and shifts. It does not require
the splitting to be natural in \(Y\). Every module occurring in the
induction remains finite dimensional. The source's corresponding argument
in section 04, lines 235–303, uses the same valid obstruction degree and
the same finiteness condition.

## G. Generalised selection data and final receipt

The appended §5.3 and the repaired opening record were read after the parent
reported their completion. **Verdict: no substantive mathematical error or
gap found in the extension.** A right-linear endomorphism of a right free
column module acts by left multiplication by a matrix, so the corner is
\(\varepsilon M_n(R)\varepsilon\), with its usual multiplication and
unit \(\varepsilon\). The evaluation formula
\[
\varepsilon R^n\otimes_RY\cong\varepsilon_Y(Y^n)
\]
follows by tensoring the split summand. It respects the left action
\(\rho(r)_Y\); no opposite algebra or centrality assumption is missing.
Exactness of tensor follows from right projectivity, and the image has
dimension at most \(n\dim_kY\), so finite iterates remain in the scope of
the theorem. The agreement of scalar actions is the needed hypothesis
making \(\rho\) a \(k\)-algebra map.

The matrix idempotent gives an object in the additive idempotent completion
with exactly this evaluated action. Its odd double has an actual
representative in \(\mathcal Q\), and the lifting and rectification
statements accept this arbitrary \(B\)-diagram. The extension therefore
requires the stated matrix substitution but introduces no new coherence or
splitting obligation. The special case \(\Psi=0\), represented by the
zero idempotent with \(n=1\), and the original central-idempotent case
both fit the formulas. The pointer to Remark O.3' at
`notes/02-constraints-and-criteria.md:72–77` was inspected only at this
final comparison stage, not before the independent attempt.

The parent repaired the mathematical escapes in the opening record and the
three literal `quad` tokens. These repairs were read and remove the two
presentational findings recorded earlier. The parent also reported rerunning
the exact rectification computation with output matching its saved output;
that is the parent's check, not an additional run by this reviewer.

The complete dossier reviewed has 1072 lines after the opening record was
expanded. SHA-256 of the inspected final dossier:
`f6942dc8cbecd5f9ae18a707acbfd569257668b48eeea0bb9e468e6758db3b1b`.
The read-only source hashes were

- section 03: `0a79346e7f7d6584c12afb45c48efd1d1c1dc8467867e8d7cd687e6a1d4dcc48`;
- section 04: `4e8d713c6728c3a4120896dde1c8660a12b22153538d7860043352d50b270f60`.

The scope is the mathematical arguments of dossier §§2.3, 6.1–6.6 and
5.3, compared with source sections 03 and 04, plus the indicated live
Stacks statements. No substantive gap remains from this review. The
ordinary-bimodule simulation, the group-theoretic selection data, the
finitistic-dimension conclusions, and human certification are outside
this review. No claim of global absence of errors or formal verification
is made.

## H. Narrow final amendment and audit review

After the review in §G, the parent made three additions: §6.4 now chooses
the common support interval with \(a\leq0\leq b\), the dossier has a
final status/scope table, and `audit/D-B-preprint-issues.md` is complete.
Only those amendments and the audit were inspected in this pass; the full
proof review was not repeated. The previous dossier hash in §G remains a
historical record of the earlier inspected version.

**Verdict: no correction required.** With all \(D_i\) supported in
\([a,b]\) and \(a\leq0\leq b\), the three-column complex is supported
in \([a-2,b]\), which also contains zero. The source simulation's input
convention (`build/sections/05-ordinary-simulation.tex:4–11`, read in this
pass) therefore permits \(a_*=a-2\), \(b_*=b\), and
\(l=b-a+2\). The amendment supplies an available interval width; it
does not assert that this width is minimal or that it has been computed
for the main example.

The final status table matches the arguments previously reviewed. The
audit confines its verdict to the checked passages, distinguishes source
claims from additions and clarifications, retains the chronology of the
independent attempts, and states the limits of the computation and citation
checks. Its treatment of the simulation is explicitly restricted to the
input interface, and it claims neither a PDF/source identity comparison nor
a review of the simulation or group proofs. No overclaim or contradiction
with this receipt was found. The input and computation hashes printed in
the audit were also checked against the current files. The exact-factorisation
statement in Stacks 05RJ was reread in full during this pass.

The final inspected dossier has 1107 lines and SHA-256
`3c7203c1f6278e9c4fbbbdaa4768287fdb7636f1de25ea4f4ea5b837d346e305`.
The inspected audit has 142 lines and SHA-256
`08cd572f9cefc2b95900b74f60f28aae8742595f2940a78c96c4c3456d379537`.

## Final root formatting receipt

After the last reviewed snapshot, the root agent wrapped one sentence
in the support-bound paragraph across two lines. Rejoining exactly that
line break reproduces the reviewer snapshot hash recorded in §H;
there is no mathematical or wording change. Final dossier: 1108 lines,
SHA-256 8d8b9311ddd3b0ade83c336549b3004798024549851f9970bacf8e8042fb0f55. The audit hash is unchanged.
