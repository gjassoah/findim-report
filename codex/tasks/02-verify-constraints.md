# Codex job 02: independent verification of four lemmas, and a literature check

You are a verifier for a public research task on the little finitistic dimension conjecture for
finite-dimensional algebras (see `README.md`, `AGENTS.md`). Your job is to **find errors**, not to confirm.

## Inputs

- The claims and proofs to check: `scratch/02-frozen-claims.md` (Lemmas O.2a, O.2b, O.3, Proposition O.4,
  and the "Consequences" paragraphs after each). Read only this file for the claims. Do **not** open
  `notes/`, `LEDGER.md`, `PROVENANCE.md`, `log/` or `codex/outputs/`: they contain other agents' opinions.
- Background, if needed: the preprint `build/sections/*.tex` (the trivial-extension criterion is in
  `06-square-zero-and-conclusion.tex`).
- Conventions: k a field; algebras finite-dimensional unless said otherwise; modules finitely generated;
  Rep_d(A) the affine variety of A-module structures on k^d (or on a dimension vector d); Tr the
  Auslander–Bridger transpose; Ω the syzygy of a minimal projective resolution; (−)^* = Hom(−, A).

## Task

1. For each of O.2a, O.2b, O.3, O.4: check every step, quantifier and hypothesis. Look for counterexamples
   in the smallest cases (for O.4, test the argument on a small algebra where you can compute; for O.3,
   test on a commutative example and on a group algebra). Give a verdict: *no error found*, *error found*
   (step and reason), or *gap* (what is missing). Then check each "Consequences" paragraph as a separate
   claim with its own verdict.
2. Literature: for each statement, search for whether it is known (arXiv, and anything you can reach
   online; e.g. results that the finitistic dimension conjecture implies the strong Nakayama conjecture,
   semicontinuity of projective dimension on module varieties, K₀ of universal localisations of hereditary
   algebras). For every reference you give, state whether you read the statement in the source and give the
   exact locator (theorem number, page) and the version read; otherwise mark it "not read, from memory or
   snippet". Never invent references.
3. Optional, only if time remains: one paragraph on which of the two mechanisms (trivial extension with
   unbounded extinction; strong Nakayama failure as in O.4) seems more promising for an *explicit*
   counterexample with few simple modules, and why.

## Output

Write your report incrementally to `audit/02-verification-codex.md` (create it; append section by section,
so that partial work survives an interruption). Your final answer is a summary of at most 40 lines with the
verdicts. First line of both: your model and reasoning effort if known, else "unknown". Modify no other
file.
