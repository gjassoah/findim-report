# Plan: understand the OpenAI findim preprint and search for a simpler counterexample

## Context

The repository holds the preprint *An algebra of infinite little finitistic dimension* (OpenAI, 2026-09-23;
`paper.pdf`, sources in `build/`). It claims a finite-dimensional complex algebra A = D ⋉ X with modules N_m,
2m−2 ≤ pd N_m < ∞. Gustavo wants (1) a real understanding of the construction and (2) a search for a
*simpler* counterexample to the little finitistic dimension conjecture: an explicit quiver with relations (or a
conceptually/combinatorially described algebra) whose key properties can be checked by elementary means.
Ground rules: everything is logged, including all prompts (the repository will be public); work autonomously;
use models economically, with Codex (GPT-6 Astra, max effort) as a collaborator and Fable 5.1 used sparingly.

### What the paper does (read in full, 2026-10-07; statuses are the paper's claims, not ours)

1. **Selection input (§2).** A finitely presented group G of Abels type (15 generators), R = ℂG, a central
   idempotent e = (1+z_0)/2 and an automorphism α with α(z_N) = z_{N+1}. H(Y) = ₐ(eY). Finite quotients
   F_m ⊂ GL_5(𝔽_2[t]/(t^m−1)) give finite-dimensional Y_m with H^{m−1}Y_m ≠ 0 = H^m Y_m.
2. **Encoding and lifting (§3).** A quadratic presentation of R gives a 3-vertex directed algebra B
   (gldim ≤ 2, 2+2d arrows, d ≈ number of generators after quadratisation, so dozens to hundreds) and modules M(Y).
   In the Verdier quotient Q = K^b(proj B)/⟨cone s, cone s'⟩, R acts on E_0; the "odd double" U ⊕ U[3] of the
   non-split summand U = (E_0, θ(e)) is an honest object; the B-diagram on it is lifted to K^b(proj B) by roofs.
   **This step is non-constructive: P is not explicit, nor is its length l.**
3. **Rectification (§4).** A three-column bimodule complex P with P ⊗ᴸ M(Y) ≃ M(HY) ⊕ M(HY)[3] (explicit
   given the chain data).
4. **Simulation and trivial extension (§5–6).** D = B × (B⊗C), C = A_{l+1} with rad² = 0, X = O ⊕ T an ordinary
   bimodule with F² = P[b_*] ⊗ᴸ −, where F = X ⊗ᴸ_D −; the bar decomposition D ⊗ᴸ_A N ≃ ⊕_r F^r N[r] gives
   pd_A N < ∞ iff F^r N = 0 for large r, and pd_A N ≥ r if F^r N ≠ 0 (cf. Minamoto–Yamaura).

So the paper's A has 3(l+2) simples with l unknown, a very large number of arrows, and a non-explicit X. The
target is far simpler.

### Structural observations to start from (status: heuristic or plausible; to be checked in Phase 1–2)

- **Reduction.** Steps 3–4 are general and explicit: any finite-gldim D with a bounded bimodule complex P
  (termwise right projective) such that P ⊗ᴸ − has *finite but unbounded extinction times* on finite-dimensional
  modules gives a counterexample. The whole difficulty is producing such (D, P) explicitly.
- **Necessary conditions** (plausible): the class of F^r N in K_0 dies after rank K_0(D) steps, so long
  extinction needs K_0-invisible cancellation (as with the odd double M ⊕ M[3]); a right-projective X (exact F)
  gives bounded extinction; D derived-finite (for example Dynkin hereditary) gives bounded extinction by
  Krull–Schmidt; a finite-dimensional R in step 1 gives bounded extinction (decreasing chains of idempotents
  stabilise). Known positive results also exclude monomial A, rad³ = 0, representation dimension ≤ 3.
- **Possible generalisation of step 1** (plausible): centrality of e seems unnecessary. A unital homomorphism
  α: R → eRe for an arbitrary idempotent e should suffice, with H^j(Y) = α^{j−1}(e)Y. This allows much smaller
  R, e.g. "shift" algebras such as k⟨x,y⟩/(xyx−x, yxy−y, …) acting on Jordan-type modules Y_m = k^m with
  H(Y_m) ≅ Y_{m−1} (finite presentation of the right quotient to be determined).

## Ground rules as implemented

### Logging (public repository)

- `log/CONVERSATION.md`: a simplified log of the conversation, written by hand as it happens. Each entry has a
  date, Gustavo's message verbatim (prompts, answers to questions, interruptions and corrections, starting with
  the first prompt of 2026-10-07 and the `/plan` activation), and a short summary of my reply: what I did,
  what I decided, what I asked. No raw transcripts, tool output or system text.
- Exchanges with Codex and Fable: the task file (`codex/tasks/`, `escalations/`) and the final answer are kept;
  `log/CONVERSATION.md` gets a one-line entry per exchange pointing to them.
- Model attribution (AI_RESEARCH_PROCESS §11) is a column in `PROGRESS.md` (model, effort, unit of work,
  output file).
- `PROGRESS.md`, `LEDGER.md`, `PROVENANCE.md`, `QUESTIONS.md`, `REPORT.md`, `notes/`, `computations/`,
  `audit/`, `escalations/` as in AI_RESEARCH_PROCESS §9.2, kept proportionate (§9.3).
- `README.md` rewritten as the public entry point (paper citation kept), with a task section from
  `RESEARCH_TASK_README.md` and a short "how this was done" section pointing to `log/`.

### Model allocation

| Role | Model | Use |
|---|---|---|
| Orchestration, dossier, day-to-day mathematics, scripts | Opus 5.5 (this session) | default |
| Mechanical work: retrieval, quotations with locators, running scripts | Sonnet/Haiku subagents | output checked before use |
| Independent verification (counts as "different model", §5.2); one parallel research line | Codex, GPT-6 Astra, max | task files in `codex/tasks/`, run with `codex exec` headless (or relayed by Gustavo) |
| Two or three high-value calls: idea consult after the obstruction survey; final adversarial review of the candidate | Fable 5.1 | via subagent with `model: fable`, prompts saved in `escalations/` |

## Phases

### Phase 0 — Setup (short)
1. Create the directory structure and `log/CONVERSATION.md` with the planning conversation so far (first
   prompt, the answers to the planning questions, and the three corrections: instruction summaries,
   formalisation, simplified log); write `README.md`, `PROGRESS.md`,
   `docs/WORKING_RULES.md`.
2. Write `tools/codex_run.sh`, `codex/QUEUE.md`, `log/RESUME.md`; test headless Codex from this sandbox
   (`codex exec -s read-only`, network to the OpenAI API) and record what its usage-limit error looks like;
   fall back to Gustavo running the task files if it fails.
3. Send this plan to Codex for critique (Codex-side features: model switching, profiles, `exec resume`,
   subagents); record the exchange in `log/codex/`; amend the plan if useful.
4. Import the key references into the author's reference library via its import script (Minamoto–Yamaura
   1710.01469, Santos Rego 1901.06704, NRS 2004, Keller 2000, the companion Tachikawa preprint if available);
   use the existing Library copies (Cum22, Ric19, Che26c, GPS21, …).
5. Literature watch: search arXiv / the web for follow-ups to the preprint since 2026-09-23 (simplifications,
   errors, comments). Record what was searched.

### Phase 1 — Understanding (dossier, targeted checks)
Deliverable `notes/01-how-the-construction-works.md` (exposition) and `LEDGER.md` rows for each lemma.
- Reconstruct the logical interface: exactly which properties of (R, e, α), B, P, D, X are used where.
- Computational checks (GAP/QPA, Sage, Python; scripts with headers in `computations/`):
  the group relations in F_m and independence of z_0..z_{m−1} for small m; the bar/MY formula
  pd_A N = sup(pd_D F^r N + r) on toy trivial extensions; the rectification lemma on a toy B-diagram.
- Pen-and-paper check of the odd double lemma, the lifting lemma and Corollary 6.3, with a Codex fresh-context
  verification of the steps we will reuse. (Full verification of the preprint is not the goal; record scope.)
- Output: the abstract criterion "(D, P) with unbounded finite extinction ⇒ counterexample", with proof status.

### Phase 2 — Constraints and generalisations
Deliverable `notes/02-constraints.md`.
- Prove or refute the necessary conditions listed above (K_0, exact F, derived-finite D, finite-dimensional R,
  curve/Kronecker kernels).
- Literature: classes with finite findim (monomial, rad³=0, rep.dim ≤ 3, Igusa–Todorov, Gorenstein, …), read in
  the sources; Chen's rad³=0 algebra with Findim = ∞ and the companion Tachikawa
  construction as alternative mechanisms.
- Prove the corner generalisation (α: R → eRe) of steps 1–3, or find why it fails.

### Phase 3 — Search (parallel lines; each ends with a candidate or a documented obstruction)
- **L1, simpler selection data.** Find a small finitely presented R with (e, α) as above: shift-type algebras,
  universal localisations of small hereditary algebras, simpler f.p. groups. Measure: number of generators and
  quadratic relations (= size of B).
- **L2, explicit lifting.** For the best R from L1, compute the chain data D_i, f_a, h_ρ explicitly (e.g. when R
  is a universal localisation and Q is concrete), hence explicit P, l, D, X, A; aim for a quiver with relations.
- **L3, direct search over trivial extensions** (Codex line). Small D of finite gldim (directed, hereditary of
  wild type, B itself) and small X; compute F^r on families of modules with QPA/Sage and look for growing
  extinction times; guided by Phase 2 obstructions.
- **L4, other mechanisms.** Whether the Chen or Tachikawa mechanisms can be adapted to little findim.
- After Phase 2, one Fable consult (`escalations/01-...md`) on the most promising line.

### Phase 4 — Verification gate for the candidate
- Elementary proof written in `notes/`, every step justified.
- Independent computation: minimal projective resolutions of N_m over the explicit A with QPA for m ≤ m_0,
  compared with the predicted pd (script written from the definitions, not from the proof).
- Codex fresh-context verification; Fable final adversarial review. Status "AI-verified" only with these.

### Phase 5 — Formalisation (LEAN_FORMALISATION.md, read 2026-10-07)
Gustavo delegated the scope decision (unconditional down to Mathlib versus conditional). Decision rule, to be
applied and recorded in `lean/DESIGN.md` once the candidate has passed Phase 4:
- **Feasibility first** (AI_RESEARCH_PROCESS §8, LEAN §1): list the definitions and results the proof uses and
  search the pinned Mathlib sources for each (projective dimension `HasProjectiveDimensionLT`, `Abelian.Ext`,
  `TrivSqZeroExt`, quivers/paths, `PresentedGroup`, matrices over `ZMod 2`/polynomial quotients, derived and
  homotopy categories). A cheap Sonnet subagent does the search during Phase 2/3; Opus judges the result.
- **Unconditional by default** for the elementary core: the explicit algebra (as a Mathlib `Algebra`, or via
  representations of the quiver with relations), the modules N_m, the explicit exact sequences/syzygies,
  projectivity of their terms, and the combinatorial extinction statement; hence pd N_m finite and the lower
  bound, if the candidate's proof is elementary in this sense. This is the preferred outcome.
- **Conditional** only for general homological theory that Mathlib lacks and whose formalisation is out of
  proportion (for example the bar decomposition / Minamoto–Yamaura formula for trivial extensions, global
  dimension of directed algebras, Verdier-quotient arguments), with hypotheses as structure fields of kinds
  (a)–(c) with exact locators, never `axiom`, never anything the candidate's proof itself establishes, and a
  small consistency model where feasible. Conditional results live in a separate library and are reported as
  conditional.
- **Approval:** the scope decision is mine; LEAN §2.4 still requires Gustavo's approval of each interface
  hypothesis before Lean is written for it. I submit them in one batch via `QUESTIONS.md` and proceed meanwhile
  with the unconditional stages, so the approval does not block work.
- **Setup:** a separate local git repository `<name>-lean` (LEAN §7, CODE_AND_APP_DEVELOPMENT;
  Lean from the Arch repository at `/usr/bin/lean`, toolchain and Mathlib commit pinned, only the needed Mathlib
  cache fetched to stay under 5 GB); the development record (design, gate logs, checkpoints) stays in this
  repository under `lean/`. GitHub creation only with approval.
- **Work split:** Opus writes the design document, the statements and the correspondence table; Codex does the
  bulk proof engineering (heavy token use, so it runs through the job queue and survives usage resets); a
  correspondence review by the model that did not write the statement.
- **Gates** (LEAN §6) at each stage via a script: source scan (no `sorry`, `native_decide`, heartbeat changes,
  files ≤ 1500 lines), full build with warnings as errors, axiom report ⊆ {propext, Classical.choice,
  Quot.sound}, statement listing, `leanchecker` replay; evidence saved under `lean/gates/`.
- Stages: (1) the algebra and modules; (2) the extinction combinatorics; (3) the projective-dimension bounds
  (unconditional or conditional per the feasibility result). If the candidate reuses the paper's §2 selection
  process, its group-theoretic part (finite presentation, central involutions, quotients in
  GL_5(𝔽_2[t]/(t^m−1))) is a further unconditional stage.

### Phase 6 — Report
`REPORT.md` (results with statuses, what failed and why, riskiest steps, models used) and a short note or
manuscript draft if Gustavo wants one (then AI_WRITING_PROCESS applies). `log/CONVERSATION.md` brought up
to date.

## Verification of the workflow itself
- After Phase 0: `log/CONVERSATION.md` contains the first prompt verbatim and the planning exchange; one Codex
  round trip has run (or its failure is recorded) and is logged.
- At each milestone: `log/CONVERSATION.md` and `PROGRESS.md` up to date, commit made, LEDGER statuses
  consistent with evidence.

## Decisions taken by Gustavo (2026-10-07)
- **Commits:** local commits at milestones by Claude, never push (overrides AI_RESEARCH_PROCESS §9.2 for this
  task; record in README §4). Commit messages end with the session attribution lines.
- **Log:** a simplified, hand-written log of the conversation (`log/CONVERSATION.md`) replaces the export of
  full transcripts (this replaces the earlier answer "full transcripts, redacted").
- **Instruction files:** `docs/WORKING_RULES.md` gives useful *extended summaries* (not copies) of the author's
  instruction files that govern this task (AI_RESEARCH_PROCESS, AI_WRITING_PROCESS,
  MATHEMATICAL_WRITING_STYLE, MATHEMATICAL_DOCUMENT_REVIEW, CODE_AND_APP_DEVELOPMENT, and LEAN_FORMALISATION
  only if formalisation is used): their rules, the status levels for claims, the verification and
  independence requirements, and the reasons behind the hard rules, so a public reader can follow the
  process. README points to it. Save this preference to memory once plan mode ends.
- **Codex:** headless `codex exec` from this session by default, fallback to Gustavo relaying task files.
  Usage barriers on both sides must be monitored so that work resumes after a reset (below).
- **Fable:** 2–4 targeted calls.
- **Formalisation:** added as Phase 5; the choice between unconditional and conditional formalisation is
  delegated to Claude (rule recorded in Phase 5).

## Usage limits and resumption
- **State in files only.** Every unit of work writes incrementally; `PROGRESS.md` always names the current
  phase, the next three actions and the running Codex jobs, so a fresh session (`claude --continue`, or a new
  session told to read `PROGRESS.md`) resumes without loss. `log/RESUME.md` holds the one-line resume prompt.
- **Codex jobs** go through `tools/codex_run.sh <task>`: runs `codex exec` with the task file, saves the final
  message and session id to `codex/outputs/`, and on a usage-limit or rate-limit error records
  `blocked until <time>` in `codex/QUEUE.md` (status per job: queued / running / done / blocked). Blocked jobs
  are resumed with `codex exec resume <session-id>` after the reset; I schedule the retry with a one-shot
  cron/wakeup when the reset time is known, and otherwise check at the start of the next session.
- **Claude limits** cannot be read from inside the session: I keep work units small, update
  `log/CONVERSATION.md` and commit at each milestone, and before any long job write the resume point. If a session stops on a limit,
  Gustavo restarts with the prompt in `log/RESUME.md` after the reset.
- While one side is blocked, work continues on lines that do not need it (e.g. Opus on L1/L2 while Codex
  waits; Codex queue drained while Claude is blocked, if Gustavo starts it).

## Amendments (2026-10-07, after Codex job 01)

Codex (GPT-6 Astra, medium effort) reviewed the workflow (`codex/outputs/01-workflow-critique.md`). Adopted:

1. **Runner** (its recommendations 1, 2, 8, 9): `tools/codex_job.py` replaces the shell wrapper's logic:
   pinned model, stderr separated from the event stream, session id saved as soon as it appears, one set of
   files per attempt, "done" only with `turn.completed` and a non-empty answer, sanitised and locked queue
   rows, resume with its own output file. Tested against a mock CLI (success, usage limit, crash, resume)
   and against real Codex (run and resume). The real shape of a usage-limit event is still unknown; the
   first real one will be kept as a private fixture.
2. **Independence** (3): a verification job is always a new Codex session (never `resume`/`fork` of the job
   that produced the argument), gets frozen inputs (statement, conventions, sources, proof) without
   confidence labels or earlier verdicts, and, where an independent derivation or computation is wanted,
   does not see the proposed proof or script. Only Claude updates `LEDGER.md`.
3. **Bounded search** (4): each search job states a precise question, an effort level, a measurable output
   and a stopping criterion. "No candidate within these bounds" is recorded separately from an obstruction.
   After a short pilot, effort concentrates on one or two lines.
4. **Obstructions before filtering** (5): a necessary condition is used to prune the search only once it is
   AI-proved with its scope stated.
5. **Lean pilot earlier** (6): a small feasibility experiment (toolchain, Mathlib cache, one representative
   statement, `leanchecker`) runs during Phase 2, before any bulk formalisation.
6. **Effort by bottleneck** (7): max effort only for hard proofs, discrepancies and correspondence review;
   one Fable call on the decisive bottleneck, one for adversarial review.

Not adopted: Codex profiles and worktrees (no need yet; recorded as options).

## Phase 3 decision (2026-10-07, after Fable consult 01)

Mechanism (c) (trivial extensions, the main preprint's route) is set aside for the goal of an explicit
example (O.3; Fable §2). Mechanisms (a) with simple E and (b) coincide (Fable Lemma 2 with O.5). Search
lines, in order, each a bounded job with a stopping criterion:

- **3A (Codex job 04).** Recompute the Auslander–Reiten preprint's finite data on C (dim 10) and T = C ⋉ DC
  (dim 20): multiplication table, resolution of s, RHom_C(s, C), Ext*_T(s, s) in low degrees, cocycle
  table. Stop when all are checked or one fails.
- **3B.** The near-miss test bed Λ₀ (80-dim, 4 simples, Z₀ of dim 10): Ext^a(Z₀, Z₀ ⊕ Λ₀) for a ≤ 6.
- **3C.** The Toda bracket c on T; if c ≠ 0, build F minimally and test Candidate 1 (5 simples).
- **3D (lower priority).** Search for a smaller C (Fable Candidate 2).
- In parallel: independent verification of Fable's Lemmas 1–3 (Codex job 05) and, if Candidate 1 is
  pursued, of the AR preprint's conversion principle.
