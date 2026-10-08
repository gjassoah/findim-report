# Report on OpenAI's counterexamples to the little finitistic dimension conjecture for finite-dimensional algebras

This repository contains a mathematical report prepared by AI agents and the complete working record of the
AI-assisted investigation that produced it. The investigation was orchestrated by Gustavo Jasso; the report
and the records were written by AI models (Claude Opus 5.5 and GPT-6 Astra, with occasional use of other
models).

**The report:** [`report/findim-report.pdf`](report/findim-report.pdf) (sources in [`report/`](report/)).
**It has not been verified by a human**, and it is provided as is. It reconstructs, with complete proofs,
the two constructions of finite-dimensional algebras of infinite little finitistic dimension released by
OpenAI in September 2026, and adds criteria for infinite finitistic dimension and obstructions to simpler
constructions. The repository is meant to make independent mathematical scrutiny of these counterexamples
easier; it does not establish that they have been independently verified.

## Purpose

The repository serves two purposes.

1. **Mathematics.** Additional exposition, generalisations and arguments that may help researchers
   understand and independently check OpenAI's counterexamples: the report, the proof notes it was written
   from (`report/notes/proofs/`), the criteria and obstructions of the first part of the work (`notes/`), the
   computations (`computations/`) and a partial formalisation in Lean (`lean/formalisation/`).
2. **Method.** The record of an experiment in coordinating several AI models on advanced mathematical work:
   exploration, construction of proofs, independent checking, exact computation, partial formalisation and
   exposition. The roles were kept separate (one model drafting, others checking in fresh sessions, a proof
   assistant checking formal statements), and every step is documented with its evidence. The record shows
   what the workflow produced, the errors and limitations met along the way, and the evidence for each
   result; it does not show that AI models can reliably verify difficult mathematics.

## Levels of verification

Every mathematical claim in the records carries a status (definitions in
[`docs/WORKING_RULES.md`](docs/WORKING_RULES.md); one row per claim in [`LEDGER.md`](LEDGER.md)). The kinds of
evidence are distinguished as follows.

| Evidence | Meaning in this repository | Status | Where |
|---|---|---|---|
| Proof in the report | A complete written argument, produced by an AI model | AI-proved | `report/`, `report/notes/proofs/` |
| Independent AI check | An AI-proved claim that passed an independent check of a different kind: a step-by-step check in a fresh session (mostly by a different model) given the statement and proof without earlier verdicts, an independent computation, a formal proof, or the reading of a cited statement in its source | AI-verified | `audit/`, `LEDGER.md` |
| Computation | Exact computation over finite fields or function fields, valid only in the stated cases and degrees | supported | `computations/`, Appendix A of the report |
| Formal verification | Kernel-checked by Lean 4 against Mathlib, exactly under the hypotheses of the formal statement; one stage is conditional on explicitly stated hypotheses | formally verified in Lean | `lean/formalisation/`, `lean/gates/`, Appendix B of the report |
| Human verification | None | — | — |

None of these establishes the correctness of the report as a whole. The AI checks are not a certification:
they found and repaired errors, recorded in `audit/` and in Appendix B of the report, and may have missed
others. The formal verification covers only the results listed in Appendix B, under the hypotheses stated
there. No statement in this repository has been checked by a human.

## Outcomes

**First part: search for a simpler counterexample (see [`REPORT.md`](REPORT.md)).** No simpler
counterexample verifiable by hand was found. The work produced an account of the preprint's mechanism (its
algebra is not explicit: the construction passes through a non-constructive lifting, and the number of simple
modules is not determined); two elementary criteria for infinite little finitistic dimension (O.4: failure of
the strong Nakayama property; O.5: a counterexample to the Auslander–Reiten conjecture gives one, with one more
simple module), both independently checked, O.4 also formally verified in Lean; and structural obstructions showing
that the smallest available design (one tensor factor) cannot work, while the working two-factor design is
enormous as specified (dimension about 10³⁵) and could not be completed computationally even when minimised.

**Second part: the report.** Written from scratch on the two OpenAI constructions (the main preprint and the
route through the Auslander–Reiten conjecture), with complete proofs, each checked in a fresh Codex session,
an autonomous block-by-block review, and a Lean formalisation of selected parts: Lean stages 3a, 3b, 3c and
4b unconditionally, stage 4a conditionally. Status of the report: [`report/PROGRESS.md`](report/PROGRESS.md);
summary: `REPORT.md` §7; AI resources used: [`USAGE.md`](USAGE.md).

## The record

- [`log/CONVERSATION.md`](log/CONVERSATION.md) is a curated chronological record of the interactions,
  instructions, decisions and outcomes: Gustavo's messages are quoted verbatim (a few phrases concerning
  private account or system details are redacted and marked), the agents' replies and the exchanges with
  Codex and Fable are summarised, with pointers to the task and answer files. It is not a raw transcript,
  and none is included. It covers the work up to the end of the plan's execution (8 October 2026); the
  preparation of the public release is described in
  [`docs/findim-report-proposal.md`](docs/findim-report-proposal.md).
- The plan and the working rules: [`docs/PLAN.md`](docs/PLAN.md), [`docs/PLAN-part2.md`](docs/PLAN-part2.md),
  [`docs/WORKING_RULES.md`](docs/WORKING_RULES.md) (extended summaries of the author's instruction files).
- The origin of each idea and argument: [`PROVENANCE.md`](PROVENANCE.md); the model behind each unit of work:
  [`PROGRESS.md`](PROGRESS.md); verification reports: [`audit/`](audit/); Codex task files and answers:
  [`codex/`](codex/); computations with their outputs: [`computations/`](computations/); the formalisation
  and its development record: [`lean/`](lean/).

## The preprint under examination

**An algebra of infinite little finitistic dimension**, by OpenAI, dated September 23, 2026. It is not
redistributed here: [`PREPRINT.md`](PREPRINT.md) gives a pinned link and checksums. The companion preprints
*An explicit counterexample to the Auslander–Reiten conjecture* and *A counterexample to Tachikawa's second
conjecture* are available from the same repository.

```bibtex
@misc{OAI:An-algebra-of-infinite-little-finitistic-dimension-September-23-2026,
  author = {{OpenAI}},
  title = {{An algebra of infinite little finitistic dimension}},
  howpublished = {OpenAI Math Release preprint
                  \href{https://github.com/openai/math/blob/main/preprints/An-algebra-of-infinite-little-finitistic-dimension-September-23-2026/paper.pdf}{OAI:An-algebra-of-infinite-little-finitistic-dimension-September-23-2026}},
  year = {2026}
}
```

## Versions

The first public release is tagged `v0.1.0`. Corrections and further verification are recorded in later
commits and in GitHub issues, so that the state of the record at the release remains available.

---

## The original task: understand the preprint and search for a simpler counterexample

This is the task README under which the work was carried out (the second part, the report, is planned in
`docs/PLAN-part2.md`). The agents worked with Claude Code (Claude Opus 5.5, occasionally Claude Fable 5.1 and
smaller Claude models for mechanical work) and Codex (GPT-6 Astra).

### 0. Instructions

The agents read, before starting, Gustavo's instruction files on AI-assisted research, writing, document
review, code development and Lean formalisation (summarised in `docs/WORKING_RULES.md`). If one of them
cannot be read, work stops. Mode: autonomous over several sessions, with Gustavo's decisions recorded in §4.

### 1. Problem

For a finite-dimensional algebra A over a field, the little finitistic dimension findim A is the supremum of
the projective dimensions of the finitely generated A-modules of finite projective dimension. The *little
finitistic dimension conjecture* (Bass, 1960) asserts findim A < ∞ for all such A.

The preprint claims a counterexample: a finite-dimensional complex algebra A = D ⋉ X (a trivial extension of
an algebra D of finite global dimension by an ordinary bimodule X) with modules N_m such that
2m − 2 ≤ pd N_m < ∞. The construction passes through a finitely presented group of Abels type, a Verdier
quotient of a homotopy category, a non-constructive lifting of a diagram, and a rectification to a bimodule
complex. The resulting algebra is not explicit: neither its number of simple modules (3(l+2), with l the
unknown length of a complex) nor its arrows and relations are given.

The task has two parts.

1. **Understand the preprint**: the logical structure, which properties of each ingredient are used, and the
   steps that are reused below (checked, with scope recorded). A full verification of the preprint is not the
   goal.
2. **Search for a simpler counterexample**, preferably verifiable by elementary means, with an explicit
   presentation by a quiver with relations, or otherwise tractable by hand. Algebras with a very large number
   of simple modules are excluded unless they have a useful conceptual or combinatorial description.

#### Expected results

A successful outcome: an explicit algebra with an elementary proof that findim = ∞, verified independently
(computation, a second model) and, as far as feasible, formalised in Lean. A smaller acceptable outcome: a
clear account of the preprint's mechanism, a substantially simpler (if not yet elementary) construction, or
documented obstructions showing what any simpler counterexample must look like.

#### Claims to check

Every claim of the preprint that is used, the attributions it makes, and the structural claims the agents
make along the way (necessary conditions, generalisations). Beliefs about the answer are claims, not premises.

### 2. Inputs and their trust

| Input | Path | Trust |
|---|---|---|
| The preprint, OpenAI, 2026-09-23 | [`PREPRINT.md`](PREPRINT.md) (pinned link; not redistributed) | Under examination: every claim used is checked |
| Cited literature (Minamoto–Yamaura, Neeman–Ranicki–Schofield, Santos Rego, Cummings, Rickard, …) | Gustavo's local library | Reliable once the statement and hypotheses are read in a pinned version |
| Companion preprint *A counterexample to Tachikawa's second conjecture* (OpenAI, 2026-09-23) | to be obtained | Untrusted leads |
| Chen, arXiv:2610.00433 (big findim of a radical-cube-zero algebra) | arXiv | Related literature; read in its pinned version before use |
| AI output of all agents in this repository | everywhere | Leads until verified as recorded in `LEDGER.md` |

### 3. Conventions

The preprint's conventions are used unless stated otherwise: left modules; products of paths and composition
written right to left; cohomological grading with K[s]^n = K^{n+s} and d_{K[s]} = (−1)^s d_K; derived tensor
products marked by L. Any departure is recorded in the note that makes it.

### 4. Decisions

Gustavo Jasso's decisions are recorded verbatim in `log/CONVERSATION.md`. The scope of the formalisation was
delegated to the agents, but each hypothesis of a conditional formalisation required his approval. Reserved
for him were any departure from the task's intent, the demotion of a main result, remarks about errors in
others' work, and disclosure.

### 5. Phases

The phases of the work are described in `docs/PLAN.md` (first part) and `docs/PLAN-part2.md` (the report).

### 6. Tools and resources

GAP 4 with QPA, SageMath, Python 3 (SymPy), Lean 4 with Mathlib (pinned), Codex CLI (GPT-6 Astra). Network
access to arXiv.

## Repository map

| Path | Content |
|---|---|
| [`report/findim-report.pdf`](report/findim-report.pdf) | The report (PDF); sources in `report/` |
| `PREPRINT.md` | Pinned link and checksums of the preprint under examination |
| `PROGRESS.md` | Current phase, next actions, decisions, model attribution |
| `LEDGER.md` | One row per claim: status, evidence, pointer |
| `PROVENANCE.md` | Origin of each idea and argument |
| `QUESTIONS.md` | Open questions for Gustavo |
| `REPORT.md` | Final report (at the end) |
| `USAGE.md` | AI resources used (Claude Code figures, Codex jobs) |
| `report/` | The research report of part II (LaTeX sources, notes, proof dossier) |
| `log/CONVERSATION.md` | The conversation log |
| `log/RESUME.md` | How to resume after an interruption |
| `docs/` | The plan and the working rules |
| `notes/` | Developed arguments, one per unit |
| `computations/` | Scripts with headers, and their saved output |
| `audit/` | Verification reports, literature quotations with locators |
| `escalations/` | Self-contained problems for a stronger model (Fable), with answers |
| `codex/` | Task files for Codex, its answers, and the job queue |
| `lean/formalisation/` | The Lean sources (a copy of the Lean repository `findim-counterexample-formalisation`) |
| `lean/` | Development record of the formalisation: design, feasibility, gate logs (`lean/gates/`) |
| `tools/` | Helper scripts |
| `scratch/` | Intermediate files |

## Contributors and licence

Gustavo Jasso (task design, direction, decisions); Claude Opus 5.5 (orchestration, notes, reviews,
drafting of the report, Lean stage 1); Codex GPT-6 Astra (verifications, computations, the review of the
report, Lean stages 2, 3a, 3b, 3c, 4a and 4b, the Tate-duality obstruction); Claude Fable 5.1 and Claude Sonnet (consults, summaries, retrieval). Details: `PROVENANCE.md`,
`PROGRESS.md` (model attribution) and `log/CONVERSATION.md`.

Prose and data under CC BY 4.0, code under Apache 2.0; the preprint, which is OpenAI's, is not part of the
licensed content.
See [`LICENSE.md`](LICENSE.md).

