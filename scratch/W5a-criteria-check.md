Model: unknown; effort: unknown.

# W5a independent criteria check

Scope: independent adversarial mathematical review of section 3 and definitions in section 2. Manuscript read-only; substantive findings are proposals for parent review. No previous audit verdict is used as evidence. Status of mathematical conclusions here: AI-proved where a complete argument is recorded, cited only for source statements read directly; no human certification.

Instructions read: AGENTS, README, PROGRESS, working rules, task W5a, full review protocol, full mathematical-writing and preamble style files, AI writing/research process. Genre: existing wholly AI-written research article; autonomous review within the parent-assigned read-only subtask.

Initial coverage, to be extended:

| Anchor | Status | Mathematical check |
|---|---|---|
| 02-preliminaries.tex:4 `Throughout` | clean | Handedness, path and shift conventions; projective-cover syzygy and minimal transpose definitions coherent. |
| 02-preliminaries.tex:72 `Let ... triangulated` | clean | Defining systems exist by triangle exactness; varying the lifts gives exactly the stated sum of indeterminacies because the cross-term factors through qi=0. |
| 02-preliminaries.tex:90 `In the situation above` | clean | Precomposition by u[1] gives the claimed defining system, with no extra sign. |
| 02-preliminaries.tex:107 `For an algebra` | clean | Square-zero multiplication, bimodule actions, trace symmetry and nondegeneracy checked. |
| 03-criteria.tex:10 `Let ... abelian category` | clean | Enough projectives gives the required Ext test; dimension shifting starts at c1 nonprojective and works for all n>=1. |
| 03-criteria.tex:49 `Let A be ... E` | clean | Dual exactness includes Hom=0; C0=P0* produces the intended indices, nonzero E excludes split first inclusion, and each Cn is the minimal transpose of the indicated syzygy. |
| 03-criteria.tex:76 `Since ... Ext` | clean | Finite-projective-dimension nonzero module has nonzero top Ext into A, by minimality of the terminal nonzero differential. |
| 03-criteria.tex:91 `Let C be an A-module` | clean | Transpose involutivity uses the no-projective-summands assumption; dual exactness and left add A approximations are equivalent by Hom(-,A) surjectivity. |
| 03-criteria.tex:123 `If a finite-dimensional algebra` | clean | Each Cn embeds into a finite projective; Krull-Schmidt and maximal projective dimension of finite direct sums give infinitely many distinct indecomposable summands. |
| 03-criteria.tex:148 `Let Lambda be` | clean | Right approximations exist because Hom(G,K) is finite dimensional; F is exact on their sequences, and the Hom(-,G)-acyclic resolution computes Ext. Opposite-algebra conclusion has correct side. |
| 03-criteria.tex:199 `Let S be a simple right` | clean | The unit kernel/cokernel lie in mod(A/AfA); Hom/Ext1 orthogonality gives double centraliser. Full Ext vanishing removes the S-injectives; restriction produces an injective resolution over B and the stated higher Ext vanishing. |

Pending: primary-source locators, triangular derived argument, bounded-dimension argument and complete coverage list.

## Completed mathematical checks

The following supplements the initial table; statement/proof blocks are distinguished here for parent integration.

| Anchor | Status | Result |
|---|---|---|
| 03-criteria.tex:4 `This section collects` | clean | The reduction summaries match the results that follow. |
| 03-criteria.tex:22 `A short exact sequence` | clean | Upper bound, n=1 base case and higher Ext witness all checked. |
| 03-criteria.tex:43 `The following statement` | clean | CB19 §3.2 Proposition 5 directly supports the historical mechanism and correct opposite side. |
| 03-criteria.tex:62 `The complex` | clean | Exactness starts with P0*, split/reflexivity contradiction preserves E, and transpose indices agree. |
| 03-criteria.tex:88 `The modules C_n` | clean | C1 has pd 1 and its transpose gives the original projective-free witness; criterion is correctly formulated on projective-free C. |
| 03-criteria.tex:108 `Choose a minimal` | clean | Every dualisation and splice has the required exactness. Projective-free transpose involutivity supplies TrTrC ≅ C. |
| 03-criteria.tex:130 `The indecomposable summands` | clean | Each Cn is torsionless via Cn ↪ P(n+1)*; finite decomposition and pd=max yield the contradiction. |
| 03-criteria.tex:140 `The Auslander--Reiten conjecture` | clean | AR75a Theorem 1.1(b) is the stated generator-to-generalised-Nakayama implication. |
| 03-criteria.tex:162 `Write F=Hom` | clean | Resolution, acyclicity and Γ/Γ^op sides checked independently. |
| 03-criteria.tex:190 `Replacing M` | clean | Additivity preserves Ext vanishings and Krull-Schmidt counts exactly one new indecomposable summand. |
| 03-criteria.tex:195 `Conversely` | clean | Corner proposition supports this converse with right-B conventions explicit. |
| 03-criteria.tex:216 `For a right A-module` | clean | Unit/counit adjunction, induction on A/AfA-length, and splitting all check; A/AfA has only the one removed simple type. |
| 03-criteria.tex:232 `Assume now` | clean | Minimal injective socles detected by Ext(S,A); f-restriction sends the surviving injectives D(Ae_t) to D(Be_t). |
| 03-criteria.tex:243 `The two vanishing conditions` | clean | Quiver basis and dual maps explicitly recomputed; the corner M is the right simple at 2 over k(1→2), and Ext_B^1(M,B)=Be1/ka ≠ 0. |
| 03-criteria.tex:256 `Triangular matrix algebras` | clean | Follows from the two cases of the next proposition. |
| 03-criteria.tex:259 `Let A=...` | clean | Right triples and cone side checked; Z lies in D^- of finite B-modules without flatness of M. |
| 03-criteria.tex:271 `Let e=diag` | clean | The triangle comes from j_! ⊣ (-)f; RHom(j_!Y,eA)=0, i_* is fully faithful, and eA=i_*B. The minimal-complex dual yields left B-modules of all positive finite projective dimensions. For Z=0, adjunction with fA yields RHom_C(Y,C)=0. |
| 03-criteria.tex:287 `Finally` | clean | Hap90 §2.3 p.5 and GLS23 v2 Corollary 2.6 p.8 checked in Library sources with algebraically closed base explicitly distinguished. |
| 03-criteria.tex:294 `Let A ... d` | clean | Tor against A/J detects projective dimension for finite A-modules; fixed-vector rank loci are open and noetherian. The zero-module/empty-locus cases give no counterexample. |
| 03-criteria.tex:304 `Let J be` | clean | Free terms have fixed dimension, matrix entries are polynomial, rank sum reaches the middle dimension exactly at vanishing homology. The increasing opens stabilise by noetherianity. |
| 03-criteria.tex:318 `In Theorem ... dimension` | clean; locator refinement below | Minimal cover P0 has dim≤dim(A)dim(N), kernel has at most that dimension, and its cover P1 and dual have dim≤dim(A)^2dim(N). Bounded syzygy dimensions would bound all transposes, contradicting their unbounded finite pd. Schulz Example 7 matches the moving-parameter claim. |

The formalisation-status remarks at 03:35–38 and 81–86 require repository/Lean receipt checks assigned to the parent; this mathematical check does not certify them. The Tate-duality source and its graded compatibility in section 2 are being checked independently by the parent. No original mathematical theorem in section 3 required a changed statement, hypothesis or argument.

## Primary sources read directly

- CB19: online lecture-note PDF at <https://www.math.uni-bielefeld.de/~wcrawley/1920noncommalg2/NA2.pdf>, §3.2 Proposition 5, printed p.63 / PDF p.65. The proof explicitly uses fin.dim(A^op) and the dual exact complex. Short quoted anchor: “the strong Nakayama conjecture”.
- AR75a: Library PDF `AR75a - On a Generalized Version of the Nakayama Conjecture.pdf`, published 1975 version, p.71, Theorem 1.1(b). The source defines End(A,M)=(End_A(M)^op,P) before the theorem and uses a nonprojective generator with positive self-Ext vanishing. This translates to G=Λ⊕M in the manuscript. OCR `i > I` means i≥1, checked against the theorem's mathematical content and printed setting; this will be visually checked below.
- Hap90: Library PDF `Hap90 - Homological Conjectures in the Representation Theory of Finite Dimensional Algebras.pdf`, version supplied by the library (undated document, bibliography key 1990), §2.3, last proposition and proof on printed p.5. Quote: “We sketch the proof using some ideas from [Sc].” The same proof forms fixed-length module varieties and ascending projective-dimension open subsets. Its standing field is algebraically closed.
- GLS23: Library PDF `GLS23 - Semicontinuous Maps on Module Varieties.pdf`, arXiv:2302.02085v2, manuscript date June 10, 2024. Corollary 2.6 p.8 gives upper semicontinuity of ext_A^i(M,M'); §1.1 and the conventions fix an algebraically closed base. Fixed-dimension-vector loci are discussed in §2.1.
- Schu95: publisher PDF linked at <https://doi.org/10.1017/S1446788700037265>, published 1995 version, Example 7, pp.372–373. For p≠0 not a root of unity and the four-dimensional quantum exterior algebra, syzygies of (x+y)R are (x+(-p)^i y)R, each two-dimensional. This is the intended family; no modification of the mathematical claim is needed.

## Citation proposal (no manuscript edit)

The style file requires precise locators for specific imported facts. The cited moving-parameter family is Example 7, not the article as a whole. Minimal locator refinement at current line 322:

```diff
--- a/report/sections/03-criteria.tex
+++ b/report/sections/03-criteria.tex
@@ -322,1 +322,1 @@
-parameter, such as those of Schulz~\cite{Schu95}, cannot be witnesses by
+parameter, such as those of Schulz~\cite[Example~7]{Schu95}, cannot be witnesses by
```

No manuscript edits applied. No optional rephrasing or restructuring proposed.

Visual completion: AR75a printed p.71 was rendered from the Library PDF and inspected. Theorem 1.1(b) explicitly has `i ≥ 1`; its statement, the nonprojective-generator assumption, and the endomorphism-pair notation all agree with the report's use. The PDF skill was used for this read-only inspection. No primary-source issue remains in the five section-3 citations examined.
