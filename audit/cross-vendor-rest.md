# Cross-vendor check of Sections 3, 4, 5, 7, 8 and 10 (round 2, 2026-10-09)

Checkers: Claude Opus 5.5, four fresh sessions (Sections 3–4; Section 5; Sections 7–8; Section 10). Orchestrator and
judge of the outcomes: Claude Opus 5.5 (main session). Same two-phase procedure as `audit/cross-vendor-s6-s9.md`.
Status: AI check by one model per section; not human verification, not a formal proof.

## Procedure and its limits

- **Phase A (blind).** Each checker received only a 21-page statement document (`statements.pdf`, SHA-256 in
  `audit/cross-vendor-rest/package.sha256`): definitions, constructions and statements of Sections 2–10, compiled
  from the report sources with proofs hidden, remarks and examples replaced by '(omitted)', citations removed,
  numbering identical to the report. Unlike the first package, the expository prose between statements was not
  pruned by hand; the checkers listed the hints they noticed (in each `A.md`) and say they did not rely on them.
- **Phase B.** The same sessions then received the report's pages for their sections (with proofs) and checked
  them step by step against their own attempts (`B.md`).
- Isolation by instruction only (no enforcement); no web access; only small Python checks (a long Lean build was
  running on the machine). The checkers are the model that wrote the report's prose. They differ from GPT-6
  Astra, which checked all proof notes and drafted those of Sections 4, 5, 7 and 8; the notes for Sections 3 and
  10 were compiled by Claude Opus 5.5, so for these two sections the second check is by the model that compiled
  the notes, with only the checks of the notes done by another model.
- Records: `audit/cross-vendor-rest/{work34,work5,work78,work10}/{A,B}.md`, scripts with outputs for Section 5.

## Outcomes

| Sections | Phase A (blind) | Phase B (report's proofs) |
|---|---|---|
| 3, 4 | every statement proved, including Theorem 3.7 and both results cited from Minamoto–Yamaura (Theorem 4.1, Proposition 4.4), without flatness of X | no error; routes of 3.7, 3.8, 4.1 and 4.7 differ and are correct; wording items |
| 5 | every statement proved, except Corollary 5.5(3), which needs a published result on universal localisations | no error; Corollary 5.5(3) rests on [Sch07a, Theorem 2.3, Lemma 4.1], which the checker could not see; Proposition 5.9's table and the relations of Proposition 5.14 verified symbolically for all parameters |
| 7, 8 | every statement proved, including Theorem 8.4 (the hypotheses on δ^a are necessary and sufficient for Ext^{>0}(Z,Z) = 0) | no error and no gap; the report's construction of P_Z is more direct than the checker's |
| 10 | every statement proved | no error; one gap in Corollary 10.5 (see below); Proposition 10.2 cites the sequence (8.5), which the checker reproved in this setting |

**The gap, and its repair.** Corollary 10.5 asserts ⟨τ, β, β⟩ = {0} for every β of degree −1 when the Ext algebra
is k[τ] with |τ| = p ≥ 3. For p > 3 the proof showed only that the bracket lies in Ext^{p−3} = 0, not that it is
defined (non-empty). Repair (applied to `report/sections/10-obstructions.tex`, commit `30024fa`): β² lies in
Ext-hat^{−2} ≅ D Ext¹ = 0 by Tate duality, and the composite of τ and β lies in Ext^{p−1} = 0 since 0 < p−1 < p.
Checked by Claude Opus 5.5 (main session); rechecked with all other round-2 edits by a fresh GPT-6 Astra session
(effort high): no error found (`audit/R2-recheck-codex.md`).

**The citation in Corollary 5.5(3).** Read in the source by Claude Opus 5.5 (main session): Schofield,
arXiv:0708.0257v1 (the author's library copy, SHA-256 `8eff10fa…83e816bc2`), Theorem 2.3: 'Let R be a right hereditary
ring. Then the universal localisations of R are parametrised by the well-placed subcategories of fpmod(R) …';
Lemma 4.1: 'The map from K_0(R) to K_0(R_E) is surjective.' (stated in Section 4 for a hereditary ring R and a
well-placed subcategory E; modules on the right, as the report says). A finite-dimensional hereditary algebra is
right hereditary; no hypothesis on the field. The deduction in the report is correct given these, so the gap
noted by the checker is closed by the source reading.

**Wording items applied** (commits `30024fa` and the following one): Corollary 7.4 (simple modules: X is an ideal of
square zero, instead of 'the proof of Proposition 4.4'); Lemma 8.2 (the compatibility clause made precise);
Proposition 10.2 ('if defined' removed); Corollary 10.3 (refers to the bimodule and triangle of Proposition 10.2);
Proposition 3.5 ('Moreover' instead of 'In this case'); Proposition 3.11 (an integer d and the variety of
d-dimensional modules instead of an undefined 'dimension vector').

**Further wording items, applied afterwards** (2026-10-09, after Gustavo's request; rechecked in
`audit/R2-recheck2-codex.md`): Remark 8.6 (the nonzero kernel of δ⁰ is used only for non-projectivity of S);
Example 3.9 (the conclusion of Proposition 3.8 fails as well: Ext¹(M, B) ≅ Be₁/ka ≠ 0, computed by Claude Opus 5.5);
Proposition 5.14 (characteristic two named); Proposition 5.13 (which parameters shift); Theorem 5.17 (H^jY_m is
isomorphic to a twist of p_jY_m); Proposition 3.5 (Tr Tr C ≅ C); Corollary 3.6 (C_n ⊂ P*_{n+1}); Proposition 3.8
(Bass numbers of the minimal injective resolution). Not applied: the remaining implicit routine steps in 3.10,
7.2 and 7.3, and the 'for instance' in the proof of Proposition 5.14 (all commutation relations were checked
symbolically by the Section 5 checker).

**Not covered.** The cited results of Minamoto–Yamaura, Auslander–Reiten, Happel, Geiß–Labardini–Schröer,
Crawley-Boevey, Schofield (other than the two read above) and the OpenAI preprints were not checked by the
checkers; the proofs as written depend on none of them except [Sch07a] in 5.5(3) and [AR75] only as attribution;
Appendix A and the computations behind Section 10's remarks were not rerun.

## Consequence

Together with `audit/cross-vendor-s6-s9.md`, every numbered statement of Sections 3–10 has now been proved
independently by Claude Opus 5.5 in a blind phase (except the existence of g_λ in Proposition 9.14, supplied by
the report's construction, and Corollary 5.5(3), which rests on [Sch07a]) and its
proof checked step by step against the report's; one gap was found and repaired (Corollary 10.5). Ledger row CV.2.
