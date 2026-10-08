GPT-6 (Codex), effort unknown.

# Job 17: stage 4b

Date: 2026-10-08. Scope: the abstract linear-algebra reduction behind
Proposition 5.4 (`prop:rank-obstruction`), followed by the numerical extinction
bound. The connection to K₀, actual rank functions and selection functors, and
Corollary 5.5 are excluded. No human certification is claimed.

## Checkpoint

Both items are complete, with status AI-proved, and all five gates passed.
Root imports, the statement listing and the README correspondence are updated.
The next action is Claude's review and commit; this job made no commit.
The designated `stage4b` worktree was clean at the start, based on commit
`394efc3`. Existing changes in the
verification repository belong to other jobs and are left untouched.
The worktree's shared `.lake/packages` is read-only for this job.
No dependency, configuration, earlier mathematical statement, or commit was
changed. Evidence: `lean/gates/stage4b-uncommitted/`.

Read: the standing research, Lean, development and writing rules; both project
READMEs and agent instructions; `PROGRESS.md`, `docs/WORKING_RULES.md`,
`codex/tasks/17-lean-stage4b.md`, `lean/DESIGN.md`,
`lean/FEASIBILITY-report.md`, inventory section K and the Proposition 5.4 row;
`report/sections/05-selection.tex` through the Proposition 5.4 proof; the
worktree's audit sources, gate script, and earlier Lean modules.

## Conventions and intended correspondence

Time indices are natural numbers and start at zero. Powers of a linear
endomorphism act by iterated composition; `T^0` is the identity. The dimension
bound is `Module.finrank K V`, without a separate dimension variable.

The report's first identity in `eq:rank-shift`,
`χ_Y(T x) = χ_(HY)(x)`, makes the induced endomorphism on the visible space
well defined. Constructing that endomorphism from K₀ is outside this job;
the abstract theorem receives an actual linear endomorphism as data.
The second identity, `dim H^t Y = χ_Y(T^t [R])`, is represented by equality
between the natural dimension cast to the scalar field and evaluation on
`T^t v`. Zero persists under one successor because `H(0) = 0` and
finite-dimensional vector spaces of dimension zero vanish. These are the
approved numerical premises, not assumed extinction bounds.

## Search and implementation record

The pinned Mathlib revision is `0df444a360eaa60ab8c11dca51a86af692955474`,
with Lean `leanprover/lean4:v4.33.1`. The searches covered finite-dimensional
kernel/range stabilization, Fitting decomposition, cyclic spans and dual maps.
The two imported files have cached `.olean` files; no dependency download or
package build was needed. Only the designated worktree was built.

### Item 1: linear-algebra core

Status: AI-proved; module build and all five gates passed. File:
`FindimCounterexample/Stage4bRankObstruction.lean` (87 lines).
No cyclicity hypothesis is needed.

Under `{K : Type u} [Field K] {V : Type v} [AddCommGroup V] [Module K V]
[FiniteDimensional K V]`, the public statements are:

```lean
theorem apply_pow_eq_zero_of_eventually (T : Module.End K V) (v : V)
    (φ : Module.Dual K V)
    (h : ∃ t₀ : ℕ, ∀ t, t₀ ≤ t → φ ((T ^ t) v) = 0)
    (t : ℕ) (ht : Module.finrank K V ≤ t) : φ ((T ^ t) v) = 0

theorem apply_pow_finrank_eq_zero (T : Module.End K V) (v : V)
    (φ : Module.Dual K V)
    (h : ∃ t₀ : ℕ, ∀ t, t₀ ≤ t → φ ((T ^ t) v) = 0) :
    φ ((T ^ Module.finrank K V) v) = 0
```

All names are under `FindimCounterexample.RankObstruction`. The first statement
gives eventual vanishing from the dimension onwards; the second is exactly its
dimension-time instance, as requested in item 1, with cyclicity removed.

Proof (AI-proved by the compiling Lean term): let C be the span of the orbit,
S the restriction of T to C and ψ the restriction of φ. The span is invariant
under T. Vanishing at every t ≥ t₀ gives ψ ∘ S^t₀ = 0 by linearity, checked on
the orbit generators. Thus ψ belongs to the kernel of the t₀-th power of
S*. Kernel stabilization puts ψ in the kernel of every power of S* of exponent
at least dim C* = dim C. Since dim C ≤ dim V, evaluation at v yields the
claimed result for every t ≥ dim V. This also covers dimension zero.

Pinned Mathlib searches used `ker_pow`, `dualMap`, `dual_finrank_eq`,
`pow_restrict`, `eqOn_span`, and orbit/cyclic-span alternatives. Reuse:

| Declaration | Pinned source and reading | Use |
|---|---|---|
| `Module.End.ker_pow_le_ker_pow_finrank` | `LinearAlgebra/FiniteDimensional/Lemmas.lean:436`: `ker (f ^ m) ≤ ker (f ^ finrank K V)` for every m | Move ψ from an arbitrary power kernel to the stabilized kernel. |
| `Module.End.ker_pow_eq_ker_pow_finrank_of_le` | Same file, line 424: `finrank K V ≤ m → ker (f ^ m) = ker (f ^ finrank K V)` | Recover vanishing at any later time. |
| `Subspace.dual_finrank_eq` | `LinearAlgebra/Dual/Lemmas.lean:512`: `finrank K (Module.Dual K V) = finrank K V` | The stabilization exponent is bounded by the original dimension. |
| `Module.End.pow_restrict` | `Algebra/Module/Submodule/LinearMap.lean:302`: powers of a restriction equal restrictions of powers | Translate from C to V. |
| `LinearMap.eqOn_span` | `LinearAlgebra/Span/Basic.lean:835`: equality on generators extends to their span | Convert scalar tail vanishing to a zero functional. |
| `Submodule.span_le`, `Submodule.subset_span`, `Submodule.finrank_le` | Standard span and subspace APIs, used in the compiled term | Construct the invariant orbit span and bound its dimension. |

No direct dual-power evaluation theorem was found in the inspected dual-map
sources; a private induction proves `(T.dualMap ^ n) φ x = φ ((T ^ n) x)`.
Fitting decomposition was considered, but the available kernel-stabilization
API supplies a shorter proof without extra infrastructure. No other library
was needed. Initial builds exposed only an elaboration problem in the orbit
invariance step; rewriting the power directly resolved it. No mathematical
statement was weakened.

### Item 2: extinction

Status: AI-proved; module build and all five gates passed. File:
`FindimCounterexample/Stage4bExtinction.lean` (53 lines). The statement is:

```lean
variable {V : Type v} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]
variable {ι : Type w}

theorem extinction_bound (T : Module.End ℚ V) (v : V)
    (φ : ι → Module.Dual ℚ V) (d : ι → ℕ → ℕ)
    (heval : ∀ Y t, (d Y t : ℚ) = φ Y ((T ^ t) v))
    (hstep : ∀ Y t, d Y t = 0 → d Y (t + 1) = 0)
    (Y : ι) (hY : ∃ t₀ : ℕ, d Y t₀ = 0)
    (t : ℕ) (ht : Module.finrank ℚ V ≤ t) : d Y t = 0
```

Its informal reading is item 2 verbatim, with the dimension cast made explicit.
Natural-number induction (`Nat.le_induction`) turns the first zero into a zero
tail. The evaluation identity transfers this tail to the functional. Item 1
then applies, and injectivity of the natural-number cast into ℚ recovers a
zero natural dimension. No extra mathematical infrastructure is needed.

## Hypotheses and implementation design

This section supplements `lean/DESIGN.md` for this isolated job. All hypotheses
are the approved abstract data; no hypothesis structure, assumed conclusion,
or conditional foundation was introduced. The Lean theorem is unconditional
as abstract linear algebra; its application to the selection functor remains
the approved reduction.

| Formal data or hypothesis | Informal reading and source |
|---|---|
| `Field K`, additive group and `Module K V` | A vector space; the core allows every field, including ℚ. |
| `FiniteDimensional K V` | The visible space in Proposition 5.4 has finite dimension r. |
| `T : Module.End K V` | The induced endomorphism on the visible space. The first rank-shift identity supplies its descent in the report; stage 4b takes the resulting map as data. |
| `v : V` | The image of `[R]`; no non-zero or cyclicity assumption is used. |
| `φ : Module.Dual K V` or the family `φ Y` | Evaluation at Y is linear on the visible space of functions. |
| Core `h` | Evaluation is zero at all sufficiently large times; in the application this follows from finite extinction, zero persistence and the second rank-shift identity. |
| `d : ι → ℕ → ℕ` | The dimensions of the iterates of Y; neither finiteness nor non-emptiness of ι is assumed. |
| Numerical `heval` | Exactly the second rank-shift identity after casting dimensions to ℚ. |
| Numerical `hstep` | A zero dimension remains zero after one more application of H. This uses dimension-zero detection and H(0) = 0, rather than either rank-shift identity alone. |
| `hY` | Y has some finite extinction time. |
| `ht` | The time in the conclusion is at least r, represented directly by `Module.finrank`. |

Departures, matching the worktree README:

- 4b.1. The K₀/rank-function realization, construction of the visible space,
  descent of T and Corollary 5.5 are excluded. They are not counted as coverage.
- 4b.2. The core works over every field, drops cyclic spanning, and gives every
  time at least the dimension, including dimension zero.
- 4b.3. The proof uses stabilization of dual kernels on the orbit span in place
  of the report's Fitting decomposition. No splitting or nilpotence is assumed.
- 4b.4. The numerical theorem uses ℚ, an explicit natural-number cast and an
  explicit zero-successor premise. No separating-family premise is needed.
- 4b.5. The bound is quantified over all t ≥ r, with finite extinction expressed
  by existence of a zero. No separate least-time or infinity definition is made.

## Correspondence review and boundary checks

A separate same-model agent searched Mathlib without writing or building;
the source signatures were then read and the proposed proof compiled. Another
same-model agent examined the informal claim and subsequently both source
files for correspondence, quantifiers, boundary cases and readability. No
blocking finding was returned. These are not independent-model reviews or
human certification.

The following hand checks have status AI-proved and were checked against the
definitions. The general formal statements include r = 0, v = 0, φ = 0,
t₀ = 0 and an empty index type. In dimension zero, the vector space and every
functional evaluation are zero. If t₀ = 0, the premise already covers every
time. The other zero cases follow from linearity, and the empty-family case
has no Y to instantiate.

Zero persistence cannot simply be removed: on ℚ² let T swap the two
coordinates, take v = (1,0) and φ(x,y) = x. Then the represented natural
sequence is 1,0,1,0,…; it has a zero at time 1 but is non-zero at r = 2.
The numerical theorem is not asserted over fields of arbitrary characteristic:
over the field with two elements, take V one-dimensional and φ = 0, with
d(0) = d(1) = 2 and d(t) = 0 for t ≥ 2. Cast evaluation and zero persistence
hold, but the claimed dimension-one bound would fail. Rational casts avoid
this loss of dimension-zero detection. These illustrative hand checks are
not additional Lean declarations.

## Acceptance and remaining work

There are 140 new mathematical Lean source lines in two files, below the
400–1,200-line heuristic estimate because the pinned kernel-stabilization
infrastructure supplies the main step. Both files are below 1,500 lines.
Individual builds passed (core: 24 seconds in the successful run; numerical
corollary: 17 seconds). The worktree occupied 5.4 MB after those builds.
Root imports and all three main declarations in `Audit/Statements.lean` are
in place.

Gate command, run in the designated worktree:

```sh
tools/gates.sh lean/gates/stage4b-uncommitted
```

| Gate | Result | Evidence in `lean/gates/stage4b-uncommitted/` |
|---|---|---|
| Forbidden constructs, line limits, root imports | PASS, exit 0 | `1-source-scan.log` |
| Full build with warnings as errors | PASS, exit 0 | `2-build.log` |
| Exhaustive transitive axiom audit | PASS, exit 0 | `3-axioms.log` |
| Main statements and their axioms | PASS, exit 0 | `4-statements.log` |
| Kernel replay | PASS, exit 0 | `5-leanchecker.log` |

The axiom log enumerates 150 project declarations, including 105 theorem
declarations; independent line counts match its trailer. Stage 4b contributes
exactly four declarations: three public theorems and the private dual-power
lemma. The public theorems each use only `propext`, `Classical.choice` and
`Quot.sound`; the private lemma uses `propext` and `Quot.sound`.
The statement listing was read back and matches the three signatures above.

The base commit is `394efc357e0cbe75b8e66a5353d2aef4302893b3`.
`sources.sha256` records all 17 configuration and Lean source files;
`source-hash-check.log` confirms every hash matches the audited worktree.
No Lean source was changed during the gate run. `git diff --check` passed;
the diff of the pinned configuration, audit infrastructure, gate script and
all earlier mathematics is empty. The worktree occupied 142 MB after the full
build and audit-executable build, below the 5 GB limit. No cleanup was needed.

Kernel replay lists all eleven mathematical modules and the root library,
including both stage 4b modules. `summary.txt` records exit 0 for every gate,
and the gate script itself returned exit 0. The final documentation update
changed only this report and the README, not the audited Lean sources.

Final line counts: 87 + 53 = 140 new mathematical source lines, plus two root
imports and eight statement-audit lines (150 new Lean lines altogether).
No infrastructure gap or mathematical gap remains in either approved item.
The unformalised work is precisely the stated scope exclusion: constructing
K₀, the actual rank functions and visible space, proving the descent and
dimension identities for a selection functor, and Corollary 5.5. No manuscript
statement, `paper.pdf`, `build/`, public conversation log, main Lean checkout
or sibling worktree was modified. The shared dependency directory was used
only through the designated worktree's cached imports.
