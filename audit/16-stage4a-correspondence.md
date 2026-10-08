GPT-6 (Codex); effort unknown.

# Stage 4a correspondence check

Date: 2026-10-08. Status: **AI-proved, conditional**, for the correspondence
assessments below. This is a source-level, same-model adversarial check, not an
independent review or human certification. The reviewer implemented the Toda
and higher-obstruction files. The final five gates must cover the final sources;
this note does not replace them.

Compared `report/sections/02-preliminaries.tex` (Tate pairing and Toda
construction) and `report/sections/10-obstructions.tex` with the six Lean files
listed below. No mathematical correspondence error was found in this scope.
The initial boundary of the Corollary 10.3 factorisation lemma is recorded
below; the later source review at the end of this note checks the completed
application to the actual cone.

## Interface and composition

- `TateDuality.pairing` is a perfect bilinear pairing on actual shifted Hom
  spaces, with complementary degrees `a+b=-1`. The chosen orientation
  `H^a(X,Y) ≃ D H^b(Y,X)` is the equivalent pairing form in the report.
- `TateDuality.composition` reads exactly `⟨ζη,τ⟩=⟨ζ,ητ⟩`: Lean's
  `η.comp ζ` is the report's `ζη`, whereas `τ.comp η` is `ητ`. Each product
  includes Mathlib's specified shift-addition isomorphism.
- `naturality_target` is the ordinary target-naturality component of the
  approved natural pairing. Its dual map is precomposition by the unshifted
  map; the map in the first factor is shifted by degree `a`. Source
  naturality is derived from the composition field with a degree-zero map.
  This component does not add a Toda, composite-vanishing or Ext conclusion.
- `PolynomialSelfExtensions.basis`, `.basis_zero` and `.basis_mul` express
  the homogeneous basis, unit and multiplication of the approved graded
  algebra `k[τ]`. For `p>0` degree zero has the single basis vector `id`,
  so the scalar-endomorphism condition is encoded by the same approved
  algebra input. No cone profile is assumed.
- All additional multiplication and vanishing statements in the interface
  file are derived theorems. The exceptional source degrees `-1` for
  injectivity and `-3` for surjectivity of the degree-three generator are
  the correct ones. The generic negative bijectivity range `a < -p`
  pairs with the nonnegative degree `-1-p-a`.

## Genuine Toda construction

`Toda.DefiningSystem` has the report's maps `a : X[1] → C_g` and
`b : C_g → W`, with `a ≫ q = f[1]` and `i ≫ b = h`. It is constructed
data, not an assumed interface. `bracket` is the set of composites `a ≫ b`.
Mathlib Hom exactness gives nonemptiness when the two consecutive composites
vanish. `mem_bracket_iff` and `bracket_eq_coset` give the full indeterminacy
`h Hom(X[1],Z) + Hom(Y[1],W) f[1]`, not merely an upper bound.

`juggling` precomposes the lift by `u[1]`, exactly as report Lemma 2.2.
`bracket_eq_of_distinguished_cones` transports systems through a triangle
isomorphism fixing the first two objects, so the chosen cone does not change
the bracket. Every zero-target conclusion uses nonemptiness, rather than
inferring equality with `{0}` solely from the ambient space being zero.

## Theorem 10.4 and Corollary 10.5

The normalized chain is `s → s[-1] → s[-2] → s[p-2]`, with arrows `β`,
`β[-1]` and `τ[-2]`, including the displayed shift identifications.
Its bracket lies in `Hom(s[1],s[p-2])`, corresponding to `H^(p-3)`.

For `p=3`, the two consecutive composites lie in degrees `-2` and `2`.
The indeterminacy groups have degrees `-3` and `1`. Tate duality transfers
the hypotheses `H^1=H^2=H^4=0` to `H^-2=H^-3=H^-5=0`.
For nonzero `τ`, `right_factorization` produces `γ` in degree `-4` with
`γ[3] ∘ τ=β`, in the required order. The auxiliary bracket has target
`Hom(s[3][1],s[1])`, of degree `-3`, and its new consecutive composite has
degree `-5`. Juggling then supplies zero in the desired bracket, whose
indeterminacy vanishes. For `τ=0`, the proof uses the defining system with
`b=0`. There is no assumption of the desired bracket or composite vanishing.

For `p>3`, the polynomial basis forces `H^1`, `H^(p-1)` and `H^(p-3)`
to vanish, because each degree is strictly between zero and `p`.
Duality gives `H^-2=0`. These are exactly the groups needed for
definedness and the zero target. The combined Corollary 10.5 also derives
the degree-zero dimension and the three vanishings required in the `p=3`
case. Its conclusion permits arbitrary degree-`p` classes, which includes
the report's polynomial generator and follows from the same argument.

## Boundary of the Corollary 10.3 factorisation lemma

`beta_comp_eq_zero` has the correct composite and degrees: `γ` has degree
`-4`, `w` has degree `1`, so their product lies in `Hom(s,X[-3])`, and
precomposition by degree-three `τ` lands in degree zero. Its hypothesis
that `Hom(s,X[-3])` vanishes is a theorem hypothesis, not an interface field.
Nevertheless, this lemma alone is only the factorisation step of
Corollary 10.3. Claiming the full corollary requires supplying that vanishing
from Proposition 10.1 for the actual cone, then linking to Proposition 10.2.
No module-`Z` Ext assertion follows from this lemma; the §8 comparison
must remain an explicit recorded omission if it is not formalised.

## Source snapshot

The interface was under active development during this check. Its later
changes require review against the final source hashes. The other five
files were stable when read. SHA-256:

```text
033fd9d2eda96907803a9fdcc5039dee76aa2c40ceefbe762323948dd0b51e95  Stage4aInterface.lean
1fc25cc75a91b80991a0addd842ec111e398a134be78cbec9cca9d1495f4cbfa  Stage4aShift.lean
126a9d84add8e72e1adca48820999589acd400248cc9460b3a0b2e46c0a2618b  Stage4aToda.lean
c1a625062028786286a2150f5849be150aa76b53dbc73ff34a7fe53d8ecb18e2  Stage4aFactorization.lean
98174e2e2a2b351ff4c3aabfc2f443addc2bc7c5dab772e204b93b709f5a4746  Stage4aObstruction.lean
403eb092e2543af4cb23d9c26898420807e899ee760ef1ae0b5a1eb770f88896  Stage4aHigherObstruction.lean
```

## Follow-up: Proposition 10.1 and the rank clauses of 10.2--10.3

This follow-up on 2026-10-08 reviews `Stage4aCone.lean`,
`Stage4aRank.lean`, `Stage4aOneFactor.lean` and the added raw-composite
wrapper in `Stage4aFactorization.lean`. It is again a **same-model source
review**, not independent certification. The sign and degree assessments
below are **AI-proved as conditional mathematical arguments** from the
inspected definitions. No Lean process was run, and the worktree was not
modified during this follow-up.

Compilation boundary at this snapshot: the main job audit reports a previous
successful warning-as-error check for the rank development. This reviewer
does not have source-matched successful compilation evidence for the new
cone and one-factor files, so their Lean acceptance remains **pending**.
No `lean/gates/stage4a-uncommitted/` evidence directory was present when this
follow-up was written. Source review alone must not promote those files to
completed formalisation.

### Original triangle, normalization and indices

`deshiftTau s τ` is the preimage under the fully faithful shift by three of
`e.hom ≫ τ`, where `e : s[-3][3] ≅ s` is the shift counit. Thus the source
uses the original triangle `s[-3] → s → X`, and its first arrow is the
specified degree-three polynomial generator transported into that Hom space.
It is not an arbitrary map in the full-profile theorem.

Mathlib `Triangulated/TriangleShift.lean`, lines 44--52, multiplies **all
three** shifted triangle arrows by `(-1)^n`. For `n=3` the first two arrows
of the shifted triangle are `-t[3]` and `-i[3]`. The source's triangle
isomorphism has components `(e,-id,id)`:

- `(-t[3]) ≫ (-id) = t[3] = e.hom ≫ τ`;
- `(-i[3]) ≫ id = (-id) ≫ i[3]`;
- the normalized third arrow is defined as the shifted third arrow followed
  by `e.hom[1]`, so its square commutes without discarding its sign or its
  shift-commutation isomorphism.

Consequently the normalized triangle starts `s → s[3] → X[3]`, as required.
Its degree-`n` first action is `H^n → H^(n+3)`; it is surjective except at
`n=-3`. The action in degree `n+1` is injective except when `n+1=-1`.
The resulting exceptional normalized degrees are exactly `-3,-2`.
The code substitutes `n=a-3` and uses `X[3][a-3] ≅ X[a]`, giving exactly
the original exceptional degrees `a=0,1`. No reversal between `a+3` and
`a-3`, or lost odd-shift sign, was found.

### The two specified maps in Proposition 10.1

`oneCone_i_bijective` is the actual linear map
`x ↦ x ≫ i[0] : Hom(s,s[0]) → Hom(s,X[0])`. The shift-zero
isomorphisms identify it with the report's map induced by `i`.
Its neighboring groups have degrees `-3,-2`, which vanish by duality.

`oneCone_pi_bijective` uses the actual connecting map
`z ↦ z ≫ π[1]` followed by the canonical identification
`s[-3][1][1] ≅ s[-3][2]`. The additional target-shift identification is
`s[-3][2] ≅ s[-1]`, giving precisely the report's map `π[1]` into `H^-1`.
Mathlib `Triangulated/Yoneda.lean`, lines 68--72, gives this same connecting
map with no additional sign. The vanishing neighbors are `H^1,H^2`.

These two bijection lemmas and `oneCone_finrank` validly allow any first
arrow `t : s[-3] → s`: their arguments use only those four neighboring
vanishings. In contrast, `oneCone_subsingleton` and `oneCone_profile`
correctly require `t = deshiftTau s P.tau`. Their quantifiers therefore do
not claim the full two-degree profile for the zero first arrow.

### Rank, scalar comparison and scope

`Stage4aRank.oneFactor_rank` applies Hom exactness to the inverse rotation
of `F → s ⊕ s → X[1]`. Its first object is `X[1][-1]`, identified with
`X` by the shift unit. Its last object after suspension is identified with
`X[1]` by the shift counit. The preceding boundary contains the inverse
rotation's minus sign and the corresponding isomorphisms; its vanishing
follows from the actual shifted row map, since both components annihilate
the nonzero spanning class `β`. The proof does not assume this boundary
vanishing in its final one-factor application.

The nonzero row has rank one because its target has dimension one. Its
two-dimensional source comes from `Hom(s,s ⊕ s)`, with the actual biproduct
Hom equivalence. The injected one-dimensional `Hom(s,X)` then gives
`dim Hom(s,F)=2`. The explicit binary-biproduct instance is a choice of
the biproduct already available from Mathlib's `Pretriangulated` instance
(`Pretriangulated.lean`, line 562), not a new substantive interface premise.

`range_scalarDifference` identifies the image of `(c,d) ↦ (c-d) • v`
with `k ∙ v`, a statement stronger than the report's bound that the image
has dimension at most one. `scalarDifference_not_surjective` uses that
bound, not a claim that the rank is always one. In particular, `v=0` is
included, and both final one-factor theorems quantify over **every**
`v : s → F`.

The source's object `F` represents the report's object `Fs`; it is not a
bimodule or a tensor functor. In report Section 8 the actual comparison is
`δ^0(g,j)=F(g)v-vj`. When endomorphisms are scalars and the tensor functor
is linear, this has scalar-coordinate expression `(c-d)v`. The present
formalisation defines and studies that scalar-coordinate map. It does
**not** construct the tensor functor or formally identify an independently
constructed Section 8 comparison map with `scalarDifference`.
This boundary belongs in the recorded departure alongside the absent
conversion sequence, module `Z` and assertion `Ext¹(Z,Z) ≠ 0`.
No such Ext assertion is smuggled into the interface or a theorem premise.

The later `Cone.oneCone_composite_zero` now supplies the degree-minus-three
cone vanishing required by `beta_shift_comp_eq_zero`; it proves the two
raw composites in the exact form used by the rank lemma.
`one_factor_obstruction` derives them for every `β`, chooses a nonzero `β`
from the one-dimensional negative-one space for the rank calculation, and
obtains the scalar nonsurjectivity conclusion. Thus the **source-level**
gap recorded in the initial factorisation-only review is now closed for the
permitted triangle/rank part of Corollary 10.3. The Section 8 comparison
boundary remains. No other added premise or statement mismatch was found.

Follow-up source SHA-256 (all four hashes were unchanged on the final reread):

```text
12a839c5e3bf3b8d14e00d28d1560021d8ecee0ad42acc9a37fb200b2139a032  Stage4aCone.lean
e1f1f89e05c21a5e26ae5328b2fef2fc6af1a80a7706b7bc2263698ccc1069bb  Stage4aRank.lean
a54b10295af6e4882794847865db3c8d99430223c39c8dfc93d4f83e5526a0de  Stage4aOneFactor.lean
b210ac55d06b5339d677dbc04f8eb20787836a2f9aa5f3e4d7e9ada7f906f680  Stage4aFactorization.lean
```

## Final source reread: Theorem 10.4 and Corollary 10.5

The final source reread on 2026-10-08 compared the actual statements and
proofs in `Stage4aObstruction.lean` and `Stage4aHigherObstruction.lean`
with report Theorem 10.4, Corollary 10.5 and the complete Section 2 Toda
definition. It also reread the shift equivalence, the Toda nonemptiness and
coset proofs, cone independence, and the interface fields and factorisation
used here. **Verdict: AI-proved conditional correspondence; no missed
assumption or shifted-Toda mismatch found.** This remains a same-model
source assessment, including review of the reviewer's own Toda and higher
obstruction code. It is not an independent review. No builds or Lean-source
edits were made in this pass; final build and gate status belongs to the
main job report.

The exact target identification deserves emphasis. For generator degree
`p`, the theorem uses the chain
`s → s[-1] → s[-2] → s[p-2]`, with first arrow `β` and the other arrows
given by `shiftHomEquiv` applied to `β` and `τ`. The target of its bracket
is `Hom(s[1],s[p-2])`. The equivalence
`shiftHomEquiv s s 1 (p-3) (p-2)` identifies it with `H^(p-3)` and
preserves zero, since it is obtained by an additive shift and composition
with an isomorphism. At `p=3` this is the report's degree-zero target.
There is no silent replacement of the bracket by a zero operation.

The auxiliary bracket in the nonzero-`τ` branch is formed directly on the
**same chosen triangle** for the middle map, with first arrow
`γ[3] : s[3] → s[-1]`. Its target is
`Hom(s[3][1],s[1]) ≅ H^-3`. Thus the proof uses ordinary categorical
juggling with `u=τ : s → s[3]`; it does not need to assume a theorem
identifying brackets after shifting an entire distinguished triangle.
The equality `τ ≫ γ[3] = β` includes the same shift-addition identification
as the interface composition. This avoids an unaccounted odd-shift sign.

The main theorem quantifies over every chosen distinguished cone for the
middle map. Such a cone exists by Mathlib's `distinguished_cocone_triangle`;
it is not an additional existence hypothesis beyond `Pretriangulated`.
`bracket_eq_of_distinguished_cones` makes the set independent of that
choice. Inside the proof, the vanishing consecutive composites are derived,
the defining systems are supplied by exactness, and the coset law supplies
the singleton conclusion. In the `τ=0` branch the extension is actually
chosen to be zero. In the `τ≠0` branch a member of the zero-target auxiliary
bracket supplies zero in the desired bracket. Both branches therefore
include definedness, including when `β=0`.

For Theorem 10.4 the hypotheses on the object are its one-dimensional
degree-zero Hom space and the three positive-degree vanishings. These are
exactly the consequences of the report's nonprojective simple object with
scalar endomorphisms that its argument uses; no polynomial hypothesis is
added to this theorem. The theorem assumes only the degree-zero finite
dimensionality needed by that proof, which is included in the approved
Hom-finite ambient setting. In Corollary 10.5 the polynomial input derives
this finite dimensionality and all needed vanishings. The `p>3` branch
checks both consecutive composites (`H^-2` and `H^(p-1)`) before using
the zero target `H^(p-3)`. The conclusion for arbitrary degree-`p` classes
contains the report's generator case and does not impose nonzero `τ`.

Final reread SHA-256:

```text
664397fe3ae545026b766b9a2c51707be7fb0a32a6081e014cb18ddacce7ec3e  Stage4aInterface.lean
1fc25cc75a91b80991a0addd842ec111e398a134be78cbec9cca9d1495f4cbfa  Stage4aShift.lean
126a9d84add8e72e1adca48820999589acd400248cc9460b3a0b2e46c0a2618b  Stage4aToda.lean
98174e2e2a2b351ff4c3aabfc2f443addc2bc7c5dab772e204b93b709f5a4746  Stage4aObstruction.lean
403eb092e2543af4cb23d9c26898420807e899ee760ef1ae0b5a1eb770f88896  Stage4aHigherObstruction.lean
```
