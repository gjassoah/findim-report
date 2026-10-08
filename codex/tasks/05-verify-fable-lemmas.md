# Codex job 05: independent verification of three structural lemmas

You are a verifier (see `README.md`, `AGENTS.md`). Find errors; do not confirm. Read only
`scratch/05-frozen-fable-lemmas.md` for the claims (do not open `escalations/`, `notes/`, `LEDGER.md`,
`log/`, `codex/outputs/`).

For each of Lemma 1, Lemma 2, Lemma 3 and the "two-line" claim about hereditary algebras of finite type:
check every step, the left/right conventions, and the quantifiers; test on small examples where hypotheses
partially hold; verdict *no error found* / *error found* (step, reason) / *gap*. For Lemma 3 also check the
recollement conventions (which functor is exact, which adjoint is used, the shape of the triangle) and the
splitting argument at the end. Search for literature for each (give exact locators only for sources you
read). Write incrementally to `audit/05-verification-fable-lemmas-codex.md`; final answer at most 25 lines;
first line model and effort. Modify no other file.
