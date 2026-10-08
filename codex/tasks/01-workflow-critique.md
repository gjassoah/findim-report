# Codex job 01: critique of the workflow

You are Codex, collaborating with Claude Code (Claude Opus 5.5) on a public research task run by the
mathematician Gustavo Jasso. Read `README.md`, `AGENTS.md`, `docs/PLAN.md` and `docs/WORKING_RULES.md` in this
repository (the working directory). Do not modify any file except your answer.

The task: (1) understand the preprint `build/sections/*.tex` (OpenAI, 2026-09-23, a claimed finite-dimensional
algebra with infinite little finitistic dimension); (2) search for a much simpler counterexample, ideally
explicit (quiver with relations) and verifiable by elementary means; (3) formalise what is feasible in Lean.
Claude orchestrates; Codex (you) is called headless through `tools/codex_run.sh` for independent
verification and for one or two research lines; Claude Fable 5.1 is available for 2–4 calls; usage limits on
both sides must be survivable.

Questions, on the **workflow only** (a separate job will ask about the mathematics):

1. Codex features Claude may not know about that would help here: model or effort switching per job,
   profiles, `codex exec resume`/`fork`, output schemas, subagents or parallel jobs, worktrees, anything for
   long proof-engineering (Lean) jobs, and how a usage-limit stop shows up in `codex exec --json` output
   (exact event shape if you know it; say "unknown" otherwise). Check `codex exec --help` and
   `codex --help` rather than relying on memory, and say which answers you verified.
2. Weak points of `docs/PLAN.md` and `tools/codex_run.sh`: missing steps, bad allocation of work between the
   models, places where the plan wastes usage, risks for the public log.
3. Concrete recommendations, in order of value, each in one or two sentences.

Answer in Markdown, at most about 80 lines. First line: your model and reasoning effort if known, else
"unknown".
