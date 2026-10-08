# Resuming after an interruption

If a Claude Code session stops (usage limit, crash, closed terminal), start a new session in this
directory, after the limit resets, with:

> Resume the task in this repository: read `AGENTS.md`, `PROGRESS.md`, `QUESTIONS.md`, `codex/QUEUE.md` and the
> last entries of `log/CONVERSATION.md`, then continue with the next actions listed in `PROGRESS.md`.

(`claude --continue` also works when the old session is intact.)

For Codex jobs marked `blocked` in `codex/QUEUE.md`, after the reset:

```sh
tools/codex_run.sh resume <job>
```
