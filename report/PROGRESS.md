# Report progress (AI_WRITING_PROCESS §10)

Plan: `docs/PLAN-part2.md`. Outline: `report/notes/outline.md`. Conventions: `audit/report-notation.md`.

## Phase

Round 2 (2026-10-09, `docs/PLAN-round2.md`): second checks of Sections 3–10 by Claude Opus 5.5 (one gap repaired,
Corollary 10.5; wording edits rechecked by GPT-6 Astra), calibration, Appendix B and D updated; 54 pages.

W2–W6 done (2026-10-08): all dossiers verified; all sections drafted and checked (W4); block-by-block review W5 done (337 blocks, 15 proposals adopted, `audit/report-review.md`); remaining markers: three in Appendix D, for Gustavo.

## Dossier (W2)

| Note | Sections | Writer | Verification | Status |
|---|---|---|---|---|
| C-1 criteria | 2.2, 3.1–3.7, 4.3–4.4, 5.1 | Claude (from part I) | V-C1 done: 3.3 and 3.5 errors and gaps in 2.2, 3.6, 4.3 repaired (Codex repairs checked by Claude) | corrected |
| C-2/C-3 | 7.3, 8.7–8.8, 9 | Claude (from part I) | V-C23 done: theorems pass; two readings corrected (tensor square; size bound) | corrected |
| D-A trivial extension, simulation, main theorem | 4.1–4.2, 7.1–7.2 | Codex (max) | V-A done: no error found in the mathematics; two wording repairs (N ≠ 0 in 4.2; R exempt from finite-dimensionality) applied by Claude; M is a functor by report §6, so V-A's optional third item needs no change | **verified** |
| D-B realisation | 2.3, 6.1–6.6, 5.3 | Codex (Ultra) | V-B done: no error found (one wording fix) | **verified** |
| D-C selection group | 5.2 | Codex (max) | V-C done: no error found (two slips in the cited source, Santos Rego v3 pp. 27–28, recorded; not used as premises) | **verified** |
| D-D conversion principle | 8.1 | Codex (Ultra) | V-D done: no error found | **verified** |
| D-E AR ingredients | 8.2–8.6 | Codex (Ultra) | V-E done: no error found; gap G1 (cochain table only in a script outside the frozen inputs) closed by Claude by checking equality with the preprint's appendix table (179 entries, script); one heading narrowed to m ≥ 0 | **verified** |

Deviation from the plan (decided by Claude, 2026-10-08): the preprint-specific dossier notes (D-*) are
drafted by Codex at Ultra/max effort instead of by Claude; independence is kept by a
separate fresh Codex verification of each note and by Claude's review of the verdicts. Claude writes the
notes compiled from part I (C-*) and all prose of the article.

## Sections (W3) and section checks (W4)

All sections drafted by Claude Opus 5.5 on 2026-10-08 from the verified dossiers; every cited locator read
by Claude in the source (Stacks tags, MY20, Sch07a, Reg19, Lin12a via §2) before use.

| Section | Source | W4 check | Status |
|---|---|---|---|
| 1 Introduction | all | W4-rest (running) | drafted |
| 2 Conventions and preliminaries | C-1 | W4-rest (running) | drafted; CHECK on C⋉DC resolved with proof |
| 3 Criteria | C-1 | W4-rest (running) | drafted |
| 4 Trivial extensions and extinction | D-A, C-1 4.3–4.4 | W4-0407: no error in proofs; opening hypotheses repaired | checked |
| 5 Selection data | D-C, C-1 5.1, audit/02 | W4-05: no error in proofs; character range, K₀ notation, two unsupported sentences repaired | checked |
| 6 Bimodule complexes from selection data | D-B (incl. 5.3) | W4-06: no error in proofs; six wording/scope repairs | checked |
| 7 Simulation and the main theorem (stated for general selection data over any field) | D-A | W4-0407: wording repairs | checked |
| 8 The conversion principle | D-D | W4-0809 (running) | drafted |
| 9 An Auslander–Reiten counterexample | D-E | W4-0809 (running) | drafted |
| 10 Obstructions | C-3, audits 06/08/11/12 | W4-rest (running) | drafted; one-factor/Toda link stated as not proved |
| A Computations | inventory job A-inventory (running) | — | placeholder |
| B Verification and formalisation | LEDGER, audits, lean/gates | W4-rest (running) | drafted; CHECKs for W4-0809/W4-rest outcomes and W6 |
| C Companion preprints | companion sources | W4-rest (running) | drafted (remark only) |
| D Declaration of AI use | — | — | drafted; CHECKs (date, what Gustavo checked, W5 outcome, URL) |

Independent check by Claude: dim C₁ = 1 623 889 344 and dim Λ ≈ 1.703·10³⁵ recomputed from the bar-complex
dimensions (script in session, to be saved under computations/ with Appendix A).

## Open markers

None yet (no prose).
