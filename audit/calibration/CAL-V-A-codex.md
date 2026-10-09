Model: unknown; effort: unknown.

# V-A (W2): adversarial verification of the frozen dossier

Date: 2026-10-09. This is an AI check, not human certification.
Only `scratch/V-A-frozen.md` supplies dossier claims and proofs;
`audit/report-notation.md` supplies binding conventions. Preprint sources and
cited literature are checked separately. Other reports and prior verification
files are excluded. `PROGRESS.md` and `docs/WORKING_RULES.md` are absent from
this checkout; the explicit verification task and available standing rules
govern this check. Only this output file is modified.

Frozen input SHA-256:
`707dc9b44cdeb65115b2cf0162e05077d2c43c08a8106ab62ed7a87891a0acb4`.
Conventions SHA-256:
`f69ee451cfbff429f46196434626154173f6ed52cc4657c8c8976e20fd6db8d5`.

## Findings recorded during the check

### E1 — 4.2c, line 285: the stated upper bound is false

Status: **AI-proved** counterexample and repair. The displayed bound omits
the contribution of the bar-length shift. The proof obtains
`pd_Delta(Phi^r N) <= d_L + r d_R`; the exact formula then adds `r`.
The resulting uniform upper bound is
`d_L + (t-1)(d_R+1)`, not `d_L + (t-1)d_R`.

Take `Delta = k e_0 \oplus k e_1`, `X = k x` with `x=e_1 x e_0`, and
`N=S_0`. Both global dimensions of Delta are zero. The ordinary and
derived tensors coincide, `Phi N=S_1` and `Phi^2 N=0`. The trivial
extension is the path algebra of `0 -> 1`. Its exact minimal resolution
`0 -> A e_1 -> A e_0 -> S_0 -> 0`, with the first map sending `e_1`
to `x`, gives `pd_A S_0=1`. Taking `t=2` contradicts the displayed
upper bound zero. Replace only the last expression of (4.2c) by
`d_L+(t-1)(d_R+1)`. Equation (7.2h) already uses this repaired bound.

### E2 — 7.1, line 494: reversed idempotents in the final construction

Status: **AI-proved** convention error. The displayed arrow `c_i:i-1 -> i`
is declared to belong to `epsilon_{i-1} K_l epsilon_i`. Under the binding
right-to-left path convention it belongs to
`epsilon_i K_l epsilon_{i-1}`. The subsequent right-projective bases,
left-multiplication maps, and action from `epsilon_{i-1} O` to
`epsilon_i O` all require the latter membership.

Already for `l=1`, the printed membership gives `c_1 epsilon_0=0`,
whereas the claimed resolution map sends `epsilon_0` to `c_1`.
Repair the displayed membership, retaining the drawn quiver and all
subsequent maps.

## 4.1: bar resolution and K-flat base change

Verdict: **no error found**. Status of the local reasoning checked here:
**AI-proved**. Line references below are to the frozen dossier.

| Lines | Step checked | Result of the check |
|---|---|---|
| 64–75 | Non-positive bimodule resolution and square-zero dg algebra | Projectives over `Delta tensor_k Delta^op` are projective on both sides, since the base is a field. The dg Leibniz identity also holds on two ideal elements because their products and the products of their differentials vanish. |
| 77–119 | Shifted action, internal differential and bar face | The action `a s^r w=(-1)^(r|a|)s^r(aw)` is necessary. The face has degree one after the length shift; it has no extra sign in this convention. The internal/face mixed terms have coefficients `(-1)^r+(-1)^(r-1)`. The face squares to zero by `Q^2=0`. |
| 111–123 | Compatibility with the left dg action | For homogeneous `a`, the face has the degree-one linearity sign because `r|a| = |a|+(r-1)|a|` modulo two. Interior and final faces vanish for the stated reasons. |
| 125–145 | Augmentation and contraction | Splitting the leading factor gives the isolated copy of `E` and pairs `F_r[r] -> F_r[r-1]`. On the pair the face is the identity, internal differentials are opposite, and the reverse identity satisfies `Dh+hD=1`. This is a contraction over Delta; it need not be linear over the dg extension. |
| 147–161 | Projectivity and K-flatness of `F_r` | A projective bimodule tensored with a finite left module is a summand of finite copies of `Delta tensor_k L`, hence left projective. Each total degree has finitely many summands. For the K-flat assertion, the brutal truncations in degrees at least `-s` are indeed subcomplexes for cohomological differentials; their inclusions are degreewise split and their union is the complex. |
| 163–174 | Length filtration | Length at most `r` is preserved because the bar face lowers length. The filtration is split on underlying graded modules. Tensoring with an acyclic right dg module gives acyclic successive quotients, then acyclic finite stages and filtered union. This justifies K-flatness without a convergence assertion about an unbounded spectral sequence. |
| 176–186 | Tensor/shift identification | The factor `(-1)^(r|z|)` is correct for a shift on the second factor. For a balancing element `c`, both representatives acquire parity `r|z|+r|c|`. For a `dz` term both chain-map routes have parity `r|z|+r`; for a differential in the second unshifted factor both have parity `|z|+r|z|+r`. Multiplication to `za` is the usual chain map. |
| 188–201 | Base change from the dg algebra to `A` | The cone of `f` is an acyclic right dg module; K-flatness makes the induced map a quasi-isomorphism. The augmentation to `N` exists because `X` annihilates `N`; its composite is the original augmentation. The graded length splitting makes every term of `L` a sum of induced projectives. Non-positivity bounds length by `-n` in total degree `n`, so `L` is a bounded-above resolution with finite-dimensional terms. |
| 203–214 | Derived decomposition and naturality | Tensoring with Delta kills the remaining face, leaving exactly differential `(-1)^r d` on length `r`. The two-sided projectivity of the chosen resolution models the iterated derived functor. A fixed `Q` and the functorial free bar resolution of `N` provide naturality. |
| 216–239 | Comparison with the preprint's multibar proof | The rescaling parity satisfies `j+eta(i-e_j) = r+eta(i)` modulo two. Empty blocks contribute zero faces, except that the `r=0,i_0=0` augmentation is kept separate. The source computes the derived factors using free resolutions over the field. |

Flatness of the original `X` is not used at any step. Flatness/projectivity
is supplied by `Q`, `E`, and their indicated tensor complexes. In particular,
base-changing the ordinary relative bar construction with unresolved `X`
would not justify the argument, but that is not the construction used here.

## 4.2: exact formula and extinction

Verdict for the statement as a whole: **error found**, E1 above. The exact
formula (4.2), lower bound (4.2a), equivalence (4.2b), and finite-maximum
equality in (4.2c) have **no error found**. Their local reasoning and the
corrected estimate have status **AI-proved**.

| Lines | Step checked | Result of the check |
|---|---|---|
| 248–259 | Projective dimension of complexes | The lower endpoint convention gives `pd(C[s])=pd(C)+s`, including negative projective dimensions of shifted non-zero complexes. The zero object is dealt with separately. |
| 305–338 | Detection by simple targets | In a finite-dimensional algebra, a component non-zero on tops between indecomposable projectives of the same type is invertible. Cancelling these components from the highest degree down stabilises each degree and splits off contractible pairs. The minimal complex has zero Hom differential into a simple module, and every non-zero projective term has a simple quotient of its top. This gives the stated detection formula, also for unbounded projective dimension. |
| 340–345 | Simple modules of `A` | If `XS=S`, the equality `X^2S=0` contradicts `S` being a non-zero simple. Inflation therefore gives exactly all the simples. |
| 347–368 | Adjunction and direct sum | `Delta tensor_A L` is bounded above and Delta-projective. Degreewise Hom adjunction computes derived adjunction. A shift `[r]` changes the target index to `n-r`, as printed. Products of vector spaces are exact; alternatively only `r<=n` contributes for `n>=0`. |
| 370–375 | Exact formula and lower bound | Taking the supremum over the same complete set of simple modules gives the exact formula. Each non-zero iterate has a non-positive projective model, so its projective dimension is at least zero. No assumption that `X` is flat enters this inference. |
| 377–393 | Amplitude and dimension of iterates | Truncating the bimodule resolution at a right-projective syzygy retains the left action and gives a right K-flat complex in `[-d_R,0]`. Repeated tensoring therefore gives amplitude `[-r d_R,0]`. Cohomology truncation triangles give `pd C<=max_i(pd H^i(C)-i)`, with the printed minus sign. Consequently `pd Phi^r N<=d_L+r d_R`. |
| 395–399 | Extinction in both directions | Vanishing persists under further application of Phi. With both finite global-dimension bounds, only finitely many finite projective dimensions remain in the formula. Conversely the lower bound excludes each index larger than a finite integer `p`. This proves the equivalence, but its numerical upper estimate must retain the additional `+r`; see E1. |

There is also a wording/domain defect at lines 287–288: the sentence
`pd_A N=p<infinity implies Phi^(p+1)N=0` must specify `N != 0`, or
`p` a non-negative integer. With `pd(0)=-infinity`, the displayed
iterate is otherwise undefined. The proof's separate treatment of zero
at line 399 supplies the intended repair; the extinction equivalence
itself includes zero without difficulty.

The finite diagnostic in lines 940–968 also contradicts the printed
upper estimate: it has `d_L=d_R=1`, `t=2`, and `pd_A N=3`, while
(4.2c) would give an upper bound of two. Its projective bases and kernels
are checked below.

## 7.1: simulation and global dimension

Verdict: **error found** in the construction, E2 above (line 494).
The abstract simulation statement has **no error found after this repair**;
the following repaired local reasoning has status **AI-proved**.

| Lines | Step checked | Result of the check |
|---|---|---|
| 451–472 | Initial reversed numbering | Arrows `i -> i-1` lie in the printed corners there. Relabelling `i` by `l-i` gives the increasing final quiver, but also swaps the corner indices; the final membership failed to make this change. |
| 497–508 | Right-simple resolution | With the corrected membership, `epsilon_i K_l` has basis `epsilon_i,c_i` for `i>0`. Left multiplication by `c_i` sends `epsilon_(i-1)` to `c_i` and the source radical to zero. Its kernel and image are the stated radicals. The first map is injective, and `l=0` is the identity augmentation. |
| 510–535 | Ordinary bimodules and sides | The action of `c_i` is from the `(i-1)`st term to the `i`th term and satisfies the length-two relation by `d_P^2=0`. Both B-actions commute with it. `O` has left support on the second factor and right support on the first; `Y` has the reverse supports. |
| 537–557 | Derived tensor as a bimodule complex | `B tensor_k R_W` is a bounded right `B_1`-projective resolution retaining the left B-action. The map `(b tensor u) tensor o -> b u o` is balanced, respects both exterior B-actions, and has the printed inverse. Its degree-`n` term is `P^(b+n)` and its differential is `d_P`. |
| 559–567 | Shift sign | Multiplication by `(-1)^(bn)` satisfies `f^(n+1)d_P=(-1)^b d_P f^n`. The shift is `[b]`, also for negative `b`. |
| 569–586 | Two tensor steps, including unbounded inputs | `O` is right B-projective and `R_Y` is bounded right `B_1`-projective, so `R_X` is right K-flat over Delta. The indicated block supports force alternation between the two factors. Reassociation has no permutation sign; tensoring the chain isomorphism with an arbitrary complex preserves the second-factor sign `(-1)^n`. |
| 588–605 | The chain algebra and radical of `B_1` | Left simple resolutions move towards `l`, right simple resolutions towards `0`, giving bounds `l-i` and `i`. The two tensor radical ideals commute and are nilpotent. Their quotient is `(B/rad B)^(l+1)`, which is semisimple over every field. No separability hypothesis on `B/rad B` is needed. |
| 606–625 | Bounds for all modules and both sides | Every simple is `S tensor_k L_i`. Tensoring the two finite projective resolutions gives a resolution of length at most `d_L+l` or `d_R+l`, respectively. The radical filtration extends the bound to arbitrary modules because its semisimple factors are direct sums of simples; arbitrary direct sums of projectives remain projective. Product-algebra resolutions split by factors. |

In particular the bound `l+2` for the encoding algebra follows from
the stated two-sided bound two for B. The preprint's weaker `3l+2`
estimate does not conflict with this argument. For `l=0`, the complex
has a single possible term, so the ordinary bimodule obtained is
`P^b`, identified with `P[b]` in degree zero.

An explicit test of the erroneous corner is `B=k`, `l=1`, and
`P=(k --1--> k)` in degrees zero and one. The printed corner forces
`c_1` to annihilate `epsilon_0 O`, while the prescribed action there
is the identity. Thus the literal definitions fail to define the
claimed bimodule even in this two-term example.

## 7.2: assembly, conditional on the stated inputs

Verdict: **no additional local error found**, conditional on selection
and realisation as explicitly stated in the frozen file and on repairing
E2. Status: **AI-proved conditional implication**. The main existence
claim is not independently validated by this check of its assembly.

| Lines | Step checked | Result of the check |
|---|---|---|
| 656–686 | Input interfaces | Selection supplies one algebra, idempotent and automorphism for all `m`. Realisation supplies one B and one bounded right-projective bimodule complex P for all finite-dimensional R-modules. The selection automorphism satisfies the weaker endomorphism hypothesis in the source realisation theorem. The module construction has Y at each of three vertices, so it detects zero and preserves finite dimensionality. |
| 721–729 | Fixed choices | A support interval containing zero can be chosen once for the one bounded complex P. The subsequent `K_l,O,Y,Delta,X,A` are all fixed before `m` is chosen. No bound on their size uniform in other input algebras is needed. |
| 731–747 | Shift compatibility | Moving a shift on the second tensor factor contributes `(-1)^(s|p|)`; a shift on the first factor needs no extra sign. Both formulas respect the tensor differential, giving `[b]` and `[b+3]` in (7.2e). |
| 749–766 | Iteration | Applying the same functor to each summand yields descendants with shifts `(r+1)b+3j` and `(r+1)b+3(j+1)`. Pascal's identity gives the multiplicities, including endpoints. Each `H^r V_R` remains a finite-dimensional R-module, so the input applies anew. The argument needs no natural choice of splitting. |
| 768–784 | Extinction and survival | For the module chosen at `m`, the even iterate `2m` vanishes and `2m-2` contains a shift of the non-zero module `M(H^(m-1)Y_m)` as a direct summand. The lower bound is the iterate index `2m-2`; no estimate from the shifts and no survival assertion for the last odd iterate is used. |
| 785–794 | Endpoints and optional upper estimate | For `m=1`, the surviving zeroth iterate is non-zero and gives lower bound zero. Formula (7.2h) is the result of the corrected (4.2c), with `d_L=d_R=l+2` and `t=2m`. It is numerically sound, but its citation to the printed (4.2c) is inconsistent until E1 is repaired. |
| 796–812 | Little finitistic dimension and quantifiers | Every `N_m` is finite-dimensional over the same finite-dimensional algebra A. Thus the finite projective dimensions of finitely generated left A-modules exceed every integer. The order is `exists fixed data; for every m exists Y_m,N_m`, as required. |

## Small and degenerate cases

These are hand calculations; their status is **supported** for the
specified examples, with the bases and maps recorded here. No earlier
script or saved computational output was used. No script was created,
in accordance with the final instruction to modify only this report.

1. **Semisimple base, one arrow.** The counterexample E1 computes the
   entire resolution: `A e_0` has basis `e_0,x`, its radical is `k x`,
   and `A e_1=k e_1` maps injectively onto that radical. The quotient
   is `S_0`; there is no splitting because `x` acts nontrivially on
   `A e_0`. Hence its projective dimension is exactly one.
2. **Non-flat base-change diagnostic.** For the frozen two-cycle example
   at lines 927–938, the right-simple resolution is
   `0 -> e_0 Delta -> e_1 Delta -> S_1^right -> 0`, with the map
   given by left multiplication by `a`. Tensoring with `S_0` leaves
   one copy of k in degree `-1` and none in degree zero. Thus
   `Phi S_0=S_0[1]`, while the ordinary tensor is zero. The two-cycle
   radical-square-zero algebra has alternating minimal projectives.
   After tensoring with Delta, the map given by the new arrow is
   zero and the other map has image `k a`. Cohomology has dimension
   one in each even non-positive degree and zero in each odd one,
   in agreement with the shifts `[2r]` in (4.1).
3. **Finite non-flat diagnostic.** For the frozen three-vertex example
   at lines 940–968, the four projectives, from resolution degree
   `-3` to zero, have bases `(e_1,b)`, `(e_0,a,ba)`, `(e_2,x)`,
   `(e_1,b)`. Right multiplication by `a` maps the first basis to
   `a,ba`, injectively. Right multiplication by `x` maps only `e_0`
   to `x`, so its kernel is `span(a,ba)`. Right multiplication by
   `b` maps only `e_2` to `b`, so its kernel is `k x`. The last
   quotient is `S_1`. All images are radical, so the resolution is
   minimal and the projective dimension is three. The resolution of
   the right simple at 2 gives `Phi S_1=S_0[1]` and `Phi S_0=0`.
   Thus the exact formula gives `max(1,1+1+1)=3`.
4. **Zero and one-term cases.** `X=0` leaves only the zeroth bar
   summand, and `N=0` makes every summand zero. The case `l=0` in
   simulation is the one-term computation described above. These
   cases do not require any limiting argument.

The general sign checks in the earlier tables are algebraic identities
in all degrees, not extrapolations from bounded parity tests. The frozen
file's claimed counts and historical run of `D-A-checks.py` were not
reproduced and are not evidence for this report.

## Cited sources actually read

The main preprint was read in its supplied TeX sources. The section and
statement locators below were checked there; the main preprint's PDF
pagination was not independently checked. Status of imported statements:
**cited**, with the selection and realisation statements used only as
conditional premises of 7.2.

| Source and exact locator read | Check |
|---|---|
| `build/sections/06-square-zero-and-conclusion.tex:13–153`, Proposition 6.1 | Full bar proof, every face, multibar sign, derived-factor construction, and local finiteness read. It has no flatness hypothesis on X. |
| Same file, lines 157–249, Corollary 6.2 and following remark | Full extinction/lower-bound proof and exact-dimension remark read. The erroneous numerical upper estimate E1 does not occur here. |
| Same file, lines 253–341, proof of Theorem 1.1 | Fixed/varying choices, binomial formula, individual-module splitting, nonvanishing, and final quantifiers read. |
| `build/sections/05-ordinary-simulation.tex:9–149`, construction and Proposition 5.1 | Full right-simple resolution, block actions, simulation chain map and global-dimension argument read. E2's reversed corner is not printed in this source. |
| `build/sections/04-tensor-realization.tex:8–24`, Theorem 4.1 | Input statement read: one P, bounded, finite-dimensional, termwise right-projective, chosen independently of Y. Its proof is outside this job's conditional assembly check. |
| `build/sections/02-selection-process.tex:4–31`, Proposition 2.1 and equation (2.2) | Input functor convention and uniform selection statement read. The selection-group construction is not re-examined. |
| `build/sections/03-localization-and-lifting.tex:55–112`, directed dimension lemma and definition of M(Y) | The directed bound proof was checked on both sides: a projective surjection raises the lowest support of its kernel until the last vertex, where modules are projective. The three-vertex construction gives the bound two and has Y at every vertex. |

For Minamoto–Yamaura, the pinned source is
[arXiv:1710.01469v1](https://arxiv.org/pdf/1710.01469v1).
The local file read was
`MY17 - Homological Dimension Formulas for Trivial Extension Algebras.pdf` (the author's library),
SHA-256 `ee898625dc7697ab7bd4480d034448d89bdabc39f4544f19fa03aa51a8a7a9ec`.
Its v1 stamp and title-page date were checked. Text extraction was
read, not rendered images; the online v1 was also opened.

| Printed/PDF locator read | Check |
|---|---|
| pp. 1, 4, section 1.1 | Commutative base, central bimodules, right modules, cohomological degrees. |
| p. 5, sections 2.1–2.2 | Internal grading distinguished; finitely graded setting applies. |
| p. 6, Proposition 2.5 | Graded/ungraded module projective dimensions agree. |
| p. 11, Definition 3.2; p. 12, Lemma 3.5(2) | Lower endpoint convention; shift adds its index. |
| p. 12, Lemma 3.6 and section 4 opening | Complex version; no bimodule flatness assumption. |
| p. 17, section 4.2 and Remark 4.9 | Tensor-power notation means derived iteration. |
| p. 18, Corollary 4.11 | Exact formula includes `+a`. Its clause is “For M ∈ D(Mod Λ), we have”. |
| p. 18, Lemma 4.13(4); p. 20, Theorem 4.17 and proof | Components have shift `[i]`; perfectness requires perfect iterates and eventual vanishing. |

The opposite-algebra translation in frozen lines 866–880 was checked:
reverse tensor factors with sign `(-1)^(|u||v|)` and interchange the
bimodule actions. This preserves the differential and balancing; it does
not reverse the cohomological shift. The two printed slips mentioned in
frozen lines 889–900 are present: Lemma 4.13's opening omits the graded
superscript, and part (3) omits `M_0`. The supplied degree-one example
detects the latter; neither affects the uses of part (4).

The internal report locators 5.2, 6.1 and 6.6 were not opened because
their files are expressly excluded. Their input statements are fully
present in the frozen dossier and were compared with the preprint
interfaces above. No assertion is made here about their omitted proofs.

## Wording that does not match its proof

| Location | Mismatch and minimal repair |
|---|---|
| (4.2c), line 285; inference at lines 392–397 | The proof gives `d_L+(t-1)(d_R+1)`; the statement drops the shift contribution. Replace its final bound as in E1. |
| 4.2, lines 287–288 | The exponent `p+1` requires a finite integer p, whereas zero has projective dimension `-infinity`. Add `N != 0`; retain the separate zero case. |
| 7.1, line 494 versus lines 499–514 | The written corner reverses the arrow, while the resolution and action use the drawn direction. Swap the corner indices as in E2. |
| (7.2h), lines 789–794 | The numerical estimate matches the repaired (4.2c), not its printed expression. Repairing (4.2c) resolves the citation mismatch; (7.2h) needs no numerical change. |

The supplied frozen file also retains confidence prose, for example
“No error or unresolved gap” and the final claim that no local steps
remain unresolved. Those sentences were disregarded as evidence and
are contradicted by E1 and E2. This limits any claim that the supplied
input was completely stripped of earlier verdicts. No excluded review
file was opened.

## Final verdicts

| Statement | Verdict | Scope and consequence |
|---|---|---|
| 4.1 | **no error found** | Signs, contraction, K-flat base change, degrees, sides and naturality checked; X need not be flat. |
| 4.2 | **error found** | False upper bound (4.2c), with explicit counterexamples; add `+(t-1)`. Exact formula, lower bound and extinction equivalence have no further error found. Guard the `p+1` wording at zero. |
| 7.1 | **error found** | Reversed arrow corner at line 494; swap idempotents. After that repair, simulation and both dimension bounds have no further error found. |
| 7.2 | **no error found** (conditional) | Conditional on its stated input theorems and repaired 7.1. One fixed algebra, finite unbounded projective dimensions, and `2m-2` survive. Its optional upper estimate already uses repaired 4.2c. |

Three auxiliary agents checked the projective-dimension argument,
simulation/assembly, and source locators in parallel, without modifying
files. Their reports were treated as leads; the displayed counterexamples,
repairs and source passages were checked by the primary verifier. Exact
model/effort identifiers and token-usage figures were unavailable. No
formalisation, manuscript edit, commit, or human certification occurred.
