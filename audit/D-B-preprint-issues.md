Model: unknown; effort: unknown.

# D-B: comparison with the main preprint

Date: 2026-10-08. **No mathematical error or unresolved proof gap found
in the preprint passages checked for D-B.** This verdict has the scope
below; it is not human certification or a claim about the entire preprint.

The completed dossier is
[report/notes/proofs/D-B-realisation.md](../report/notes/proofs/D-B-realisation.md).
The proof text was written for report §§2.3, 6.1–6.6 and 5.3, in the
binding report conventions.

## Coverage and comparison

Line locators refer to the unchanged local source files in build/sections/.

| Source and locator | Checked | Finding or difference in the dossier |
|---|---|---|
| 03-localization-and-lifting.tex:23–64 | Finite quadraticisation; constant and linear terms; arrows and homogenisation; relation basis | No error found. Dossier supplies inverse presentation maps and records the dimension formula. |
| 03-localization-and-lifting.tex:69–107 | Directed global-dimension bound on both sides | No error found. The construction covers arbitrary modules, so it bounds ordinary global dimension. |
| 03-localization-and-lifting.tex:109–112 | Modules \(M(Y)\) and their relations | No error found. Dossier also gives exactness and full faithfulness. |
| 03-localization-and-lifting.tex:116–169 | Right projectives; left multiplication by paths; action \(\theta\); tensor evaluation and quotient factorisation | No handedness or order error found. No identification with a derived category of \(R\) is needed. |
| 03-localization-and-lifting.tex:190–250 | Two-cone odd double, exact Hom sequences for formal retracts | No error found. Dossier expands the cone calculation without using a triangulation on the completion. |
| 03-localization-and-lifting.tex:252–284 | Corner action \(e\alpha(r)e\); evaluation and full arrow actions | No error found. Centrality supplies multiplicativity in the stated special case. |
| 03-localization-and-lifting.tex:292–335 | Ore square, cancellation, right roofs, zero criterion and finite families | No error found. Dossier records exact Stacks locators and proves the two finite-family consequences separately. |
| 03-localization-and-lifting.tex:337–392 | Terminal-to-initial lifting and the final source-zero refinement | No error found. Every changed outgoing arrow is precomposed by the same denominator, preserving the squares and killing all relations. |
| 03-localization-and-lifting.tex:394–452 | Chain representatives, null-homotopies, uniformity in \(Y\), absence of a stable-flatness dependency | No error found. Dossier identifies where the proof makes existential choices without support bounds. |
| 04-tensor-realization.tex:36–137 | Three columns, all differential signs, bimodule structure, finiteness and right projectivity | No error found. Every entry of the square is checked. |
| 04-tensor-realization.tex:142–208 | Source-index filtration and vertex homotopy equivalences | No error found. The independence of the relation basis is necessary and already supplied at 03:55–63. Dossier adds a tensor contraction and an explicit homotopy inverse. |
| 04-tensor-realization.tex:210–233 | Arrow homotopies and absence of further coherence equations | No error found. The internal sign in column one cancels the homotopy differential term. |
| 04-tensor-realization.tex:235–281 | Realisation as an object of \(D^b(B\text{-mod})\) | No error found. Cohomology lies in degrees \(0,-3\); the splitting obstruction lies in \(\operatorname{Ext}^4\), which vanishes. |
| 04-tensor-realization.tex:284–303 | Binomial iterate formula | No error found. Objectwise splittings suffice; every iterated selection module remains finite dimensional. |
| 02-selection-process.tex:4–17 | Definition and action convention of \(H\) | Used only to fix \(H(Y)={}_{\alpha}(eY)\). The group construction is outside this job. |
| 05-ordinary-simulation.tex:4–11 | Input interface and definition of \(l\) | Only these input lines were checked by the root agent. The interval defining \(l\) is enlarged to contain zero; the dossier chooses its input support interval accordingly. The simulation proof is outside this job. |

## Clarifications and extensions, not preprint errors

1. **Grothendieck class.** The dossier adds a direct calculation in
   \(K_0(\mathcal Q)\). With \(C=\operatorname{Cone}(1-\theta(e))\)
   and \(V_0=\operatorname{Cone}(C[1]\to C)\), the actual triangles give
   \([C]=0\) and \([V_0]=[C]-[C[1]]=0\). Cancellation involving the
   formal object \(U\) in the completed category alone would not
   justify this conclusion in the uncompleted category. The preprint
   does not make that mistaken inference.

2. **Formal summand.** The task/context wording that \(U\) “only exists”
   in the completion must mean that its descent is not guaranteed.
   Universal nonsplitting would be false: \(e=0\) and \(e=1\) give
   descending objects. The preprint says “need not split”, which is
   appropriately qualified.

3. **Length.** The proof chooses roofs, common refinements and
   relation-annihilating denominators without giving matrices or
   bounding their supports. After these are supplied, rectification
   has explicit finite formulas and adds at most two to a common
   support width. The argument does not calculate \(l\) for the main
   example. This is a limitation of the supplied construction, not
   an impossibility theorem or a mathematical contradiction.

4. **Generalised selection.** Remark O.3' in
   notes/02-constraints-and-criteria.md:72–77 is completed in dossier
   §5.3. Replace \(E_0,\theta(e),e\alpha(r)e\) by
   \(E_0^{\oplus n},\theta_n(\varepsilon),\rho(r)\).
   Require a finitely presented unital \(k\)-algebra \(R\), a bimodule
   finitely generated projective on the right, and agreement of its
   scalar actions. Equivalently, \(\rho\) is a unital **\(k\)-algebra**
   map to the corner, with unit \(\varepsilon\). No centrality of the
   matrix idempotent is required. With those conventions the extension
   is AI-proved in the dossier. It is not an assertion made by the
   preprint itself.

## Proof process and checks

The initial extraction omitted proof environments but exposed inline
arguments for quadraticisation, fractions, the quotient action and
evaluation. The root agent does not claim an independent-before-source
attempt for those passages. A separate fresh-context agent was later
given their statements and wrote independent attempts before reading
the preprint or the dossier. That agent then read and challenged the
dossier and the source. The actual chronology is preserved in
computations/D-B-fresh-attempt-review.md.

Independent-before-source attempts for the odd double, diagram lifting,
rectification, realisation splitting and matrix extension are recorded
in the dossier and the supporting fragments. The root agent checked the
delegated mathematics before incorporating it. The fresh reviewer found
no substantive mathematical error or gap in the completed assigned
proofs. Two mathematical-escape formatting defects in the dossier were
corrected; these were not preprint defects.

The exact computation in computations/D-B-rectification-check.py was
read and rerun by the root agent; its output matched the saved
computations/D-B-rectification-check.out. It checks one algebra and
diagram over \(\mathbb Q\), with a nonzero null-homotopic relation
composite. It checks the differential square, arrow homotopies and
vertex cohomology maps. Removing the homotopy correction makes the
square nonzero in two degrees. The general statements depend on the
written proofs, not extrapolation from this computation.

No author certification, formalisation, or manuscript build is claimed.
No source or existing contextual note was edited by this job.

## Citation and version record

Read in the Stacks Project live version on 2026-10-08:

- [Lemma 4.27.11, Tag 04VH](https://stacks.math.columbia.edu/tag/04VH):
  category of right fractions.
- [Lemma 4.27.14, Tag 04VJ](https://stacks.math.columbia.edu/tag/04VJ):
  equality with a common denominator.
- [Lemma 4.27.16, Tag 04VK](https://stacks.math.columbia.edu/tag/04VK):
  localisation universal property.
- [Definition 13.6.7 and Lemma 13.6.6, §13.6](https://stacks.math.columbia.edu/tag/05RA):
  Verdier quotient as localisation at the cone system.
- [Lemma 13.6.8(2), Tag 05RJ](https://stacks.math.columbia.edu/tag/05RJ):
  exact factorisation of an exact functor killing the subcategory.

The dossier contains short verbatim locator anchors. These locators and
hypotheses were also read by the fresh reviewer. The source's contextual
references to Neeman–Ranicki–Schofield, Balmer–Schlichting and Keller
were not used as dependencies; their locators are **not verified in
this job**. No attribution audit of those contextual references is
claimed.

The main input is the September 23, 2026 release named by the task.
The mathematical reading used its local TeX source. No PDF-to-TeX
identity comparison was performed. SHA-256 fingerprints of the inputs:

| File | SHA-256 |
|---|---|
| paper.pdf | 1fb7f827f59dcca0f391c279c346e4e8bc941880c24ec30fe1cba2e9a319f89c |
| build/sections/02-selection-process.tex | 2dbb052ffbf54fd4d553df2ea707806b9bf05ae8477565c7f8fde936f532d948 |
| build/sections/03-localization-and-lifting.tex | 0a79346e7f7d6584c12afb45c48efd1d1c1dc8467867e8d7cd687e6a1d4dcc48 |
| build/sections/04-tensor-realization.tex | 4e8d713c6728c3a4120896dde1c8660a12b22153538d7860043352d50b270f60 |

Supporting computation fingerprints:

| File | SHA-256 |
|---|---|
| computations/D-B-rectification-check.py | a418cf63794a540a635ff913fab47376585b55e63a45a4227990e96d160bc331 |
| computations/D-B-rectification-check.out | f85f5280cddbc462615ca14c3139d719617447da2b2394f1e1f8a9953ee97950 |
