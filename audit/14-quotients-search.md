Model: GPT-6 (Codex); effort: unknown.

# Job 14: finite quotient and independence search

2026-10-08. Read-only source search by the delegated agent; no Lean declarations
have been added or built. All proposed proof routes below have status
**plausible** until checked in Lean. Source signatures and cache presence were
read directly at Mathlib commit `0df444a360eaa60ab8c11dca51a86af692955474`.
The parent owns implementation order and the final gate receipt.

## Inputs and conventions

Read the standing index, applicable research/formalisation/code instructions,
verification README, PROGRESS, working rules, job 14, design, feasibility and
Section 5 inventory, the group and finite-quotient subsections of the report,
and the Lean README, AGENTS, Audit files and gate script; skimmed existing Lean
modules. The source specifies characteristic two, all integers as parameters,
and **no** irreducibility or squarefreeness assumption on `X^m - 1`.
Mathlib's matrix indices will be `Fin 5`, so report positions `(1,5)` become
`(0,4)`, and middle index `i : Fin 3` becomes `i.val + 1`.

## Item 5: ring and power basis

Use `AdjoinRoot (Polynomial.X ^ m - 1 : Polynomial (ZMod 2))` exactly.
`Mathlib/RingTheory/AdjoinRoot.lean` defines it as the required principal-ideal
quotient (lines 60 onward), with commutative ring and coefficient algebra
instances. The field instance is irrelevant and should never be requested.

Directly applicable APIs:

* `Polynomial.monic_X_pow_sub_C (a : R) (h : n ≠ 0) :
  (X ^ n - C a).Monic`, `Algebra/Polynomial/Monic.lean:431`.
* `Polynomial.natDegree_X_pow_sub_C : (X ^ n - C r).natDegree = n`,
  `Algebra/Polynomial/Degree/Operations.lean:781` (under the surrounding
  nontrivial-ring variables).
* `AdjoinRoot.powerBasis' (hg : g.Monic) : PowerBasis R (AdjoinRoot g)`,
  `RingTheory/AdjoinRoot.lean:633`. Its generator is `root g`, dimension is
  `g.natDegree`, and `basis_eq_pow` identifies the basis with root powers.
* `AdjoinRoot.powerBasisAux'_repr_apply_to_fun` identifies the basis
  coefficient with the coefficient of `modByMonicHom`; lines 625–626.
* `AdjoinRoot.eval₂_root (f : R[X]) : f.eval₂ (of f) (root f) = 0`,
  line 256. Simplifying for `X^m - 1` gives `root ^ m = 1`.
* `Polynomial.Monic.finite_adjoinRoot` and `.free_adjoinRoot`, lines 648–652,
  require only monicity.
* `Module.Basis.fintypeOfFintype (b : Basis ι R M) [Fintype R] : Fintype M`,
  `LinearAlgebra/Basis/Defs.lean:235`, gives a finite quotient ring directly.
  Alternatively `Module.finite_of_finite [Finite R] [Module.Finite R M] :
  Finite M`, `RingTheory/Finiteness/Cardinality.lean:73`.
* `Basis.equivFun_symm_apply`, `LinearAlgebra/Basis/Defs.lean:243`, expresses
  the inverse coordinate map as the sum of coefficients times powers.

Reindex the power basis from `Fin polynomial.natDegree` to `Fin m` using
the degree equality. Build the unit explicitly with value `root` and inverse
`root ^ (m - 1)`; `m ≥ 1`, `pow_succ` and `root ^ m = 1` prove both inverse
identities. Integer parameters then use the **unit group's** `zpow`, followed
by coercion into the ring. This handles `m = 1` and even `m` identically.

## Item 5: matrix infrastructure

`Matrix.GeneralLinearGroup n R` is definitionally `(Matrix n n R)ˣ`
(`LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:44`). The latter
representation is explicitly permitted by the job and avoids an uncached
import. `Matrix.transvection i j c` is exactly `1 + Matrix.single i j c`
(`LinearAlgebra/Matrix/Transvection.lean:82`).

* `Matrix.transvection_mul_transvection_same (h : i ≠ j) (c d : R)` gives
  the same-position addition law; Transvection line 110. Take `d = -c` to
  construct units, or use characteristic two to take the same inverse.
* `Matrix.single_mul_single_same (c : R) i j k d` gives
  `single i j c * single j k d = single i k (c*d)`;
  `Data/Matrix/Basis.lean:331`.
* `Matrix.single_mul_single_of_ne (c : R) i j k (h : j ≠ k) d` gives the
  zero product; `Data/Matrix/Basis.lean:346`.
* `Matrix.diagonal_mul`, `.mul_diagonal`, `.diagonal_mul_diagonal`, and
  `.commute_diagonal`, `Data/Matrix/Mul.lean:370–393`, provide diagonal
  multiplication and conjugation entrywise.

No prepackaged general elementary-matrix commutator or diagonal-conjugation
lemma was found in the inspected matrix modules. These are small local
lemmas, not absent foundational infrastructure: expand `1 + single`, use
the two single-product laws, and collect four ring terms. Prove once for
an arbitrary commutative ring of characteristic two and distinct matrix
indices, then instantiate for the twelve root types.

The finite-range assertion follows from finiteness of the ring, matrices,
units, and subtypes. Centrality **in the range** should be inherited from
the already checked centrality of `z_N` using range representatives; there
is no need for a second matrix centrality argument.

For `Z_m`, the single-position transvection map from the additive quotient
ring to the matrix-unit group is injective by reading entry `(0,4)`. Compose
it with the additive equivalence from basis coordinates `Fin m → ZMod 2`
to the ring. Its range is the subgroup generated by the finite basis
transvections: prove both inclusions by coordinate expansion and range
closure. This gives the exact isomorphism requested, not merely cardinality.

## Item 6: direct sum and non-finite generation

Work first in `Additive (Subgroup.center G)`, an additive commutative group.
For each `N`, the central involution gives an additive map out of `ZMod 2`.
Useful cached APIs:

* `ZMod.lift n : {f : ℤ →+ A // f n = 0} ≃ (ZMod n →+ A)`,
  `Data/ZMod/Basic.lean:1148`; `.lift_coe`, line 1162.
* `Finsupp.liftAddHom : (α → M →+ N) ≃+ ((α →₀ M) →+ N)`,
  `Algebra/BigOperators/Finsupp/Basic.lean:384`, requiring additive
  commutativity only of the target. `.liftAddHom_apply_single` at line 457
  controls generators. No `Module (ZMod 2) (center G)` is needed or intended.
* `Module.Finite.iff_addGroup_fg : Module.Finite ℤ A ↔ AddGroup.FG A`,
  `RingTheory/Finiteness/Defs.lean:140`.
* `Module.Finite.of_injective [IsNoetherian S N] (f : M →ₛₗ[σ] N)
  (hf : Function.Injective f) : Module.Finite R M`,
  `RingTheory/Noetherian/Basic.lean:136`. Apply with `R=S=ℤ` and the
  additive map upgraded to its canonical integer-linear map.
* `Module.finite_finsupp_iff : Module.Finite R (ι →₀ M) ↔
  IsEmpty ι ∨ Subsingleton M ∨ Module.Finite R M ∧ Finite ι`,
  `LinearAlgebra/Dimension/Finite.lean:537`. For `R=ℤ`, `ι=ℤ`,
  `M=ZMod 2`, all alternatives contradict infinitude/nontriviality.
* `Group.fg_iff_subgroup_fg`, `GroupFG.iff_add_fg`, and
  `AddGroup.fg_iff_mul_fg`, `GroupTheory/Finiteness.lean:436–444`, bridge
  the final centre statement between subgroup and typeclass forms.

Thus the required inheritance from finitely generated abelian groups is
available through Noetherian integer modules. A specialized theorem named
`Subgroup.fg_of_...` for arbitrary subgroups of a commutative group was not
found in inspected group-theory sources; no such theorem needs to be added.

For injectivity of the direct-sum map, a useful variant of the report's
argument avoids proving a complete integer-residue API: for a finite support,
choose an integer lower bound `L` and `m` greater than its width; multiply
the matrix coefficient equation by the unit power `t^(-L)`. Every exponent
`N-L` is now a natural number less than `m`, so basis independence applies
directly after an injective reindexing. This is the same finite-quotient
separation argument, including negative initial exponents.

## Cache and proposed implementation partition

Checked `.lake/packages/mathlib/.lake/build/lib/lean/Mathlib/*.olean`:
`RingTheory/AdjoinRoot`, `LinearAlgebra/Matrix/Transvection`,
`Data/Matrix/Basis`, `RingTheory/Noetherian/Basic`,
`LinearAlgebra/Dimension/Finite`, `Algebra/Group/Finsupp`,
`Algebra/Polynomial/Laurent`, `GroupTheory/Finiteness`, and
`RingTheory/Finiteness/Defs` are cached. `LinearAlgebra/Matrix/GeneralLinearGroup/Defs`
and `Algebra/Module/ZMod` are missing. Neither missing import is necessary
for the proposed representation. No network fetch was made.
`Data/ZMod/Basic`, `Algebra/BigOperators/Finsupp/Basic`,
`RingTheory/Finiteness/Cardinality`, and `GroupTheory/Subgroup/Center`
were subsequently checked and are cached as well.

Plausible partition, all below 1500 lines: `FiniteQuotientRing.lean`
(250–450 lines), `MatrixTransvections.lean` (300–650),
`FiniteQuotients.lean` (500–1000), `FiniteQuotientCenter.lean`
(250–500), `CentralIndependence.lean` (500–900). These are estimates,
not a claim of completed or kernel-checked coverage. No statement defect
or clearly absent foundational infrastructure was found in this search.

No gates have been run by this read-only subtask. Notes currently contain
source-search evidence only, not mathematical acceptance evidence.

## Item 5 implementation: coefficient ring

Implementation was authorized after items 1, 3, 4. Source writing began
only after `stage3b-uncommitted/summary.txt` recorded all five zero exits;
the parent preserved that receipt as `stage3b-items134`.

`FindimCounterexample/FiniteQuotientRing.lean` now implements the exact
quotient ring and its power basis. `S m` is definitionally the required
`AdjoinRoot`; `basis m hm` has index `Fin m` and basis vector `root m ^ i`;
`finite m hm` gives finiteness; `t m hm` has inverse `root m ^ (m-1)`;
`tPow m hm r` coerces the integer power of this unit into the ring.
The file includes addition and periodicity identities for powers.
`linearCombination m hm` is the linear equivalence from coefficient
vectors to the ring, with its sum formula and standard-coordinate formula.
`sum_pow_eq_zero` and `sum_pow_injective` state basis independence in that
formula. Positivity `hm : 0 < m` is explicit, equivalent to the report's
`m ≥ 1`; no additional mathematical hypothesis has been introduced.

The quotient has global `Nontrivial` and `CharP ... 2` instances, even at
`m=0`. Evaluation at one descends to the quotient and is a left inverse
of the coefficient map. This supplies these instances without importing
the field structure of `ZMod 2` or assuming any domain structure on `S m`.

The first completed version (154 lines) passed
`lake build FindimCounterexample.FiniteQuotientRing`, using the repository's
warnings-as-errors and Mathlib linters. `Mathlib.Algebra.CharP.Algebra`
was initially uncached and was compiled locally from the pinned source
(21 seconds), without fetching or altering any dependency pin. Subsequent
small helpers expose `isUnit_tPow` and `linearIndependent_tPow`; their
final build result is recorded below. Mathematical status: **AI-proved**
for the accepted compiling declarations; full-stage gates remain the
parent's responsibility, and this is not human certification.

Final coefficient-ring file: 161 lines. The build including both helpers
passed (`lake build FindimCounterexample.FiniteQuotientRing`, exit 0,
23 seconds for the project module). No warnings, admissions, axioms, or
budget-setting changes were introduced.

## Finite-support separation

At the parent's subsequent request,
`FindimCounterexample/FiniteQuotientSeparation.lean` supplies the finite
quotient coefficient detection used by Corollary 5.15. Source searches
reused `LinearIndependent.comp`, `Fintype.linearIndependent_iff`,
`Finset.le_sup`, `Int.le_natAbs`, `Int.toNat_of_nonneg`, and
`Finset.sum_coe_sort`, all from the pinned imports already available.

* `eq_zero_of_bounded_sum f K hK h`: if every support index of the finitely
  supported vector `f : ℤ →₀ ZMod 2` has absolute value at most `K`, then
  the single quotient with modulus `2*K+1` detects it. A zero weighted
  sum in that quotient implies `f=0`.
* `eq_zero_of_all_sums f h`: if the weighted Laurent sum vanishes in every
  positive-modulus quotient, then `f=0`.
* `exists_nonzero_sum f hf`: every nonzero finite coefficient vector has
  nonzero weighted sum in some positive-modulus quotient.

The proof multiplies the zero sum by `t^K` and embeds the support into
`Fin (2*K+1)` by `N ↦ (N+K).toNat`; basis independence forces each support
coefficient to vanish. This is the report's support-width separation
argument with a specific symmetric bound and modulus. It covers empty
support, negative exponents, and all finite coefficient vectors. Choosing
an odd detecting modulus does not restrict Proposition 5.14, whose ring
construction and independence already cover every positive modulus.

The 77-line file passed
`lake build FindimCounterexample.FiniteQuotientSeparation` (exit 0,
15 seconds for the project module), with configured warnings-as-errors
and linters. Mathematical status: **AI-proved**, subject to the parent's
full-stage axiom audit and kernel replay. No extra dependency was built
or fetched for this file. It imports the stable coefficient-ring file;
the parent owns its root import and statement listing.

## Read-only plan for item 2: torus conjugation

At the parent's request, searched torus-action helpers while item 6 was
being checked. No item-2 Lean source was written by this subtask.
The following helper plan has status **plausible**, pending implementation.

The appropriate one-axis helper has statement

```text
{H : Type*} [Group H] (a : H) (s : ℤ → H) (k : ℤ)
(h : ∀ r, a * s r * a⁻¹ = s (r+k)) :
∀ n r : ℤ, a^n * s r * (a^n)⁻¹ = s (r+n*k).
```

`Int.induction_on`, `Data/Int/Init.lean:74`, has zero, successor indexed
by `n : ℕ`, and predecessor from `-n` to `-n-1`; generalize `r` during
induction. Derive the inverse-step identity from `h (r-k)` by conjugating
both sides with `a⁻¹`. Then `zpow_add_one` and `zpow_sub_one`,
`Algebra/Group/Basic.lean:796,805`, close the two induction steps.
`SemiconjBy.zpow_right`, `Algebra/Group/Semiconj/Basic.lean:47`, powers
the conjugated elements, **not** the conjugator, and does not directly
provide this parameter-shift result.

`MulAut.conj : H →* MulAut H`, `Algebra/Group/End.lean:724`, has exact
formula `a*x*a⁻¹`; `map_mul` turns product conjugation into successive
conjugations, and `map_commutatorElement` transports the zero-parameter
commutator relations. All these imports are cached.

For a torus homomorphism, the cached
`MonoidHom.noncommPiCoprod`, `GroupTheory/NoncommPiCoprod.lean:105`, takes
`ϕ : ∀ i, N i →* H` with pairwise commuting images and constructs
`(∀ i, N i) →* H`. Apply it to
`zpowersHom H (T i) : Multiplicative ℤ →* H`
(`Data/Int/Cast/Lemmas.lean:283`). `Commute.zpow_zpow` supplies commuting
images. `noncommPiCoprod_mulSingle`, line 120, evaluates standard-coordinate
vectors. Wrapping ordinary integer-coordinate functions with
`Multiplicative.ofAdd` yields `torus (n+n')=torus n*torus n'` and the
corresponding negation identity directly from the homomorphism laws.
If only conjugation is needed, the explicit three-factor product
`T 0 ^ n 0 * T 1 ^ n 1 * T 2 ^ n 2` avoids the noncommutative-product API:
apply the one-axis helper three times and identify the summed shifts with
the existing `weight`. `Fin.sum_univ_three` is the additive form of
`Fin.prod_univ_three`, `Algebra/BigOperators/Fin.lean:119`.

For the finite presentation's reconstructed root families, define
`U~i(r)=conj(Ti^(-r))(ui)`, `V~i(r)=conj(Ti^r)(vi)`, and
`W~ij(r)=conj(Ti^r)(wij)`. This gives the required one-step conjugations
without first formalising bases of the weight kernels. The relevant
cached APIs are `Commute.zpow_left`, `.zpow_right`, `.zpow_zpow`
(`Algebra/Group/Commute/Basic.lean:107–113`) and `.mul_zpow`
(`Algebra/Group/Commute/Defs.lean:184`). At the second index of `W`, use
commutation of `Ti,Tj` and of `Ti*Tj,wij` to derive
`conj(Tj)(wij)=conj(Ti⁻¹)(wij)`. A reusable orbit lemma is:

```text
Commute a b → conj b x = conj (a^k) x →
conj b (conj (a^r) x) = conj (a^(r+k)) x.
```

The remaining finite-presentation relators then follow by conjugating
their zero-parameter instances with the report's explicit vectors.
Use `Pi.single` vectors and the existing additive `weight` maps, avoiding
an enumeration of all integer parameters. For the two mixed `W` commuting
families, split only whether the other root index equals the remaining
endpoint of `W`; the two vector formulas then match the report verbatim.

## Item 2 implementation: generic torus helpers

After the next complete five-gate receipt (covering items 1, 3, 4, 5, 6),
the parent authorized implementation of the generic helpers. No source
was written during that gate run. New file `SelectionTorus.lean` contains:

* `conjugate_mul a b x`: conjugation by `a*b` is conjugation first by `b`
  and then by `a`, expressed directly in group operations.
* `conjugate_zpow_shift a s k h n r`: from the explicit relation
  `a*s(r)*a⁻¹=s(r+k)` for all integers `r`, derives
  `a^n*s(r)*(a^n)⁻¹=s(r+n*k)` for all integers `n,r`.
* `orbit_conjugate a b x k r hab h`: if `a,b` commute and conjugation by
  `b` moves the initial point `x` along its `a`-orbit by `k`, the same
  conjugation moves every orbit point by `k`.

The first theorem is associativity and inverse-of-product simplification;
the second uses the inspected integer induction principle with a separately
derived inverse step; the third uses `Commute.zpow_right` and `zpow_add`.
No action structure or additional presentation relation is assumed. The
helpers have explicit ordinary group hypotheses and will be instantiated
by the main implementation, not accepted as unproved interfaces.

`lake build FindimCounterexample.SelectionTorus` passed (exit 0, 8.8 seconds),
including the project's warnings-as-errors and standard linters. The file
has 54 lines; source and `.olean` were handed to all three implementing
agents. Mathematical status: **AI-proved**, pending final full-stage gates
and human review. No package or cache module needed to be fetched or built.

## Correspondence review of Corollary 5.15

Read-only separate-agent, same-model review of `SelectionDirectSum.lean`
and `SelectionIndependence.lean` against the full statement and proof of
`coro:z-independent`. Verdict: **no error found** in the checked scope.
This is a correspondence and proof-structure review, not a replacement
for the kernel checks, an independent-model review, or human certification.
The reviewer also implemented the coefficient-separation helper, so this
review is not independent of that part of the proof.

Reviewed SHA-256 hashes:

```text
14ce1850477407f62d887b86de0e2f21c1b98adc955b7ddadd62597575265d41  SelectionDirectSum.lean
11d1c3aceb80b680c50a69552e559c91afe95ecdd7d831cb32847c9c7720a673  SelectionIndependence.lean
bf78c36c52f3b031ff7b8026719a2a2420736b03b28695b7b6f9c1ca44d2cda5  FiniteQuotientSeparation.lean
```

These hashes agree with `lean/gates/stage3b-uncommitted/sources.sha256`
at review time, whose summary records zero exits for all five gates.
No Lean source was edited during the review.

Checked correspondence and dependencies:

1. The direct-sum domain is exactly `Multiplicative (ℤ →₀ ZMod 2)`;
   both generator formulae quantify over **all** `N : ℤ`. There is no
   nonnegative-index restriction or support-size bound in the main result.
2. `zCentral N` packages the existing `z N` using the already checked
   `z_mem_center N`. `cyclic` uses only `z_sq N` to descend the integer
   cyclic map through `ZMod 2`. Its value at one is explicitly checked.
3. `centralSubgroup` is the actual subgroup closure of `Set.range zCentral`
   **inside the full centre**. `centralProduct_range` checks equality with
   the map's range; `centralSubgroup_map` additionally identifies its image
   in `G` with `Subgroup.closure (Set.range z)`. No range-defined proxy is
   substituted without that comparison.
4. `pi_centralSum` computes the actual finite quotient image of every
   finitely supported integer-indexed vector. Its parameter is
   `coefficientSum`, definitionally the exact weighted Laurent sum used
   by the coefficient-separation theorem. `pi_cyclic` reduces only the
   two coefficients of `ZMod 2`, using the concrete `FiniteQuotients.pi_z`.
5. `centralSum_injective` applies every positive-modulus quotient to a
   putative kernel vector, uses injectivity of the `(0,4)` transvection
   parameter, and applies `eq_zero_of_all_sums`. Thus independence uses
   the constructed quotient maps and monic basis; it is not a premise.
6. `directSumEquiv` is a multiplicative equivalence onto the stated
   subgroup closure. `directSumEquiv_single` fixes the correspondence
   between its standard generator and `z_N`.
7. `center_not_finitelyGenerated` concerns the **whole centre**, not merely
   the generated subgroup. Assuming `Group.FG` gives a finite canonical
   integer module. Mathlib's Noetherian instance for finite modules over
   Noetherian rings, with `ℤ` supplied by the principal-ideal-ring import,
   permits `Module.Finite.of_injective` on `centralSum.toIntLinearMap`.
   `Module.finite_finsupp_iff` then contradicts the infinite index set and
   nontrivial coefficients. This is the required subgroup-inheritance
   argument, expressed through the injective map rather than an extra
   group-theoretic assumption. `center_not_fg` states the same result in
   the ambient-subgroup predicate `(Subgroup.center G).FG`.

No extra hypotheses, weakened quantifiers, hidden source-identification
assumptions, or unsupported final-centre inference were found. The proof
route through integer modules and the symmetric support bound is the
documented representation/proof departure only; the corollary's statement
is preserved.

## Correspondence review of Proposition 5.9

Read-only separate-agent, same-model review of the four finite-presentation
modules against the complete statement and proof of `prop:group-presentation`.
Verdict on the snapshot below: **no error found**. The reviewer authored
`SelectionTorus.lean`, used by this implementation, and therefore has
overlapping provenance. This is not an independent-model review or human
certification. The main equivalence module was being compiled by the parent;
the old gate receipt did not yet cover item 2, and this review does not claim
otherwise. Hashes were stable across two reads during the review.

```text
564efc8dfa17aea38afdb75cc83dabb264dd59700f510c21a8b5004e72238475  SelectionFinitePresentation.lean
e8faa7ed4efa092a94f5f3b6598633cbbd58211570dddbc7262b67f4db9f469b  SelectionFiniteOrbits.lean
9ce12273bce7468fdc91a525b46a6f2730e84218fea57fd0ef92dce6fe55980b  SelectionFiniteRelations.lean
e6f6b2b48ae606052e41521f8b8ee48bc9ea73f01f74231b478deb760da11a83  SelectionPresentation.lean
```

1. `Generator := Index ⊕ Root` has the three torus and twelve root
   generators, and `card_generator` states cardinality exactly fifteen.
   The finite relation index covers the torus commutators; `U0` squares;
   distinct-index `U0/U0`, `V0/V0`, `U0/V0` commutators; exactly the stated
   `W0/U0`, `W0/V0` commuting pairs; the two chain commutators; the `T_h/U0_i`
   and `T_h/V0_i` relations for `h≠i`; and the pair and third-index kernel
   relations for `W0_ij`. No `V0`-square, `W0`-square, same-type
   different-parameter, or `W0/W0` relation has been added. The third-index
   subtype `k≠i ∧ k≠j`, with `i,j,k : Fin 3`, is exactly the report's
   `{i,j,k}=I` condition.
2. `relations` is the actual finite range of these relator words, and `P`
   is its `PresentedGroup`; `relations_finite` certifies the finiteness.
   No quotient identification or intended isomorphism is built into `P`.
3. The reconstructed families use the report's inverse torus direction
   for `U` and positive direction for `V,W`. `family` and all action
   statements quantify over every integer. `torus_w_second` derives the
   negative shift from the pair-kernel relator; the positive and third
   shifts use only the corresponding stated relators.
4. `torus_conjugation` computes the complete integer weight for the ordered
   three-factor torus product. Each infinite root relation is obtained
   from its zero-parameter relation using the report's explicit vector:
   both mixed `W` cases split correctly between the other endpoint and
   the third index. The chain relations give parameter `r+s` on their
   required third root. `fromG` therefore uses the actual universal lift
   with every defining relation discharged, not a weakened relation list.
5. `toG` maps each torus generator to the identically indexed `T` and each
   finite root generator to its zero-parameter root. Its two extra kernel
   families are derived from the already constructed infinite conjugation
   relations. `toG_family` reconstructs every integer parameter, including
   the sign change needed for `U`.
6. `fromG_comp_toG` uses the finite presentation's generator extensionality;
   `toG_comp_fromG` uses the infinite presentation's generator extensionality
   for arbitrary root parameters. They have the actual identity homomorphisms
   as conclusions. `presentationEquiv` uses these two identities, and its
   torus and root-generator formulae specify the required images explicitly.
7. `finitelyPresented` states `Group.IsFinitelyPresented SelectionGroup.G`
   without hypotheses. The pinned Mathlib class has its genuine meaning:
   a surjection from a finite-rank free group whose kernel is finitely
   normally generated. The inspected `PresentedGroup` instance requires
   finite generators and a finite relation set, both supplied here, and
   `Group.IsFinitelyPresented.equiv` transfers it through `presentationEquiv`.
   No fallback existence-only formulation or conditional instance is used.

No statement mismatch, extra relator, missing integer cases, circular
presentation assumption, or finite-presentability gap was found in this
snapshot. The coordinate action proof replaces the report's explicit
kernel-basis discussion while retaining its groups, generators, relators,
maps, and conclusions. Later source changes require checking their diff
against this snapshot before reusing this review receipt.
