/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import Mathlib.CategoryTheory.Triangulated.Pretriangulated
import Mathlib.CategoryTheory.Shift.ShiftedHom
import Mathlib.LinearAlgebra.Dual.Lemmas

/-!
# Conditional Tate-duality interface for stage 4a

The ambient structures are Mathlib's category, preadditive category, `Linear k C`,
integer shift and `Pretriangulated C`; the latter uses additive shifts. Finite
dimensionality is the usual `FiniteDimensional k (X ⟶ Y)` for every pair of
objects. The new structure below states only the approved perfect Tate pairing
and its composition compatibility (report Theorem 2.1 and the following pairing,
citing Linckelmann, Section 2, (2.1), (2.2), (2.8)).

`ShiftedHom X Y a` means `X ⟶ Y⟦a⟧`. Its product `f.comp g h` is
`f ≫ g⟦a⟧' ≫ (shiftFunctorAdd' C b a c h).inv.app _`, where `h : b + a = c`.
Thus it means the report's `g[a] ∘ f`, including the shift identification.
The complementary degree is an explicit integer with an equality to `-1`;
there are no implicit identifications of differently indexed Hom spaces.
-/

open CategoryTheory

namespace FindimCounterexample.Stage4a

universe u v w

variable (k : Type u) [Field k] (C : Type w) [Category.{v} C]
  [Preadditive C] [Linear k C] [HasShift C ℤ]

/-- The approved Tate-duality input. Each equivalence is the perfect bilinear
pairing of report Theorem 2.1, with the report's exact composition law. -/
structure TateDuality where
  /-- `Hom(X,Y[a])` is the linear dual of `Hom(Y,X[b])` for `a+b=-1`.
  This is report Theorem 2.1 in its equivalent pairing form. -/
  pairing (X Y : C) (a b : ℤ) (h : a + b = -1) :
    ShiftedHom X Y a ≃ₗ[k] Module.Dual k (ShiftedHom Y X b)
  /-- `⟨ζη,τ⟩ = ⟨ζ,ητ⟩`, report immediately after Theorem 2.1.
  The degree-zero specializations express naturality for unshifted maps;
  every shifted composition uses Mathlib's specified shift-addition isomorphism. -/
  composition {X Y Z : C} (a b c : ℤ) (h : b + a + c = -1)
    (η : ShiftedHom X Y a) (ζ : ShiftedHom Y Z b) (τ : ShiftedHom Z X c) :
    pairing X Z (b + a) c h (η.comp ζ rfl) τ =
      pairing Y Z b (a + c) (by omega) ζ (τ.comp η rfl)
  /-- Naturality in the target object, unpacking the natural perfect pairing
  of report Theorem 2.1. The target map on degree `a` is shifted by exactly
  `a`; its dual map is ordinary precomposition. Source naturality follows
  from `composition` and is derived below. -/
  naturality_target {X Y Z : C} (a b : ℤ) (h : a + b = -1)
    (f : ShiftedHom X Y a) (u : Y ⟶ Z) (t : ShiftedHom Z X b) :
    pairing X Z a b h (f ≫ u⟦a⟧') t = pairing X Y a b h f (u ≫ t)

variable {k C}

omit [Preadditive C] in
/-- Changing only the output degree along a proved equality preserves
bijectivity of right graded composition. -/
theorem right_comp_bijective_reindex {s : C} {a b c d : ℤ}
    (g : ShiftedHom s s b) (hc : b + a = c) (hd : b + a = d)
    (hh : Function.Bijective (fun f : ShiftedHom s s a => f.comp g hc)) :
    Function.Bijective (fun f : ShiftedHom s s a => f.comp g hd) := by
  have he : c = d := hc.symm.trans hd
  cases he
  exact hh

omit [Preadditive C] in
/-- The analogous index transport for left graded composition. -/
theorem left_comp_bijective_reindex {s : C} {a b c d : ℤ}
    (f : ShiftedHom s s a) (hc : b + a = c) (hd : b + a = d)
    (hh : Function.Bijective (fun g : ShiftedHom s s b => f.comp g hc)) :
    Function.Bijective (fun g : ShiftedHom s s b => f.comp g hd) := by
  have he : c = d := hc.symm.trans hd
  cases he
  exact hh

namespace TateDuality

variable (D : TateDuality k C)

include D

/-- The composition law with both output degrees supplied explicitly, for
use without hiding transports between equal integer indices. -/
theorem composition_reindexed {X Y Z : C} (a b c d e : ℤ)
    (hd : b + a = d) (he : a + c = e) (h : d + c = -1)
    (η : ShiftedHom X Y a) (ζ : ShiftedHom Y Z b) (τ : ShiftedHom Z X c) :
    D.pairing X Z d c h (η.comp ζ hd) τ =
      D.pairing Y Z b e (by omega) ζ (τ.comp η he) := by
  subst d e
  exact D.composition a b c h η ζ τ

/-- Naturality in the source object, deduced from the approved composition
law. The dual target map is shifted by the complementary degree `b`. -/
theorem naturality_source {W X Y : C} (a b : ℤ) (h : a + b = -1)
    (v : W ⟶ X) (f : ShiftedHom X Y a) (t : ShiftedHom Y W b) :
    D.pairing W Y a b h (v ≫ f) t =
      D.pairing X Y a b h f (t ≫ v⟦b⟧') := by
  have hh := D.composition_reindexed 0 a b a b (add_zero a) (zero_add b) h
    (ShiftedHom.mk₀ 0 rfl v) f t
  simpa only [ShiftedHom.mk₀_comp, ShiftedHom.comp_mk₀] using hh

/-- A perfect Tate pairing transfers vanishing to the complementary degree. -/
theorem subsingleton_complement (X Y : C) (a b : ℤ) (h : a + b = -1)
    (ha : Subsingleton (ShiftedHom X Y a)) :
    Subsingleton (ShiftedHom Y X b) := by
  have := ha
  have : Subsingleton (Module.Dual k (ShiftedHom Y X b)) :=
    (D.pairing X Y a b h).symm.injective.subsingleton
  exact (Module.subsingleton_dual_iff k).mp inferInstance

/-- The two spaces in a perfect Tate pairing have the same finite dimension. -/
theorem finrank_complement (X Y : C) (a b : ℤ) (h : a + b = -1)
    [FiniteDimensional k (ShiftedHom Y X b)] :
    Module.finrank k (ShiftedHom X Y a) = Module.finrank k (ShiftedHom Y X b) := by
  rw [(D.pairing X Y a b h).finrank_eq, Subspace.dual_finrank_eq]

/-- Scalar linearity in the shifted second factor follows from the perfect
pairing and compatibility; it is not an additional interface hypothesis. -/
theorem comp_smul {X Y Z : C} (r : k) {a b d : ℤ}
    (f : ShiftedHom X Y a) (g : ShiftedHom Y Z b) (hd : b + a = d) :
    f.comp (r • g) hd = r • f.comp g hd := by
  subst d
  apply (D.pairing X Z (b + a) (-1 - (b + a)) (by omega)).injective
  ext t
  simp only [map_smul, LinearMap.smul_apply, smul_eq_mul]
  rw [D.composition a b (-1 - (b + a)) (by omega),
    D.composition a b (-1 - (b + a)) (by omega)]
  simp

/-- The shift functors are linear as a consequence of the approved pairing
compatibility, so their linearity is not an extra interface field. -/
theorem shift_linear (a : ℤ) : (shiftFunctor C a).Linear k := by
  constructor
  intro X Y f r
  have hh := D.comp_smul r (𝟙 (X⟦a⟧) : ShiftedHom (X⟦a⟧) X a)
    (ShiftedHom.mk₀ 0 rfl f) (zero_add a)
  rw [← ShiftedHom.mk₀_smul] at hh
  simpa only [ShiftedHom.comp_mk₀, Category.id_comp] using hh

/-- Right graded composition is injective whenever its Tate-dual left
composition is surjective. This is the duality step for negative powers. -/
theorem right_comp_injective {s : C} (a b c : ℤ)
    (h : b + a + c = -1)
    (τ : ShiftedHom s s a)
    (hdual : Function.Surjective
      (fun y : ShiftedHom s s b => τ.comp y (rfl : b + a = b + a))) :
    Function.Injective
      (fun x : ShiftedHom s s c => x.comp τ (rfl : a + c = a + c)) := by
  intro x x' heq
  apply sub_eq_zero.mp
  apply (Module.forall_dual_apply_eq_zero_iff k (x - x')).mp
  intro φ
  obtain ⟨z, hz⟩ := (D.pairing s s (b + a) c h).surjective φ
  obtain ⟨y, hy⟩ := hdual z
  change τ.comp y rfl = z at hy
  have hh := D.composition a b c h τ y (x - x')
  have hprod : (x - x').comp τ (show a + c = a + c from rfl) = 0 := by
    simp only [sub_eq_add_neg, ShiftedHom.add_comp, ShiftedHom.neg_comp, heq, add_neg_cancel]
  rw [hprod, LinearMap.map_zero] at hh
  rw [hy, hz] at hh
  exact hh

/-- Perfect Tate duality transfers bijectivity of left graded composition to
right graded composition in the complementary degrees. -/
theorem right_comp_bijective [∀ n : ℤ, (shiftFunctor C n).Additive]
    [∀ X Y : C, FiniteDimensional k (X ⟶ Y)] {s : C} (a b c : ℤ)
    (h : b + a + c = -1) (τ : ShiftedHom s s a)
    (hdual : Function.Bijective
      (fun y : ShiftedHom s s b => τ.comp y (rfl : b + a = b + a))) :
    Function.Bijective
      (fun x : ShiftedHom s s c => x.comp τ (rfl : a + c = a + c)) := by
  let f : ShiftedHom s s b →ₗ[k] ShiftedHom s s (b + a) :=
    { toFun := fun y => τ.comp y rfl
      map_add' := fun x y => ShiftedHom.comp_add τ x y rfl
      map_smul' := fun r x => D.comp_smul r τ x rfl }
  let g : ShiftedHom s s c →ₗ[k] ShiftedHom s s (a + c) :=
    { toFun := fun x => x.comp τ rfl
      map_add' := fun x y => ShiftedHom.add_comp x y τ rfl
      map_smul' := fun r x => ShiftedHom.smul_comp r x τ rfl }
  have hd : Module.finrank k (ShiftedHom s s c) =
      Module.finrank k (ShiftedHom s s (a + c)) :=
    (D.finrank_complement s s c (b + a) (by omega)).trans
      ((LinearEquiv.ofBijective f hdual).finrank_eq.symm.trans
        (D.finrank_complement s s b (a + c) (by omega)))
  have hi := D.right_comp_injective a b c h τ hdual.surjective
  exact ⟨hi, (LinearMap.injective_iff_surjective_of_finrank_eq_finrank hd (f := g)).mp hi⟩

/-- The factorization used in Corollary 10.3 and Theorem 10.4. For any
nonzero degree-three class, every degree-minus-one class is `γ[3] ∘ τ`.
Only the perfect pairing, its compatibility and one-dimensional degree zero
are used. -/
theorem right_factorization {s : C} [FiniteDimensional k (ShiftedHom s s (0 : ℤ))]
    (h₀ : Module.finrank k (ShiftedHom s s (0 : ℤ)) = 1)
    (τ : ShiftedHom s s (3 : ℤ)) (hτ : τ ≠ 0)
    (β : ShiftedHom s s (-1 : ℤ)) :
    ∃ γ : ShiftedHom s s (-4 : ℤ), τ.comp γ (by norm_num) = β := by
  have hex : ∃ φ : Module.Dual k (ShiftedHom s s (3 : ℤ)), φ τ ≠ 0 := by
    by_contra! hn
    exact hτ ((Module.forall_dual_apply_eq_zero_iff k τ).mp hn)
  obtain ⟨φ, hφ⟩ := hex
  obtain ⟨γ, hγ⟩ := (D.pairing s s (-4) 3 (by norm_num)).surjective φ
  have hprod : τ.comp γ (show (-4 : ℤ) + 3 = -1 by norm_num) ≠ 0 := by
    intro hz
    have hh := D.composition 3 (-4) 0 (by norm_num) τ γ
      (ShiftedHom.mk₀ 0 rfl (𝟙 s))
    rw [hz] at hh
    simp only [map_zero, LinearMap.zero_apply, ShiftedHom.mk₀_id_comp] at hh
    change 0 = D.pairing s s (-4) 3 (by norm_num) γ τ at hh
    rw [hγ] at hh
    exact hφ hh.symm
  have hdim : Module.finrank k (ShiftedHom s s (-1 : ℤ)) = 1 :=
    (D.finrank_complement s s (-1) 0 (by norm_num)).trans h₀
  obtain ⟨r, hr⟩ := exists_smul_eq_of_finrank_eq_one hdim hprod β
  exact ⟨r • γ, (D.comp_smul r τ γ (by norm_num)).trans hr⟩

end TateDuality

/-- Coordinate form of a graded polynomial endomorphism algebra with generator
in positive degree `p`. The degree-`n` monomials are indexed by the natural
numbers `m` such that `p*m=n`. This is a multiplicative homogeneous basis, not
an assumption about the kernel or cokernel of any map. For `p=3` it is the
approved input of report Theorem 9.5 used in Propositions 10.1--10.3.

The basis equivalences identify each component with finitely supported
coefficients on the corresponding monomials. The unit and multiplication
fields assert precisely that these coordinates respect polynomial one and
monomial multiplication. -/
structure PolynomialSelfExtensions (s : C) (p : ℕ) where
  /-- The homogeneous monomial basis in each nonnegative degree, report
  Theorem 9.5: `Ext* (s,s) = k[τ]`. -/
  basis (n : ℕ) : Module.Basis {m : ℕ // p * m = n} k
    (ShiftedHom s s (n : ℤ))
  /-- The degree-zero monomial is the identity, as required for a unital
  graded algebra isomorphism. -/
  basis_zero : basis 0 ⟨0, by simp⟩ = ShiftedHom.mk₀ 0 rfl (𝟙 s)
  /-- Multiplication of homogeneous monomials agrees with multiplication in
  `k[τ]`, using exactly Mathlib's shift-addition identification. -/
  basis_mul (n m : ℕ) (i : {r : ℕ // p * r = n}) (j : {r : ℕ // p * r = m}) :
    (basis n i).comp (basis m j) (by omega : (m : ℤ) + n = (m + n : ℕ)) =
      basis (m + n) ⟨j.val + i.val, by simp [Nat.mul_add, j.property, i.property]⟩

namespace PolynomialSelfExtensions

variable {s : C} {p : ℕ} (P : PolynomialSelfExtensions (k := k) s p)

include P

/-- The polynomial generator, with all its shift data retained. -/
noncomputable def tau : ShiftedHom s s (p : ℤ) := P.basis p ⟨1, by simp⟩

/-- The polynomial generator is nonzero. -/
theorem tau_ne_zero : P.tau ≠ 0 := P.basis p |>.ne_zero _

/-- Nonnegative degrees not divisible by the generator degree vanish. -/
theorem subsingleton_of_not_dvd (n : ℕ) (hn : ¬ p ∣ n) :
    Subsingleton (ShiftedHom s s (n : ℤ)) := by
  have : IsEmpty {m : ℕ // p * m = n} :=
    ⟨fun m => hn ⟨m.val, m.property.symm⟩⟩
  exact (P.basis n).repr.injective.subsingleton

/-- Every degree which is a nonnegative multiple of the positive generator
degree has dimension one. -/
theorem finrank_multiple (hp : 0 < p) (m : ℕ) :
    Module.finrank k (ShiftedHom s s ((p * m : ℕ) : ℤ)) = 1 := by
  let : Unique {r : ℕ // p * r = p * m} :=
    ⟨⟨⟨m, rfl⟩⟩, fun r => Subtype.ext (Nat.eq_of_mul_eq_mul_left hp r.property)⟩
  simpa using Module.finrank_eq_card_basis (P.basis (p * m))

/-- The same dimension statement with divisibility as its index condition. -/
theorem finrank_of_dvd (hp : 0 < p) (n : ℕ) (hn : p ∣ n) :
    Module.finrank k (ShiftedHom s s (n : ℤ)) = 1 := by
  obtain ⟨m, rfl⟩ := hn
  exact P.finrank_multiple hp m

/-- Multiplication on the right by the generator, in nonnegative degrees. -/
noncomputable def rightMulTau (n : ℕ) :
    ShiftedHom s s (n : ℤ) →ₗ[k] ShiftedHom s s ((p + n : ℕ) : ℤ) where
  toFun x := x.comp P.tau (by omega)
  map_add' x y := ShiftedHom.add_comp x y _ _
  map_smul' r x := ShiftedHom.smul_comp r x _ _

/-- The positive-degree generator acts bijectively between consecutive
nonnegative multiples of its degree. -/
theorem right_mul_tau_bijective (hp : 0 < p) (m : ℕ) :
    Function.Bijective (P.rightMulTau (p * m)) := by
  have hs := P.finrank_multiple hp m
  have ht := P.finrank_of_dvd hp (p + p * m) (dvd_add (dvd_refl p) (dvd_mul_right p m))
  have : FiniteDimensional k (ShiftedHom s s ((p * m : ℕ) : ℤ)) :=
    FiniteDimensional.of_finrank_eq_succ hs
  have : FiniteDimensional k (ShiftedHom s s ((p + p * m : ℕ) : ℤ)) :=
    FiniteDimensional.of_finrank_eq_succ ht
  have hn : P.rightMulTau (p * m) ≠ 0 := by
    intro hz
    have hb := P.basis_mul (p * m) p ⟨m, rfl⟩ ⟨1, by simp⟩
    have hh := LinearMap.congr_fun hz (P.basis (p * m) ⟨m, rfl⟩)
    change (P.basis (p * m) ⟨m, rfl⟩).comp (P.basis p ⟨1, by simp⟩) _ = 0 at hh
    rw [hb] at hh
    exact (P.basis (p + p * m)).ne_zero _ hh
  have hsurj := surjective_of_nonzero_of_finrank_eq_one ht hn
  exact ⟨(LinearMap.injective_iff_surjective_of_finrank_eq_finrank (hs.trans ht.symm)).mpr
    hsurj, hsurj⟩

/-- Multiplication on the left by the generator. Shift linearity is derived
from Tate duality, and additivity is supplied by the ambient shift functors. -/
noncomputable def leftMulTau [∀ n : ℤ, (shiftFunctor C n).Additive]
    (D : TateDuality k C) (n : ℕ) :
    ShiftedHom s s (n : ℤ) →ₗ[k] ShiftedHom s s ((n + p : ℕ) : ℤ) where
  toFun x := P.tau.comp x (by omega)
  map_add' x y := ShiftedHom.comp_add _ x y _
  map_smul' r x := D.comp_smul r _ x _

/-- The corresponding left generator action is also bijective in every
nonnegative multiple of the generator degree. -/
theorem left_mul_tau_bijective [∀ n : ℤ, (shiftFunctor C n).Additive]
    (D : TateDuality k C) (hp : 0 < p) (m : ℕ) :
    Function.Bijective (P.leftMulTau D (p * m)) := by
  have hs := P.finrank_multiple hp m
  have ht := P.finrank_of_dvd hp (p * m + p) (dvd_add (dvd_mul_right p m) (dvd_refl p))
  have : FiniteDimensional k (ShiftedHom s s ((p * m : ℕ) : ℤ)) :=
    FiniteDimensional.of_finrank_eq_succ hs
  have : FiniteDimensional k (ShiftedHom s s ((p * m + p : ℕ) : ℤ)) :=
    FiniteDimensional.of_finrank_eq_succ ht
  have hn : P.leftMulTau D (p * m) ≠ 0 := by
    intro hz
    have hb := P.basis_mul p (p * m) ⟨1, by simp⟩ ⟨m, rfl⟩
    have hh := LinearMap.congr_fun hz (P.basis (p * m) ⟨m, rfl⟩)
    change (P.basis p ⟨1, by simp⟩).comp (P.basis (p * m) ⟨m, rfl⟩) _ = 0 at hh
    rw [hb] at hh
    exact (P.basis (p * m + p)).ne_zero _ hh
  have hsurj := surjective_of_nonzero_of_finrank_eq_one ht hn
  exact ⟨(LinearMap.injective_iff_surjective_of_finrank_eq_finrank (hs.trans ht.symm)).mpr
    hsurj, hsurj⟩

/-- Right multiplication is bijective throughout the nonnegative range,
including the zero components between the polynomial degrees. -/
theorem right_mul_tau_bijective_nonneg (hp : 0 < p) (a : ℤ) (ha : 0 ≤ a) :
    Function.Bijective (fun x : ShiftedHom s s a =>
      x.comp P.tau (rfl : (p : ℤ) + a = (p : ℤ) + a)) := by
  lift a to ℕ using ha
  suffices hh : Function.Bijective (P.rightMulTau a) by
    exact right_comp_bijective_reindex P.tau (by omega) rfl hh
  by_cases hdiv : p ∣ a
  · obtain ⟨m, rfl⟩ := hdiv
    exact P.right_mul_tau_bijective hp m
  · have hs := P.subsingleton_of_not_dvd a hdiv
    have ht := P.subsingleton_of_not_dvd (p + a)
      (fun h => hdiv ((Nat.dvd_add_iff_right (dvd_refl p)).mpr h))
    exact ⟨fun _ _ _ => hs.elim _ _, fun y => ⟨0, ht.elim _ _⟩⟩

/-- Left multiplication is bijective throughout the nonnegative range. -/
theorem left_mul_tau_bijective_nonneg [∀ n : ℤ, (shiftFunctor C n).Additive]
    (D : TateDuality k C) (hp : 0 < p) (a : ℤ) (ha : 0 ≤ a) :
    Function.Bijective (fun x : ShiftedHom s s a =>
      P.tau.comp x (rfl : a + (p : ℤ) = a + (p : ℤ))) := by
  lift a to ℕ using ha
  suffices hh : Function.Bijective (P.leftMulTau D a) by
    exact left_comp_bijective_reindex P.tau (by omega) rfl hh
  by_cases hdiv : p ∣ a
  · obtain ⟨m, rfl⟩ := hdiv
    exact P.left_mul_tau_bijective D hp m
  · have hs := P.subsingleton_of_not_dvd a hdiv
    have ht := P.subsingleton_of_not_dvd (a + p)
      (fun h => hdiv ((Nat.dvd_add_iff_left (dvd_refl p)).mpr h))
    exact ⟨fun _ _ _ => hs.elim _ _, fun y => ⟨0, ht.elim _ _⟩⟩

/-- The negative polynomial tail has invertible generator action, by
duality with left multiplication in the nonnegative tail. -/
theorem right_mul_tau_bijective_negative [∀ n : ℤ, (shiftFunctor C n).Additive]
    [∀ X Y : C, FiniteDimensional k (X ⟶ Y)]
    (D : TateDuality k C) (hp : 0 < p) (a : ℤ) (ha : a < -(p : ℤ)) :
    Function.Bijective (fun x : ShiftedHom s s a =>
      x.comp P.tau (rfl : (p : ℤ) + a = (p : ℤ) + a)) :=
  D.right_comp_bijective (p : ℤ) (-1 - p - a) a (by omega) P.tau
    (P.left_mul_tau_bijective_nonneg D hp _ (by omega))

end PolynomialSelfExtensions

namespace PolynomialSelfExtensions

variable {s : C} (P : PolynomialSelfExtensions (k := k) s 3)
  [∀ n : ℤ, (shiftFunctor C n).Additive]
  [∀ X Y : C, FiniteDimensional k (X ⟶ Y)] (D : TateDuality k C)

include D

/-- In the degree-three polynomial example, multiplication by the generator
is injective except in source degree minus one. This is derived from the
polynomial basis and duality, not assumed in the interface. -/
theorem right_mul_tau_injective (a : ℤ) (ha : a ≠ -1) :
    Function.Injective (fun x : ShiftedHom s s a =>
      x.comp P.tau (rfl : (3 : ℤ) + a = 3 + a)) := by
  by_cases hpos : 0 ≤ a
  · exact (P.right_mul_tau_bijective_nonneg (by decide) a hpos).injective
  by_cases hneg : a < -3
  · exact (P.right_mul_tau_bijective_negative D (by decide) a hneg).injective
  have hcases : a = -3 ∨ a = -2 := by omega
  rcases hcases with rfl | rfl
  · have hz := D.subsingleton_complement s s 2 (-3) (by norm_num)
      (P.subsingleton_of_not_dvd 2 (by decide))
    exact fun _ _ _ => hz.elim _ _
  · have hz := D.subsingleton_complement s s 1 (-2) (by norm_num)
      (P.subsingleton_of_not_dvd 1 (by decide))
    exact fun _ _ _ => hz.elim _ _

/-- In the degree-three polynomial example, multiplication by the generator
is surjective except in source degree minus three (target degree zero). -/
theorem right_mul_tau_surjective (a : ℤ) (ha : a ≠ -3) :
    Function.Surjective (fun x : ShiftedHom s s a =>
      x.comp P.tau (rfl : (3 : ℤ) + a = 3 + a)) := by
  by_cases hpos : 0 ≤ a
  · exact (P.right_mul_tau_bijective_nonneg (by decide) a hpos).surjective
  by_cases hneg : a < -3
  · exact (P.right_mul_tau_bijective_negative D (by decide) a hneg).surjective
  have hcases : a = -2 ∨ a = -1 := by omega
  rcases hcases with rfl | rfl
  · have hz := P.subsingleton_of_not_dvd 1 (by decide)
    exact fun y => ⟨0, hz.elim _ y⟩
  · have hz := P.subsingleton_of_not_dvd 2 (by decide)
    exact fun y => ⟨0, hz.elim _ y⟩

end PolynomialSelfExtensions

end FindimCounterexample.Stage4a
