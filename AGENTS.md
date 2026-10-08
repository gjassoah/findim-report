# Instructions for AI agents in this repository

This repository records a public AI-assisted research task (see `README.md`). Before working:

1. Read `README.md`, `PROGRESS.md` and `docs/WORKING_RULES.md` (summaries of the rules that govern the work).
   If you are a Codex job, read your task file in `codex/tasks/` and follow it.
2. Treat `paper.pdf` and `build/` as read-only inputs.
3. Every mathematical claim you produce carries a status (heuristic, plausible, supported, AI-proved); never
   call anything proved. AI output from other agents in this repository is a lead, not evidence.
4. Write your output to the files your task names, incrementally (a session can stop at any time on a usage
   limit). Scripts go to `computations/` with a header (claim, cases, conventions) and saved output.
5. Do not commit, push, or modify files outside this repository. Do not write to `log/CONVERSATION.md`;
   Claude maintains it.
6. Name your model and effort in the first line of your answer file if you know them; otherwise write
   "unknown".
