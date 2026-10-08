Model: GPT-6 (exact variant unknown); effort: unknown.

# W5a autonomous block review

Started 2026-10-08. Research article; existing AI-written manuscript; no venue-specific style supplied. Scope: `report/main.tex` (preamble, metadata and abstract), sections 01, 02, 03, A2, A3 and A4. All other section files are context only and are being reviewed concurrently by others. No commits.

Baseline: Git `9971fba395d8f560400240f2b235ac06277b83e5`; only `codex/QUEUE.md` was modified at entry. Source snapshot: `scratch/W5a-source-before/`. Line anchors below refer to this snapshot and include first words or labels; final line shifts will be recorded. The user authorises only evident slips, typesetting corrections and genuine grammar/style corrections. Substantive changes remain unapplied proposals.

Rules read: `README.md`, `AGENTS.md`, `PROGRESS.md`, `docs/WORKING_RULES.md`, `codex/tasks/W5a.md`, `report/PROGRESS.md`, `audit/report-notation.md`, the global instruction index and the full review, mathematical-writing, preamble, AI-writing, AI-research and code/build rules. Prior audit verdicts are not evidence. Review assessments are AI assessments, not human certification. Mathematical findings carry individual statuses below; a clean row means no error found in this review, not a formal verification.

Initial document-wide recurring-grammar sweep completed (existential agreement, Then/that is, Let/such that, double punctuation, articles/prepositions, hyphenation). Hits are assessed in context during the block review. No blanket substitutions. The manuscript predominantly writes `nonzero`; retain this existing spelling consistently rather than normalising it piecemeal.

## Block coverage

Mathematical status convention for this ledger: the direct argument checks in rows 027–034 and 036–065 are **AI-proved** assessments of the indicated local arguments; formalisation/citation/record correspondence and the summaries in the introduction and abstract are **supported** assessments. Neither designation is human certification. Headings, labels and displays are included in their containing blocks; table rows and list items are checked separately. Table entries say what this review checked, not what a previous audit concluded.

| Block | Stable source anchor and range | Content | Status | Decision/reason |
|---|---|---|---|---|
| 001 | `report/main.tex:1–10`, `% PROVENANCE` | Provenance and build comments | corrected | Added this review's attribution, without guessing a model variant. |
| 002 | `report/main.tex:12`, `\documentclass` | Class and paragraph breaking | corrected | Existing A4 amsart convention retained; 1em emergency stretch removes actual overflow at run-in headings and the repository URL without changing wording; kept OpenAI unhyphenated after inspecting an Ope-/nAI break in the abstract. |
| 003 | `report/main.tex:14–34`, `Core mathematics` | Core, graphics and theorem packages | clean | Dependencies explicit; no duplicate loads. |
| 004 | `report/main.tex:36–53`, `Bibliography` | Bibliography configuration | clean | Existing biblatex/biber interface retained. |
| 005 | `report/main.tex:55–69`, `Hyperlinks` | Hyperlinks and references | clean | Load order and palette checked. |
| 006 | `report/main.tex:71–78`, `Draft markers` | Marker macros | clean | Pending release markers remain operative. |
| 007 | `report/main.tex:80–87`, `Core notation` | Field, integers, opposite | clean | Interfaces checked against usage. |
| 008 | `report/main.tex:88–93`, `\id` | Identity macro | clean | Optional/starred arguments checked. |
| 009 | `report/main.tex:95–100`, `\set` | Set-builder macro | clean | Optional predicate and scalable delimiters checked. |
| 010 | `report/main.tex:102–108`, `Hom and derived Hom` | Hom macros | clean | Preserve existing optional-base interface. |
| 011 | `report/main.tex:110–113`, `Derived tensor product` | Derived tensor macro | clean | Derived/ordinary distinction preserved. |
| 012 | `report/main.tex:115–123`, `\DerCat` | Derived category and image macros | clean | Shift/decorations checked against usage. |
| 013 | `report/main.tex:125–133`, `Define only category letters` | Category notation and stale comment | corrected | Removed completed W1 drafting reminder. |
| 014 | `report/main.tex:135–161`, `Theorem environments` | Counters and environments | corrected | Restored section-qualified PDF destination names for the shared counter; printed theorem/equation numbering is unchanged. |
| 015 | `report/main.tex:163–172`, `Metadata` | Title and proposed byline | clean | Existing author-decision placeholders retained. |
| 016 | `report/main.tex:176–184`, `We reconstruct` | Abstract | corrected | Semicolon separates the two independent construction clauses. |
| 017 | `report/sections/01-introduction.tex:1–14`, `The little finitistic dimension` | Historical setting and AR implication | proposal | P3: separate the AR75 attribution from the finitistic-dimension consequence. |
| 018 | `report/sections/01-introduction.tex:16–23`, `This article reconstructs` | Scope and review status | clean | Checked against body and current human-review declaration. |
| 019 | `report/sections/01-introduction.tex:25–38`, `The main construction has three layers` | Construction outline | clean | References and the shift-three formula match the body. |
| 020 | `report/sections/01-introduction.tex:40–45`, `Let (R,Ψ) be selection data` | Unnumbered main theorem | clean | Correct consequence of thm:main; no extra hypothesis needed. |
| 021 | `report/sections/01-introduction.tex:47–65`, `Selection data with unbounded extinction exist` | Example, obstruction and lifting | corrected | Introduced the length symbol l at its first use; no bound changed. |
| 022 | `report/sections/01-introduction.tex:67–84`, `The second construction rests` | AR construction outline | clean | Side conventions, field, simple counts and size match Sections 8–9. |
| 023 | `report/sections/01-introduction.tex:86–105`, `The work that led` | Criteria and obstructions | clean | Restrictions and cross-references match Sections 3, 4 and 10. |
| 024 | `report/sections/01-introduction.tex:107–119`, `Structure` | Roadmap | clean | All referenced sections exist and match their descriptions. |
| 025 | `report/sections/02-preliminaries.tex:1–19`, `Throughout, k is a field` | Global conventions | corrected | Comma after introductory otherwise-clause; module sides and shifts checked. |
| 026 | `report/sections/02-preliminaries.tex:21–30`, `The little finitistic dimension` | Definition and conjecture | corrected | Broke overfull set-builder condition into two lines; mathematical content unchanged. |
| 027 | `report/sections/02-preliminaries.tex:32–46`, `Let A be a symmetric algebra` | Stable category and Tate groups | corrected | Comma after long introductory phrase. |
| 028 | `report/sections/02-preliminaries.tex:48–57`, `Tate duality` | Duality theorem | corrected | Introductory comma; source v1 §2 (2.1), printed p.3 checked. |
| 029 | `report/sections/02-preliminaries.tex:59–67`, `Equivalently` | Pairing and composition | clean | Source v1 (2.2), (2.8), printed pp.4, 6 checked with degrees translated. |
| 030 | `report/sections/02-preliminaries.tex:69–88`, `Let T be a triangulated category` | Toda definition, existence, indeterminacy, degree | corrected | Introductory comma before the graded-endomorphism statement; signs checked. |
| 031 | `report/sections/02-preliminaries.tex:90–96`, `In the situation above` | Juggling lemma | clean | Domains and direction of inclusion checked. |
| 032 | `report/sections/02-preliminaries.tex:98–102`, `If (a,b) is a defining system` | Juggling proof | clean | Composition with u[1] gives the stated defining system. |
| 033 | `report/sections/02-preliminaries.tex:104–113`, `For an algebra Δ` | Trivial extension and inflation | clean | Multiplication, unit and projection conventions checked. |
| 034 | `report/sections/02-preliminaries.tex:115–123`, `For a finite-dimensional algebra C` | Symmetric trivial extension | corrected | Comma after Hence; bilinearity, bimodule action and both nondegeneracy cases checked. |
| 035 | `report/sections/03-criteria.tex:1–8`, `This section collects` | Heading and reduction summary | clean | Both constructions use the criteria described. |
| 036 | `report/sections/03-criteria.tex:10–20`, `Let A be an abelian category` | Coresolution proposition and exact-sequence display | clean | Enough projectives, the nonprojective first cokernel and the range n≥1 are sufficient. |
| 037 | `report/sections/03-criteria.tex:22–33`, `A short exact sequence` | Coresolution proof | clean | Upper bound, n=1 base case, Ext witness and induction checked. |
| 038 | `report/sections/03-criteria.tex:35–38`, `Cref{prop:coresolution}` | Formalisation remark | clean | Supported by the actual Lean statement listing; the formal source allows arbitrary abelian categories. |
| 039 | `report/sections/03-criteria.tex:40–47`, `The following statement` | Heading, mechanism and CB19 citation | clean | Source §3.2 Proposition 5, printed p.63, explicitly uses finite findim of the opposite algebra. |
| 040 | `report/sections/03-criteria.tex:49–60`, `Let A be a finite-dimensional algebra` | Strong Nakayama theorem | clean | Includes degree-zero vanishing, correct module sides and minimal-transpose indices. |
| 041 | `report/sections/03-criteria.tex:62–74`, `The complex` | Strong Nakayama proof | corrected | Comma after Hence; exactness, reflexive dual splitting and the n=1 start checked. |
| 042 | `report/sections/03-criteria.tex:76–79`, `Since Ext` | Derived Nakayama and infinite pd | clean | Ext–Tor duality uses DA on the left of A; minimality detects nonzero top Ext for a nonzero module of finite pd, including pd=0. |
| 043 | `report/sections/03-criteria.tex:81–86`, `The projective-dimension conclusion` | Formalisation scope | clean | Supported: the formal statement assumes dual exactness; it does not formalise the Ext bridge. |
| 044 | `report/sections/03-criteria.tex:88–89`, `The modules C_n` | First-cokernel transition | clean | The next criterion is stated for a projective-free module of pd one. |
| 045 | `report/sections/03-criteria.tex:91–106`, `Let C be an A-module` | Three equivalent conditions and final isomorphism | clean | No-projective-summands hypothesis is used by minimal transpose involutivity; Hom vanishing follows from pd one. |
| 046 | `report/sections/03-criteria.tex:108–121`, `Choose a minimal projective resolution` | Equivalence proof | clean | Nonzero transpose, double transpose, every dual exact sequence, approximation surjectivity and splice checked. |
| 047 | `report/sections/03-criteria.tex:123–128`, `If a finite-dimensional algebra` | Infinitely many torsionless modules | clean | Correct implication for indecomposable isomorphism classes. |
| 048 | `report/sections/03-criteria.tex:130–135`, `The indecomposable summands` | Torsionless proof | clean | Each C_n embeds in the next projective; pd of a finite sum is the maximum of the summand dimensions. |
| 049 | `report/sections/03-criteria.tex:137–146`, `The Auslander--Reiten conjecture` | Heading, conjecture and AR75a attribution | clean | Theorem 1.1(b), p.71, supplies the generalised Nakayama implication; the text then explicitly invokes strong Nakayama. Run-in overflow is corrected by the preamble setting. |
| 050 | `report/sections/03-criteria.tex:148–160`, `Let Lambda be a finite-dimensional algebra` | AR-to-findim theorem and cokernel display | clean | G need not be basic; S need not be simple; the final algebra has no opposite sign. |
| 051 | `report/sections/03-criteria.tex:162–174`, `Write F=Hom` | Resolution and nonzero cokernel | clean | Finite-dimensional Hom supplies right approximations; the generator ensures surjectivity; identity lifting would split the cover. |
| 052 | `report/sections/03-criteria.tex:174–188`, `For Y in add G` | Dual complex and Ext computation | clean | The augmented Hom(-,G)-acyclic resolution computes Ext(M,G); injectivity deals separately with degree zero. |
| 053 | `report/sections/03-criteria.tex:190–193`, `Replacing M` | Indecomposable reduction and simple count | clean | Additivity and Krull–Schmidt give exactly one new simple isomorphism class. |
| 054 | `report/sections/03-criteria.tex:195–197`, `Conversely, simple witnesses` | Corner transition and module side | clean | The following proposition has the stated right-B convention. |
| 055 | `report/sections/03-criteria.tex:199–214`, `Let S be a simple right A-module` | Corner proposition and endomorphism display | clean | e removes all primitive idempotents of S's isomorphism type; the stronger conclusion uses all-degree Ext vanishing. |
| 056 | `report/sections/03-criteria.tex:216–230`, `For a right A-module V` | Double centraliser and nonprojectivity | clean | Kernel/cokernel are killed by f; induction on length and adjunction give the isomorphism; Morita equivalence contradicts the simple count. |
| 057 | `report/sections/03-criteria.tex:232–241`, `Assume now the vanishing` | Higher-Ext conclusion | clean | Minimal injective socles are detected by Ext(S,A); restriction sends D(Ae_t) to D(Be_t), giving the asserted injective-resolution computation. |
| 058 | `report/sections/03-criteria.tex:243–251`, `The two vanishing conditions` | Quiver example | clean | Recomputed paths, right resolution and dual maps. Also checked the asserted failure over the corner: M is the right simple at 2 for k(1→2), with nonzero Ext^1(M,B). |
| 059 | `report/sections/03-criteria.tex:253–257`, `Triangular matrix algebras` | Heading and gluing claim | clean | The claim follows from the two alternatives of the next proposition. |
| 060 | `report/sections/03-criteria.tex:259–269`, `Let A=...` | Triangular proposition | clean | Right-module triples, bimodule sides and the cone in D^- are correct without a flatness assumption on M. |
| 061 | `report/sections/03-criteria.tex:271–285`, `Let e=diag` | Triangular proof | clean | Counit triangle and both derived adjunctions checked; nonzero minimal P has a nonsplit first dual map, producing unbounded left-B pd; Z=0 gives the right-C witness. |
| 062 | `report/sections/03-criteria.tex:287–292`, `Finally, finite projective dimensions` | Schofield/Happel and GLS sources | clean | Hap90 §2.3, p.5, and GLS23 v2 Corollary 2.6, p.8, checked; their algebraically closed convention is expressly distinguished. |
| 063 | `report/sections/03-criteria.tex:294–302`, `Let A be a finite-dimensional algebra` | Bounded-dimension proposition | clean | Fixed dimension-vector loci, empty loci and the zero module cause no exception. |
| 064 | `report/sections/03-criteria.tex:304–316`, `Let J be the radical` | Rank-locus proof | clean | Tor with A/J detects pd for finite modules; free terms have constant dimension and polynomial differentials; rank-sum openness and noetherian stabilisation work over any field on the representation space. |
| 065 | `report/sections/03-criteria.tex:318–323`, `In Cref{thm:strong-nakayama}` | Transpose bound and Schulz example | proposal | Bound checked using free ranks of two successive covers, without assuming dim(P*)=dim(P). P5 adds the verified Example 7 locator. |
| 066 | `report/sections/A2-verification.tex:1–7`, `This appendix records` | Heading and verification scope | clean | Distinguishes AI checks, human review and proof-assistant checking. |
| 067 | `report/sections/A2-verification.tex:9–21`, `Before any section was written` | Proof-note workflow | clean | D/V/W records support the workflow and qualification about removing verdicts. Proof notes contained the original result claims; later repairs are recorded separately below. |
| 068 | `report/sections/A2-verification.tex:23–27`, `begin{tabular}` | Table layout and header | corrected | Reduced the last fixed-width column by .01 textwidth: the original widths plus six tabcolsep exceeded textwidth by 1.2pt. |
| 069 | `report/sections/A2-verification.tex:28–30`, `Cref{sec:criteria}&Claude` | Criteria verification row | clean | Checked queue and actual V-C1/W4-rest reports as historical records, not as mathematical evidence. |
| 070 | `report/sections/A2-verification.tex:31–32`, `Cref{sec:extinction,sec:simulation}` | Extinction/simulation row | clean | D-A/V-A and W4-rest roles, effort and repair descriptions agree. |
| 071 | `report/sections/A2-verification.tex:33–35`, `Cref{sec:selection}` | Selection row | clean | D-A/C.2, V-A/V-C23 and W4-rest division agrees with records. |
| 072 | `report/sections/A2-verification.tex:36–37`, `Cref{sec:realisation}` | Realisation row | clean | D-B/V-B and W4-rest records agree. |
| 073 | `report/sections/A2-verification.tex:38–39`, `Cref{sec:conversion}` | Conversion row | clean | D-D/V-D and W4-D records agree. |
| 074 | `report/sections/A2-verification.tex:40–42`, `Cref{sec:ar-route}` | AR construction row | clean | D-E/V-E and W4-E records agree, including the narrowed input claim. |
| 075 | `report/sections/A2-verification.tex:43–48`, `Cref{sec:obstructions}` | Obstructions row and table end | proposal | P6: the search computations were not rerun, but V-C23 did recompute the size and periodic example. |
| 076 | `report/sections/A2-verification.tex:50–56`, `The errors found and repaired` | Earlier errors and withdrawn claims | clean | Each category is documented in the cited workflow; this records history without adopting earlier correctness verdicts. |
| 077 | `report/sections/A2-verification.tex:58–62`, `Two results` | Formalisation versions and axioms | clean | Checked saved gates, source manifest, actual toolchain and axiom reports. No new Lean build is claimed. |
| 078 | `report/sections/A2-verification.tex:64–66`, `item Cref{prop:coresolution}` | First formal statement | clean | Saved listing gives the stated bound and sharpness; stronger arbitrary-abelian-category scope covers the manuscript. |
| 079 | `report/sections/A2-verification.tex:67–76`, `item A form` | Second formal statement and unformalised bridge | proposal | P1: d_0 maps into P_0; the quotient map annihilates its image. Exactness/Ext equivalence and n≥1 range otherwise checked. |
| 080 | `report/sections/A2-verification.tex:77–83`, `The first formalisation` | Authorship and five acceptance checks | clean | Saved scan/build/axiom/statement/replay records all report success; sources are in the separate formalisation repository. |
| 081 | `report/sections/A2-verification.tex:84–85`, `CHECK{after W6` | Pending W6 marker | clean | Intentionally unresolved; W5a cannot supply the separate feasibility evaluation. |
| 082 | `report/sections/A3-companion.tex:1–13`, `The two preprints` | Heading and companion claims | proposal | P4 adds exact theorem/corollary locators. Statements read directly; no full companion verification is claimed. |
| 083 | `report/sections/A3-companion.tex:15–30`, `Its consequences fit` | Comparison, handedness and simple witness | proposal | P4 adds the simple-witness locator. Gamma's left findim uses dominant dimension; the report's criterion gives Gamma^op, as stated. |
| 084 | `report/sections/A4-ai-declaration.tex:1–10`, `This article was prepared` | Heading, authorship and human-review scope | clean | Dates and human-check status remain explicit release placeholders. |
| 085 | `report/sections/A4-ai-declaration.tex:12–15`, `The models and their roles` | Models heading and lead | clean | Names are expressly attributed to project records. |
| 086 | `report/sections/A4-ai-declaration.tex:17–22`, `item Claude Opus` | Claude attribution | proposal | P7: Claude supplied the first draft; the current prose also contains documented GPT revisions. |
| 087 | `report/sections/A4-ai-declaration.tex:23–29`, `item GPT-6 Astra` | GPT attribution | clean | Named roles and launch efforts agree with records; CLI version is a recorded historical assertion, not independently authenticated runtime metadata. |
| 088 | `report/sections/A4-ai-declaration.tex:30–31`, `item Claude Fable` | Fable consultations | clean | Two recorded consultations, the second incomplete. |
| 089 | `report/sections/A4-ai-declaration.tex:32–35`, `item Claude Sonnet` | Sonnet roles | clean | Roles are recorded in project history. |
| 090 | `report/sections/A4-ai-declaration.tex:37–44`, `The work had two parts` | Process chronology | clean | Distinguishes the original investigation from article preparation. |
| 091 | `report/sections/A4-ai-declaration.tex:46–58`, `Every mathematical claim` | Status policy and verification account | proposal | P2: different sessions sometimes used the same model; verdict removal was qualified; W5 has three parallel review sessions. |
| 092 | `report/sections/A4-ai-declaration.tex:60–68`, `The repository` | Repository disclosure and pending URL | corrected | Inserted missing space before CHECK; emergency stretch removes overflow. Existing confirmation marker remains: no release URL or source availability is certified here. |

## Applied changes: unified diff summary

Only the following source edits were applied. The absent length symbol is an evident notation slip; the display reflow leaves the definition unchanged. The counter correction affects PDF destination names, not printed numbering. A3 has no applied changes. Full patch also saved as `scratch/W5a-applied.patch`.

```diff
--- a/report/main.tex
+++ b/report/main.tex
@@ -2,6 +2,7 @@
 % Models that drafted or edited it:
 %   Claude Opus 5.5 (Anthropic), in Claude Code, outline, proof notes and drafting, October 2026
 %   GPT-6 Astra (OpenAI), in Codex, verification of proofs, computations and review, October 2026
+%   Codex (exact model and effort unknown), W5a review and minor edits, 2026-10-08
 % Detailed history: git log; log/CONVERSATION.md and PROGRESS.md of the repository; Appendix D.
 %
 % Research report on the OpenAI preprints on the finitistic dimension conjecture and the
@@ -10,6 +11,10 @@
 % biber, bibliography in library.bib.
 
 \documentclass[a4paper]{amsart}
+
+% Allow line breaking at long run-in headings and repository URLs.
+\setlength{\emergencystretch}{1em}
+\hyphenation{OpenAI}
 
 % ============================================================
 % Core mathematics
@@ -130,13 +135,14 @@
 % Paper-specific notation
 % ============================================================
 
-% To be fixed in W1 (audit/report-notation.md) before drafting.
 
 % ============================================================
 % Theorem environments
 % ============================================================
 
 \numberwithin{equation}{section}
+% The shared counter needs section-qualified PDF destinations.
+\renewcommand{\theHequation}{\theHsection.\arabic{equation}}
 
 \declaretheorem[style=plain,sibling=equation]{theorem}
 \declaretheorem[style=plain,sibling=equation]{proposition}
@@ -177,7 +183,7 @@
 We reconstruct, with complete proofs, the two constructions of
 finite-dimensional algebras of infinite little finitistic dimension released by
 OpenAI in September 2026: one realises a selection functor on modules over a
-finitely presented algebra by a bimodule complex and a trivial extension, the
+finitely presented algebra by a bimodule complex and a trivial extension; the
 other obtains an Auslander--Reiten counterexample from stable data over a
 symmetric algebra. We also prove criteria for infinite finitistic dimension and
 obstructions to simpler constructions.
--- a/report/sections/01-introduction.tex
+++ b/report/sections/01-introduction.tex
@@ -55,7 +55,7 @@
 finite-dimensional hereditary algebras
 (\Cref{coro:rank-obstruction}). The realisation is the only step that is not
 explicit: it lifts a diagram from a Verdier quotient by the calculus of
-fractions, and the argument gives no bound on the length of the complex $P$,
+fractions, and the argument gives no bound on the length $l$ of the complex $P$,
 hence on the number $3(l+2)$ of simple modules of the final algebra
 (\Cref{rem:uncontrolled-length,rem:what-is-explicit}). The argument works with
 an object $U\oplus U[3]$ instead of the summand $U$ that encodes $\Psi$: the
--- a/report/sections/02-preliminaries.tex
+++ b/report/sections/02-preliminaries.tex
@@ -4,7 +4,7 @@
 \begin{conventions}
   Throughout, $\kk$ is a field and $D=\Hom[\kk]{-}{\kk}$ denotes the
   $\kk$-linear duality. Algebras are associative and unital; unless stated
-  otherwise they are finite-dimensional over $\kk$, although the algebras of
+  otherwise, they are finite-dimensional over $\kk$, although the algebras of
   selection data in \Cref{sec:selection} need not be. Modules are finitely
   generated \emph{left} modules unless they are called right modules, and right
   $A$-modules are identified with left $A^{\op}$-modules. Composition of maps
@@ -20,8 +20,9 @@
 
 The \emph{little finitistic dimension} of an algebra $A$ is
 \[
-  \operatorname{findim}A\coloneqq\sup\set{\operatorname{pd}_AM}[M\text{ a
-    finitely generated left $A$-module with }\operatorname{pd}_AM<\infty].
+  \operatorname{findim}A\coloneqq\sup\set*{\operatorname{pd}_AM}[\substack{
+    M\text{ a finitely generated left }A\text{-module}\\
+    \operatorname{pd}_AM<\infty}].
 \]
 The \emph{little finitistic dimension conjecture} asserts that
 $\operatorname{findim}A<\infty$ for every finite-dimensional
@@ -35,7 +36,7 @@
 Let $A$ be a symmetric algebra. Its stable module category
 $\operatorname{\underline{mod}}A$ is triangulated, with suspension $[1]$ given
 by the cosyzygy $\Omega^{-1}$, so that $[-1]=\Omega$, and with triangles
-induced by short exact sequences. For modules $X$ and $Y$ and an integer $a$ we
+induced by short exact sequences. For modules $X$ and $Y$ and an integer $a$, we
 write
 \[
   \widehat{\operatorname{Ext}}{}^a_A(X,Y)\coloneqq
@@ -48,7 +49,7 @@
 \begin{theorem}[{Tate duality; \cite[Section~2, (2.1)]{Lin12a}}]
   \label{thm:tate-duality}
   Let $A$ be a symmetric algebra. For all modules $X$, $Y$ and every integer
-  $a$ there is an isomorphism
+  $a$, there is an isomorphism
   \[
     D\widehat{\operatorname{Ext}}{}^a_A(X,Y)\cong
     \widehat{\operatorname{Ext}}{}^{-1-a}_A(Y,X),
@@ -83,7 +84,7 @@
 \[
   h\circ\Hom[\mathcal{T}]{X[1]}{Z}+\Hom[\mathcal{T}]{Y[1]}{W}\circ f[1].
 \]
-In a graded endomorphism ring $\widehat{\operatorname{Ext}}{}^*_A(X,X)$ the
+In a graded endomorphism ring $\widehat{\operatorname{Ext}}{}^*_A(X,X)$, the
 bracket of homogeneous classes of degrees $p$, $q$ and $r$ lies in degree
 $p+q+r-1$.
 
@@ -118,6 +119,6 @@
 satisfies $\operatorname{tr}((a,\phi)(b,\psi))=\psi(a)+\phi(b)$, which is
 symmetric in the two factors, and the associated bilinear form is
 nondegenerate, since for $a\neq0$ there is $\psi$ with $\psi(a)\neq0$, and for
-$a=0\neq\phi$ there is $b$ with $\phi(b)\neq0$. Hence
+$a=0\neq\phi$ there is $b$ with $\phi(b)\neq0$. Hence,
 $t\mapsto\operatorname{tr}(-\,t)$ is an isomorphism of bimodules from
 $C\ltimes DC$ to its dual.
--- a/report/sections/03-criteria.tex
+++ b/report/sections/03-criteria.tex
@@ -67,7 +67,7 @@
   where $C_0=P_0^*$. If $C_1$ were projective, the map $P_0^*\to P_1^*$ would be
   a split monomorphism; since finitely generated projective modules are
   reflexive, its dual $P_1\to P_0$ would then be a split epimorphism, and
-  $E=\operatorname{coker}(P_1\to P_0)$ would vanish. Hence
+  $E=\operatorname{coker}(P_1\to P_0)$ would vanish. Hence,
   \Cref{prop:coresolution} applies. Finally,
   $P_n\to P_{n-1}\to\Omega^{n-1}E\to0$ is a minimal presentation, so that
   $\operatorname{Tr}\Omega^{n-1}E=\operatorname{coker}(P_{n-1}^*\to P_n^*)=C_n$.
--- a/report/sections/A2-verification.tex
+++ b/report/sections/A2-verification.tex
@@ -22,7 +22,7 @@
 
 \medskip
 \noindent
-\begin{tabular}{@{}p{0.2\textwidth}p{0.22\textwidth}p{0.26\textwidth}p{0.24\textwidth}@{}}
+\begin{tabular}{@{}p{0.2\textwidth}p{0.22\textwidth}p{0.26\textwidth}p{0.23\textwidth}@{}}
   Part&Proof note&Verification of the note&Verification of the section\\
   \hline
   \Cref{sec:criteria}&Claude Opus~5.5&GPT-6 Astra (max): errors and gaps in
--- a/report/sections/A4-ai-declaration.tex
+++ b/report/sections/A4-ai-declaration.tex
@@ -60,7 +60,7 @@
 \subsection*{Repository}
 
 The repository
-\url{https://github.com/gjassoah/findim-report}\CHECK{confirm once the
+\url{https://github.com/gjassoah/findim-report} \CHECK{confirm once the
   repository exists} contains the complete record of the work: the plan, the
 notes, the verification reports, the scripts and their outputs, the Lean
 sources and the evidence of their checks, the sources of this article, and a
```

## Proposals (unapplied)

Seven proposals. The diff contexts below are against the W5a-edited sources; the table retains baseline anchors. None of these patches has been applied.

### P1. Correct the augmentation direction

Status: **supported**. **Unapplied**; author decision required because this changes a statement, attribution, or evidentiary claim.

At baseline A2:69–70, the condition is described in the wrong direction. In `lean/gates/stage2-3b18d65/4-statements.log`, `StrongNakayama.projectiveDimension_eq` takes `d 0 : P 1 → P 0` and a surjective `ε : P 0 → E` with `ε ∘ d 0 = 0`. Thus it is the quotient map that annihilates the image of the first differential. The proposed wording matches the actual formal statement without asserting that E is its entire cokernel. The Ext-to-exactness bridge remains explicitly unformalised.

```diff
--- a/report/sections/A2-verification.tex
+++ b/report/sections/A2-verification.tex
@@ -67,6 +67,7 @@
   \item A form of \Cref{thm:strong-nakayama} over an arbitrary ring: for a
     sequence of finitely generated projective right modules whose dual complex
-    is exact, with a nonzero quotient of the first term killed by the first
-    map, the cokernels of the dual complex are finitely generated left modules
+    is exact, with a nonzero quotient of the first term whose quotient map
+    annihilates the image of the first differential, the cokernels of the dual
+    complex are finitely generated left modules
     of projective dimension exactly~$n$, for every $n\geq1$. For a projective
     resolution of $E$, the vanishing of $\operatorname{Ext}^i_{A^{\op}}(E,A)$
```

### P2. Distinguish independent sessions from different models

Status: **supported**. **Unapplied**; author decision required because this changes a statement, attribution, or evidentiary claim.

At baseline A4:49–51, the absolute different-model and verdict-free claims conflict with the actual launch/task records. For example, D-A/V-A, D-B/V-B, D-D/V-D and D-E/V-E use distinct sessions of `gpt-6-astra`. The W2 frozen inputs qualify removal of verdicts; W4 tasks provide proof dossiers and earlier reports while forbidding reliance on their verdicts. A2 already uses the correct qualification. W5a, W5b and W5c are also distinct concurrent jobs (`codex/QUEUE.md`, `codex/tasks/W5a.md`, `W5b.md`, `W5c.md`), so the last sentence should be plural. The outcome CHECK stays pending; this proposal does not promote same-model checks to a different-kind verification status.

```diff
--- a/report/sections/A4-ai-declaration.tex
+++ b/report/sections/A4-ai-declaration.tex
@@ -47,7 +47,8 @@
 computation, proved by an AI model, or verified by a second, independent check
 of a different kind) and no claim was promoted without its evidence being
-recorded. A proof counted as verified only after a model other than its author,
-working in a fresh session and given the statement and proof without any earlier
-verdicts, had checked it step by step; several errors and gaps were found and
+recorded. Proofs were checked step by step in fresh sessions, sometimes of
+the same model that wrote them. For the proof-note checks, earlier verdicts
+were removed as far as possible, and reviewers were instructed not to use any
+remaining assessment as evidence; several errors and gaps were found and
 corrected in this way, and two broader claims were withdrawn. Computations used
 exact arithmetic over finite fields and rational function fields, and their
@@ -56,5 +57,5 @@
 being cited. Parts of \Cref{sec:criteria} are formally verified in Lean against
 Mathlib (\Cref{app:verification}). The completed article was reviewed block by
-block by a fresh session of GPT-6 Astra \CHECK{after W5: summarise the outcome}.
+block by fresh sessions of GPT-6 Astra \CHECK{after W5: summarise the outcome}.
 
 \subsection*{Repository}
```

### P3. Attribute the finitistic-dimension consequence to the combined argument

Status: **supported**. **Unapplied**; author decision required because this changes a statement, attribution, or evidentiary claim.

At baseline introduction:12–14, [AR75a, Theorem 1.1(b), p.71] supplies the generalised Nakayama failure for an endomorphism algebra, rather than explicitly asserting infinite finitistic dimension. The report itself correctly separates the two implications at section 3:140–146. Add that same internal dependency here. The published Library source was read and p.71 was visually checked; the theorem assumes positive self-Ext vanishing for a nonprojective generator.

```diff
--- a/report/sections/01-introduction.tex
+++ b/report/sections/01-introduction.tex
@@ -11,5 +11,6 @@
 second~\cite{OAI26ar} constructs a counterexample to the Auslander--Reiten
 conjecture over the field $\mathbb{F}_2(q,H_1,H_2)$; by a theorem of Auslander
-and Reiten~\cite[Theorem~1.1(b)]{AR75a}, such a counterexample yields a further
+and Reiten~\cite[Theorem~1.1(b)]{AR75a}, together with
+\Cref{thm:strong-nakayama}, such a counterexample yields a further
 algebra of infinite little finitistic dimension.
 
```

### P4. Supply precise companion-preprint locators

Status: **supported**. **Unapplied**; author decision required because this changes a statement, attribution, or evidentiary claim.

At baseline A3:6 and 18, specific imported statements need precise locators under the writing rules. The companion source `.cache/companion-src/sections/introduction.tex` and PDF give Theorem 1.1 (p.1), Corollary 1.2 (p.4), and Corollary 1.3 (p.5). The simple witness is Corollary 1.2(2); the proof of Corollary 1.3 on p.35 uses the left regular injective resolution. These references support the reported statements and the left/right distinction, without verifying the whole companion preprint.

```diff
--- a/report/sections/A3-companion.tex
+++ b/report/sections/A3-companion.tex
@@ -4,5 +4,5 @@
 The two preprints discussed in this article were released together with a
 third, \emph{A counterexample to Tachikawa's second
-conjecture}~\cite{OAI26tachikawa}. Its main theorem asserts that over
+conjecture}~\cite[Theorem~1.1 and Corollaries~1.2--1.3]{OAI26tachikawa}. Its main theorem asserts that over
 $\kk=\mathbb{F}_2(q,H_1,H_2)$ there are a finite-dimensional symmetric algebra
 $A$ and a nonprojective module $M$ with $\operatorname{Ext}^i_A(M,M)=0$ for all
@@ -16,5 +16,5 @@
 \Cref{thm:ar-to-findim} applies directly and gives infinite little finitistic
 dimension of $\operatorname{End}_A(A\oplus M)$, with one more simple module than
-$A$ if $A$ is basic and $M$ indecomposable. The preprint also states the
+$A$ if $A$ is basic and $M$ indecomposable. The preprint also states~\cite[Corollary~1.2(2)]{OAI26tachikawa} the
 existence of a simple
 $\Gamma$-module $S$ with $\operatorname{Ext}^i_\Gamma(S,\Gamma)=0$ for all
```

### P5. Locate the moving-parameter syzygies

Status: **supported**. **Unapplied**; author decision required because this changes a statement, attribution, or evidentiary claim.

At baseline section 3:322, the specific family occurs in [Schulz, Example 7, pp.372–373](https://doi.org/10.1017/S1446788700037265), published 1995 version: its two-dimensional syzygies have moving parameter. The source was read directly. This is a required locator correction, not a new mathematical conclusion.

```diff
--- a/report/sections/03-criteria.tex
+++ b/report/sections/03-criteria.tex
@@ -320,4 +320,4 @@
 $\Omega^nE$ of a witness of strong Nakayama failure have unbounded dimension:
 families of modules of constant dimension whose syzygies move along a
-parameter, such as those of Schulz~\cite{Schu95}, cannot be witnesses by
+parameter, such as those of Schulz~\cite[Example~7]{Schu95}, cannot be witnesses by
 themselves.
```

### P6. Identify which computations were not rechecked

Status: **supported**. **Unapplied**; author decision required because this changes a statement, attribution, or evidentiary claim.

At baseline A2:45, the unqualified statement overstates the limitation. `audit/V-C23-codex.md` includes recomputations of the size estimate (§8.8) and the six-dimensional periodic example (§9.2), but does not rerun the search experiments (§9.4). This is a correction to the description of that verification, based on the actual report, not reliance on its mathematical verdict.

```diff
--- a/report/sections/A2-verification.tex
+++ b/report/sections/A2-verification.tex
@@ -43,5 +43,5 @@
   \Cref{sec:obstructions}&Claude Opus~5.5, from proofs by GPT-6 Astra
     (medium to max)&GPT-6 Astra (max): theorems confirmed, two readings
-    corrected; the computations not rechecked&GPT-6 Astra (ultra): a gap in
+    corrected; the search computations not rechecked&GPT-6 Astra (ultra): a gap in
     the one-factor argument closed by a direct proof (\Cref{coro:one-factor})\\
 \end{tabular}
```

### P7. Distinguish the initial prose draft from later revisions

Status: **supported**. **Unapplied**; author decision required because this changes a statement, attribution, or evidentiary claim.

At baseline A4:22, the current prose includes documented GPT edits in the W4 reports and the present W5a diff. Claude’s initial authorship remains credited, but “all the prose” is inaccurate for the revised article. Attribution is substantive disclosure, so this wording is proposed rather than silently changed.

```diff
--- a/report/sections/A4-ai-declaration.tex
+++ b/report/sections/A4-ai-declaration.tex
@@ -20,5 +20,5 @@
     with the other models, as recorded in the repository), the proof notes
     compiled from earlier results, the checking of verification reports, the
-    first stage of the Lean formalisation, and all the prose of this article.
+    first stage of the Lean formalisation, and the first draft of the prose of this article.
   \item GPT-6 Astra (OpenAI), run in Codex (command-line interface, version
     0.161), with reasoning effort between medium and its highest setting:
```


## Validation and limitations

The 92 blocks are complete: 69 clean, 15 corrected, eight proposal blocks representing seven proposals (P4 spans two paragraphs). No statement, hypothesis or proof-step proposal was applied. The direct checks of the scoped mathematical arguments found no additional theorem-level defect; P1 concerns the description of the formalised statement. All conclusions remain AI assessments.

### Sources and independent checks

- All `report/sections/*.tex` files were read for context, conventions and cross-references. The direct checks in sections 2–3 were repeated independently by a fresh subagent; its output was treated as a lead and compared with the actual arguments. Detailed working notes: `scratch/W5a-criteria-check.md` and `scratch/W5a-appendix-evidence.md`.
- Linckelmann, arXiv:1211.5999v1, §2, (2.1), (2.2), (2.8), printed pp.3, 4, 6: read the Library source and checked the Tate degrees, duality and composition convention. See [the primary preprint](https://arxiv.org/abs/1211.5999).
- Auslander–Reiten 1975, Theorem 1.1(b), p.71: read Library pp.69–72 and inspected rendered p.71; the positive-degree condition is i≥1, despite imperfect OCR. The precise consequence accounts for P3.
- [Crawley-Boevey's lecture notes](https://www.math.uni-bielefeld.de/~wcrawley/1920noncommalg2/NA2.pdf), §3.2 Proposition 5, printed p.63 / PDF p.65: read the proof and checked its opposite-algebra convention.
- Happel, Library version, §2.3, p.5; Geiss–Labardini-Fragoso–Schröer, arXiv:2302.02085v2, Corollary 2.6, p.8: read the statements, standing field assumptions and the relevant arguments. The report correctly distinguishes its arbitrary-field argument.
- [Schulz's published article](https://doi.org/10.1017/S1446788700037265), Example 7, pp.372–373: read the moving-parameter syzygy example, giving P5.
- The companion preprint's actual source and PDF statements were read at Theorem 1.1 and Corollaries 1.2–1.3; the dominant-dimension proof of Corollary 1.3 was read on p.35. Its full construction was not verified, consistently with A3.
- Bas60 and ZHui95 Library entries have bibliographic metadata but no local PDFs. The historical attribution was checked against the author's later [survey, arXiv:1407.2383v1](https://arxiv.org/pdf/1407.2383), §2, p.3. Retrieval of the Bass publisher PDF failed. No exact page locator in Bas60 or the cited 1995 survey is independently certified by this review; their general historical citations remain unchanged.
- The saved Lean gate summaries, source scan, axiom reports, statement listings and kernel-replay records were inspected. Both saved stages report five zero exit codes. All ten files in the stage-2 source manifest match the current sources in the separate formalisation repository. The actual formal statements/source confirm the scope distinction and P1. **No new Lean build or kernel replay was performed.**
- The queue records W5a's requested launch as `gpt-6-astra`, effort `ultra`; that is launcher provenance, not independently exposed runtime identity. The first line therefore does not infer a precise model/effort from the assignment.

### Private build and visual checks

Both baseline and final builds ran the requested command from `report/`:

```sh
latexmk -pdf -outdir=../scratch/W5a-build main.tex
```

Both completed with exit 0 and produced 51 pages. Baseline logs/PDF are saved as `scratch/W5a-build-baseline.*`; final stdout is `scratch/W5a-build-final.stdout`, and the final log/PDF are `scratch/W5a-build/main.log` and `main.pdf`, also frozen as `scratch/W5a-build-final.log` and `scratch/W5a-build-final.pdf`. The build comparison is `scratch/W5a-build-comparison.json`.

The baseline had 23 overfull boxes and 31 duplicate-destination warnings. The final build has no overfull boxes in W5a's scope, zero duplicate destinations, and no undefined references or citations. It has one 11.19655pt overfull box in the concurrently edited section 4, paragraph at lines 165–173 (the run-in “Projective dimension and extinction” heading), outside W5a's scope. An earlier post-edit build had no overfull boxes anywhere; section 4 changed during the last build. This is not an attribution of every global warning reduction to W5a: the other two reviewers concurrently corrected their own files. Eighteen underfull hboxes and one underfull vbox remain, chiefly in the justified verification table; inspected W5a pages are readable, with no clipping or overlap. The layout of the table was preserved.

The preamble destination fix was tested on identical isolated full-article snapshots. It changes 31 duplicate-destination warnings to zero, preserves all 160 label numbers and pages, and leaves all 51 rendered page images unchanged. Its 425 named internal links all resolve. Evidence and reproducible diagnostic: `scratch/W5a-anchors/REPORT.md`, `computations/W5a-anchor-check.py`, `computations/W5a-anchor-check.out`. Seven theorem-style destinations still sit at the bottom of the preceding page rather than on the heading's page; this is a separate placement limitation, explicitly listed in that report. This review does not certify exact heading-page alignment.

The final scoped pages (1–8 and 47–50) were rendered and visually inspected. The last hyphenation correction changed only page 1 among these pages, and that page was inspected again. After the final rebuild incorporating concurrent edits, all twelve scoped page renders remained byte-identical to those inspected. Baseline scope-specific overflows were checked against the rendered corrections: the finitistic-dimension definition, the run-in AR heading, the verification table width and the repository URL/marker. The final PDF's 425 named internal links resolve to its 343 destinations; the check is saved in `scratch/W5a-final-pdf-check.json`.

Source anchors in the coverage table refer to `scratch/W5a-source-before/`, not mutable current offsets. In section 2, lines after the reflowed definition shift by one; main.tex's preamble additions also move subsequent anchors. The unified diff and first words provide the correspondence. The snapshot immediately before the final build is `scratch/W5a-source-at-final-build/`, with hashes in `scratch/W5a-final-build-inputs.sha256`. Post-build hash checks match all W5a scope files; section 4 changed concurrently, so this is not a stable whole-article source receipt. Edits by concurrent reviewers are not W5a source edits. Scoped `git diff --check` passed. No commit was made; `log/CONVERSATION.md` was not edited.

Existing release decisions remain unresolved: final date, human-check declaration, final repository URL, W5's combined outcome and W6 feasibility. They were not guessed or certified.

### Accidental diagnostic build and recovery

One delegated hyperlink diagnostic ran `latexmk -pdf -outdir=build main.tex` from the repository root rather than its scratch directory. TeX found an unrelated system example named main.tex and wrote temporary `build/main.*` auxiliary outputs. This violated the read-only instruction for `build/`; the error was disclosed immediately on detection. The run ended with exit 12, and its generated files and stdout were moved without deletion to `scratch/W5a-anchors/accidental-root-build/`. All subsequent tests used the explicit private working directory.

All nine tracked `build/` inputs remain present and hash-identical to HEAD; `git diff --exit-code -- build` passes and `git status --short -- build` is empty. The recorder lists no writes to those source files or `.claude/`. There was no pre-run inventory of hypothetical ignored `build/main.*` files, so their prior contents cannot be independently certified. The complete command, output-file inventory, timestamps and recovery evidence are in `scratch/W5a-anchors/REPORT.md`. `paper.pdf` was not modified.
