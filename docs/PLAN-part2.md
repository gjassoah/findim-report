# Plan, part II: a research report on the OpenAI finitistic-dimension preprints

## Context

Part I (Phases 0–6, 2026-10-07/08; record in the repository: `REPORT.md`, `notes/01–03`, `LEDGER.md`,
`audit/02–12`, `computations/01–07`, Lean stages 1–2) ended with a negative search outcome: no simpler,
hand-checkable counterexample; instead verified criteria (O.4, O.5), structural obstructions (O.2, O.3,
F.2–F.3, OF.1), sizes of the known constructions, and a partial Lean formalisation.

Gustavo now wants a **research report written from scratch** (not a rewrite of the preprint) that uses this
knowledge: complete proofs, plus the insights on the constructions and proof mechanisms, in a structure of
our choosing, under his writing instructions (AI_WRITING_PROCESS, MATHEMATICAL_WRITING_STYLE,
LATEX_PREAMBLE_STYLE; MATHEMATICAL_DOCUMENT_REVIEW for the review).

### Decisions by Gustavo (2026-10-08)

- **Scope:** the main preprint in full, and the Auslander–Reiten route (conversion principle, O.5, sizes,
  obstructions); the Tachikawa companion only as a remark.
- **Proofs:** every result stated gets a complete proof written from scratch and verified by Codex in a
  fresh context before it enters the text; long finite computations go to appendices with scripts.
- **Byline:** along the lines of "Prepared autonomously by AI as instructed by Gustavo Jasso". Proposal
  (final wording Gustavo's):

  ```latex
  \title{Mechanisms for infinite finitistic dimension}
  \author{Prepared autonomously by AI agents (Claude Opus~5.5 and GPT-6 Astra)\\
          as instructed by Gustavo Jasso}
  ```

  with his address as the contact address, and the models named exactly as the records name them.
- **Declaration of AI use (Appendix D):** a reasonably detailed declaration of the use of AI and an outline
  of the process that produced the article: the models and their roles (Claude Opus 5.5 orchestration and
  drafting; GPT-6 Astra in Codex verification, computation, review, Lean stage 2; Claude Fable 5.1 two
  consults; Claude Sonnet retrieval), the workflow (task design by Gustavo, research phases, statuses of
  claims, fresh-context verification by a different model, computations, Lean, the block-by-block review),
  what Gustavo did and did not check, and a link to the future GitHub repository **findim-report**
  (URL `https://github.com/gjassoah/findim-report`, marked \CHECK until the repository exists; creating
  and pushing it needs Gustavo's approval), stating that it contains the full record: notes, audits,
  scripts, Lean evidence and a log of all interactions (Gustavo's messages verbatim, the agents' replies
  summarised). The provenance declaration at the top of `main.tex` stays in addition (AI_WRITING_PROCESS
  §6.1).
- **Models:** Fable is not planned for. Codex (GPT-6 Astra, including its highest effort, "Ultra") may be
  used freely.
- **After the report:** an autonomous block-by-block review in a fresh context; then an evaluation of the
  feasibility of a Lean formalisation of the report (including a conditional one).
- **Genre (assumed, no answer given):** research article (`MATHEMATICAL_WRITING_STYLE` §0.4 default),
  amsart, with appendices for computations and the verification record; length as the mathematics needs,
  expected 40–60 pages.

## Task declaration (AI_WRITING_PROCESS §1)

Genre: research article. Mode: drafting from notes (our notes, audits, the preprints as sources to be
reproved, not copied). Status: new manuscript. Authorship: AI-written (provenance declaration, §6.1).
Venue: none (arXiv-style). British spelling, `this article`, no contractions, 80-column source.

## Proposed structure of the article (title as a plain noun phrase, e.g. "Mechanisms for infinite finitistic dimension")

1. **Introduction** — the conjecture; what the two preprints claim; what the article does (reconstruct and
   reprove the mechanisms, isolate criteria, prove obstructions to simplification, record what was
   verified and how); main results stated as pointers.
2. **Conventions and preliminaries** — modules, grading/shift conventions (fixed once), transpose, stable
   categories of symmetric algebras and Tate duality, Toda brackets, trivial extensions.
3. **Criteria for infinite little finitistic dimension** — projective coresolutions (Lean L.1); strong
   Nakayama failure (O.4, Lean L.2, with Crawley-Boevey's mechanism attributed); the module-theoretic
   reformulation (F.1 corrected); Auslander–Reiten counterexamples (O.5, AR 1975); simple witnesses force
   corners (F.2); triangular gluing (F.3 corrected); bounded-dimension constraints (O.2a/b).
4. **Trivial extensions and extinction** — the bar decomposition (own proof; MY attributed), the extinction
   criterion (O.1), K₀-invisibility and why iterates must have zero class.
5. **Selection data** — generalised selection data (R, Ψ) (O.3' — must be proved or stated as the
   preprint's special case), the rank-function obstruction (O.3), the Abels-type group: presentation,
   central involutions, finite quotients (proofs; computations in an appendix).
6. **From selection data to a bimodule complex** — encoding algebra B, Verdier quotient and action, the
   odd double (with its K₀ reading), diagram lifting by roofs (where non-constructivity enters),
   rectification, the realisation theorem.
7. **Simulation and the final algebra** — the ordinary bimodule, A = D ⋉ X, the theorem; what is and is
   not explicit (size of l unknown).
8. **The Auslander–Reiten route** — the conversion principle (full proof), the ingredients C, T, τ,
   twists and the 2×2 determinant (finite data in an appendix), O.5 ⇒ a finitistic counterexample with nine
   simples; the size of the specified and of the minimised constructions (≈10³⁵ as specified; the minimised version not completed).
9. **Obstructions to smaller constructions** — the weight argument (W.1/W.2) and its limits (6-dim
   example), the Tate-duality obstruction OF.1, the explicit failures (test bed, Candidate 1).
10. **Appendices** — A: computations (scripts, tables, scope); B: verification and formalisation record
    (what was checked, by which model, how); C: the companion's Nakayama-type consequences (remark only); D: declaration of the use of AI and
    outline of the process, with the link to `findim-report`.

The exact cut between sections 5–7 and their proofs is decided in W1 (outline note), after the conventions
table.

## Phases

### W0 — Setup
- Manuscript directory `report/` in this repository: `main.tex` (preamble from
  `preamble-template.tex`, whole preamble in the main file; draft markers \CHECK, \REFQ,
  \GAP; provenance declaration block), sections as `report/sections/NN-name.tex` included with `\input`,
  `report/references.bib`, `report/latexmkrc` (latexmk + biber; tools present: latexmk, biber, pdflatex).
- `report/PROGRESS.md` (sections done / in progress / pending, open markers) — per AI_WRITING_PROCESS §10;
  the task-level `PROGRESS.md` points to it.
- Check how Codex exposes the "Ultra" setting (`codex exec --help`, a one-line test job with
  `model_reasoning_effort="ultra"` or the corresponding model/profile) and record it in `codex/QUEUE.md`.
- Codex jobs that must follow the writing or review rules read `*.md` directly (read
  access only); the task files name the sections to read.
- Re-read in full before drafting: MATHEMATICAL_WRITING_STYLE.md, LATEX_PREAMBLE_STYLE.md (paper parts),
  AI_WRITING_PROCESS.md (read 2026-10-08 during planning), MATHEMATICAL_DOCUMENT_REVIEW.md (before W5).

### W1 — Spine, conventions, bibliography
- `report/notes/outline.md`: logical spine (statements, dependencies, which proofs exist where).
- `audit/report-notation.md`: one convention for each sign, shift, grading, side (left/right), path
  composition, transpose and Tate-duality normalisation; reconciled with the preprints' and our notes'
  conventions (part I found convention errors in several places).
- Bibliography: entries copied from `library.bib` where present (AR75a, Hap90, MY17, NRS02,
  Kel99a, Reg19, Hui14, Cum22, Ric19, Che26c, …); missing arXiv works imported into the author's reference library by the
  standard workflow (Geiß–Labardini-Fragoso–Schröer 2302.02085, Schofield 0708.0257, Linckelmann
  1211.5999); missing non-arXiv works (Igusa–Todorov, Green–Kirkman–Kuzmanovich, Green–Huisgen-Zimmermann,
  Crawley-Boevey's notes, Müller, …) from zbMATH/MathSciNet data, verified, reported to Gustavo. The three
  OpenAI preprints as @misc with their GitHub locations. Retrieval by a Sonnet subagent; every locator
  read in the source before use (\REFQ until then).

### W2 — Proof dossier (before any prose)
For each result the article states, a proof note `report/notes/proofs/NN-*.md` written from scratch (attempt
before re-reading the preprint's proof; compare afterwards), then a **fresh-context Codex verification**
(new session, frozen statement + proof + conventions, no statuses; effort max/Ultra for the hard ones),
report in `audit/report-*.md`, verdict recorded in `LEDGER.md`. Order by risk: the conversion principle
(AR §2), diagram lifting and the odd double, rectification, bar decomposition and simulation (signs), the
Abels-type group (finite presentation, centrality), then the already verified items (only re-checked for
the article's conventions). Codex runs several independent verification jobs in parallel. Anything that
fails verification is corrected, weakened, or left out with a remark (author's decision if it changes a main
statement).

### W3 — Drafting
- Claude Opus 5.5 drafts each section from the dossier (statements first, proofs in logical blocks,
  insights where they help a specialist follow the architecture), with markers for anything unverified.
- Codex jobs in parallel: appendix tables regenerated from the scripts; consistency checks (every
  cross-reference, every number in the text against `computations/`).
- After each section: compile (no errors, no undefined references), style checks (the grep battery of
  AI_WRITING_PROCESS §8), commit, update `report/PROGRESS.md` and the log.

### W4 — Mathematical verification of the draft
Each section, as written, verified by a fresh Codex session against the dossier (does the text say what was
verified; are hypotheses, quantifiers, signs intact). Markers resolved or listed.

### W5 — Autonomous block-by-block review (fresh context)
Per MATHEMATICAL_DOCUMENT_REVIEW, autonomous mode, scope: the whole article. Reviewer: a fresh Codex session
at the highest effort (independent of the drafter, Claude), reading the review protocol and the style files
itself; it decides and applies corrections of evident slips, typesetting and grammar, reports every block in
one table, compiles, and lists every mathematical change beyond an evident slip as a proposal. Claude then
reviews the diff and the proposals (accepting or rejecting with reasons), recompiles, commits. Review
ledger in `audit/report-review.md`.

### W6 — Finalisation and Lean feasibility
- Pre-submission checks (AI_WRITING_PROCESS §8); markers removed from the preamble only when none remain;
  provenance declaration and Appendix D updated with every model and its stage (names exactly as in
  `PROGRESS.md`); byline and repository URL confirmed by Gustavo.
- The public repository `findim-report`: propose its contents (this repository's record, the report
  sources and PDF, a pointer to or copy of the Lean repository) and description; creation and push only with
  Gustavo's approval (CODE_AND_APP_DEVELOPMENT §3; the name follows his instruction rather than the
  directory name).
- **Lean feasibility evaluation** (`lean/FEASIBILITY-report.md`): for each result of the article, what
  Mathlib provides (searched at the pinned commit), what is missing, cost estimate; proposals for
  unconditional stages (e.g. O.5, F.1–F.3, the group-theoretic part, the bar decomposition at chain level)
  and for a conditional formalisation (interfaces with fields of kinds (a)–(c), listed for Gustavo's
  approval one by one, LEAN §2.4). No Lean code beyond small feasibility probes until he approves.
- Final `REPORT.md` update; log.

## Model allocation for part II

| Work | Model |
|---|---|
| Outline, conventions, proof notes, drafting all prose, judgement on verdicts | Claude Opus 5.5 |
| Fresh-context verification of every proof; appendix computations; consistency checks; the W5 review | Codex GPT-6 Astra, high/max ("Ultra" where the job is hard), many jobs in parallel via `tools/codex_run.sh` |
| Bibliography retrieval, grep battery, mechanical checks | Claude Sonnet subagents (output checked) |
| Fable 5.1 | none planned |

Interruptions are handled as in part I (job queue, state in files, resumption from the record).

## Verification (of the plan's execution)

- Every theorem, proposition and lemma of the article has a ledger row with an AI-verified status (or is
  explicitly marked otherwise in the text and in `REPORT.md`).
- `latexmk` builds `report/main.pdf` without errors, undefined references or citations; the §8 grep
  battery is clean or every hit is justified in `report/PROGRESS.md`.
- The W5 review ledger covers every block; all proposals answered.
- `log/CONVERSATION.md`, `PROGRESS.md`, commits at each section milestone.

## Part I (completed, for reference)

Phases 0–6 as approved on 2026-10-07; amendments after Codex's critique and the Phase 3 decision are in the
repository's `docs/PLAN.md`. Decisions of part I (local commits, simplified conversation log, extended
summaries of the instruction files, headless Codex, licences) remain in force.
