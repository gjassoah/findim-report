Model: GPT-6 (Codex); effort: unknown.

# Job 15: Section 6 abstract lemmas, stage 3c

Date: 2026-10-08. Status: all three items are AI-proved, unconditional down to
Mathlib, and integrated in the stage3c worktree. All five acceptance gates pass.
The work is uncommitted and awaits Claude's review; this is not author certification.
Worktree (absolute path):
`findim-worktrees/stage3c`.
Base: `394efc3`. The pinned Mathlib revision is
`0df444a360eaa60ab8c11dca51a86af692955474`, Lean 4.33.1.

## Scope and constraints

Implement Lemma 6.1 (both finite-family statements, including empty families),
Lemma 6.6 in Mathlib's Karoubi category without a triangulation on that category,
and the actual objects and isomorphisms of Proposition 6.7. The K₀ clause is
excluded by the author. All proofs are unconditional down to Mathlib.
The original manuscript, earlier-stage statements, toolchain, manifest, and
shared package tree remain unchanged. No commit or push is authorised.

The root agent handles the odd-double construction, integration, correspondence
and gates; same-model subagents handle fractions and Karoubi cone splitting.
Their output is checked through the acceptance gates; this is not an independent
model review or author certification.

## Search and implementation checkpoint

Read the task, worktree rules, audit implementation, source style, design,
feasibility report and Section 6 inventory; read the two manuscript subsections.
Pinned sources supply localisation right fractions, Karoubi complements and
their biproduct decomposition, and exactness for distinguished triangles.
The shift and retract-Hom exactness bridge has been implemented and directly checked.

| Item | State | Evidence |
|---|---|---|
| Lemma 6.1 | AI-proved; all five gates pass | `audit/15-stage3c-fractions.md` |
| Lemma 6.6 | AI-proved; all five gates pass | `audit/15-stage3c-karoubi.md` |
| Proposition 6.7, objects and isomorphisms | AI-proved; all five gates pass | `FindimCounterexample/Stage3cOddDouble.lean` in the worktree |

## Departures

- **3c.1.** The K₀ clause of Proposition 6.7 and subsequent class assertions
  are omitted, as explicitly required by job 15. This is excluded coverage.
- **3c.2.** Lemma 6.1 is generalised to arbitrary categories with a localisation
  `L : C ⥤ D`, `[L.IsLocalization W]` and `[W.HasRightCalculusOfFractions]`.
  The annihilation statement uses preadditive categories and `[L.Additive]`,
  consequences of the report's linearity assumptions. No triangulation,
  essential smallness or biproduct assumptions are needed. Its proof uses
  successive equalisation rather than a map into a finite biproduct.
- **3c.3.** Cone splitting and odd doubles use only `Pretriangulated C`;
  the octahedral axiom, essential smallness and field linearity are not needed.
  Karoubi shifts are explicit extended functors rather than a new `HasShift`
  instance. Their object/morphism formulas, additivity, embedding comparison
  and iterated-shift comparisons are derived, with no assumption of a
  triangulation on Karoubi.
- **3c.4.** The cone-splitting proof constructs inverse maps from Hom exactness
  instead of finishing with Yoneda detection. The odd doubles follow the
  report's two cones, with classical choices. An arbitrary `U : Karoubi C`
  packages precisely the report's object, idempotent and idempotency equation.

## Item 1 completed: finite families of fractions

`FindimCounterexample/Stage3cFractions.lean`: 112 lines. The supporting record
`audit/15-stage3c-fractions.md` gives every declaration, exact statement,
informal reading, pinned source locator, and the compilation command.

The two principal declarations are:

```lean
exists_common_denominator {ι : Type w} [Finite ι]
    {X : C} {Y : ι → C} (γ : ∀ i, L.obj X ⟶ L.obj (Y i)) :
    ∃ (X' : C) (u : X' ⟶ X) (hu : W u) (f : ∀ i, X' ⟶ Y i),
      ∀ i, γ i = (Localization.isoOfHom L W u hu).inv ≫ L.map (f i)

exists_annihilating_denominator {ι : Type w} [Finite ι]
    {X : C} {Y : ι → C} (g : ∀ i, X ⟶ Y i)
    (h : ∀ i, L.map (g i) = 0) :
    ∃ (X' : C) (u : X' ⟶ X), W u ∧ ∀ i, u ≫ g i = 0
```

Both live under `FindimCounterexample.Stage3cFractions`. The first provides
one denominator and all numerators; the second kills every map after the
same precomposition. The finite-set induction base cases take `𝟙 X`, so the
empty family is included. The equalisation helpers need no additive structure.
Search/reuse: `Localization.exists_rightFraction`,
`LeftFraction.exists_rightFraction`, `RightFraction.map_s_comp_map`,
`MorphismProperty.map_eq_iff_precomp`, and `MorphismProperty.comp_mem`, all
from the pinned `Localization/CalculusOfFractions.lean`.

Direct compilation with `autoImplicit=false`, `warningAsError=true` and
`weak.linter.mathlibStandardSet=true` exited 0. Root integration and all five
gates now pass. No gap remains in this item's implementation.

## Item 2 completed: cone splitting

`Stage3cKaroubi.lean` constructs the shifts with Mathlib's
`functorExtension₂`, shows their object and morphism formulas, proves
additivity, compares shifting embedded objects with embedding shifted objects,
and supplies the comparison for two successive shifts. Its `lift_exact` cuts
a lift in the original category by the source idempotent; the three
`coyoneda_exact` lemmas then derive precisely the Hom exactness needed from
Mathlib's distinguished-triangle exactness results.

The main declaration, in `FindimCounterexample.Stage3cConeSplitting`, is

```lean
coneSplittingIso (T : Triangle C) (hT : T ∈ distTriang C)
    {I A B : Karoubi C}
    (e1 : (toKaroubi C).obj T.obj₁ ≅ I ⊞ A)
    (e2 : (toKaroubi C).obj T.obj₂ ≅ I ⊞ B)
    (hf : e1.inv ≫ (toKaroubi C).map T.mor₁ ≫ e2.hom =
      biprod.fst ≫ biprod.inl) :
    (toKaroubi C).obj T.obj₃ ≅ B ⊞ (shift 1).obj A
```

The context is a preadditive category with a zero object and additive integer
shifts, satisfying Mathlib's `Pretriangulated` class. The matrix equation is
the identity on `I` and zero in the other three components. The conclusion is
the target complement plus the shifted source complement, as in Lemma 6.6.
No triangulation on Karoubi and no Hom-exactness premise is imposed.
The generic splitting helpers construct inverse maps using the section of
the final map and the complementary retraction.

Both modules passed direct Lean compilation with warnings as errors and
standard linters. Detailed statements, helper correspondence and search
locators are recorded in `audit/15-stage3c-karoubi.md`.
Root integration and all five gates now pass.

## Item 3 completed: odd doubles

The resumed job found the worktree's `Stage3cOddDouble.lean` failing at its
line-54 rewrite. After replacing the idempotent factorisation, a subexpression
retained `U.complement.X` as its underlying object. This is definitionally equal
to `U.X`, but the rewrite tactic's transparency setting did not unfold it.
An explicit `change` restores the expression with consistently typed endpoints;
ordinary associativity and the isomorphism inverse identities then finish it.
No tactic limit or transparency option was changed. Moving the zero-object
and shift assumptions below the complement lemma removes the unused-section
variable warnings. The shifted-decomposition helper uses finite biproducts
instead of the stronger pretriangulated assumption; the main conclusions and
their hypotheses are unchanged.

The complete repaired module is integrated as
`FindimCounterexample/Stage3cOddDouble.lean` (105 lines). It is byte-for-byte
equal to the tested candidate
`computations/15-stage3c-resume/Stage3cOddDouble.lean`.
`odd-double.patch` beside that candidate was applied after the author restored
worktree write access. The saved `check.py` runs Lean directly with the pinned worktree's read-only
imports and the project's three checking flags; `check.log` records exit 0.
That earlier candidate validation is retained as a historical checkpoint.
The separate candidate statement listing, copied from the worktree's audit
entries, also exits 0 (`statements.log`). All six odd-double declarations
report exactly `[propext, Classical.choice, Quot.sound]`. The final integrated
whole-project axiom gate and kernel replay also pass, as recorded below.
Integrated source and candidate SHA-256:
`052bb4572eb670ab521eb1a909375c964f3b218ab09b366349b38d1b2f9a059d`.
Patch SHA-256:
`6063b64498379aabf2bc5844917f9b53cec3ef61712ad380b1ebcdfbced28b47`.

All declarations below are under `FindimCounterexample.Stage3cOddDouble`.
The common main context is `Category C`, `Preadditive C`, `HasZeroObject C`,
`HasShift C ℤ`, additivity of every integer shift, and `Pretriangulated C`.

| Declaration | Formal output and informal reading |
|---|---|
| `complementDecomposition U` | `K.obj U.X ≅ U.complement ⊞ U`, where `K = toKaroubi C`; place the complement first. Only preadditivity and finite biproducts are used. |
| `complement_matrix U` | `e.inv ≫ K.map (𝟙 U.X - U.p) ≫ e.hom = biprod.fst ≫ biprod.inl`, with `e = complementDecomposition U`; the first cone map has the required identity/zero block form. |
| `firstDouble U` | `Σ X : C, K.obj X ≅ U ⊞ (shift 1).obj U`; choose the cone of `1 - U.p` in the original category and its actual splitting isomorphism. |
| `shiftedDecomposition U e` | `K.obj (X⟦1⟧) ≅ (shift 1).obj U ⊞ (shift 2).obj U`, given `e : K.obj X ≅ U ⊞ (shift 1).obj U`; derive biproduct preservation from additivity and use `shiftAddIso 1 1`. This helper needs finite biproducts rather than pretriangulation. |
| `thirdDouble U` | `Σ V : C, K.obj V ≅ U ⊞ (shift 3).obj U`; construct the map `X[1] → X` using fullness, choose its cone in the original category, and apply cone splitting followed by `shiftAddIso 2 1`. |
| `exists_odd_doubles U` | `∃ X V : C, Nonempty (K.obj X ≅ U ⊞ (shift 1).obj U) ∧ Nonempty (K.obj V ≅ U ⊞ (shift 3).obj U)`; extract the two constructed dependent pairs. |

Mathlib searches and reuse: `Karoubi.complement`, `Karoubi.decomposition`,
`Karoubi.decomp_p`, `biprod.braiding`, its alternative coproduct formula
`biprod.braiding'`, `biprod.lift_snd`, and `biprod.inr_desc`; the existing
`toKaroubi` full instance and `Functor.preimage`; `distinguished_cocone_triangle`
from `Triangulated/Pretriangulated.lean`; `Functor.mapBiprod` and
`preservesBinaryBiproducts_of_preservesBiproducts`. The latter is a theorem,
so the proof installs its derived result locally after using additivity to
obtain finite-biproduct preservation. No extra preservation premise is assumed.

The second map is explicitly the preimage of
`e₁.hom ≫ biprod.fst ≫ biprod.inl ≫ e₂.inv`, where `e₁` is the shifted
first decomposition and `e₂` is the first decomposition with its summands
swapped. Thus it identifies the two copies of `U[1]`, as in the report.
Both cone objects are constructed in `C`; neither their existence nor either
isomorphism is a premise. The K₀ clause remains excluded (departure 3c.1).

The same-model source review in `audit/15-stage3c-correspondence.md` found no
correspondence defect. It is not independent model review or human certification.

Final mathematical source counts: fractions 112, Karoubi 145, cone splitting
198, odd doubles 105; total 560. Every file is below 1500 lines and
the stage is below the 5000-line stopping bound.

## Gates and final handoff

### Local dependency preparation

The shared cache contained the localisation and pretriangulated modules, but
not `Idempotents.Basic`, `Karoubi`, `Biproducts`, or `FunctorExtension`.
Their sources were present. Lake supports an ignored local
`.lake/package-overrides.json`; this redirects only Mathlib to an independent
copy under `.lake/private-packages/mathlib`. The original `.lake/packages`
symlink and its contents were not changed. `lean-toolchain`, `lakefile.toml`
and `lake-manifest.json` remain unchanged. The private copy uses the exact
pinned sources and cached artifacts; only its four missing modules were built.

The command `lake build Mathlib.CategoryTheory.Idempotents.Biproducts
Mathlib.CategoryTheory.Idempotents.FunctorExtension`, run in the worktree,
exited 0. The worktree occupied 3.3 GB after preparation. This local override
also applies to the unmodified gate script. No dependency update, clean,
download or shared-package write was needed. The earlier question about
replacing the package symlink became unnecessary and that action was not taken.

### Resume repair and integration

The first resume temporarily lacked write access to the worktree, so the
repair and its direct validation were saved in this verification repository.
The author restored the writable root. The saved patch was then applied to
the worktree with `patch --batch --forward -p1`, and `cmp` confirmed equality
with the tested candidate. This resolved the line-54 rewrite failure.

The root imports all four new modules. `Audit/Statements.lean` has 30 new
stage3c declaration checks and their axiom listings (66 added lines), including
the shift comparisons and additivity, Hom exactness, cone splitting, and all
six odd-double declarations. The README records their correspondence,
departures 3c.1–3c.4, provenance and final gate status. Earlier-stage Lean
statements and all three pinned configuration files are unchanged.

### Final acceptance run

The unchanged `tools/gates.sh` was run in the stage3c worktree with the absolute
evidence directory ending in `lean/gates/stage3c-uncommitted`. The script exited
0. Its recorded base commit is
`394efc357e0cbe75b8e66a5353d2aef4302893b3`; this is an uncommitted source snapshot,
identified by `sources.sha256`, not a claim that the new stage is in that commit.

| Gate | Exit | Evidence and result |
|---|---:|---|
| Source scan | 0 | `1-source-scan.log`: no forbidden constructs, overlong source files or unimported mathematical modules |
| Full build | 0 | `2-build.log`: build completed successfully, 1896 jobs; project warnings are errors and standard Mathlib linters are enabled |
| Exhaustive transitive axiom audit | 0 | `3-axioms.log`: 192 declarations, including 139 theorems, in the 13 mathematical modules plus the root; every axiom is in `{propext, Classical.choice, Quot.sound}` |
| Statement listing | 0 | `4-statements.log`: all main declaration types and axioms, including the 30 stage3c entries |
| Kernel replay | 0 | `5-leanchecker.log`: `LEAN_NUM_THREADS=1 leanchecker --verbose FindimCounterexample` replayed all 14 project modules, including all four new modules |

All logs, per-gate exit codes (`summary.txt`), the base commit and source hashes
are saved in [the evidence directory](../lean/gates/stage3c-uncommitted/).
The hashes cover all mathematical sources, both audit sources, the root imports
and the pinned configuration files; all 19 were rechecked against the final
worktree and match. The final same-model correspondence review
in [15-stage3c-correspondence.md](15-stage3c-correspondence.md) also records the
four integrated source hashes. No Lean source was changed after the gate run.

The stage adds 560 mathematical lines, four root-import lines and 66 audit
lines: 630 Lean lines in total. The largest new mathematical file has 198
lines. The generalisations and proof-route changes are recorded as departures
3c.1–3c.4. No additional interface hypotheses, resource-limit overrides or
custom axioms were introduced.
The local `.lake` directory occupies 3.5 GB after the final build, below the
5 GB workspace allowance. The private dependency copy retains the pinned
Mathlib sources; the shared package symlink remains untouched.

### Remaining gaps and review boundary

No in-scope mathematical or infrastructure gap remains. The K₀ clause of
Proposition 6.7 is excluded coverage, as required by the task; no assertion
about it is claimed here. The status is AI-proved with passing Lean acceptance
gates. Implementation and correspondence review used the same model and are
not independent model review or author certification. Claude's review, merge
and commit remain pending; no commit or push was made by this job.
