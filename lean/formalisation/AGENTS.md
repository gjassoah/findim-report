# Instructions for AI agents

- Read `README.md` first. Keep the pinned versions in `lean-toolchain`, `lakefile.toml` and
  `lake-manifest.json`.
- Proofs must be kernel-checked: no `sorry`, `admit`, custom axioms, `native_decide` or other native
  shortcuts, no raised heartbeat or recursion budgets. Transitive axioms only `propext`,
  `Classical.choice`, `Quot.sound`. Files under 1500 lines, organised by topic.
- Statements must say what the informal statements say; record every departure in `README.md`, update
  `Audit/Statements.lean`, and run `tools/gates.sh` before any commit.
- This library is unconditional: no hypothesis structures. Do not add any without the author's approval.
- Do not push or publish without the author's approval.
