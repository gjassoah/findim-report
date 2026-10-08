unknown

Workflow critique, 2026-10-07. I inspected the required repository documents and runner; no mathematical claims were audited.
The priorities are reliable recovery, genuinely independent verification, and bounded research jobs.

Verified capabilities and limits:

- **Local verification:** installed `codex-cli 0.161.0`; read `codex --help`, `codex exec --help`, `codex exec resume --help`, and `codex exec fork --help`. Help inspection establishes available interfaces, not successful execution of every option.
- **Model and effort:** `-m MODEL` selects a model per job; `-c 'model_reasoning_effort="max"'` selects effort, subject to model/client support. The runner sets effort but never pins the promised GPT-6 Astra model; use both explicitly and record requested versus confirmed settings. [Official configuration reference](https://learn.chatgpt.com/docs/config-file/config-reference).
- **Profiles:** this installed version documents `-p NAME` as layering `$CODEX_HOME/NAME.config.toml` over the base configuration. Use separate review and Lean profiles, but record the effective settings; a profile name alone is not reproducible evidence.
- **Resume and fork:** both are available headlessly: `codex exec resume SESSION_ID PROMPT` and `codex exec fork SESSION_ID PROMPT`; both expose model/config overrides and `-o`. Resume continues a job; fork branches its history and therefore is unsuitable as a fresh-context verification of that history.
- **Structured output:** `--output-schema FILE` constrains the final response; `--json` produces the event stream, and `-o FILE` saves the final message. A small schema can report artifacts, incomplete obligations and next actions, but does not provide incremental checkpoints or certify the mathematics. [Official non-interactive documentation](https://learn.chatgpt.com/docs/non-interactive-mode).
- **Parallelism:** Codex documents subagents and per-agent model/effort settings; I did not test their availability in the headless runner. Independent CLI jobs are another option, with explicit ownership of files and bounded concurrency. [Official subagent documentation](https://learn.chatgpt.com/docs/agent-configuration/subagents).
- **Worktrees:** `--worktree` is advertised locally, including for exec/resume/fork; its runtime behavior was not tested. Use isolated worktrees for simultaneous edits, supplying uncommitted task inputs explicitly and preventing shared mutable Lean build directories; worktrees do not multiply the account's usage allowance.
- **Long Lean jobs:** persistent sessions help continuity, but acceptance must rest on saved sources and gate evidence; avoid `--ephemeral` when resumption matters. Neither the inspected help nor this review establishes an automatic usage-reset scheduler or reliable remaining-quota telemetry.
- **Observed JSON:** the saved smoke test contains `{"type":"thread.started","thread_id":"…"}` and `{"type":"turn.completed","usage":{...}}`; it also contains a non-JSON diagnostic because stderr was merged into stdout.
- **Usage-limit event shape: unknown.** Official documentation lists `error` and `turn.failed`, but I did not observe an actual quota failure or verify its payload, exit code, reset fields or ordering; synthetic fixtures must remain labelled synthetic.

Recommendations, in descending order of value:

1. **Repair resumption and completion first.** The resume branch omits `-o`, while both branches equate exit zero with “done”; save each attempt's final answer explicitly and require successful terminal events plus a checked deliverable before marking it complete.
   Pin the working directory and model/effort policy on resumption, retain the previous answer, and distinguish “run completed” from “research obligation accepted”.

2. **Replace regex recovery with a small durable job record.** Separate stderr from JSONL, parse top-level event types, save the thread ID immediately outside the replaceable event file, and retain immutable attempt files; currently a failed resume before `thread.started` can leave the next resume unable to find the ID despite the backup.
   Add atomic queue updates, locking and interrupted-job reconciliation; classify transient rate limits separately from exhausted quota, and retry with bounded backoff or a verified reset time, never an invented one.

3. **Make independence an input constraint.** Give verifiers a frozen statement, conventions, sources and proof, without confidence labels or earlier verdicts, and run a new session rather than a resume/fork of the construction job.
   When an independent derivation or computation is wanted, initially withhold the proposed proof and implementation; reconcile disagreements explicitly before promotion, with Claude alone updating the central ledger.

4. **Bound the search before expanding it.** Give each L1–L4 job a precise question, limited effort/time, a measurable output and a stopping criterion; record “no candidate found within these bounds” separately from a mathematical obstruction.
   Rank candidates by explicitness, size, elementary verifiability and missing dependencies, and concentrate usage on one or two lines after a short pilot instead of treating all four as indefinitely active.

5. **Check prerequisite claims before they exclude search space.** Phase 2's proposed obstructions need precise scope and evidence before L3 uses them as filters; attach dependencies only to claims actually reused instead of prepopulating a ledger for every lemma.
   Define the go/no-go result of each phase and preserve the README's smaller acceptable outcomes, so a stalled search still produces a useful report without silently demoting the main objective.

6. **Move a small Lean feasibility experiment earlier.** Alongside the planned Mathlib search, test one representative statement and its types, verify toolchain/cache/replay availability, and estimate the missing infrastructure before committing to bulk proof engineering.
   Give Codex bounded modules with fixed interfaces and build commands; save source hashes, Lean and Mathlib versions, the separate Lean repository revision, exact failures and next actions, and run heavy acceptance gates sequentially at milestones.

7. **Allocate effort by bottleneck, not by a universal maximum.** Keep mathematical judgment with the strongest available model as required, use cheaper models only for checkable retrieval/search/run tasks, and reserve high effort for difficult proofs, discrepancies and correspondence review.
   Use one Fable call on the decisive bottleneck after preliminary refutation, reserve one for adversarial review, and spend the remaining allowance only on a concrete unresolved question; avoid repeatedly sending the whole dossier.

8. **Test the runner's failure paths economically.** The successful smoke test does not validate interruption, malformed events, authentication failures, quota classification, missing outputs, concurrent queue updates or resume recovery; exercise these with a mocked CLI and retain the first naturally occurring real failure as a private fixture.
   Add explicit output/checkpoint paths to every task, since `-o` saves only the final response and cannot recover unwritten reasoning after a hard stop; schedule retries through an actual external supervisor if autonomous wakeups are required.

9. **Keep public records faithful and controlled.** Preserve the simplified log and ignored raw streams, but review task files, final answers and queue notes before Claude commits: `set_status ... "$*"` currently copies arbitrary arguments into tracked Markdown, and error excerpts can expose local details or break rows.
   Record sanitized model/effort, input hashes, artifact paths, checks and interruptions rather than raw arguments; reconcile stale `PROGRESS.md` with the completed smoke test and decide with Gustavo how to handle any private material in otherwise verbatim prompts before publication.

Only this answer was written; the runner, plan, queue and public log were not changed, and no new paid Codex job was launched.