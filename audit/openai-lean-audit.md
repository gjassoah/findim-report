# Audit of OpenAI's Lean challenge statements against the report

Written by Claude Sonnet 5.5 (round 2, 2026-10-09); re-read by Claude Opus 5.5 in a fresh session
(`audit/openai-lean-audit-review-opus.md`), whose nine corrections are applied below and marked 'Opus re-read'.
Status of everything below: reading of the statements and of the pinned Mathlib definitions by AI models;
nothing here is human verification.

## 1. Pinned sources

- Repository `https://github.com/openai/math`, local copy
  a local copy on an external drive, HEAD
  `fd4aeeb2ee4fc729c18d98444fed42fd0529eeeb` (2026-10-07, merge of PR #1), working tree clean.
  Currency against upstream was **not** checked (no `git ls-remote` made).
- Working copy for builds: a clone of the above outside the repository (same HEAD; deleted after round 2).
- Mathlib: `d13f23b723b8a846827a245b89c10fc7d3f11612` (from `lean/lake-manifest.json`), the revision pinned by
  OpenAI. Files read from `raw.githubusercontent.com` at that revision:
  `Mathlib/CategoryTheory/Abelian/Projective/Dimension.lean`
  (SHA-256 `e6b4f446868626f7db9172179ad0ef84a2d2296476aaa490a6b4730ec0f9d89b`),
  `Mathlib/RingTheory/Jacobson/Radical.lean`
  (SHA-256 `8ad12610f14e5843cea049b0242f10595cddc9a74c02e41c89209a8d4bd4f0db`).
- Toolchain pinned by OpenAI: `leanprover/lean4:v4.34.1`. The report's own Lean repository uses 4.33.1
  (Mathlib `0df444a3`), so the two formalisations do not share a Mathlib.
- Checksums (SHA-256, `lean/` of the pinned commit): see `lean/openai-comparator/pins.sha256`.

## 2. Encoding choices

Verdict scale: faithful / faithful with remark / stronger than the classical notion / not checked. Status of each
verdict: AI-proved where an argument is given, plausible otherwise.

### 2.1 `LittleFinitistic.lean`

| Choice | Verdict | Reasons |
|---|---|---|
| `littleFinitisticDimension A := ⨆ (M : ModuleCat.{u} A) (_ : Module.Finite A M) (_ : projectiveDimension M < ⊤), projectiveDimension M` in `WithBot ℕ∞` | faithful | Supremum of pd over finitely generated modules of finite pd. `WithBot ℕ∞` is a complete linear order, so `⨆` is the true supremum (empty inner suprema are `⊥`) and `= ⊤` is not a junk value (Opus re-read, checked in the Mathlib source). The zero module has value `⊥`, the bottom, which does not change a supremum equal to `⊤`. |
| Mathlib's `projectiveDimension` (pinned file) | faithful | `sInf {n | ∀ i, n < i → HasProjectiveDimensionLT X i}`, where `HasProjectiveDimensionLT X n` means `Ext^i(X, Y)` is a subsingleton for all `i ≥ n` and all `Y`, that is, pd X < n (Opus re-read: an earlier version said 'i > n'). Equal to the classical pd because `ModuleCat A` has enough projectives (the classical equivalence; not re-proved here). |
| `Module.Finite A M` | faithful | Finitely generated; for a finite-dimensional algebra this is the same as finite-dimensional. |
| Universe `u`: `A : Type u`, `M : ModuleCat.{u} A` | faithful | Finitely generated modules are essentially small, so restricting to the universe of `A` loses nothing. The theorem is stated for `A : Type`, `ModuleCat.{0} A`. |
| Left modules | faithful | `ModuleCat A` is the category of left `A`-modules; the report uses left modules (README §3), and its modules `N_m` are left modules. |
| Conclusion `littleFinitisticDimension A = ⊤` plus explicit `N_m` with `2m−2 ≤ pd N_m < ⊤` | faithful, and redundant by design | The explicit family already forces the supremum to be `⊤`. For `m = 1` the bound `0 ≤ pd` only says `N_1 ≠ 0`. `m` is positive, so `2*m-2` is an honest natural number. |
| `∃ (A : Type) (_ : Ring A) (_ : Algebra ℂ A), FiniteDimensional ℂ A ∧ …` | faithful | A finite-dimensional complex algebra (not assumed commutative). |
| Dependence on the formal algebra | not checked | The statement is existential; whether `SelectedOrdinaryAlgebra.A` is the algebra of the preprint or of the report was not examined. It does not matter for the meaning of the statement, only for the claim "this formalises that construction". |

### 2.2 `AuslanderReiten.lean`

| Choice | Verdict | Reasons |
|---|---|---|
| Field `K := FractionRing (MvPolynomial (Fin 3) (ZMod 2))` with `AlgebraicIndependent (ZMod 2) parameters` | faithful | `K = F₂(X₀,X₁,X₂)`, the field `F₂(q,H₁,H₂)` up to naming the variables. The independence clause is automatic and harmless. The statement is existential in the algebra, so which variable plays the role of `q`, `H₁`, `H₂` is immaterial. |
| `System` structure: carriers in `Type`, `Algebra K A`, `Module A Z`, `Module K Z`, `IsScalarTower K A Z` | faithful | An algebra with a module over it, compatible with the field action. `Algebra K A` makes `K` central, as for a `K`-algebra. |
| `FiniteDimensional F R`, `FiniteDimensional F Z` | faithful | Matches Theorem 9.17 (finite-dimensional algebra, finite-dimensional module). |
| `¬ Module.Projective R Z` | faithful | Left modules, as in the report. |
| `TotallyAcyclicWitness R Z` | faithful | Exact complex `P` of finitely generated projectives, indexed by `ℤ` with `d i : P_i → P_{i-1}` (`ChainComplex` over `ℤ`); exactness `range d_{i+1} = ker d_i` at every place; for **every** projective `Q : Type u` (not only finitely generated ones) and every `f : P_i → Q` with `f ∘ d_{i+1} = 0` there is `g` with `f = g ∘ d_i`, which is exactness of `Hom(P,Q)` at every place; and `Z ≅ coker(d_1)`, the cokernel of `P_1 → P_0`. This is the usual definition of a Gorenstein-projective module (a module that is a syzygy in a totally acyclic complex of projectives). Quantifying over all projective `Q` is the Enochs–Jenda formulation; since the `P_i` are finitely generated, `Hom(P_i, R^(I)) ≅ Hom(P_i, R)^(I)`, so it is equivalent to testing against `R` alone over any ring (Opus re-read; an earlier version called it stronger). The `Q` range is `Type u`; projectives in a higher universe are not tested, which is irrelevant here. |
| `Abelian.Ext (ModuleCat.of R Z) (ModuleCat.of R Z) i` and `… (ModuleCat.of R R) i` subsingleton for `i > 0` | faithful | `Ext^i(Z, Z) = 0` and `Ext^i(Z, R) = 0` with `R` the left regular module, hence `Ext^i(Z, Z ⊕ R) = 0` as in Theorem 9.17. `Subsingleton` of an additive group is vanishing. Subsingleton-ness does not depend on the universe parameter of `Ext` (`Ext.chgUniv` in the pinned Mathlib). Checked in the Mathlib source by the Opus re-read: the instance is `HasExt.{v} (ModuleCat.{v} R)` given `Small.{v} R`, and `Abelian.Ext X Y n` is `Hom(X, Y[n])` in the derived category, contravariant in `X`. The clause `Ext^i(Z, R) = 0` is implied by `TotallyAcyclicWitness`. |
| `Nonempty ((R ⧸ Ring.jacobson R) ≃ₐ[F] (Fin 8 → F))` | faithful | `Ring.jacobson R` is `Module.jacobson R R`, the intersection of the maximal left ideals, which is two-sided (instance in the pinned file); for a finite-dimensional algebra this is the radical. The quotient is `F⁸`, so there are eight simple modules, all one-dimensional, as in Theorem 9.17. |
| `(Ring.jacobson R)^4 ≠ ⊥` | extra | For `Ideal R` with `R` noncommutative, `^` is the power of the span of products, so this is the classical `J⁴ ≠ 0` (Opus re-read, source). Not part of Theorem 9.17; it records that the radical is not 4-nilpotent (a property from the AR preprint). Strengthens the formal statement; the report does not use it. |
| Field extension persistence | faithful | For every field `E` over `K` (any universe `v`) there is a module structure of `E ⊗_K R` on `E ⊗_K Z` with `(a⊗r)·(b⊗z) = ab ⊗ rz` (this pins the structure down uniquely, so "there exists" loses nothing), compatible with `E`, and `Conclusions E (E ⊗ R) (E ⊗ Z)` holds. This is the last sentence of Theorem 9.17, for fields of every size. |
| What the statement does not say | gap | The algebra is not required to be the algebra `Λ = [[E,0],[F,E]]` of the report: the statement is existential. Consequently it supports "a counterexample of the type of Theorem 9.17 exists", not "the report's `Λ` and `Z` are such a counterexample". |

### 2.3 `Tachikawa.lean`

| Choice | Verdict | Reasons |
|---|---|---|
| `k := FractionRing (MvPolynomial (Fin 3) (ZMod 2))` | faithful | As above. |
| `SymmetricOver K A := ∃ e : A ≃ₗ[K] Module.Dual K A, (∀ a b c, e (a*b) c = e b (c*a)) ∧ (∀ a b c, e (a*b) c = e a (b*c))` | faithful (short argument) | Put `φ = e(1)`. The second condition with `a = 1` gives `e(b)(c) = φ(bc)`; so `e` is the form `(x,y) ↦ φ(xy)`, and since `e` is bijective this form is nondegenerate. The first condition with `b = 1` gives `φ(ac) = φ(ca)`. Conversely, if `φ` is a symmetric linear form with nondegenerate `(x,y) ↦ φ(xy)` then `e = φ(x·)` satisfies both conditions. So the condition is exactly "symmetric algebra" (Frobenius algebra with a symmetric Frobenius form). |
| `Module.Finite k A`, `Module.Finite k M` | faithful | Finite-dimensional over `k`. |
| Module structures `Module A M`, `Module k M`, `IsScalarTower k A M` | faithful | Left `A`-modules with compatible `k`-action. |
| `¬ Module.Projective A M`, `∀ n > 0, Subsingleton (Ext^n (M, M))` | faithful | Tachikawa's second conjecture for a finite-dimensional self-injective algebra; symmetric algebras are self-injective. |
| Scope | remark | The statement agrees with Theorem 1.1 of the companion preprint as paraphrased in the report's Appendix C (the preprint itself was not compared). The report does not prove or use it (Appendix C). |

## 3. Correspondence with the report

| Formal statement | Report result | What it covers | What it does not cover |
|---|---|---|---|
| `OAI.LittleFinitistic.Main.exists_counterexample` | Corollary 7.4 | Existence of a finite-dimensional complex algebra `A` with `findim A = ∞` and, for every `m ≥ 1`, a finitely generated left module `N_m` with `2m−2 ≤ pd N_m < ∞`. This is the numerical content of Corollary 7.4. | The structure `A = Δ ⋉ X`, the bound on the global dimension of `Δ`, the count `3(l+2)` of simple modules; Theorem 7.3 (general selection data); every intermediate result of Sections 4–6. Whether the formal `A` is the algebra of the report was not checked. |
| `OAI.ArExplicit.Statement.main` | Theorem 9.17 | Existence of a finite-dimensional algebra `Λ` over `F₂(q,H₁,H₂)` with `Λ/rad ≅ F⁸` and a finite-dimensional nonprojective Gorenstein-projective `Z` with `Ext^i(Z, Z⊕Λ) = 0` for all `i ≥ 1`, with the same after every field extension. | That the report's `Λ`, `Z` (Theorem 8.4, Proposition 9.16) are such; Theorem 8.4 (conversion principle); Section 9's ingredients. Corollary 9.18 is not among the challenge statements: it uses Theorem 3.7, which the report's Lean repository does not formalise (it has Proposition 3.1 and Theorem 3.3) and which is not among OpenAI's three challenges (OpenAI's `OAI` sources were not searched for it), and a count of indecomposable summands. |
| (same, with Theorem 3.7 on paper) | Corollary 9.18 | Theorem 3.7 applied to `Λ ⊕ Z'` gives infinite little finitistic dimension of `End_Λ(Λ ⊕ Z')`; so the formal statement supports Corollary 9.18 on paper through the existential `Λ`. The extension-of-scalars input (Theorem 9.17 over every field containing `K`) is part of the formal statement. | The step through Theorem 3.7 and the count of nine simple modules are on paper only. |
| `OAI.Tachikawa.main_theorem` | Appendix C (not a numbered result; Theorem 1.1 of the companion preprint) | A finite-dimensional symmetric algebra over `k` with a finite-dimensional nonprojective module `M` with vanishing positive self-extensions. Since `A` is self-injective, `Ext^i(M, A) = 0` automatically, so Theorem 3.7 applies on paper and gives infinite little finitistic dimension of `End_A(A ⊕ M)`. | Nothing of Section 9 is used by this statement. The formal statement says nothing about `End_A(A ⊕ M)`, dominant dimension or the simple `Γ`-module of the preprint (Corollary 1.2(2) there). |
| `OAI.LittleFinitistic.littleFinitisticDimension` vs report's `findim` | Definition in §1 | Both are the supremum of the projective dimensions of the finitely generated modules of finite projective dimension. | The report restricts to finite-dimensional algebras; the formal definition is for any ring. |

Theorem 3.7 and Corollary 9.18 are therefore *not* verified by any formal statement examined in this audit; the three
OpenAI statements formalise the existence results that these rely on or run parallel to.

Definitions in the challenge files. The challenge files define `littleFinitisticDimension`, `TotallyAcyclicWitness`,
`Conclusions`, `SymmetricOver` and so on themselves, and the configurations have `definition_names: []` (no
definition holes). By Comparator's README (pinned commit `d03acab1`), a successful run guarantees that the listed
theorems of the solution prove the same statement as in the challenge module, so these definitions are the
challenge's, which is what this audit reads. This rests on Comparator's documented behaviour, not on a reading
of its source (Opus re-read point 9).

## 4. What was run and what was not

| Item | Result |
|---|---|
| Pinning, checksums | done (section 1, `lean/openai-comparator/pins.sha256`) |
| Reading of the three statements and of Mathlib's `projectiveDimension` and `Ring.jacobson` at the pinned revision | done (this file) |
| Comparator for the three challenges | **not run.** Gustavo decided on 2026-10-09 not to run it (little gain for human understanding); before that it was blocked because the pinned toolchain (Lean 4.34.1) and the tools `comparator`, `landrun` and `lean4export` were not installed on the machine used. A run needs the Mathlib sources and cache; OpenAI's lakefile requires 43 packages, which is why `tools/round2-comparator.sh` builds a minimal project with only the needed modules. Pins of the tools: `notes/round2/pkgbuilds.md`. |
| Independent kernel replay (`lean4checker`, `nanoda`) | **not run**, same reason. OpenAI's configurations set `enable_nanoda` to `false`, so Comparator alone would rely on Lean's own kernel through `lean4export` and the sandboxed build. `leanchecker` ships with the Lean release and would be the natural replay once the toolchain is available. |
| Whether the sources in `OAI/Algebra/{Finitistic,AuslanderReiten}`, `OAI/RingTheory/Tachikawa` are free of `sorry`/axioms | text scan only (Claude Opus 5.5, 2026-10-09): no `sorry`, no `axiom` declarations, no `native_decide` in the three trees; the two hits for `admit` are English words in comments. A text scan is not a check of the proofs |
| Fourth related challenge `FinitisticAsymmetry` (SHA-256 `64ea38db…`; the corollary on extreme left–right asymmetry of the main preprint, `build/sections/01-introduction.tex`, not treated in the report) | not examined |

Consequence: this audit establishes how the statements read, not that OpenAI's proofs check. The formal proofs
are OpenAI's claim; the report does not rely on them.

## 5. Verdict

- The three statements are faithful encodings of the classical statements, with the remarks above: the
  AR statement is stronger than Theorem 9.17 in one respect (the extra `rad^4 ≠ 0`) and weaker in one
  (existential in the algebra); the Tachikawa symmetric condition is equivalent to the classical
  one; left modules throughout. Status of this verdict: plausible (AI reading by two models; Mathlib definitions checked in the pinned source).
- They support Corollary 7.4 (numerical content), Theorem 9.17 (as an existence statement) and, with Theorem 3.7
  on paper, Corollary 9.18; they do not formalise Theorem 3.7.
- Consequence for Appendix B: the claim that a complete formalisation of either construction is infeasible
  should be qualified (OpenAI's repository contains such formalisations, whose proofs were not run here).
