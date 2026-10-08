# Job A-inventory: inventory of computations for Appendix A of the report

Context: `README.md`, `AGENTS.md`. The report `report/` cites computations in `\Cref{app:computations}` from
sections 4–10 (`grep -n "app:computations" report/sections/*.tex` lists the places). You produce the
factual inventory from which Claude will write Appendix A. Do not write prose for the report.

Deliverables:

1. `report/notes/appendix-A-inventory.md`: for every place in `report/sections/*.tex` that cites
   `app:computations`, and for every computation under `computations/` that supports a statement of the
   report, one entry with: the report statement it supports (file:line and label); script path(s);
   language/system (Python standard library, Sage, …); ground field and exact parameters (e.g. F_{2^16}
   with modulus and seeds, F_2(q), F_2[q,λ]); what exactly is computed and the exact scope (degrees,
   ranges, numbers of cases); the result as saved in the output file (quote the key line); the command to
   rerun it; and whether you reran it now (do rerun every script that finishes within ten minutes with the
   system Python or Sage, and record success/failure and whether the output matches the saved output).
   Include in particular: associativity of C and T (1000 and 8000 triples); the cochain identities of
   lemma:cocycle (cocycle, weight, boundary identity (all coefficients in λ), the two evaluations); the
   Casimir identities used in prop:lifts; the dimension of C_1 and of Λ (rem:ar-sizes: recompute
   dim C_1 = 1 623 889 344 from the bar complex dimensions and the cohomology E, E², E in degrees 0, 2, 4,
   and dim Λ ≈ 1.703·10^35); the two-factor minimised computation (intermediate dimensions 784 704 and
   1 377 984; where it stopped and why); the test bed Λ₀, the candidate Λ₁ and the three one-factor attempts
   of section 10 (dimensions, fields, degree ranges, results); the selection-group finite checks
   (m ≤ 10); the rectification sign check; the D-A sign and example checks; the D-D cone-sign check.
2. `report/notes/appendix-A-cochain-table.tex`: the 179-entry table of the cochain p in LaTeX (a
   `tabular` with rows by coefficient q^d and the words in \texttt), copied exactly from
   `.cache/ar-src/09-cochain.tex` lines 15–45, with a script check that the copy has the same 179 entries.

Modify nothing else. Final answer at most 20 lines, first line model and effort.
