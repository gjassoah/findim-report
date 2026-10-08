import Lean

/-!
# Transitive axiom report

Infrastructure only; this module is never imported by the mathematics.
Select declarations by their defining module, not by namespace, so that private
helpers and declarations in other namespaces cannot escape inspection.
Use Lean's own traversal of types and values, without a custom reachability cache.
The build and kernel replay are separate checks; importing an environment here
does not recheck the validity of its proof terms.
-/

open Lean

private def allowed : List Name := [``propext, ``Classical.choice, ``Quot.sound]

private def report (modules : Array Name) : CoreM (Array String × Bool) := do
  let env ← getEnv
  let imported := env.allImportedModuleNames
  let mut rows := #[]
  let mut clean := true
  let mut theoremCount := 0
  for (name, info) in env.constants.toList do
    let some idx := env.getModuleIdxFor? name | continue
    let some mod := imported[idx.toNat]? | continue
    unless modules.contains mod do continue
    let axioms ← collectAxioms name
    if axioms.any (fun a => !allowed.contains a) then clean := false
    if info matches .thmInfo _ then theoremCount := theoremCount + 1
    rows := rows.push <| (Json.mkObj [
      ("declaration", toJson name.toString),
      ("module", toJson mod.toString),
      ("theorem", toJson (info matches .thmInfo _)),
      ("axioms", toJson (axioms.map Name.toString))]).compress
  rows := rows.push <| (Json.mkObj [
    ("modules", toJson (modules.map Name.toString)),
    ("declarations", toJson (rows.size)),
    ("theorems", toJson theoremCount)]).compress
  return (rows, clean && theoremCount > 0)

def main (args : List String) : IO UInt32 := do
  if args.isEmpty then
    IO.eprintln "No modules supplied to the axiom audit."
    return 1
  initSearchPath (← findSysroot)
  let modules := args.toArray.map String.toName
  -- Render all names while the imported environment is alive.
  let (rows, clean) ← unsafe Lean.withImportModules
      (modules.map fun m => { module := m }) {} (trustLevel := 1024) fun env =>
    Prod.fst <$> Core.CoreM.toIO (report modules)
      { fileName := "<axiom-audit>", fileMap := default } { env := env }
  for row in rows do IO.println row
  return if clean then 0 else 1
