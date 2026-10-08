# Questions for Gustavo

Each entry: context, options, recommendation. Work continues under the recommendation (provisional) unless
stated.

## Q1 (2026-10-07) — Running Codex headless from Claude Code — **settled**

**Answer (Gustavo, 2026-10-07):** make an exception so that `codex exec` runs headless. Implemented as a
project-local exception from Claude Code's sandbox for `codex exec` and `tools/codex_run.sh` only.

### Original question

**Context.** `codex exec` cannot run inside Claude Code's sandbox, because Codex must write to its own state
directory. Changing the sandbox is Gustavo's decision.

**Options.** 1. An exception for the Codex commands, so that Claude runs Codex jobs itself. 2. Relay: Claude
writes task files and queues them in `codex/QUEUE.md`; Gustavo runs them in a normal terminal.

**Recommendation.** Option 1 for unattended operation, otherwise option 2.

## Q2 (2026-10-07) — Stray transcript exports in `log/claude/` — **settled**

**Answer (Gustavo, 2026-10-07):** delete them. Done; the ignore rule was removed.

### Original question

**Context.** Two full transcript exports (one is this session's), made at 21:02–21:04 by a script
`tools/export_transcripts.py` that no longer exists, are in `log/claude/`. They come from the transcript-based
logging that you replaced by the simplified log. They are now git-ignored (nothing deleted).

**Options.** Delete them; or keep them locally, ignored.

**Recommendation.** Delete (they can be regenerated from Claude Code's own session files if ever needed).

## Q3 (2026-10-07) — Licence of the Lean repository — **settled**

**Answer (Gustavo, 2026-10-08):** recommendation approved. Implemented: Apache 2.0 and contributors list in
the Lean repository; `LICENSE.md` (CC BY 4.0 for prose and data, Apache 2.0 for code, preprint excluded)
in this repository.

### Original question

**Context.** The new Lean repository (`findim-counterexample-formalisation`)
needs a licence header in every file (Mathlib's header linter). Claude used Apache 2.0, with "The findim
counterexample formalisation contributors" as copyright holder. Nothing is published.

**Options.** Keep Apache 2.0 (consistent with Mathlib); or choose another licence or holder before
publication.

**Recommendation (Claude, 2026-10-08, at Gustavo's request; decision pending).**
1. Licence: Apache 2.0 — Mathlib's licence and the community norm, required for any future upstreaming of
   lemmas (e.g. the noncommutative duality and reflexivity of stage 2).
2. Copyright holder: keep the neutral "The findim counterexample formalisation contributors" (a sole
   human holder would overstate authorship of AI-written proofs; AI agents as holders have no clear legal
   meaning).
3. Attribution: a contributors list in the Lean README — Gustavo Jasso (direction, review); Claude Opus 5.5
   (stage 1, statements, review); Codex GPT-6 Astra (stage 2 proofs).
4. Related: the verification repository has no licence yet; suggested CC BY 4.0 for prose, Apache 2.0 for
   code in it. To be decided before publication.
