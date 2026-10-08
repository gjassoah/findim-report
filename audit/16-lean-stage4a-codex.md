GPT-6 (Codex); effort unknown.

# Job 16: conditional Section 10 formalisation

Date: 2026-10-08. **Final status: the approved conditional scope is AI-proved
and all five acceptance gates passed.** The Section 8 comparison and Ext¹ clauses
remain excluded by departure 4a.4. Sources are uncommitted for Claude’s review.
Earlier checkpoints below are retained as execution history; their pending/access
statuses are superseded by the final receipt at the end of this report.
Lean worktree: `findim-worktrees/stage4a`,
base `394efc3`. The main checkout and sibling worktrees are outside this job.
Shared `.lake/packages` is read-only. No commits or manuscript changes are authorised.

## Scope and conventions

Targets are Propositions 10.1–10.2, Corollary 10.3, Theorem 10.4 and Corollary 10.5.
Remark 10.6 and the subsequent finite computations are outside the requested scope.
The approved conditional inputs are exactly the three groups in task 16:
the linear pretriangulated category with finite-dimensional Homs; the perfect,
composition-compatible Tate pairing; and the nonnegative polynomial endomorphism
algebra of the example object. No bracket or conclusion is an interface field.
All new mathematical claims remain open until their Lean implementations compile.
Kernel checking does not certify the correspondence to the report or the inputs.

Composition in the report is right to left; Lean `f ≫ g` is `g ∘ f`.
Graded Homs are actual morphisms into shifts, not newly defined vector spaces
identified with duals. Toda brackets will use the report's defining systems for
a distinguished triangle. The degree of a triple bracket is `p+q+r-1`.

## Work allocation and searches

Same-model agents develop the generic Toda construction, the approved interface,
and the linear rank argument in separate stage-prefixed modules. Root integrates
them, handles cone calculations and the acceptance record. Their claims are leads
until inspected and checked; this is not independent model review.

Pinned Mathlib revision: `0df444a360eaa60ab8c11dca51a86af692955474`.
Initial source inspection finds `Pretriangulated.Triangle.coyoneda_exact₁/₂/₃`
and `yoneda_exact₂/₃`, enough to attempt the defining-system and coset proofs.
`CategoryTheory.ShiftedHom` represents the report's graded morphisms and supplies
composition with explicit degree equalities. Detailed reuse decisions follow.

## Initial departures and outstanding work (historical checkpoint)

- The Ext¹ assertion of Proposition 10.2 and its consequence for Z in Corollary
  10.3 require the conversion comparison of Section 8, which is not an approved
  interface field. Only the triangle/rank and composite-vanishing parts can be
  covered by this stage. This omission will be numbered in the Lean README.
- All five target items are pending. Interface consistency model, statement
  listing, proof-term interface-field audit, line counts and all five gates are
  pending.

## Checkpoint

The initial interface (170 lines), shift identifications (51 lines), Toda
development (236 lines), and rank/triangle argument (252 lines) compile with
warnings as errors. This is an implementation checkpoint, not the five-gate
acceptance receipt. Proposition 10.1 and the final applications are still open.

### Toda construction and rank milestone

`Stage4a.Toda.DefiningSystem` contains precisely the two lifts in report §2.2.
`bracket_nonempty`, `bracket_eq_coset`, `juggling`, and
`bracket_eq_of_distinguished_cones` derive existence, the indeterminacy coset,
Lemma 2.2 and independence of the cone. They reuse the exactness lemmas above
and Mathlib's `isoTriangleOfIso₁₂`. No Toda property is an interface field.
Status: AI-proved in the generic pretriangulated setting, pending final gates.

`Stage4aRank.oneFactor_rank` uses the actual triangle
`Fs → s ⊞ s → X[1]`. The prescribed dimensions, beta spanning `H⁻¹`, the two
vanishing composites and nonzero pair of maps give `dim Hom(s,Fs)=2` and
non-surjectivity of `(c,d) ↦ (c-d)v` for every `v`. The dimensions still need
to be supplied from Proposition 10.1 for full coverage of Proposition 10.2.
Status: AI-proved rank/triangle lemma, pending final gates and that application.

### Pairing source check

Read the Library PDF `Lin13 - Tate Duality and Transfer in Hochschild
Cohomology.pdf`, published version, JPAA 217 (2013), pp. 2387–2399.
Page 2389, (2.1)–(2.2), gives the duality and natural bilinear form; p. 2390,
(2.6), makes its shift identification explicit; p. 2391, (2.8), states
`⟨ζη,τ⟩ = ⟨ζ,ητ⟩`. The preceding text defines the two Yoneda products as
`Σ^{-m}(ζ) ∘ η` and `Σ^{-n}(η) ∘ τ`. These agree with Mathlib's
`ShiftedHom.comp` after reversing Lean's written composition order.
No extra symmetry or shift-linearity field is assumed. Scalar linearity of the
shifted second factor is derived from perfection and this compatibility.

### Theorem 10.4 milestone

`Stage4a.tate_obstruction` and `Stage4a.beta_comp_eq_zero` built successfully
with warnings as errors (12 seconds each in the milestone build).
Status: conditional AI-proved, pending final gates and correspondence review.
Theorem 10.4 uses only the approved Tate input, one-dimensional degree zero,
and the report's vanishings in degrees 1, 2 and 4. The displayed chain is
`s → s[-1] → s[-2] → s[1]`, with each shifted arrow constructed by
`shiftHomEquiv`. Its values are actual endomorphisms of `s[1]`, which are
degree-zero endomorphisms after shifting. Every distinguished triangle on the
middle arrow is covered. In particular, definedness and the singleton conclusion
are both checked, including the case tau = 0.

`beta_comp_eq_zero` is the factorisation step of Corollary 10.3: provided the
cone's degree-minus-three group vanishes, every degree-one map annihilates every
degree-minus-one class. It uses associativity of `ShiftedHom.comp` and the
derived right factorisation. The actual cone application is still pending.

At this checkpoint there are 1,164 new Lean lines across eight files (some
remaining under development), comfortably below the 5,000-line stopping bound.
Next: finish the cone calculation and its one-factor applications; check
Corollary 10.5; integrate statements and run all five gates.

### Corollary 10.5 milestone

`Stage4a.HigherObstruction.polynomial_toda_eq_zero` passes direct Lean with
warnings as errors. Status: conditional AI-proved, pending final gates.
It covers every `p ≥ 3`. For `p=3` it derives the hypotheses of Theorem 10.4
from the polynomial basis. For `p>3` it derives vanishing in degrees `1`,
`p-1`, `p-3`, and by duality in degree `-2`, then proves definedness and
equality with `{0}`. The argument works for every degree-p class, and hence
for the report's generator. Its 109-line module does not add an interface field.

The same-model source correspondence check is in
`audit/16-stage4a-correspondence.md`. It found no mismatch in its recorded
scope and explicitly excluded the then-unfinished cone application of 10.3.
It is not an independent review and is limited to the saved source hashes.

### Numbered departures (also in the Lean README)

- **4a.1:** abstract linear pretriangulated category, with no construction of
  the intended symmetric-algebra stable category. All results are conditional.
- **4a.2:** the approved graded polynomial isomorphism is represented by its
  homogeneous monomial bases, unit and multiplication, rather than a separate
  total direct-sum algebra equivalence. No negative profile is assumed.
- **4a.3:** explicit chosen-cone bracket in `Hom(s[1],s[p-2])`; cone
  independence and the canonical identification with degree `p-3` are supplied.
- **4a.4:** the Ext¹(Z,Z) assertions of 10.2–10.3 remain outside the interface
  and are not formalised. The rank map is `(c,d) ↦ (c-d) • v`; the Section 8
  comparison identifying it with δ⁰ is not constructed. The object `F`
  represents `Fs` in the given triangle; no tensor-functor input is added.
  The rank and composite assertions remain in scope.
- **4a.5:** Theorem 10.4 uses one-dimensional H⁰, the consequence of the
  scalar endomorphism hypothesis used by the proof, without retaining unused
  module simplicity or a named scalar-algebra isomorphism.
- **4a.6:** the cone triangle uses `s[-3][1]` with its canonical isomorphism
  to `s[-2]`. Its degree-one connecting map lands in `s[-3][2]`, canonically
  `s[-1]`. `Cone.deshiftTau` gives the original arrow from the degree-three
  generator. The shift-by-three proof uses the triangle isomorphism
  `(counit, -id, id)` to account for Mathlib's three signs.

No Lean model of the full interface has been constructed. The intended model
requires the symmetric-algebra/stable-category foundations excluded by the
conditional scope. No consistency or faithfulness claim follows from compilation.

### Resumed session: access boundary and cone repairs

The usage-reset session on 2026-10-08 grants filesystem writes only to this
verification repository and `/tmp`; the stage4a worktree is not in the current
writable roots. A request to restore that root is pending. No worktree writes,
Lake builds, or gate executions have been attempted in this resumed session.
Read-only Lean checking (without output-artifact flags) is possible with the
worktree's saved setup file and existing imported objects.

The five reported Cone failures were reproduced by such a check. They concern
concrete-category evaluation, natural-isomorphism projections, an unreduced
lambda in an injectivity proof, an undetermined scalar field, and automatic
proof defaults in `Triangle.isoMk`. Repair candidates are retained under
`computations/16-stage4a-resume/`; they do not change any theorem statement.
The normalization additionally requires `Units.neg_smul`, since Mathlib's
`Int.negOnePow` takes values in the units of the integers.

The source correspondence review now covers the full proposed cone profile,
the rank application, and the composite-vanishing application of Corollary
10.3. See `audit/16-stage4a-correspondence.md` for source hashes and scope.
This is same-model source review, not independent review or compilation evidence.
`HasBinaryBiproduct s s` is derivable from Mathlib's `Pretriangulated` instances
(`Pretriangulated.lean`, lines 562–576); it is not a further interface input.

### Proposition 10.1 and the one-factor applications: checked candidates

The repaired Cone candidate passes direct Lean using the saved worktree setup,
which sets warnings as errors, `autoImplicit=false`, and the standard Mathlib
linters. It contains the full profile and both bijectivity clauses; no statement
or interface change was needed. Its SHA-256 is
`f3986b5651e216eb86b0d1818bcb30ff3c6857170e0d66b50f5edeb1d5d9c3db`.
The worktree's Cone source is still the original failing file, because applying
the repair would cross the session's filesystem boundary.

A combined source-only check then elaborated the repaired Cone source, the
unchanged OneFactor source, and the repaired stage4a statement/audit commands.
It passed with warnings as errors. The only audit repair was extracting the
state from `StateM.run`, rather than the `Unit` return value of `run'`.
The checking harness disables the hash-command style linter only for the
intentional audit commands. No project linter setting or proof budget changes.
The script, sources, logs, statuses and hashes are saved in
`computations/16-stage4a-resume/`. No compiled artifact was generated by these
source-only checks, and imported objects were reused from the earlier session.

Status of the mathematical candidates: **conditional AI-proved by source-only
Lean checking**, with the scope departures above. Status of the worktree and
acceptance workflow: **unfinished**, pending applying the prepared patch,
module compilation and all five gates.

### Main formal statements and informal readings

The declarations below are in `FindimCounterexample.Stage4a`, except the
explicitly named `Stage4aRank` helper. Full Lean types, axiom outputs and computed
interface-projection use appear in the saved `combined-check.log`.

| Report item | Formal declaration(s) | Informal reading |
| --- | --- | --- |
| §2.2 Toda construction | `Toda.bracket`, `bracket_nonempty`, `bracket_eq_coset` | For a distinguished triangle on the middle arrow, the bracket consists of the composites of its two defining lifts. Zero consecutive composites imply existence. Subtracting any chosen defining composite gives precisely the sum of the two standard indeterminacy images. |
| Lemma 2.2 / cone choice | `Toda.juggling`, `bracket_eq_of_distinguished_cones` | Precomposition of a bracket representative gives the report's juggling inclusion. The set is independent of the distinguished cone on the fixed middle arrow. |
| Proposition 10.1 | `Cone.oneCone_profile` | For every distinguished triangle with first arrow `deshiftTau s P.tau`, `Hom(s,X[a])` has dimension one for `a=0,1` and is zero for all other integers. |
| Proposition 10.1, map clauses | `Cone.oneCone_i_bijective`, `oneCone_pi_bijective` | Postcomposition by the degree-zero shift of `i` is bijective. The degree-one connecting map induced by `π[1]`, including the target shift-addition identification, is bijective onto the degree-minus-one self-Hom space. |
| Proposition 10.2, triangle/rank | `one_factor_rank` | For the report's triangle `F → s⊞s → X[1]`, a nonzero pair `(w₁,w₂)` and its stated two zero composites imply `dim Hom(s,F)=2`. For every `v:s→F`, `(c,d)↦(c-d)•v` is not surjective. All cone dimensions are derived. Here `F` denotes the object called `Fs` in the report. |
| Proposition 10.2, image calculation | `FindimCounterexample.Stage4aRank.range_scalarDifference` | The image is exactly the line spanned by `v`, including the zero-map case. It therefore has dimension at most one. |
| Corollary 10.3 | `Cone.oneCone_composite_zero`, `one_factor_obstruction` | Every degree-one map to the actual cone annihilates every degree-minus-one self-map. Consequently the rank/non-surjectivity conclusion holds without assuming the zero composites. The factorisation through the nonzero degree-three generator is derived from the Tate pairing. |
| Theorem 10.4 | `tate_obstruction` | One-dimensional degree zero and vanishing in degrees 1, 2 and 4 imply that, for all `τ` in degree 3 and `β` in degree −1, the chosen-cone bracket for the chain `s→s[-1]→s[-2]→s[1]` is exactly `{0}`. This includes definedness and the case `τ=0`; it uses no polynomial input. |
| Corollary 10.5 | `HigherObstruction.polynomial_toda_eq_zero` | For the stated polynomial input of degree `p≥3`, the bracket is exactly `{0}` for every degree-`p` class and every degree-minus-one class. The report's generator is a special case. The proof separates `p=3` from `p>3`. |

Departure 4a.4 is material: neither a tensor functor on the chosen category nor
Section 8's conversion sequence/module Z is constructed. Thus the literal
identification with the report's `δ⁰` and the Ext¹(Z,Z) consequences are not
formal conclusions of these declarations. No replacement assumption about δ,
Z, Ext¹, bracket existence or zero composites has been inserted.

### Mathlib reuse decisions

| Search / infrastructure | Reuse decision |
| --- | --- |
| `CategoryTheory/Shift/ShiftedHom.lean` | Reused actual shifted Homs, composition, associativity and the degree-zero unit identifications. No parallel graded-Hom type. |
| `CategoryTheory/Triangulated/Pretriangulated.lean` | Reused triangle Yoneda/coyoneda exactness, distinguished-cone isomorphisms, rotations, and the derived binary-biproduct instances. |
| `CategoryTheory/Triangulated/Yoneda.lean` and homological functor sequence APIs | Reused the shifted long exact Hom sequence; linear exactness and cone vanishings are consequences, not interface fields. |
| `CategoryTheory/Triangulated/TriangleShift.lean` | Reused the signed shift of a triangle and supplied the explicit `(counit,−id,id)` normalization isomorphism. |
| `CategoryTheory/NatIso.lean`, `Linear.homCongr` | Reused canonical source/target shift identifications, preserving the actual map rather than only comparing dimensions. |
| Linear dual / finite-dimensional lemmas | Reused perfect duality as a linear equivalence, dual finrank, rank-nullity, and the bound on the dimension of a singleton span. |
| Toda-bracket search | No suitable imported bracket API was used. The 232-line local construction derives nonemptiness, the coset law, juggling and cone independence from standard triangle exactness. |

### Checked projection use and size

The repaired audit command computes dependencies from proof/definition bodies,
including primitive structure projections; it does not print a manually
expected list. The candidate output gives:

| Main conclusion | Custom interface projections reached |
| --- | --- |
| Toda existence/coset/juggling/cone independence; generic rank helper | none |
| Theorem 10.4 | Tate pairing, composition |
| Corollary 10.5 | polynomial basis; Tate pairing, composition |
| Proposition 10.1 profile; Corollary 10.3 | polynomial basis, basis multiplication; Tate pairing, composition |
| Proposition 10.2 wrapper | polynomial basis; Tate pairing |

The approved `basis_zero` and `naturality_target` fields remain documented in
the interface but are not needed by these final proof terms. Standard category,
linearity, finiteness and distinguished-triangle hypotheses remain visible in
the printed types. All listed main declarations have transitive axioms exactly
`{propext, Classical.choice, Quot.sound}` in this check. This does not replace
the exhaustive axiom gate or imported kernel replay.

| New module | Worktree lines | Candidate lines |
| --- | ---: | ---: |
| Stage4aInterface | 428 | 428 |
| Stage4aShift | 51 | 51 |
| Stage4aToda | 232 | 232 |
| Stage4aObstruction | 78 | 78 |
| Stage4aHigherObstruction | 109 | 109 |
| Stage4aFactorization | 53 | 53 |
| Stage4aRank | 247 | 247 |
| Stage4aCone | 314 | 320 |
| Stage4aOneFactor | 81 | 81 |
| **Total new modules** | **1,593** | **1,599** |

`Audit/Statements.lean` has 191 lines (118 added), and the root module has nine
new imports. The candidate total including these Lean additions is 1,726 lines.
Every individual Lean file remains below 1,500 lines, and the stage remains
well below the 5,000-line stopping bound. Existing stage statements and pinned
configuration files have no changes from this job.

### Acceptance and remaining work at this checkpoint

| Check | Result |
| --- | --- |
| Cone candidate, source-only Lean / warnings as errors | PASS (exit 0) |
| Combined candidate + OneFactor + stage4a statement/projection audit | PASS (exit 0) |
| Gate 1: source scan via `tools/gates.sh` | NOT RUN in resumed session |
| Gate 2: worktree `lake build` | NOT RUN; requires worktree write access |
| Gate 3: exhaustive transitive axiom audit | NOT RUN |
| Gate 4: full `Audit/Statements.lean` through the rebuilt root module | NOT RUN; the stage4a commands passed in the candidate harness |
| Gate 5: imported `leanchecker` replay | NOT RUN |

The three-file `computations/16-stage4a-resume/resume.patch` is ready for review
and application after the worktree is restored as a writable root. Its input
and candidate hashes are in `patch-inputs.json`. It changes only the Cone
proofs, the audit command's state extraction, and the README status/explanation.
The final five-gate evidence directory remains
`lean/gates/stage4a-uncommitted`; no successful receipt is claimed there.

No further mathematical interface field was found necessary, and no missing
Mathlib infrastructure currently blocks these candidates. The immediate blocker
is filesystem access; the mathematical scope gap is the already recorded
Section 8 comparison/Ext¹ clause. The intended symmetric-algebra model, an
independent correspondence review, and human certification remain outside the
current evidence. No commit was made.

Final read-only validation of the prepared patch: `git apply --check
--whitespace=error` returned exit 0 in the stage4a worktree. Input and candidate
hashes still match the receipt. The successful combined harness hash is
`74c5e9f8a9f65ed7b504ecc488aae524d666136004cad2bec9e7d8c381a62750`.
The access request remains pending at the end of this resumed checkpoint.

### Worktree access restored; patch integrated

On the second resume on 2026-10-08, the stage4a writable root was restored.
All three patch-input hashes still matched, so the tested patch was applied
without changes. `lake build` in the worktree passed with warnings as errors:
Cone (31 s), OneFactor (5.0 s), root module (5.1 s), 2,128 build jobs total.
The earlier filesystem block is resolved. All five acceptance gates are now
running in the prescribed evidence directory. No additional interface field
or mathematical statement change was needed.

## Final receipt — 2026-10-08

Status: **conditional AI-proved, all five acceptance gates passed** for
Proposition 10.1, Proposition 10.2's rank/triangle part, Corollary 10.3's
composite/rank part, Theorem 10.4 and Corollary 10.5. No additional interface
field was needed. The earlier access block and candidate-only status are
resolved. The full Section 8 comparison and Ext¹ clauses remain the explicit
scope departure 4a.4, not axioms or conclusions of this development.

The final statement correspondence is the table above, now for the actual
compiled worktree sources. The final reread of Theorem 10.4, Corollary 10.5
and the Toda construction is recorded with source hashes in
`audit/16-stage4a-correspondence.md`. It checks definedness, both τ cases,
the auxiliary factorisation/juggling argument, and the target-degree shift
identifications. This remains same-model review, not independent or human
certification.

The unchanged `tools/gates.sh` was run in the stage4a worktree with the exact
evidence directory requested by the task. It exited 0. Evidence:

| Gate | Result | Evidence file |
| --- | --- | --- |
| 1. Source scan, line bounds, root imports | PASS, exit 0 | `lean/gates/stage4a-uncommitted/1-source-scan.log` |
| 2. `lake build` | PASS, exit 0; warnings as errors | `lean/gates/stage4a-uncommitted/2-build.log` |
| 3. Exhaustive transitive axiom audit | PASS, exit 0 | `lean/gates/stage4a-uncommitted/3-axioms.log` |
| 4. Full statement and interface-projection listing | PASS, exit 0 | `lean/gates/stage4a-uncommitted/4-statements.log` |
| 5. Imported kernel replay, one thread | PASS, exit 0 | `lean/gates/stage4a-uncommitted/5-leanchecker.log` |

The axiom audit covered **368 declarations, including 271 theorems**, selected
by defining module, including private/generated declarations. The nine stage4a
modules contribute **222 declarations, including 170 theorems**. Every audited
axiom set is a subset of `{propext, Classical.choice, Quot.sound}`. The final
replay log lists all 18 source modules and the root module. Gate 4's computed
custom-field uses agree with the candidate dependency table above. The build
and statement logs contain no warnings or errors.

The base commit is `394efc357e0cbe75b8e66a5353d2aef4302893b3`; there is no new
commit. `sources.sha256` records 24 source/configuration files and was checked
again after the gates: every hash still matches. Only documentation was then
updated. `README.sha256` records the final README; `summary.txt` records all
five exit codes. No earlier-stage Lean file or pinned configuration file was
changed. The shared package directory was not modified by this job; no update
or clean command was run.

Final size: **1,599 lines in nine new Lean modules**, maximum **428 lines** in
one file; **118** added statement/audit lines and **nine** root imports, for
**1,726 new Lean lines** total. The numerical bounds are satisfied. The README
contains the correspondence table, all six numbered departures 4a.1–4a.6,
and the complete field list under “Interface of stage 4a (conditional)”.

There are no remaining implementation or gate failures within this conditional
scope. Remaining boundaries are the documented Section 8 comparison/Ext¹
clauses, the absent stable-module realization of the interface, and subsequent
independent/author review. These checks do not certify the interface's intended
model or consistency. All changes are left uncommitted for Claude.
