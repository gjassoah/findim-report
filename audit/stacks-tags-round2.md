# Stacks Project citations of the report, checked against the tag pages (round 2, 2026-10-09)

Model: Claude Sonnet 5.5. Source: https://stacks.math.columbia.edu/tag/<tag> read on 2026-10-09 (Gustavo allowed
Stacks access; no commit pinned, the Stacks Project is cited by tag). Method: for each `\cite[Tag ..., ...]{Stacks}` in
`report/sections/` the page title of the tag was compared with the cited label; for the Section 6 tags the
statement was also read.

| Location | Cited | Tag page | Result |
|---|---|---|---|
| 05-selection.tex:154 | Tag 00NX, Lemma 10.78.2 | Lemma 10.78.2 (00NX) | label matches; statement not re-read in round 2 |
| 05-selection.tex:156 | Tag 00FR, Lemma 10.31.6 | Lemma 10.31.6 (00FR) | label matches; statement not re-read in round 2 |
| 06-realisation.tex:52 | Tag 05RG, Lemma 13.6.6 | Lemma 13.6.6 (05RG): multiplicative system of a full triangulated subcategory | matches |
| 06-realisation.tex:56 | Tag 05RI, Definition 13.6.7 | Definition 13.6.7 (05RI): quotient category | matches |
| 06-realisation.tex:59 | Tag 04VB, Lemma 4.27.19 | Section 4.27 (04VB) | **wrong tag**: Lemma 4.27.19 (left and right fractions agree) is Tag **04VL**. Repaired on this branch |
| 06-realisation.tex:60 | Tag 04VH, Lemma 4.27.11 | Lemma 4.27.11 (04VH): right fractions are a category | matches |
| 06-realisation.tex:65 | Tag 04VK, Lemma 4.27.16 | Lemma 4.27.16 (04VK): Q inverts S | matches |
| 06-realisation.tex:87 | Tag 04VC, Definition 4.27.1 | Definition 4.27.1 (04VC): left, right and two-sided multiplicative systems | matches (one definition covers the right system) |
| 06-realisation.tex:101 | Tag 04VJ, Lemma 4.27.14 | Lemma 4.27.14 (04VJ): equality of right fractions | matches |
| 06-realisation.tex:278 | Tag 05RJ, Lemma 13.6.8 | Lemma 13.6.8 (05RJ): universal property; part (2) for exact functors into a pre-triangulated category | matches |

Status: locator error found and repaired (tag only; mathematics unchanged). Ten citations in all; the checks of
00NX and 00FR are label-only.
