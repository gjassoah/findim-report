# W5 review ledger: Claude's decisions on the reviewers' proposals

Claude Opus 5.5, 2026-10-08. The block tables, applied evident-slip corrections and proposals are in
`audit/report-review-W5a.md`, `-W5b.md`, `-W5c.md` (fresh GPT-6 Astra sessions, Ultra, autonomous mode of
MATHEMATICAL_DOCUMENT_REVIEW). Claude reviewed every applied diff and decided every proposal.

## W5c (sections 8–10; 96 blocks)

Applied corrections reviewed: accepted (grammar: "uses the symmetry ... only to ensure", semicolon for a
comma splice, "the same holds exactly"; typesetting: three displays split, one discretionary hyphen), except
one forced `\linebreak` in §10, replaced by a rewording of the sentence (no layout hacks).

| Proposal | Decision | Reason |
|---|---|---|
| P1 degree of p : B → B[3] | accepted | the map is degree zero into the shifted complex; "degree three" double-counted |
| P2 define C_0 | accepted | C_N used for N = 0 in rem:ar-sizes; definition extended to N ≥ 0, lemma unchanged |
| P3 which β₀ in rem:weights | accepted | §9's β₀ is the tensor-square class (weight two); the remark concerns (T, s) |
| P4 "no polynomial Ext" too broad | accepted | the 40-dim example has Ext = k[τ, z], polynomial but not on one degree-3 generator |

coro:one-factor (new after W4-rest) re-checked by W5c: clean (blocks 10.08–10.09).

## W5a (front matter, sections 1–3, appendices B–D; 92 blocks)

Applied corrections reviewed: accepted (commas after introductory phrases, a semicolon in the abstract, the
findim display set with a two-line condition, PDF-destination fix for the shared equation counter, a slightly
narrower table column, `\emergencystretch` and a hyphenation hint, "the length l"). The provenance line it
added to `main.tex` was rewritten to name the model as the records do.

| Proposal | Decision | Reason |
|---|---|---|
| P1 Lean stage-2 hypothesis direction | accepted | matches the formal statement (quotient map annihilating im d₀) |
| P2 "a model other than its author" | accepted | several checks were fresh sessions of the same model; the declaration must say so |
| P3 AR75a gives findim only with thm:strong-nakayama | accepted | AR75a Thm 1.1(b) gives generalised Nakayama failure; §3 already separates the steps |
| P4 companion locators | accepted | Theorem 1.1 and Corollary 1.2(2) of the companion |
| P5 Schulz locator | accepted | Example 7 (read by the reviewer in the published version) |
| P6 which computations were not rechecked | accepted | V-C23 recomputed the size estimate and the six-dimensional example |
| P7 "all the prose" | accepted | the prose was revised by GPT-6 Astra in W4/W5; "first draft" is accurate |

## W5b (sections 4–7, appendix A; 149 blocks)

Applied corrections reviewed: accepted (commas after "Hence", "Thus", "Finally"; displays split; "two finite
terms" in ex:derived-powers; K₀(𝒯) instead of K₀(𝒬) in the general paragraph after prop:odd-double; "matrix
unit E_15"), except two forced `\newline` breaks (§4, §6), replaced by rewording, and a removed `~` before a
citation, restored.

| Proposal | Decision | Reason |
|---|---|---|
| P1 rerun coverage in A1 | accepted (reworded) | the inventory records 45 commands; three runs not repeated, four stages resumed |
| P2 where exponents are recorded | accepted | seeds in scripts, exponents in saved outputs |
| P3 "exact complex" in A1 | accepted (reworded) | the minimised complex has homology in degrees −4, −2, 0 |
| P4 "two examples of §4" | accepted | §4 has one example; the script checks a second, unstated one |

## Outcome

337 blocks reviewed, 15 proposals, all adopted; no error in a proof found in W5. Appendix D updated.

## Final prose pass (requested by Gustavo, 2026-10-08)

Audit `audit/P-prose-codex.md` (194 proposals, GPT-6 Astra). Claude's decisions: accepted all, except that the
defined terms "selection data" and "selection functor" are kept (defined in def:selection-data, used
consistently, close to the preprint's own "selection process/functor"; replacing them by "satisfies
Definition 5.1" everywhere would read worse), the title of Appendix D and its clause "no part of it was written
by a human" are kept (disclosure), and the §6.4 heading becomes "A summand and its odd shifts". Applied by job
P-apply; diff reviewed by Claude.
