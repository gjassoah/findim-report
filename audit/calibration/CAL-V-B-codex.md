Model: GPT-6 (Codex; exact variant unknown); effort: unknown.

# V-B (W2) verification report

Completed, 2026-10-09. The requested verdicts are AI review findings, not human certification. Mathematical findings and proposed repairs in this report have status **AI-proved** when accompanied by a complete argument; finite computations have status **supported**, limited to their stated cases. A “no error found” verdict records the scope of this check and does not confer human verification. Verdicts concern the **frozen text as supplied**; conclusions conditional on repairs are distinguished below.

## Inputs and scope

- Claims and proofs: `scratch/V-B-frozen.md`, SHA-256 `481fc587209ac978a972a18730d097666675e75497f4e1575166fd8c85b37466`.
- Binding conventions: `audit/report-notation.md`, SHA-256 `f69ee451cfbff429f46196434626154173f6ed52cc4657c8c8976e20fd6db8d5`.
- Read the supplied global instruction index and applicable research/review instructions, `README.md`, `AGENTS.md`, and `codex/tasks/CAL-V-B.md`. `PROGRESS.md` and `docs/WORKING_RULES.md` are absent from this snapshot. The explicit frozen verification task supplies the working scope; no missing instruction is reconstructed from memory.
- No prior audit, note, ledger, escalation, conversation log, or Codex output is used. A preliminary general memory-registry search supplied no task-specific mathematical evidence. The frozen input itself retains earlier confidence and review claims (e.g. lines 1080–1092); these are not evidence and mean the supplied freeze is not completely stripped of earlier verdicts.
- Three parallel readers examined the odd double, roof lifting, and rectification; their reports were treated as leads and checked against the frozen text. Only this output file is modified. The source comparisons below refer to allowed preprint inputs, not to prior notes.

## Verdicts

| Statement | Verdict on frozen dossier | Reason or qualification |
|---|---|---|
| 2.3 | no error found | Right roofs, Ore, cancellation, and both finite-family consequences check. |
| 6.1 | no error found | Quadraticisation, both global-dimension bounds, and the exact fully faithful module functor check. |
| 6.2 | no error found | Right-module sides, multiplication order, derived tensor, and quotient evaluation check. |
| 6.3 | no error found | Formal cone lemma, two cones, Grothendieck class, action, and evaluation check. |
| 6.4 | no error found | Lifting and all pre-`Y` choices check; literal equality in its last sentence should be isomorphism. |
| 6.5 | **error found** | Wrong minus at line 651; the displayed differential can have nonzero square. One plus-sign replacement repairs it. |
| 6.6 | **gap (inherited)** | Its first step invokes the defective construction of 6.5. No further error found in the splitting or iterate argument after repairing 6.5. |
| 5.3 | **error found; inherited gap** | “Right multiplication” at 963 must be “left multiplication”; realization also needs the 6.5 repair. No further error found after these corrections. |

Neither error refutes the existential realization statements. The proposed corrections suffice for the supplied arguments; they have **not** been applied to the frozen dossier or any manuscript.

## Errors and repairs

### 5.3: error found in the matrix-description proof

At frozen lines 962–965, an endomorphism of a **right free column module** is called “right multiplication by a matrix”. It is **left** multiplication by a matrix. If `v=(v_j)` is a right column vector, every right-linear endomorphism has the form `(Av)_i = sum_j a_ij v_j`, and composition is `L_A L_B = L_(AB)`. Already for `n=1`, right multiplication by a noncentral element is not right-linear.

Proposed repair: replace “right multiplication by a matrix” by “left multiplication by a matrix”. Keep the displayed corner `epsilon M_n(R) epsilon` and all later evaluation formulas: these use left multiplication and are compatible with the stated right-module convention. This is an error in the explanation, not a counterexample to the realization statement.

For an explicit witness, take `R=M_2(Q)`, `n=1`, `a=E_12`, and `r=E_21`. If `T_a(v)=va`, then `T_a(1r)=ra=E_22`, whereas `T_a(1)r=ar=E_11`. Thus this claimed right-module endomorphism is not right-linear. Left multiplication `v -> av` is right-linear, and two such maps compose in the order asserted in the dossier. This also rules out repairing the paragraph merely by silently inserting an opposite algebra.

### 6.5: error found in the relation differential

Frozen (6.5.1), line 651, uses a minus between the two terms defining `partial_2`. Applying `partial_1` as actually defined gives

\[
\partial_1\partial_2(c\otimes v)_\rho
=\sum_{b,a}\rho_{ba}\bigl((cba\otimes v)_0
-2(cb\otimes f_av)_1+(c\otimes f_bf_av)_2\bigr).
\]

The two middle terms do **not** cancel. Consequently lines 667–675 do not follow, and the claim `d_P^2=0` in every characteristic (698–699) fails for the displayed construction. The homotopy term lands at vertex two and cannot cancel this vertex-one component.

Proposed repair: change the minus in line 651 to a plus. Then the expansion at 667–669 is exactly the composite, giving `partial_1 partial_2 = -f_rho` in the vertex-two summand; (6.4.1) cancels it with `d_0 eta + eta d_2`. Retain the positive `eta` and diagonal signs `+,-,+` in (6.5.3).

The allowed local source `build/sections/04-tensor-realization.tex:84–86` already has this **plus**. Thus the dossier's assertion of “the same construction and signs” (809–814) is inaccurate. The frozen computation claim (816–828) is not evidence for its displayed minus; the named older script is outside the permitted inputs and was not opened.

**Counterexample to the displayed construction (AI-proved; also supported by exact computation).** Let

\[
k=\mathbb Q,\qquad B=\mathbb Q(0\xrightarrow a1\xrightarrow b2)/(ba),
\qquad D_0=D_1=D_2=B[0],\qquad f_a=1,\quad f_b=0,\quad h_{ba}=0.
\]

All three complexes are bounded and right projective, all maps are right-linear, and (6.4.1) holds because `f_b f_a=0`. For any nonzero `v` in `B`, the displayed construction gives

\[
d_P^2((\mathbf e_2\otimes v)_{ba})=-2(b\otimes v)_1\ne0.
\]

Here `b` is a nonzero length-one path; the tensor product is over the field, and the target is the vertex-one summand of `L_0`. Thus the failure is already visible with zero internal differentials and zero relation homotopy. It occurs in characteristic different from two; the error is masked in characteristic two.

**Consequences.** At 858–859 and 1018–1026, respectively, 6.6 and 5.3 invoke this construction. Their realizations therefore need the correction before their proofs apply. The later claims of no unresolved gap (1080) and a passed sign check cannot validate the frozen formulas. The following stepwise review checks the proposed correction rather than silently treating it as already present.

## Stepwise checks, including subsidiary lemmas

The line numbers in this section refer to `scratch/V-B-frozen.md`. Each “no error found” entry is an AI-proved scope-of-check finding; entries about 6.5 and its applications are explicitly conditional on the sign repair.

### 2.3 — right fractions (68–140)

| Step | Verdict and check |
|---|---|
| Identities, composition, 2-out-of-3 (87–92) | No error found. The octahedral triangle relates the three cones; closure of the triangulated subcategory and its shifts suffices for all three implications. |
| Ore square (94–103) | No error found. `v:X'->X` has cone `S`; exactness of `Hom(X',-)` lifts `fv` to `g:X'->Y'`. The denominator modifies the **source**, as required. |
| Cancellation (105–112) | No error found. `f-g` factors through `S[-1]`; the triangle on the map to `S[-1]` supplies a precomposition denominator killing the difference in `K`. |
| Roof construction and quotient (114–125) | No error found. The cited right-fraction construction uses the same roof, with the order of the pair reversed typographically only. Essential smallness permits passage to a small skeleton. The source and target of `q(f)q(u)^{-1}` are correct. |
| Finite common denominator (127–133) | No error found. Applying Ore with denominator `u_2` and other map `u_1` gives `u_1 v=u_2 w`, with `v` in `W`; the common composite and then `w` are in `W`. Induction and the empty-family identity cover every finite family. |
| Simultaneous zero (134–140) | No error found. Equality against the zero roof gives a denominator annihilating the numerator. A finite direct-sum target makes a single denominator annihilate every component. |

Read the right-fraction axioms and construction in [Stacks §4.27](https://stacks.math.columbia.edu/tag/04VB), [Lemma 4.27.11](https://stacks.math.columbia.edu/tag/04VH), [Lemma 4.27.14](https://stacks.math.columbia.edu/tag/04VJ), [Lemma 4.27.16](https://stacks.math.columbia.edu/tag/04VK), and the quotient construction in [§13.6, Lemma 13.6.6 and Definition 13.6.7](https://stacks.math.columbia.edu/tag/05RA). No wrong locator or hypothesis was found.

### 6.1 — encoding and dimension bound (162–269)

| Step | Verdict and check |
|---|---|
| Finite quadratic presentation (200–214) | No error found. Auxiliary generators express successive initial subwords; their defining equations have degree at most two. Induction eliminates them, giving both inverse algebra maps, including constants and linear relations. |
| Directed-bound lemma (216–244) | No error found. For an arbitrary left module supported at indices at least `p`, the displayed projective surjection is an isomorphism at `p`. Its kernel advances the support by one. The last-vertex module is a sum of copies of its projective, giving length at most `n-1`; `n=1` is covered. No finite-generation assumption is smuggled into the global-dimension claim. |
| Right bound | No error found. Passing to `Lambda^op` and reversing the idempotent order reproduces the displayed triangular vanishing condition. |
| Relation ideal and dimension (246–258) | No error found. No nontrivial path enters 0 or leaves 2, so the ideal generated by the length-two relations is their vector-space span. Counting paths gives the displayed dimension. This remains valid when that span is zero or all of the length-two space. |
| Modules, full faithfulness, exactness (260–269 and preceding statement) | No error found. The commutation relations and homogenised relations evaluate respectively to zero and `p_j`. The two identity arrows force a morphism's three components to coincide; the remaining arrows impose `R`-linearity. Vertexwise exactness and detection of zero follow. |

Boundary checks: with no generators or relations, `R=k` and `B` is the linearly oriented three-vertex path algebra of dimension 6; `M(Y)` is the identity-arrow diagram. Redundant polynomial relations do not affect the construction after taking a basis of their span. The directed lemma also covers zero-dimensional vertex components and arbitrary direct sums.

### 6.2 — quotient action and evaluation (282–352)

| Step | Verdict and check |
|---|---|
| Right-projective convention (284–296) | No error found. For `a in e_j B e_i`, **left** multiplication maps the right ideal `e_i B` to `e_j B` and is right-linear. Composition has the path order prescribed in the conventions. |
| Algebra map (308–322) | No error found. Multiplication by `(s's)^{-1}` sends the quadratic, linear, and constant homogenisations respectively to the product of `s^{-1}a_h`, a single such element, and the identity. Thus `theta` is a map from `R`, with no opposite algebra. |
| Tensor functor and derived tensor (324–331) | No error found. A bounded right-projective complex is K-flat by its finite term filtration. Ordinary tensor preserves the written cone and homotopy formulas, shifts, and finite dimensionality. |
| Evaluation of arrows and quotient (333–352) | No error found. `e_i B tensor_B M(Y) -> e_i M(Y)` has the stated inverse. The two denominators evaluate to identities, so their cones and the thick subcategory are killed. Roof evaluation respects refinement and composition. |

The exact factorization is precisely [Stacks Lemma 13.6.8(2)](https://stacks.math.columbia.edu/tag/05RJ), whose target may be pre-triangulated. Its hypotheses hold here. No flatness of a universal localization or equivalence with a derived category of `R` is used.

### 6.3 — odd double and action (363–489)

| Step | Verdict and check |
|---|---|
| Formal Hom exactness (380–399) | No error found. Precomposition by the idempotent is an idempotent endomorphism of the exact representable sequence; its image is an exact direct summand. No triangulated structure on the completion is needed. |
| Formal cone lemma (401–426) | No error found. The factors `j'` and `v'` yield the displayed short exact Hom sequence. Taking the formal source `A'[1]` gives a section; the resulting map is an isomorphism by the explicit Hom argument. |
| Two cones (428–441) | No error found. The first cone is `U direct-sum U[1]`. In the second, the common identity summand is `U[1]`; the source complement `U[2]` contributes `U[3]` to the cone, and the target complement is `U`. Fullness supplies the map in the original category. |
| Grothendieck class (443–453) | No error found. Both triangle relations are in `K_0(T)`: `[C]=0`, `[V_0]=[C]-[C[1]]=0`. Reflection of isomorphisms makes the class independent of the chosen representative. No injectivity of a map on Grothendieck groups is assumed. |
| Corner action and diagram (455–471) | No error found. Centrality gives `(e alpha(r)e)(e alpha(t)e)=e alpha(rt)e`; the unit is `e`. The transported action is a unital `k`-algebra action. The proof does not require `alpha(e)=e`. |
| Evaluation and idempotent splitting (473–489) | No error found. Bounded vector-space complexes split into cohomology and contractible summands. The corner image is `eY`, stable under `alpha(R)` by centrality, and every arrow has the required action. All choices of formal object, cones, isomorphism, and transported action precede `Y`. |

Small nonsplit test (status: AI-proved by the displayed construction; finite matrix checks: supported): let `T` be the full triangulated subcategory of `D^b(k)` consisting of objects of even Euler characteristic, take `L=k^2[0]`, and let `epsilon=diag(1,0)`. The formal summand `U=k[0]` does not descend to `T`. The second cone has `k^2` in degrees `-3,-2,-1,0`, with differentials `diag(0,1), diag(1,0), diag(0,1)`; its cohomology dimensions are `1,0,0,1`. This checks the odd shift without assuming descent. The cases `epsilon=0,1` also give the asserted zero or doubled objects, including in characteristic two.

The contextual Balmer–Schlichting locator was read in the [author-hosted version revised June 14, 2000](https://www.math.ucla.edu/~balmer/Pubfile/IdempCompl.pdf), printed p. 2, Definition 1.2, Proposition 1.3, Remark 1.4, Theorem 1.5. It matches the contextual claim; the dossier's direct proof does not depend on that theorem.

### 6.4 — lifting, quantifiers, and support (504–602)

| Step | Verdict and check |
|---|---|
| First family of roofs (523–534) | No error found. The common denominator changes vertex 1; vertex 2 stays fixed, and every `1->2` square commutes after the displayed change of coordinates. |
| Second family (536–545) | No error found. The new arrows have target the already chosen `D_1`; changing vertex 0 leaves the previous arrows and squares intact. |
| Killing relations (547–566) | No error found. Every relation error has source `D_0`, target `D_2`, and zero image in the quotient. One denominator kills the finite family. Precomposing all arrows from 0 by it changes each relation to `g_rho v=0` and creates no further compatibility conditions. |
| Chain representatives and homotopies (568–575) | No error found. Relations in the homotopy category give actual right-linear degree `-1` homotopies with `dh+hd=f_rho`. No simultaneous strict chain relations are assumed. |
| Order of choices | No error found. Fix the presentation and quotient category; the formal summand, cones, transported action and resulting quotient diagram; the two arrow-denominator choices; the relation-annihilating denominator; and finally representatives and homotopies, all before any `Y`. Evaluation then applies to these same identities for every `Y`. Only the evaluated identifications or later splittings may depend on `Y`. |
| Support and effectiveness (577–602) | No error found. Supports `[a,b]` give the graded rectification support `[a-2,b]` and width `b-a+2`. For the corrected differential this is a complex. The text correctly reports the absence of an explicit bound in this argument; it asserts neither noncomputability nor impossibility of a different algorithm. |

The equality/isomorphism wording issue is recorded separately below.

### 6.5 — complete check after the sign correction (616–807)

| Step | Verdict and check |
|---|---|
| Construction, module sides, internal chain maps (633–660) | No additional error found. Left `B` acts on the first tensor factor and right `B` on `D_i`. The maps are bimodule-linear. Both choices of the disputed sign commute with internal differentials; that check alone cannot detect the error. |
| Horizontal composite (662–675) | **Error found**, as above. With the plus correction, the relation kills the vertex-zero term, the middle terms cancel, and the last term is `-f_rho`. Then `d_0 eta+eta d_2=-partial_1 partial_2`. |
| Total degree and square (677–699) | No additional error found after repair. Columns have internal degrees `n,n+1,n+2` in total degree `n`; the shifts give `+,-,+`. Each off-diagonal map has total degree one, including `eta` of internal degree `-1`. The listed six square entries exhaust all entries. |
| Finiteness and right projectivity (701–710) | No additional error found after repair. Each term is a finite direct sum of right-projective `D_i^n`. The left vertex idempotents give right-linear projections, so vertex terms are right projective. `iota_i` is a chain map and a split graded injection. |
| Filtration (711–745) | No additional error found after repair. The decreasing source-index filtration is preserved; terms involving `f_a` or `eta` strictly increase that index. The repaired term therefore vanishes on the associated graded. The `j=i` piece is exactly the removed copy of `D_i`. Adjacent pieces are two-term identity complexes; the `0->2` piece is the exact relation-space/path-space/quotient sequence. A relation basis, not merely a generating list, is essential for injectivity. Empty arrow or relation sets cause no exception. |
| Tensor contraction (747–757) | No error found. For a horizontal contraction `s`, the two internal terms have signs `(-1)^(p-1)` and `(-1)^p`, so `s tensor 1` contracts the signed total complex. This agrees with the chosen shifts. |
| Acyclicity and projective contraction (759–769) | No additional error found after repair. The finite filtration makes the quotient acyclic. It is termwise right projective because its inclusion splits as graded right modules. Starting at the highest degree splits a bounded acyclic complex of projectives into contractible pairs. |
| Explicit inverse (771–786) | No error found. From `d_D t+t d_C=0` and `d_C s+s d_C=1`, one obtains `d_D(x-tsc)=r d_P(x,c)` and `d_P K+K d_P=(tsc,c)=1-iota_i r`, with `r iota_i=1`. All maps remain right-linear. |
| Arrow homotopies and coherence (788–807) | No additional error found after repair. `H_a` has degree `-1`; the internal terms cancel and the remaining `partial_1` gives `a iota_i-iota_j f_a`. No relation can overlap a further nonidentity path, and there is no unexamined block of the three-column square. |

### 6.6 — splitting and iteration (832–920)

The application of 6.5 at 858 is the inherited gap. **Conditional on its stated one-sign repair**, every subsequent step has no error found:

1. Bounded right projectivity computes the derived tensor and allows the fixed right-linear homotopy equivalences and arrow homotopies to be tensored with every `M(Y)` (858–862).
2. These maps give the evaluated vertex diagram **with its arrow maps**, so its cohomology is `M(HY)` in degrees `-3,0` as left `B`-modules (863–876). Vertex dimensions alone would not suffice; the proof includes the needed compatibility.
3. For the truncation description (878–892), one may first replace the representative by `tau_{<=0}` (cycles in degree zero), then project to `tau_{>=-3}` (quotient by boundaries in degree `-3`). Both maps are quasi-isomorphisms by the cohomology vanishing. The resulting complex contains `A_{-3}[3]`; its quotient maps quasi-isomorphically to `A_0`. This yields exactly the displayed triangle.
4. The connecting map has degree **4**, not 3: its target is `A_{-3}[4]`. A left-projective resolution of `A_0` in degrees `-2,-1,0` computes zero `Ext_B^4(A_0,A_{-3})` (894–900). The left global-dimension bound is the one needed here.
5. Exactness of `Hom(A_0,-)` gives a section. The sum map from `A_{-3}[3] direct-sum A_0` induces isomorphisms in all cohomological degrees, giving the splitting in the derived category (901–908). No canonical section is claimed.
6. The iterate proof (910–920) uses finite sums, shift preservation, finite dimensionality of every `H^jY`, and Pascal's identity. The cases `j=0`, `Y=0`, and vanishing iterates are covered. Splittings at finitely many objects for each iteration suffice; no naturality of those splittings is used or needed.

### 5.3 — matrix generalization (933–1051)

In addition to the inherited 6.5 gap, the wrong multiplication side at 963 is the local error. **After those two repairs**, the remaining steps have no error found:

1. A finite right-projective module is the image of a right-linear idempotent `epsilon=sp` on the right free column module. Extending its endomorphisms by zero gives the corner `epsilon M_n(R) epsilon` using **left** multiplication. Its identity is `epsilon`; the left action yields the unital map `rho`. The agreement of scalar actions is exactly what gives `k`-linearity (959–975).
2. The map `(r_i) tensor y -> (r_i y)` is balanced, and its restriction identifies `HY` with `epsilon_Y(Y^n)`. The corner condition makes the `rho` action preserve this image. Finite dimensionality follows with bound `n dim Y`, and exactness follows from right projectivity. Thus iteration stays within finite-dimensional left modules (977–990).
3. Applying `theta` entrywise respects ordinary matrix multiplication and sends `epsilon` to an idempotent. The corner identity is the identity of the formal summand, and its evaluation is the preceding module and its complete left action (992–1005). No opposite algebra or centrality of the matrix idempotent is required.
4. The odd-double construction applies to `E_0^{direct-sum n}`. The transported `R`-action defines one fixed `B`-diagram, with `s,s'` identities, and the same actual cone triangles give zero Grothendieck class. All choices precede `Y` (1007–1016).
5. The lifting accepts any such diagram; the corrected rectification accepts precisely its chain data. Cohomology, splitting by `Ext_B^4=0`, and iteration then use the already checked arguments. The algebra `B` depends only on the presentation of `R`; matrix size changes the chosen object, not that algebra (1018–1034).
6. The original case is recovered by `n=1`, `epsilon=e`, `rho(r)=e alpha(r)e`. A general noncentral idempotent instead needs the explicitly assumed corner-valued unital algebra map; the text makes this distinction (1035–1041).
7. The zero bimodule (`epsilon=0`, with the zero corner allowed as stated), arbitrary noninjective actions, and the lack of left projectivity present no further issue. The finite-presentation, finite-right-projectivity, and scalar-compatibility hypotheses are present and used; the final paragraph makes no unsupported impossibility claim when they are removed (1043–1051).

## Wording not matching the proof

1. **6.4, lines 519–521:** “their evaluated diagram is the diagram” is stronger than the supplied argument if read literally. Lines 574–575 provide an **isomorphism of diagrams in `D^b(k-mod)`**. Replace it by “their evaluated diagram is isomorphic in `D^b(k-mod)` to the diagram”. The source explicitly says “is isomorphic” at section 03, lines 419–423. This is an identification imprecision, not an obstruction to the lifting theorem.
2. **6.5, lines 698–699 and 809–828:** the claims that the displayed matrix squares to zero in every characteristic, matches the source signs, and is supported by the cited earlier computation do not match the displayed minus at 651. The source has a plus, and the explicit counterexample above refutes the differential-square assertion as written. The correctness of an older unseen script cannot resolve that discrepancy.
3. **5.3, lines 962–969:** the prose says right multiplication, while the column notation, corner algebra, composition rule, and later evaluation use left multiplication. The correction is local to that sentence.

No other mismatch between an assigned statement and its supplied argument was found. In particular, 6.3 does not assert descent of `U`, 6.4 does not assert a computable length bound, 6.6 does not assert natural splittings, and 5.3 includes the required `k`-linearity. The general “no unresolved mathematical GAP” sentence at 1080 is inconsistent with the errors in this frozen version.

## Sources and locators actually read

Live sources were read on 2026-10-09. The preprint checks concern the local snapshot listed below; no equivalence of that snapshot to a remote published file is asserted.

| Source | Locator read and result |
|---|---|
| [Stacks §4.27, Tag 04VB](https://stacks.math.columbia.edu/tag/04VB) | Definition 4.27.1, right multiplicative-system axioms; right-fraction construction immediately before 4.27.11; also 4.27.13. Source-denominator orientation and common refinements match. |
| [Stacks Lemma 4.27.11, Tag 04VH](https://stacks.math.columbia.edu/tag/04VH) | Full statement and proof: the right-fraction equivalence relation, composition, and category axioms. Short anchor: “The relation on pairs defined above is an equivalence relation.” |
| [Stacks Lemma 4.27.14, Tag 04VJ](https://stacks.math.columbia.edu/tag/04VJ) | Full statement and proof: same-denominator equality can be tested after precomposition by a denominator. Anchor: “there exists a morphism”. The displayed condition is `f circ t = g circ t`, with `t` in the right multiplicative system. |
| [Stacks Lemma 4.27.16, Tag 04VK](https://stacks.math.columbia.edu/tag/04VK) | Full statement and proof: quotient functor, denominator inversion, and universal property. Anchor: “right multiplicative system of morphisms”. |
| [Stacks §13.6, Tag 05RA](https://stacks.math.columbia.edu/tag/05RA) | Lemma 13.6.6 and Definition 13.6.7: the cone system and quotient by localization. Anchor: “We define the quotient category”. Also inspected the exact-kernel discussion used in 6.2. |
| [Stacks Lemma 13.6.8(2), Tag 05RJ](https://stacks.math.columbia.edu/tag/05RJ) | Full statement and proof: exact factorization when the full triangulated subcategory is killed. Anchor: “$F'$ is an exact functor too.” |
| [Balmer–Schlichting, *Idempotent completion of triangulated categories*](https://www.math.ucla.edu/~balmer/Pubfile/IdempCompl.pdf) | Author-hosted version “Revised, June 14, 2000”, printed p. 2, Definition 1.2, Proposition 1.3, Remark 1.4, Theorem 1.5. The stated triangulation and exact-functor extension hypotheses match. Context only, not a missing dependency. |
| `build/sections/03-localization-and-lifting.tex` | Read 23–112 (encoding and directed bound), 116–169 (action/evaluation), 180–284 (odd double/action), 292–335 (fractions), and 337–444 (lifting/fixed chain data). These encompass every section-03 comparison locator in the frozen dossier. |
| `build/sections/04-tensor-realization.tex` | Read 36–224 (rectification), 226–233 (coherence explanation), and 235–303 (splitting and iterates). The plus sign at 86 differs from frozen 651. |

Local source fingerprints:

```text
build/paper.tex
e0d8df68ce341585231c3d6ebbe74e6294f4fb541b49f3a8a5167c9033001f4f
build/sections/03-localization-and-lifting.tex
0a79346e7f7d6584c12afb45c48efd1d1c1dc8467867e8d7cd687e6a1d4dcc48
build/sections/04-tensor-realization.tex
4e8d713c6728c3a4120896dde1c8660a12b22153538d7860043352d50b270f60
```

**Not read:** the forbidden outline, earlier audits, source notes (including the O.3' locator at frozen 1054), ledgers, logs, escalations, Codex outputs, and old computation records. Those references are unavailable under the verification scope and supply no evidence here. No AR-route claim, subsequent ordinary-bimodule simulation, or finitistic-dimension conclusion was checked. The additional NRS/Keller methodological references in the allowed preprint are not invoked as lemmas in the frozen proofs; no correctness claim about those contextual attributions is made.

## Reproducible finite checks

No separate script or output file was created, because the task's final instruction allows modification of **only this report**. The following exact Python was executed inline, with bytecode writing disabled; it is retained here with its output. It checks the small differential counterexample, the matrix-side counterexample, and the consecutive products in the odd-double example. It does not certify arbitrary inputs.

```python
# Claims/cases/conventions: frozen 6.5 sign for
# B=Q(0->1->2)/(ba), D_i=B[0], f_a=1, f_b=h=0;
# 5.3 right-linearity in R=M_2(Q); cohomological odd-double example.
# Composition is right to left. Exact rational arithmetic only.
from fractions import Fraction as F

def mul(A, B):
    return [[sum((x*y for x, y in zip(row, col)), F(0))
             for col in zip(*B)] for row in A]

p = [[F(-1), F(1)], [F(0), F(0)]]
q_bad = [[F(1)], [F(-1)]]
q_fixed = [[F(1)], [F(1)]]
print('6.5 frozen p*q =', mul(p, q_bad))
print('6.5 repaired p*q =', mul(p, q_fixed))
assert mul(p, q_bad) == [[F(-2)], [F(0)]]
assert mul(p, q_fixed) == [[F(0)], [F(0)]]
a = [[F(0), F(1)], [F(0), F(0)]]
r = [[F(0), F(0)], [F(1), F(0)]]
print('5.3 right multiplication: R_a(1*r) = r*a =', mul(r, a))
print('5.3 right-linearity would require R_a(1)*r = a*r =', mul(a, r))
assert mul(r, a) != mul(a, r)
d0 = [[F(0), F(0)], [F(0), F(1)]]
d1 = [[F(1), F(0)], [F(0), F(0)]]
assert mul(d1, d0) == [[F(0), F(0)], [F(0), F(0)]]
assert mul(d0, d1) == [[F(0), F(0)], [F(0), F(0)]]
print('6.3 odd-double example: ranks 1,1,1; cohomology dimensions 1,0,0,1')
print('All finite assertions passed over Q.')
```

Saved output from the inline run:

```text
6.5 frozen p*q = [[Fraction(-2, 1)], [Fraction(0, 1)]]
6.5 repaired p*q = [[Fraction(0, 1)], [Fraction(0, 1)]]
5.3 right multiplication: R_a(1*r) = r*a = [[Fraction(0, 1), Fraction(0, 1)], [Fraction(0, 1), Fraction(1, 1)]]
5.3 right-linearity would require R_a(1)*r = a*r = [[Fraction(1, 1), Fraction(0, 1)], [Fraction(0, 1), Fraction(0, 1)]]
6.3 odd-double example: ranks 1,1,1; cohomology dimensions 1,0,0,1
All finite assertions passed over Q.
```

For the first check, the two rows of `p` are the components `(b tensor v)_1`, `(e_2 tensor v)_2`, and its columns are `(b tensor v)_a`, `(e_2 tensor v)_b`, at vertex two for a fixed basis vector `v`. Thus these small matrices are restrictions of the actual maps, not a purely formal sign simulation. For the odd-double example, the ranks are immediate from the three displayed diagonal matrices; the code checks their consecutive products, not a general cohomology algorithm.

## Completion record

All eight assigned statements and the subsidiary arguments written in the frozen dossier were checked. The principal unresolved defect **in that frozen version** is the sign at 651; the local matrix-side sentence at 963 also needs correction. No further mathematical gap was found after reviewing the proposed repairs. The final checksum check found the frozen dossier, binding conventions, and three fingerprinted local source files unchanged. Only `audit/CAL-V-B-codex.md` was written. No human verification or formal proof-assistant check is claimed.
