Model: GPT-6 (Codex); effort: unknown.

# Job 14 commutator subtask

Status: first implementation written; Lean checking is in progress.

The owned file is `FindimCounterexample/SelectionCommutator.lean` in the Lean repository.
The report's convention agrees definitionally with the pinned Mathlib convention:
`Algebra/Group/Commutator.lean`, definitions `commutatorElement` and
`commutatorElement_def`, uses `x * y * x⁻¹ * y⁻¹`.

Searches inspected `GroupTheory/Commutator/Basic.lean`,
`Algebra/Group/Commute/{Defs,Basic}.lean`, `GroupTheory/Subgroup/Center.lean`.
Reused `conjugate_commutatorElement`, `commutatorElement_mul_left_eq_conj_mul`,
`Commute.mul_right`, `Commute.inv_right`, and `Subgroup.mem_center_iff`.
The needed Mathlib object file was already cached; no cache was fetched.

The transfer theorem states, in an arbitrary group: if x commutes with v,
p = [x,w], q = [w,v], and q commutes with p and v, then [x,q] = [p,v].
This is the calculation in Proposition 5.11 with all and only the used hypotheses.
The square theorem assumes x² = 1 and x commutes with [x,y]; its centrality
specialisation concludes [x,y]² = 1 when [x,y] belongs to the centre.
No presentation relation or report claim is taken as an unverified interface.

The generic file now compiles with `lake env lean -DwarningAsError=true
FindimCounterexample/SelectionCommutator.lean` (exit 0, no warnings).
Status: AI-proved, Lean kernel checked; full acceptance gates remain the parent
job's responsibility. The implementation uses 61 lines.
The first check found that `Commute.inv_right` requires the explicit cached
import `Mathlib.Algebra.Group.Commute.Basic`; adding that import resolved it.

Next: instantiate the transfer theorem and formalise Proposition 5.11 against
the actual presented group, in the newly assigned `SelectionCentral.lean`.

`SelectionCentral.lean` now passes its direct Lean check with warnings as errors
(exit 0, no warnings); a Lake target build is running. It has 120 lines.

The declarations in `FindimCounterexample.SelectionGroup` are:

- `commutator_transfer i j hij a s b`: the equation in the report for every
  i ≠ j and all integer parameters; the order of s+b is converted explicitly
  to the presentation API's b+s.
- `commutator_eq_of_sum i j a b c d h`: commutators at any indices agree when
  a+b=c+d; the same-index case uses a different index and two transfers.
- `z N`: the commutator at index zero and splitting N+0; `commutator_eq_z`
  and `z_eq` give independence of index and splitting.
- `u_commute_z`, `v_commute_z`, `w_commute_z`, `torus_conjugate_z`,
  `torus_commute_z`, `generator_commute_z`: centrality against each kind of
  defining generator. Existence of a third index is kernel-checked by
  `decide` on the nine ordered pairs in Fin 3.
- `z_mem_center N`: z_N belongs to `Subgroup.center G`; uses
  `PresentedGroup.generated_by` and `Subgroup.centralizer {z N}`.
- `z_sq N`: z_N²=1, from its actual centrality and the actual U-involution
  relation.

Status of this scope: AI-proved, kernel checked. No report statement was
weakened or assumed, and no new presentation relation was introduced.
The finite index convention uses 0,1,2 in Lean for the report's 1,2,3,
as in the parent presentation. The generic commutator lemma is a stronger
intermediate theorem, then instantiated unconditionally in G.
The full gates, statement listing, and correspondence integration are pending
in the parent job.

Lake target build completed successfully (801 jobs); the new central module
compiled in 17 seconds. Total owned Lean source: 181 lines. No commits.
Same-model correspondence review is not independent review or human
certification. The only pending work for this subtask is the parent's complete
acceptance-gate run and integration into the overall job report.

## Generic matrices for item 5

The items 1/3/4 checkpoint's five-gate marker was read before any new matrix
source was written. The new owned file is `MatrixTransvections.lean`.

Further pinned-Mathlib searches inspected `LinearAlgebra/Matrix/Transvection`,
`Data/Matrix/Basis`, `Data/Matrix/Mul`, and `Algebra/CharP/Two`.
The implementation reuses the existing `Matrix.transvection` and its
same-position multiplication theorem, the single-entry product formulas,
`Matrix.commute_diagonal`, and `CharTwo.add_self_eq_zero`. All imports were
already cached. The ring is arbitrary commutative of characteristic two;
no field or reducedness assumption is used.

First matrix draft written; local Lean check in progress. Target APIs include
the units `e`, `diag`, the additive embedding `eHom`, and general commuting,
chain-commutator and diagonal-conjugation identities. Inversion in the
conjugation coefficient is exclusively inversion of elements of `Rˣ` followed
by coercion into R.

`MatrixTransvections.lean` now passes `lake build
FindimCounterexample.MatrixTransvections` with warnings as errors (1423 jobs,
owned module 28 seconds). Its 158 lines supply:

- `e i j hij a`, with underlying matrix `1 + Matrix.single i j a`;
  `e_inv`, `e_sq`, `e_zero`, `e_mul`, and `e_injective`.
- `eHom i j hij : Multiplicative R →* (Matrix n n R)ˣ`, with
  `eHom_apply` and `eHom_injective`: the additive coefficient ring embeds as
  the elementary matrices at a fixed off-diagonal position.
- `e_commute i j k l hij hkl hjk hli a b`: the two elementary matrices
  commute when j ≠ k and l ≠ i, precisely the zero-product conditions.
- `e_commutator i j k hij hjk hik a b`: the chain commutator equals the
  elementary matrix at (i,k) with coefficient a*b, for distinct i,j,k.
- `diag d` for d : n → Rˣ, with the exact diagonal value and inverse,
  `diag_commute`, and `diag_conjugate_e`: conjugation changes coefficient a
  to `(d i : R) * a * ↑((d j)⁻¹)`.

The two generic diagonal-unit declarations require only a commutative ring;
the elementary matrices require characteristic two. Scalar unit inverses
are explicitly coerced before use as ring entries; no ring inversion is used.
First checks caught only unused simp arguments, coercion elaboration, and
one missing explicit inequality in a rewrite. No mathematical change was
needed. Status: AI-proved, Lean kernel checked. Parent integration and the
complete final five-gate receipt remain pending. Repository size after build:
3.8 GB. No cache fetch and no commits.

## Item 6: direct sum and non-finite generation

After the parent's signal that item 5's homomorphism compiled, work began on
`SelectionDirectSum.lean` and `SelectionIndependence.lean`.

Pinned-Mathlib searches found `ZMod.lift`, `zmultiplesHom`,
`Finsupp.liftAddHom`, `Finsupp.linearCombination`, `MonoidHom.ofInjective`,
`Module.Finite.of_injective`, `Module.finite_finsupp_iff`, and the bridge
`Module.Finite.iff_addGroup_fg`. The canonical commutative-group structure of
the centre is enabled using Mathlib's `IsMulCommutative` scope. Integer
Noetherianity follows from the cached principal-ideal-domain infrastructure.
No new algebraic interface is introduced.

`SelectionDirectSum.lean` compiles with warnings as errors (1161 jobs, owned
module 10 seconds). It defines `zCentral`, the cyclic homomorphisms out of
Z/2, `centralSum`, its multiplicative form `centralProduct`, and the subgroup
`centralSubgroup` generated inside the centre. It proves that the range equals
that subgroup and that its image in G equals the closure of the original z_N.
Its first checks found only type-tag naming, the commutativity scope, and
induction-constructor spelling issues; no statement change was needed.

`SelectionIndependence.lean` is written and being checked. It compares the
actual pi_m image of `centralSum` with a single transvection having coefficient
`f.sum (fun N c => c • tPow m hm N)`. The separate finite-support separation
lemma supplied in `FiniteQuotientSeparation.lean` then gives injectivity.
Non-finite generation is derived through the induced injective integer-linear
map into the centre's additive group, using the Noetherian property; it is
not inferred merely from the existence of an arbitrary non-finitely-generated
subgroup of a group.

Item 6 implementation now passes `lake build
FindimCounterexample.SelectionIndependence` (1873 jobs, owned module 8.9
seconds), with warnings as errors. `SelectionDirectSum.lean` has 104 lines;
`SelectionIndependence.lean` has 110. The first independence check accepted
all mathematical proofs; only two style-linter complaints required replacing
`letI` by `let` for proposition-valued local instances.

The main final declarations under `FindimCounterexample.SelectionGroup` are:

- `centralSum : (ℤ →₀ ZMod 2) →+ Additive (Subgroup.center G)`;
  `centralSum_single_one` sends each standard vector to z_N.
- `pi_centralSum`: the actual matrix-quotient formula for every finitely
  supported vector, including negative integer support.
- `centralSum_injective`, `centralProduct_injective`: no nontrivial finite
  relation among the central involutions.
- `centralProduct_range`: the range is `centralSubgroup`, the closure of all
  z_N inside the centre; `centralSubgroup_map` identifies its image in G with
  `Subgroup.closure (Set.range z)`.
- `directSumEquiv : Multiplicative (ℤ →₀ ZMod 2) ≃* centralSubgroup`, and
  `directSumEquiv_single` gives the prescribed generator images.
- `center_not_finitelyGenerated : ¬ Group.FG (Subgroup.center G)`, and
  `center_not_fg : ¬ (Subgroup.center G).FG`.

Status of these declarations: AI-proved, kernel checked; final acceptance
is pending the parent's gates on integrated sources. No report statement is
weakened: the centre statement uses its commutativity, the Noetherian integer
module theorem, and the infinite index set. The direct sum is written using
`Finsupp` and multiplicative type tags, as permitted in job 14. No commitments,
network activity, or dependency changes were made.

## Item 2: transport of finite relators

The new checkpoint's five-gate success marker was read before editing item 2.
The assigned module is `SelectionFiniteRelations.lean`; the exact finite
presentation and integer root orbits are assigned to separate agents.

The report's explicit torus-vector table was reread. The implementation
represents T^n by `T 0 ^ n 0 * T 1 ^ n 1 * T 2 ^ n 2`. The generic
`SelectionTorus.conjugate_zpow_shift` raises one-step shifts to arbitrary
integer powers. The weight-coordinate identity is obtained by writing the
integer vector as the sum of its three coordinate multiples.
Two generic transport lemmas conjugate actual zero-parameter commutation
and chain relations. The vectors used for all relation families are exactly
the vectors displayed in Proposition 5.9, including the separate W/U and W/V
cases where the second root uses a repeated or a third index.

First draft of the owned finite-relations module is written; checking waits
for the finite presentation/orbit modules' object files. No interface
hypothesis is substituted for the finite presented group.

`SelectionFiniteRelations.lean` now passes `lake build
FindimCounterexample.SelectionFiniteRelations` with warnings as errors
(933 jobs, owned module 7.9 seconds). It has 159 lines. The first check
required an explicit integer-cast simplification in the coordinate identity,
explicit conjugation/family unfolding for the U-square calculation, and
removal of redundant arithmetic tactics; all coordinate vectors were accepted
without mathematical modification.

Main declarations under `FindimCounterexample.SelectionFinite`:

- `torus`, `torus_conjugation`, `torus_conjugate_root0`: the complete
  integer-vector conjugation law, with exactly the report's weights.
- `family_u_sq`, `family_uu`, `family_vv`, `family_uv`, `family_wu`,
  `family_wv`, `family_uw`, `family_wv_transfer`: every defining relation of
  G holds at all integer parameters in the actual finite presented group P.
- `fromG : SelectionGroup.G →* P`, `fromG_T`, `fromG_S`: the resulting
  homomorphism fixes torus generators and sends each root generator S(r) to
  its conjugation orbit in P.

Status: AI-proved, kernel checked. These results use only relations of the
actual P; no extra commutativity or square relations were introduced. The
parent is assembling the reverse homomorphism, presentation equivalence,
finite-presentation predicate and final acceptance receipt. No commits.
