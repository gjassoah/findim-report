import FindimCounterexample

/-! Statement listing: the main results with their types and axioms. -/

open FindimCounterexample

#check @ProjectiveCoresolution.hasProjectiveDimensionLE
#check @ProjectiveCoresolution.not_hasProjectiveDimensionLT
#check @ProjectiveCoresolution.projectiveDimension_eq

#print axioms ProjectiveCoresolution.hasProjectiveDimensionLE
#print axioms ProjectiveCoresolution.not_hasProjectiveDimensionLT
#print axioms ProjectiveCoresolution.projectiveDimension_eq

#check @RingDual.freeDualEquiv
#check @RingDual.evalEquiv
#check @RingDual.rightDual_projective
#check @RingDual.rightDual_finite
#check @RingDual.split_of_dual_split
#check @ExactCoresolution.coresolution
#check @StrongNakayama.coresolution
#check @StrongNakayama.projective_zero
#check @StrongNakayama.cok_finite
#check @StrongNakayama.not_projective_one
#check @StrongNakayama.projectiveDimension_eq
#check @StrongNakayama.unbounded

#print axioms RingDual.freeDualEquiv
#print axioms RingDual.evalEquiv
#print axioms RingDual.rightDual_projective
#print axioms RingDual.rightDual_finite
#print axioms RingDual.split_of_dual_split
#print axioms ExactCoresolution.coresolution
#print axioms StrongNakayama.coresolution
#print axioms StrongNakayama.projective_zero
#print axioms StrongNakayama.cok_finite
#print axioms StrongNakayama.not_projective_one
#print axioms StrongNakayama.projectiveDimension_eq
#print axioms StrongNakayama.unbounded

#check @ResolutionExt.ext_zero_iff_injective
#check @ResolutionExt.ext_succ_iff_cocycles_boundaries
#check @ResolutionExt.ext_vanishing_iff
#check @ModuleResolution.projectiveResolution
#check @ModuleResolution.ext_vanishing_iff
#check @StrongNakayama.homRightDualEquiv
#check @StrongNakayama.homDifferential_eq_dualDifferential
#check @StrongNakayama.ext_vanishing_iff_dual_exact
#check @StrongNakayama.projectiveDimension_eq_of_ext
#check @StrongNakayama.unbounded_of_ext
#check @Transpose.presentedModule
#check @Transpose.ofPresentation
#check @Transpose.cok_eq_transpose
#check @Transpose.syzygy
#check @Transpose.presentationCokernelEquivSyzygy
#check @Transpose.presentationCokernelIsoSyzygy

#print axioms ResolutionExt.ext_zero_iff_injective
#print axioms ResolutionExt.ext_succ_iff_cocycles_boundaries
#print axioms ResolutionExt.ext_vanishing_iff
#print axioms ModuleResolution.projectiveResolution
#print axioms ModuleResolution.ext_vanishing_iff
#print axioms StrongNakayama.homRightDualEquiv
#print axioms StrongNakayama.homDifferential_eq_dualDifferential
#print axioms StrongNakayama.ext_vanishing_iff_dual_exact
#print axioms StrongNakayama.projectiveDimension_eq_of_ext
#print axioms StrongNakayama.unbounded_of_ext
#print axioms Transpose.presentedModule
#print axioms Transpose.ofPresentation
#print axioms Transpose.cok_eq_transpose
#print axioms Transpose.syzygy
#print axioms Transpose.presentationCokernelEquivSyzygy
#print axioms Transpose.presentationCokernelIsoSyzygy

#check SelectionGroup.G
#check SelectionGroup.Relator
#check SelectionGroup.weight
#check @SelectionGroup.lift
#check @SelectionCommutator.transfer
#check SelectionGroup.commutator_transfer
#check SelectionGroup.commutator_eq_of_sum
#check SelectionGroup.z_eq
#check SelectionGroup.z_mem_center
#check SelectionGroup.z_sq
#print axioms SelectionGroup.lift
#print axioms SelectionCommutator.transfer
#print axioms SelectionGroup.commutator_transfer
#print axioms SelectionGroup.commutator_eq_of_sum
#print axioms SelectionGroup.z_eq
#print axioms SelectionGroup.z_mem_center
#print axioms SelectionGroup.z_sq

#check SelectionGroup.beta
#check SelectionGroup.beta_T
#check SelectionGroup.beta_U
#check SelectionGroup.beta_V
#check SelectionGroup.beta_W
#check SelectionGroup.beta_add
#check SelectionGroup.beta_zero
#check SelectionGroup.beta_z
#check SelectionGroup.alpha_z
#print axioms SelectionGroup.beta
#print axioms SelectionGroup.beta_add
#print axioms SelectionGroup.beta_zero
#print axioms SelectionGroup.beta_z
#print axioms SelectionGroup.alpha_z

#check FiniteQuotientRing.S
#check FiniteQuotientRing.basis
#check FiniteQuotientRing.finite
#check FiniteQuotientRing.t
#check FiniteQuotientRing.t_pow
#check FiniteQuotientRing.linearIndependent_tPow
#check FiniteQuotients.pi
#check FiniteQuotients.pi_T_matrix
#check FiniteQuotients.pi_U_matrix
#check FiniteQuotients.pi_V_matrix
#check FiniteQuotients.pi_W_matrix
#check FiniteQuotients.pi_z_matrix
#check FiniteQuotients.finite_F
#check FiniteQuotients.coordinates
#check FiniteQuotients.coordinates_injective
#check FiniteQuotients.coordinates_range
#check FiniteQuotients.centerEquiv
#check FiniteQuotients.centerEquiv_generator
#check FiniteQuotients.z_image_mem_center
#check FiniteQuotients.Z_le_center
#print axioms FiniteQuotientRing.basis
#print axioms FiniteQuotientRing.finite
#print axioms FiniteQuotientRing.t
#print axioms FiniteQuotientRing.linearIndependent_tPow
#print axioms FiniteQuotients.pi
#print axioms FiniteQuotients.pi_T_matrix
#print axioms FiniteQuotients.pi_U_matrix
#print axioms FiniteQuotients.pi_V_matrix
#print axioms FiniteQuotients.pi_W_matrix
#print axioms FiniteQuotients.pi_z_matrix
#print axioms FiniteQuotients.finite_F
#print axioms FiniteQuotients.coordinates_injective
#print axioms FiniteQuotients.coordinates_range
#print axioms FiniteQuotients.centerEquiv
#print axioms FiniteQuotients.centerEquiv_generator
#print axioms FiniteQuotients.z_image_mem_center
#print axioms FiniteQuotients.Z_le_center

#check SelectionGroup.centralSum
#check SelectionGroup.centralSum_single_one
#check SelectionGroup.centralSum_injective
#check SelectionGroup.centralProduct_range
#check SelectionGroup.centralSubgroup_map
#check SelectionGroup.directSumEquiv
#check SelectionGroup.directSumEquiv_single
#check SelectionGroup.center_not_finitelyGenerated
#check SelectionGroup.center_not_fg
#print axioms SelectionGroup.centralSum
#print axioms SelectionGroup.centralSum_injective
#print axioms SelectionGroup.centralProduct_range
#print axioms SelectionGroup.centralSubgroup_map
#print axioms SelectionGroup.directSumEquiv
#print axioms SelectionGroup.directSumEquiv_single
#print axioms SelectionGroup.center_not_finitelyGenerated
#print axioms SelectionGroup.center_not_fg

#print SelectionGroup.Relator
#print SelectionGroup.G
#print SelectionFinite.Generator
#print SelectionFinite.relationWord
#print SelectionFinite.P
#check SelectionFinite.card_generator
#check SelectionFinite.relations_finite
#check SelectionFinite.family
#check SelectionFinite.conjugation
#check SelectionFinite.torus_conjugation
#check SelectionFinite.toG
#check SelectionFinite.fromG
#check SelectionFinite.toG_family
#check SelectionFinite.fromG_comp_toG
#check SelectionFinite.toG_comp_fromG
#check SelectionFinite.presentationEquiv
#check SelectionFinite.presentationEquiv_T
#check SelectionFinite.presentationEquiv_root0
#check SelectionFinite.finitelyPresented
#print axioms SelectionFinite.card_generator
#print axioms SelectionFinite.relations_finite
#print axioms SelectionFinite.conjugation
#print axioms SelectionFinite.torus_conjugation
#print axioms SelectionFinite.toG
#print axioms SelectionFinite.fromG
#print axioms SelectionFinite.toG_family
#print axioms SelectionFinite.fromG_comp_toG
#print axioms SelectionFinite.toG_comp_fromG
#print axioms SelectionFinite.presentationEquiv
#print axioms SelectionFinite.presentationEquiv_T
#print axioms SelectionFinite.presentationEquiv_root0
#print axioms SelectionFinite.finitelyPresented
#check @RankObstruction.apply_pow_eq_zero_of_eventually
#check @RankObstruction.apply_pow_finrank_eq_zero
#check @RankObstruction.extinction_bound

#print axioms RankObstruction.apply_pow_eq_zero_of_eventually
#print axioms RankObstruction.apply_pow_finrank_eq_zero
#print axioms RankObstruction.extinction_bound

#check @Stage3cFractions.exists_common_denominator_finset
#check @Stage3cFractions.exists_common_denominator
#check @Stage3cFractions.exists_equalising_denominator_finset
#check @Stage3cFractions.exists_equalising_denominator
#check @Stage3cFractions.exists_annihilating_denominator

#print axioms Stage3cFractions.exists_common_denominator_finset
#print axioms Stage3cFractions.exists_common_denominator
#print axioms Stage3cFractions.exists_equalising_denominator_finset
#print axioms Stage3cFractions.exists_equalising_denominator
#print axioms Stage3cFractions.exists_annihilating_denominator

#check @Stage3cKaroubi.shift
#check @Stage3cKaroubi.karoubi_hasBinaryBiproducts
#check @Stage3cKaroubi.shift_additive
#check @Stage3cKaroubi.shift_obj_X
#check @Stage3cKaroubi.shift_obj_p
#check @Stage3cKaroubi.shift_map_f
#check @Stage3cKaroubi.shiftToKaroubiIso
#check @Stage3cKaroubi.shiftToKaroubiIso_hom_f
#check @Stage3cKaroubi.shiftToKaroubiIso_inv_f
#check @Stage3cKaroubi.shiftToKaroubiIso_naturality
#check @Stage3cKaroubi.shiftToKaroubiIso_inv_naturality
#check @Stage3cKaroubi.shiftAddIso
#check @Stage3cKaroubi.lift_exact
#check @Stage3cKaroubi.coyoneda_exact₂
#check @Stage3cKaroubi.coyoneda_exact₃
#check @Stage3cKaroubi.coyoneda_exact₁
#check @Stage3cConeSplitting.nonempty_iso_of_hom_exact
#check @Stage3cConeSplitting.nonempty_iso_of_complementary_retracts
#check @Stage3cConeSplitting.coneSplittingIso

#print axioms Stage3cKaroubi.shift
#print axioms Stage3cKaroubi.karoubi_hasBinaryBiproducts
#print axioms Stage3cKaroubi.shift_additive
#print axioms Stage3cKaroubi.shift_obj_X
#print axioms Stage3cKaroubi.shift_obj_p
#print axioms Stage3cKaroubi.shift_map_f
#print axioms Stage3cKaroubi.shiftToKaroubiIso
#print axioms Stage3cKaroubi.shiftToKaroubiIso_hom_f
#print axioms Stage3cKaroubi.shiftToKaroubiIso_inv_f
#print axioms Stage3cKaroubi.shiftToKaroubiIso_naturality
#print axioms Stage3cKaroubi.shiftToKaroubiIso_inv_naturality
#print axioms Stage3cKaroubi.shiftAddIso
#print axioms Stage3cKaroubi.lift_exact
#print axioms Stage3cKaroubi.coyoneda_exact₂
#print axioms Stage3cKaroubi.coyoneda_exact₃
#print axioms Stage3cKaroubi.coyoneda_exact₁
#print axioms Stage3cConeSplitting.nonempty_iso_of_hom_exact
#print axioms Stage3cConeSplitting.nonempty_iso_of_complementary_retracts
#print axioms Stage3cConeSplitting.coneSplittingIso

#check @Stage3cOddDouble.complementDecomposition
#check @Stage3cOddDouble.complement_matrix
#check @Stage3cOddDouble.firstDouble
#check @Stage3cOddDouble.shiftedDecomposition
#check @Stage3cOddDouble.thirdDouble
#check @Stage3cOddDouble.exists_odd_doubles

#print axioms Stage3cOddDouble.complementDecomposition
#print axioms Stage3cOddDouble.complement_matrix
#print axioms Stage3cOddDouble.firstDouble
#print axioms Stage3cOddDouble.shiftedDecomposition
#print axioms Stage3cOddDouble.thirdDouble
#print axioms Stage3cOddDouble.exists_odd_doubles

/-! Stage 4a: conditional inputs and their transitive projection use.
The traversal inspects project proof/definition bodies. Mathlib cannot depend
on project interfaces, so imported non-project bodies need not be traversed.
This supplements, and does not replace, the exhaustive axiom gate. -/

private def stage4aInterfaceStructures : List Lean.Name := [
  `FindimCounterexample.Stage4a.TateDuality,
  `FindimCounterexample.Stage4a.PolynomialSelfExtensions]

private def stage4aProjectionNames (env : Lean.Environment) : Array Lean.Name :=
  stage4aInterfaceStructures.toArray.flatMap fun name =>
    ((Lean.getStructureInfo? env name).map (fun info => info.fieldInfo.map (·.projFn))).getD #[]

private partial def stage4aPrimitiveProjections (env : Lean.Environment)
    (e : Lean.Expr) : Array Lean.Name :=
  match e with
  | .proj s i b =>
    let here := if stage4aInterfaceStructures.contains s then
        (((Lean.getStructureInfo? env s).bind (·.getProjFn? i)).toArray) else #[]
    here ++ stage4aPrimitiveProjections env b
  | .app f a => stage4aPrimitiveProjections env f ++ stage4aPrimitiveProjections env a
  | .lam _ t b _ | .forallE _ t b _ =>
    stage4aPrimitiveProjections env t ++ stage4aPrimitiveProjections env b
  | .letE _ t v b _ => stage4aPrimitiveProjections env t ++
    stage4aPrimitiveProjections env v ++ stage4aPrimitiveProjections env b
  | .mdata _ b => stage4aPrimitiveProjections env b
  | _ => #[]

private partial def stage4aFields (env : Lean.Environment) (name : Lean.Name) :
    StateM (Lean.NameSet × Lean.NameSet) Unit := do
  let (seen, found) ← get
  if seen.contains name then return
  set (seen.insert name, found)
  if (stage4aProjectionNames env).contains name then
    modify fun (s, f) => (s, f.insert name)
  unless (`FindimCounterexample).isPrefixOf name do return
  if let some info := env.find? name then
    if let some body := info.value? (allowOpaque := true) then
      (stage4aPrimitiveProjections env body).forM fun n =>
        modify fun (s, f) => (s, f.insert n)
      body.getUsedConstants.forM (stage4aFields env)

elab "#stage4a_fields " id:ident : command => do
  let name ← Lean.Elab.Command.liftCoreM <| Lean.Elab.realizeGlobalConstNoOverloadWithInfo id
  let env ← Lean.getEnv
  let (_, (_, found)) := (stage4aFields env name).run ({}, {})
  Lean.logInfo m!"Interface projections in {name}: {found.toArray.qsort Lean.Name.lt}"

#check @Stage4a.TateDuality
#print axioms Stage4a.TateDuality

#check @Stage4a.PolynomialSelfExtensions
#print axioms Stage4a.PolynomialSelfExtensions

#check @Stage4a.TateDuality.right_factorization
#print axioms Stage4a.TateDuality.right_factorization
#stage4a_fields Stage4a.TateDuality.right_factorization

#check @Stage4a.Toda.bracket_nonempty
#print axioms Stage4a.Toda.bracket_nonempty
#stage4a_fields Stage4a.Toda.bracket_nonempty

#check @Stage4a.Toda.bracket_eq_coset
#print axioms Stage4a.Toda.bracket_eq_coset
#stage4a_fields Stage4a.Toda.bracket_eq_coset

#check @Stage4a.Toda.juggling
#print axioms Stage4a.Toda.juggling
#stage4a_fields Stage4a.Toda.juggling

#check @Stage4a.Toda.bracket_eq_of_distinguished_cones
#print axioms Stage4a.Toda.bracket_eq_of_distinguished_cones
#stage4a_fields Stage4a.Toda.bracket_eq_of_distinguished_cones

#check @Stage4a.tate_obstruction
#print axioms Stage4a.tate_obstruction
#stage4a_fields Stage4a.tate_obstruction

#check @Stage4a.HigherObstruction.polynomial_toda_eq_zero
#print axioms Stage4a.HigherObstruction.polynomial_toda_eq_zero
#stage4a_fields Stage4a.HigherObstruction.polynomial_toda_eq_zero

#check @Stage4aRank.oneFactor_rank
#print axioms Stage4aRank.oneFactor_rank
#stage4a_fields Stage4aRank.oneFactor_rank

#check @Stage4a.beta_comp_eq_zero
#print axioms Stage4a.beta_comp_eq_zero
#stage4a_fields Stage4a.beta_comp_eq_zero

#check @Stage4a.beta_shift_comp_eq_zero
#print axioms Stage4a.beta_shift_comp_eq_zero
#stage4a_fields Stage4a.beta_shift_comp_eq_zero

#check @Stage4a.Cone.oneCone_i_bijective
#print axioms Stage4a.Cone.oneCone_i_bijective
#stage4a_fields Stage4a.Cone.oneCone_i_bijective

#check @Stage4a.Cone.oneCone_pi_bijective
#print axioms Stage4a.Cone.oneCone_pi_bijective
#stage4a_fields Stage4a.Cone.oneCone_pi_bijective

#check @Stage4a.Cone.oneCone_profile
#print axioms Stage4a.Cone.oneCone_profile
#stage4a_fields Stage4a.Cone.oneCone_profile

#check @Stage4a.Cone.oneCone_composite_zero
#print axioms Stage4a.Cone.oneCone_composite_zero
#stage4a_fields Stage4a.Cone.oneCone_composite_zero

#check @Stage4a.one_factor_rank
#print axioms Stage4a.one_factor_rank
#stage4a_fields Stage4a.one_factor_rank

#check @Stage4a.one_factor_obstruction
#print axioms Stage4a.one_factor_obstruction
#stage4a_fields Stage4a.one_factor_obstruction
