# Job L-feasibility: Mathlib inventory for a formalisation of the report

Context: `README.md`, `AGENTS.md`, `lean/DESIGN.md`, `lean/FEASIBILITY.md` (earlier part-I note). The Lean project is
`findim-counterexample-formalisation` (Lean 4.33.1, Mathlib pinned in
its `lake-manifest.json`; sources under `.lake/packages/mathlib`). Read only; do not modify that repository, do not
download anything, do not build Mathlib.

Task: for every numbered result of the report (`report/sections/*.tex`; list them with labels), record what the pinned
Mathlib provides and what is missing for a formal statement and proof, by searching the Mathlib sources (grep for
declarations; cite file paths and declaration names you actually found). Cover in particular: abelian categories with
enough projectives, `HasExt`/`Ext` and projective dimension; module categories over noncommutative rings, `Module.Dual`;
derived categories, homotopy categories, triangulated categories, Verdier localisation and calculus of fractions,
idempotent completion (`Karoubi`), Grothendieck groups of triangulated/abelian categories; stable module categories,
Frobenius categories, symmetric (Frobenius) algebras, Tate cohomology/duality; Toda brackets; trivial extensions /
square-zero extensions; path algebras and quivers with relations; group presentations, finitely presented groups,
group algebras (`MonoidAlgebra`), matrix groups over `Polynomial`/quotients; tensor products of algebras and of
bimodules; finite-dimensional algebras, Jacobson radical, Krull–Schmidt; dg algebras/modules, K-flatness.

For each result give: (a) Mathlib coverage of the objects in its statement; (b) missing infrastructure, with a rough
size estimate (small/medium/large/very large, and lines of Lean if you can estimate); (c) whether a conditional
formalisation (stating the missing infrastructure as hypotheses or structure fields) would be meaningful.
Write `lean/FEASIBILITY-report-inventory.md` incrementally. Modify nothing else. Final answer at most 20 lines,
first line model and effort.
