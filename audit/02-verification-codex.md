Model: GPT-6 (Codex); reasoning effort: unknown.

# Independent verification of the frozen claims (job 02)

Scope: `scratch/02-frozen-claims.md`, read on 2026-10-07. This is an adversarial AI audit, not human certification. The forbidden opinion files and directories were not opened. The governing instructions, README, PROGRESS, and job 02 task file were read. Only this report is being modified. The task's one-file restriction overrides the general requirements to create separate computation scripts and research bookkeeping files; small calculations will be recorded here in full.

Verdicts concern the supplied argument as well as its statement. Each section gives a status separately from its verdict. Unless expressly identified as cited, the mathematical arguments below are this verifier's work. No novelty claim is made. Literature checks and final coverage will be appended as completed.

## Initial scope and conventions

Left modules are used in O.2a–b and O.3; E in O.4 is a right module and its duals and transposes are left modules. Algebras and bimodules are unital and k-linear. O.3 expressly permits an infinite-dimensional R. Extinction means eventual vanishing, not merely vanishing of a selected cohomology group. The zeroth iterate is the identity; the zero module has extinction time zero. A fixed dimension vector fixes dimensions of the idempotent summands. For total-dimension representation varieties, these dimensions can vary between open-and-closed pieces; this distinction matters in the proofs below.

## O.2a — bounded extinction in a fixed representation variety

**Verdict: no error found in the statement or the argument for a fixed dimension vector. Status: AI-proved.** There is a minor correction to the fixed-term-dimension wording if `Rep_d` denotes a total-dimension variety; see below.

1. A bounded resolution in the category of bimodules with terms projective on the right does exist. Start with the right bar resolution of X, with terms `X ⊗_k D^{⊗_k i} ⊗_k D`, retaining the left action on X. Its terms are finite free right modules. If the right global dimension is g, truncate with the g-th kernel, which is right projective by dimension shifting. The kernel remains a bimodule and is finite-dimensional. This does not assert that D has finite projective dimension over its enveloping algebra; that stronger assertion would be unsafe over an arbitrary field.
2. Tensoring two right-projective bimodules preserves right projectivity: if P is a direct summand of D^a on the right, then `P ⊗_D Q` is a direct summand of Q^a on the right. Thus each term of every fixed tensor power of the bounded resolution is right projective. A bounded complex of flat right modules preserves quasi-isomorphisms under tensoring. Iterating the resulting functor therefore computes the actual derived powers, with no left-flatness assumption on X.
3. For a fixed dimension vector, tensoring a fixed finitely generated projective right module with N gives fixed dimension. In the usual presentation with fixed vertex spaces, these tensors can be represented by matrices regular in N. More generally they form finite locally free bundles and can be trivialised on open charts, which suffices for a rank argument.
4. For a bounded complex, the ranks required for exactness are recursively determined from one endpoint. If these required ranks are impossible, the acyclic locus is empty and hence open. Otherwise the complex identities bound the sum of adjacent ranks by the middle dimension. Imposing the required lower bounds forces equality, hence exactness. Only finitely many minors and degrees are involved for each fixed t.
5. The sets E_t are consequently open. Since derived tensor sends zero to zero, they are increasing. A Noetherian space has the ascending chain condition on open subsets: equivalently, its closed subsets satisfy the descending chain condition. Thus the stabilization argument is in the correct direction. The bound depends on D, X, and d; the proof gives neither a numerical bound nor a bound independent of d.

**Total-dimension wording: error found in the intermediate assertion, with a routine repair. Status of the correction: AI-proved.** For D = k × k and the right projective P = e_1D, the two one-dimensional simple modules give dimensions 1 and 0 for `P ⊗_D N`. Therefore those dimensions are not constant on the entire total-dimension variety. The images of the universal idempotents are vector bundles of locally constant rank. Partition into the finitely many open-and-closed pieces on which those ranks are fixed, or work locally with these bundles. Openness and the Noetherian conclusion then hold on the full variety. This is not a counterexample to the lemma.

Small cases (hand calculations, status: supported): for D = k and X = k^a, a nonzero N never dies if a > 0 and dies at t = 1 if a = 0. For D = k × k, take the one-dimensional bimodule with `e_1Xe_2 = X`; then `F(N_1,N_2) = (N_2,0)` and `F^2 = 0`. These include extinction times 1 and 2 and respect the bound. The case N = 0 has time zero.

## O.2b — projective dimension in a fixed representation variety

**Verdict: no error found. Status: AI-proved.** Read n as a non-negative integer. The same total-dimension qualification applies to the supplied choice of projective resolution, but can be avoided altogether here.

Let L_• be a minimal projective resolution of the left module M. Tensoring with A/J annihilates its differentials, so `Tor^A_i(A/J,M) = (A/J) ⊗_A L_i`. By Nakayama's lemma this vanishes exactly when L_i = 0. Thus vanishing in the single degree n+1 is equivalent to `pd M ≤ n`; it is not necessary to assume that pd M is already finite.

Choose instead a resolution of the fixed right module A/J by finite free modules Q_i. Such a resolution need not be minimal and need not be bounded, but the three terms Q_n, Q_{n+1}, Q_{n+2} suffice for the test. Their tensor dimensions are constant even on a total-dimension variety, and their differentials have polynomial entries. If the middle dimension is b, middle homology vanishes exactly when the two adjacent ranks sum to b. The complex identity ensures that the sum is at most b, and the condition that it is at least b is a finite union of intersections of open rank conditions. This proves openness over any field, without an algebraic-closure hypothesis. Applying the ascending chain condition to these open loci bounds all finite values. Taking the finite union of total dimensions at most B also bounds pd for all modules of dimension at most B.

Small cases (hand calculations, status: supported): over k every module is projective. For the quiver `1 → 2` on dimension vector (1,1), the nonzero arrow maps give a projective module and the zero map gives the sum of the two simples, of projective dimension 1 (using the usual representation convention). The projective locus is the open set where the arrow scalar is nonzero. Over `k[ε]/(ε²)`, its one-dimensional simple has infinite projective dimension; the periodic resolution has every differential multiplication by ε. This is compatible with the statement, which only bounds finite projective dimensions.

## Consequences after O.2a–b (frozen lines 23–28)

**Verdict: no error found, with the dependence on O.4 made explicit. Status: AI-proved, conditional on the stated mechanisms.**

- For a single fixed algebra, modules of unbounded finite projective dimension must have unbounded k-dimension by O.2b and the finite union argument above. This is a statement about a family whose projective dimensions are unbounded, not about every family inside an algebra of infinite finitistic dimension.
- For fixed D and X, unbounded finite extinction requires unbounded dimensions of N_m by O.2a. Allowing D or X to vary would invalidate this inference.
- Under O.4, bounded syzygy dimensions would give bounded dimensions of the transposes C_n. Here is the bound omitted from the parenthesis. Put a = dim_k A and b = dim_k M. A projective cover P_0 of M is a summand of A^b, so `dim P_0 ≤ ab` and `dim ΩM ≤ ab`. A projective cover P_1 of ΩM is a summand of A^{ab}. Thus `dim Tr M ≤ dim P_1^* ≤ a²b`. Apply this to `M = Ω^{n−1}E`; then O.4 and O.2b contradict a uniform bound on the syzygy dimensions. In fact these dimensions eventually exceed each fixed bound, since pd C_n = n.
- A constant-dimensional family with the displayed syzygy dynamics cannot itself furnish these witnesses. This does not exclude using that family as one ingredient in a construction that increases dimensions. For an exact closed orbit `ΩE_λ ≅ E_{qλ}` of nonzero modules, the orbit modules in fact have infinite projective dimension.

## O.3 — rank functions and extinction

**Verdict: no error found in the lemma. Status: AI-proved.**

The endofunctor and the map on K₀ are defined under exactly the stated right-projectivity hypothesis. Since Ψ_R is a summand of R^a, the vector space Ψ ⊗_R Y is a summand of Y^a, hence finite-dimensional. For a right projective P that is a summand of R^b, `P ⊗_R Ψ` is a summand of Ψ^b as a right module and is again finitely generated projective. Tensor preserves split exact sequences, giving the claimed K₀ map and additive function χ_Y. One may index the function space by a set of isomorphism representatives of finite-dimensional modules.

Associativity gives `χ_Y(T[P]) = χ_{HY}([P])`. Since HY is among the allowed test modules, the common kernel is T-stable. Thus T descends to V; no claim that a single kernel ker χ_Y is stable is needed. Fitting decomposition applies to this finite-dimensional rational vector space even though R can be infinite-dimensional. The nilpotent part is killed by T^r. On the subspace W generated by the orbit of v_1, T is injective, hence surjective because W is finite-dimensional. Consequently every tail of that orbit spans W. Eventual vanishing of H^tY therefore annihilates W under χ_Y, and `χ_Y(T^r v) = 0`. This is the dimension of H^rY, so H^rY = 0. If r = 0, already χ_Y([R]) = dim Y = 0 for every test module; this boundary case is consistent.

### Required commutative and group-algebra tests

These hand calculations have status **supported**; the displayed formulae give complete checks for the specified examples.

- **Connected commutative example:** R = k[x], with Ψ free of right rank a and any compatible left action. Every finitely generated projective over k[x] is free (the Euclidean algorithm gives this), and directly `dim HY = a dim Y`. For a > 0 no nonzero finite-dimensional Y dies; for a = 0 every Y dies after one step. The visible orbit has dimension 1. The left action may change the isomorphism type of HY, but not this dimension calculation.
- **Disconnected commutative example attaining the bound:** R = k × k and Ψ the bimodule with `e_1Ψe_2 = k`. Then `H(Y_1,Y_2) = (Y_2,0)`. The right classes along the orbit are `[R], [e_2R], 0`, with independent rank functions, so r = 2. A module (0,k) dies exactly at time 2.
- **Finite group algebra:** take R = k[C₂] with char k ≠ 2, generator g, and `e_+ = (1+g)/2`. With Ψ = e_+R and its ordinary bimodule action, H projects to the +1 eigenspace. The orbit classes `[R], [e_+R], [e_+R], …` have visible span of dimension 2, evaluated on the two characters. The negative character dies at time 1; a module with a nonzero positive part never dies. In characteristic 2 this idempotent formula is unavailable; taking Ψ = R gives r = 1 and no nonzero extinction instead.
- **Infinite group algebra showing why the finite-r hypothesis matters:** let `G = ⊕_{i∈ℤ} C₂`, R = k[G], char k ≠ 2, with generators g_i, α(g_i) = g_{i+1}, and `e_i = (1+g_i)/2`. Put `Ψ = {}_α(e_0R)`. A one-dimensional character Y_m with g_0,…,g_{m−2} acting by +1 and g_{m−1} acting by −1 has `dim H^tY_m = 1` for t < m and 0 for t ≥ m. Values at other generators can all be +1. For each s, evaluation of the functions belonging to `[R], [Ψ], …, [Ψ^{⊗(s−1)}]` on Y_1,…,Y_s is triangular with diagonal entries 1; hence they are independent. Thus r is infinite. This R is commutative but not Noetherian: the ideals generated successively by `1−g_0,…,1−g_j` strictly increase, as characters detect. It does not contradict the commutative-Noetherian consequence.

## Consequences after O.3 (frozen lines 46–52)

**Verdict on the necessary infinite-rank condition: no error found. Status: AI-proved.** This is the contrapositive of the lemma. It concerns independence of the functions on finite-dimensional modules, not merely linear independence of idempotents as elements of R. Conversely, infinite visible rank is only necessary; the lemma does not assert it is sufficient for unbounded extinction.

**Commutative Noetherian R: no error found. Status: AI-proved.** There are finitely many connected components of Spec R. For a projective P, write its constant rank on component c as ρ_c(P). Tensoring is exact, and a finite-dimensional module has finite length. If S = R/m is a composition factor on component c, then `dim_k(P ⊗_R S) = ρ_c(P) dim_k S`. Summing along a composition series gives

`χ_Y(P) = Σ_c ρ_c(P) dim_k(Y_c)`.

Thus all visible functions factor through finitely many component ranks. K₀ itself need not have finite rank; no such stronger assertion is required.

**Finitely many indecomposable projective generators: no error found. Status: AI-proved.** If every finitely generated projective is a finite direct sum of members of a fixed finite list, their classes generate K₀, which suffices. For path algebras, the sentence should say **finite quivers**, as required by the ordinary unital path-algebra convention here. For the finite-dimensional path algebras covered by the task's default convention, the indecomposable projectives are the finitely many vertex projectives. If path algebras with oriented cycles are intended as well, their K₀ is likewise generated by the vertex projectives; a separate elementary argument is recorded in the literature section. Nothing here licenses a statement about arbitrary locally unital algebras of infinite quivers.

**Universal localisations of finite-dimensional hereditary algebras: literature check pending at this point in the incremental report; completed below.** The needed fact is finite rank of K₀ of the localisation, not that the localisation remains finite-dimensional or has only finitely many indecomposable projectives.

**Explanation of the preprint's idempotents: no error found as a conditional explanation; linear independence of idempotents in R alone would leave a gap in visible independence. Status: AI-proved for the conditional inference.** The required evidence is that finite-dimensional modules detect the successive products. If the preprint's modules Y_m have the stated extinction pattern, then the same triangular evaluation argument as in the infinite-group test supplies that evidence. This checks the explanation without independently certifying the preprint's entire finite-group construction.

## O.4 — dual resolutions and the transpose witnesses

**Verdict: no error found. Status: AI-proved.**

The cochain complex obtained by applying Hom_{A^op}(−,A) has degree-zero kernel Hom_{A^op}(E,A), not automatically zero. The hypothesis includes i = 0 and therefore supplies exactly the needed injection of P_0^* into P_1^*. Higher Ext vanishing supplies exactness at all later terms. Each P_i^* is a finitely generated projective left module, and evaluation identifies P_i with P_i^{**}. Thus the first sequence is exact, as are the sequences with C_n embedded in P_{n+1}^*.

If C_1 were projective, the first sequence would split. Dualising the split injection would make the original differential P_1 → P_0 surjective, forcing its cokernel E to vanish. Minimality is not needed for this particular contradiction. Since E ≠ 0, C_1 is not projective, while its displayed resolution has length one; hence pd C_1 = 1.

For n ≥ 1, the short exact sequence `0 → C_n → P_{n+1}^* → C_{n+1} → 0` gives both the upper bound n+1 and the stated Ext isomorphisms for j ≥ 1. A finitely generated module of projective dimension n has nonzero Ext^n into A/J: apply Hom(−,A/J) to a minimal resolution, whose differentials induce zero. Thus the required V can even be chosen finitely generated. This gives the lower bound n+1. The degree-zero case is correctly separated from dimension shifting. Every C_n is finite-dimensional, so these are witnesses for the **little**, left finitistic dimension of the same A.

The presentation `P_n → P_{n−1} → Ω^{n−1}E → 0` is minimal, which identifies its transpose with C_n up to isomorphism under the chosen minimal-presentation convention. There is no missing index shift. Minimality removes the usual projective-summand ambiguity of the transpose.

### Small-algebra calculations for O.4

Status: **supported** for these tests. These are finite-stage tests and tests of necessary hypotheses, not examples satisfying infinite Ext vanishing.

1. Let A be the upper-triangular 2 × 2 matrix algebra, with idempotents e_1,e_2 and a = E_12. The right simple E = e_1A/ka has minimal resolution `0 → e_2A → e_1A → E → 0`, where e_2 maps to a. Its dual is `0 → Ae_1 → Ae_2 → 0`, with e_1 mapping to a. In bases (e_1) and (a,e_2), this is the column matrix `(1,0)^T`. Therefore Hom(E,A) = 0, Ext¹(E,A) is one-dimensional, and C_1 = Ae_2/ka has projective dimension 1. The next step cannot continue, exactly because Ext¹(E,A) is nonzero.
2. A test with two successive witnesses uses the five-dimensional algebra with basis e_1,e_2,e_3,a,b, with `a = e_1ae_2`, `b = e_2be_3`, and ab = 0. This explicit multiplication convention avoids ambiguity about path order. For E = e_1A/ka the right resolution is `0 → e_3A → e_2A → e_1A → E → 0`, with maps e_3 ↦ b and e_2 ↦ a. The dual maps have matrices

   `Ae_1 → Ae_2 : (1,0)^T`, in bases (e_1), (a,e_2),

   `Ae_2 → Ae_3 : [[0,1],[0,0]]`, in bases (a,e_2), (b,e_3).

   Thus Hom(E,A) = Ext¹(E,A) = 0, while Ext²(E,A) is one-dimensional. Here C_1 is the left simple at e_2 of projective dimension 1 and C_2 is the left simple at e_3 of projective dimension 2. The displayed complex is their minimal projective resolution and has a nonzero leftmost term. These computations test the first two indices of the construction and locate the exact obstruction to continuing it.
3. For A = k[ε]/(ε²) and E = k, the right resolution is periodic with maps multiplication by ε. Dualising gives the same maps, whose kernels and images are both kε in positive degrees. Thus Ext^i(E,A) = 0 for every i > 0, but Hom(E,A) = kε ≠ 0. All the transposes in question are isomorphic to k and have infinite projective dimension. Omitting degree zero from O.4 would therefore make it false already for this two-dimensional algebra.

## Consequences after O.4

### Duality, infinite pd E, and syzygy dimensions (frozen lines 71–73)

**Verdict: no error found. Status: AI-proved.** For a finite right projective P there is a natural identification `D(P ⊗_A DA) ≅ Hom_{A^op}(P,A)`. It follows from tensor–Hom adjunction and `DDA ≅ A`, and is compatible with the differentials of the resolution. Taking homology gives the displayed duality. In particular, all Tor groups vanish exactly when the derived tensor object vanishes. The functor here acts on right modules, as required by `E ⊗^L_A DA`.

If a nonzero E had finite projective dimension n, its last minimal differential would dualise to a non-surjective map into P_n^*. Otherwise the surjection onto the projective P_n^* would split, and its dual would split the last differential of the minimal resolution, a contradiction. Thus Ext^n(E,A) ≠ 0. For n = 0, a nonzero finite projective has a nonzero map to A since it is a summand of a finite free module. Finally, the unbounded syzygy assertion uses **both O.4 and O.2b**, via the transpose dimension bound recorded above; infinite projective dimension alone does not imply it, as the dual-numbers test shows.

### Relation to the companion preprint (frozen lines 75–77)

**Verdict: no error found with the phrase “on the appropriate side” interpreted explicitly. Status: cited for what the companion states; AI-proved for the conditional application of O.4.**

I read the primary companion source, not an agent's assessment: the existing `.cache/companion-tachikawa.pdf` and the corresponding `.cache/companion-src/sections/introduction.tex` and `consequences.tex`. The PDF is OpenAI, *A counterexample to Tachikawa's second conjecture*, dated September 23, 2026; Corollary 1.2(2), printed p. 4, states exactly the asserted nonzero simple **left** Γ-module with vanishing Ext in all non-negative degrees. Corollary 1.3, p. 5, states infinite **left** finitistic dimension. Its proof, §8, p. 35, uses the projective-injective terms of the minimal injective resolution. [Public source](https://github.com/openai/math/blob/main/preprints/A-counterexample-to-Tachikawas-second-conjecture-September-23-2026/paper.pdf).

Applying O.4 to that left Γ-module means taking A = Γ^op. Consequently the Ext-vanishing assertion alone yields infinite **right** finitistic dimension of Γ. It does not replace the companion's argument for its **left** finitistic dimension without an additional hypothesis or argument. The frozen text includes the necessary side qualification, so this is a clarification, not a counterexample. The companion's construction of the Ext-vanishing module was not independently audited in this job.

Pinned local PDF SHA-256: `332c2535f60d4ad620a86b3c4d547c51510b183f881445d9a0807986b0544f67`. This identifies the source actually read; I did not establish equality with the current remote bytes.

### Search implications (frozen lines 79–83)

**Verdict: no error found in the mathematical implication; qualification needed for the computational claim. Status: AI-proved for the implication, heuristic for practical promise.** The contrapositive of O.4 gives precisely: finite left findim A implies the strong Nakayama assertion for right A-modules, equivalently left A^op-modules. A counterexample obtained by this route therefore solves the original finitistic-dimension problem on the opposite side. This implication is not an equivalence and supplies no converse construction from an arbitrary algebra of infinite finitistic dimension.

For an explicitly presented algebra and module over an effective field, each fixed Ext degree can be tested by exact finite-dimensional linear algebra. Without effective operations and zero tests in the arbitrary field k, the phrase “checkable ... by computer” is missing a computational hypothesis. Even with such a field, an arbitrarily long initial run of zero Ext groups does not certify vanishing in all degrees. A recursive resolution must come with an argument covering every degree, including exactness and degree zero. The statement about being easier to search or verify is a heuristic, not a mathematical consequence of O.4.

## Literature checks and completion of O.3's localisation consequence

Search scope: general web and arXiv searches for projective-dimension semicontinuity, bounded dimension and finitistic dimension, strong Nakayama versus finitistic dimension, and rank functions/K₀ under hereditary universal localisation. The local `library.bib` was searched by titles, authors, and arXiv identifiers before obtaining sources. Domain-restricted searches for the relevant MathSciNet and zbMATH records did not supply usable results; no authenticated database review is claimed. No papers were imported or files downloaded, respecting the one-file restriction. The arXiv texts were read online; the Happel and companion texts were already present locally. Failure to find an exact formulation is not evidence of novelty.

### O.2a

**No exact prior formulation located in the searched sources.** Its proof combines openness of acyclicity of a finite complex of vector bundles with the Noetherian ascending-chain argument. The latter argument in the closely related projective-dimension setting appears explicitly in Happel's source below. This is a relationship between arguments, not an attribution of the precise extinction lemma to Happel. Searches concerning tensor extinction, perfect complexes, and vanishing loci did not produce an exact citation for O.2a; unrelated tensor-nilpotence results are not being substituted for it.

### O.2b

**Read in source:** Dieter Happel, *Homological conjectures in the representation theory of finite-dimensional algebras*, Bielefeld 12-page online manuscript `happel2.pdf`, expanded from an October 1990 lecture (as stated in its first-page footnote; the local bibliography calls it Hap90). Exact locator: §2.3, proof of its last, unnumbered Proposition, printed p. 5, beginning “We sketch the proof using some ideas from [Sc].” It explicitly calls the loci of bounded projective dimension open and uses stabilization of their ascending chain. The source works over an algebraically closed field (p. 1). Its final sentence bounding all modules in the variety must be read with the finite-projective-dimension restriction; its preceding union argument only bounds that locus. The local proof above supplies this restriction and arbitrary-field scope explicitly. [Source](https://www.math.uni-bielefeld.de/~sek/dim2/happel2.pdf).

Pinned Library PDF SHA-256: `d2db1d8253c79966b98cfcba8ac6bc0254be8eecf101e8309c89bc64a9ffa0e9`.

**Read in source:** Christof Geiß, Daniel Labardini-Fragoso and Jan Schröer, *Semicontinuous maps on module varieties*, **arXiv:2302.02085v2, 5 July 2024**, §2.4, **Corollary 2.6, p. 8**, with conventions in §1.4 and the bar calculation in §§2.3–2.4, pp. 6–8. It states upper semicontinuity of `(M,M′) ↦ dim Ext_A^i(M,M′)` for every fixed pair of dimensions and every i ≥ 0. The standing field hypothesis is algebraic closure. Applying it with M′ = A/J gives the openness part of O.2b; stabilization gives the second part. This source proves the Ext statement in the text rather than merely referring to it. [Pinned HTML](https://arxiv.org/html/2302.02085v2), [pinned PDF](https://arxiv.org/pdf/2302.02085v2).

**Not read, from a secondary reference:** Happel attributes the geometric argument to Aidan Schofield, *Bounding the global dimension in terms of the dimension*, Bull. London Math. Soc. 17 (1985), 393–394, reference [Sc] on his p. 12. I read that bibliography entry but not Schofield's 1985 statement or proof. No theorem number or claim of original priority is assigned here. This reference is distinct from Schofield's 2007 localisation paper below.

### O.3

**No exact prior formulation of the visible-rank extinction bound located.** Its linear-algebra step is Fitting decomposition. **Read in source:** William Crawley-Boevey, *Noncommutative Algebra 2: Representations of finite-dimensional algebras*, Bielefeld, **Winter Semester 2019/20 notes**, §1.1, **Fitting's Lemma, printed p. 2** (PDF page 4). The statement decomposes a finite-dimensional module under an endomorphism into nilpotent and invertible summands; apply it over ℚ to V. This is a source for the decomposition, not for the full K₀ lemma. [Source](https://www.math.uni-bielefeld.de/~wcrawley/1920noncommalg2/NA2.pdf).

**Read in source:** Aidan Schofield, *Universal localisations of hereditary rings*, **arXiv:0708.0257v1, 2 August 2007**, **Lemma 4.1, p. 9**. Its statement is: “The map from K₀(R) to K₀(R_E) is surjective.” The preceding §2 defines the localisation notation via well-placed subcategories, and Theorem 2.3 parametrises universal localisations this way. “Hereditary” is taken on both sides in the relevant part of the article. The proof of Lemma 4.1 uses an induced presentation of a projective over the localisation and a length-one projective resolution over R. [Pinned HTML](https://arxiv.org/html/0708.0257v1), [pinned PDF](https://arxiv.org/pdf/0708.0257v1).

**Completed verdict on hereditary localisations: no error found. Status: cited for K₀-surjectivity; AI-proved for its application.** A finite-dimensional hereditary algebra B has K₀(B) generated by its finitely many indecomposable projectives. The cited surjection therefore gives finite rank of K₀(B_Σ), as required by O.3. The text sometimes reduces to an injective localisation by first killing the trace ideal of projectives (§2, paragraph before Theorem 2.4). In the finite-dimensional hereditary case that quotient is again a finite-dimensional hereditary algebra: if I is the trace ideal, then I² = I; for a projective P over B, PI is projective, and `0 → PI → P → P/PI → 0` shows Tor₁^B(P/PI,B/I) = 0. A finite B/I-module has a length-one B-projective resolution; this Tor vanishing extends to all such modules by projective presentations over B/I and Tor₂^B = 0. Tensoring therefore gives a length-one projective resolution over B/I. Thus the reduction does not introduce infinitely many K₀ generators, and non-injective localisations are also covered. The frozen “to be checked” can be replaced by this citation.

For completeness, the extension of the path-algebra example to finite quivers with cycles can be checked directly. In a finite direct sum of vertex projectives over kQ, order path monomials by length and a compatible lexicographic order. A submodule decomposes by terminal idempotents. Choose elements with leading coefficient 1 for the minimal leading paths under right extension. Leading-term reduction spans the submodule: each subtraction reduces the leading monomial, so terminates. Distinct minimal leading paths have no common right extensions; hence no nonzero linear combination of the chosen generators with compatible path coefficients can vanish. This expresses the submodule as a direct sum of vertex projectives. A finitely generated projective is a submodule of a finite free module and is therefore such a sum; finite generation makes the sum finite. This verifies the finite-generator claim even without acyclicity. Status: AI-proved. This argument concerns ordinary unital path algebras of finite quivers, not completed path algebras or infinite-vertex rings.

### O.4

**Read in source:** Crawley-Boevey's **Winter Semester 2019/20 notes** cited above, **§3.2, Proposition 5 and its proof, printed p. 63** (PDF page 65). The proposition is headed as the implication from finitistic dimension to the generalised Nakayama conjecture, but the proof explicitly first establishes the strong Nakayama assertion. It assumes finite finitistic dimension of A^op, dualises a minimal projective resolution of a left A-module, and uses its successive cokernels to force the first map to split. This is the same mechanism as O.4, with the sides interchanged. The exact formula pd C_n = n is the dimension-shifting refinement written out in the audit; it is not stated as a separate numbered theorem in these notes. Thus the underlying implication is already in the literature, and this audit makes no priority claim for the explicit formulation.

**Read in source:** the companion's Corollaries 1.2(2), 1.3 and the proof of 1.3, in the pinned September 23, 2026 PDF, pp. 4, 5, 35, respectively, as recorded above. These verify the frozen attribution, not the truth of the companion's full construction. Its finite-dimensional witnesses arise from a projective-injective coresolution, rather than the dual of the resolution of the simple S.

## Optional assessment of the two search mechanisms

**Status: heuristic.** For a search specifically aimed at an explicit algebra with few simple modules, I would prioritise O.4: it asks for an algebra, a module, and a recursively controllable resolution, and the witnesses then follow by finite dualisation and cokernels. The trivial-extension route has a clean criterion, but a selection construction of the stated kind must retain infinitely many independent functions on finite-dimensional representations, and subsequently realise that information through a derived tensor functor over a finite-dimensional algebra. O.3 rules out several tempting simplifications of that input. This preference is not evidence that a small O.4 example exists; any successful recursive family must also satisfy the unbounded syzygy-dimension constraint, and a finite computational vanishing range is insufficient.

## Final coverage and verdicts

| Frozen item | Verdict | Status and qualification |
|---|---|---|
| O.2a | No error found | AI-proved; its proof needs the stated open-and-closed-piece correction for total-dimension varieties |
| O.2b | No error found | AI-proved; finite free test resolutions avoid the same minor issue |
| O.2 consequences: witness dimensions | No error found | AI-proved for a fixed algebra/functor |
| O.2 consequences: syzygies and constant-dimensional families | No error found | AI-proved using O.4 and the explicit transpose dimension bound |
| O.3 | No error found | AI-proved; finite-dimensionality of HY and descent of T checked |
| O.3 consequences: visible rank, commutative Noetherian rings, finite projective generators | No error found | AI-proved; infinite rank is necessary, not sufficient |
| O.3 consequences: path algebras | No error found for finite quivers | AI-proved; specify this convention if allowing infinite-dimensional R |
| O.3 consequences: hereditary universal localisations | No error found | Cited K₀-surjectivity, with its application checked |
| O.3 explanation of preprint's group algebra | No error found in the inference from its character tests | AI-proved conditional inference; the full finite-quotient construction is outside this audit |
| O.4 | No error found | AI-proved; explicit tests at the first two indices and the degree-zero countertest |
| O.4 duality and syzygy paragraph | No error found | AI-proved; syzygy growth uses O.4, not merely pd E = ∞ |
| O.4 companion paragraph | No error found with its side qualification | Cited attribution; O.4 gives right findim Γ from the displayed left simple |
| O.4 search paragraph | No error found in its mathematical implication; gap in unconditional computability wording | An effective field/presentation is needed; practical promise remains heuristic |

The specific false intermediate assertion found is that a fixed projective's tensor terms have constant dimensions on an entire **total-dimension** representation variety; the k × k example above refutes it, and the local/vector-bundle repair preserves both lemmas. No statement of the four lemmas was refuted. The source's actual fixed-dimension-vector wording already avoids this issue in its usual interpretation.

Small examples were computed explicitly by hand from multiplication and the displayed matrices; no computer-algebra search, formal verification, or human certification is claimed. All consequences were assessed separately. No full verification of either preprint, proof of novelty, or claim of an explicit counterexample is included. Online PDF screenshot requests for the two arXiv sources failed with cache misses; their mathematical statements and locators were read in their HTML and page-indexed PDF text. The fixed claim input has SHA-256 `9150fafcf67f6ad08c9251c61d1d9f0771dcd0446b1f31329b348c7cd7602944`.
