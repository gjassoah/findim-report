# Review of `audit/openai-lean-audit.md`

Reviewer: Claude Opus 5.5, fresh session, 2026-10-09. Status: AI reading by one model; nothing here is human
verification.

Sources read: the audit; the six challenge files (`LittleFinitistic`, `AuslanderReiten`, `Tachikawa`, `.lean` and
`.json`, copied once from the drive); Mathlib at `d13f23b7` (SHA-256 of `Dimension.lean` and `Radical.lean`
re-fetched and matching the audit's values); report `03-criteria.tex`, `07-simulation.tex` (Theorem 7.3,
Corollary 7.4), `09-ar-counterexample.tex` (Theorem 9.17, Corollary 9.18), `A3-companion.tex`.

Tags: **[src]** = checked in the Mathlib source at the pinned revision; **[recall]** = from memory, not checked
in source; **[paper]** = mathematical argument done here.

Numbering check: the counters are shared with displayed equations, so `thm:ar-to-findim` is Theorem 3.7,
`thm:strong-nakayama` is Theorem 3.3, `prop:fibre` is Proposition 9.16, `thm:ar-counterexample` is Theorem 9.17
and `coro:ar-findim` is Corollary 9.18, `coro:main` is Corollary 7.4. The audit's references are consistent with this.

## 1. LittleFinitistic

### 1.1 Definition of `littleFinitisticDimension` (sup in `WithBot ℕ∞`, zero module) — AGREE, with an addition

- [src] `Mathlib/Data/ENat/Lattice.lean` gives `CompleteLinearOrder (WithBot ENat)` (via
  `WithBot.WithTop.completeLinearOrder`, whose `isLUB_sSup` is proved in
  `Order/ConditionallyCompleteLattice/Basic.lean`). So `⨆` is the genuine least upper bound and a supremum over
  an empty index (the `(_ : Module.Finite A M)` / `(_ : pd < ⊤)` binders when false) is `⊥`. The definition is
  therefore not a junk-value definition: it is `sup {pd M : M f.g., pd M < ∞}`, with `⊥` contributions ignored.
  The audit did not check this; it should be stated, because a `ConditionallyComplete` instance with a junk
  `sSup ∅` could have made `= ⊤` trivial.
- [src] `projectiveDimension_eq_bot_iff`: `pd X = ⊥ ↔ IsZero X`; `projectiveDimension_ge_zero_iff`:
  `0 ≤ pd X ↔ ¬ IsZero X`. The audit's treatment of the zero module and of `m = 1` is correct.

### 1.2 Mathlib's `projectiveDimension` — AGREE, with one off-by-one correction

- [src] `HasProjectiveDimensionLT X n` is `∀ i ≥ n, ∀ Y, Subsingleton (Ext X Y i)` (Ext taken with
  `HasExt.standard`, universe `max u v`, so no instance choice is involved). It means **pd X < n**, i.e. vanishing
  for `i ≥ n`. The audit writes "this is the usual condition `Ext^i(X,-) = 0` for `i > n`", which is
  `HasProjectiveDimensionLE X n`, not `…LT X n`. Wording error; the conclusion is unaffected.
- [src] `projectiveDimension X = sInf {n | ∀ i : ℕ, n < i → HasProjectiveDimensionLT X i}`;
  `projectiveDimension_le_iff`: `pd X ≤ n ↔ HasProjectiveDimensionLE X n`. So `pd X ≤ n` iff
  `Ext^i(X,-) = 0` for all `i ≥ n+1`, which is the classical pd once Mathlib's Ext is identified with the
  classical Ext ([recall]; standard for module categories with enough projectives).

### 1.3 `Module.Finite A M` — AGREE (remark)

Finitely generated. "Same as finite-dimensional" requires restricting scalars along `ℂ → A`: objects of
`ModuleCat.{0} A` carry no `ℂ`-module structure of their own. Harmless.

### 1.4 Universe — AGREE

Every finitely generated module is a quotient of some `A^n : Type u`, so `ModuleCat.{u} A` contains all of them
up to isomorphism, and pd computed in `ModuleCat.{u} A` is the classical one (syzygies stay in `Type u`). The
theorem uses `u = 0`.

### 1.5 Left modules — AGREE [recall]

`ModuleCat R` bundles `Module R M`, a left action. Theorem 7.3 speaks of "left A-modules"; Corollary 7.4
inherits this. I could not read README §3 or §1 (outside my allowed files), so the claim "the report uses
left modules (README §3)" is checked only against Sections 3, 7 and 9, which are consistent with it.

### 1.6 Conclusion with explicit `N_m` — AGREE

The family forces `⨆ = ⊤` (unbounded natural values in `WithBot ℕ∞`). `2*m-2` is truncated subtraction but
`m ≥ 1`. Matches Corollary 7.4's "for every `m ≥ 1` some finite-dimensional `N_m` with `2m−2 ≤ pd N_m < ∞`".

### 1.7 `∃ A, Ring A, Algebra ℂ A, FiniteDimensional ℂ A` — AGREE

### 1.8 Imports — (not in audit) OK

[src] All five imports of `LittleFinitistic.lean` exist at `d13f23b7` (including `Mathlib/Basic/Complex/Basic.lean`).
Compilation itself was not checked (no toolchain).

## 2. AuslanderReiten

### 2.1 Field `K` and `AlgebraicIndependent` clause — AGREE

### 2.2 `System` — AGREE

`Algebra K A` makes the image of `K` central ([recall] `Algebra.commutes'`). `IsScalarTower K A Z` forces the
`K`-action on `Z` to be restriction along `algebraMap`, so the `K`-structure on `Z` is not extra data.

### 2.3 `FiniteDimensional`, `¬ Module.Projective` — AGREE

[src] `Module.Projective R P` (Semiring `R`, no commutativity) is the existence of a section of
`Finsupp.linearCombination R id : (P →₀ R) → P`, the usual definition.

### 2.4 `TotallyAcyclicWitness` — AGREE that it encodes Gorenstein-projectivity; DISAGREE with "stronger"

- [src] `ChainComplex V ℤ = HomologicalComplex V (ComplexShape.down ℤ)`, with `Rel i j ↔ j + 1 = i`. Hence
  `P.d (i+1) i : P_{i+1} → P_i` and `P.d i (i-1) : P_i → P_{i-1}` are genuine differentials (the relation holds,
  so they are not forced to be zero by `shape`). `d ∘ d = 0` is part of the structure.
- Clause 2 is exactness at every `i`. Clause 3 is exactness of `Hom_R(P, Q)` at `Hom(P_i, Q)` for every `i` and
  every projective `Q : Type u`. Clause 4 is `Z ≅ coker(P_1 → P_0)`. Together: `Z` is a syzygy in a totally
  acyclic complex of finitely generated projectives, i.e. totally reflexive / Gorenstein-projective.
- [paper] Quantifying over all projective `Q` is **equivalent**, not stronger, over any ring, because each
  `P_i` is finitely generated: `Hom(P_i, R^(I)) ≅ Hom(P_i, R)^(I)`, so exactness of `Hom(P, R)` gives exactness
  of `Hom(P, R^(I))` and of its summands; conversely `Q = R` is allowed (`R : Type u`). The audit's table says
  "equivalent ... over a finite-dimensional algebra ... and in any case it asks more", and §5 lists "all
  projective `Q`" as a respect in which the statement is stronger than Theorem 9.17. That should be corrected:
  the clause is equivalent to the `Hom(-,R)` condition. If anything is "stronger" it is the requirement that the
  complete resolution consist of finitely generated projectives, which for finitely generated modules over a
  finite-dimensional algebra is again equivalent to Enochs–Jenda Gorenstein-projectivity ([recall],
  Avramov–Martsinkovsky / Christensen).
- Degenerate cases: `P = 0` forces `Z = 0`, which is projective, excluded by `¬ Module.Projective`.

### 2.5 Ext vanishing via `Subsingleton` — AGREE; upgrade from "plausible" to checked

- [src] `Mathlib/Algebra/Category/ModuleCat/Ext/HasExt.lean`:
  `instance [Small.{v} R] : HasExt.{v} (ModuleCat.{v} R)`. Here `R : Type u` and the modules are in
  `ModuleCat.{u} R`, so this instance applies and `Ext` lives in `Type u`. `HasExt` is a `Prop` (an `abbrev` for
  a smallness condition), so there is no instance-data ambiguity.
- [src] `Abelian.Ext X Y n` is `SmallShiftedHom` from `single X` to `(single Y)[n]` in the derived category, so
  it is contravariant in `X`: `Ext (of R Z) (of R R) i` is `Ext^i_R(Z, R)`, the correct direction. `Ext.chgUniv`
  is an `Equiv` between the universe variants, so subsingleton-ness is universe-independent.
- `ModuleCat.of R R` is the left regular module ([recall], `Semiring.toModule`).
- (Not in audit) [paper] The clause `Ext^i(Z, R) = 0` is implied by `TotallyAcyclicWitness`: a Gorenstein-
  projective module has `Ext^{≥1}(Z, Q) = 0` for projective `Q`. Redundant, not wrong.

### 2.6 `Ring.jacobson` and `R ⧸ J ≃ₐ[F] (Fin 8 → F)` — AGREE

- [src] `Ring.jacobson R := Module.jacobson R R = sInf {coatoms of Submodule R R}`, the intersection of maximal
  left ideals; `instance : (jacobson R).IsTwoSided` is in the file. For a finite-dimensional algebra this is the
  radical ([recall]).
- [paper] For a finite-dimensional `F`-algebra, `R/J ≅ F^8` as `F`-algebras iff there are exactly eight
  isomorphism classes of simple modules, each one-dimensional (Wedderburn: each simple of dimension 1 gives a
  factor `M_1(F) = F`). The `≃ₐ[F]` requirement is not stronger than a ring isomorphism here. It also forces
  `R ≠ 0`.

### 2.7 `(Ring.jacobson R)^4 ≠ ⊥` — AGREE ("extra")

[src] `Mathlib/Algebra/Algebra/Operations.lean`: for `Submodule R A` with only `IsScalarTower R A A` (so
`Ideal R` with `R` noncommutative), `Mul` is `M • N` (span of products) and `Pow` is `npowRec`, with `1` a left
identity. So `J^4` is the classical fourth power of the two-sided ideal `J`. An extra conjunct cannot weaken the
statement. The claim that it is "a property from the AR preprint" I could not check.

### 2.8 Field-extension clause — AGREE

- [src] `Algebra.TensorProduct.instRing : Ring (A ⊗[R] B)` needs `[Ring A] [Semiring B]` only;
  `Algebra.TensorProduct.leftAlgebra : Algebra S (A ⊗[R] B)` needs `S` commutative and an `S`-algebra structure on
  the **left** factor, with `B` an arbitrary semiring. Here the left factor is the field `E`, so both instances
  exist for noncommutative `A`. `Module E (E ⊗[K] Z)` is `TensorProduct.leftModule` ([recall]).
- [paper] Uniqueness: a `Module` structure is biadditive, and pure tensors generate `E ⊗ A` and `E ⊗ Z` additively,
  so the formula `(a⊗r)·(b⊗z) = ab ⊗ rz` determines the action; `IsScalarTower` is a `Prop`. So "there exists" loses
  nothing, as the audit says. The `letI` makes the existential action the one used inside `Conclusions`
  (local instances take precedence).
- `E` ranges over all fields with `Algebra K E` (necessarily an extension) in every universe `v`; `main` is
  universe-polymorphic. Matches "after extending scalars to any field containing `k`".

### 2.9 Vacuity / trivial satisfiability — no problem found

`R/J ≅ F^8` excludes degenerate `R`; `¬ Projective Z` excludes `Z = 0` and "projective in disguise"; the
`K`-structures are forced by the towers; `Ext` and `pd` are the genuine notions. I found no route to a trivial
proof. (Whether the file compiles and whether OpenAI's proof checks was not tested by anyone.)

### 2.10 "What the statement does not say" — AGREE

## 3. Tachikawa

### 3.1 `SymmetricOver` — AGREE; the audit's argument is correct

[paper] Condition (ii) with `a = 1` gives `e(b)(c) = φ(bc)` for `φ = e(1)`; condition (i) with `b = 1` gives
`φ(ac) = φ(ca)`. Conversely, `e(x) = φ(x·)` satisfies (ii) trivially and (i) by `φ((ab)c) = φ(b(ca))`, which is
symmetry applied to `x = a`, `y = bc`. Cleaner reading: with `D A` the bimodule `(a·f·b)(x) = f(bxa)`, (i) says
`e(ab) = a·e(b)` and (ii) says `e(ab) = e(a)·b`; so `SymmetricOver` says exactly that `e` is an `A`-`A`-bimodule
isomorphism `A ≅ D A`, the textbook definition.
- Linearity of `e` is automatic in the converse (`K` is central and `φ` is linear). Bijectivity of `e` is
  nondegeneracy of `(x,y) ↦ φ(xy)` in the first variable; in finite dimension (and by symmetry) this is
  two-sided nondegeneracy. Equivalently: a nondegenerate symmetric associative bilinear form
  `β(ab,c) = β(a,bc)`, `β(a,b) = β(b,a)`, via `β(x,y) = φ(xy)`.
- [src] `Module.Dual R M` is an `abbrev` for `M →ₗ[R] R`. Note that `A ≃ₗ[K] Dual K A` already forces finite
  dimension (dual of an infinite-dimensional space is larger), so `Module.Finite k A` is redundant but harmless.

### 3.2 `Module.Finite`, module structures, `¬ Projective`, Ext — AGREE

Same `HasExt` instance as in 2.5 ([src]); `A M : Type`, so `Ext` is in `Type`.

### 3.3 Scope "exactly Theorem 1.1 of the companion preprint" — AGREE only against Appendix C's paraphrase

I could not read the preprint. Appendix C paraphrases Theorem 1.1 as "finite-dimensional symmetric algebra `A`
over `F₂(q,H₁,H₂)` and a nonprojective module `M` with `Ext^i(M,M) = 0` for `i > 0`"; the formal statement adds
`M` finite-dimensional (the usual convention). "Exactly" should be "matches Appendix C's description".

## 4. Correspondence table

### 4.1 LittleFinitistic ↔ Corollary 7.4 — AGREE

### 4.2 AR ↔ Theorem 9.17 — AGREE, with two corrections to the "does not cover" column

- "Theorem 3.7 (not formalised in either repository; the report's Lean repository has Theorem 3.3 only)":
  (a) Remark 3.2 states that Proposition 3.1 is also formally verified, so "Theorem 3.3 only" is inaccurate as
  stated (I could not inspect the report's Lean repository itself; the absence of a "formally verified" remark
  after Theorem 3.7, unlike after 3.1 and 3.3, supports "Theorem 3.7 not formalised there");
  (b) the audit read only OpenAI's challenge files, not `OAI/...` sources, so "not formalised in either
  repository" is unsupported for OpenAI's repository. Appendix C says the Tachikawa preprint derives infinite
  little left finitistic dimension of `Γ` (via dominant dimension); such a consequence might be formalised in
  `OAI/RingTheory/Tachikawa`. Correct to: "not among the three challenge statements; OpenAI's sources not inspected".

### 4.3 Corollary 9.18 row — AGREE, with a clarification

The input to the extension-of-scalars sentence (Theorem 9.17 over every `E ⊇ K`) **is** formal; only the step
through Theorem 3.7 and the count of nine simples (`R/J ≅ F^8` gives a basic algebra with eight simples, plus
one for `Z'`) is on paper. The audit's "on paper only" is right for the conclusion but should say so.

### 4.4 Tachikawa ↔ Appendix C, and "Ext^i(M, A) = 0 automatically" — AGREE

[paper] A symmetric algebra is self-injective: the bimodule isomorphism `A ≅ D A` restricts to a left-module
isomorphism, and `D A = Hom_k(A_A, k)` is an injective left module. So `Ext^{≥1}_A(M, A) = 0` for every `M`, hence
`Ext^{≥1}(M, M ⊕ A) = 0` by additivity; `M` is nonprojective and finite-dimensional. All hypotheses of Theorem 3.7
hold, giving infinite (left) little finitistic dimension of `End_A(A ⊕ M)`, as Appendix C says. Side conventions
agree: Theorem 3.7 is about (left) `Λ`-modules and the formal `M` is a left module.

### 4.5 `littleFinitisticDimension` vs report's `findim` (§1) — UNSURE

§1 is outside the files I may read. Indirect support: the proof of Theorem 7.3 ends "every finite-dimensional
`A`-module is finitely generated", which indicates `findim` is over finitely generated modules.

## 5. Other points

- §4 of the audit ("not run") and the `enable_nanoda: false` remark: AGREE (configs read). (Not in audit,
  UNSURE) The configs have `definition_names: []`; the challenge files define `littleFinitisticDimension`,
  `TotallyAcyclicWitness`, `Conclusions`, `System`, `FullStatement`, `SymmetricOver`, `Counterexample` themselves.
  The audit does not say how Comparator ensures that the solution modules use these same definitions (I believe
  Comparator compares the statement's transitive dependencies between challenge and solution, [recall], not
  checked). This matters for reading the formal results as the statements audited.
- §5 bullet on Appendix B: not reviewed (Appendix B not in my file list).
- Characteristic/field: both `K` and `k` are `FractionRing (MvPolynomial (Fin 3) (ZMod 2))`, characteristic 2,
  matching the report's `F₂(q,H₁,H₂)`. No issue.

## 6. Corrections to the audit

1. §2.1 row 2: `HasProjectiveDimensionLT X n` is vanishing of `Ext^i(X,-)` for `i ≥ n` (pd < n), not `i > n`.
2. §2.1 row 1: add that `WithBot ℕ∞` has a `CompleteLinearOrder` instance [src], so `⨆` is the true supremum and
   empty sub-suprema are `⊥`; the definition is not a junk value.
3. §2.2 `TotallyAcyclicWitness` and §5: quantifying over all projective `Q` is equivalent (over any ring, since
   the `P_i` are finitely generated) to the `Hom(-,R)` condition; remove "stronger ... (all projective `Q`)".
4. §2.2 Ext row: the `HasExt` instance, the direction and the universe independence are now checked in source
   ([src] `ModuleCat/Ext/HasExt.lean`, `DerivedCategory/Ext/Basic.lean`); and the `Ext(Z,R)` clause is redundant
   given `TotallyAcyclicWitness`.
5. §2.2 `rad^4` row: `^` on `Ideal R` for noncommutative `R` is checked [src] to be the classical power.
6. §3 table, AR row: "the report's Lean repository has Theorem 3.3 only" contradicts Remark 3.2 (Prop. 3.1 is
   also formalised); "not formalised in either repository" is unsupported for OpenAI's repository, whose
   sources were not read.
7. §3 table, Cor. 9.18 row: the extension-of-scalars input is formal; only Theorem 3.7 and the simple count are on paper.
8. §2.3 Scope row: "exactly Theorem 1.1" is checked only against Appendix C's paraphrase.
9. Add: how Comparator ties the challenge-file definitions to the solution's (`definition_names: []`) is not
   discussed.
