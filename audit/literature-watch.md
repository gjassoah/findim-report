# Literature watch: little finitistic dimension counterexample

Date of search: 2026-10-07. Window: 2026-09-01 to 2026-10-07. Retrieval only, no assessment of correctness.
Legend: [READ] = I read the abstract/metadata or file content myself (arXiv API record, GitHub API/raw files). [SNIPPET] = only seen in a search-engine result summary or an LLM-summarised WebFetch; not verified.

## 1. GitHub openai/math (all [READ] via GitHub API and raw.githubusercontent.com)
Queries: https://api.github.com/repos/openai/math/contents/preprints ; .../contents/preprints/<dir> ; .../contents/<dir>/build (recursive) ; .../commits?path=preprints[/<dir>]
- Main: `preprints/An-algebra-of-infinite-little-finitistic-dimension-September-23-2026/` containing README.md (610 B), paper.pdf (459427 B), build/ with paper.tex, preamble.tex, references.bib, sections/01-introduction.tex, 02-selection-process.tex, 03-localization-and-lifting.tex, 04-tensor-realization.tex, 05-ordinary-simulation.tex, 06-square-zero-and-conclusion.tex.
- Companion: `preprints/A-counterexample-to-Tachikawas-second-conjecture-September-23-2026/` containing README.md (601 B), paper.pdf (619479 B), build/ with paper.tex, refs.bib, sections/{introduction,algebra,bimodule,consequences,homological,stable,transfer,triangular}.tex. READMEs: author "OpenAI", date September 23, 2026, only a title and BibTeX citation.
- Also present (relevant by topic, not read): `An-explicit-counterexample-to-the-Auslander-Reiten-conjecture-September-23-2026/` (README.md, paper.pdf 570116 B, build/).
- Commit dates: the commits API shows a single commit "Initial commit" dated 2026-10-06T21:58:50Z for the whole `preprints` path and for each of the three directories. No later commit visible. (So the directory-name date of 2026-09-23 is not a commit date; the repo history starts 2026-10-06.)
- The preprints directory has ~120+ entries (many other "counterexample" papers, dates Sep 10 to Oct 6, 2026); a long list was seen but only the three above are topic-relevant.
- PDF comparison: remote main paper.pdf sha256 = 1fb7f827f59dcca0f391c279c346e4e8bc941880c24ec30fe1cba2e9a319f89c; local paper.pdf sha256 identical. MATCH. Saved at .cache/main-remote.pdf.
- Companion PDF downloaded to .cache/companion-tachikawa.pdf (sha256 332c2535f60d4ad620a86b3c4d547c51510b183f881445d9a0807986b0544f67). LaTeX sources downloaded to .cache/companion-src/ (paper.tex, refs.bib, sections/*.tex; 9 files). Main preprint sources (build/) were not downloaded (not requested; local copy matches by PDF).

## 2. arXiv API (https://export.arxiv.org/api/query, sorted by submittedDate descending) [READ: titles/authors/dates and abstracts]
Queries: all:"finitistic dimension"; all:Tachikawa; all:"little finitistic"; abs:"finitistic dimension conjecture"; abs:"Tachikawa conjecture"; all:"Auslander-Reiten conjecture" AND all:counterexample; all:"injective generation"; all:finitistic AND all:OpenAI; plus id_list fetch of the hits below. (Listing pages for math.RT/math.RA were not fetched separately; the API queries above stand in for them. arXiv ids as returned by the API.)

Hits in window (2026-09-01..10-07) with finitistic-dimension content:
- arXiv:2610.00433 (2026-09-30), Liang Chen, "Big Finitistic Dimensions of Radical-Cube-Zero Algebras": constructs a 10-dim algebra with (rad A)^3=0, findim A=2, Findim A=infinity, Findim(A^op)=0; claims disproof of the big finitistic dimension conjecture. https://arxiv.org/abs/2610.00433
- arXiv:2609.35849v2 (2026-09-25), Liang Chen, "Counterexamples and gap phenomena for derived delooping levels": answers questions of Guo-Igusa on ddell vs sub-ddell vs opposite big finitistic dimension; explicit 8-dim algebra. https://arxiv.org/abs/2609.35849
- arXiv:2609.32744 (2026-09-26), Hanpeng Gao, Dajun Liu, Ruomu Xu, "Derived Delooping Levels of One-Point Extensions and Finitistic Dimensions": explicit algebra with Findim(A^op)=1 < 2 = ddell A = dell A. https://arxiv.org/abs/2609.32744
- arXiv:2609.39745 (2026-09-30), Ryan Lam, "Tensor Product Does Not Behave Additively on Delooping Level": dell(A tensor B) = dell A + dell B can fail. https://arxiv.org/abs/2609.39745
- arXiv:2609.39011 (2026-09-30), Hanpeng Gao, Dajun Liu, Houjun Zhang, "Relative Derived Delooping Levels and tau-Tilting Modules": big findim of B^op bounded by relative ddell. https://arxiv.org/abs/2609.39011
- arXiv:2609.36444 (2026-09-29), Mingfei Xu, Xiaojin Zhang, "Relative Suspension and Higher Delooping for Support tau-Tilting Modules". https://arxiv.org/abs/2609.36444
- arXiv:2609.16957 (2026-09-15), Kaili Wu, Jiaqun Wei, Dajun Liu, Weiqing Cao, "Reduction techniques for the derived delooping levels" (cleft extensions, recollements). https://arxiv.org/abs/2609.16957
- arXiv:2610.00105 (listed submitted 2026-09-09), Xiaojin Zhang, Panyue Zhou, "Self-Orthogonal tau-Tilting Modules and Tilting Modules III: Finitistic Dimension": finitistic conjecture for all Artin algebras would imply self-orthogonal tau-tilting conjecture; a counterexample to the latter gives one to the former. https://arxiv.org/abs/2610.00105
- arXiv:2608.27937 (2026-08-28, just before window), Xiaojin Zhang, "... II: Annihilator Separation". https://arxiv.org/abs/2608.27937
- arXiv:2609.19172v2 (2026-09-14), Haruhisa Enomoto, Rene Marczinzik, "On the homological conjectures for Artin algebras": proves Auslander-Reiten, generalised Nakayama, Nakayama, and each of the two Tachikawa conjectures are globally equivalent for Artin algebras over a fixed commutative artinian ring. https://arxiv.org/abs/2609.19172 (relevant to the companion Tachikawa preprint).
- arXiv:2609.03365 (2026-09-03), Yang Han, Xianqing Wang, "Singular equivalences of n-adjoint type and standard eventually homological isomorphisms" (reductions of homological conjectures). https://arxiv.org/abs/2609.03365
- arXiv:2609.00143v2 (2026-08-31), Yu-Zhe Liu, "Integral coefficient rings and homological dimensions of algebras" (finite-dim complex algebras). https://arxiv.org/abs/2609.00143
- arXiv:2608.29634 (2026-08-30), Wei, Wu, Cao, "Degree-shifted derived invariance of derived delooping levels". https://arxiv.org/abs/2608.29634
- arXiv:2609.14326 (2026-09-13), Zhang, Kim, small finitistic dimension of commutative rings (different setting). https://arxiv.org/abs/2609.14326
- arXiv:2609.24007 (2026-09-21), Weiheng Xia, "The Auslander-Reiten conjecture for quantum complete intersections" (positive cases; title seen only in listing). https://arxiv.org/abs/2609.24007
- arXiv:2608.09701 (2026-08-10), Bohmler, Marczinzik, "Tor and Ext vanishing results for commutative Artinian rings" (Tachikawa-related; before window).
- Earlier 2026 finitistic-related, before window: 2608.26541 (Xiaoyan Yang, finitistic dimensions in triangulated categories with compact silting generator, 2026-08-27); 2606.11684v4 (Xu, Zhang, tau-tilting, depth and delooping level, 2026-06-10); 2606.10204 (Trlifaj, Dubov, Tilting modules for the Cummings construction, 2026-06-08).
- Not found by API in window: any arXiv paper by or citing OpenAI's finitistic preprint, any paper claiming a counterexample to the little finitistic dimension conjecture, any simplification or erratum, any "injective generation" paper (query returned only unrelated ML papers). Explicit NO HITS for: all:finitistic AND all:OpenAI; all:"injective generation" (relevant hits); counterexample to Auslander-Reiten (only a 2008 paper).
- Observation (factual): none of the arXiv abstracts above mention the OpenAI preprints.

## 3. Web search (WebSearch tool) [SNIPPET unless noted]
Queries (all run 2026-10-07): "OpenAI finitistic dimension conjecture counterexample algebra"; "Tachikawa second conjecture counterexample OpenAI math preprint"; "mathoverflow little finitistic dimension conjecture disproved 2026"; "finitistic dimension OpenAI counterexample Tachikawa Auslander-Reiten blog OR news OR reddit OR mathoverflow".
- https://kingy.ai/blog/openai-math-722-manuscripts-results-proofs-compute-costs/ "OpenAI's 722 Math Manuscripts: The Results, Proofs, Compute and Costs" (dated ~2026-10-06). Search snippet says OpenAI generated "A counterexample to the little finitistic-dimension conjecture" and counterexamples to Auslander-Reiten, Tachikawa, Nakayama conjectures. A separate WebFetch (LLM-summarised) found no direct mention of finitistic/Tachikawa in the article text and quoted: review status "unchecked", no Lean/referee verification by the site. The two are inconsistent; unresolved, I did not read the page myself in full.
- https://www.proofatlas.ai/collaboration/finitistic-dimension-conjecture/ (WebFetch summary): says the little finitistic conjecture remains open, last checked 2026-08-14 (predates the release; no mention of OpenAI).
- https://arxiv.org/pdf/2608.24018 "Counterexamples to Peskine-Szpiro's conjecture on modules of finite projective dimension" (snippet only; commutative algebra, snippet mentions an AI model assisting; not verified, not on finitistic dimension of algebras).
- https://openai.com/index/model-disproves-discrete-geometry-conjecture/ and https://cdn.openai.com/pdf/74c24085-19b0-4534-9c90-465b8e29ad73/unit-distance-remarks.pdf (snippet; unrelated discrete geometry).
- MathOverflow, blog, news, social: NO HITS specific to the OpenAI finitistic or Tachikawa preprints; no commentary on errors or simplifications found. (Search engine is US-only and may not index very recent pages; MathOverflow was not queried directly.)

## 4. Gaps
Not done: direct arXiv listing pages (math.RT/math.RA new), MathOverflow site search, Google Scholar/citations, Zulip/X. Recommend re-check in a week.
