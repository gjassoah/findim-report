# Cross-vendor check of Sections 6 and 9 (round 2, 2026-10-09)

Checkers: Claude Opus 5.5, two fresh sessions (one for Section 6, one for Section 9), effort not stated by the
harness. Orchestrator: Claude Sonnet 5.5 (this record reviewed by Claude Opus 5.5). For Sections 4–9 the proof
notes were drafted by GPT-6 Astra and checked in fresh GPT-6 Astra sessions, and the prose was written by Claude
Opus 5.5 from those notes; this is the first check of Sections 6 and 9 by a model other than GPT-6 Astra. Status of the outcome: AI check by one model per section, plus exact computations where stated; not human
verification, not a formal proof.

## Procedure

- **Phase A (blind).** Each checker received only `statements.pdf` (SHA-256 `e80c3cc2…`, 15 pages: definitions,
  constructions and numbered statements of Sections 2, 5, 6, 8 and 9, compiled from the report sources with every proof,
  remark and example replaced by '(omitted)' and all citations removed; numbering identical to the report) and, for
  Section 9, `cochain-table.md` (the 179-entry data defining the cochain p). No proofs, earlier verdicts, ledger or
  OpenAI preprints. Task: prove each statement or say exactly where this fails. Scope: all statements of Section 6
  (in particular Theorem 6.18 and Corollary 6.20); all statements of Section 9 through Corollary 9.18 (Sections 2 and 8
  as background). Work directories outside the repository; all notes in `audit/cross-vendor/` (`A6.md`, `A9.md`).
- **Phase B.** The same sessions received the report's pages with proofs (`report-sec6-with-proofs.pdf`,
  `report-p28-end-of-sec6.pdf` (the end of Corollary 6.20, which my first page range had cut off),
  `report-sec9-with-proofs.pdf`; hashes in `audit/cross-vendor/package.sha256`) and checked the report's proofs step by
  step against their Phase A attempts (`B6.md`, `B9.md`).
- Scripts and saved outputs of the checkers are in `audit/cross-vendor/` (exact arithmetic over GF(2)(q) and
  GF(2)(q,λ) in Sage; a sign-flip control for the Section 6 check).

## Limits of the isolation (read before relying on the 'blind')

- Isolation rests on the instructions (the checkers were told to read nothing outside the package directory and had no
  web access); the harness did not enforce it. The checkers report that they read only the package files.
- The statement package contains the statements of all lemmas of Section 6, hence the skeleton of the proof of
  Theorem 6.18, and the expository prose between statements. Seven argument-like paragraphs were removed by hand
  (the sentences after Proposition 6.5, after Construction 6.10, after Proposition 6.12 and after the statement of
  Proposition 6.15; the paragraph after Proposition 6.7; the commentary after Proposition 9.3; the definition of the chain
  map of the bar resolution before Proposition 9.8); some hints may remain. The Section 9 checker said that Lemma 9.7(4) 'is clearly tailored
  to the proof of Proposition 9.8' and that it used it only after verifying it; the Section 6 checker used the
  four-step outline at the start of Section 6 as a roadmap. The checkers were asked to report such hints and did.
- The checkers are the same model (Claude Opus 5.5) as the one that wrote the prose of the report. Cross-vendor
  here means different from the model that drafted and checked the proof notes, not different from the writer of
  the prose.
- The Stacks Project tags were checked separately (`audit/stacks-tags-round2.md`); the Section 6 checker could not
  check them. [Lin13], [Ope26c], Theorem 3.7 (used in Corollary 9.18) and Appendix A were not available to the
  checkers; see below.

## Phase A outcomes

**Section 6.** Every numbered statement was proved from the definitions (Lemma 6.1, Construction 6.2 claims,
Lemma 6.3, Propositions 6.4, 6.5, Lemma 6.6, Proposition 6.7, Lemma 6.9, Construction 6.10, Lemma 6.11,
Propositions 6.12, 6.15, Theorem 6.18, Corollary 6.20). No statement was found false, missing a hypothesis, or
ambiguous in a way that matters. Conventions fixed: arrows `a : i → j` lie in `e_j B e_i`; matrices act on columns;
'f has components id_I on I' read as an isomorphism in Kar T under which f is diag(id_I, 0); homotopy `g = dh + hd`.
Proposition 6.15 was proved by an explicit twisted-complex construction and checked by a finite computation (mod
10007, with a sign-flip control that breaks d² = 0).

**Section 9.** Everything was proved except one point: for **Proposition 9.14** the checker could not show that the maps
`g_λ` exist (it proved β₀ ≠ 0 but not the existence of a stable bimodule map E_λ → C[3] with nonzero evaluation; the
obstructions in twisted Hochschild cohomology of E could not be settled, and Tate cohomology has no Künneth formula).
Propositions 9.16, 9.17 and Corollary 9.18 were therefore proved only on the assumption of 9.14. Lemma 9.7 and the
identities of Sections 9.1–9.3 were verified by exact computation over all basis tuples (15 250 composable
quadruples and 324 pairs for Lemma 9.7, with λ symbolic), relying on a correct transcription of the 179-entry table.
Conventions fixed by the checker (chain map p[−3] and p ⊗ s were not defined in the statement document; right
twist of T in Lemma 9.9; left multiplication in Proposition 9.11).

## Phase B outcomes

**Section 6 (`B6.md`).** No error found in the report's proofs of any statement, including Corollary 6.20 and
Remark 6.21 (after the missing page was supplied). Routes differ from the checker's in Lemma 6.3 (explicit
resolution; the report covers all modules), Lemma 6.6 (hand-built section plus Yoneda) and 6.1(2) (direct sum), all
correct. The complex P of Proposition 6.15 matches the checker's term by term including signs, so the checker's
numerical check applies to the report's P. Wording points (none affects correctness): Proposition 6.4 leaves
`e_i M(Y) = Y` and `M(Y) = 0 ⇒ Y = 0` implicit and uses the equivalence between representations of `(Q, J₂)` and
B-modules without citation; Lemma 6.9 leaves the bound `dim HY ≤ n dim Y` implicit; Lemma 6.11 skips the application of
the functor to the fixed isomorphism; Construction 6.10 uses that `r ↦ r_V` is a unital algebra map without saying so;
Remark 6.14: the hypothesis `a ≤ 0 ≤ b` is not needed; the proof of 6.15 reuses the letters K, r, t. Not checkable:
the Stacks tags (done separately here: one wrong tag, repaired) and Remark 4.6 (outside the pages).

**Section 9 (`B9.md`).** No mathematical error found. The report's proof of **Proposition 9.14 closes the gap of
Phase A**: it does not use obstruction theory but writes down an explicit chain map `Φ : Q ⊗ Q → K[3]`, defined
below degree 0 (the only defect, `D_b ⊗ D_b`, sits in degree 0), from the twisted Casimir element, the homotopies B
and G (the only use of Lemma 9.7(3)) and the report's chain map p; the checker verified each identity by hand and by
exact computation over GF(2)(q,λ), and that the evaluation at S is `λ² β₀`. The checker's Phase A doubt about passing
from T to E was too pessimistic for this explicit construction. Lemma 9.4, Theorem 9.5 and Lemma 9.12 use
routes different from the checker's, all correct. The three convention questions: the report twists the right action in
Lemma 9.9 (exponent `λ^{−m}` correct); defines p[−3] explicitly via the last three entries (the checker's lift via the
first three is homotopic); and left multiplication in Proposition 9.11 is the consistent reading, but the text does not
state it. Remark 9.19: dim C₁ = 1 623 889 344, dim F = 800 + 159999⁵·dim C₁ and dim Λ ≈ 1.703·10³⁵ reproduced; the two
minimal-resolution dimensions (784 704 and 1 377 984) not checked.
Wording points: W1 (proof of 9.14: 'the one with w* ending at f' should read 'w* = f'); W2 (Proposition 9.11: side of
multiplication and the identification `H^{−3m−1} ≅ DP_m` not stated); W3 (proof of 9.16: 'by Lemma 9.9' should read
'by Lemma 9.9 and Proposition 9.10'); W4 (proof of 9.10: 'commute in characteristic two' — in general up to a
Koszul sign).

## What was not covered

The Section 9 check used Theorem 8.4 as stated, without proving it. In Phase A the checker also used the Künneth
formula for Ext and the Buchweitz–Rickard equivalence, from memory; the report's route does not need them. The
use of Theorem 3.7 in Corollary 9.18 was not checked in the report's form (Theorem 3.7 was not in the checker's
input; it proved the conclusion by its own argument for left modules). Tate duality [Lin13] was used as recalled
in Section 2.1. Appendix A was not seen; Lemma 9.7 was recomputed from the table data. The checkers did not
examine Sections 7, 8 (beyond use), 10 or the Lean formalisation.

## Consequences

- No mathematical error found in Sections 6 and 9 by this check. The ledger rows R.6 and R.8.2–8.6 (whose report
  section numbers predate the final numbering; they correspond to Sections 6 and 9) keep their status AI-verified;
  the check is recorded as a separate row, CV.1.
- Wording points listed above are proposals only (not applied to the report in round 2); the repair-and-recheck process
  applies to errors, and none was found.
