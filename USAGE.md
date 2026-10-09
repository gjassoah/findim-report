# Usage of AI resources

This file records the AI resources used for the task recorded in this repository (both parts: the analysis
of the preprints and the report, including the Lean formalisation).

## Access

The work used a ChatGPT Pro 100 subscription, through which Codex (GPT-6 Astra) was run, and a premium seat in
the Claude Team plan for scientists (at a discounted rate), through which Claude Code was run. These are the
subscriptions stated in Appendix D of the report.

## Claude Code

Figures reported by Claude Code at the end of the session in which the work was done:

| Item | Value |
|---|---|
| Total cost (estimate at API list prices; see below) | $258.45 |
| Total duration (API) | 7 h 31 min 40 s |
| Total duration (wall) | 20 h 30 min 40 s |
| Total code changes | 7 313 lines added, 330 lines removed |

Usage by model:

| Model | Input tokens | Output tokens | Cache read | Cache write | Other | Estimated cost |
|---|---|---|---|---|---|---|
| Claude Opus 5.5 (`claude-opus-5-5`) | 36.2 k | 990.2 k | 457.2 M | 3.1 M | | $136.38 |
| Claude Fable 5.1 (`claude-fable-5-1`) | 532.6 k | 1.2 M | 6.3 M | 4.4 M | | $119.96 |
| Claude Sonnet 5.5 (`claude-sonnet-5-5`) | 41.3 k | 43.7 k | 3.4 M | 310.3 k | | $1.97 |
| Claude Haiku 4.5 (`claude-haiku-4-5`) | 89.6 k | 1.9 k | 0 | 0 | 4 web searches | $0.14 |

Meaning of the figures, following the Claude Code documentation
(<https://code.claude.com/docs/en/costs>):

- **Total cost** is computed locally from the token counts at API list prices. It is an estimate of what the
  same usage would cost under API billing, not an invoice. For users on a subscription plan, usage is included
  in the subscription; no charge was incurred for this figure.
- **Total duration (API)** is the time spent in calls to the models; **total duration (wall)** is the
  elapsed time of the session, including periods in which Claude Code waited (for the author, or for Codex
  jobs running in the background).
- **Cache read** and **cache write** count tokens read from and written to the prompt cache, which avoids
  reprocessing context repeated across requests.

Roles of the models (details in Appendix D of the report and in `PROGRESS.md`): Claude Opus 5.5 coordinated the
work, wrote the notes and the prose of the report, and reviewed all verification reports; Claude Fable 5.1 was
consulted twice; Claude Sonnet 5.5 ran as subagents for retrieval and mechanical checks; the Claude Haiku 4.5
figures are auxiliary calls made by Claude Code, including four web searches.

## Codex

Codex (GPT-6 Astra) ran 42 jobs (`codex/QUEUE.md`): 20 at effort ultra, 6 at max, 13 at high, 2 at medium and
1 at low (a smoke test). Codex did not record token counts or cost estimates for these jobs. In total they
used 207% of the weekly usage allowance of the subscription; resetting the usage limits was necessary to
complete the work.

## Round 2 (2026-10-09, branch `verification-round-2`)

Subagent token counts as reported by Claude Code at completion of each subagent (not a cost estimate):

| Unit | Model | Tokens (subagent total) |
|---|---|---|
| Section 6 check, Phases A and B | Claude Opus 5.5 | about 0.20 M |
| Section 9 check, Phases A and B | Claude Opus 5.5 | about 0.33 M |
| Seeder (calibration) | Claude Opus 5.5 | about 0.24 M |
| Sections 3–5, 7, 8, 10 checks, Phases A and B | Claude Opus 5.5 (four sessions) | about 0.11–0.15 M each |
| Re-read of the OpenAI Lean audit | Claude Opus 5.5 | about 0.15 M |
| Comparison of the two Lean formalisations | Claude Opus 5.5 | about 0.27 M |
| Pins and packaging drafts for Comparator | Claude Sonnet 5.5 | about 0.08 M |
| Orchestration, audit, drafting, review | Claude Sonnet 5.5, then Claude Opus 5.5 | not reported separately |
| Calibration checks CAL-V-A, -B, -D, -E | Codex GPT-6 Astra, ultra | four jobs; Codex reports no token counts; share of the weekly allowance not recorded |
| Rechecks R2-recheck, R2-recheck2 | Codex GPT-6 Astra, high | two jobs; no token counts |
