GPT-6 (Codex), effort unknown.

Stage 3c item 2 implementation record; status: AI-proved, Lean kernel typechecked.
The final combined five-gate receipt is the responsibility of the root job and
is recorded in `audit/15-lean-stage3c-codex.md`.

Pinned-source searches inspected `Idempotents/Karoubi.lean`, `Idempotents/Biproducts.lean`,
`Idempotents/FunctorExtension.lean`, `Triangulated/Pretriangulated.lean`, and the shift and
binary-biproduct APIs. Mathlib supplies `functorExtension₂`, its compatibility isomorphism
with `toKaroubi`, finite biproducts in Karoubi, and `Karoubi.decomposition`. It supplies
`Triangle.coyoneda_exact₂`, `coyoneda_exact₃`, and `coyoneda_exact₁` for the three Hom
exactness steps. No shift instance for Karoubi was found in the inspected files.

The implementation extends each integer shift using `functorExtension₂`, with comparison
isomorphisms for original objects and addition of shifts. The cone statement uses the
extended shift functor explicitly; it does not posit a triangulation of Karoubi.
Hom lifts from a formal summand `(P,p)` are constructed by replacing an underlying lift
`b` with `p ≫ b`. This supplies all three exactness statements from Mathlib's original
pretriangulated category axioms.

The compiled Karoubi, Biproducts and FunctorExtension dependencies were absent at the
initial cache inspection. The root agent prepared a private worktree-local Mathlib
copy and package override, and compiled the four missing pinned dependency modules
without writing the shared packages. An additional library detail was found during
compilation: `hasBinaryBiproducts_of_finite_biproducts` is a theorem rather than an
instance. `karoubi_hasBinaryBiproducts` registers that theorem for the Karoubi
envelope; this adds no hypothesis to the cone theorem.

## Declarations and informal readings

All declarations below are under `FindimCounterexample`.

| Declaration | Informal reading |
|---|---|
| `Stage3cKaroubi.karoubi_hasBinaryBiproducts` | Finite biproducts in the original preadditive category supply binary biproducts in its envelope. |
| `Stage3cKaroubi.shift n` | Apply the original degree-`n` shift to both the underlying object and its idempotent; on morphisms apply the original shift. |
| `Stage3cKaroubi.shift_obj_X`, `.shift_obj_p`, `.shift_map_f` | Definitional equalities identify the shifted underlying object, idempotent and morphism with their original-category shifts. |
| `Stage3cKaroubi.shift_additive` | Each extended shift is additive whenever the original shift is additive. |
| `Stage3cKaroubi.shiftToKaroubiIso n X` | The embedding of `X[n]` is isomorphic to the extended shift of the embedding of `X`. Its underlying maps are identities; both naturality directions are checked. |
| `Stage3cKaroubi.shiftToKaroubiIso_hom_f`, `.shiftToKaroubiIso_inv_f` | The underlying comparison maps are the identity of `X[n]`. |
| `Stage3cKaroubi.shiftToKaroubiIso_naturality`, `.shiftToKaroubiIso_inv_naturality` | Both directions of the comparison commute with shifted morphisms; the `[reassoc]` attribute generates the corresponding postcomposition lemmas. |
| `Stage3cKaroubi.shiftAddIso m n P` | First shifting the formal summand `P` by `m`, then by `n`, gives an object isomorphic to its shift by `m+n`. |
| `Stage3cKaroubi.lift_exact` | A Hom lift for every source in the original category supplies a Hom lift for every source in its envelope. |
| `Stage3cKaroubi.coyoneda_exact₂` | For a distinguished triangle, a map from any formal summand to the second object, killed by the second triangle map, factors through the first map. |
| `Stage3cKaroubi.coyoneda_exact₃` | A map to the third triangle object, killed by the boundary, factors through the second map. |
| `Stage3cKaroubi.coyoneda_exact₁` | A map to the shifted first object, killed by the shifted first map, factors through the boundary. |
| `Stage3cConeSplitting.nonempty_iso_of_hom_exact` | Hom injectivity, exactness and surjectivity give an actual biproduct isomorphism in a preadditive category. |
| `Stage3cConeSplitting.nonempty_iso_of_complementary_retracts` | For a four-term Hom-exact sequence, the complementary retracts to the first and last maps split its middle object. |
| `Stage3cConeSplitting.coneSplittingIso` | Lemma 6.6: a triangle map represented by the matrix identity on a common summand and zero on its complements has cone isomorphic to the target complement plus the shift of the source complement. |

The final type is:

```lean
noncomputable def coneSplittingIso [Pretriangulated C]
    (T : Triangle C) (hT : T ∈ distTriang C)
    {I A B : Karoubi C}
    (e1 : (toKaroubi C).obj T.obj₁ ≅ I ⊞ A)
    (e2 : (toKaroubi C).obj T.obj₂ ≅ I ⊞ B)
    (hf : e1.inv ≫ (toKaroubi C).map T.mor₁ ≫ e2.hom =
      biprod.fst ≫ biprod.inl) :
    (toKaroubi C).obj T.obj₃ ≅ B ⊞ (shift 1).obj A
```

The ambient instances are `Category C`, `Preadditive C`, `HasZeroObject C`,
`HasShift C ℤ` and additivity of each original shift, as required by Mathlib's
`Pretriangulated C`. The proof constructs a section of the complementary boundary
by Hom exactness, constructs a retraction by another exactness lift, and verifies
both inverse identities for the resulting biproduct maps. The general helper
theorems expose exactness as ordinary premises, but the final theorem obtains
all of them from the original distinguished triangle using the three checked
Karoubi exactness lemmas; none is assumed in the final statement.

## Correspondence and departures

- The formal theorem needs only a pretriangulated category. The report's
  stronger triangulated hypothesis implies it; no octahedral axiom is used.
- Integer shifts in the envelope are given by explicit additive endofunctors
  and comparison isomorphisms, not a new `HasShift` instance. This is a
  representation choice: the actual shifted object is `(X[n],p[n])`, and all
  comparison maps used by Lemma 6.6 and the odd-double construction are checked.
- No triangulated structure on the Karoubi envelope is assumed or constructed.
- The displayed matrix equation explicitly records the report's statement
  that the first triangle map is the identity on `I` and zero elsewhere.
- The final splitting is checked by constructing both inverse maps rather
  than invoking Yoneda to detect an isomorphism. The Hom-exactness argument
  and the resulting biproduct agree with the report.

## Checks and checkpoint

Both modules pass direct Lean compilation with the project flags
`-DautoImplicit=false -DwarningAsError=true -Dweak.linter.mathlibStandardSet=true`.
Both `.olean` files were emitted in the worktree's `.lake/build/lib/lean/` for
the root agent's integration. There are no remaining item-2 mathematical gaps.

Line counts at completion: `Stage3cKaroubi.lean`, 145 lines;
`Stage3cConeSplitting.lean`, 198 lines; total, 343 lines.

The implementation and this correspondence review used the same model and are
not an independent correspondence review or human certification. The five-gate
run on the integrated final sources remains necessary before final acceptance.
