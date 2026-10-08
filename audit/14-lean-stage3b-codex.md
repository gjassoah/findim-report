GPT-6 (Codex), effort unknown.

# Job 14: Lean stage 3b

Started 2026-10-08. Status: all requested results are AI-proved, unconditionally
down to pinned Mathlib; all five final acceptance gates passed on 2026-10-08.
The item records below preserve the implementation checkpoints; the final
receipt appears last. Uncommitted; Claude's review remains pending.
The approved scope is Definition 5.6, Propositions 5.9, 5.11, 5.13, 5.14 and
Corollary 5.15, unconditionally down to pinned Mathlib. No commits are authorised.

## Initial state and conventions

- Lean repository base: `394efc3`; initial working tree clean.
- Lean 4.33.1; Mathlib `0df444a360eaa60ab8c11dca51a86af692955474`.
- Standing rules, both READMEs, project instructions, progress, design,
  feasibility documents, audit machinery and report statements/proofs read.
- Report indices 1,2,3 are `Fin 3` (0,1,2); off-diagonal pairs carry
  the condition that their entries differ. Integer parameters remain integers.
- Mathlib `commutatorElement_def` uses `x * y * x⁻¹ * y⁻¹`, exactly the
  report convention. No inversion conversion is necessary.
- No same-type or W/W commutation relations are added to the presentation.
- Implementation order: 1, 3, 4, 5, 6, 2. Parallel preliminary searches
  concern future items; generic group lemmas support item 3.

## Mathlib searches and reuse

`Mathlib/GroupTheory/PresentedGroup.lean` supplies `PresentedGroup`, `of`,
`toGroup`, `toGroup.of`, `ext`, `one_of_mem`, `mk_eq_mk_of_mul_inv_mem`,
and `generated_by`. The definition uses this quotient directly.
`Mathlib/GroupTheory/Commutator/Basic.lean` supplies the convention,
mapping/conjugation identities and `commutatorElement_eq_one_iff_commute`.
The presented-group cache was absent initially; targeted cache requests
successfully restored the required local archives. No pinned dependency
file is changed.

## Items 1 and 3: presentation and central involutions

Status at this checkpoint: AI-proved, direct Lean/Lake checks passed with
warnings as errors; the first combined receipt followed item 4 below.

`SelectionGroup.lean` defines `Index`, `Pair`, `Root`, `Generator`, the
weight homomorphisms, the exact ten relator constructors, `relations` and
`G := PresentedGroup relations`. `lift` is the universal property with
the defining relations as explicit arguments, not assumed facts about G.
`torus_commute`, `conjugation`, `u_sq`, `uu`, `vv`, `uv`, `wu`, `wv`,
`uw` and `wv_transfer` recover each relation in the actual quotient.

`SelectionCommutator.transfer` proves the transfer calculation in any group
from the five relevant equations/commutations. Its central square lemma
only needs that the first commutator entry has square one.
`SelectionGroup.commutator_transfer`, in `SelectionCentral.lean`,
instantiates the calculation in G.
`commutator_eq_of_sum i j a b c d h` states independence for any indices
and any splittings with `a+b=c+d`. `z N := [U 0 N,V 0 0]`,
`z_eq N i a b h`, `z_mem_center N` and `z_sq N` give precisely
Proposition 5.11. Centrality uses the generators of the actual presentation.
The only finite `decide` is the nine-case assertion that two indices in
`Fin 3` have an index distinct from both; the kernel checks it.

At this checkpoint: 232 + 61 + 120 new Lean lines. No extra hypotheses,
relations, axioms or mathematical restrictions. Index re-encoding is the
only representational departure so far. The same-model correspondence
review found no mismatch; see `audit/14-presentation-search.md`.

## Item 4: shift automorphisms

Status: AI-proved, `lake build FindimCounterexample.SelectionShift` passed.
`shiftHom` is obtained from `lift` by verifying the ten defining relation
families; only U parameters change. `beta c : G ≃* G` uses the inverse
shift `-c`. `beta_T`, `beta_U`, `beta_V`, `beta_W` give all generator
images; `beta_add` says beta(c) after beta(d) is beta(c+d), with Lean's
`trans` order made explicit. `beta_zero` is equality with `MulEquiv.refl`.
`beta_z c N` is the stronger formula beta(c)(z_N)=z_(N+c), and
`alpha_z` is exactly the requested formula at c=1. No departure beyond
the explicit composition-order convention; no assumptions added.

Items 1, 3 and 4 have been added to the root module, statement listing and
README correspondence table. All five gates passed on the frozen snapshot
(533 new Lean lines), including exhaustive axiom enumeration (356 project
declarations, 221 theorems) and kernel replay of all 13 project modules and
the root. The milestone receipt is preserved in `lean/gates/stage3b-items134/`
with base commit, source hashes, statement types and individual logs.
Work then proceeded to the quotient infrastructure.

## Historical checkpoint after items 1, 3 and 4

Items 1, 3 and 4 compiled; items 5, 6 and 2 remained pending at this point.
Final gate receipt target: `lean/gates/stage3b-uncommitted/`.
Parallel implementation and correspondence checks use the same model family;
they are not independent model reviews or author certification.

## Item 5, infrastructure checkpoint

Status at this checkpoint: AI-proved for the following separately compiling
modules; the combined item-5/6 receipt followed below.

- `FiniteQuotientRing.lean` (161 lines) uses the exact quotient
  `AdjoinRoot (X^m-1 : Polynomial (ZMod 2))`. `basis m hm` is a basis
  indexed by `Fin m`; `finite m hm` gives finiteness. `t m hm` is the
  unit with value the residue of X and inverse the residue of X^(m-1).
  Integer powers `tPow`, their addition and periodicity, and
  `linearCombination`/`linearIndependent_tPow` give all coefficient facts.
  The hypothesis is only `0 < m`; there is no irreducibility or
  squarefreeness assumption. Characteristic two is derived for the quotient.
- `MatrixTransvections.lean` (158 lines) works over a commutative ring of
  characteristic two. It proves the transvection addition law, injectivity,
  square one, commutation when matrix-unit products vanish, the chain
  commutator and conjugation by diagonal units. Diagonal inverses are
  inverses of units, not a division operation on the quotient ring.

Mathlib reuse: `AdjoinRoot.powerBasis'`, `Polynomial.monic_X_pow_sub_C`,
`natDegree_X_pow_sub_C`, `Matrix.transvection_mul_transvection_same`,
matrix-single multiplication, and diagonal multiplication. The missing
`Algebra.CharP.Algebra` cache entry was built from the pinned source;
dependency pins remain unchanged. Detailed signatures/searches are in
`audit/14-quotients-search.md`. Generic matrix work is also recorded in
`audit/14-commutators-work.md`.

`FiniteQuotients.lean` (226 lines) now builds with warnings as errors.
`pi m hm : G →* MatGroup m` is the actual homomorphism into units of
`Matrix (Fin 5) (Fin 5) (S m)`, which is the allowed general-linear-group
representation. `pi_T_matrix`, `pi_U_matrix`, `pi_V_matrix`,
`pi_W_matrix` state all the specified images, with report positions 1,5
encoded by 0,4. `pi_z` and `pi_z_matrix` give the top-right transvection
formula for every integer N. `F` is the actual range and `finite_F`
asserts its finiteness. All m are quantified with `hm : 0 < m`.

`FiniteQuotientCenter.lean` (168 lines) also passes its configured Lake
build. `Z m hm` is the subgroup of the actual image F generated by the
first m images. `coordinates` is a homomorphism from
`Multiplicative (Fin m → ZMod 2)` to F, `coordinates_injective` gives its
injectivity and `coordinates_range` identifies its range with Z. Thus
`centerEquiv` is the requested group isomorphism; `centerEquiv_generator`
checks each standard generator. `z_image_mem_center` gives centrality
for every integer N, and `Z_le_center` gives centrality of the subgroup.
Proposition 5.14 was fully implemented before the combined item-5/6 gates.

The same-model review of these four modules found no correspondence error;
reviewed hashes are in `audit/14-presentation-search.md`. The target
matrices satisfy additional commutation identities, but these are not
imposed on G: only Definition 5.6 is used in the presentation lift.

`FiniteQuotientSeparation.lean` (77 lines) passes its configured build.
`eq_zero_of_bounded_sum` says modulus `2*K+1` detects a Laurent vector
supported in `[-K,K]`; multiplying by t^K shifts its support into the
monic power basis. `eq_zero_of_all_sums` and `exists_nonzero_sum` give
separation of arbitrary finite integer supports. This is the ring-side
input for Corollary 5.15, including negative exponents.

README departures 8–9 record the index conventions, matrix-unit-group
representation, positive-natural modulus and multiplicative notation for
additive coordinates. There is no mathematical restriction of the claims.

## Item 6: the infinite central direct sum

Status: AI-proved; `lake build FindimCounterexample.SelectionIndependence`
passed with warnings as errors. New files: `SelectionDirectSum.lean`
(104 lines) and `SelectionIndependence.lean` (110 lines).

`zCentral N` is z_N as an element of the actual centre. `cyclic N` factors
integer multiples through `ZMod 2`, using the square-one theorem.
`centralSum : (ℤ →₀ ZMod 2) →+ Additive (Subgroup.center G)` is built by
`Finsupp.liftAddHom`. `pi_centralSum` computes its image in every matrix
quotient; `centralSum_injective` applies the checked finite-support
separation theorem. `centralProduct_range` identifies the actual generated
subgroup inside the centre, and `centralSubgroup_map` identifies its image
in G with the subgroup closure of the z_N.

`directSumEquiv` is the requested group isomorphism from
`Multiplicative (ℤ →₀ ZMod 2)`; `directSumEquiv_single` checks its values
on each standard generator. `center_not_finitelyGenerated` states
`¬ Group.FG (Subgroup.center G)`; `center_not_fg` also gives Mathlib's
subgroup predicate. The argument uses `Module.Finite.iff_addGroup_fg`,
`Module.Finite.of_injective` over the Noetherian integers, and
`Module.finite_finsupp_iff`; it does not incorrectly infer a subgroup's
finite generation from that of an arbitrary nonabelian group.

Departure 10 in the README records the equivalent bounded-support proof
and the Noetherian integer-module route. At this checkpoint all items except
the finite presentation (item 2) compiled. Root imports, statement listing
and README were extended. All five gates passed on the frozen snapshot:
553 project declarations (384 theorems), allowed axioms only, full root
build and kernel replay of all 20 project modules and the root. The receipt
is preserved in `lean/gates/stage3b-items13456/`. The cumulative new Lean
count at this checkpoint is 1,537 lines. Item 2 started after this receipt.

## Item 2: finite presentation

Status: AI-proved; all components and both inverse identities compile with
warnings as errors.

- `SelectionTorus.lean` (54 lines) gives generic conjugation-by-product,
  integer iteration of a one-step shift, and conjugation of an orbit by a
  commuting torus element. This reuses `Int.induction_on` and group powers.
- `SelectionFinitePresentation.lean` (161 lines) defines exactly the finite
  presentation P. `Generator := Index ⊕ Root` has cardinal 15 by a small
  kernel-checked `decide`; `RelatorIndex` is a finite type listing the
  zero-parameter and torus-kernel relations. `relations` is the range of
  `relationWord`, and `relations_finite` gives its finiteness. There are
  no integer parameters in the finite relation index. Each finite
  relation is recovered in the actual quotient P.
- `SelectionFiniteOrbits.lean` (89 lines) constructs `family a r` as
  conjugation of `root0 a` by `base a ^ r`; the base is T_i inverse for U
  and T_i for V and W. The one-step conjugation theorem is checked from
  the finite kernel relations. In particular `[T_i*T_j,w_ij]=1` gives
  the negative shift at the second W index.
- `SelectionFiniteRelations.lean` (159 lines) gives the full torus action
  and transports all zero-parameter relations using the nine vectors in
  the report. `fromG : G →* P` and its generator formulas compile.

This replaces the report's explicit lattice-kernel basis calculation by
coordinate conjugation and integer iteration, with the same two actual
presentations and no extra assumptions. The corresponding proof-route
departure is numbered 11 in the README/design. The final
`SelectionPresentation.lean` (137 lines) now passes both its direct check
and the configured Lake build, with no changes needed after the
correspondence review. `toG` sends the fifteen generators to the named
elements of G; `toG_family` recovers every integer root parameter. Both
composite identities are checked. `presentationEquiv : P ≃* G` has the
required generator values (`presentationEquiv_T`,
`presentationEquiv_root0`), and `finitelyPresented` states
`Group.IsFinitelyPresented G` using the library's finite-presentation
instance and isomorphism transport.

The predicate search found `Mathlib/GroupTheory/FinitelyPresentedGroup.lean`:
`Group.IsFinitelyPresented` means a quotient of a finite-rank free group
by a finitely normally generated kernel. Its `PresentedGroup` instance
applies to finite generators and finite relations, and
`Group.IsFinitelyPresented.equiv` transports it along `presentationEquiv`.
The relevant targeted cache request succeeded from the local archives.

All six mathematical items and the statement-listing requirement are now
implemented unconditionally: 16 new Lean modules, 2,137 lines, maximum
232 lines per new module. The final five-gate run passed with all Lean
sources frozen. The source/configuration comparison confirms
that stages 1, 2 and 3a, all dependency pins, the gate script and the
axiom-audit implementation are unchanged. No commit has been made.

## Final source inventory

All paths below are relative to `FindimCounterexample/` in the Lean repository.
The count excludes the root imports, statement-listing additions and prose.

| New module | Lines |
|---|---:|
| `SelectionGroup.lean` | 232 |
| `SelectionCommutator.lean` | 61 |
| `SelectionCentral.lean` | 120 |
| `SelectionShift.lean` | 120 |
| `FiniteQuotientRing.lean` | 161 |
| `MatrixTransvections.lean` | 158 |
| `FiniteQuotients.lean` | 226 |
| `FiniteQuotientCenter.lean` | 168 |
| `FiniteQuotientSeparation.lean` | 77 |
| `SelectionDirectSum.lean` | 104 |
| `SelectionIndependence.lean` | 110 |
| `SelectionTorus.lean` | 54 |
| `SelectionFinitePresentation.lean` | 161 |
| `SelectionFiniteOrbits.lean` | 89 |
| `SelectionFiniteRelations.lean` | 159 |
| `SelectionPresentation.lean` | 137 |
| **Total** | **2,137** |

## Departures and remaining review

README/design departures 8–11 record every representation or proof-route
change: finite indices and a canonical definition of z_N with choice
independence; `AdjoinRoot`, matrix units, multiplicative additive-coordinate
groups and positive-natural moduli; bounded-support separation and
Noetherian integer modules; and coordinate conjugation for the finite
presentation. None changes a mathematical conclusion or adds an assumption.
Mathlib's finite-presentability predicate exists and is used directly.

No requested mathematical item remains open, no absent-infrastructure or
line-limit stopping exception was needed, and no manuscript statement was
changed. All main declarations are included in `Audit/Statements.lean`;
all new modules are imported from `FindimCounterexample.lean`. The existing
README departures 1–7 are preserved. Same-model source correspondence
checks support the translation but are not independent model reviews or
human certification. Claude's review and any subsequent commit remain pending.

## Final acceptance receipt

Command, run from the Lean repository:

```sh
tools/gates.sh lean/gates/stage3b-uncommitted
```

The frozen source snapshot is identified by `sources.sha256`; `commit.txt`
records the unchanged base commit `394efc357e0cbe75b8e66a5353d2aef4302893b3`.
The command exited 0. All five gates passed:

| Gate | Result |
|---|---|
| Source scan: forbidden constructs, line limits, root imports | Exit 0 |
| Configured full build, warnings as errors | Exit 0; 2,342 jobs |
| Exhaustive transitive axiom audit | Exit 0; 775 declarations, 524 theorems |
| Main statement types and axioms | Exit 0 |
| `leanchecker` kernel replay | Exit 0; all 25 project modules and the root |

Every transitive axiom belongs to `{propext, Classical.choice, Quot.sound}`.
The post-run `sha256sum -c` passed for every recorded source/configuration
file; its output is saved as `source-recheck.log` beside the five gate logs.
`git diff --check` passed. Direct comparison also confirmed that the nine
earlier-stage modules, all dependency pins, `tools/gates.sh` and
`Audit/Axioms.lean` are unchanged. Later edits were confined to prose.

Final status: the entire approved stage is AI-proved and kernel-checked,
with no remaining formalisation gap. This receipt is build/kernel evidence,
not independent model review or human certification. No commit was made.
