Model: GPT-6 (Codex); effort: unknown.

# V-D (W2): adversarial verification of Result 8.1

Date: 2026-10-08. Review complete. No error or unresolved proof gap found
in Result 8.1 or its supporting statements within the scope below.

The mathematical input is `scratch/V-D-frozen.md`, with binding conventions
from `audit/report-notation.md`. Line references below refer to that frozen
file. The permitted preprint source and cited primary literature are checked
separately. No earlier audit, proof note, output or computation is used as
evidence. The repository README and working rules are procedural inputs;
the latest fresh-context restriction supersedes their general instruction to
read progress and other research records.

This job modifies only this file. No computational script is created:
the task's final instruction permits no other modified files. Small examples
and sign checks are recorded here with their derivations.

The requested verdicts are `no error found`, `error found`, and `gap`.
Mathematical arguments supplied by this review are labelled **AI-proved**
when their derivation is complete, or **supported** for explicit test cases.
Neither label denotes human certification. Two same-model delegates checked
the comparison lemma and the cone calculation from the permitted inputs;
the primary verifier checked their arguments before incorporating them.
Agreement between agents is not counted as independent mathematical evidence.

## Input pins

SHA-256 values at the start of the mathematical review:

```text
d1270133024d81b0c9489be177b6ba2c2e3744440e93691477bfd3e376785645  scratch/V-D-frozen.md
18f7d074a008866cefe229e6c2d8cd0025dc5d71874adf5c5427958919227488  audit/report-notation.md
598837f4705df91bbae832abe9809bd601fef9c636a7395aa670e97a7d61edeb  .cache/ar-src/01-stable.tex
816fd48bbb39b30678b89175bfbafc2b06dbca4ab244935d17ecb37a2c76daca  .cache/ar-src/02-conversion.tex
c4da7a8976713e71ad392c2dfa451c216436f5fcf09cce609f85236abfe64208  .cache/ar-src/main.tex
```

The final hash check detected a concurrent change to the binding notation
file. It was re-read in full before completion. Its final SHA-256 is
`f69ee451cfbff429f46196434626154173f6ed52cc4657c8c8976e20fd6db8d5`.
The changes clarify projective summands of syzygies and the graded
translation of Toda brackets. The former agrees with the stable-category
use in item 5 below; the latter is not used in this argument. Neither
changes a verdict. The frozen dossier and all three pinned preprint
files retained their original hashes. Concurrent changes elsewhere in
the repository were not inspected or modified by this job.

## Completed checks: conventions and comparison

All mathematical deductions in this section have status **AI-proved**;
the verdict is **no error found** for each of the following statements.

1. **Definition of delta and conventions, lines 62–90, 111–150.**
   The bimodule is separately projective on its two sides, rather than
   projective over the enveloping algebra. This gives precisely an exact
   functor on left modules that preserves projectives. Thus it descends to
   stable maps. In (1.1) the two terms both have domain S and codomain
   (T_F S)[a]; the second uses v[a], and the first uses the specified
   comparison T_F(S[a]) → (T_F S)[a]. Composition is right to left.
   The Hom differential in (1.3) squares to zero. A cocycle f satisfies
   (-1)^a d_W f = f d_P, the chain-map equation into W[a]. If h has
   degree a−1, the ordinary homotopy (-1)^a h has boundary
   d_W h + (-1)^a h d_P = ∂h. Both negative and positive a are covered.
   Exactness of P identifies C^n(P) with im(d_P^n), giving (1.4).
   The passage from the ring target to arbitrary free targets is valid:
   the ring target is concentrated in degree zero, so each Hom degree
   contains just one nonzero factor. It does not interchange a general
   infinite product with a direct sum.

2. **Consequences of symmetry, lines 156–190.**
   With the left action (bλ)(a)=λ(ab) on DE, the displayed inverse sends
   λ to the E-linear map m ↦ (a ↦ λ(am)). Evaluation at 1 inverts it.
   Exactness of k-dual makes DE injective. Symmetry therefore makes
   finite projectives injective and dualising a finite right-free
   surjection onto DM gives a finite projective embedding of M.
   The prescribed injection i is retained as P^1=Q when splicing;
   there is no minimality requirement. Right projectivity of F gives
   exactness of T_F, and left projectivity gives its projective terms.
   Injectivity of the finite projective targets then makes both P and
   T_F P totally acyclic.

3. **Extension property, lines 208–216.**
   In Hom(P,L), a map P^n→L killing im(d_P^{n−1}) is a cocycle in
   degree −n. A boundary is, up to an invertible sign, precomposition
   with d_P^n. Thus b d_P^n = u ε_n exists, and surjectivity of ε_n
   gives b jmath_n=u. This uses total acyclicity of P, not injectivity
   of L over R.

4. **Comparison lemma (2.2), lines 194–279.**
   To lift u, negative components use projectivity of P^n and exactness
   of W. Positive components use the preceding extension property with
   target W^{n+1}; that target is projective by hypothesis. No Hom
   exactness for W is used. For the injectivity assertion, a projective
   factorisation of the induced map is removed by one homotopy component
   h^1. After this removal, h^1=0 and f^0 lifts through d_W^{−1}.
   The negative residual f^n−h^{n+1}d_P^n is killed by d_W^n using the
   chain equation and the already solved homotopy equation at n+1.
   The positive residual f^n−d_W^{n−1}h^n kills d_P^{n−1} using the
   equation at n−1; it extends to h^{n+1}. The two recursions do not
   overwrite each other and produce all components in the product Hom.
   Passing to cokernels respects composition. The same construction
   applies to P[−a],W and P,W[a], with no support restriction or
   assumption of total acyclicity for W. For a>0, the truncated
   resolution computes Ext as maps C^{−a}(P)→N modulo maps extending
   to P^{−a+1}. The extension property identifies that denominator
   with maps factoring through finite projectives, including a=1.

5. **Vanishing (2.3) and stable-category compatibility, lines 281–301.**
   For a>0 the three terms determining degree-a Hom cohomology are
   unchanged by truncation at P^0. Exactness into a projective L gives
   (2.3), including arbitrary projective L by the earlier direct-sum
   argument. Over E, comparison lifts identity maps in both directions
   and their composites differ from identities by nullhomotopies.
   This yields the stated equivalence with the stable category.
   C^0(P[1])=C^1(P) is a cosyzygy through P^1, so [1]=Ω^{−1};
   C^0(P[−1]) is a syzygy in the stable category. Nonminimal choices
   add only projective summands and do not conflict with the report's
   chosen syzygy convention. T_F preserves these constructions and
   the termwise compositions used later.

The comparison assertion about additive functors is read on its stated
domain: functors which act on the specified resolutions and their cokernels.
In its application T_F satisfies these requirements and preserves
projectives, homotopies and shifts; no assertion for arbitrary non-exact
additive functors is needed.

## Completed checks: triangular modules and the cone

All mathematical deductions in this section have status **AI-proved**;
each numbered item has verdict **no error found**.

6. **Triples, columns and projective criterion, lines 303–364.**
   The lower-left block F has its right E-action from the upper-left
   diagonal and its left E-action from the lower-right diagonal. The
   multiplication and action in §3 are associative with exactly these
   sides. Thus the structure map is F⊗_E M→N for left modules; no
   opposite algebra is missing. The condition βη=η'T_F(α) gives both
   adjunctions (3.2). Multiplication by either idempotent is exact, so
   exactness is componentwise. L_1 is exact by right flatness of F,
   and both columns preserve projectives because L_i(E)=Λe_i.
   For a direct summand of Λ^r, the decomposition of both components
   also decomposes the structure map and its cokernel. Therefore its
   top and structure-map cokernel are projective and its structure map
   is injective. Conversely, splitting the cokernel sequence produces
   L_1(M)⊕L_2(coker η). This checks both directions of the criterion.

7. **The four Hom spaces (3.4), lines 366–379.**
   For L_1→L_2, the top map vanishes, and the identity structure map
   on the source forces the bottom map to vanish. The other three
   spaces have exactly the stated free coordinate. Composing on the
   target side gives T_F(g), whereas composing on the source side
   gives j. These are ordinary Hom identities before passing to any
   stable quotient, so the fourth matrix block really vanishes in
   every degree of the product Hom complex.

8. **Column total acyclicity and the signed cone, lines 383–429.**
   Decomposing the left regular module as the two columns gives (4.1).
   Total acyclicity of P supplies exactness into E and into the finite
   projective left module F. Both columns therefore satisfy all three
   requirements for total acyclicity over Λ. The lift in §2.2 induces
   the actual v_0, not just its stable class. The off-diagonal entry
   of d_{P_Z}^{r+1}d_{P_Z}^r is
   d_{G_0}^{r+1}V^{r+1}−V^{r+2}d_{G_1}^{r+1}, which is zero by the
   chain equation. The cone sequence is split on terms. Its ordinary
   cohomology sequence gives exactness, and applying Hom(−,Λ)
   retains a short exact sequence because restriction along each split
   inclusion is surjective. The outer Hom complexes are exact by
   (4.1). No injectivity or symmetry of Λ is being assumed.

9. **Literal module, dimensions and (4.7), lines 431–475.**
   Removing the image of T_F(d_P^{−1}) leaves T_F S⊕Q. The remaining
   image is exactly {(v_0(s),−i(s)):s∈S}, since P^0→S is onto.
   The map (t,q)↦(t,−q) converts this submodule into the plus-sign
   submodule in (1.2). It fixes the first summand, so together with
   id_S it is an isomorphism of Λ-modules, not just of vector spaces.
   Injectivity of i implies injectivity of the relation map and of
   iota. The projection to Q/i(S) has precisely the asserted kernel:
   [t,i(s)]=[t−v_0(s),0]. This also gives all three displayed
   dimension formulas. Total acyclicity of P_Z and the literal
   cokernel isomorphism imply Gorenstein-projectivity of Z; (2.3)
   supplies Ext^a_Λ(Z,Λ)=0 for every a>0.

## Completed checks: self-extensions and non-projectivity

All mathematical deductions in this section have status **AI-proved**;
each numbered item has verdict **no error found**.

10. **The chain map delta and Tate identification, lines 480–500.**
    The differential obeys the graded composition rule; f has degree
    zero and ∂f=0. Hence ∂(T_F(g)f−fj)=T_F(∂g)f−f∂j.
    On degree-a cocycles, the two compositions induce T_F(g)v and
    v[a]j respectively. The shift of the degree-zero f has no extra
    sign. The comparison established above therefore gives exactly
    (1.1) in every integer degree.

11. **Endomorphism differential (5.3)–(5.4), lines 502–535.**
    An independent indexed multiplication gives the upper-right block
    of ∂Φ at source degree r as

    ```text
    (−1)^n [ d_T^{r+n} h^{r+1}
              + (−1)^n h^{r+2} d_P^{r+1}
              + f^{r+n+1} j^{r+1}
              − T_F(g^{r+1}) f^{r+1} ].
    ```

    Here d_T=d_{T_FP}. The first two terms are (∂h)^{r+1},
    because h has degree n−1. The last two are
    −boldsymbol-delta(g,j)^{r+1}. The coordinate sign in degree n+1
    is (−1)^{n+1}, so the third coordinate is delta(g,j)−∂h.
    The upper diagonal is ∂g; the actual lower diagonal is
    (−1)^{n+1}∂j, giving coordinate ∂j. This checks both parities,
    including characteristic two, and all source indices. Squaring
    the resulting differential gives zero since delta is a chain map.

12. **Exact sequence, connecting map and Ext, lines 537–577.**
    K[−1]^a=K^{a−1} and d_{K[−1]}=−∂, so both maps in (5.5)
    are chain maps. The graded splitting is sufficient for its long
    exact cohomology sequence. The boundary of the diagonal lift
    (g,j,0) is (0,0,delta(g,j)); thus the connecting map is delta^a
    with the displayed sign. The neighbouring segment is
    H^{a−1}(H²)→H^{a−1}(K)→H^a(End P_Z)→H^a(H²)→H^a(K),
    giving (5.6). Comparison over the possibly non-self-injective Λ
    is applicable because P_Z is totally acyclic. It gives ordinary
    Ext for a>0, and stable End for a=0, exactly as in (5.7).
    For a=1 one needs surjectivity of delta^0 and injectivity of
    delta^1; for a>1 one uses surjectivity in degree a−1 and
    injectivity in degree a. This accounts for every positive degree.
    The unconditional formula (5.6), and its stated consequence when
    delta^1 is injective, require no omitted bijectivity assumption.

13. **Non-projectivity and hypothesis accounting, lines 579–613.**
    A nonzero kernel of delta^0 forces stable End_E(S) to be nonzero,
    hence S cannot be projective. A projective Λ-module has
    projective top component by item 6, so Z cannot be projective.
    Independently, (5.6) at a=0 surjects from stable End_Λ(Z) onto
    the same nonzero kernel. It does not require any condition on
    delta^{−1}. The table correctly distinguishes left and right
    projectivity of F. Symmetry is used only for the injectivity of
    finite projectives and the supply of finite projective embeddings;
    the asserted weakening retains exactly those properties. Neither
    minimality, a trace, Tate duality, simplicity of S nor bimodule
    projectivity over E^e enters the argument.

14. **Result 8.1, lines 92–109.**
    Items 1–13 give all four conclusions for every permitted choice
    of representative v_0 and injection i into a finite projective Q.
    The splicing starts with that exact i and Q, the lift induces that
    exact v_0, and the cokernel is identified with the stated plus-sign
    quotient. The proof therefore covers the universal choice wording.
    Its integer indices cover all a>0, with a=1 treated separately.
    No characteristic restriction is lost in the argument.

## Attempts to break the statements on small examples

These are hand calculations, with status **supported** for the stated
examples. They do not test a concrete instance satisfying all hypotheses
of Result 8.1; they test the auxiliary formula, the signs and the excluded
degenerate cases. No earlier script or saved result was read or run.

1. **Field, zero module, zero bimodule.** For E=F=S=Q=k,
   i=id and v_0=λ, the plus-sign quotient is k via
   [t,q]↦t−λq, and Z=L_1(k). All stable groups vanish, so the
   nonzero-kernel hypothesis fails as required. If S=0, then
   Z=L_2(Q) is projective and the same hypothesis fails. If F=0,
   then Λ=E×E and Z=(S,Q/i(S)); the off-diagonal Hom complex is
   zero and the diagonal terms of (5.6) remain. None of these cases
   supplies a counterexample by accidentally meeting the hypotheses.

2. **Dual numbers, including odd characteristic.** Let
   E=k[ε]/(ε²), F=E, S=k, Q=E and i(1)=ε. Use the complete
   resolution with P^r=E and every differential multiplication by ε.
   For a degree-a map with component α_r+β_r ε, the cocycle equation
   is α_{r+1}=(−1)^a α_r. Boundaries remove any β-sequence: solve
   γ_r+(−1)^a γ_{r+1}=β_r recursively in both directions from γ_0.
   Thus its full Hom cohomology is k in every integer degree; the odd
   shift signs are detected over fields of characteristic different
   from two.

   For v_0=id, the quotient is E via
   [t,a+bε]↦a+(b−t)ε, and its structure map is t↦−tε.
   An ordinary endomorphism of this triple is (c,c+bε), so End has
   dimension two. A map through a projective has zero top component,
   since every k→E^r→k composite is zero, so its bottom component is
   a multiple of ε. Conversely all those multiples factor through
   L_1(E). The stable endomorphism space therefore has dimension one.
   The projective surjection L_1(E)⊕L_2(E)→Z has top reduction E→k
   and bottom (x,y)↦−εx+y. Its kernel is (k,E,+ε), isomorphic to Z
   by negating the bottom component. Restriction of maps from this
   projective to its kernel has exactly the one-dimensional
   ε-multiple image. The resulting periodic resolution gives
   dim Ext^a_Λ(Z,Z)=1 for every a>0. This agrees with (5.6):
   delta^a:k²→k is (g,j)↦g−j, hence is onto with a one-dimensional
   kernel. In particular positive-degree bijectivity fails, and the
   theorem does not incorrectly assert rigidity for this example.

   For v_0=0, the quotient instead gives Z=L_1(k)⊕L_2(k).
   Apply the two column functors to the ordinary ε-resolution of k.
   The four Hom blocks into Z have dimensions 1,1,0,1 and zero
   differentials. Thus dim Ext^a_Λ(Z,Z)=3 for a>0, in agreement
   with the two-dimensional kernel and one-dimensional cokernel
   in (5.6) when delta=0.

3. **An exact target which is not totally acyclic.** This example
   was suggested by the comparison delegate and recalculated here.
   Let B=kQ/J², with a loop x:1→1 and an arrow y:1→2, and paths
   multiplied right to left. On the left regular B-module let
   d(b)=b(x+y), and repeat this in every cochain degree. Since
   d(e_1)=x, d(e_2)=y and d(x)=d(y)=0, the periodic complex W_B
   is exact: its image and kernel are both span{x,y}. Under
   Hom_B(B,B)=B^op, the differential is, up to its degree sign,
   left multiplication by x+y. Its image is span{x+y}, of dimension
   one, while its kernel has dimension three. Thus W_B is not
   totally acyclic. For R=E×B with E the dual numbers, take P the
   ε-periodic complex in the E-factor and W=P⊕W_B. Cross-factor
   maps vanish, so Hom_R(P,W)=Hom_E(P,P), whose cohomology was just
   computed. Both stable-Hom expressions in (2.2) also reduce to
   stable Hom_E(k,k)=k in every degree. This checks a genuinely
   non-total target within the lemma's stated generality, although
   the product decomposition deliberately makes the extra summand
   orthogonal to P.

## Citation and source-locator checks

No reference was taken from model memory. A search of
`library.bib` by the two arXiv identifiers and titles gave no
matches. Both papers were read through the browser without downloading
or importing a file. Page numbers below are printed PDF page numbers.

| Source and version actually read | Locators checked | Verdict |
|---|---|---|
| OpenAI, local `.cache/ar-src/` snapshot, title and date in `main.tex` | Entire `01-stable.tex` and `02-conversion.tex`, including `conv:proposition`, `conv:comparison` and both proofs; relevant bibliography entries | No error found in the comparison with the frozen dossier. |
| Oana Veliche, [math/0406057, PDF marked v1](https://arxiv.org/pdf/math/0406057) | §1.1.1 p. 3; §2.1.1 p. 7; §2.2.1 p. 8; §2.3.1 p. 8; §2.3.2 p. 9 | All listed locators exist and support the uses assigned to them. |
| Eshraghi–Hafezi–Salarian–Li, [1402.4595v1](https://arxiv.org/pdf/1402.4595v1) | Standing left-module conventions, §2 pp. 2–3; Lemma 2.1 p. 3; Lemma 2.2 and proof pp. 3–4 | All listed locators exist and support the uses assigned to them. |

Veliche's §2.1.1 condition (3) reads “Hom_R(T, Q) is exact for every
projective R-module Q” (mathematical typography transcribed). Reversing
homological indices converts §1.1.1 to (1.3), including the product and
the sign. The dossier explicitly distinguishes its complete-resolution
terminology from the diagram in §2.2.1. The finite-term definition and
the vanishing in (2.3) match §§2.3.1–2.3.2. The URL with an explicit
`v1` initially failed to fetch; the unversioned PDF was accessible and
itself displays `arXiv:math/0406057v1`. No published-version page
numbering is being asserted. [Source](https://arxiv.org/pdf/math/0406057).

In the triangular-ring source, Lemma 2.1 includes the condition
“X ∈ Proj(R) and Coker(ϕ) ∈ Proj(S)” (mathematical typography
transcribed), along with injectivity of ϕ. Its lower-triangular
orientation agrees with the dossier. Lemma 2.2(i) assumes preservation
of acyclic projective complexes by tensoring; right projectivity of F
supplies that here. Part (ii) assumes Add(F) lies in the Ext¹ right
orthogonal of Gorenstein-projectives; left projectivity supplies that,
since sums and summands of copies of F are projective. These conditions
are not silently dropped. The dossier supplies its own finite-term
argument (4.1). [Source](https://arxiv.org/pdf/1402.4595v1).

For the local OpenAI source, `main.tex` lists introduction, stable maps,
then conversion, and those three files each begin a numbered section.
The conversion principle is therefore in §3 of this snapshot. Its
characteristic-two hypothesis explains its plus signs and unsigned
shifts. The dossier's extension to arbitrary characteristic is supported
by the signed calculation above and the explicit isomorphism (4.5),
rather than by attributing a stronger theorem to the source.

No prohibited audit or earlier computation was opened to check the
dossier's claims about its previous reviews. Those historical claims
are outside this mathematical verification. The binding notation file's
unrelated locators for Tate duality and Toda brackets are not premises
of Result 8.1 and were not audited. No main-preprint section in `build/`
is cited as a premise of this conversion argument, so none was needed.

## Wording versus proof

**No mismatch found** among Result 8.1 and its supporting mathematical
statements. In particular:

- The proof works for every prescribed v_0, i and Q, not just convenient
  choices up to stable equivalence.
- The comparison lemma allows an exact projective W which is not
  totally acyclic; its proof supports that wording.
- Arbitrary characteristic is supported by the signs actually written.
- The degree-zero identification is stable End, as stated; it does not
  identify ordinary End with cohomology of a complete resolution.
- The weakening of symmetry in §6 retains the two exact properties used.

The provisional outline in §0 has the minus-sign cone quotient. The
completed proof identifies it with the statement's plus-sign quotient
in (4.5); this is not an unresolved discrepancy. No proposed repair is
needed on the evidence found in this review.

## Final verdicts

| Statement or supporting unit | Frozen lines | Verdict |
|---|---:|---|
| Result 8.1, including all choices and all positive degrees | 62–109 | No error found |
| Tate map, product Hom, shifts, total-acyclicity convention | 70–150 | No error found |
| Symmetry and prescribed complete resolutions | 156–190 | No error found |
| Extension property and comparison lemma (2.2) | 194–279 | No error found |
| Projective-target Ext vanishing (2.3), stable-category compatibility | 281–301 | No error found |
| Triangular modules, adjunctions and projective criterion | 303–364 | No error found |
| Four Hom blocks (3.4) | 366–379 | No error found |
| Column and cone total acyclicity (4.1)–(4.3) | 383–429 | No error found |
| Prescribed cokernel, dimensions and (4.7) | 431–475 | No error found |
| Delta chain map and full endomorphism differential | 480–535 | No error found |
| Connecting map, (5.6)–(5.7), all positive self-Ext vanishing | 537–577 | No error found |
| Non-projectivity and hypothesis accounting | 579–613 | No error found |
| Mathematical wording versus proof | 62–613 | No mismatch found |
| Cited source locators used for this argument | 127–128, 148–150, 288, 362–364, 400–402, 617–650 | No error found |

No mathematical error or unresolved proof gap was found within this
scope. This is an AI proof check, with independently recalculated hand
examples and directly read citation locators. It is not human
certification or formal verification. The prior statuses, scripts and
same-model review mentioned in §8 were not used as evidence.
