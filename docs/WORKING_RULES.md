# Working rules

The AI agents in this task work under instruction files that Gustavo Jasso maintains for AI-assisted
mathematics. This file gives extended summaries of them, not copies, so that a reader of this repository can
see the guidelines and the workflow under which the work was done. Rules marked **(hard rule)** are hard
rules in the originals; all other rules are strong defaults that can be departed from with a recorded reason.

Precedence for this task: mathematical correctness and honest reporting first; then Gustavo's explicit
instructions (recorded in `log/CONVERSATION.md` and `README.md` §4); then the task README; then the files
summarised here. Where Gustavo's decisions for this task depart from a rule below, the departure is noted.

Files summarised: AI_RESEARCH_PROCESS (research workflow; the most important one here), LEAN_FORMALISATION,
CODE_AND_APP_DEVELOPMENT, AI_WRITING_PROCESS, MATHEMATICAL_WRITING_STYLE, MATHEMATICAL_DOCUMENT_REVIEW,
LATEX_PREAMBLE_STYLE.

## AI_RESEARCH_PROCESS.md (Version 1.0)

Purpose and scope. Governs how mathematics is found, checked and recorded in AI-assisted research:
exploration, proofs, verification, literature, computation and formalisation. Writing a manuscript from the
results is governed by the writing files below. A project-specific task README (here `README.md`) states the
problem, the inputs and the decisions, and overrides this file where they conflict.

Preconditions
- Read every instruction file the task names before starting; if one cannot be read, say so and stop before
  any dependent work. Never work from a remembered version (hard rule).

Status of claims. Every mathematical claim carries exactly one status:

| Status | Meaning |
|---|---|
| heuristic | Expected for structural reasons or by analogy; no argument |
| plausible | An argument exists in outline; its steps are unchecked |
| supported | Checked in explicitly listed cases (by hand or computer); no general argument |
| AI-proved | A complete written proof, produced or checked by an AI, every step justified or cited |
| AI-verified | AI-proved, and passed an independent check of a *different kind* (see below) |
| refuted | A checked counterexample or disproof exists; a corrected statement becomes a new claim |
| open | None of the above, or attempts failed; what was tried is recorded |

- Never call a claim proved, established, known or true unless the author has checked it or it is cited
  (hard rule). Never
  change a status silently: promotions record evidence, demotions record reasons (hard rule).
- A status assigned by an earlier session, another model or an AI draft only records that agent's belief;
  words like "verified" or "PASS" in such material are not evidence (hard rule).
- Side statements (in examples, remarks, footnotes, proof sketches) are claims too.

Trust in inputs. The author's statements of intent are authoritative for what is wanted, not for
mathematical truth; the author's own mathematical claims and the framing of the task are checked like any
other claim, and a doubtful framing is reported, not silently reinterpreted (hard rule). Published
literature is trusted once the statement and hypotheses are read in a pinned version; AI drafts, earlier
sessions and answers from other models are leads only; the model's memory may suggest where to look, never
supply a statement, citation or locator.

Interactive work. The AI acts as a research partner with calibrated, visible confidence: commit to a best
guess with its status and reason; separate what was checked from what was guessed; test the smallest and
degenerate cases before asserting; say in the first sentence if the question answered is a modified one;
never give a citation or attribution from memory as fact (hard rule); state where an argument is weakest;
disagree with the author when there is reason to.

Exploration and proofs
- Fix definitions and every sign, shift, twist, direction and indexing convention in writing before
  computing.
- Refute before building: try smallest cases, degenerate cases, the classical special case, the quantifiers,
  and whether each hypothesis is needed.
- When an untrusted proof exists, attempt the proof before reading it, then compare. Write proofs in
  individually checkable steps; never cover an unchecked step with "clearly" or "a standard argument shows"
  (hard rule). Prefer a smaller result with a complete proof to a larger one with a gap. Record failed
  approaches briefly with the reason for failure.

Verification
- Verify in a fresh context (subagent, new session or another model) given the statement, proof,
  conventions and cited results, but not the prover's confidence; instruct it to find errors, check every
  step, quantifier, sign and cited hypothesis, and write its report to a file as it goes.
- The status AI-verified needs at least one independent check of a different kind: a computation written
  independently of the proof, verification by a different model, a formal proof, or reading a cited statement
  in its source. A second reading by the same model does not suffice by itself (hard rule).
- Report exactly what was checked, how, and what was not; an AI verification never counts as certification
  (hard rule).

Literature. Search arXiv, MathSciNet, zbMATH and the author's reference library; the absence of a hit is not
evidence of novelty. Papers are imported into the author's library by a fixed workflow, not stored in task
directories. Pin the version of every source and read statements with all hypotheses and standing
assumptions before applying them, with a verbatim quotation and locator when used in a proof (hard rules).
Render pages as images when text extraction fails. Attribute results to the work that proves them; never
claim novelty or priority without the author's confirmation (hard rule). Retrieval may be delegated to a
smaller model; deciding whether a result applies may not.

Computation. Use computation for everything it can check (signs, dimensions, small cases, candidate
counterexamples). Every script supporting a claim lives in `computations/`, starts with a header stating the
claim, the cases and the conventions, and has its output saved next to it. Exact arithmetic unless
impossible. State the scope precisely ("holds for d ≤ 4 over ℚ" supports nothing more) (hard rule). Claims
that a main result depends on are recomputed independently, from the definitions.

Formalisation. Suggested only when not demanding (prerequisites essentially in Mathlib); feasibility is
assessed first by searching Mathlib, not from memory; a formal proof resting on unproved axioms or `sorry`
is not a formal proof (hard rule). Formalise selectively and check that the formal statement says what the
informal one says. (In this task Gustavo asked for formalisation and delegated the scope decision; see
`docs/PLAN.md`, Phase 5.)

Long autonomous tasks. Phases: orientation, dossier, refutation, redesign, development, verification gate,
writing, review and report. Working files: `PROGRESS.md` (short; read at the start of every session),
`QUESTIONS.md`, `PROVENANCE.md`, `LEDGER.md` (one row per claim), `notes/`, `computations/`, `audit/`,
`scratch/`. Resume from the record, write as you go (never only at the end), and keep the bookkeeping
proportionate: no ledger rows faster than claims are examined, no process jargon (hard rule). By default the
AI does not commit to git (hard rule); in this task Gustavo authorised local commits at milestones.

Questions and decisions. Reserved for the author: the intent of the project, the choice between
inequivalent definitions, demoting or changing a main result, remarks about errors in others' work or about
attribution, disclosure, and anything that leaves the working directory. Everything else the AI decides and
records with its reason. Questions go to `QUESTIONS.md` with options, consequences and a recommendation; work
continues under the recommendation, marked provisional, unless it would be wasted. Steps beyond the current
model's reach may be written up as self-contained escalations for a stronger model; the answers are
untrusted input.

Models. Judgement (verdicts, core proofs, conventions, attribution, resolving disagreements between
verifiers) belongs to the strongest available model; smaller models produce only checkable output
(quotations, listings, script runs), which is checked before use. A weaker model's verdict never overrides a
stronger one's. The model behind each unit of work is recorded; if unknown, it is written as unknown.

Reports, provenance, disclosure. The task ends with `REPORT.md`: every result with status and evidence; what
was refuted, demoted or left open; decisions and default branches taken; the riskiest remaining steps; models
used and what was not done. The report describes what happened and does not round up (hard rule).
`PROVENANCE.md` records the origin of every idea and argument. Disclosure of AI assistance in a manuscript is
the author's decision and neither overstates nor understates it.

## LEAN_FORMALISATION.md (Version 1.0)

Purpose and scope. Refines the formalisation section above for Lean 4 with Mathlib: scope and feasibility,
conditional formalisation, acceptance rules, verification gates and repository practice. Project rules may add
to it but never relax its acceptance rules.

Scope
- Assess feasibility first; decide in writing which parts are formalised unconditionally (down to Mathlib),
  which conditionally, and which are left out; exclusions remove obligations and are not coverage.
- Never change the paper to fit a formal statement (hard rule).

Conditional formalisation (when Mathlib lacks theory whose formalisation is out of proportion)
- Hypotheses are fields of Lean structures passed as arguments, never `axiom` declarations, so that each
  theorem's dependence is visible and an inconsistent hypothesis can only make theorems vacuous (hard rule).
- Each field is a standard definition, a textbook fact, or a published result stated close to its source with
  an exact locator; nothing the paper proves is assumed, and no field assumes a conclusion (hard rule).
- No trivialisation: distinct objects stay distinct types; identifications the paper proves are hypotheses or
  theorems, never definitions.
- The author approves every hypothesis, one by one, from a design document before Lean is written for it
  (hard rule). Small models show consistency of the interfaces where feasible. Conditional results live in a
  separate library and are reported as conditional.

Correspondence with the paper. A table matches each statement to its Lean declarations; a listing file
prints their types and axioms (and, for conditional results, the hypotheses used, computed from the proof
terms). No extra finiteness, splitting or other assumptions in place of the paper's, no vacuous types, no
circular interfaces (hard rule). Every difference is a numbered, recorded departure.

Acceptance rules (all hard rules). Every accepted declaration is kernel-checked: no `sorry`, `admit`,
custom axioms or placeholders; no `native_decide` or other compiler-backed shortcuts; no raised heartbeat or
recursion limits; transitive axioms only `propext`, `Classical.choice`, `Quot.sound`; files at most 1500
lines. Proofs should be concise and readable, reuse Mathlib, and build with warnings as errors.

Dependencies and gates. Search pinned Mathlib sources before defining anything; pin the toolchain and the
Mathlib commit; fetch only the needed prebuilt files. At each milestone run, in order: a source scan, a full
build, an exhaustive axiom report, the statement listing, and a kernel replay with `leanchecker`, saving
logs, exit codes and source hashes. Correspondence reviews by the same model are not independent (hard rule).

Repository practice. The Lean repository holds only sources, build configuration, a README (scope,
hypotheses, correspondence, departures, status) and agent instructions; development history stays in a
separate record (here `lean/` in this repository). One commit per stage, each building on its own; push only
on the author's request (hard rule). A checkpoint lets a new session resume without the conversation.
Practical guidance: prefer working on representatives and `change`/`exact` over rewriting across casts; do
not abstract whole structures in long proofs; prove fold lemmas by induction on lists; prefer linear maps;
run long builds in the background.

## CODE_AND_APP_DEVELOPMENT.md (Version 1.0)

Purpose and scope. Ground rules for writing code, installing tools, building and testing on the author's
workstation.

- Install tools from the operating system's official repositories first, then from reviewed community
  packages, and locally only as a last resort, pinned and documented. Never version managers, `curl | sh`
  installers, global language-level installs, or unpacked toolchain binaries. Library dependencies that exist
  only in a language registry are pinned by a lockfile and cached, not installed globally. The AI does not
  run commands with administrator rights; it gives the author the command.
- A project directory, including ignored files, stays at or below 5 GB; regenerable material is deleted in a
  fixed order if needed, and never tracked files, sources, local-only data or credentials.
- Every code project is its own git repository with `README.md`, `AGENTS.md` and `.gitignore`; local commits
  need no approval. Every interaction with GitHub (creating a repository, every push, every other `gh`
  command) needs the author's approval each time; repositories are created private.
- A standard root layout (`docs/`, `tools/`, `tests/`, `data/`, ignored `.cache/` and `.local/`); no loose
  prose or scripts at the root.

## AI_WRITING_PROCESS.md (Version 1.3)

Purpose and scope. This file governs what an AI may write in a mathematical paper, how uncertainty and provenance are recorded, and how work is returned to the author. It is loaded together with the prose-style file, which governs how the text reads. Its aim is better mathematical prose for human readers together with a transparent record of what the AI contributed; nothing in it is meant to conceal AI assistance.

Task declaration and coauthors
- At the start of each task, establish genre (article, survey, lecture notes), mode (drafting from notes or editing), manuscript status, authorship of the text in scope, and target venue. If an item is missing and immaterial, state an assumption in one line and proceed.
- The author's voice is applied only to text the author is responsible for. In coauthors' sections, fix grammar and punctuation, flag other suggestions, and do not normalise shared conventions without instruction.

Verification and uncertainty
- Never present unverified mathematics, citations or literature claims as established; mark them in the source so that they cannot reach a submitted version unnoticed (hard rule).
- Three red marker macros are used during drafting: one for a claim or step not yet verified, one for a reference or locator not verified against the source, one for a missing argument, with a one-line statement of what is missing.
- Drafted content is kept in four categories that are never moved silently: proved (in the notes or a cited source), plausible but unverified, requiring an extra lemma, and open. An AI-generated mathematical suggestion counts as unverified until the author confirms it.
- Words that hide steps ("clearly", "it is easy to see", "a standard argument shows") must never cover an unchecked step; a marker is used instead (hard rule).

Citations and attribution (all hard rules)
- Cite only works that are in the bibliography file, supplied by the author, or verified from an authoritative source (publisher, arXiv, MathSciNet, zbMATH). Never invent keys, entries or data.
- Before adding or checking an entry, look it up in the author's own reference library and read statements and locators in the corresponding PDF when one exists; library entries carrying MathSciNet data count as verified.
- Never supply a theorem, section or page locator from memory; write the citation with an unverified-locator marker instead.
- Attribute a result to the paper that proves it, not to a later paper using it, unless the citation is explicitly secondary.
- Record every citation the AI added, with how it was verified, in the change summary.
- Make no priority or novelty claim ("to our knowledge", "first") unless the author has confirmed it.

Output format
- Editing returns the edited text (minimal diff or full passage) and a change summary grouped as: grammar and punctuation; compression and restructuring (one line each, with reason); substantive changes (anything altering a statement, hypothesis, reference or order of argument); suspected mathematical issues (never fixed silently, each described precisely, distinguishing an error from an expository gap, with a proposed repair). Changes not made are not listed, and the passage is not summarised.
- Drafting returns the text with markers in place, a list of all markers inserted, and the assumptions made.

Provenance and disclosure
- During drafting, a source comment before each passage records its origin (AI draft from notes, AI edit of author text, author-revised), with model and date. A passage becomes author-revised only when the author has checked its mathematics and wording.
- For manuscripts written entirely or substantially by AI, individual comments are replaced by one declaration at the top of the main file, naming every model that drafted or edited it, with the stage of its work; each model that edits the manuscript adds itself in the same change.
- The provenance of ideas (author, coauthor, cited work, AI exploration) is recorded where relevant; an AI-originated idea is never turned into unattributed text without the author's decision.
- Journal and arXiv policies on AI use must be checked before submission. The acknowledgement template states what the model was used for and that the author checked everything and takes responsibility. Assistance is neither overstated nor understated.
- Models are named exactly as the project's records name them, never from memory, with effort settings and dates when recorded; anything the records do not settle is marked. When formalised results are moved, renamed or deleted, this is recorded in the review ledger and flagged in the declaration.

Drafting from notes
- Extract the logical spine; fix notation before prose; write statements first with every needed hypothesis; write proofs in logical blocks; place citations where they do mathematical work; add motivation selectively; mark every unverified item; run the style check.

Pre-submission checks and style-file validation
- A list of shell searches is run before submission: leftover markers, unrevised AI passages, spelling consistency, spaced dashes, hyphens after -ly adverbs, recurrent grammar errors, locator punctuation, comma splices, word-order slips, wording about the authors of the article, and stock AI phrases. Then the manuscript is compiled, added bibliography entries are verified, the marker macros are removed from the preamble so that any remaining marker breaks compilation, and the author decides whether provenance comments stay in the source posted to arXiv.
- The style file is validated by having a model redraft a recent section from notes, comparing it with the original, and amending the rules for recurring (not one-off) differences; a separate test checks that correct wording in an older paragraph is left untouched.

Long tasks and large edits
- Multi-session or agentic work keeps a progress file (sections done, in progress, pending; open markers; decisions) and, if used, a provenance file; completed and author-revised work is not redone unless asked.
- Before restructuring: commit a checkpoint; read all affected sections in full; write a notation table with clashes resolved with the author; make one kind of change per pass (mathematics and structure, then notation, then style); test each pass as a diff on a compiled copy; apply exactly what was tested. Before proposing cuts, build the variants and report what each saves.

## MATHEMATICAL_WRITING_STYLE.md (Version 2.7)

Purpose and scope. This file describes the author's prose voice for research articles and surveys. It governs only how prose reads; verification, citations and provenance belong to the process file. It contains annotated exemplars (an introduction, a theorem with proof, a delicate proof step, a definition with a remark, a survey introduction) to be imitated in structure, never in wording.

Precedence and genre
- Order of precedence: mathematical correctness; the author's current instructions; enforced journal style; standard field terminology; conventions of an existing manuscript; this file. A statement, hypothesis, quantifier, sign or dependency is never altered to improve style.
- Genre sets how much applies: research article (all rules), survey (relaxations for reader guidance and motivation), lecture notes (grammar, punctuation, spelling and vocabulary only; concision defaults do not apply), popular exposition (grammar and spelling only).
- Rules are strong defaults unless tagged hard, or tagged context-dependent (used only when the local mathematical purpose supports it).

Global principles
- The governing maxim is to be kind to the reader: define what is needed, one notation per object, no notion before its introduction, proofs that can be checked, no unused material, and no explanation of what the reader already knows.
- Prose must do mathematical work (state, introduce, explain a dependency, justify, distinguish cases, motivate, interpret, locate in the literature) or be deleted. Write for specialists; let formulas carry their share; keep a calm, factual tone; seek concision without loss of information and without choppiness.

Voice
- Use "we" for authorial actions, also in solo papers; impersonal forms for general facts; minimal direct address in articles (more controlled guidance is allowed in surveys). Passive or active according to the natural topic.
- Present tense for the article's content and for what cited works say; past tense for historical acts.
- No contractions (hard rule). The work is called "this article" or "this survey", not "this paper".

Grammar (all hard unless noted)
- Correct existential agreement ("there exists a", "there exist"), agreement after long subjects, and articles.
- "That" for restrictive and ", which" for nonrestrictive clauses (strong default); repeat the noun rather than leave an ambiguous "the latter" or "it"; "data" is plural.
- No causal "for"; use "since" or "because".
- Correct verb complements ("avoid giving", "suggests considering", "allows us to construct", "consists of"); no adverb between verb and object ("we freely use"); sentence-initial comparisons compare like with like ("Like X, ..."; "As with X, ..."), and no trailing "with X being Y".

Spelling, hyphenation, dashes, abbreviations
- British spelling with -ise (also fibre, analogue, behaviour, acknowledgements) in every new manuscript; an existing manuscript keeps its own convention.
- Hyphenate compound adjectives before a noun but not after the verb (hard rule); "non-" is hyphenated; no hyphen after an -ly adverb (hard rule).
- En dash for joint names and ranges (hard rule). Em dashes unspaced and sparing; never spaced (hard rule).
- Prefer "for example" to "e.g."; "that is" takes commas on both sides and "i.e." is not used (hard rule); abbreviations are introduced in parentheses without an equals sign; "iff", "w.r.t." and "s.t." never appear in prose (hard rule); "cf." is replaced by "compare with"; "loc. cit." only when the work was just cited.
- Single quotation marks; punctuation outside unless part of the quotation.

Punctuation
- No comma between subject and verb, however long the subject, and none between a verb and a required that-clause (hard rules).
- Commas after sentence-initial connectives ("Thus,", "Hence,", "Indeed,") and after long introductory clauses; but no comma after "Then" when it introduces a conclusion after hypotheses.
- Semicolons only between closely connected independent clauses; colons only after a complete clause, followed by lower case, and never before a display that completes the sentence (hard rule).
- A display is part of its sentence and is punctuated by syntax (hard rule). Comma splices are not allowed (hard rule), including the forms ", see [X]", ", hence" before a clause, and "Let ..., then ...".
- Serial comma in lists of clauses or long phrases, omitted in short lists of symbols or names.

Sentences, concision, paragraphs
- No word limit. Keep one sentence when all clauses form a single logical move; split when functions are independent; but keep a dependency on a specific vanishing, equality or hypothesis visible. Avoid uniformly short sentences.
- Begin with the action; compress wordy forms ("in order to", "we remind the reader", "it is worth mentioning"); state a reduction once; delete qualifiers that only sound cautious; prefer verbs to nominalisations.
- State hypotheses as clauses about named objects, and never attribute a property to an object that lacks it for brevity (hard rule).
- Do not explain the obvious: no sentence that only spells out a standard notion or restates the statement (hard rule).
- A paragraph does one mathematical job, begins with the mathematical point, and ends when its task is done, without a restating sentence.

Mathematical exposition
- Definitions: fix ambient objects, state the condition, name the notion with emphasis, and cite the source for imported definitions; "if" carries the force of "if and only if" in definitions. New names must be short, descriptive, not generated-sounding, free of clashes, and used only in their defined sense.
- Quantifiers and choices (hard rules): unambiguous quantifier words, alternating quantifiers stated before the formula, dependence on parameters stated explicitly, and a fixed meaning for "Let", "Fix", "Choose" and "Suppose given".
- Words that hide steps ("clearly", "obviously", "well known") are used only when the step is routine and checked, with a mechanism or reference attached (hard rule).
- Theorem statements front-load hypotheses in a stable order and introduce the conclusion with "Then"; no hypothesis is sacrificed for elegance. Results are not given descriptive invented names; quoted results carry their attribution.
- Proofs begin with the actual move and name the exact result on which each step depends. A proof is a proof: either a precise locator for each nontrivial step or every step given, never "one checks" (hard rule).
- Computations: say what is computed and why, display it, annotate delicate equalities, and explain signs, degrees and vanishing terms. Do not simplify an argument because the notation looks heavy.
- Footnotes are for recalled definitions, glosses, pointers and caveats, never for content the argument needs.
- Organisation: prove general statements once, before applications; use environments for anything referred to later; put quoted literature facts in the preliminaries; no unused numbered result and no paragraph repeating another.

Abstracts, titles, introductions, attribution
- Abstract: two or three sentences, about 80 words at most, self-contained, present tense. Titles and section titles are plain noun phrases naming objects, not methods or verdicts.
- Open with the mathematical setting, not the importance of the field. Motivation is enough for a specialist to see why the question is natural; in surveys, necessary historical lineage is kept.
- Main results are not lettered; they are numbered or stated as unnumbered pointers to the numbered version. Roadmaps say what each section contributes, without chains of "We also".
- Attribute with exact locators and use names grammatically where relevant. Capitalise established theorem names. Never name an author of the present article in the text; use "the author", "the first-named author", etc. (hard rule).
- Use "to our knowledge" only for checked priority claims. Do not call a hypothesis or construction minimal, optimal, sharp or natural unless this is proved (hard rule).
- Acknowledgements are factual and in the third person; AI disclosure follows the process file.

Notation, references, LaTeX
- One symbol per kind of object throughout; notation defined before sustained use; no notion before it is introduced.
- Formulas are parts of sentences; no sentence begins with a symbol; adjacent formulas are separated by words (hard rules). Important definitions and long formulas go in displays; only referenced displays are numbered.
- Internal references use cleveref; citation locators use full words, with no full stop after a locator number or word (hard rule).
- Source conventions: amsart, thmtools environments, `\coloneqq`, `\colon` for maps, tikz-cd, emphasis for defined terms and no bold in prose, labels with a type prefix and hyphenated slug, TeX escapes for accents, source wrapped at 80 columns.
- A terminology glossary fixes forms such as dg, A-infinity, pre-triangulated, fully faithful, cartesian (lower case), fibre.

Connectives, characteristic constructions, AI habits
- Connectives ("Indeed,", "Moreover,", "Hence,", "Here,") are used only for the logical relation they express, not rotated for variety. A list of characteristic constructions belongs to the voice but must not be inserted without need.
- Stock AI rhetoric is avoided ("it is important to note", "key insight", "delve", "leverage", "underscores"), together with headings for small ideas, bold in running prose, automatic triples, summary paragraphs, and announcements of what a paragraph will do. When such a phrase is deleted, the sentence is rewritten, not given a near-synonym (hard rule).
- A table of habits to avoid (comma splices, missing prepositions, "in order to", "aforementioned", capital after a colon, "utilise", vague praise adjectives) records the corrections.

Editing existing prose and final check
- Leave correct, concise, idiomatic wording alone. When prose is defective: verify the mathematics, make the smallest change, compress only without loss of nuance, split only to improve parsing, preserve terminology, and do not add explanations or homogenise rhythm.
- A set of before-and-after pairs illustrates the rules. A final eleven-point checklist covers grammar, punctuation, spelling, preserved hypotheses, adjacent reasons in proofs, no repeated content, no AI phrases, rhythm, unambiguous antecedents, consistent terms and notation, and 80-column wrapping.

## MATHEMATICAL_DOCUMENT_REVIEW.md

Purpose and scope. This file is a block-by-block protocol for reviewing the author's mathematical documents for correctness, typesetting errors and genuinely necessary grammar corrections, while preserving meaning, conventions, level of detail and voice. It has a standard mode for the author's own text (clean blocks pass automatically), an interactive mode for thorough review of any manuscript, especially an AI-drafted one (every block displayed and discussed), plus an autonomous mode, a streamlining pass, and sweeps.

Editing rule and session state
- The source is not edited until the author approves the concrete proposed changes; review permission is not editing permission, and approval of one proposal does not cover unrelated improvements. Every change is shown first as a diff.
- If the author edits the file personally, those edits are never overwritten by a stale proposal; a new proposal must describe the current saved file.
- A project-local review ledger, kept outside the manuscript, records for each block: location with a stable anchor, snapshot or hash, status, pending diff and scope of approval, reasons for non-obvious decisions and rejected suggestions (recorded as constraints), next block, and uncommitted approved ranges. Unperformed checks are never marked complete; after a context reset the cursor is recovered from the ledger, not guessed.

First task and blocks
- Before the block review, a document-wide pass looks for the author's recurring grammatical errors (existential agreement, commas after "Then" and around "that is", "be" in "Let ... such that", double periods, missing articles and prepositions). Each hit is judged in context; no blanket replacements; intentional punctuation marking proof items is preserved. Fixes are proposed together as one line-numbered diff.
- A block is the smallest sensible mathematical unit (paragraph, definition, example, remark, statement, proof); blocks are numbered stably and never split merely to create checkpoints. Nothing is silently omitted; excluded scope is stated.

Criteria
- Mathematical correctness: check all claims, formulas, examples, proof steps and references, with attention to hypotheses, quantifiers, negation, converses, signs, indices, edge and empty cases, and consistency of symbols. The document's conventions are respected even where another is common. Routine omitted steps in lecture-note style are not gaps; a genuine gap is identified precisely and the review stops for the author's decision. An error is distinguished from an uncertainty.
- Typesetting: missing delimiters or text commands, malformed commands, scoping of composite exponents and indices, alignment markers, existing macro interfaces respected; intentional punctuation after labels preserved.
- Grammar and style: only clear errors or non-idiomatic wording; no optional polishing, restructuring or generic AI prose; "Then" and "that is" judged in context.

Reporting and commands
- Reports are very short, in fixed categories (mathematical correctness, typesetting, grammar and style), with no verification narrative when everything is correct. Every proposed change is a minimal unified diff with current line numbers, based on freshly read source; never reflowed or padded.
- A table of author commands (next, OK, Done, No, Pause, Resume, Commit) fixes the required action for each. Case and trailing punctuation are ignored. "Done" means the author has edited the source: re-read and check, do not reapply the old diff.
- Stopping points are binding: a short "OK" after "stop after X" is an acknowledgement, not approval of pending proposals.
- In standard mode, clean blocks are passed automatically with a compact coverage summary, stopping at the first block with findings.

Interactive and autonomous modes
- Interactive mode displays every block verbatim with line numbers, reports mathematical correctness, typesetting, grammar, and style separately (so style findings can be declined quickly), numbers each hunk, and waits. It checks additionally against the style and preamble files and, for AI-drafted text, the process file (unverified claims, locators, provenance comments). The author may edit a block by hand and return; the snapshot is recorded, the author's diff is shown, and the block is reviewed afresh. Declined style proposals become constraints, and the author's repeated edits are generalised into preferences.
- Provenance comments are updated to author-revised only on approval and only when the author has reviewed the block.
- Autonomous mode (on request, for a stated scope) decides and applies changes without waiting, reports every block in one table (clean blocks listed as clean), compiles, records decisions, does not commit, and lists any mathematical change beyond an evident slip as a proposal at the end.

Streamlining, sweeps, and application
- A streamlining pass looks for unreferenced non-main results, facts proved twice, arguments already in a cited source, repeated paragraphs and explanations of the obvious. Variants are built on copies, measured, and reported with savings; only approved items are applied.
- Document-wide sweeps (commas, double periods, "be" before "such that", composite indices, protecting braces, explanations of the obvious) record the paused block first, inspect each match, and propose one consolidated diff. Protecting inline mathematics from line breaks is a separate pass; if it causes overflow, the formula moves to a display, shown as a diff first; font sizes and margins are never changed to silence warnings.
- Applying changes: re-read, apply only approved hunks, check the resulting diff, compile in proportion to the change, record state. Compilation is never taken as proof of mathematical correctness.

Git, audit, and recovery
- No commit after every block; approved edits accumulate until the author says to commit or authorises a milestone. Commit messages begin with the block range; tags follow repository convention and are never overwritten. Committing does not authorise pushing, publishing or deployment, and unrelated or author work is never reset or discarded.
- On request, an audit compares the source with the ledger and approved diffs to find lost edits, proposes minimal restoration diffs, and states the precise gap where evidence is incomplete.
- Before a context reset, the pending proposal, cursor, latest approval, retained punctuation and rejections are saved. If the author challenges an edit, its basis is rechecked rather than defended.
- A requested fresh mathematical-correctness-only pass re-examines everything with a coverage ledger and independent checks (recomputed examples, boundary cases, circularity), uses independent agents only when authorised, and reports findings as diffs awaiting approval. An AI review is never described as a guarantee, formal verification or human certification. Reports stay brief, and permission already given is not asked for again.

## LATEX_PREAMBLE_STYLE.md

Purpose and scope. This file is a standing specification of the default LaTeX preamble for the author's papers, extended to books and lecture notes. Paper-specific material is kept out of the shared core. Evidence for each rule is labelled (strong preference, likely, permitted variant, paper-specific, obsolete, corrected), and frequent but unexamined habits are not treated as preferences.

Governing principles
- An existing manuscript wins over the canonical template unless there is a genuine bug: preserve established notation and stable macro names, and do not refactor a mature paper only to match the template.
- Keep the shared core small; paper-specific packages and macros go in a marked block. Do not infer a preference from a single occurrence.
- A journal's mandatory class and bibliography style override the specification for that submission only.
- Prefer explicit dependencies (no reliance on a package loaded indirectly) and current LaTeX-kernel interfaces (kernel document commands instead of the obsolete compatibility package).

Architecture and layout
- Default class is a4 `amsart`; a different class only when a venue requires it. The preamble is ordered: class; core mathematics; fonts and symbols; graphics and diagrams; specialist packages; theorem infrastructure; bibliography; hyperlinks; cross-referencing; core macros; paper-specific notation; theorem declarations; metadata. Hyperref is loaded late and cleveref after it; each package is loaded once; macros are not interleaved with package loads.
- The whole preamble stays in the main file; local style files are only for notation shared verbatim by several documents. Long documents are split by chapter, not by preamble.
- Comments start with what the document is and how to build it, use banner comments per group, and explain why (ordering constraints, non-obvious interfaces), never what. Stale or inaccurate comments and dead experiments are deleted.

Packages, mathematics, bibliography
- Core mathematics uses `mathtools` and `amssymb` without a separate `amsmath`; the Euler calligraphic alphabet is a genuine preference; `xcolor` is loaded explicitly; `tikz-cd` is the diagram package; `thmtools` declares theorem environments. Draft-only and specialist packages never enter the core. Packages for DOIs and the obsolete argument-parsing compatibility package are not loaded by default.
- Bibliography: biblatex with biber, alphabetic style, initials for given names, long author lists, no ISBNs, no literal "In:", one resource file. DOI and URL are suppressed and eprints shown by default, with variants permitted. Natbib compatibility and clearing of note fields are opt-in, the latter only after auditing that notes carry nothing meant for publication.
- Hyperlinks use coloured links with a fixed red and blue palette. References use cleveref (`\cref` mid-sentence, `\Cref` at sentence start, no hand-typed type names), with semantic label prefixes; labels in mature manuscripts are not renamed.

Theorems and numbering
- Equation numbers run within sections, and theorem-like environments share the equation counter. Core families: theorem, proposition, lemma, corollary; definition, definition-proposition, notation; remark, example; an unnumbered conventions environment. Optional environments are added only when needed. Lettered introduction theorems are a paper-specific pattern with a dedicated counter.
- Cleveref is loaded before the theorem declarations so that environment names print correctly; hand-written aliases are then unnecessary.

Macros and notation
- Semantic macros are preferred to ad hoc notation. Simple aliases use `\newcommand`; nontrivial interfaces use kernel document commands; operator names use operator declarations; one definition per line; no blanket end-of-line percent signs.
- Stable macro names (ground field, derived category, Hom and derived Hom, set-builder notation, category letters) are part of the author's working interface. A canonical interface is fixed for new papers. Only the category letters actually used are defined.
- Redefining standard commands (a mathematical meaning for an accent command) is a known collision; keep it where it is established and resolve conflicts explicitly. Large topic-specific notation families stay out of the core.

Practices to correct
- The file lists practices not to reproduce: theorem style declared but undefined; obsolete or redundant packages; duplicate loads; loading hyperref too early; hidden package dependencies; comments contradicting the code; clustered one-line definitions; mechanical percent signs; low-level font hacks as global defaults; indiscriminate clearing of bibliography fields; incompatible macro semantics.

Books, lecture notes, verification
- Books and lecture notes use `amsbook` with front, main and back matter; numbering within chapters; one file per chapter named by subject without numbers, included with `\include`; no subfiles or per-chapter preambles; a build tool with a project configuration; index, list of notation and a version stamp. HTML conversion has its own constraints, such as keeping part numbering identical to the PDF.
- Any reorganisation of a preamble or file structure must leave the output unchanged: build before and after, compare text and every page image, bisect on differences, split files by script and check that reassembly is byte-identical, then run project tests against the real preamble.
- Decision rules for AI agents: find and preserve the interface of an unfamiliar macro and never guess an undefined one; introduce a macro only for recurring, semantic notation; add a package only if the paper uses its functionality and it is compatible with the class and core packages; modernise legacy source in small, testable steps without changing calling conventions. Templates for a paper and a book accompany the file.
