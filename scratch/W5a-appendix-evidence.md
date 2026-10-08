Model: GPT-6 (exact variant unknown); effort: unknown. W5a launch record: gpt-6-astra, ultra.

# W5a appendix evidence review

Scope: read-only assistance with A2-verification.tex, A3-companion.tex,
A4-ai-declaration.tex and historical/citation claims in 01-introduction.tex.
Manuscript files and the root W5a ledger are not edited by this subagent.
Status of mathematical findings below: supported unless explicitly stated otherwise.
No Lean build or kernel replay has been run during this review.

## Coverage in progress

Required review, writing, preamble and AI-writing instructions read in full;
repository instructions, task W5a and notation table read. Appendices and
introduction read. Evidence checking is in progress.

## Evidence checked

- The stage-2 saved source manifest was checked with `sha256sum -c` in the
  separate Lean repository: all ten files match. Read current
  `FindimCounterexample/Coresolution.lean` and `StrongNakayama.lean`, the saved
  statement listing, toolchain, source scan/build/axiom/replay records and both
  stage summaries. The saved gates all record exit 0. This is receipt and
  correspondence inspection, not a new Lean verification.
- Queue rows D-A through W4-rest confirm the model/effort entries of A2's table.
  D-A/D-B/D-D/D-E and V-A/V-B/V-D/V-E have different recorded session IDs but
  the same model `gpt-6-astra`.
- Read `.cache/companion-src/sections/introduction.tex` and the corresponding
  PDF statements: Theorem 1.1 (p.1), Corollary 1.2 (p.4), Corollary 1.3 (p.5).
  Inspected rendered p.4. The finitistic-dimension proof is on p.35 and uses
  the minimal injective resolution, whose terms are projective-injective.
  These checks verify what the companion states, not its complete argument.
- AR75a was located in the personal library, whose entry has MR 389977. Read
  printed pp.69–72, including Theorem 1.1(b), and inspected rendered p.71 to
  distinguish `i >= 1` from OCR's erroneous `i > 1`.
- Bas60 and ZHui95 entries have verified MR metadata but no supplied local PDF.
  Read the author's survey [arXiv:1407.2383v1](https://arxiv.org/pdf/1407.2383),
  Section 2, PDF p.3: Bass publicised the problems in 1960, and the little
  conjecture is explicitly stated. The publisher PDF of Bas60 could not be
  retrieved through the browser; no primary Bas60 page locator is certified.

## Coverage

Line anchors refer to the source read on 2026-10-08, before any parent edits.
Headings and labels were also checked, with no findings.

| Block | Stable anchor and opening | Decision |
|---|---|---|
| B1 | A2:4, `This appendix records` | clean |
| B2 | A2:11, `Before any section was written` | clean; A2's qualified `as far as possible` must remain |
| B3 | A2:26, `Part&Proof note` | clean |
| B4 | A2:28, `\\Cref{sec:criteria}&Claude` | clean |
| B5 | A2:31, `\\Cref{sec:extinction,sec:simulation}` | clean |
| B6 | A2:33, `\\Cref{sec:selection}` | clean |
| B7 | A2:36, `\\Cref{sec:realisation}` | clean |
| B8 | A2:38, `\\Cref{sec:conversion}` | clean |
| B9 | A2:40, `\\Cref{sec:ar-route}` | clean |
| B10 | A2:43, `\\Cref{sec:obstructions}` | proposal P4: qualify which computations were not rechecked |
| B11 | A2:50, `The errors found and repaired` | clean as a description of the named records |
| B12 | A2:60, `Two results` | clean; source hashes still match saved passing receipts |
| B13 | A2:64, `\\item \\Cref{prop:coresolution}` | clean; formal source actually permits any abelian category |
| B14 | A2:67, `\\item A form` | proposal P1: quotient-map direction |
| B15 | A2:77, `The first formalisation` | clean; W6 marker deliberately pending |
| C1 | A3:4, `The two preprints` | proposal P3: precise companion locators |
| C2 | A3:15, `Its consequences fit` | proposal P3: precise companion locators; mathematical sides consistent |
| D1 | A4:4, `This article was prepared` | clean; final-date and author-check markers intentionally unresolved |
| D2 | A4:14, `The models and their roles` | clean |
| D3 | A4:17, `\\item Claude Opus` | proposal P5: initial prose drafting versus later GPT edits |
| D4 | A4:23, `\\item GPT-6 Astra` | clean against recorded launch model/effort; CLI version not independently authenticated |
| D5 | A4:30, `\\item Claude Fable` | clean against task records |
| D6 | A4:32, `\\item Claude Sonnet` | clean against task records |
| D7 | A4:39, `The work had two parts` | clean |
| D8 | A4:46, `Every mathematical claim` | proposal P2: independent session versus different model; qualified removal of verdicts |
| D9 | A4:62, `The repository` | existing CHECK must remain; the present repository contains Lean records but no Lean source tree |
| I1 | 01:4, `The little finitistic dimension` | supported historical claim; proposal P6 for exact AR implication attribution |

## Proposals (none applied)

### P1. State the augmentation condition in the correct direction

A2:68–70 says the quotient is killed by the first map. In the formal statement,
`d 0 : P 1 -> P 0`, and it is the quotient map `epsilon : P 0 -> E` that kills
the image of `d 0`. This is a statement correction, not autonomous polishing.

```diff
--- a/report/sections/A2-verification.tex
+++ b/report/sections/A2-verification.tex
@@ -68,3 +68,4 @@
     sequence of finitely generated projective right modules whose dual complex
-    is exact, with a nonzero quotient of the first term killed by the first
-    map, the cokernels of the dual complex are finitely generated left modules
+    is exact, with a nonzero quotient of the first term whose quotient map
+    annihilates the image of the first differential, the cokernels of the dual
+    complex are finitely generated left modules
```

### P2. Do not report different sessions as different models

A4:49 is contradicted by the D/V launch records. The earlier verdicts were
removed as far as possible from W2 frozen proofs, but W4 tasks explicitly
provided verified dossiers and prior audit reports. A2:11–17 has the correct
qualification and explicit instruction not to trust remaining assessments.

```diff
--- a/report/sections/A4-ai-declaration.tex
+++ b/report/sections/A4-ai-declaration.tex
@@ -49,4 +49,5 @@
-recorded. A proof counted as verified only after a model other than its author,
-working in a fresh session and given the statement and proof without any earlier
-verdicts, had checked it step by step; several errors and gaps were found and
+recorded. Proofs were checked step by step in fresh sessions, sometimes of
+the same model that wrote them. For the proof-note checks, earlier verdicts
+were removed as far as possible, and the reviewers were instructed not to use
+remaining assessments as evidence; several errors and gaps were found and
 corrected in this way, and two broader claims were withdrawn. Computations used
@@ -57,2 +58,2 @@
 Mathlib (\Cref{app:verification}). The completed article was reviewed block by
-block by a fresh session of GPT-6 Astra \CHECK{after W5: summarise the outcome}.
+block by fresh sessions of GPT-6 Astra \CHECK{after W5: summarise the outcome}.
```

The latter change reflects the three concurrent W5a/W5b/W5c jobs. The CHECK
remains because the parent must collect their final outcomes.

### P3. Supply companion theorem and corollary locators

The precise claims are supported by the primary source, but A3 cites the work
only once without a locator. The first citation can carry all three locators;
the later explicit simple-module assertion should point to Corollary 1.2(2).

```diff
--- a/report/sections/A3-companion.tex
+++ b/report/sections/A3-companion.tex
@@ -5,2 +5,3 @@
 third, \emph{A counterexample to Tachikawa's second
-conjecture}~\cite{OAI26tachikawa}. Its main theorem asserts that over
+conjecture}~\cite[Theorem~1.1 and Corollaries~1.2--1.3]{OAI26tachikawa}.
+Its main theorem asserts that over
@@ -18,2 +19,2 @@
-$A$ if $A$ is basic and $M$ indecomposable. The preprint also states the
-existence of a simple
+$A$ if $A$ is basic and $M$ indecomposable. The preprint also
+states~\cite[Corollary~1.2(2)]{OAI26tachikawa} the existence of a simple
```

### P4. Restrict the description of unrerun computations

V-C23 did recompute the specified size and the six-dimensional periodic
example with exact arithmetic (its sections 8.8 and 9.2), while declining to
rerun the search computations in dossier 9.4. A2's unqualified wording is too
broad if it includes all computations in the obstruction material.

```diff
--- a/report/sections/A2-verification.tex
+++ b/report/sections/A2-verification.tex
@@ -45,1 +45,2 @@
-    corrected; the computations not rechecked&GPT-6 Astra (ultra): a gap in
+    corrected; the search computations not rechecked&GPT-6 Astra (ultra): a
+    gap in
```

### P5. Separate first-draft prose from subsequent edits

GPT reviews have supplied wording repairs already applied, and W5 explicitly
authorises further grammatical edits. `All the prose` attributes the resulting
text exclusively to Claude. This is disclosure, hence a proposal.

```diff
--- a/report/sections/A4-ai-declaration.tex
+++ b/report/sections/A4-ai-declaration.tex
@@ -22,1 +22,2 @@
-    first stage of the Lean formalisation, and all the prose of this article.
+    first stage of the Lean formalisation, and the first draft of the prose
+    of this article.
```

### P6. Clarify the use of AR75a Theorem 1.1(b)

Theorem 1.1(b) yields generalized Nakayama failure over the opposite
endomorphism algebra. Infinite little finitistic dimension over the
endomorphism algebra follows using the report's strong Nakayama criterion.
The conclusion is supported, but the present single attribution omits this
second implication.

```diff
--- a/report/sections/01-introduction.tex
+++ b/report/sections/01-introduction.tex
@@ -13,2 +13,3 @@
-and Reiten~\cite[Theorem~1.1(b)]{AR75a}, such a counterexample yields a further
+and Reiten~\cite[Theorem~1.1(b)]{AR75a}, together with
+\Cref{thm:strong-nakayama}, such a counterexample yields a further
 algebra of infinite little finitistic dimension.
```

## Boundaries

No new mathematical error was found in the companion consequences, including
the distinction between left modules over Gamma and over Gamma-op. No genuine
grammar error was found in the appendices beyond the statement ambiguity P1.
The proposed historical and process changes are not mathematical revalidation
of prior audits. No manuscript edits, compilation, commits or new formal gates
were performed by this subagent.
