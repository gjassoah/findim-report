# Proposal: the public repository `findim-report`

Claude Opus 5.5, 2026-10-08 (W6). Nothing has been created or pushed; creation and every push need Gustavo's
approval (CODE_AND_APP_DEVELOPMENT §3; AGENTS.md).

## Name, visibility, description

- `gjassoah/findim-report` (the URL cited in Appendix D of the report), **private first**; made public by
  Gustavo when he decides.
- Description: "AI-prepared research report on the OpenAI preprints on infinite finitistic dimension
  (September 2026): proofs, verification record, computations, and a complete log of the interactions."

## Contents

This repository as it stands, with its history (the history is part of the record), except:

1. **Third-party page images to remove before publication** (renderings of pages of published or arXiv
   papers, made by Codex during verification; their licences are not ours):
   `computations/D-A-MY17-v1-p18.png`, `computations/D-A-MY17-v1-p20.png`,
   `computations/D-C-Reg19-comparison-26.png`, `-27.png`, `-28.png`, `computations/08-D-E/linckelmann-page4.png`.
   Since they are in the history, removing them requires either rewriting history (`git filter-repo`
   on a copy) or starting the public repository from a squashed snapshot. **Recommendation:** filter the
   six files from the history of a copy and keep the rest of the history.
2. **The preprint** (`paper.pdf`, `build/`): already excluded from our licence (`LICENSE.md`). It is publicly
   available in OpenAI's repository `openai/math`; whether to keep a copy or replace it by a pinned link and
   checksum is Gustavo's decision. **Recommendation:** replace by a link, the commit hash of `openai/math`
   and SHA-256 checksums, so that the record stays verifiable without redistribution.
3. Local-only material is already excluded by `.gitignore` (`.cache/`, `.claude/`, builds, scratch
   extracts of sources).

Added for publication: the compiled `report/main.pdf` (after Gustavo's decisions on the byline and the
Appendix D markers), and a pointer to the Lean repository `findim-counterexample-formalisation` (a separate
repository; publishing it is a separate decision).

## Checks done before proposing

- Home-directory paths in records replaced by `~` (four files, 2026-10-08); no e-mail addresses in tracked
  files; the log reproduces Gustavo's messages verbatim, as he asked.
- Licences: `LICENSE.md` (CC BY 4.0 for prose and data, Apache 2.0 for code, preprint excluded).

## Steps after approval

1. Copy the repository, run `git filter-repo --invert-paths` on the six images, verify the result.
2. `gh repo create gjassoah/findim-report --private`, push, check the rendered README.
3. Replace the \CHECK on the URL in Appendix D; Gustavo decides when to make it public.

## Decision

The public repository is a single snapshot commit of this repository (no history), without the preprint and
the six page images, with a pinned link and checksums for the preprint (`PREPRINT.md`) and the compiled report.
It is built by `tools/make_public_repo.sh`. Records were cleaned of private paths, account and usage details
before the snapshot.
