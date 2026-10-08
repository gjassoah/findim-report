# Report

Status of this report: final for this round, 2026-10-08, written by Claude Opus 5.5. Nothing in it has been
checked by Gustavo; statuses are as in `docs/WORKING_RULES.md` (no claim is *proved* until he checks it).

## 1. Summary

1. **The preprint's algebra is not explicit.** Its key step (lifting a diagram from a Verdier quotient by
   roofs) is non-constructive; neither the number of simple modules (3(l+2), l unknown) nor arrows or
   relations are determined. Stages S1 (Abels-type group), S3 (rectification), S4 (simulation, trivial
   extension) are explicit given their inputs (`notes/01`).
2. **No simple counterexample was found.** In particular no example verifiable by hand. The smallest
   design found, a one-factor shrink of the AR construction (392-dimensional, 4 simple modules), was
   built explicitly and **fails** at a single Ext¹ class. The working design (the AR preprint's
   two-factor construction) could not be completed computationally even when minimised (9 simple
   modules for the finitistic counterexample).
3. **Two elementary criteria** for infinite little finitistic dimension were isolated, verified by a
   second model, and partly formalised in Lean:
   - **O.4** (classical mechanism): a nonzero module E with Ext^i(E, A) = 0 for all i ≥ 0 gives explicit
     modules Tr Ω^{n−1}E of projective dimension exactly n. **Formally verified in Lean** (with dual
     exactness in place of Ext vanishing), over an arbitrary ring.
   - **O.5** (classical, Auslander–Reiten 1975): a counterexample (Λ, M) to the Auslander–Reiten
     conjecture gives a counterexample to the finitistic dimension conjecture, End_Λ(Λ ⊕ M), with one more
     simple module. With OpenAI's explicit 8-simple Auslander–Reiten preprint (unverified), this yields a
     9-simple candidate — but that algebra has dimension ≈ 1.7·10³⁵ as specified; its minimised version was not completed within ~2·10⁶ unknowns per linear
     system (no lower bound on its size follows).
4. **Structural constraints** on any counterexample (verified by a second model): witnesses of unbounded
   dimension (O.2); selection data need infinitely many independent rank functions (O.3); triangular gluing
   cannot create a counterexample from good pieces (F.3); a simple strong-Nakayama witness forces an
   Auslander–Reiten counterexample on a corner (F.2).
5. **Why the small design fails, and why no design of that shape can work** (OF.1, AI-verified): by
   Tate duality, for a simple s over a symmetric algebra with polynomial Ext*(s, s), the decisive Toda
   bracket of the one-factor conversion design vanishes, so that design fails for every such simple. The
   two-factor construction escapes because it does not use that bracket (two cones with a gapped profile),
   not because the theorem fails for it (correction after V-C23). Its minimised version was not completed
   within the computational bound; no lower bound on its size follows from the intermediate dimensions.
   An earlier, weaker weight argument (W.1) explained the specific failure; its broader scope was refuted.
6. **Assessment** (heuristic). With the mechanisms known today, an example verifiable by hand looks out of
   reach: the obstructions found (O.2, O.3, F.2–F.3, OF.1) force either the non-explicit Verdier-quotient
   route of the main preprint or the two-factor Auslander–Reiten route. What can be made elementary is the
   *final step* (O.4, O.5, formalised in part), not the algebra.

## 2. Results and statuses

| Item | Statement | Status | Evidence |
|---|---|---|---|
| O.1 | findim(D ⋉ X) = ∞ if F = X⊗ᴸ_D− has finite, unbounded extinction times (gldim D < ∞) | AI-proved modulo the preprint's P.6.1–6.2 | notes/01 |
| O.2a/b | Fixed dimension vector ⇒ bounded extinction times / bounded finite pd | AI-verified | notes/02; audit/02 |
| O.3 | Selection data need infinitely many independent rank functions | AI-verified | notes/02; audit/02 |
| O.4 | Strong Nakayama failure ⇒ pd Tr Ω^{n−1}E = n | AI-verified; Lean (dual-exactness form) | notes/02; audit/02; lean/gates/stage2-3b18d65 |
| O.5 | Auslander–Reiten counterexample ⇒ finitistic counterexample, one more simple | AI-verified (classical) | notes/02; audit/03 |
| L.1 | Projective coresolution of a projective, first cokernel nonprojective ⇒ pd cₙ = n (any abelian category) | formally verified (Lean, gates pass) | lean/gates/stage1-9025166 |
| L.2 | O.4 over an arbitrary ring, dual exactness as hypothesis | formally verified (Lean, gates pass) | lean/gates/stage2-3b18d65 |
| F.1–F.4 | Fable's structural lemmas (with corrections) | AI-verified as corrected; one consequence refuted | audit/05 |
| P.2.x | The preprint's group quotients F_m | supported (m ≤ 6) | computations/01 |
| AR.C,T | AR preprint's finite data on C, T | supported (low degrees) | computations/02; audit/04 |
| F.C3 | Near-miss test bed Λ₀ (dim 80, 4 simples) | supported (degrees ≤ 6), behaves as predicted | computations/03; audit/06 |
| C.c, F.C1 | One-factor design: c = 0; built explicitly, fails at Ext¹ | AI-proved (c = 0); supported (failure) | audit/07, audit/08 |
| W.1 / W.1' | Weight argument for Candidate 1 / its general scope | AI-verified / refuted | notes/03; audit/11 |
| W.2 | Fable's sharp weight condition δ(τ′) = −2N | AI-verified with scope corrections | escalations/02; audit/12 |
| OF.1 | Tate-duality obstruction: no one-factor conversion design over a polynomial-Ext simple | AI-verified (Codex argument, Claude check) | notes/03 §4; audit/12 |
| AR.size, AR.2f | Size of the AR algebra as specified (≈10³⁵); minimised two-factor not completed (intermediate bimodules ~10⁶-dimensional; no lower bound on the final size) | AI-computed | audit/03 §5; audit/10 |

## 3. What was refuted, demoted or left open

- Refuted: Fable's Candidate 1 (one-factor shrink); Fable's consequence that every idempotent ideal of a
  candidate is non-stratifying; Claude's scope claim that every one-factor design over a trivial extension
  fails.
- Corrected: Fable's Lemma 1 (projective summands), Lemma 3 (D⁻ instead of D^b), O.2a (one intermediate
  assertion), the side bookkeeping for the companion preprint (right, not left, findim via O.4).
- Excluded: one-factor conversion designs over a polynomial-Ext simple (OF.1).
- Open: the generalisation O.3' of the preprint's selection input (plausible); conversion designs with
  non-scalar stable endomorphisms or a redesigned conversion principle; a direct strong-Nakayama witness E
  that is not simple (Lemma F.1); verification of the main preprint (not a goal) and of the AR preprint
  beyond its finite data and low-degree tests.

## 4. Riskiest points for Gustavo to check first

1. OF.1 (the Tate-duality obstruction) decides the negative outcome of the search; check the duality
   conventions and the bracket inclusion.
2. O.4 and O.5 are the load-bearing elementary statements; both are classical in mechanism, but the exact
   formulations (pd C_n = n, the side conventions) should be checked.
3. Every statement about the AR preprint rests on low-degree computations, not on a proof in all degrees.
4. The size estimate 10³⁵ and the intermediate dimensions of the minimised construction are computed by Codex from the preprint's definitions; they were not
   re-derived by Claude.

## 5. Second Fable consult and its continuation by Codex

The second consult (`escalations/02-one-factor-fix.md`) stopped three times on the model's 64 000-token
output limit; it left one section (§2, the sharp weight condition W.2). The remaining questions went to Codex (job 12, max effort), which checked §2, proved the stronger,
grading-free obstruction OF.1 (checked by Claude), and tested three concrete one-factor attempts (all fail
the polynomial-Ext requirement).

## 6. Models and process

Claude Opus 5.5 (orchestration, notes, Lean stage 1, reviews, check of OF.1); Codex GPT-6 Astra (12 jobs:
workflow critique, independent verifications, all heavy computations, Lean stage 2, the one-factor search);
Claude Fable 5.1 (two consults; the second stopped three times on the output limit and was completed by
Codex); Claude Sonnet (literature watch, summaries, one computation). Per-unit attribution: `PROGRESS.md`; conversation: `log/CONVERSATION.md`.

Not done: a full verification of either preprint; Lean stage 3 (O.5, deferred); a computer search for a
smaller algebra C (Fable's Candidate 2).

## 7. Part II: the research report (2026-10-08)

The report `report/main.pdf` (51 pages; title "Report on OpenAI's counterexamples to the little finitistic
dimension conjecture for finite-dimensional algebras", prepared autonomously by Claude Opus 5.5 and GPT-6 Astra)
reconstructs both preprints in a common framework with complete proofs, and adds criteria and obstructions.
Main points, all AI-verified (nothing checked by Gustavo):

- **Main construction, generalised.** Theorem 7.3: finitely presented selection data (R, Ψ) with Ψ_R
  finitely generated projective and unbounded extinction give a finite-dimensional algebra Δ ⋉ X of infinite
  findim, over any field (the preprint: central idempotent and endomorphism, over ℂ). The only non-explicit
  step remains the lifting by roofs; the number 3(l+2) of simple modules is not determined.
- **AR route.** The conversion principle holds over any field (Theorem 8.4); the counterexample over
  𝔽₂(q, H₁, H₂) gives an algebra of infinite findim with nine simple modules; the triangular algebra Λ has
  dimension ≈ 1.703·10³⁵ (recomputed independently).
- **New obstruction.** Corollary 10.3: the one-factor version of the AR construction (one cone over T)
  always fails in degree zero when Ext*(s, s) = k[τ], |τ| = 3 (direct proof via Tate duality, supplied in the
  W4 check and re-verified in W5); Theorem 10.4 (Tate-duality vanishing of the brackets ⟨τ, β, β⟩) explains
  it.
- **Process.** Every proof note verified in a fresh session; every section checked against its note (W4,
  about forty wording/scope repairs, two compressed steps restored, no error in a proof); block-by-block
  review (W5: 337 blocks, 15 proposals, all adopted). Decisions in `audit/report-review.md`.
- **Lean.** A complete formalisation is not feasible at reasonable size (`lean/FEASIBILITY-report.md`).
  The stages approved by Gustavo are formally verified in Lean (`lean/DESIGN.md`, `LEDGER.md` rows L.*): 3a, Theorem
  3.3 with its actual hypothesis (vanishing of Ext), over an arbitrary ring, with the transpose identified
  for the presentations of the resolution (without minimality); 3b, the group of §5 (Definition 5.6 to
  Corollary 5.15); 3c, Lemma 6.1, Lemma 6.6 and Proposition 6.7 without its K₀ clause; 4b, the argument of
  Proposition 5.4 as linear algebra; 4a, the results of §10 conditionally on three approved interface
  fields (Tate duality and the polynomial self-extensions of s), without the Ext¹ clauses. Stage 3d (the
  finite computations of §9) was not approved.
- **Release.** Every page carries the notice "NOT VERIFIED -- PROVIDED AS IS"; a caveat lector precedes the
  introduction; Appendix D declares the use of AI. A final pass removed AI-like prose (`audit/P-*`). The
  public version of this repository is a single snapshot commit; it omits the preprint (pinned link and
  checksums instead) and six page images of third-party papers (`tools/make_public_repo.sh`).
