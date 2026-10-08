/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import Mathlib.CategoryTheory.Triangulated.Pretriangulated

/-!
# Stage 4a: Toda brackets from distinguished triangles

This is the defining-system construction in report §2.2. For a specified distinguished triangle
`Y ⟶ Z ⟶ C ⟶ Y[1]`, the bracket consists of composites `X[1] ⟶ C ⟶ W` whose two outer
squares commute. Composition is written in Lean's left-to-right order. Nonemptiness, the coset
law and juggling are consequences of Mathlib's pretriangulated axioms, not interface fields.
-/

open CategoryTheory CategoryTheory.Category CategoryTheory.Pretriangulated CategoryTheory.Limits

namespace FindimCounterexample.Stage4a.Toda

universe v u

variable {C : Type u} [Category.{v} C] [HasZeroObject C] [Preadditive C]
  [HasShift C ℤ] [∀ n : ℤ, Functor.Additive (shiftFunctor C n)] [Pretriangulated C]

variable (T : Triangle C) {X W : C} (f : X ⟶ T.obj₁) (h : T.obj₂ ⟶ W)

/-- A defining system for `⟨h,T.mor₁,f⟩`, with the sign convention of report §2.2. -/
structure DefiningSystem where
  /-- The lift of the shifted first arrow. -/
  a : X⟦(1 : ℤ)⟧ ⟶ T.obj₃
  /-- The extension of the last arrow. -/
  b : T.obj₃ ⟶ W
  /-- The lift lies over `f[1]`. -/
  a_q : a ≫ T.mor₃ = f⟦(1 : ℤ)⟧'
  /-- The extension restricts to `h`. -/
  i_b : T.mor₂ ≫ b = h

/-- The actual set of defining-system composites. No zero-composite hypothesis is built into
the definition; existence is a theorem below. -/
def bracket : Set (X⟦(1 : ℤ)⟧ ⟶ W) :=
  {z | ∃ d : DefiningSystem T f h, d.a ≫ d.b = z}

/-- The report's indeterminacy `h Hom(X[1],Z) + Hom(Y[1],W) f[1]`. -/
def indeterminacy : AddSubgroup (X⟦(1 : ℤ)⟧ ⟶ W) where
  carrier := {z | ∃ (u : X⟦(1 : ℤ)⟧ ⟶ T.obj₂) (v : T.obj₁⟦(1 : ℤ)⟧ ⟶ W),
    z = u ≫ h + f⟦(1 : ℤ)⟧' ≫ v}
  zero_mem' := ⟨0, 0, by simp⟩
  add_mem' := by
    rintro z z' ⟨u, v, rfl⟩ ⟨u', v', rfl⟩
    refine ⟨u + u', v + v', ?_⟩
    simp only [Preadditive.add_comp, Preadditive.comp_add]
    abel
  neg_mem' := by
    rintro z ⟨u, v, rfl⟩
    exact ⟨-u, -v, by simp [add_comm]⟩

variable {T f h}

/-- The defining systems exist when the consecutive composites vanish. -/
theorem definingSystem_nonempty (hT : T ∈ distTriang C)
    (hfg : f ≫ T.mor₁ = 0) (hgh : T.mor₁ ≫ h = 0) :
    Nonempty (DefiningSystem T f h) := by
  obtain ⟨a, ha⟩ := T.coyoneda_exact₁ hT (f⟦(1 : ℤ)⟧') (by
    rw [← Functor.map_comp, hfg, Functor.map_zero])
  obtain ⟨b, hb⟩ := T.yoneda_exact₂ hT h hgh
  exact ⟨⟨a, b, ha.symm, hb.symm⟩⟩

/-- Nonemptiness follows from Hom exactness of the chosen distinguished triangle. -/
theorem bracket_nonempty (hT : T ∈ distTriang C)
    (hfg : f ≫ T.mor₁ = 0) (hgh : T.mor₁ ≫ h = 0) :
    (bracket T f h).Nonempty := by
  obtain ⟨d⟩ := definingSystem_nonempty hT hfg hgh
  exact ⟨d.a ≫ d.b, d, rfl⟩

/-- Every change of defining system changes the value by precisely the stated indeterminacy. -/
theorem mem_bracket_iff (hT : T ∈ distTriang C) (d : DefiningSystem T f h)
    (z : X⟦(1 : ℤ)⟧ ⟶ W) :
    z ∈ bracket T f h ↔
      ∃ (u : X⟦(1 : ℤ)⟧ ⟶ T.obj₂) (v : T.obj₁⟦(1 : ℤ)⟧ ⟶ W),
        z = d.a ≫ d.b + u ≫ h + f⟦(1 : ℤ)⟧' ≫ v := by
  constructor
  · rintro ⟨e, rfl⟩
    obtain ⟨u, hu⟩ := T.coyoneda_exact₃ hT (e.a - d.a) (by
      simp only [Preadditive.sub_comp, e.a_q, d.a_q, sub_self])
    obtain ⟨v, hv⟩ := T.yoneda_exact₃ hT (e.b - d.b) (by
      simp only [Preadditive.comp_sub, e.i_b, d.i_b, sub_self])
    refine ⟨u, v, ?_⟩
    calc
      e.a ≫ e.b = d.a ≫ d.b + (e.a - d.a) ≫ d.b + e.a ≫ (e.b - d.b) := by
        simp only [Preadditive.sub_comp, Preadditive.comp_sub]
        abel
      _ = d.a ≫ d.b + u ≫ h + f⟦(1 : ℤ)⟧' ≫ v := by
        rw [hu, hv, assoc, d.i_b, ← assoc e.a, e.a_q]
  · rintro ⟨u, v, rfl⟩
    let e : DefiningSystem T f h :=
      { a := d.a + u ≫ T.mor₂
        b := d.b + T.mor₃ ≫ v
        a_q := by
          simp only [Preadditive.add_comp, assoc, comp_distTriang_mor_zero₂₃ T hT,
            comp_zero, add_zero, d.a_q]
        i_b := by
          simp only [Preadditive.comp_add, ← assoc, comp_distTriang_mor_zero₂₃ T hT,
            zero_comp, add_zero, d.i_b] }
    refine ⟨e, ?_⟩
    change (d.a + u ≫ T.mor₂) ≫ (d.b + T.mor₃ ≫ v) = _
    simp only [Preadditive.add_comp, Preadditive.comp_add, assoc, d.i_b,
      ← assoc d.a T.mor₃ v, d.a_q, comp_distTriang_mor_zero₂₃_assoc T hT, zero_comp, comp_zero,
      add_zero]

/-- A Toda bracket is the translate of its indeterminacy subgroup by any one of its values. -/
theorem bracket_eq_coset (hT : T ∈ distTriang C) (d : DefiningSystem T f h) :
    bracket T f h = {z | z - d.a ≫ d.b ∈ indeterminacy T f h} := by
  ext z
  rw [mem_bracket_iff hT d z]
  change (∃ u v, z = d.a ≫ d.b + u ≫ h + f⟦(1 : ℤ)⟧' ≫ v) ↔
    ∃ u v, z - d.a ≫ d.b = u ≫ h + f⟦(1 : ℤ)⟧' ≫ v
  constructor <;> rintro ⟨u, v, hz⟩ <;> refine ⟨u, v, ?_⟩
  · rw [hz]
    abel
  · rw [sub_eq_iff_eq_add] at hz
    rw [hz]
    abel

/-- Vanishing of the two indeterminacy Hom groups makes every bracket a singleton. -/
theorem bracket_eq_singleton (hT : T ∈ distTriang C) (d : DefiningSystem T f h)
    [Subsingleton (X⟦(1 : ℤ)⟧ ⟶ T.obj₂)] [Subsingleton (T.obj₁⟦(1 : ℤ)⟧ ⟶ W)] :
    bracket T f h = {d.a ≫ d.b} := by
  ext z
  rw [mem_bracket_iff hT d z, Set.mem_singleton_iff]
  constructor
  · rintro ⟨u, v, hz⟩
    simpa only [Subsingleton.elim u 0, Subsingleton.elim v 0, zero_comp, comp_zero,
      add_zero] using hz
  · intro hz
    exact ⟨0, 0, by simpa using hz⟩

omit [HasZeroObject C] [Preadditive C]
  [∀ n : ℤ, Functor.Additive (shiftFunctor C n)] [Pretriangulated C] in
/-- The juggling inclusion, report Lemma 2.2, for the same cone on the middle arrow. -/
theorem juggling {X' : C} (u : X' ⟶ X) {z : X⟦(1 : ℤ)⟧ ⟶ W}
    (hz : z ∈ bracket T f h) : u⟦(1 : ℤ)⟧' ≫ z ∈ bracket T (u ≫ f) h := by
  obtain ⟨d, rfl⟩ := hz
  refine ⟨{ a := u⟦(1 : ℤ)⟧' ≫ d.a, b := d.b, a_q := ?_, i_b := d.i_b }, ?_⟩
  · rw [assoc, d.a_q, Functor.map_comp]
  · exact assoc _ _ _

/-- A defined bracket in a zero Hom group is exactly `{0}`, including nonemptiness. -/
theorem bracket_eq_zero_of_subsingleton (hT : T ∈ distTriang C)
    (hfg : f ≫ T.mor₁ = 0) (hgh : T.mor₁ ≫ h = 0)
    [Subsingleton (X⟦(1 : ℤ)⟧ ⟶ W)] : bracket T f h = {0} := by
  obtain ⟨z, hz⟩ := bracket_nonempty hT hfg hgh
  ext w
  constructor
  · intro _
    exact Subsingleton.elim _ _
  · intro _
    rwa [Subsingleton.elim w z]

/-- If the last arrow is zero, zero is represented by an extension `b = 0`. -/
theorem zero_mem_bracket (hT : T ∈ distTriang C) (hfg : f ≫ T.mor₁ = 0) :
    (0 : X⟦(1 : ℤ)⟧ ⟶ W) ∈ bracket T f 0 := by
  obtain ⟨d⟩ := definingSystem_nonempty (W := W) hT hfg (comp_zero (f := T.mor₁))
  exact ⟨{ a := d.a, b := 0, a_q := d.a_q, i_b := comp_zero }, comp_zero⟩

/-- The categorical step of report Theorem 10.4: a factorisation through a zero-target
bracket, together with zero indeterminacy, forces the desired bracket to be `{0}`. -/
theorem bracket_eq_zero_of_factor (hT : T ∈ distTriang C)
    (hfg : f ≫ T.mor₁ = 0) (hgh : T.mor₁ ≫ h = 0)
    {X' : C} (u : X' ⟶ X)
    [Subsingleton (X⟦(1 : ℤ)⟧ ⟶ W)]
    [Subsingleton (X'⟦(1 : ℤ)⟧ ⟶ T.obj₂)]
    [Subsingleton (T.obj₁⟦(1 : ℤ)⟧ ⟶ W)] :
    bracket T (u ≫ f) h = {0} := by
  have hz : (0 : X⟦(1 : ℤ)⟧ ⟶ W) ∈ bracket T f h := by
    rw [bracket_eq_zero_of_subsingleton hT hfg hgh]
    exact Set.mem_singleton 0
  have hz' : (0 : X'⟦(1 : ℤ)⟧ ⟶ W) ∈ bracket T (u ≫ f) h := by
    simpa only [comp_zero] using juggling u hz
  obtain ⟨d, hd⟩ := hz'
  rw [bracket_eq_singleton hT d, hd]

omit [HasZeroObject C] [Preadditive C]
  [∀ n : ℤ, Functor.Additive (shiftFunctor C n)] [Pretriangulated C] in
/-- Transport a defining system along an isomorphism between cones of the same arrow. -/
theorem bracket_subset_of_cone_iso {Y Z Q Q' : C} (f : X ⟶ Y) (g : Y ⟶ Z)
    (h : Z ⟶ W) (i : Z ⟶ Q) (q : Q ⟶ Y⟦(1 : ℤ)⟧)
    (i' : Z ⟶ Q') (q' : Q' ⟶ Y⟦(1 : ℤ)⟧) (e : Q ≅ Q')
    (hi : i ≫ e.hom = i') (hq : e.hom ≫ q' = q) :
    bracket (Triangle.mk g i q) f h ⊆ bracket (Triangle.mk g i' q') f h := by
  rintro z ⟨⟨a, b, ha, hb⟩, rfl⟩
  dsimp only [Triangle.mk] at a b ha hb
  refine ⟨{ a := a ≫ e.hom, b := e.inv ≫ b, a_q := ?_, i_b := ?_ }, ?_⟩
  · change (a ≫ e.hom) ≫ q' = _
    rw [assoc, hq]
    exact ha
  · change i' ≫ e.inv ≫ b = h
    rw [← hi, assoc, e.hom_inv_id_assoc]
    exact hb
  · change (a ≫ e.hom) ≫ (e.inv ≫ b) = a ≫ b
    simp only [assoc, e.hom_inv_id_assoc]

/-- The bracket does not depend on the distinguished cone chosen for the middle arrow. -/
theorem bracket_eq_of_distinguished_cones {Y Z Q Q' : C} (f : X ⟶ Y) (g : Y ⟶ Z)
    (h : Z ⟶ W) (i : Z ⟶ Q) (q : Q ⟶ Y⟦(1 : ℤ)⟧)
    (i' : Z ⟶ Q') (q' : Q' ⟶ Y⟦(1 : ℤ)⟧)
    (hT : Triangle.mk g i q ∈ distTriang C)
    (hT' : Triangle.mk g i' q' ∈ distTriang C) :
    bracket (Triangle.mk g i q) f h = bracket (Triangle.mk g i' q') f h := by
  let e := isoTriangleOfIso₁₂ (Triangle.mk g i q) (Triangle.mk g i' q') hT hT'
    (Iso.refl Y) (Iso.refl Z) (by change g ≫ 𝟙 Z = 𝟙 Y ≫ g; simp)
  let e₃ : Q ≅ Q' := Triangle.π₃.mapIso e
  have hi : i ≫ e₃.hom = i' := by
    have he := e.hom.comm₂
    change i ≫ e₃.hom = (𝟙 Z) ≫ i' at he
    simpa only [id_comp] using he
  have hq : e₃.hom ≫ q' = q := by
    have he := e.hom.comm₃
    change q ≫ (𝟙 Y)⟦(1 : ℤ)⟧' = e₃.hom ≫ q' at he
    exact he.symm.trans ((congrArg (fun t => q ≫ t)
      ((shiftFunctor C (1 : ℤ)).map_id Y)).trans (comp_id q))
  apply Set.Subset.antisymm
  · exact bracket_subset_of_cone_iso f g h i q i' q' e₃ hi hq
  · apply bracket_subset_of_cone_iso f g h i' q' i q e₃.symm
    · change i' ≫ e₃.inv = i
      rw [← hi]
      simp
    · change e₃.inv ≫ q = q'
      rw [← hq]
      simp

end FindimCounterexample.Stage4a.Toda
