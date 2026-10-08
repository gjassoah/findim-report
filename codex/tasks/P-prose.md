# Job P-prose: list AI-like prose in the report (proposals only)

Read `MATHEMATICAL_WRITING_STYLE.md` and `AI_WRITING_PROCESS.md` in full
(read only). Then read every file in `report/sections/*.tex` and the abstract and caveat in `report/main.tex`.

The author asks for a final pass "with the aim of removing AI-like prose. For example 'an Auslander–Reiten
counterexample' should be 'a counterexample to the Auslander–Reiten conjecture'." Find every passage of that
kind: coined shorthand used as if it were standard terminology (such as "Auslander–Reiten counterexample",
"two-cone bimodule", "one-factor design", "selection functor" outside its definition, "odd double" outside its
definition, "visible rank"), noun stacks and jargon that a specialist would not write, slogans, words such as
"mechanism", "layer", "ingredient", "machinery", "insight", "key", "crucial", "genuinely", "precisely" used for
emphasis, announcements of what a paragraph will do, summary sentences that restate, sentence openings that
rotate connectives, explanations of the obvious, unnecessary hedging, and anything else the style files flag.
For terms that are defined in the article and used consistently, judge whether the name itself is natural; if
not, propose a better name and list every occurrence. Do not change mathematics or statements.

Write `audit/P-prose-codex.md`: a table with file:line, the current text (short quotation), the proposed
replacement, and the rule it violates. Group by file. Do not edit the report. Final answer at most 15 lines,
first line model and effort.
