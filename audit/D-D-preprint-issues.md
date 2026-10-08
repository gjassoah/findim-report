Model: GPT-6 (Codex); effort: unknown.

# D-D. Source comparison and issue record

Date: 2026-10-08. Scope: the Auslander–Reiten preprint, local sources
`.cache/ar-src/01-stable.tex` and `.cache/ar-src/02-conversion.tex`, compared
with the proof dossier `report/notes/proofs/D-D-conversion.md`.

The initial independent attempt was recorded in the dossier §0 before the
source proofs were opened. The comparison below concerns the mathematical
source and the report's conventions, not source prose style.

## Input snapshot and scope

The source identifies itself as OpenAI, *An explicit counterexample to the
Auslander–Reiten conjecture*, September 23, 2026. No arXiv version is inferred.
The two assigned files were read in full, as were the relevant title,
inclusion order and bibliography entries in `main.tex` and `refs.bib`.

| File under `.cache/ar-src/` | SHA-256 |
|---|---|
| `main.tex` | `c4da7a8976713e71ad392c2dfa451c216436f5fcf09cce609f85236abfe64208` |
| `01-stable.tex` | `598837f4705df91bbae832abe9809bd601fef9c636a7395aa670e97a7d61edeb` |
| `02-conversion.tex` | `816fd48bbb39b30678b89175bfbafc2b06dbca4ab244935d17ecb37a2c76daca` |

Source `A,X` become report `E,S`; the preprint's column functors `E,J`
become `L_1,L_2` to avoid collision with the base algebra. Homological
degree `j` becomes cohomological degree `−j`. Stable `[1]` remains cosyzygy.

The mathematical scope is Result 8.1, including its foundations used here.
The later construction of a particular `F,v` is outside this job. The
general triangulated-category assertions in `01-stable.tex` were read,
but the dossier neither uses nor purports to reconstruct all triangulated
axioms: its complete-resolution comparison supplies the shifts and Hom
identifications needed by the conversion proof.

## Findings and differences

No mathematical error was found in the conversion proposition or its proof
under the source's characteristic-two hypotheses. The following differences
are recorded to prevent errors when importing it into the report.

| ID | Source locator | Kind | Finding and treatment |
|---|---|---|---|
| D-D.1 | `main.tex`, the consecutive inclusions of `01-introduction`, `01-stable`, `02-conversion`; each begins with a numbered section | Locator correction | The conversion is §3 in this snapshot, not ‘AR §2’ as in the task/outline description. Use `conv:proposition`, `conv:comparison` and the source filenames as stable locators. This is not a mathematical error. |
| D-D.2 | `01-stable.tex:10–17`; `02-conversion.tex:28–43,63–76,229–235` | Characteristic and grading | The source deliberately suppresses signs in characteristic two. Over arbitrary `k`, the report must use `∂f=d_Qf−(−1)^a f d_P` and the cone differential with lower block `−d_P`. Dossier (1.3), (4.2) and (5.3)–(5.4) supply these signs. No characteristic restriction is necessary for Result 8.1. |
| D-D.3 | `02-conversion.tex:38–41,267–273` (`conv:delta`) | Connecting-map convention | With the explicit shifted endomorphism coordinates of dossier (5.3), the connecting map is `(g,j)↦T_F(g)v−v[a]j`. The source's plus formula agrees in characteristic two. Over another field, replacing `j` by `−j` identifies the plus and minus formulas and preserves all the stated hypotheses. No source sign error was found. |
| D-D.4 | `02-conversion.tex:45–52,239–245` (`conv:finite-module`) | Literal cokernel identification | With cochain differential `d_P^0=iε`, the signed cone gives relations `(v_0(s),−i(s))`. Its bottom quotient is isomorphic to the source's plus-sign quotient by `(t,q)↦(t,−q)`, preserving the first summand and hence the triangular structure map. In characteristic two this is the identity. Dossier (4.4)–(4.5) records the isomorphism; merely copying the sign-free cokernel sentence would omit it. |
| D-D.5 | `01-stable.tex:21–25,49–58`; `02-conversion.tex:198–216` | Hypothesis usage | Symmetry is used through finite projectives being injective and finite modules embedding in finite projectives. The tensor step separately uses right and left projectivity of `F`. The proof uses neither a symmetrising trace after this reduction nor Tate duality. These are scope observations, not objections to the source's stronger hypothesis. |
| D-D.6 | `02-conversion.tex:176–196` | Expanded foundation | The source gives the columns and all four Hom spaces. The dossier additionally gives the full projective-triple criterion and its proof, as requested in D-D. No missing step needed by the source argument was found here. |
| D-D.7 | `02-conversion.tex:78–158` (`conv:comparison`) | Comparison checked | Only the source complex must be totally acyclic; the target may be merely exact with projective terms. The extension property is supplied by total acyclicity, not by injectivity of projectives over `Λ`. The two recursive constructions are valid in the full product Hom complex. The dossier reconstructs them with cochain indices in §2.2. No gap was found. |
| D-D.8 | `02-conversion.tex:248–286` (`conv:end-sequence`, `conv:end-cohomology`) | All-degree calculation checked | The vanishing opposite block is an ordinary Hom vanishing, so the three-block endomorphism calculation is valid before passing to cohomology. The kernel is the shifted mixed Hom complex. The displayed short exact sequence yields `coker δ^{a−1}` and `ker δ^a`; the degree-one endpoint really needs surjectivity of `δ^0`. Dossier (5.3)–(5.7) checks this with all signs. |
| D-D.9 | `02-conversion.tex:288–293` | Alternative proof | The source obtains non-projectivity from non-zero stable End of `Z`. The dossier also observes that `ker δ^0≠0` forces `S` non-projective, whereas every projective triangular module has projective first component. Both arguments are valid; no information about `δ^{−1}` is needed. |
| D-D.10 | `02-conversion.tex:295–301` | Regular-target Ext checked | The positive Hom degrees of the complete complex agree with those of its resolution tail. Total acyclicity therefore gives `Ext^{>0}(Z,Λ)=0`. The dossier records this through the general truncation argument (2.3). This does not require `Λ` to be self-injective. |

The report's minimal-syzygy convention causes no change in the conclusion:
the arbitrary complete-resolution cokernels represent the same syzygy and
cosyzygy objects in the stable category. They are not asserted to be the
chosen minimal syzygies as ordinary modules.

## Literature check

The preprint explicitly cites only Veliche §1.1.1 and Eshraghi et al. §2
in the assigned conversion section. The library was searched first for their
titles, authors, arXiv identifiers and filenames. Neither work was found;
the primary arXiv PDFs were read online without downloading or modifying
the library. The parent agent reread the locators supplied by retrieval.

- **Veliche**, *Gorenstein projective dimension for complexes*,
  [arXiv:math/0406057v1](https://arxiv.org/pdf/math/0406057).
  The PDF identifies v1 on its first page; the direct versioned endpoint
  failed once, so the unversioned endpoint serving that labelled PDF was
  read. Locators read: §1.1.1 p. 3; §2.1.1 p. 7; §2.2.1 p. 8;
  §2.3.1 p. 8; §2.3.2 p. 9. Short verbatim excerpt from §2.1.1(3):
  ‘Hom_R(T, Q) is exact for every projective R-module Q.’
  The source uses left modules over associative rings and homological
  complexes. Its full complete-resolution diagram is more general than
  the cokernel-equipped totally acyclic complex needed here. These are
  arXiv locators; no published-page locator is asserted.
- **Eshraghi–Hafezi–Salarian–Li**, *Gorenstein Projective Modules Over
  Triangular Matrix Rings*,
  [arXiv:1402.4595v1](https://arxiv.org/pdf/1402.4595v1).
  Locators read: §2 pp. 2–3, Lemma 2.1 p. 3, Lemma 2.2 statement p. 3
  and proof p. 4. Short verbatim excerpt from Lemma 2.1:
  ‘A Γ-module (X, Y )ϕ is projective if and only if the following
  statements are satisfied.’ The source has left modules over
  `[[R,0],[M,S]]`, agreeing with the report's orientation. Lemma 2.2 has
  extra hypotheses about tensor acyclicity and `Add(M)`; the dossier
  directly checks the needed column complexes instead of invoking it
  without those hypotheses.

No unverified locator is used as a proof premise. These sources document
the conventional foundations; all required mathematical facts are supplied
with proofs in dossier §§2–4. No priority claim is made for those proofs.

## Checks and status

The initial attempt was written before the source proof was opened. The
parent then compared it against the full source proof and completed the
dossier. An independent agent supplied another source-unread derivation;
it was treated as a lead and checked in the written argument.

The new exact sign script `computations/D-D-cone-signs.py` and saved
`computations/D-D-cone-signs.out` check formal noncommutative identities
over the integers and modulo two for both parities of the degree. The
parent read and reran the script successfully. This is a sign check, not
a finite computation offered as a proof in all Ext degrees.

Result 8.1 and the supporting arguments in dossier §§1–6 have status
**AI-proved**. The source-comparison verdict is **no error found in the
assigned conversion proof**; this is not human certification. The local
locator mismatch and the required arbitrary-characteristic translations
are listed above.

The supplementary same-model review in `computations/D-D-review.md` found
no mathematical error or unresolved gap in dossier §§1–6. It checks the
full-product comparison, both lifting directions, shifted compositions,
the quotient sign, the indexed block differential and all-degree Ext.
The reviewer accidentally saw the latter part of the initial outline,
but not its status discussion; that limitation is disclosed in its record.
A separate subordinate check received only the comparison statement and
conventions. Neither reading is represented as a different-model check.
Only the placement of two equation tags changed in §§1–6 after the review.
