Model: GPT-6 (Codex); effort: unknown.

# Job 09: duality in Proposition O.4

Status: complete (AI-proved; all five acceptance gates passed). This report is an AI research and formalisation record, not
an author certification. The explicit job authorises changes in the separate
Lean repository. No commits are authorised.

## Scope and representation

Use an explicit natural-number-indexed family of right modules and linear maps,
with exactness stated on the underlying maps. This avoids quasi-isomorphisms and
the unrequested comparison with Ext. The intended cokernels are actual quotients
by ranges, with degree zero treated separately. Stage 1 remains unchanged.

The dual of a right module is `P →ₗ[Aᵐᵒᵖ] A`, with left multiplication
on values; its second dual is `(P →ₗ[Aᵐᵒᵖ] A) →ₗ[A] A`, with right
multiplication on values. Both scalar actions on `A` are Mathlib instances.

## Pinned source searches

Mathlib HEAD checked: `0df444a360eaa60ab8c11dca51a86af692955474`.

- `Algebra/Module/Opposite.lean`: `Semiring.toOppositeModule` gives the right
  action on `A`. `Algebra/Group/Action/Opposite.lean` supplies the commuting
  left and right actions. The linear-map module instances can therefore supply
  the required action on the dual without a new scalar-action definition.
- `LinearAlgebra/Dual/Defs.lean`: `Module.Dual.eval`, `Module.IsReflexive`,
  `Module.evalEquiv`, and `Module.IsReflexive.of_split` require
  `CommSemiring`. They cannot directly handle this job's noncommutative ring.
- `RingTheory/Finiteness/Projective.lean`:
  `Module.Finite.exists_comp_eq_id_of_projective` exhibits a finitely generated
  projective as a retract of `Fin n → R`, over a general semiring. Reuse this.
- `Algebra/Module/Projective.lean`: reuse `Module.Projective.of_split`,
  `Module.Projective.of_equiv`, and the free-module projectivity instance.
- `Algebra/Category/ModuleCat/Projective.lean`: module and categorical
  projectivity comparison is available; this module's compiled cache was absent
  at the initial inspection.
- `Algebra/Category/ModuleCat/Kernels.lean`: categorical cokernels identify with
  range quotients; exactness and kernel/cokernel construction tools are available.
- `Algebra/Homology/ShortComplex/ShortExact.lean`:
  `ShortExact.splittingOfProjective` provides the required splitting.

No noncommutative reflexivity theorem was found in the inspected duality files.
The implementation attempt will construct finite-free duality and transfer it
along the finite-free retract. Initial estimate: this may fit below the job's
approximately 800-line infrastructure bound; reassess after compiling it.

## Departures

1. Exactness of the dual complex replaces the Ext-vanishing formulation, as
   explicitly requested. Their equivalence is not formalised.
2. The explicit family presentation replaces a bundled projective resolution;
   the final report will identify exactly which resolution hypotheses are used.

## Checkpoint

Rules and stage 1 read; initial Mathlib search complete. No new Lean result has
yet been checked. Final gates are pending.

## Implementation checkpoint 1

`Duality.lean` now contains the two dual types, precomposition, evaluation,
finite-free coordinate expansion and the finite-free evaluation argument.
The finite-free portion has compiled. The retract transfer, dual projectivity
and dual finite generation, and split-map transfer are being checked.

`ExactCoresolution.lean` assembles the range quotients into stage 1 data,
using `Submodule.liftQ`, `range_liftQ`, `ker_liftQ_eq_bot`, `ker_mkQ`,
and `ShortComplex.moduleCat_exact_iff_range_eq_ker`. This keeps the cokernels
concrete and the degree shift explicit: middle term number n is X_(n+1).

The existing `ModuleCat.Projective` module is being built locally from the
pinned sources; no dependency pin or package configuration is changed.

## Implementation checkpoint 2

`Duality.lean` and `ExactCoresolution.lean` pass the project build, including
warnings as errors and the standard Mathlib linters. The noncommutative
infrastructure is 204 lines and the cokernel assembly is 89 lines; the stopping
bound is not reached. The next file connects these results to stage 1.

Additional reuse: `Module.Finite.of_surjective` transfers finite generation
from the finite-free dual to its retract. Both the finite-free isomorphism and
evaluation are constructed explicitly, rather than invoking commutative duality.

The main result will use only a surjective augmentation `ε : P₀ → E` and
`ε ∘ d₀ = 0` from the right resolution. Higher right exactness and exactness at
`P₀` are unnecessary for this implication. This strengthens the requested
statement; it does not add a hypothesis or replace a missing theorem by an
interface assumption. Dual exactness is still required in every degree.

## Formal statements and informal reading

Mathematical status of the declarations below: AI-proved (Lean compilation with
warnings as errors passed). The final gate section records independent kernel
replay separately. Correspondence/readability review here is by the same model
that wrote the code, not an independent model or author review.

All names below are under `FindimCounterexample`.

| Declaration | Informal reading |
|---|---|
| `RingDual.freeDualEquiv` | `Hom_(Aᵐᵒᵖ)(ι → Aᵐᵒᵖ, A) ≃ₗ[A] (ι → A)` for finite `ι`, by coordinates. |
| `RingDual.eval_bijective_free` | Evaluation into the double dual is bijective for finite free right modules. |
| `RingDual.eval_bijective_of_split` | Bijectivity of evaluation descends along an actual split inclusion. |
| `RingDual.evalEquiv` | `P ≃ₗ[Aᵐᵒᵖ] ((P →ₗ[Aᵐᵒᵖ] A) →ₗ[A] A)` for finitely generated projective right `P`; the forward map is evaluation. |
| `RingDual.rightDual_projective`, `.rightDual_finite` | Such a dual is projective and finitely generated on the left. |
| `RingDual.split_of_dual_split` | For finitely generated projective right modules, `r ∘ f* = id` implies existence of `s` with `f ∘ s = id`. |
| `ExactCoresolution.shortExact`, `.coresolution` | Injectivity at degree zero and range = kernel subsequently give short exact sequences on actual range quotients. |
| `StrongNakayama.coresolution` | The dual terms and their quotient maps form the stage 1 `ProjectiveCoresolution`. |
| `StrongNakayama.projective_zero`, `.not_projective_one` | The initial term is projective; the first cokernel is not projective under the nonzero augmentation hypotheses. |
| `StrongNakayama.cok_finite` | Every cokernel term is finitely generated. |
| `StrongNakayama.projectiveDimension_eq` | The specified cokernel has projective dimension exactly `n` for every `n ≥ 1`. |
| `StrongNakayama.unbounded` | For every positive integer `n` there is a finitely generated left module with that exact projective dimension. |

The final theorem has the following hypotheses and conclusion (notation
abbreviated here; the full elaborated types and axioms are in
`lean/gates/stage2-uncommitted/4-statements.log`):

```lean
{A : Type u} [Ring A]
(P : ℕ → ModuleCat.{v} Aᵐᵒᵖ)
(d : ∀ n, P (n + 1) →ₗ[Aᵐᵒᵖ] P n)
[∀ n, Module.Finite Aᵐᵒᵖ (P n)]
[∀ n, Module.Projective Aᵐᵒᵖ (P n)]
(h₀ : Function.Injective (dualDifferential P d 0))
(h : ∀ n, LinearMap.range (dualDifferential P d n) =
            LinearMap.ker (dualDifferential P d (n + 1)))
{E : Type w} [AddCommGroup E] [Module Aᵐᵒᵖ E] [Nontrivial E]
(ε : P 0 →ₗ[Aᵐᵒᵖ] E) (hε : Function.Surjective ε)
(wε : ε.comp (d 0) = 0)
(n : ℕ) (hn : 1 ≤ n)
⊢ HasProjectiveDimensionLE (cok P d n) n ∧
    ¬ HasProjectiveDimensionLT (cok P d n) n
```

Here `dualDifferential P d n` is exactly precomposition with `d n`.
The actual definitions satisfy `cok P d 0 = P₀*` and
`cok P d (n+1) = P_(n+1)* / range(dₙ*)`. Sequence number n has middle
term `P_(n+1)*`. The original resolution in the job supplies every hypothesis;
there is no minimality requirement.

For the nonprojectivity argument, a projective first cokernel splits the first
short exact sequence. Its retraction gives a section `s` of `d₀` by the duality
lemma. Then `ε(x) = ε(d₀(s(x))) = 0` for all x. Surjectivity makes every element
of E zero, contradicting `Nontrivial E`. This is the argument implemented in
`not_projective_one`, not an assumed fact.

## Final departures and exclusions

The complete numbered list, also in `lean/DESIGN.md` and the Lean README, is:

1. Exact projective dimension uses the unchanged stage 1 pair of predicates,
   `HasProjectiveDimensionLE` and negated `HasProjectiveDimensionLT`.
2. The Ext-vanishing equivalence is not formalised; dual exactness is assumed
   directly, including injectivity of its first map, as requested.
3. The ring is arbitrary. Finite dimensionality over a field is not assumed,
   and the commutative duality API is replaced by the bimodule-valued dual.
4. An indexed family and linear maps replace a bundled chain complex. Of the
   right resolution, only the surjective augmentation and its zero composite
   with the first differential are used. The theorem omits unused right
   exactness hypotheses and assumes no new interface facts.

The existential `unbounded` theorem does not define the little finitistic
dimension numerically. No concrete counterexample algebra, proof of the
Ext comparison, or stage 3 statement is claimed. These are outside this job.

## Correspondence and readability check

The same implementing model reread all three final source files and the
elaborated main theorem types. Checks: ring handedness; multiplication order
in the finite-free expansion; evaluation as the actual forward map; both
finite/projective hypotheses in the splitting lemma; first-map injectivity;
nontriviality of E; the shift of the middle term; actual quotient objects;
all positive degrees; finite generation of the resulting modules. No additional
commutativity, splitting, minimality, or Ext interface hypothesis appears in
the final theorem. Claude's independent correspondence review remains pending.

During development, compilation exposed a reversed precomposition in the
retract argument and standard-linter complaints about unused `Fintype` and
`DecidableEq` parameters. These were corrected before the acceptance run;
no budgets or linter settings were changed. New source sizes are 204, 89 and
105 lines. The approximately 800-line stopping threshold was not reached.


## Gate results and hand-off

`tools/gates.sh` completed with exit status 0. Evidence directory:
`lean/gates/stage2-uncommitted/`. Lean base commit:
`9025166e52d3d66e54b45b6589ac84678e710854` (changes remain uncommitted).

| Gate | Result | Evidence |
|---|---|---|
| Forbidden constructs/options, line bounds, root imports | exit 0 | `1-source-scan.log` |
| Full build, warnings as errors and standard linters | exit 0 | `2-build.log` |
| Exhaustive axiom traversal | exit 0; 95 declarations, including 61 theorem declarations; axioms contained in `{propext, Classical.choice, Quot.sound}` | `3-axioms.log` |
| Main types and axioms | exit 0 | `4-statements.log` |
| Kernel replay of all four mathematics modules and the root | exit 0 | `5-leanchecker.log` |

The axiom report's rows were checked for duplicate names, agreement with its
reported totals, coverage of each mathematics module, and the allowed axiom set;
see `audit-enumeration.txt`. The root contains imports only. The source hashes
in `sources.sha256` were rechecked successfully after all gates. The pins,
manifest, stage 1 file, gate script and axiom-audit implementation were not changed.
No mathematical source changed after the gate run. `git diff --check` passed.
The Lean checkout occupies 3.8 GB; nothing was deleted.

Lean changes: three new modules, their root imports, statement/axiom listings,
and the README correspondence table. Verification-record changes: this report,
the appended stage 2 design, and the gate evidence. Unrelated job 08 changes in
the verification checkout were left untouched.

No mathematical work requested by job 09 remains. The explicitly excluded
Ext equivalence remains unformalised. Claude's correspondence/readability
review and commit remain pending; no commit, push, or author-certification
claim was made. The next reviewer can start with `4-statements.log`, the
numbered departures, and `StrongNakayama.not_projective_one`.
