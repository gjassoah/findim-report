Model: unknown; effort: unknown.

# V-A (W2): adversarial verification of the frozen dossier

Date: 2026-10-08. The runtime does not expose a reliable exact model identifier or effort setting; repository model labels are not used to infer them.

## Scope and isolation

The claim/proof input is exclusively `scratch/V-A-frozen.md` (SHA-256 `57b91a91982232a3f6092e15e0af2b8e68e9790e3990b14c4f25aa694323c1b0`). The binding convention input is `audit/report-notation.md` (SHA-256 `f69ee451cfbff429f46196434626154173f6ed52cc4657c8c8976e20fd6db8d5`). Line references below refer to that frozen input. Required instruction/index files, README, PROGRESS, WORKING_RULES and the V-A task were read for scope. Forbidden proof notes, other audit reports, outputs, logs and escalations are excluded. Earlier AI assessments in the frozen file are not evidence.

Only this report was modified. In particular, the instruction to modify no other files takes precedence over the general practice of creating computation scripts and saved outputs. Checks are written out here or performed without creating files. Three read-only subreviews covered the bar construction, projective dimension and simulation; their conclusions were checked against the source before adoption.

## Verdicts

These are AI review verdicts, not author certification. The status **AI-proved** below means that a complete argument has been checked here, with the explicitly stated qualifications. Finite computational checks have status **supported** only in their stated ranges. External selection and realisation results remain assumptions of 7.2.

| Statement | Verdict | Scope and status |
|---|---|---|
| 4.1 | **No error found** | AI-proved: includes the dg signs, K-flat base change and naturality; no flatness of X or finite global dimension is needed. |
| 4.2 | **Error found in endpoint wording** | Lines 287–288 require N≠0 before using the index p+1. No error found in (4.2), (4.2a–c), or their proofs; these and the qualified endpoint assertion have status AI-proved. |
| 7.1 | **No error found** | AI-proved over any field, for arbitrary complexes N, with both bounds d_L+l and d_R+l. |
| 7.2 | **No error found in the conditional implication** | AI-proved relative to the two stated inputs, using the binding convention that R may be infinite-dimensional. One A is fixed; 2m−2 is the correct lower bound. |
| Global finite-dimensionality convention, line 20 | **Error found in wording** | It contradicts the permitted selection input R in 7.2 and the binding conventions. Repair below. |

No unresolved local proof gap was found. This verdict does not independently validate the selection theorem or the quotient/lifting/rectification arguments producing P.

## Wording that does not match the proof

1. **4.2, lines 287–288: the zero module.** The dossier declares pd(0)=−∞. Thus the literal antecedent pd_A N=p<∞ includes N=0, while the conclusion uses the undefined iterate Φ^{−∞+1}. For example, Δ=A=k, X=0, N=0 meets that antecedent. This is an undefined-index error, not a counterexample to (4.2b). The proof already separates N=0 at line 399. Minimal repair: “For N≠0, pd_A N=p<∞ implies Φ^{p+1}N≃0.” For N=0 every nonnegative iterate is zero. Status of the diagnosis and repair: AI-proved.

2. **Opening convention, line 20: R must be exempt.** “All algebras in Sections 4 and 7 are finite-dimensional” includes the selection algebra R of 7.2. The binding conventions explicitly exempt R and kG. Replace the sentence by “The algebras Δ, A, B, B_1 and K_l are finite-dimensional over k; the selection algebra R in 7.2 need not be finite-dimensional.” This is essential to a non-vacuous reading: if R were finite-dimensional, its finitely many primitive central idempotents would be permuted by α. If there are t of them, the central products eα(e)⋯α^{r−1}(e) stabilise by r=t to an α-invariant idempotent. Indeed, on each permutation cycle the product retains the whole cycle exactly when e contains that whole cycle, and otherwise removes it within the cycle length. The underlying space of H^rY is that product applied to Y. Any orbit that ever becomes zero therefore becomes zero by t, contradicting the unbounded extinction times in (7.2a). Status: AI-proved.

3. **7.2, line 722: “the functor M”.** The displayed black-box interface at lines 671–680 specifies modules M(Y) and objectwise isomorphisms, without specifying maps M(f). The proof requires only this object assignment. Replace “functor M” by “assignment M” if that interface is to be literally self-contained. This introduces no mathematical gap: the preprint's concrete construction does supply a functor, and the induction does not use it.

There is no other mathematical statement/proof mismatch found in the four results. Redacted status labels and resulting sentence fragments in the frozen copy are not counted as mathematical errors.

## 4.1: step-by-step verification

All claims in this section have status AI-proved; the verdict on each row is **no error found**.

| Frozen lines | Step or lemma | Check |
|---|---|---|
| 63–71 | Projective bimodule replacement and dg square-zero algebra | Δ^e is finite-dimensional, so resolutions by finite-dimensional projective modules exist, possibly unbounded to the left. Restriction of a Δ^e-projective is projective on either Δ-side. Q≤0 and Q→X give a quasi-isomorphism Δ⋉Q→Δ⋉X. Products of two ideal elements, and products involving their differentials, vanish. |
| 73–116 | Shifted action, D²=0 and dg Leibniz | Multiplication of the leading two factors is an unshifted chain map. The mixed terms have coefficients (−1)^r+(−1)^{r−1}; b²=0 uses Q²=0. With a·s^rw=(−1)^{r|a|}s^r(aw), b(az)=(−1)^{|a|}ab(z). No missing Koszul sign is needed in b. |
| 118–137 | Augmentation and contraction | Splitting the leading Δ⊕Q pairs F_r[r] with F_r[r−1], r≥1. The cross differential is identity; their internal differentials are opposites. The inverse identity has degree −1 and satisfies Dh+hD=1 on the pair. The remaining summand is E. The splitting need only be Δ-linear, not a dg-algebra-module splitting. |
| 139–151 | Projectivity of F_r and bounded-above K-flatness | A Δ^e-projective V tensored with any left module L is a summand of sums of Δ⊗_k L, hence left projective. In each degree of F_r there are finitely many nonpositive degree decompositions. The stupid cochain truncations in degrees ≥−s really are subcomplexes; finite complexes of flats preserve acyclicity, and their filtered union does also. |
| 153–163 | K-flatness over the dg algebra | The length filtration is by subcomplexes, since b lowers length; it is split as modules over the underlying graded algebra. Its quotients are induced from the K-flat F_r. Tensoring any acyclic right dg module gives an acyclic tensor of each quotient, then of every finite filtration stage, then of the filtered union. |
| 165–175 | Tensor/shift identification | The sign (−1)^{r|z|} is necessary. Balancing zc⊗s^rw against z⊗c·s^rw gives the same exponent r(|z|+|c|). For dz, da and dv the exponents also agree after the target shift. For base change by ordinary A or Δ the leading degree is zero. |
| 177–189 | Base change and A-projective resolution | The map Δ⋉Q→A is a quasi-isomorphism of right dg modules, so its cone tensored with the K-flat bar module is acyclic. The map L→N exists because N's action factors through A→Δ; its composite with the original bar module is its augmentation to E→N. Thus L→N is a quasi-isomorphism. Its actual degree terms are finite sums of A⊗_Δ F_r^j, hence projective. |
| 191–201 | Derived powers, direct sum and naturality | The residual bar face dies under Δ⊗_A−. Q is K-flat on the right, so its r ordinary tensor factors with E compute the r successive derived functors. All shifted terms are in degrees ≤−r, giving a bounded-above, degreewise finite totalisation. Fix Q and use the functorial free bar resolution of N over Δ to obtain naturality. |
| 214–233 | Source multibar comparison | For η(i)=Σ(r−j)i_j, η(i−e_j)=η(i)−(r−j). The source/target face-sign difference is therefore 2(j−r), an even integer. Empty blocks have zero faces, and the r=0 augmentation is separate. |

The potentially dangerous inference is base change of a relative bar resolution without flatness. Here it is justified by the explicit K-flat filtration before it is used; ordinary relative tensor powers of X are never substituted for derived powers.

## 4.2: step-by-step verification

Apart from the endpoint wording already identified, all claims in this section have status AI-proved and verdict **no error found**.

| Frozen lines | Step or lemma | Check |
|---|---|---|
| 248–259 | Projective dimension of a complex | A lower endpoint −p shifts to −p−s under [s], giving pd(C[s])=pd(C)+s. Negative finite values for complexes are permitted. Zero contributes −∞. |
| 305–333 | Minimal-complex detection by simples | A nonzero map on projective tops has an invertible component between isomorphic indecomposable projectives. Cancellation isolates a two-term contractible summand. Descending from a finite upper endpoint makes each degree stabilise after finitely many cancellations. Hom(J,S) then has zero differential, and a nonzero projective J^{−n} has a simple quotient. This gives (4.2d), also for unbounded-below resolutions and the zero object. |
| 335–339 | All A-simples are inflated | If XS=S then X²S=S, contradicting X²=0 and S≠0. Conversely inflation of a Δ-simple remains simple. |
| 341–362 | Derived adjunction and product | Applying Δ⊗_A− to L gives a bounded-above complex of projective Δ-modules, so the ordinary adjunction of Hom complexes computes the derived adjunction. Hom out of a direct sum is a product; vector-space products preserve exactness. The shift is S[n−r], not S[n+r]. The nonpositive projective representative of Φ^rN makes factors with r>n vanish. |
| 363–367 | Exact formula and lower bound | Suprema over r, n and simples give exactly sup_r(pd_Δ Φ^rN+r). A nonzero iterate has a nonzero minimal projective term in a nonpositive degree, hence pd_Δ Φ^rN≥0. This gives the index bound pd_A N≥r. |
| 369–376 | Right-projective bounded replacement | Truncate the bimodule resolution at the d_R-th right syzygy. That syzygy is right projective and retains its left action; left projectivity is not asserted or needed. Tensoring the resulting bounded right-projective bimodule complex repeatedly computes Φ^rN and puts its cohomology in [−rd_R,0]. The d_R=0 case uses the right-projective X itself. |
| 378–393 | Cohomology-amplitude estimate | Truncation triangles build C from H^i(C)[−i]. Detection by Hom to simples gives pd C≤max_i(pd H^i(C)−i)≤d_L−u when support is [u,0]. Hence pd Φ^rN≤d_L+rd_R. |
| 395–399 | Extinction, exact maximum and upper estimate | Once an iterate is zero, every later iterate is zero. The supremum becomes a finite maximum, bounded by d_L+(t−1)(d_R+1). Conversely a nonzero iterate of index r>p contradicts pd_A N=p. The proof treats N=0 separately. |

Finite global dimension is used only for the boundedness/perfectness of surviving iterates, not for (4.2) or (4.2a). Neither left nor right flatness of X is used. The bounds d_L,d_R may be replaced by nonnegative integer bounds if needed; global dimensions here are integer-valued.

## 7.1: step-by-step verification

All claims in this section have status AI-proved and verdict **no error found**.

| Frozen lines | Step or lemma | Check |
|---|---|---|
| 456–475, 488–508 | Orientation and right-simple resolution | For c_i:i−1→i, the right projective ε_iK_l has basis ε_i,c_i. Left multiplication by c_i sends ε_{i−1} to c_i and its radical to zero. The first map is injective and the subsequent kernels/images agree. The decreasing orientation in the initial attempt is the relabelling i↦l−i. |
| 510–535 | Ordinary bimodule actions | Arrow actions are the B-bilinear differentials of P, so they commute with both B-actions and satisfy the length-two relations. O is (B_1,B); Y is (B,B_1). The specified block supports make their sum an ordinary Δ-bimodule, and O is right B-projective as a finite sum of the terms of P. |
| 537–556 | Derived bimodule tensor | R_Y^n=(1⊗ε_{l+n})B_1 is right B_1-projective, retaining the left B-action. The map (b⊗u)⊗o↦buo is balanced and has the stated inverse. The result has term P^{b+n} in degree n and differential d_P. |
| 558–567 | Shift sign | f^n=(−1)^{bn} satisfies f^{n+1}d_P=(−1)^bd_Pf^n. Thus the target is P[b]. This holds for either parity and negative b. |
| 569–586 | Arbitrary complexes N | R_X=O⊕R_Y is bounded right-projective, so ordinary tensor with it preserves quasi-isomorphisms of arbitrary complexes. The block factors give exactly the displayed two-step tensor, with no permutation of factors. Tensoring f with N preserves the second-factor sign (−1)^n. P[b] is also bounded right-projective. No boundedness assumption on N is added. |
| 588–593 | Bounds for K_l | Left-simple syzygies run to larger vertices and right-simple syzygies to smaller vertices. Both lengths are at most l. |
| 595–612 | Radical quotient and simple resolutions for B_1 | The two ideals J_B⊗K_l and B⊗J_K commute and are nilpotent, so their sum is nilpotent. Its quotient is (B/J_B)^{l+1}, hence semisimple even over an imperfect field. It is therefore the radical, and all simples are S⊗L_i. Tensoring the two finite projective resolutions over the field gives lengths at most d_L+l and d_R+l. No separability assumption is used. |
| 614–625 | Global bounds, including all modules | The radical filtration of any module is finite, with semisimple layers; these layers are arbitrary direct sums of simples. Direct sums of the bounded projective resolutions remain projective resolutions, and Ext preserves a common upper bound under extensions. Product-algebra modules split by the two central idempotents. This gives the claimed global bounds. |

For l=0 the right-simple resolution is W=k in degree zero, B_1=B, Y=B, and O=P^b. Since P is then supported in the one degree a=b, this is precisely P[b]. The construction permits a,b of either sign; choosing a≤0≤b for the assembly only enlarges the interval. The dossier's l+2 estimate for the encoding algebra is stronger than the preprint's 3l+2 estimate and is justified by the displayed simple-module argument.

## 7.2: assembly and dependency boundary

All deductions in this section have status **AI-proved relative to the selection and realisation inputs**. Their existence assertions are not independently reassigned a status in this verification.

| Frozen lines | Step | Verdict and check |
|---|---|---|
| 656–669 | Selection interface | No error found in the use of the input. The underlying space of H(Y) is eY and its action is restricted along α. Centrality makes this an R-module. H preserves finite dimension and zero. Only the two endpoint conditions in (7.2a) enter the proof. R is exempt from the opening finite-dimensionality convention. |
| 671–685 | Realisation interface | No error found in the use of the input. A single P, right-projective termwise, is required uniformly for all finite-dimensional R-modules. The zero-detection property of M is explicitly included. The preprint's concrete M(Y) has Y at each of three vertices, so is finite-dimensional and detects zero. |
| 721–729 | Fixed algebra | No error found. R,e,α, B,M,P, then one finite interval [a,b], then K_l,O,Y,Δ,X,A are chosen before m. All summands of Δ and X are finite-dimensional. The simulation bimodule Y is distinct from every Y_m. |
| 731–748 | Shifts in the two-step functor | No error found. P[b]⊗C→(P⊗C)[b] is identity on tensors: its second differential coefficient is (−1)^{|p|−b}=(−1)^{|p|+b}. P⊗C[s]→(P⊗C)[s] has coefficient (−1)^{s|p|}. Thus the two summands have shifts b and b+3, with the stated signs. |
| 750–766 | Binomial induction | No error found. Every stage applies the same derived tensor functor to finite sums and shifts, then applies the objectwise realisation isomorphism to H^r(V). Pascal's identity gives multiplicities and endpoints. No compatible or natural choice of splitting is required. |
| 768–785 | Extinction and lower bound | No error found. At r=m all module summands are zero. At r=m−1 the nonzero module M(H^{m−1}Y_m), up to shift, is a direct summand, so the derived object is nonzero. These are iterate indices 2m and 2m−2. Formula (4.2a) gives exactly 2m−2, independently of the cohomological shifts. |
| 787–794 | Endpoint and finite upper bound | No error found. When m=1, Y_1≠0 and N_1≠0; the lower bound is zero. Taking t=2m and d_L=d_R=l+2 in (4.2c) gives (l+2)+(2m−1)(l+3). |
| 796–812 | Little finitistic dimension and quantifiers | No error found. Each N_m is finite-dimensional, hence finitely generated, over the same A. The finite projective dimensions exceed any given integer when m is large enough. Neither the support length nor P is reselected with m. |

In particular, the proof does not need nonvanishing of the last odd iterate, finite-dimensionality of R, or a natural splitting in the test module. It does need the uniform existence of P; proving that input is outside this job's frozen dossier.

## Independent small checks

The following hand calculations have status **AI-proved**. They test actual non-flat examples, not a replacement of the derived functor by ordinary tensor.

**Finite non-flat diagnostic (frozen lines 940–970).** Take Δ=k(0→1→2), arrows a:0→1 and b:1→2, X=S_0⊗_kS_2^{right}, and N=S_1. The right resolution ε_1Δ→ε_2Δ of S_2^{right}, by left multiplication by b, is injective on basis (ε_1,a), with image (b,ba). Tensoring it with S_1 leaves k in degree −1 and zero in degree zero; tensoring it with S_0 leaves zero. Therefore ΦN=S_0[1] and Φ²N=0, while X⊗_ΔN=0.

For A=Δ⋉X, the extra arrow is x:2→0 with ax=0=xb. The path ba survives. The left projectives have bases

| Projective | Basis |
|---|---|
| Aε_0 | ε_0,a,ba |
| Aε_1 | ε_1,b |
| Aε_2 | ε_2,x |

The resolution in the dossier has maps Aε_1→Aε_0→Aε_2→Aε_1 given by right multiplication by a,x,b. Their images are respectively span(a,ba), span(x), span(b). These equal the required kernels and the first map is injective. All images lie in radicals, so the resolution is minimal of length 3. Over Δ, both S_1 and S_0 have projective dimension 1. Thus the two nonzero entries in (4.2) are 1 and (1+1)+1=3. This checks the extra contribution from a negative cohomological degree.

**Infinite diagnostic (lines 927–938).** For Δ=k(0→1), X=S_0⊗_kS_1^{right}, and N=S_0, the right-simple resolution gives ΦN=S_0[1], although ordinary tensor is zero. The algebra A is the radical-square-zero two-cycle. Its minimal resolution of S_0 alternates the two vertex projectives indefinitely. After Δ⊗_A−, the maps alternate the injective arrow map Δε_1→Δε_0 and zero. Cohomology is one-dimensional in degrees 0,−2,−4,… and zero in negative odd degrees. Since Φ^rN=S_0[r], this agrees with the terms S_0[2r] in (4.1). This all-degree check is the written alternating-resolution argument, not extrapolation from finite computation.

**Other endpoints.** X=0 leaves only N in (4.1) and makes (4.2) ordinary pd_ΔN. N=0 makes both sides zero and the dimensions −∞; only the unqualified p+1 sentence fails to parse. The l=0 simulation and m=1 assembly endpoints were checked above.

The following exact in-memory computations have status **supported**, only in the listed finite ranges. They were newly written for this review; no prior script or saved output was read.

| Check | Cases | Saved result |
|---|---|---|
| Actual signed dg bar complex: D²=0 and Dh+hD=1−ιε | Δ=k, E=k, Q=(kq→kx) in degrees −1,0 with dq=x and Q²=0. Leading factor 1,x,q and all q/x words of lengths 0,…,6: 381 basis cases. Intermediate terms were not length-truncated. | All 381 passed for each identity. |
| Multiple-bar rescaling | r=0,…,5; every i_j=0,…,3; every face t=0,…,i_j in every nonempty block. | 69,633 parity comparisons passed. |
| K-flat tensor/shift chain map | Shift s=−4,…,4 and degrees of z,a,v independently −4,…,2. All three differential terms compared. | 3,087 degree tuples passed. |
| Simulation sign | b=−4,…,4; l=0,…,8; n=−l,…,−1. | 324 comparisons passed. |

For reproducibility, the dg check uses basis (a;w_1,…,w_r), with |1|=|x|=0, |q|=−1. D first replaces a=q by x with coefficient (−1)^r, then replaces each w_j=q by x with coefficient (−1)^{r+|a|+Σ_{i<j}|w_i|}, and finally, if a=1 and r>0, sends it to (w_1;w_2,…,w_r) with coefficient 1. The contraction sends (a;w) to (1;a,w) when a=x or q and is zero for a=1. Sparse integer coefficients were combined exactly. The augmentation/projection is nonzero only on (1;empty). This specifies the finite check independently of any saved computation from the dossier.

For the multibar check the compared exponents were j+Σ_{h<j}i_h+t+η(i)−(r−j) and r+Σ_{h<j}i_h+t+η(i). For the tensor/shift map they were, for dz,da,dv respectively,

\[
\bigl(s(|z|+1),\ |z|+s+s|z|,\ |z|+s+|a|+s|z|\bigr)
\quad\text{and}\quad
\bigl(s|z|+s,\ s|z|+s+|z|,\ s|z|+s+|z|+|a|\bigr).
\]

The simulation check compared b(n+1) and b+bn modulo two. The proofs above, not these finite ranges, justify the unrestricted claims.

## Cited sources and locators actually inspected

The main preprint was read from the allowed `build/` sources. The local `paper.pdf` was also text-extracted to check page boundaries. Its relevant proof contents agree with those sources.

| Source locator | What was read and checked |
|---|---|
| `build/sections/02-selection-process.tex:4–31`, Proposition 2.1 and (2.2) | Definition of H, uniform fixed data, and extinction statement; proof of selection deliberately excluded. |
| `build/sections/03-localization-and-lifting.tex:21–112` | Definition and finite-dimensionality of B, directed dimension lemma and its complete proof, and definition of M(Y). The lemma raises the minimum support vertex of successive kernels and yields both bounds 2; M(Y) detects zero and is finite-dimensional. Status of this local lemma check: AI-proved. No quotient or lifting proof was audited. |
| `build/sections/04-tensor-realization.tex:8–24`, Theorem 4.1 | Full statement and hypotheses: one bounded P, finite-dimensional terms, right projectivity and independence of Y. The existence proof remains an external input. |
| `build/sections/05-ordinary-simulation.tex:9–149`, Proposition 5.1 and preceding construction | Entire construction and proof, including the source estimate 3l+2 and sign (−1)^{bn}. PDF construction pp.17–18; proposition and proof pp.18–19. |
| `build/sections/06-square-zero-and-conclusion.tex:13–153`, Proposition 6.1 | Entire field-bar proof, multibar signs, derived interpretation and finite totalisations. PDF pp.19–21. |
| Same file, lines 157–249, Corollary 6.2 and Remark 6.3 | Both directions and the MY attributions; PDF pp.21–22. |
| Same file, lines 253–341, proof of Theorem 1.1 | Complete fixed/varying table, formula (6.4), objectwise splitting argument and final index bound; PDF p.22. |

**Locator corrections.** Frozen line 205 gives pp.19–20 for Proposition 6.1, but its final proof paragraph is on p.21: use pp.19–21 for the complete proof. At lines 629–631, p.18 correctly locates Proposition 5.1's statement, but its proof continues on p.19; the preceding construction occupies pp.17–18, not only p.17. The exact TeX line ranges cited in the dossier include the complete arguments. These are page-coverage corrections, not incorrect attributions.

**Minamoto–Yamaura, pinned v1.** The [arXiv v1 record](https://arxiv.org/abs/1710.01469v1) matches the local Library PDF and its first-page version stamp. Local SHA-256: `ee898625dc7697ab7bd4480d034448d89bdabc39f4544f19fa03aa51a8a7a9ec`. PDF and printed page numbers agree. Local pages 18 and 20 were rendered through stdout and inspected visually; a web screenshot attempt failed, so it is not counted as inspection.

The following source statements have status **cited**, with their hypotheses checked:

| MY v1 locator | Check |
|---|---|
| Introduction p.1; §1.1 p.4 | Commutative base; central bimodules; right modules; cohomological degrees. |
| §§2.1–2.2 p.5; Proposition 2.5 pp.6–7 | Finite nonnegative internal grading; graded/ungraded projective dimensions coincide. |
| Definition 3.2 p.11; Lemmas 3.5(2), 3.6 p.12 | Lower-endpoint definition, positive shift contribution, and complex version of graded/ungraded equality. |
| §4 p.12; §4.2 and Remark 4.9 p.17 | Arbitrary bimodule; powers mean iterated derived functors. |
| Corollary 4.11 p.18 | “For M∈D(Mod Λ), we have” precedes the exact dimension formula. |
| Lemma 4.13(4) p.18; Theorem 4.17 and its proof p.20 | Generator complexes are internal components; for inflated M the component is (M⊗^L_Λ C^i)[i]. Perfectness requires all iterates perfect and eventual vanishing. |

No flatness, Noetherian or finite-global-dimension assumption is hidden in those last two results. The extra assumptions in §4.3.1 belong to later applications.

**Handedness check (status AI-proved).** Take Λ=Δ^op, C=X^op and A^op. A left Δ-module becomes a right Λ-module by n·d^op=dn. The tensor reversal u⊗v↦(−1)^{|u||v|}v⊗u respects balancing and differentials; hence every right-handed iterate becomes Φ^rN. Reversal changes neither the shift [r] nor the projective dimension, giving exactly (4.2). In the graded component formula, forgetting internal grading takes the direct sum; it does not replace the derived tensor by an ordinary power.

**MY notation observations (status AI-proved).** The two slips identified at frozen lines 890–902 occur in the printed p.18: Lemma 4.13 uses ungraded D(Mod A) in its opening although its truncations are internal, and part (3) omits the subscript 0 on the right-hand M. With A=Λ=k, C=0, N=k and M=k in internal degree one, the literal part-(3) left side in internal degree zero is zero while its unindexed right side is not. Neither slip changes the part-(4) attribution used here.

## Limits and final state

The review covers every local argument supporting 4.1, 4.2, 7.1 and the conditional 7.2, as well as the displayed diagnostics. The external selection and realisation existence proofs were not checked; their report-note files were not opened. The earlier computation files cited at lines 909–911 were neither read nor rerun, so their claimed historical run and exact output are not certified here. Newly performed checks are recorded above.

The most delicate local step remains the K-flat base change in 4.1; its filtration, balancing and signs were explicitly checked, with no gap found. Only `audit/V-A-codex.md` was written by this job. Other worktree changes made concurrently were left untouched. The frozen dossier and binding-conventions hashes remained unchanged at the final check. No commit, push, formalisation, or author certification was performed.
