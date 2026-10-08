# Codex job 09: Lean stage 2 (duality half of Proposition O.4)

Lean repository (writable for this job): `findim-counterexample-formalisation`.
Read its `README.md`, `AGENTS.md`, `FindimCounterexample/Coresolution.lean` (stage 1, proved) and
`tools/gates.sh`. In this verification repository read `lean/DESIGN.md` and `docs/WORKING_RULES.md`
(section LEAN_FORMALISATION). The rules there are hard: no `sorry`/`admit`/axioms/`native_decide`, no
heartbeat or recursion changes, axioms ⊆ {propext, Classical.choice, Quot.sound}, files ≤ 1500 lines,
warnings as errors. Do not change `lean-toolchain`, `lakefile.toml` (except adding nothing), the manifest,
or stage 1's statements. Do not commit; Claude commits after review.

## Goal

Formalise, for an arbitrary ring A (not necessarily commutative), the duality step of O.4:

> Let E be a right A-module (a module over `Aᵐᵒᵖ`) with a resolution
> ⋯ → P₂ → P₁ → P₀ → E → 0 by finitely generated projective right A-modules. For a right module P let
> P* = Hom_{Aᵐᵒᵖ}(P, A), a left A-module via left multiplication on values. Suppose the dual complex
> 0 → P₀* → P₁* → P₂* → ⋯ is exact (including injectivity of the first map). If E ≠ 0, then the left
> A-modules C_n = coker(P_{n−1}* → P_n*) (n ≥ 1), with C₀ = P₀*, form a `ProjectiveCoresolution` (stage 1)
> with C₀ projective and C₁ not projective; hence pd C_n = n for all n ≥ 1.

(Informally, exactness of the dual complex is equivalent to Ext^i(E, A) = 0 for all i ≥ 0; that
equivalence is **not** to be formalised in this job and will be recorded as a departure.)

Sub-steps you will need (search the pinned Mathlib first — sources, not memory — and record what you
found): the left A-module structure on `P →ₗ[Aᵐᵒᵖ] A`; P* projective for f.g. projective P; the
evaluation map P → P** is an isomorphism for f.g. projective P (prove for finite free, then summands);
"P₀* → P₁* split mono ⇒ P₁ → P₀ split epi ⇒ E = 0"; assembling the short exact sequences in `ModuleCat A`
from the exact dual complex. Choose the formal representation of the resolution (e.g. a `ChainComplex`
in `ModuleCat Aᵐᵒᵖ` with a quasi-isomorphism, or an explicit ℕ-indexed family with exactness hypotheses);
prefer the simplest faithful one and explain the choice.

## Bound and stopping rule

Put the work in new files under `FindimCounterexample/` (e.g. `Duality.lean`, `StrongNakayama.lean`),
imported from `FindimCounterexample.lean`, and add the main statements to `Audit/Statements.lean`. If after
a serious attempt the missing infrastructure (e.g. reflexivity over noncommutative rings) looks larger than
about 800 lines, stop, leave only compiling, sorry-free lemmas, and report precisely what is missing.
Run `tools/gates.sh` with evidence directory
`lean/gates/stage2-uncommitted`
at the end.

## Output

A report in this verification repository, `audit/09-lean-stage2-codex.md` (written incrementally): Mathlib
searches and reuse decisions, the formal statements with an informal reading, every departure, gate
results, and what remains. Final answer at most 25 lines, first line model and effort.
