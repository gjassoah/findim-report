Model: unknown; effort: unknown.

# W4-06: section 6 verification

Date: 2026-10-08. Completed; findings and coverage were recorded incrementally.
This is an adversarial AI review of the drafted research-report section, not author certification.
The draft, its dossier, its macro definitions and the binding notation are read-only.
Only this file is modified. The excluded ledgers, logs, escalation answers, Codex outputs
and other audit reports have not been opened. The pre-existing change to
`audit/V-A-codex.md` is outside this review and has not been inspected.

Source snapshots (SHA-256):

| Input | SHA-256 |
| --- | --- |
| `report/sections/06-realisation.tex` | `df7eec41638b611c6855a2252b79dd4e250c702b4b387b3149326ca52fdcdbd2` |
| `report/notes/proofs/D-B-realisation.md` | `fdf7eb4f129e033c8af3b5453a254d22ded8310b306ad0f2df7179634ac84516` |
| `audit/report-notation.md` | `f69ee451cfbff429f46196434626154173f6ed52cc4657c8c8976e20fd6db8d5` |
| `report/main.tex` | `2014bb0ae531e3fd87846b3b5eac5dfae1f74db03dd520239934612deda1ab72` |

Line numbers below refer to the section source. Mathematical audit conclusions and
proposed repairs have status **AI-proved** where a complete argument is given or checked
below; this is not a promotion to human-checked status. Citation facts are marked
**cited**. An unsupported draft assertion receives no promoted mathematical status.

## Findings

### F1. `rem:why-three`, lines 379–388 — error found

The threshold asserted at lines 381–382 is stronger than the actual obstruction
calculation and is not a necessary requirement. If `d = gldim B`, the displayed
obstruction vanishes from the dimension bound when `c+1>d`, equivalently `c>=d`
for integral finite `d`; it need not have `c>=d+1`. For the uniform bound `d<=2`,
the smallest positive odd value satisfying `c+1>2` is still 3. Moreover, the
proposition constructs the cases 1 and 3, not all odd shifts using the same two
cones. The repair restricts the statement to the construction actually supplied.

```diff
--- a/report/sections/06-realisation.tex
+++ b/report/sections/06-realisation.tex
@@ -379,8 +379,8 @@
-  The shift $3$ is the smallest one meeting two requirements. The shift must
-  be odd: the two cones of \Cref{prop:odd-double} produce $U\oplus U[c]$ for
-  odd $c$, with $c=1$ from one cone and $c=3$ from two. It must also exceed the
-  global dimension of $B$ by at least one: in the proof of
+  The shift $3$ is the smallest positive odd integer $c$ with $c+1>2$.
+  The cones of \Cref{prop:odd-double} produce $U\oplus U[1]$ and
+  $U\oplus U[3]$. The relevant vanishing condition is
+  $c+1>\operatorname{gldim}B$: in the proof of
   \Cref{thm:realisation} the two cohomology modules of
   $P\Lotimes[B]M(Y)$ sit in degrees $0$ and $-c$, and the extension class
   between them lies in $\operatorname{Ext}^{c+1}_B$, which vanishes for
   $c+1>2$. For $c=1$ the argument would need the vanishing of an
```

This is a defect in the explanatory remark, not in the degree-4 obstruction used
by `thm:realisation`.

### F2. Opening, lines 33–34; `rem:uncontrolled-length`, line 563 — error found

Step (2) already chooses a splitting morphism in the cone-splitting argument,
then transports an action through the resulting isomorphism. This is an
existential choice in the argument as written, just as lines 563–565 and dossier
lines 581–588 acknowledge. It is therefore inaccurate to place all non-explicit
choices in step (3), or to locate the splitting morphisms inside the proof of
`prop:lifting` itself. This concerns the supplied construction, not the existence
or impossibility of an algorithm.

```diff
--- a/report/sections/06-realisation.tex
+++ b/report/sections/06-realisation.tex
@@ -33,2 +33,2 @@
-Step~(3) is the only step at which the argument is not explicit; see
+The non-explicit choices already enter in step~(2) and continue in step~(3); see
 \Cref{rem:uncontrolled-length}.
@@ -563,2 +563,2 @@
-  The proof of \Cref{prop:lifting} is existential at four points: the
+  The construction uses existential choices at the following points: the
   splitting morphisms in the proof of \Cref{lemma:cone-splitting}, the roofs
```

The remaining length assertions in lines 567–579 have no error found: supplied
complexes supported in `[a,b]` give `P` supported in `[a-2,b]`; the text does not
infer noncomputability from noncanonicity. The matrix splitting of `Psi_R` must
also be supplied if one wants an effective procedure from generalized data.

### F3. Grothendieck-group interpretation, lines 372–375 — error found / unsupported transfer

The class `[V]=0` is in `K_0(Q)`. It does not by itself imply a zero class for
a lift in `K_0(K)`, or for every object or every iterate of a later tensor
functor. The class of a lift can lie in the kernel of the quotient map on `K_0`.
What this section does supply is, for `Fcal=P tensor_B^L -`,

`[Fcal^j M(Y)] = (sum_{r=0}^j binom(j,r)(-1)^(3r))[M(H^jY)] = 0` for `j>=1`,

by `coro:realisation-iterates`. This is a calculation in the derived category
of left `B`-modules, not a descent of the equality in `K_0(Q)`.

The literal statement about the simulation's iterates also includes an incorrect
first-iterate claim. In the permitted preprint source
`build/sections/05-ordinary-simulation.tex:37–57,78–91,115–146`, write
`Phi=X tensor_D^L -`. Its first iterate on the module `M(Y)` in the first factor
is the ordinary module `O tensor_B M(Y)` because `O_B` is projective. Whenever
`HY != 0`, its second iterate is
`M(HY)[b_*] direct-sum M(HY)[b_*+3] != 0`, so its first iterate is a nonzero
finite-dimensional module. Its Grothendieck class cannot be zero: total vector
space dimension induces a homomorphism on the module Grothendieck group (and
Euler dimension on the bounded derived Grothendieck group). The second iterate
does have class zero; exactness of `Phi` then gives zero for every later iterate.
No claim about arbitrary input objects follows.

```diff
--- a/report/sections/06-realisation.tex
+++ b/report/sections/06-realisation.tex
@@ -372,4 +372,6 @@
-$p=0$ or $p=\id$ it is. In the application, the vanishing of $[V]$ is the
-reason why the iterates of the functor constructed in \Cref{sec:simulation}
-have class zero in the Grothendieck group, as they must by
-\Cref{rem:k0-invisibility}.
+$p=0$ or $p=\id$ it is. By \Cref{coro:realisation-iterates}, the positive
+iterates of $P\Lotimes[B]-$ on $M(Y)$ also have class zero, by cancellation
+of the odd shifts. The two-step comparison in \Cref{sec:simulation} transfers
+this cancellation to the second iterate of its functor on the inflated
+module $M(Y)$; exactness then gives class zero for every subsequent iterate.
+This is consistent with \Cref{rem:k0-invisibility}.
```

The future sections must justify the two-step transfer and the properly scoped
invisibility statement; their required content is recorded below.

### F4. `lemma:selection-matrix` proof, lines 424–425 — error found in the functor-valued wording

The chosen split maps are right `R`-linear, not bimodule maps. Consequently the
direct-summand assertion holds for the underlying vector-space functors, not
in general for functors taking values in left `R`-modules. With the usual left
action on `R^n`, a direct-summand claim in that latter category is false.
For example, take `R=k[t]`, `Psi={}_alpha R`, `alpha(t)=t+1`, and `n=1`.
For `Y=R/(t)`, the module `HY` has `t` acting as 1, whereas `R tensor_R Y`
has `t` acting as 0, so `HY` is not a summand of the latter. This example tests
the claimed inference from right projectivity; it does not impose any additional
selection condition on a not-yet-written definition. Exactness itself follows
because it is detected on underlying vector spaces.

```diff
--- a/report/sections/06-realisation.tex
+++ b/report/sections/06-realisation.tex
@@ -424,2 +424,4 @@
-  action of $r$ to $\rho(r)_Y$. The functor $H$ is a direct summand of the
-  exact functor $R^n\otimes_R-$, hence exact.
+  action of $r$ to $\rho(r)_Y$. After forgetting the left $R$-action, the
+  functor $H$ is a direct summand of the exact vector-space-valued functor
+  $R^n\otimes_R-$. Since exactness of left $R$-modules is detected on
+  underlying vector spaces, $H$ is exact.
```

### F5. Abstract size hypotheses, lines 48 and 339–347 — gap unless a universe convention is supplied

The dossier assumes essential smallness for the fraction construction (line 68)
and for the odd-double proposition with its `K_0` assertion (line 366). The
draft drops both hypotheses. No corresponding size convention appears in the
permitted main file or notation file. The fraction citation uses categories with
sets of objects and morphisms; the cited [Stacks section 4.27](https://stacks.math.columbia.edu/tag/04VB)
also explains that convention in its response to the local-smallness question.
For an unrestricted large category the roof construction need not supply Hom
sets, and the free abelian group on isomorphism classes used for `K_0` need not
be a set-sized group. This is a scope gap, not a problem with the concrete
category `K^b(proj B^op)` or its quotient. Both are essentially small.

```diff
--- a/report/sections/06-realisation.tex
+++ b/report/sections/06-realisation.tex
@@ -48,2 +48,3 @@
-Let $\mathcal{K}$ be a triangulated category and $\mathcal{S}$ a full
+Let $\mathcal{K}$ be an essentially small triangulated category and
+$\mathcal{S}$ a full
 triangulated subcategory. Let $\mathcal{W}$ be the class of morphisms $u$ of
@@ -339,1 +340,2 @@
-  Let $\mathcal{T}$ be a triangulated category, $E$ an object of $\mathcal{T}$
+  Let $\mathcal{T}$ be an essentially small triangulated category,
+  $E$ an object of $\mathcal{T}$
```

Equivalently supply a consistent ambient-universe convention before these
statements. The cone-splitting lemma alone does not need essential smallness.

### F6. Encoding interpretation, lines 146–149 — unsupported stronger reading

The sentence that the multiplication of `R` is "recovered" in the quotient
needs qualification. `prop:quotient-action` and dossier section 6.2 construct an
algebra homomorphism `theta`; neither asserts or checks that it is injective or
that it identifies `R` with the entire endomorphism algebra. If "recovered"
only means that multiplication is represented by composition, that weaker
content has no error found. Faithful recovery is an unsupported additional
claim in the permitted material, not a claim refuted by this audit. The minimal
wording below states exactly the supported content.

```diff
--- a/report/sections/06-realisation.tex
+++ b/report/sections/06-realisation.tex
@@ -148,1 +148,1 @@
-is recovered in the quotient category of \Cref{subsec:action}, in which $s$ and
+is represented by composition in \Cref{subsec:action}, where $s$ and
```

## Coverage and verdicts

Each row covers the statement and its entire proof, unless a narrower block is
specified. All numbered environments and displays, and all mathematical
unnumbered paragraphs, are included. The forward references are assessed as
obligations, not treated as currently available proofs.

| Lines | Statement / block | Verdict |
| --- | --- | --- |
| 4–34 | Opening realisation claim and four-step description | Error found in the exclusive explicitness claim, F2; no error found in the stated mathematical output and roadmap |
| 36–43 | Field, centrality and module conventions | No error found |
| 48–64 | Right-fraction setup and citations | Gap in abstract size convention, F5; no error found in the cited fraction calculus |
| 66–102 | `lemma:fractions`, both parts and proofs | No error found, with F5's size convention |
| 107–113 | Quadraticisation | No error found, including constant/linear terms and finitely many auxiliary generators |
| 115–144 | `cons:encoding-algebra` | No error found |
| 146–149 | What the encoding remembers | Unsupported stronger recovery claim; weak composition reading has no error found, F6 |
| 151–177 | `lemma:directed-gldim` | No error found, including arbitrary modules, `n=1`, and the opposite-algebra argument |
| 179–209 | `prop:encoding-algebra` | No error found in dimension, global dimension, exactness or full faithfulness |
| 214–242 | Quotient setup, right-module arrows and evaluation | No error found |
| 244–278 | `prop:quotient-action` | No error found, including units, constants, multiplication order and exact factorisation |
| 280–282 | No derived-category identification claimed | No error found |
| 287–295 | Additive idempotent completion and shift | No error found |
| 297–335 | `lemma:cone-splitting` | No error found |
| 337–366 | `prop:odd-double` | Gap in size hypothesis for `K_0`, F5; no error found in either cone or class calculation |
| 368–375 | Representatives, degenerate idempotents and later `K_0` interpretation | No error found through the `p=0,id` observation; error found / unsupported transfer in the simulation sentence, F3 |
| 377–389 | `rem:why-three` | Error found in threshold and scope, F1 |
| 391–396 | Recalled right-projectivity and matrix convention | No error found, subject to the stated obligation for `def:selection-data` |
| 398–426 | `lemma:selection-matrix` | Statement and matrix proof: no error found; exactness justification needs the forgetful qualification, F4 |
| 428–451 | Matrix action on the formal summand and transport to `V` | No error found |
| 453–462 | `cons:diagram-V` | No error found |
| 464–469 | Diagram relations and complex-induced diagrams | No error found |
| 471–493 | `lemma:evaluate-V` | No error found |
| 498–550 | `prop:lifting`, including `eq:lifting` | No error found; taking all initial representatives to be `V` is legitimate |
| 552–559 | Data fixed independently of `Y` and evaluation of lifted arrows | No error found |
| 561–580 | `rem:uncontrolled-length` | Error found in attribution of the earlier splitting choices to the lifting proof, F2; no error found in the support bound or limitation on effectiveness |
| 585–602 | General rectification setup and `prop:rectification` statement | No error found |
| 604–658 | Rectification maps, `eq:rectification-maps`, `eq:eta-homotopy`, total differential and termwise properties | No error found |
| 660–707 | Vertex comparison, filtration and homotopy inverse | No error found |
| 709–717 | Arrow homotopies | No error found |
| 719–723 | Absence of further coherence requirements | No error found for the stated three-vertex shape |
| 728–787 | `thm:realisation`, `eq:realisation`, cohomology and truncation splitting | No error found, subject to the forward definition containing the specified hypotheses |
| 789–813 | `coro:realisation-iterates` | No error found, including `j=0`, endpoint binomial coefficients and the equivalence of vanishing |
| 815–826 | `rem:realisation-special-case` | No error found; the preprint citation and generalisation were checked |

## Checks of the reorganised arguments

These are the substantive checks behind the coverage table, with status
**AI-proved**; they do not rely on the dossier's earlier status assessments.

**Fractions and the weaker subcategory hypothesis.** The draft legitimately
replaces the dossier's thick-subcategory hypothesis by a full triangulated
subcategory: the cited result supplies both Ore conditions without thickness.
For the common denominator, the square is `u_1 g = u_2 t = u`, with `t` and
`u_2` in `W`, so `u` is in `W` and
`q(g)=q(u_1)^(-1)q(u)`. This yields both displayed roof equalities; it does not
require inferring `g in W` from invertibility in the quotient. The direct-sum
map in the zero-killing proof is valid because the quotient is additive. The
same-denominator criterion with identity denominator supplies `v in W`.
The empty families cause no exception.

**Encoding and matrix orientation.** Left multiplication by an arrow in
`e_j B e_i` maps the right module `e_i B` to `e_j B`, with composition in the
stated order. Thus `(s's)^(-1)a'_h a_l` evaluates as `x_h x_l`, not `x_l x_h`.
Right-linear maps of the free column module are matrices acting from the left;
there is no opposite-algebra correction in either `theta_n` or `rho`. The
right-projective splitting supplies a finite matrix idempotent even for
`Psi=0` (take `n=1`, `epsilon=0`). The corner unit is `epsilon`, not `1_n`.
Finite-dimensionality of `HY` and its iterates follows from the image in `Y^n`.
Exactness is tested after forgetting the left action, as corrected in F4.

**Cone splitting and the odd double.** Taking the image of the idempotent on
`Hom(Z_0,-)` preserves exactness. The components of `j` on `I` and of `v` into
`I[1]` vanish. The resulting short exact representable sequence splits by
lifting the identity of `X_1'[1]`; applying `v'` and then injectivity of `j'`
checks the inverse assertion. This uses no triangulation on the completion.
For the second cone the common identity summand is `U[1]`, the source
complement is `U[2]` and the target complement is `U`, giving `U direct-sum U[3]`.
Both defining triangles lie in the original category, so the computation of
`[V]=2[C]=0` takes place there, without an injectivity assumption on a map
between Grothendieck groups.

**Lifting and the order of choices.** The quotient has the same objects as
the homotopy category, so the chosen representative `V` can be used at all
three initial vertices. First clear the `1 -> 2` arrows; then clear
`phi_1^(-1)t_a` for `0 -> 1`; finally kill every basis-relation error by a
single denominator at vertex 0. No incoming arrow at that vertex is disturbed.
Equality in the homotopy category means that arbitrary chosen chain
representatives admit the required degree `-1` homotopies. All of these choices,
including the matrix splitting, cone splittings, transported action and
rectification, precede the choice of `Y`. Only evaluation and the final derived
splitting depend on `Y`. Natural choices of the final splitting are not claimed
and are not needed for the iterate formula.

**Rectification.** The internal degrees of the off-diagonal maps are
`0,0,-1`, and their total degrees after the column shifts are all 1.
The uncancelled component of `partial_1 partial_2` is `-1 tensor f_rho`, whereas
`d_0 eta + eta d_2 = 1 tensor (d h_rho + h_rho d)`, so the remaining entry of
`d_P^2` vanishes. The diagonal signs are `+,-,+`, including in characteristic 2.
The decreasing filtration by the second-factor source index is preserved:
path terms fix that index, `f_a` raises it, and `eta` raises 0 to 2. Its
nonzero quotient layers are exactly the two adjacent-arrow complexes and the
length-two path/relations complex. The latter's left map is injective because
`Rcal` is a basis, not merely a generating list. On horizontal degree `m`,
the mixed terms in the tensor contraction have coefficients `(-1)^m` and
`(-1)^(m-1)`, hence cancel. Bounded acyclic right-projective quotients are
contractible. With the notation at lines 701–706,
`d r = r d_P` and `(d_P K + K d_P)(x,c)=(t sigma c,c)=(1-iota_i r)(x,c)`.
Finally the arrow homotopy's column-one term cancels `H_a d`, leaving precisely
`a iota_i - iota_j f_a`. No further differential-square equation remains.
Empty arrow or relation sets do not invalidate this argument.

**Realisation, truncation and iteration.** Vertexwise homotopy equivalences
alone would not identify derived `B`-modules; the proof correctly first uses
the arrow homotopies to identify their *cohomology modules*. These are `M(HY)`
in degrees 0 and -3, with the full left action. In the good truncation, degree
-3 is quotient by boundaries and degree 0 is the cycles; inclusion of the
bottom cycle module gives `N_{-3}[3]`. Its quotient has only `H^0=N_0` and
maps quasi-isomorphically to `N_0`. The connecting map consequently has target
`N_{-3}[4]`; a projective resolution in degrees -2 through 0 makes its Hom group
zero. Lifting `id_{N_0}` splits the triangle. This is an objectwise derived
isomorphism and does not require a chain-level functorial splitting.
For iteration, `H^jY` remains finite-dimensional, and tensor with `P` preserves
finite sums and shifts. Pascal's identity gives the multiplicities, with
out-of-range coefficients zero; the `r=0` cohomology detects `M(H^jY)` and
full faithfulness (or the vertex-0 space alone) detects `H^jY`. The proof
includes `j=0` and zero objects. No extra left projectivity of `Psi` enters.

## Citation record

The following live Stacks statements, their hypotheses and relevant surrounding
fraction definitions were read on 2026-10-08 by the primary verifier as well as
the citation reviewer. Status: **cited**. Every mathematical use matches its
source, subject to F5's size qualification. Tag 04VB is a section tag; the
additional locator "Lemma 4.27.19" correctly identifies the result within it.

| Lines | Citation and short verbatim anchor | Application checked |
| --- | --- | --- |
| 51–52 | [05RG, Lemma 13.6.6](https://stacks.math.columbia.edu/tag/05RG): "Then $S$ is a multiplicative system" | Cone class for a full triangulated subcategory; saturation is not required |
| 54–56 | [05RI, Definition 13.6.7](https://stacks.math.columbia.edu/tag/05RI): "We define the quotient category" | Quotient is the localization at that cone class |
| 56–59 | [04VB, Lemma 4.27.19](https://stacks.math.columbia.edu/tag/04VB): "are canonically isomorphic" | Identification of left and right fraction categories |
| 59–64 | [04VH, Lemma 4.27.11](https://stacks.math.columbia.edu/tag/04VH): "The relation on pairs defined above is an equivalence relation." | Right roofs, composition and identity; the preceding definition was also read in 04VB |
| 62–64 | [04VK, Lemma 4.27.16](https://stacks.math.columbia.edu/tag/04VK): "the morphism $Q(s)$ is an isomorphism" | Denominator inversion and the localization functor |
| 85–94 | [04VC, Definition 4.27.1](https://stacks.math.columbia.edu/tag/04VC): "with $s\in S$" | Right Ore square with the denominator on the required leg |
| 99–101 | [04VJ, Lemma 4.27.14](https://stacks.math.columbia.edu/tag/04VJ): "there exists a morphism $t : X''\to X'$ in $S$" | Equality of roofs with the same denominator implies annihilation after precomposition |
| 274–275 | [05RJ, Lemma 13.6.8(2)](https://stacks.math.columbia.edu/tag/05RJ): "$F'$ is an exact functor too." | Exact evaluation functor factors through the quotient once it kills the subcategory |

For the citation at lines 817–825, the supplied main preprint, September 23,
2026, was read in `build/sections/03-localization-and-lifting.tex:4–13,252–284`
and `build/sections/04-tensor-realization.tex:8–23`. It states the central
idempotent and endomorphism setup, the corner action `e alpha(r)e`, and the
single complex for all `Y`. The identification with `{}_alpha(eR)` follows by
tensoring `eR` with `Y`; centrality gives
`(e alpha(r)e)(e alpha(t)e)=e alpha(rt)e`. The proof in the draft and dossier
requires only the unital, scalar-linear corner homomorphism in the general
case, as the remark says. No citation beyond those listed occurs in the section.

## Obligations for the four unwritten references

| Forward reference | Required content for this section to be usable |
| --- | --- |
| `def:selection-data` (lines 6, 391–393; theorem 730) | Define a unital `k`-algebra `R` and a unital, `k`-central `R`-bimodule `Psi` with `Psi_R` finitely generated projective; set `H=Psi tensor_R -` on finite-dimensional left modules. Do not replace right projectivity by left projectivity. Finite presentation of `R` is explicitly added here where needed; `R` may be infinite-dimensional. Any mortality or witness condition used elsewhere is additional and unused in this realisation proof. |
| `rem:k0-invisibility` (line 375) | State the precise finite-rank Grothendieck-group obstruction, with the exact tensor functor, initial objects and iteration threshold specified. Eventual vanishing does not force the first iterate to have class zero. For example, on a free group of rank `s`, an endomorphism `f` and a class killed by some power satisfy `f^s(v)=0`: kernels stabilize over `Q`, and the integral group is torsion-free. This can explain why arbitrarily long survival of objects is invisible to classes after a uniform number of steps; it does not supply the unqualified assertion deleted in F3. |
| `sec:simulation` (lines 373 and 577) | Define an ordinary-bimodule derived tensor endofunctor on a finite-dimensional algebra of finite global dimension, the embedding of the `B`-module category as the relevant factor, and a fixed interval `[a_*,b_*]` supporting `P`, with `l=b_*-a_*`. Supply the two-step comparison on that factor, `Phi^2(Z) ~= (P tensor_B^L Z)[b_*]`, with its signs and support understood. This transfers the realisation cancellation to `Phi^2 M(Y)` and, by exactness, all orders at least 2. It must not assert a zero class for `Phi M(Y)` in general or infer class vanishing merely from `[V]=0` in `K_0(Q)`. If lifting complexes are supported in `[a,b]`, one may use `[a-2,b]` for `P` and `l=b-a+2`; this is a bound from supplied representatives, not a numerical bound already provided by this section. |
| `rem:what-is-explicit` (line 579) | Distinguish explicit formulas from supplied finite matrices and homotopies, existential choices of quotient morphisms/refinements, and absence of actual complexes or a numerical support bound for the intended example. It must not infer undecidability or impossibility of an algorithm/bound from those missing data or from noncanonical choices. For generalized `Psi`, an effective input must include its finite right-projective splitting and left action data (or a method supplying them). |

The finite-rank assertion in the second row has status **AI-proved** as the
given kernel argument. The requirements for the unwritten sections are not
claims that those sections have already discharged them. F3 must still be
repaired: the permitted simulation cannot satisfy its unrestricted wording.

## Scope of completion

The mathematical section and dossier were read in full. Three parallel reviewers
checked the fractions/citations, cone-and-lifting arguments, and rectification;
their reports were treated as leads and the primary verifier checked the
calculations and consulted the cited sources. No independence of model identity
is asserted. The concrete proof of `thm:realisation` and its iterate corollary
has **no error found**; the findings concern the explanatory claims, the
functor-valued exactness sentence and abstract size scope. F6 is explicitly a
qualification of wording, not a demonstrated failure of the algebra map.

This job modified no manuscript, dossier, input preprint or other file. No compilation,
Lean proof or executable mathematical test was performed, and no earlier
computational output was used as evidence. Source changes are proposed only as
the diffs above.

At the final check the section, dossier and notation hashes still matched the
snapshots above. Concurrent work changed `report/main.tex` to SHA-256
`62359fd8e7bea0cc382b4ea477f91551e032d6f9dd65929904a0b4076cd0be31` by adding
an input of section 05. The permitted main file was reread; its macro interfaces
and theorem declarations were unchanged. That new section and the concurrently
appearing audit reports were not opened. All eight proposed diff hunks were
checked for line counts and exact matching against the unchanged section source.
