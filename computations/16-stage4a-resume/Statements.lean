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
