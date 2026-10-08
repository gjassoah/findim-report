# Escalation 02: breaking the weight obstruction (one-factor design)

For: Claude Fable 5.1 (second of 2–4 calls). Prepared by Claude Opus 5.5, 2026-10-07. Self-contained, with
pointers. The answer is untrusted input and will be checked by computation and a second model.

## Where we are

Read first: your earlier answer `escalations/01-answer-fable.md` (its Candidates 1 and 3), then
`notes/03-search-results.md` (results and a weight argument), and the verification reports
`audit/05-…` (corrections to your Lemmas 1–3: Lemma 2 verified; Lemma 1 needs C without projective
summands; Lemma 3 holds in D⁻; "all idempotent ideals non-stratifying" is false), `audit/07-…` (c = 0),
`audit/08-…` (Candidate 1 built). Code for C, T, the test bed and Candidate 1 is in `computations/02-…`
to `computations/05-…`.

Facts (status in brackets):
- The AR preprint's finite data on C (dim 10) and T = C ⋉ DC (dim 20) pass all checks in low degrees
  [supported].
- Your Candidate 3 (Λ₀, dim 80) behaves exactly as you predicted through degree 6 [supported].
- c = ⟨τ, β₀, β₀⟩ = 0 with zero indeterminacy, because the lift through the cone vanishes as (DC)² = 0
  [AI-proved by Codex, exact over 𝔽₂(q)].
- Candidate 1 built explicitly: dim F = 352, dim Λ₁ = 392, dim Z = 16; Ext^{1,2,3}(Z, Z) = (1, 0, 0),
  Ext^{1,2,3}(Z, Λ₁) = 0, δ⁰ = [[1,1],[0,0]] [supported]. It fails at Ext¹, as you predicted.
- Weight argument (notes/03 §2) [AI-proved sketch, unverified]: over any trivial extension C ⋉ DC the
  DC-scaling automorphisms act on Toda brackets; with w(τ) = −1 odd and H⁰ of weight 0, every bracket
  ⟨τ, β, β⟩ with β ∈ H^{−1} vanishes. So **no one-factor design over a trivial extension** can have c ≠ 0.

So a one-factor design would give an algebra of dimension ≈ 400 with 4 simples (5 for the final
finitistic counterexample via O.5) — far smaller than the two-factor construction — if the obstruction can
be broken.

## Questions

1. Is the weight argument correct, and does it really kill **all** one-factor variants over trivial
   extensions (e.g. using a power τ^r, a different cone, a different X, a different β)? If there is a
   one-factor variant over C ⋉ DC that escapes it, describe it.
2. Propose concrete one-factor designs that escape the obstruction. Options to consider (not exhaustive):
   (a) a symmetric algebra T′ that is not a trivial extension (e.g. a deformation of C ⋉ DC with
   (DC)² ≠ 0, a Brauer-graph-type or "twisted trivial extension" algebra, a symmetric algebra built from C
   by another construction), still with Ext*_{T′}(s, s) = k[τ] for a simple s and a one-parameter family of
   automorphisms acting on τ^m by distinct characters; (b) a different second ingredient than the cone of
   τ (another bimodule whose stable profile at s has the right gap); (c) using two different simple
   modules or a non-simple X over T. For each: the explicit data (algebra by quiver/relations or
   multiplication rule, module, bimodule), why the weight obstruction does not apply, and what must be
   computed to test it. Keep each candidate testable by the existing code in a few hours.
3. If you believe every one-factor design fails for a structural reason, state that reason precisely.
4. Rank your proposals by (probability of success) × (smallness). Mark everything unproved.

Write your answer to `escalations/02-answer-fable.md` (section by section). Modify no other file. At most
about 200 lines.
