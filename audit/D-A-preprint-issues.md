Model: unknown; effort: unknown.

# D-A source comparison

Completed dossier comparison, 2026-10-08. Scope: report results 4.1,
4.2, 7.1 and 7.2;
main preprint Sections 5 and 6; Minamoto--Yamaura arXiv:1710.01469v1.
The dossier is `report/notes/proofs/D-A-trivial-extension.md`.

The independent attempts were written in the dossier before reading
the corresponding preprint proofs. Final proofs, source comparisons,
the MY translation, finite computations and statuses are in that note.
This is an AI assessment, not author certification and not a
fresh-context verification of the new dossier.

## Verdict within the assigned scope

No mathematical error or unresolved proof gap was found in the main
preprint's Proposition 6.1, Corollary 6.2 and the following MY remark,
Proposition 5.1 and its construction, or the proof of Theorem 1.1.
The lower bound \(2m-2\) and the order of its quantifiers survive
the checks below. The conclusion uses selection and realisation as
the task's explicit black boxes; those arguments are not covered by
this verdict.

Two items are recorded without treating them as errors in the main
preprint:

1. The simulation's bound \(3l+2\) can be improved to \(l+2\).
   The source's bound is sufficient and its directed-order argument
   remains valid.
2. MY v1, Lemma 4.13, page 18, has two notation slips: it omits
   the internal-grading superscript in the opening category, and
   part (3)'s final right-hand side needs \(M_0\) instead of \(M\).
   The dossier gives the field-case counterexample to the latter
   equality read literally. The main preprint cites part (4),
   which is not affected by either slip in this application.

## Result-by-result comparison

### D-A.4.1: bar decomposition

Source: Proposition 6.1, PDF pages 19--20;
`build/sections/06-square-zero-and-conclusion.tex:19-153`.

- The source's absolute bar terms are free over \(A\) because
  tensoring over the field gives a free leading \(A\)-factor.
  Splitting by the number of ideal entries is a decomposition of
  complexes: the ideal squares to zero and acts by zero at both
  endpoints. These facts do not assume that \(X\) is flat over
  \(\Delta\).
- Lines 90--111: the multiple-bar rescaling exponent
  \(\sum_{j=0}^r(r-j)i_j\) is correct. Reducing \(i_j\) by one
  changes it by \(r-j\); the source face and shifted total face
  differ by precisely this parity. The dossier gives the identity
  for arbitrary \(r,\boldsymbol i\) and checks the empty-block and
  length-zero cases.
- Lines 113--147: successive bar resolutions from the right compute
  the derived tensor factors. Non-positive degrees ensure finite
  diagonals, so ordinary direct-sum totalisation is appropriate.
  There is no hidden completion or replacement by ordinary powers.
- Difference of proof: the dossier uses a projective bimodule
  resolution \(Q\to X\), the dg algebra \(\Delta\ltimes Q\),
  an explicit contraction, and K-flat base change to \(A\).
  Its total-length sign convention is stated explicitly. It gives
  the same shift \([r]\) as the source.
- The MY attribution in lines 13--16 is appropriate in v1:
  Lemma 4.13(4), page 18, identifies the internal components of
  base change, and the proof of Theorem 4.17, page 20, identifies
  those components with the iterates shifted by their index.

Finding: no error or unresolved gap. Dossier status: **AI-proved**.

### D-A.4.2: detection and the dimension formula

Source: Corollary 6.2 and its following remark, PDF pages 21--22;
`build/sections/06-square-zero-and-conclusion.tex:157-249`.

- Lines 171--182: a right global-dimension bound \(g\) gives
  cohomology of \(\Phi^rN\) in \([-rg,0]\). The dossier supplies
  a finite right-projective bimodule resolution for this step.
- Lines 184--216: bounded base change followed by tensoring with
  the semisimple quotient detects the termination of a minimal
  projective resolution. The hypotheses used here are available.
- Lines 218--227: a non-zero cohomology group in degree \(q\leq0\)
  of \(\Phi^rN\) contributes in degree \(q-r\leq-r\).
  Thus a resolution shorter than \(r\) is impossible. In
  particular, the converse follows: finite projective dimension
  \(p\) implies \(\Phi^{p+1}N=0\).
- Difference of proof: the dossier uses Ext to simple modules and
  gives a complete derivation of
  \(\operatorname{pd}_A N=
  \sup_r\{\operatorname{pd}_\Delta(\Phi^rN)+r\}\).
  The source already attributes this stronger equality to MY;
  the dossier makes no novelty claim.
- The projective dimension of \(\Phi^rN\) is that of a complex,
  including its cohomological positions. Reading it as just the
  projective dimension of its degree-zero cohomology would be
  incorrect. The source states the complex convention explicitly.
- The v1 locators in source lines 230--246 are accurate:
  Corollary 4.11, page 18; Proposition 2.5, page 6; Lemma 3.6,
  page 12; Theorem 4.17, page 20. The latter's hypothesis is
  perfectness of every iterate plus eventual vanishing, not
  finite global dimension by itself. The latter supplies
  perfectness in this application.

Finding: no error or unresolved gap. The full equality and converse
have dossier status **AI-proved**, with MY comparison status **cited**.

### D-A.7.1: simulation

Source: Section 5 and Proposition 5.1, PDF pages 17--18;
`build/sections/05-ordinary-simulation.tex:9-149`.

- The report renames \(C,T,D,F\) as \(K_l,Y,\Delta,\Phi\).
  The independent attempt numbered the vertices in the opposite
  order. The final proof relabels them to agree with the source's
  arrows \(0\to1\to\cdots\to l\).
- Lines 18--35: \(W\) is the **right** simple at \(l\), with
  right projectives \(\varepsilon_iK_l\). These handedness and
  vertex choices are necessary for the displayed resolution.
  The case \(l=0\) is included.
- Lines 37--57: \(\varepsilon_iO=P^{a+i}\), with arrows acting
  by \(d_P\); the right action on \(O\) is from the first
  factor, and on \(Y\) it is from the second. With these actions
  the first-factor composite is \(Y\otimes_{B\otimes K_l}^{\mathbf L}O\).
- Lines 132--146: the unshifted tensor-resolution differential is
  \(d_P\) on \(P^{b+n}\). The map to \(P[b]\) is
  \((-1)^{bn}\) in degree \(n\); this is a chain isomorphism,
  not an identification with identical differentials when \(b\)
  is odd. Both \(B\)-actions and tensoring with a complex are
  compatible with this map.
- Lines 119--146 use right-projectivity of the terms of \(P\).
  This is explicitly supplied by Theorem 4.1; it is not a new
  assumption silently imposed in the simulation.
- Difference of estimate, lines 95--113: instead of using
  \(3(l+1)\) directed vertices, the dossier resolves each simple
  of \(B\otimes K_l\) as a tensor of a simple \(B\)-resolution
  and a vertex-simple \(K_l\)-resolution. This gives
  \(\operatorname{gldim}\Delta,
  \operatorname{gldim}\Delta^{\mathrm{op}}\leq l+2\).
  The argument also works over an imperfect field since
  \(K_l/\operatorname{rad}K_l=k^{l+1}\).
- The support interval in the source contains zero. That condition
  is harmless and is kept for assembly; simulation itself works
  for any integer interval containing the support of \(P\).

Finding: no error or unresolved gap; a stronger sufficient bound is
available. Dossier status: **AI-proved**.

### D-A.7.2: fixed algebra and the lower bound

Source: proof of Theorem 1.1, PDF page 22;
`build/sections/06-square-zero-and-conclusion.tex:253-341`.

- Lines 254--289 fix \(R,e,\alpha\), the presentation, \(B\),
  the lifted diagram, \(P\), its support interval and all of the
  simulation data before varying \(m\). The realisation statement
  is uniform in its module argument, so the quantifier order is
  \(\exists A\,\forall m\,\exists N_m\).
- Equation (6.4), lines 299--311, gives the binomial direct sum
  with shifts \(rb+3j\). Applying the realisation isomorphism to
  each individual module suffices; no natural splitting is needed.
- Lines 318--328 give zero at even iterate \(2m\) and a non-zero
  object at even iterate \(2m-2\). The latter has a shift of
  \(M(H^{\circ(m-1)}Y_m)\) as a direct summand. There is no
  cancellation between direct summands.
- The lower bound is obtained by setting the iterate index equal
  to \(2m-2\) in detection. No assertion about
  \(\Phi^{2m-1}N_m\) is made or needed. The case \(m=1\) gives
  the legitimate lower bound zero.
- The dossier adds the non-optimal finite estimate
  \(\operatorname{pd}_A N_m\leq(l+2)+(2m-1)(l+3)\).
  This is not required for the claimed unbounded lower bounds.

Finding: no error or unresolved gap in assembly. Dossier status:
**AI-proved relative to selection 5.2 and realisation D-B 6.1, 6.6**.

## MY source and version checks

The Library bibliography entry `MY17` points to
`https://arxiv.org/pdf/1710.01469v1`. The local PDF header identifies
v1 (arXiv stamp 4 October 2017; title-page date 5 October 2017).
The [arXiv v1 record](https://arxiv.org/abs/1710.01469v1) was opened
as an additional identity check. The statements were read in the
Library PDF, not in the abstract or a secondary summary.

The dossier records the exact formula and locators. Standing
conventions were read on pages 1, 4--6, 11--14 and 17; the relevant
statements and nearby proofs on pages 18--20. In particular:

- MY uses right modules; apply its statements to
  \(\Delta^{\mathrm{op}}\) and \(X^{\mathrm{op}}\).
- Reversing tensor factors of complexes uses the Koszul sign
  \((-1)^{|u||v|}\), and preserves the cohomological shift \([r]\).
- Its internal grading is separate from cohomological grading;
  an inflated module is internally concentrated in degree zero.
- There is no flatness hypothesis in Corollary 4.11 or the relevant
  standing hypotheses. Remark 4.9 explicitly defines iterates of
  the derived functor, rather than ordinary powers.
- The printed category in Lemma 4.13 needs the graded reading
  described above. Part (3)'s last equality, literally read with
  \(M\) instead of \(M_0\), is **refuted** by
  \(A=\Lambda=k\), \(C=0\), \(N=k\), and \(M=k\) in internal
  degree one: the degree-zero component on the left is zero,
  whereas the tensor on the right is non-zero. Only part (4) is
  used for attribution here; no use is made of part (3).

The formula pages were also inspected as rendered images:
`computations/D-A-MY17-v1-p18.png` and
`computations/D-A-MY17-v1-p20.png`. No unlocated MY citation remains.

## Computational scope

New script: `computations/D-A-checks.py`.
Saved output: `computations/D-A-checks.out`.
All stated finite checks passed with exact rational arithmetic:
69,633 multibar-face parity comparisons, 73,791 dg mixed-term
comparisons, 29,511 shifted-action comparisons and 168 simulation
sign comparisons. The ranges are recorded in both script and dossier.

The script also checks two explicitly non-flat examples. A two-cycle
tests resolution indices through nine and base-change cohomology
through eight. A seven-dimensional algebra has a complete minimal
resolution of length three, with \(\Phi N=S_0[1]\),
\(\Phi^2N=0\), and ordinary \(X\otimes_\Delta N=0\).
These computations support their stated cases. They do not replace
the all-degree proofs or validate the black-box selection and
realisation inputs.

## Source snapshot

SHA-256 hashes at the time of comparison:

| Input | SHA-256 |
|---|---|
| `paper.pdf` | `1fb7f827f59dcca0f391c279c346e4e8bc941880c24ec30fe1cba2e9a319f89c` |
| `build/sections/05-ordinary-simulation.tex` | `8efe5824ab2dd08526594ff50fecc3be0683360ecc25d62f4dfc3ec9e20401f8` |
| `build/sections/06-square-zero-and-conclusion.tex` | `92e5ffec3428f1cdd06ba17d38ade2e0ae002c8481378a527b9245822673bb99` |
| Library `MY17` PDF | `ee898625dc7697ab7bd4480d034448d89bdabc39f4544f19fa03aa51a8a7a9ec` |

The preprint inputs were read only. This job writes only the requested
dossier and audit, and the new `computations/D-A-*` files. No commit,
push, conversation-log edit, or edit to another dossier was made.
