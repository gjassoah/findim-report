# Codex job 11: verify the weight argument

You are a verifier (`README.md`, `AGENTS.md`). Find errors; do not confirm. Read only
`scratch/11-frozen-weight-argument.md` for the claim; you may use `.cache/ar-src/` and
`computations/02-ar-finite-data/`, `computations/04-toda-bracket/` (your own earlier code) for tests. Do not
open `notes/`, `escalations/`, `log/`, `LEDGER.md`.

Check: (1) that restriction along the DC-scaling automorphism h_H is a triangle autoequivalence of the
stable module category fixing s, and how it acts on H^* (well-definedness of "weight", choice of the
isomorphism Φ_H(s) ≅ s); (2) naturality of Toda brackets under triangle functors, including signs in
characteristic 2 and the indeterminacy; (3) the application to the one-factor Candidate (p = 3, r = −1,
w(τ) = −1): compute the weights of τ and β₀ explicitly from the code and confirm w(τ) + 2w(β₀) ≠ 0;
(4) the scope claim that the argument covers every one-factor design over a trivial extension "in which
the relevant classes are homogeneous" — is homogeneity automatic? Look for a counterexample to the scope
claim (e.g. a non-homogeneous β, a bracket landing in a nonzero-weight part, a power τ^r). Verdict per
item; write incrementally to `audit/11-weight-argument-codex.md`; final answer ≤ 20 lines, first line model
and effort. Modify no other file.
