# Inline mathematics better displayed

Claude Opus 5.5, 2026-10-08, at Gustavo's request ("identify inline maths that is better to display to ease the
reading"). Identification only; nothing in `report/` has been changed. Pages refer to `report/build/main.pdf`
at commit `b53d15e` (51 pages).

Method: a scan of every inline formula outside display environments (length ≥ 70 characters, or ≥ 40 with
arrows chains, sums, products, tensor chains, matrices or chained isomorphisms; 69 hits), a second scan for
sentences carrying five or more inline formulas with more mathematics than words (22 hits), then a reading of
each hit in context. Typed maps `f\colon X\to Y` and short identities were left inline. Criteria for
recommending a display: the formula is a hypothesis or the object a statement is about; it is a computation the
reader has to check; it breaks across lines; or it sits in a sentence that is hard to parse because of it.

## Recommended (22)

| # | Page | Where | Formula (source) | Reason |
|---|---|---|---|---|
| 1 | 4 | §2.2 Toda brackets, `02-preliminaries.tex:78` | triangle `Y→Z→C_g→Y[1]` | the maps f, g, h just before are displayed; the triangle is the object the defining systems refer to |
| 2 | 5 | proof of Theorem 3.3, `03-criteria.tex:70` | `Tr Ω^{n−1}E = coker(P_{n−1}^* → P_n^*) = C_n` | the conclusion of the proof (transpose identification) |
| 3 | 10 | proof of Theorem 4.1, `04-trivial-extensions.tex:110` | `Z⊗_{Ã}(Ã⊗_Δ F_r)[r] ≅ (Z⊗_Δ F_r)[r]` with its sign | long, breaks across lines; the sign convention follows it |
| 4 | 12 | Definition 5.1, `05-selection.tex:18` | selection functor `H = Ψ⊗_R − : mod_fd R → mod_fd R` | definition of a central object of the article; breaks across lines |
| 5 | 13 | proof of Proposition 5.4, `05-selection.tex:106` | `dim H^r Y = φ_Y(T̄^r v_0) + φ_Y(T̄^r v_1) = 0` | final computation of the proof |
| 6 | 16 | proof of Proposition 5.14, `05-selection.tex:399` | `∏ π_m(z_q)^{c_q} = 1 + (∑ c_q t^q) E_{15}` | the key computation for (ℤ/2)^m |
| 7 | 21 | Lemma 6.6, `06-realisation.tex:303` | triangle `X_1→X_2→X_3→X_1[1]` | hypothesis of the lemma; the decompositions are then stated relative to it |
| 8 | 24 | proof of Proposition 6.12, `06-realisation.tex:552` | `g_ρ = ∑ ρ_{ba} f_b f'_a : V'_0 → Ṽ_2` | definition immediately followed by a display; merge into one display |
| 9 | 26 | proof of Proposition 6.15, `06-realisation.tex:731` | `∂_1(e_j⊗v)_a = (a⊗v)_i − (e_j⊗f_a v)_j` | component computation followed by a display ("Hence, …"); breaks across lines |
| 10 | 32 | proof of Lemma 8.3, `08-conversion.tex:191–192` | `Hom_Λ(L_1P, Λ) ≅ Hom_E(P, E)` and `Hom_Λ(L_2P, Λ) ≅ Hom_E(P, F) ⊕ Hom_E(P, E)` | two long parallel isomorphisms in one sentence; a two-line display |
| 11 | 32 | proof of Theorem 8.4, `08-conversion.tex:246` | `0 → L_1P → P_Z → L_2P[1] → 0` | the sequence the proof turns on (split in each degree, outer terms acyclic) |
| 12 | 32 | proof of Theorem 8.4, `08-conversion.tex:266–271` ("The endomorphism complex") | definitions of 𝓗, 𝓚, their cohomology, and `δ : 𝓗^{⊕2} → 𝓚, (g,j) ↦ F(g)f − fj` | seven inline formulas in one sentence; display at least the chain map δ |
| 13 | 33 | proof of Theorem 8.4, `08-conversion.tex:292` | `∂(g,j,h) = (∂g, ∂j, δ(g,j) − ∂h)` | the differential of the cone in coordinates; follows a display and precedes another |
| 14 | 36 | §9.3, `09-ar-counterexample.tex:230` | contraction `a_0[a_1|⋯|a_n]a_{n+1} ↦ [ā_0|a_1|⋯|a_n]a_{n+1}` | a formula the reader must check; long |
| 15 | 36 | §9.3, `09-ar-counterexample.tex:242–245` | definition of `h_λ` and `z_λ` (with the list of nine basis vectors) | nine inline formulas in one sentence; display the definition of z_λ |
| 16 | 37 | proof of Proposition 9.10, `09-ar-counterexample.tex:360` | `Hom_E(Q⊗Q, S) ≅ Hom_T(Q, s) ⊗ Hom_T(Q, s)` | the isomorphism of complexes on which the basis computation rests; breaks across lines |
| 17 | 38 | Lemma 9.12, `09-ar-counterexample.tex:435` | `coker((𝓛⊗B)^{−2} → (𝓛⊗B)^{−1})[1]` | 107 characters inside a statement; breaks across lines |
| 18 | 38 | proof of Lemma 9.12, `09-ar-counterexample.tex:448` | `Z_j = coker((B⊗B)^{−j−1} → (B⊗B)^{−j})` | defines the filtration factors used afterwards; breaks across lines |
| 19 | 40 | proof of Proposition 9.14, `09-ar-counterexample.tex:587` | `[a_1|⋯|a_{n−2}](a_{n−1}z_λ(a_n) + z_λ(a_{n−1}a_n) + z_λ(a_{n−1})h_λ^{−1}(a_n))` | 104 characters; the expression compared with pB |
| 20 | 40 | §9.7, `09-ar-counterexample.tex:640` (definition of ΣM) | `Hom_k(E^e, M) ≅ D(E^e)⊗_k M ≅ E^e⊗_k M` | thirteen inline formulas in one sentence; display the definition of ΣM with this chain |
| 21 | 41 | proof of Proposition 9.16, `09-ar-counterexample.tex:695` | `ρ_i[a]∘F(g)∘v = (E_{H_i}⊗_E g)∘ρ_i v = E_{H_i}⊗_E g` and `ρ_i[a]∘v[a]∘j = j` | the two identities from which δ⁰(c,d) = (c+d)v is read off |
| 22 | 42 | Proposition 10.1, `10-obstructions.tex:28` | triangle `s[−3] → s → X → s[−2]` | hypothesis of the statement; Proposition 10.2 displays its own triangle, so displaying this one makes the pair consistent |

(Entry 12 and entry 20 are sentence-level: the suggestion is to display the main formula and split the
sentence, not to display every formula in it.)

## Optional (10)

| # | Page | Where | Formula | Comment |
|---|---|---|---|---|
| a | 8 | proof of Proposition 3.11, `03-criteria.tex:321` | `Q_{n+2}⊗M → Q_{n+1}⊗M → Q_n⊗M` | readable inline; display if the polynomial-entries argument should stand out |
| b | 10 | Example 4.2, `04-trivial-extensions.tex:147` | `0 → e_1Δ → e_2Δ → S'_2 → 0` | immediately followed by a displayed resolution; displaying both together would be uniform |
| c | 14 | proof of Corollary 5.5, `05-selection.tex:157` | `dim_k(P⊗R/𝔪) = ρ_P(𝔪) dim_k R/𝔪` | precedes a display; could be merged into it |
| d | 14 | proof of Proposition 5.13, `05-selection.tex:182` | the list of transformed relations | long sentence of relations; a displayed list would be easier to check |
| e | 15 | proof of Proposition 5.11, `05-selection.tex:314` | `T_ℓ z_N T_ℓ^{−1} = [U_i(a−δ_{ℓi}), V_i(b+δ_{ℓi})] = z_N` | fine inline; display for emphasis |
| f | 18 | §6.1, `06-realisation.tex:48` | differential `∂_K⊗id + (−1)^m id⊗d` of the total complex | dense sentence with eleven inline formulas |
| g | 27 | §7.1, `07-simulation.tex:14` | quiver `0 → 1 → ⋯ → l` of K_l | standard inline; display only if K_l should be visually emphasised |
| h | 41 | Theorem 9.17, `09-ar-counterexample.tex:711` | `Λ = [[E,0],[F,E]]` (smallmatrix) | the algebra of the main theorem of §9; a displayed matrix reads better than `smallmatrix` |
| i | 41 | proof of Theorem 9.17, `09-ar-counterexample.tex:734` | `K⊗Ext^i_Λ(M,N) ≅ Ext^i_{Λ_K}(M_K, N_K)` | readable inline |
| j | 44 | §10.3, `10-obstructions.tex:208` | `Λ_0 = [[T,0],[T_{H_1}⊕T_{H_2},T]]` | inside an enumerate item; a displayed matrix would read better |

Not recommended: the remaining scan hits, mostly typed maps (`ev_Y : 𝓠 → D^b(mod k)`, `M : mod_fd R → mod B`,
`π_m : G → GL_5(S_m)`), short identities and the `smallmatrix` notation for triangular algebras in the
introduction and §8, where the inline form is the usual one.

## Applied (2026-10-08)

Gustavo: "Apply all recommended ones and optional ones." All 32 entries applied by Claude Opus 5.5. Formulas
were moved unchanged, except: arrows in displayed chains written as `\longrightarrow`; the sum in entry 6 given
its explicit range `q=0,…,m−1`; z_λ (entry 15) written as a case distinction; the sentence defining ΣM (entry 20)
split into three sentences; the two isomorphisms of entry 10 set in `gather*` (one line was 20 pt too wide);
the transformed relations in the proof of Proposition 5.13 (entry d) set as an itemised list with a two-line
display; the matrices of entries h and j as `pmatrix`. Clean compile, no overfull boxes, 53 pages (was 51);
pages 16, 36, 37, 42 and 46 inspected visually.
