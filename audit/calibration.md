# Calibration of the checking pipeline (round 2, 2026-10-09)

Orchestrator: Claude Sonnet 5.5 (record reviewed by Claude Opus 5.5). Seeder: Claude Opus 5.5 (separate session). Checkers: Codex GPT-6 Astra at effort
ultra, four fresh sessions, run with `tools/codex_run.sh run … --effort ultra --workdir <calibration directory>`.
Status of what follows: a measurement on one sample of eight seeds; not evidence about the real notes.

## Procedure

1. The frozen dossiers `scratch/V-{A,B,C1,D,E}-frozen.md` (the inputs of the original verification jobs V-A … V-E for the
   proof notes of Sections 4, 6 and 8) were copied to `<calibration directory>/scratch/` (outside the repository),
   together with `README.md`, `AGENTS.md`, `audit/report-notation.md`, `build/` and `.cache/ar-src/`; pristine copies and
   the seed list in `<sealed directory>/` (outside the checkers' working directory).
2. The seeder inserted 8 errors (hard limit 6–10): V-A 2, V-B 2, V-D 1, V-E 3, V-C1 0 (V-C1 was not run). Variety:
   left/right (2), constant (1), sign (1), dropped hypothesis (1), degree/shift (1), misquoted citation (1), invalid
   dimension inference (1). The list is `audit/calibration/seeds.md` (released after scoring); hashes of the seeded
   copies are in `audit/calibration/seeded-copies.sha256`.
3. The original task files `codex/tasks/V-{A,B,D,E}.md` were copied with only the output paths renamed
   (`CAL-V-*`), and run with the same model (`gpt-6-astra`) and the same effort as the original jobs (ultra for V-A, V-B,
   V-D, V-E; the original V-C1 used max and was not run). Fresh sessions, no shared context.
4. Isolation: the real notes, the report and the real `audit/` were not touched (`git status` clean apart from the files
   written by this round; the runner's `--workdir` option keeps queue rows and answers in the calibration directory).
   The event streams of the four runs do not contain the strings `calib-sealed` or `seeds.md`, nor the repository path
   (grep of `.cache/codex/CAL-*/attempt-1.jsonl`). The checkers could in principle have read any file on the machine;
   the instructions forbade it and nothing in the logs shows it.

## Result

| Seed | File, place | Type | Found? | By |
|---|---|---|---|---|
| 1 | V-A, 7.1, `c_i ∈ ε_{i-1}K_lε_i` | left/right | yes (line 494 named, correct form given) | CAL-V-A |
| 2 | V-A, 4.2c, `d_L+(t-1)d_R` | constant | yes (with explicit counterexamples) | CAL-V-A |
| 3 | V-B, 6.5, sign in ∂₂ | sign | yes (exact counterexample, d_P² ≠ 0) | CAL-V-B |
| 4 | V-B, 5.3, 'right multiplication' | left/right | yes (line 963) | CAL-V-B |
| 5 | V-D, 8.1, surjectivity of δ⁰ dropped | dropped hypothesis | yes (with an explicit counterexample, 8-dimensional algebra) | CAL-V-D |
| 6 | V-E, 8.4.2, Tate duality exponent | misquoted citation | yes (E1, against the source and the conventions file) | CAL-V-E |
| 7 | V-E, 8.6, Σ³ instead of Σ⁴ | degree | yes (E2) | CAL-V-E |
| 8 | V-E, 8.6, 'surjective since larger dimension' | dimension inference | yes (E3) | CAL-V-E |

- **Seeded errors found: 8 of 8.** Each was located at the seeded place and the correct statement was given. With eight
  seeds the one-sided 95% lower bound for the detection rate is about 0.69 (Clopper–Pearson, 8/8); the sample is too
  small for a rate and only shows that these four checks do not miss errors of these kinds when the dossier is checked
  line by line.
- **False alarms (claimed mathematical errors at unseeded places): 0.** Every claimed error is a seed or a consequence
  of one (V-B called 6.6 and the realisation in 5.3 'inherited gaps' from seed 3, correctly).
- **Non-error findings at unseeded places** (wording that does not match the proof, qualifications): V-A: a guard for the
  case 'p+1 = 0' and a remark that (7.2h) matches the repaired (4.2c) (the latter a consequence of seed 2); V-B: replace
  literal equality of evaluated diagrams in 6.4 by isomorphism; V-E: qualifications about data access for the 179-entry
  table and about blanket 'no gap' sentences in the dossier. These are of the kind the original checks also reported
  (V-A two wording repairs, V-B one wording fix); they are not counted as false alarms.

## Limits of this calibration (what it does not show)

- The seeds were written by a Claude model and the checkers are Codex; seeds by an agent of the same family as the
  checker might be harder or easier. One seeder, one sample, eight seeds, none of them in V-C1 or in the dossiers
  of Sections 5, 9 and 10.
- Seeded errors are local and were placed in dossiers that are otherwise error free; real errors that are
  non-local (an incorrect strategy, a missing case that the text never mentions) are not measured. The seeder was
  asked for errors that need understanding, but the checkers' prompts mention exactly the categories in which several
  seeds lie (left/right, op, signs, degrees, quantifiers).
- Detecting seeds shows the procedure can find errors of these kinds; it does not show that the original checks were
  complete, and it says nothing about errors that the original checkers and the seeder both overlook.
- The frozen files are the versions frozen for the original checks, not necessarily the final proof notes. V-A and
  V-E differ from the inputs of the original jobs in one line each (commit `b210ae8` replaced a local path to a cited
  PDF by its file name), so the calibration checkers were not pointed to the local copy of [MY17] that the
  original V-A checker could open.
- Effort and model name were not reported by Codex itself (answers say 'unknown'); the settings come from the runner.
