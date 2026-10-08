# Protection of inline mathematics

Claude Opus 5.5, at Gustavo's request ("adding curly braces to protect inline equations; fix any resulting
overflows"). Every inline formula `$…$` of `report/sections/*.tex` with a relation or binary operator at its top
level (a possible line break) was wrapped as `${…}$` (1 423 formulas); formulas in section titles were left
alone. The resulting 24 overfull lines were fixed as follows:

- in most cases, a protected formula in the paragraph was split at its top-level relations, `${A}\cong{B}$`,
  so that each side stays unbreakable and a break is allowed only after the relation (done by script,
  longest candidate first, recompiling after each round); the same was done for the three isomorphisms of
  Lemma 8.3(1), whose line was loose;
- three paragraphs were reworded slightly instead: the example after Proposition 3.8 (the algebra is
  introduced after the module), the proof of Proposition 6.4 (one sentence split in two), and Remark 7.6 (the
  citation moved to the end of the clause).

Check: after removing all braces and whitespace, the sources agree with the previous version except for these
three rewordings. Result: no overfull boxes, no undefined references, 53 pages.
