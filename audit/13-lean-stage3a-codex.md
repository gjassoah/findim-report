Model: GPT-6 (Codex); effort: unknown.

# Job 13: Lean stage 3a

2026-10-08. Genre: technical formalisation report. **Stage 3a complete within
the approved scope; all five acceptance gates pass.** Status: **AI-proved**,
not author-certified. This report was written
incrementally. The task authorises both this verification repository and the
separate Lean repository; no commit is authorised or planned.

## Starting state and scope

Lean repository base: `da70cac66d91c4284b9dc8ee803ae62563982353` (clean at
start). Lean `4.33.1`; Mathlib
`0df444a360eaa60ab8c11dca51a86af692955474`. The pinned configuration and
the statements of stages 1–2 will remain unchanged. The existing stage-2
objects are `StrongNakayama.cok P d n`, with `C₀ = P₀*` and
`Cₙ₊₁ = Pₙ₊₁*/range(dₙ*)`.

The verification repository has concurrent work in `codex/QUEUE.md` and
`audit/P-prose-codex.md`; those files are outside this job's edits.

Implementation is split into the categorical Ext comparison, the bridge from
indexed module families to Mathlib projective resolutions, the transpose and
syzygy identifications, and the final application to stage 2. Subagents use
the inherited model; same-model review is not an independent review.

## Mathlib searches and reuse decisions

Status of source findings: **supported** by the pinned local sources.

- `Mathlib/CategoryTheory/Abelian/Projective/Ext.lean` contains
  `ProjectiveResolution.extAddEquivCohomologyClass`, an additive equivalence
  between derived-category `Abelian.Ext` and the Hom-complex cohomology of
  a projective resolution. In particular, `extMk_eq_zero_iff` (lines
  199–213) identifies positive-degree zero classes with factorisations
  through the preceding differential, and `extMk_surjective` (214–222)
  represents every Ext class by a cocycle. These are the chosen comparison
  results; rebuilding derived-functor foundations is unnecessary.
- The same file's positive-degree test requires a predecessor degree.
  Degree zero will be handled through Mathlib's Hom/Ext-zero equivalence
  and the cokernel property of the resolution augmentation.
- `Mathlib/Algebra/Category/ModuleCat/Ext/HasExt.lean` provides `HasExt`
  over an arbitrary ring, with universe smallness. The commutative-ring
  assumptions of `ModuleCat/Ext/Basic.lean` are unnecessary here.
- The family bridge will use Mathlib's `ChainComplex.of` and its standard
  `ProjectiveResolution`, rather than introducing a hypothesis interface.
  The final public statements will retain explicit families and exactness
  equalities, matching stage 2.

## Implementation checkpoints

The needed Ext and resolution source modules exist in the pinned checkout.
Their compiled files were not initially decompressed; a narrow cache request
decompressed 21 already-cached files without a network download. The Lean
repository remains 3.8 GiB.

The categorical comparison (`ResolutionExt.lean`, 86 lines), family bridge
(`ModuleResolution.lean`, 105 lines) and transpose identifications
(`Transpose.lean`, 78 lines) have each passed an individual Lean check with
warnings as errors. At that checkpoint the full acceptance gates and the
final module-level application were pending; both are now complete. The full iff is
available, so the task's permitted one-direction departure is unnecessary.

Additional reuse: degree zero uses `Abelian.Ext.mk₀_bijective`,
`mk₀_eq_zero_iff` and `ProjectiveResolution.isColimitCokernelCofork`.
The family bridge uses `ChainComplex.of`, `toSingle₀Equiv`,
`quasiIsoAt₀_iff`, `ShortComplex.quasiIso_iff_of_zeros'` and
`ShortComplex.moduleCat_exact_iff_range_eq_ker`. The transpose step reuses
`Submodule.quotEquivOfEq`, `LinearMap.quotKerEquivRange` and
`quotKerEquivOfSurjective`. Searches in `Algebra/Homology` and `RingTheory`
found no relevant module-theoretic transpose or syzygy definition; local
definitions record exactly the chosen presentation and resolution.

## Formal statements and their readings

Status: **AI-proved**, with all five gates passed as recorded below.
In this section, `Ext` means Mathlib's
`CategoryTheory.Abelian.Ext`, not a locally defined replacement. Its vanishing
is expressed by `Subsingleton`: since every Ext group has zero, this is
equivalent to every class being zero. The statements file prints the full
types and transitive axioms of the main declarations.

### Ext comparison

For an abelian category with `HasExt`, a standard projective resolution `R`
of `X`, and any object `Y`, `ResolutionExt` supplies:

| Declaration | Informal reading |
|---|---|
| `ext_zero_iff_injective` | `Ext⁰(X,Y)=0` iff precomposition with `d₀:P₁→P₀` is injective on `Hom(P₀,Y)`. |
| `ext_succ_iff_cocycles_boundaries n` | `Extⁿ⁺¹(X,Y)=0` iff each `f:Pₙ₊₁→Y` annihilating `dₙ₊₁` factors as `g ∘ dₙ` for some `g:Pₙ→Y`. |
| `ext_vanishing_iff` | The conjunction of the preceding conditions for every nonnegative degree is equivalent to all Ext groups vanishing. |

For an arbitrary ring `R`, the public module-family statement is
`ModuleResolution.ext_vanishing_iff`. Its inputs are:

```lean
P : ℕ → ModuleCat.{v} R
d : ∀ n, P (n + 1) →ₗ[R] P n
[Small.{v} R]
[∀ n, Module.Projective R (P n)]
h : ∀ n, LinearMap.range (d (n + 1)) = LinearMap.ker (d n)
E : ModuleCat.{v} R
ε : P 0 →ₗ[R] E
h₀ : LinearMap.range (d 0) = LinearMap.ker ε
hε : Function.Surjective ε
N : ModuleCat.{v} R
```

Its conclusion is exactly

```lean
(∀ n : ℕ, Subsingleton (Ext E N n)) ↔
  Function.Injective (homDifferential P d N 0) ∧
    ∀ n, (homDifferential P d N n).range =
      (homDifferential P d N (n + 1)).ker
```

`homDifferential` is the additive map `f ↦ f.comp (d n)`. Thus the Hom
complex is exact at its first term and in every subsequent degree. No
commutative-ring linear structure on Hom is assumed.

The bridge uses ordinary resolution data, not a conditional interface.
Its supporting declarations in `ModuleResolution` are:

| Declaration | Informal reading |
|---|---|
| `differential_comp` | Consecutive differentials compose to zero, by range–kernel exactness. |
| `complex` | Constructs the chain complex of the given module family. |
| `complex_X`, `complex_d_succ` | Its terms and consecutive differentials are the supplied ones. |
| `complex_exactAt_succ` | The resulting complex is exact in every positive degree. |
| `augmentation_comp` | Exactness at `P₀` gives `ε ∘ d₀ = 0`. |
| `augmentation`, `augmentation_f_zero` | The map to the complex concentrated in degree zero is the given augmentation. |
| `augmentation_quasiIso` | Exactness and surjectivity make that map a quasi-isomorphism. |
| `projectiveResolution` | Packages this chain complex, its projectivity, and augmentation as Mathlib's resolution. |

### Strong-Nakayama theorem

All declarations below are in `StrongNakayama`. The inputs are the same
resolution hypotheses over `Aᵐᵒᵖ`, and target `ModuleCat.of Aᵐᵒᵖ A`,
the regular right module. The ring, resolution modules and `E` are placed
in a common universe.

| Declaration | Informal reading |
|---|---|
| `homRightDualEquiv` | Categorical Hom into the regular right module is additively isomorphic to `RingDual.RightDual A (P n)`. The latter is definitionally the linear-map Hom used in the module comparison. |
| `homDifferential_eq_dualDifferential` | The Hom differential is definitionally the underlying additive map of stage 2's `dualDifferential`. |
| `ext_vanishing_iff_dual_exact` | All `Extⁱ(E,A)` vanish iff the exact dual-complex hypotheses of stage 2 hold, with its left-linear range and kernel. |
| `projectiveDimension_eq_of_ext n hn` | If every `P n` is finitely generated, `E` is nonzero and all `Extⁱ(E,A)` vanish, then `Cₙ` is finitely generated, has projective dimension at most `n` and not less than `n`, for `hn : 1 ≤ n`. |
| `unbounded_of_ext` | Under those hypotheses, for every `n ≥ 1` there exists a finitely generated left module with those exact dimension bounds. |

The exact-dimension conclusion is

```lean
Module.Finite A (cok P d n) ∧
  HasProjectiveDimensionLE (cok P d n) n ∧
  ¬ HasProjectiveDimensionLT (cok P d n) n
```

The proof invokes the unchanged stage-2 theorem, deriving both its dual
exactness assumptions and its augmentation relation from the new hypotheses.
The finite-generation instance is also the unchanged stage-2 instance.

### Transpose and syzygies

All declarations below are in `Transpose`.

| Declaration | Informal reading |
|---|---|
| `presentedModule f` | The right module `Q₀/range f` presented by `f:Q₁→Q₀`. |
| `ofPresentation f` | The left module `Q₁*/range f*`, the transpose associated with that presentation. |
| `cok_eq_transpose n` | `StrongNakayama.cok P d (n+1) = ofPresentation (d n)`. This is a definitional equality of the actual quotient modules. |
| `syzygy P d E ε n` | The chosen resolution's syzygies: `Ω⁰=E`, `Ω¹=ker ε`, `Ωⁿ⁺²=ker dₙ`. |
| `presentationCokernelEquivSyzygy n` | Surjectivity and original exactness give a right-linear equivalence `coker dₙ ≃ ΩⁿE`. |
| `presentationCokernelIsoSyzygy n` | The same equivalence as an isomorphism in the module category. |

Taking `n+1` as the positive degree gives precisely the requested
`Cₙ = Tr(Pₙ→Pₙ₋₁)`, with `coker(Pₙ→Pₙ₋₁) ≅ Ωⁿ⁻¹E`. These quotient
identifications require no additional projectivity, finiteness or Ext
assumptions. For their use as projective presentations, those hypotheses
come from the resolution in the main theorem.

## Departures and scope

The README retains departures 1–4, clarifies the gap that stage 3a closes,
and adds 5–7:

1. Projective dimension remains expressed by an upper bound and negated
   strict lower bound; the initial stage works in an arbitrary abelian category.
2. The original stage-2 statements still take dual exactness directly. The new
   statements give both directions of its equivalence with Ext vanishing.
3. The ring is arbitrary, including noncommutative rings. No field or
   finite-dimensional-algebra assumption is needed.
4. Stage 2 retains the weaker explicit-family hypotheses its proof uses.
5. Stage 3a takes the full projective-resolution exactness hypotheses and
   packages them as a `ProjectiveResolution` internally. The public module
   theorems use the original family representation.
6. The transpose and syzygies are relative to the given presentation and
   resolution. The report's minimality convention and projective covers are
   not formalised. No presentation-independent isomorphism is asserted.
7. `[Small.{v} R]` supplies Mathlib's Ext instance for the general comparison.
   The main application places `A`, `P` and `E` in one universe so its target
   `A` belongs to the same module category. The previous stage-2 universe
   generality is unchanged. These are size conventions, not additional
   algebraic hypotheses.

As in stages 1–2, no numeric definition of little finitistic dimension and
no specific algebra are introduced. The existential conclusion is precisely
the form requested in the job. Nothing about later stages or other results
of the report is formalised here. No manuscript statement is edited.

## Verification

The complete integrated modules compile with the repository's warnings-as-errors
configuration. A same-model subagent reviewed the new theorem statements for
handedness, indices, extra assumptions and the Hom/dual identification, finding
no discrepancy beyond the recorded universe/minimality conventions. This is
not an independent model review or author certification.

The exact requested command was run from the Lean repository:

```sh
tools/gates.sh lean/gates/stage3a-uncommitted
```

| Gate | Result | Evidence under `lean/gates/stage3a-uncommitted/` |
|---|---|---|
| 1. Forbidden-source scan, line limits and root imports | exit 0 | `1-source-scan.log` |
| 2. Full build, warnings as errors and standard linters | exit 0 | `2-build.log` |
| 3. Exhaustive transitive axiom audit | exit 0; 146 project declarations, including 101 theorem declarations; all axioms within `{propext, Classical.choice, Quot.sound}` | `3-axioms.log` |
| 4. Main statement and axiom listing | exit 0 | `4-statements.log` |
| 5. Kernel replay | exit 0; all nine mathematical modules and the root replayed | `5-leanchecker.log` |

The gate script exited 0. `summary.txt`, `commit.txt` and `sources.sha256`
record exit codes, base commit and source hashes. A post-gate
`sha256sum -c` passed for every recorded source. Only prose records were
edited after the gate run. `git diff --check` passed. The pinned files and
all four stage-1/2 source files are byte-for-byte unchanged from the base
commit; no commits or pushes were made. The Lean repository remains 3.8 GiB.

New Lean source totals:

| File | Lines |
|---|---:|
| `FindimCounterexample/ResolutionExt.lean` | 86 |
| `FindimCounterexample/ModuleResolution.lean` | 105 |
| `FindimCounterexample/ModuleResolutionExt.lean` | 83 |
| `FindimCounterexample/StrongNakayamaExt.lean` | 84 |
| `FindimCounterexample/Transpose.lean` | 78 |
| Total | 436 |

The Ext comparison and bridge use 274 lines, so the approximately 1500-line
stopping rule was not triggered. All new files are imported by the root.
`Audit/Statements.lean`, the README correspondence/departures and
`lean/DESIGN.md` are updated.

## Remaining gaps and next action

No mathematical gap remains in items 1–4 within the requested scope. Both
directions of item 1 are formalised. The minimality/choice and universe
departures are explicit above; numerical finitistic dimension and specific
algebras remain outside this job. Same-model reviews and kernel checks do
not supply author certification.

The work is uncommitted. The next action is Claude's review of the statements,
correspondence and evidence, followed by the commit specified by Gustavo.
No implementation or gate rerun is needed unless the Lean sources change.
