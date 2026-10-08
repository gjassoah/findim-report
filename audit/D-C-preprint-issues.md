Model: unknown; effort: unknown.

# D-C. Comparison with the selection-group section

Date: 2026-10-08. Scope: `build/sections/02-selection-process.tex`,
all of report §5.2. The source and `paper.pdf` are read-only. Findings
here concern mathematical statements, proof details, conventions and
the specified Santos Rego comparison; they do not authorise changes to
the report or to the source.

The independent attempts are recorded in
report/notes/proofs/D-C-selection-group.md §0. At the creation of this
file no preprint proof had been read. The comparisons below were added
after reading each proof and finishing the corresponding dossier
argument.

## Outcome

No mathematical error, sign error, invalid integer preimage, missing
hypothesis, or unfilled proof step was found in the assigned section.
The assigned results receive **AI-proved** status in the dossier,
with proofs valid for every stated parameter, including every
$m\geq1$. This is an AI assessment, not human certification or a
fresh-context verification of the dossier.

The mathematical source inspected has SHA-256

    2dbb052ffbf54fd4d553df2ea707806b9bf05ae8477565c7f8fde936f532d948

for build/sections/02-selection-process.tex. Locators below use its
one-based source line numbers and stable labels.

## Coverage and comparison

| Source locator | Examination and result | Dossier |
| --- | --- | --- |
| Lines 4–17, selection-functor | Restriction of scalars is through $\alpha$, not $\alpha^{-1}$. The functor preserves finite dimensionality. | §5.3 |
| Lines 19–35, prop:selection | One fixed triple $(R,e,\alpha)$ works for every positive integer $m$. The boundary case $m=1$ is included. | §§5–6 |
| Lines 46–79, group-weights, group-conjugation, group-commutator-relations | All integer parameters are independent. Same-type commutation and relations between $W$-types are not silently assumed. | §§1.1, 2.1 |
| Lines 86–122, lem:group-finite-presentation | All twelve kernel lattices have the stated integral bases; their centralisers suffice for well-defined indexed conjugates. Positive and negative torus powers give every conjugation relation. | §§1.2–1.3 |
| Lines 124–160, nine-row table | Every row maps to the stipulated ordered pair $(r,s)$ for every allowed index choice. The two noncommuting relations also have output weight $r+s$. No row needs repair. | §1.4 |
| Lines 162–166 | The comparison of presentations is justified by explicit mutually inverse homomorphisms, not only a surjection from one presentation to the other. | §1.3 |
| Lines 189–214, commutator-transfer | The reordering proof uses exactly the three asserted commutations. Transfer compares distinct indices, and a second index compares two splittings at one index. No centrality is assumed at this stage. | §§2.1–2.2 |
| Lines 216–227, lem:central-shift | A distinct index handles $U,V$; the third index handles $W$; invariance of the sum handles $T$. Centrality then justifies squaring the commutator. | §2.3 |
| Lines 229–239 | Both translations preserve every relator family, including $T_\ell U_i(r)T_\ell^{-1}=U_i(r-\delta_{\ell i})$. The two translated maps are inverse on all generators. | §3 |
| Lines 251–289, finite-matrix-images | Matrix units give all commutations and both noncommuting relations over $S_m$. Diagonal conjugation has the stated weight. The finite quotient is the image; no surjectivity onto all of $\mathrm{GL}_5(S_m)$ is asserted. | §§4.1–4.2 |
| Lines 291–305, lem:finite-central-quotients | Central images have coefficient $t^N$; every subset product is detected by the polynomial basis. The source explicitly treats non-reduced $S_m$, so no square-free-polynomial hypothesis is missing. | §4.3 |
| Lines 314–328 | Adding formal inverses gives a finite algebra presentation. The central-involution calculation gives a central idempotent and its translates. | §5.2 |
| Lines 330–353 | The central character exists by independence. Its averaging element is non-zero; the resulting left ideal has the prescribed character. No extension of the character to $F_m$ or simplicity claim is required. | §§6.1–6.2 |
| Lines 355–368, selection-iterates | At stage $j$, $e$ acts as $\alpha^j(e)$ on the original module; the new action is $\alpha^{j+1}$. Thus the first $j$ idempotents, with indices $0,\ldots,j-1$, occur. | §5.3 |
| Lines 370–376 | The first zero iterate is $m$. Descent of $\alpha$ to a finite quotient is unnecessary. | §6.3 |

## Differences in the dossier, without changes to the statements

1. The finite-presentation proof writes out both homomorphisms. The
   preprint's final equivalence sentence is sound; this is an expansion.
2. The dossier's first table retains the parameter order of each
   relator. For rows beginning with $W$, this sometimes gives target
   pair $(s,r)$. A second table in §1.4 checks every source row in
   its uniform order $(r,s)$. The difference is a renaming.
3. The transfer identity is obtained by conjugating $[w,v]$ by $x$,
   rather than comparing two reorderings of $xyv$. Both calculations
   use $[x,v]=[[w,v],[x,w]]=[[w,v],v]=1$.
4. Translation is checked for an arbitrary integer $c$, then specialised
   to $c=1$ and $c=-1$. Every family, including the torus conjugations,
   is displayed.
5. The dossier indexes the matrices by $1,\ldots,5$, whereas the
   source uses $0,\ldots,4$. Subtract one from both indices to compare
   the formulas. In particular, $E_{1,5}$ here is $E_{04}$ there.
6. The independent module construction used induction from $Z_m$.
   The final proof uses the source's left ideal and gives an explicit
   isomorphism with that induced module. There is no left/right
   convention change.
7. Iterates are written $H^j$ in the dossier/job and $H^{\circ j}$
   in the source. Both denote iteration, not cohomology.
8. The dossier additionally derives independence of the entire family
   $(z_N)_{N\in\mathbb Z}$ from the finite quotients, by separating
   each finite set of indices modulo a sufficiently large $m$. This
   does not assert a description of the entire centre.

## Santos Rego: exact scope of the citation

The preprint's lines 37–42 cite a comparison, not a theorem used in
the proof. The Library PDF is
[Reg19](<Reg19 - On the Finiteness Length of Some Soluble Linear Groups.pdf>),
SHA-256

    a591e58b50d4d969500be742995a548aecff48543f62dd98553f2c03d9e190be

Its banner identifies arXiv:1901.06704v3, 20 April 2021. The
[arXiv record](https://arxiv.org/abs/1901.06704v3) agrees with that
version. The preprint's bibliography entry Rego2022 includes the
same versioned URL. No journal PDF was used; all page numbers here
refer to the arXiv PDF.

The exact locators read are:

- p. 1: the coefficient ring is commutative and unital;
- §2, p. 6: $[x,y]=xyx^{-1}y^{-1}$;
- p. 23, Lemma 4.7: the commutator identity and Hall's identity used
  in the comparison proof;
- p. 24, Proposition 4.9: the colimit statement for $n\geq4$, with
  the presentation conventions in Lemma 4.8;
- p. 26, equations (4.9) and (4.10): transfer among expressions
  for $e_{1n}(t)$, followed by centrality;
- pp. 27–28: the calculation proving (4.9), and p. 28: the
  calculation proving (4.10).

Rendered pp. 26–28 were inspected as well as the extracted text.
The formulas quoted in dossier §7 are the relevant comparison.
The common mechanisms are commutator transfer and centrality via
alternative expressions. The groups and presentations differ:
Santos Rego uses upper-unitriangular groups, whereas $W_{ij}$ in
the selection group is present for both orders of distinct indices.
The preprint's word “parallels” has the right scope. No theorem
about Abels groups was used to justify finite presentability of $G$.
No attribution correction is proposed.

## Computational evidence and limitations

New files: computations/D-C-selection-checks.py and its saved .out
file. The script checks all twelve kernel bases and all nine source
table rows symbolically over $\mathbb Z$, for every index choice.
It also checks the finite matrix relations and all central subset
products for $m=1,\ldots,10$, and the scalar products associated
with the prescribed selection signs. All listed checks passed.
These are not a proof of the identities in the abstract group,
finite presentation, or the full module construction; the dossier
supplies those proofs.

The new computation was written before inspecting the part-I script.
The archived computations/01-selection-quotients.py and .out were
subsequently read but not rerun or modified. Their reported failures
are explicitly for the alternative, reversed conjugation convention
at $m\geq3$. They do not contradict the preprint's defining relation.

No mathematical correction is requested. The next fresh-context
review should concentrate on the two-presentation argument and the
transfer calculation, rather than infer correctness of the abstract
group from its finite images.
