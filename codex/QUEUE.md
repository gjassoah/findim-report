# Codex job queue

One row per Codex job. Status: queued, running, done (Codex finished its turn and wrote a non-empty answer;
this says nothing about the mathematics), blocked (interrupted; resume later), failed.
Rows are written by `tools/codex_job.py`; queued rows are added by Claude together with the task file.
Per-attempt event streams, stderr and answers are kept in the git-ignored `.cache/codex/<job>/`.

```sh
tools/codex_run.sh run codex/tasks/<job>.md [--effort E] [--model M]   # defaults: gpt-6-astra, max
tools/codex_run.sh resume <job> [--message TEXT]                        # after a blocked or failed attempt
```

| Job | Status | Updated | Note |
|---|---|---|---|
| 00-smoke-test | done | 2026-10-07 21:31 | gpt-6-astra, effort low; answer codex/outputs/00-smoke-test.md (attempt 2) |
| 01-workflow-critique | done | 2026-10-07 21:26 | answer codex/outputs/01-workflow-critique.md |
| 02-verify-constraints | done | 2026-10-07 21:50 | gpt-6-astra, effort high; answer codex/outputs/02-verify-constraints.md (attempt 1) |
| 03-verify-O5 | done | 2026-10-07 22:01 | gpt-6-astra, effort high; answer codex/outputs/03-verify-O5.md (attempt 1) |
| 04-ar-finite-data | done | 2026-10-07 22:39 | gpt-6-astra, effort high; answer codex/outputs/04-ar-finite-data.md (attempt 1) |
| 05-verify-fable-lemmas | done | 2026-10-07 22:41 | gpt-6-astra, effort high; answer codex/outputs/05-verify-fable-lemmas.md (attempt 1) |
| 06-testbed-lambda0 | done | 2026-10-07 23:08 | gpt-6-astra, effort high; answer codex/outputs/06-testbed-lambda0.md (attempt 1) |
| 07-toda-bracket | done | 2026-10-07 22:53 | gpt-6-astra, effort high; answer codex/outputs/07-toda-bracket.md (attempt 1) |
| 08-candidate1-direct | done | 2026-10-07 23:44 | gpt-6-astra, effort high; answer codex/outputs/08-candidate1-direct.md (attempt 1) |
| 09-lean-stage2 | done | 2026-10-07 23:24 | gpt-6-astra, effort high; answer codex/outputs/09-lean-stage2.md (attempt 1) |
| 10-two-factor-minimal | done | 2026-10-08 00:06 | gpt-6-astra, effort high; answer codex/outputs/10-two-factor-minimal.md (attempt 1) |
| 11-verify-weight-argument | done | 2026-10-07 23:54 | gpt-6-astra, effort medium; answer codex/outputs/11-verify-weight-argument.md (attempt 1) |
| 12-one-factor-design | done | 2026-10-08 08:02 | gpt-6-astra, effort max; answer codex/outputs/12-one-factor-design.md (attempt 1) |
| D-B-realisation | done | 2026-10-08 09:14 | gpt-6-astra, effort ultra; answer codex/outputs/D-B-realisation.md (attempt 1) |
| D-D-conversion | done | 2026-10-08 09:13 | gpt-6-astra, effort ultra; answer codex/outputs/D-D-conversion.md (attempt 1) |
| D-E-ar-ingredients | done | 2026-10-08 09:15 | gpt-6-astra, effort ultra; answer codex/outputs/D-E-ar-ingredients.md (attempt 1) |
| D-A-trivial-extension | done | 2026-10-08 09:29 | gpt-6-astra, effort max; answer codex/outputs/D-A-trivial-extension.md (attempt 1) |
| D-C-selection-group | done | 2026-10-08 09:15 | gpt-6-astra, effort max; answer codex/outputs/D-C-selection-group.md (attempt 1) |
| V-C1 | done | 2026-10-08 09:19 | gpt-6-astra, effort max; answer codex/outputs/V-C1.md (attempt 1) |
| V-C23 | done | 2026-10-08 09:06 | gpt-6-astra, effort max; answer codex/outputs/V-C23.md (attempt 1) |
| V-D | done | 2026-10-08 09:25 | gpt-6-astra, effort ultra; answer codex/outputs/V-D.md (attempt 1) |
| V-B | done | 2026-10-08 09:27 | gpt-6-astra, effort ultra; answer codex/outputs/V-B.md (attempt 1) |
| V-C | done | 2026-10-08 09:30 | gpt-6-astra, effort max; answer codex/outputs/V-C.md (attempt 1) |
| V-E | done | 2026-10-08 09:35 | gpt-6-astra, effort ultra; answer codex/outputs/V-E.md (attempt 1) |
| V-A | done | 2026-10-08 09:45 | gpt-6-astra, effort ultra; answer codex/outputs/V-A.md (attempt 1) |
| W4-06 | done | 2026-10-08 09:55 | gpt-6-astra, effort ultra; answer codex/outputs/W4-06.md (attempt 1) |
| W4-05 | done | 2026-10-08 10:04 | gpt-6-astra, effort ultra; answer codex/outputs/W4-05.md (attempt 1) |
| W4-0407 | done | 2026-10-08 10:13 | gpt-6-astra, effort ultra; answer codex/outputs/W4-0407.md (attempt 1) |
| W4-0809 | done | 2026-10-08 10:26 | gpt-6-astra, effort ultra; answer codex/outputs/W4-0809.md (attempt 1) |
| A-inventory | done | 2026-10-08 10:46 | gpt-6-astra, effort high; answer codex/outputs/A-inventory.md (attempt 2) |
| W4-rest | done | 2026-10-08 10:37 | gpt-6-astra, effort ultra; answer codex/outputs/W4-rest.md (attempt 1) |
| W5a | done | 2026-10-08 11:19 | gpt-6-astra, effort ultra; answer codex/outputs/W5a.md (attempt 1) |
| W5b | done | 2026-10-08 11:23 | gpt-6-astra, effort ultra; answer codex/outputs/W5b.md (attempt 2) |
| W5c | done | 2026-10-08 11:12 | gpt-6-astra, effort ultra; answer codex/outputs/W5c.md (attempt 1) |
| L-feasibility | done | 2026-10-08 11:24 | gpt-6-astra, effort high; answer codex/outputs/L-feasibility.md (attempt 2) |
| P-prose | done | 2026-10-08 12:19 | gpt-6-astra, effort high; answer codex/outputs/P-prose.md (attempt 1) |
| 13-lean-stage3a | done | 2026-10-08 12:23 | gpt-6-astra, effort ultra; answer codex/outputs/13-lean-stage3a.md (attempt 1) |
| P-apply | done | 2026-10-08 12:32 | gpt-6-astra, effort high; answer codex/outputs/P-apply.md (attempt 1) |
| 14-lean-stage3b | done | 2026-10-08 14:54 | gpt-6-astra, effort ultra; answer codex/outputs/14-lean-stage3b.md (attempt 1) |
| 15-lean-stage3c | done | 2026-10-08 15:34 | gpt-6-astra, effort ultra; answer codex/outputs/15-lean-stage3c.md (attempt 3) |
| 16-lean-stage4a | done | 2026-10-08 15:43 | gpt-6-astra, effort ultra; answer codex/outputs/16-lean-stage4a.md (attempt 3) |
| 17-lean-stage4b | done | 2026-10-08 14:54 | gpt-6-astra, effort ultra; answer codex/outputs/17-lean-stage4b.md (attempt 1) |
