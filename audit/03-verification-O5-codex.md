Model: GPT-6 (Codex); effort: unknown.

# Verification of frozen O.5 and inspection of the AR module

Scope: `scratch/03-frozen-O5.md`, lines 1–31, and the supplied statement of O.4; the AR source is inspected for the requested structural information, not audited in full. No files in the excluded directories were opened. All mathematical conclusions below are AI assessments, not human certification. Only this report is modified.

## Initial checkpoint

The opposite-ring conventions and the projective-resolution construction have passed an initial check. The delicate step is exactness after applying `Hom_Λ(−,G)` to the nonprojective `add G` resolution; an explicit dimension-shifting check follows. The general statement counts isomorphism classes of indecomposable summands, and does not assume that M itself is indecomposable. The application and the section title require separate attention.

## 1. Proposition O.5

**Verdict: no error found in the proposition or its proof. Status: AI-proved, conditional on O.4 as supplied for the last consequence.** The following checks expand the delicate steps without replacing the argument.

1. **Conventions (lines 3–5).** Put B=End_Λ(G), with multiplication by composition. For b∈B and f:G→Y, the left Γ=B^op action is b^op·f=f∘b. Thus F(G)=B with its right regular B action, identified with the left regular Γ-module by b↦b^op. Finite sums and split idempotents extend this identification to the equivalence add G→proj Γ. It is an equivalence of finitely generated categories.
2. **Approximations and resolution (lines 11–15).** For every finite K, a k-basis of Hom_Λ(G,K) supplies a map G^r→K through which every map from G, and hence every object of add G, factors. This is a finite right add G-approximation. It is surjective: each element of K is the image of 1 under a map Λ→K, and Λ∈add G. The kernels remain finite, so the iteration exists. Left exactness identifies the kernels after F; the approximation property supplies exactly the missing surjectivities onto F(K_j). All displayed F-terms are finite projectives. The projective in degree 0 is FM, that in degree 1 is FP, and that in degree j+2 is FG_j. No exactness of F on arbitrary short exact sequences is used.
3. **Nonzero cokernel (lines 16–17).** If Fπ is onto, the projection G→M lifts to h:G→P. Composing h with the inclusion M→G gives a section of π. This contradicts nonprojectivity. Minimality of the cover is unnecessary here; a finite projective epimorphism suffices. S is not asserted to be simple, and in general need not be.
4. **Dual identification (lines 18–20).** A map u:Y→G corresponds to F(u):FY→FG. This is natural on add G, hence identifies the differentials with precomposition by the maps in the original resolution. The right Γ action corresponds to postcomposition by b∈B: u·b^op=b∘u. Accordingly the Ext groups are right Γ-modules, but their vanishing has the asserted meaning.
5. **Acyclic resolution (lines 21–25).** Here is a direct check that avoids any convergence issue. Ext^r_Λ(M,G)=0 and projectivity of P imply Ext^r_Λ(K_0,G)=Ext^{r+1}_Λ(M,G)=0 for r≥1. Since every G_j∈add G and Ext^{≥1}_Λ(G,G)=0, the sequence 0→K_{j+1}→G_j→K_j→0 gives Ext^r_Λ(K_{j+1},G)=Ext^{r+1}_Λ(K_j,G)=0. Induction makes every K_j acyclic for Hom_Λ(−,G). In addition, Ext^1_Λ(M,G)=0 gives surjectivity Hom(P,G)→Hom(K_0,G), and Ext^1_Λ(K_j,G)=0 gives surjectivity Hom(G_j,G)→Hom(K_{j+1},G). These short exact dual sequences splice into precisely the exact augmented complex in (c). This justifies the acyclic-resolution assertion in (d).
6. **Degree zero.** The map Hom(M,G)→Hom(P,G) is injective because π is onto. Hence Hom_Γ(S,Γ)=0, independently of the higher vanishings. The placement of Hom(M,G) in degree zero is correct; deleting it would lose the degree-zero check and shift the calculation.
7. **Consequently (lines 6–9).** Take A=Γ^op=B. A left Γ-module S is a right A-module via s·b=b^op s. Under this identification A as a right A-module is the left regular Γ-module, so the hypothesis of O.4 is exactly Ext^i_Γ(S,Γ)=0 for all i≥0. Transposition of a projective presentation over Γ gives a right Γ-module, equivalently a left B-module. Thus Tr_Γ Ω_Γ^{n−1}S has left B-projective dimension n for every n≥1, by the supplied O.4. There is no left/right switch missing in the conclusion.
8. **Simple count and title.** Distinct indecomposable summands of G correspond to distinct indecomposable projectives over Γ, and hence to simples; B has the same count as Γ. Repetitions do not count again. The exact count in the statement is correct. The heading “with one more simple module” requires an additional restriction or a choice of one indecomposable nonprojective summand of M. Such a summand inherits the Ext hypothesis, since Ext is additive in both finite direct-sum arguments. This is an imprecision in the heading, not a failure of the proposition.

## 2. Small tests

**Status: AI-proved by the explicit hand calculations below.** These are tests of the mechanism under partial hypotheses, not examples satisfying all the counterexample hypotheses. No computational files were created, in accordance with the instruction to modify only this report.

**Dual numbers.** Let Λ=k[ε]/(ε²), M=k, and G=Λ⊕k. Λ is self-injective, Ext^i(M,Λ)=0 for i>0, and the periodic ε-resolution gives Ext^i(M,M)=k for every i≥1. Write π:Λ→k and j:k→Λ, j(1)=ε. Since ker π≅k belongs to add G, choose its identity as the first approximation. The resulting Γ-projective resolution is

    0 → Fk --Fj→ FΛ --Fπ→ Fk → S → 0.

Its dual is Hom(k,G)→Hom(Λ,G)→Hom(k,G), in degrees 0,1,2, with dimensions 2,3,2 and ranks 2,1. Indeed π* identifies Hom(k,G) with maps Λ→G taking 1 into soc G; restriction along j sends y=f(1) to εy, whose image is the one-dimensional εΛ summand. Therefore Ext^0_Γ(S,Γ)=Ext^1_Γ(S,Γ)=0, Ext^2_Γ(S,Γ)≅k, and Ext^i_Γ(S,Γ)=0 for i>2. The surviving degree 2 pinpoints the failure of add G-acyclicity when self-orthogonality is dropped.

**A low-degree-vanishing test.** Let Λ be the radical-square-zero algebra of the oriented two-cycle, with left projectives P_1,P_2 having tops L_1,L_2 and socles L_2,L_1, respectively. The indecomposable injectives are these same two length-two modules, so Λ is self-injective. Set M=L_1 and G=Λ⊕L_1. The minimal projective resolution alternates P_1,P_2; hence Ext^1(M,G)=0 and Ext^2(M,G)=k. The map P_2→L_2 is a right add G-approximation (Hom(L_1,L_2)=0), and its kernel is L_1. Using the identity approximation at that stage gives

    0 → FL_1 → FP_2 → FP_1 → FL_1 → S → 0.

The dual complex has dimensions 2,3,2,2 and ranks 2,1,1. The first map is precomposition with P_1→L_1; the middle map has image the one-dimensional map P_2→soc(P_1); the last map restricts along soc(P_2)=L_1 and has image Hom(L_1,P_2). It follows that Ext^i_Γ(S,Γ)=0 for i=0,1,2 and i>3, whereas Ext^3_Γ(S,Γ)≅k. Thus vanishing of Ext^1(M,M⊕Λ) alone does not yield the conclusion of O.5.

## 3. Classical source

**Status: supported by direct source inspection.** Auslander–Reiten, *On a generalized version of the Nakayama conjecture*, Proc. Amer. Math. Soc. **52** (October 1975), 69–74, published version, local library key `AR75a`, DOI [10.2307/2040102](https://doi.org/10.2307/2040102). Read the introduction and §1, printed pp. 69–72; inspected rendered pp. 71–72 to resolve OCR inequalities. Local source: `AR75a - On a Generalized Version of the Nakayama Conjecture.pdf`.

- Page 69 fixes Artin algebras and left modules. Page 70 reformulates generalized Nakayama using simple modules and Ext in degrees i≥0, and fixes Γ=End_Λ(M)^op in the correspondence of pairs.
- **Theorem 1.1(b), p. 71; proof of (b), p. 72**, is the relevant classical implication: a nonprojective self-orthogonal generator over Λ gives failure of generalized Nakayama for Γ. The proof applies Hom_Λ(M,−) to an injective resolution of M and counts the indecomposable injectives which can occur. Its conclusion reads: “the generalized Nakayama conjecture does not hold for Γ.” Here the paper's generator M is O.5's G=Λ⊕M.
- This is a classical source for the endomorphism-ring implication. It is **not** the same written argument as O.5: the inspected proof uses injective resolutions and missing simple modules, not S=coker(Hom(G,P)→Hom(G,M)) and right add G-approximations. I found no exact locator in this source for that specific cokernel argument. O.4 and its transpose witnesses were supplied in the task; they are not attributed to Theorem 1.1(b).

Search record: searched the local `library.bib` first, then the web for the exact title, generator/endomorphism-ring terms, and MathSciNet/zbMATH terms. The local entry has MR0389977. The AMS web page could not be opened; the locally held published PDF supplied the actual theorem and proof. Search results also identified later expositions, but no locator from an unread exposition is used here. No paper was downloaded or imported.

## 4. What the AR text says about Z

**Textual findings: supported by the quoted source.** The inspected version identifies itself as OpenAI, *An explicit counterexample to the Auslander–Reiten conjecture*, September 23, 2026 (`main.tex:41–45`). The letter F below denotes the AR bimodule, not O.5's Hom functor.

| Locator in `.cache/ar-src/` | Exact source text relevant to the question |
|---|---|
| `02-conversion.tex:45–50` | “Choose an actual map $v_0:X\to FX$ representing $v$ and an embedding $i:X\to Q$ into a finite projective $A$-module.” Then `$Y=(FX\oplus Q)/\{(v_0(x),i(x)):x\in X\}$`, `$Z=(X,Y,\iota)$`. |
| `02-conversion.tex:52–54` | “where $\iota:FX\to Y$ is induced by the first summand and specifies the structure map of the left triangular module. Then $Z$ is a finite nonprojective Gorenstein-projective left $\Lambda$-module”. |
| `02-conversion.tex:288–293` | “At degree zero, \eqref{conv:end-cohomology} shows that $H^0\End^\bullet_\Lambda(P_Z)$ surjects onto the nonzero kernel of $\delta^0$. By comparison this is a nonzero stable endomorphism group of $Z$.” The paragraph ends: “Thus $Z$ is not projective.” |
| `03-algebra.tex:126–128` | “Let $s$ be the one-dimensional left $T$-module on which $f$ acts as $1$ and every other basis letter acts as zero. It is inflated from the corresponding $C$-simple.” |
| `05-cones.tex:10,23–24` | `$A=T\otimes_{\kk}T,\qquad X=s\otimes_{\kk}s,\qquad R=A^e.$` And: “$X$ is one-dimensional, and its nonzero degree-three self-extension proves that it is nonprojective.” |
| `07-branches.tex:223–230` | “Applying that proposition to” the displayed triangular algebra “produces the required finite nonprojective Gorenstein-projective left module, with both positive Ext vanishings in every degree.” |

**Indecomposability: not settled for the actual module Z by the text.** A search of all supplied TeX sections finds no assertion that Z is indecomposable. More substantively, the construction allows replacing (Q,i) by (Q⊕Q′,(i,0)) for any nonzero finite projective A-module Q′. The resulting module is Z⊕(0,Q′,0). Thus the construction as stated allows decomposable representatives. The one-dimensional upper component X forces only one summand to have nonzero upper component; it does not exclude summands (0,N,0). This observation is **AI-proved**, directly from the displayed quotient, and is independent of the claimed Ext vanishings.

To decide a fully specified representative, compute

    End_Λ(Z) = {(α,β) ∈ End_A(X) × End_A(Y) : βι=ι(F⊗α)}.

Since End_A(X)=k, an idempotent has α=0 or 1. A nontrivial decomposition is equivalent, after replacing an idempotent by its complement if needed, to a nonzero idempotent β∈End_A(Y) satisfying βι=0. Such a β splits off (0,im β,0). This gives an explicit decision problem using the A-action matrices and the inclusion ι; a one-dimensional X alone is insufficient. **Status: AI-proved criterion.**

**Can Z be a direct summand of Λ? No, conditional on the claimed nonprojectivity; status: AI-proved implication.** Every direct summand of the regular left module Λ is projective. There is also a direct obstruction using the source's X: the exact upper-component functor sends Λ to the projective A-module A, so if Z were a summand of Λ, X would be a summand of A. This contradicts the asserted nonprojectivity of X. Neither observation audits the preprint's full construction; they explain exactly why its nonprojectivity assertion excludes a summand of Λ. They do not exclude Z from *having* projective summands.

## 5. Dimensions from the specified finite representatives

**Status: AI-proved dimension formulas from the supplied definitions and exact sequences; numerical evaluation below is supported by exact integer arithmetic.** These calculations do not validate the AR Ext computations. The text states dim A=400 (`04-resolution.tex:210`) and dim Λ=2 dim A+dim F (`02-conversion.tex:173–174`). It determines dim F more precisely than the introductory table records.

The corner matrix of C is ((4,2),(2,2)) (`03-algebra.tex:12–20`), and T=C⋉DC (`03-algebra.tex:80–98`). Hence T has corner matrix ((8,4),(4,4)), row/column dimension vector d=(12,8), and radical corner matrix B=((7,4),(4,3)) (`03-algebra.tex:104–105`). The specified relative bar terms (`03-algebra.tex:133–138`) have dimensions p_n=d B^n d^t. If t_n=Σ_{i=0}^n p_i p_{n−i}, the terms of P⊗P have dimensions t_n. Put a_0=400 and a_{n+1}=t_n−a_n; these are the dimensions of its syzygies. The cokernel filtration in `05-cones.tex:177–186`, at N=1, gives

    dim C_1 = a_1 + 2a_3 + a_5.

For R=A^e, dim R=160000. Each specified cosyzygy Σ_R M=coker(M→Hom_k(R,M)) multiplies dimension by 159999. Thus `07-branches.tex:19–38` gives dim 𝒴=159999^4 dim C_1. Its lines 51–56 and 72–78 give dim U_i=400, Q=R⊗𝒴, and 0→F→U_1⊕U_2⊕Q→𝒴→0. Consequently

    dim F = 800 + 159999^5 dim C_1,
    dim Λ = 1600 + 159999^5 dim C_1.

The Q in that bimodule sequence is distinct from the freely chosen projective A-module Q used to define Z. The dimensions of F and Λ do not depend on that latter choice.

The following reproducible integer calculation is embedded here, with its output, because the task authorizes modification of this file only. It checks dimensions for bar degrees 0–4; it does not calculate module maps or Ext groups.

```python
# Claim: dimensions of the specified AR finite representatives.
# Cases: relative bar degrees 0..4; conventions: homological shifts,
# corner order (e,f), k-vector-space dimensions, exact integer arithmetic.
d = (12, 8)
v = d
p = []
for n in range(5):
    p.append(v[0]*d[0] + v[1]*d[1])
    v = (7*v[0]+4*v[1], 4*v[0]+3*v[1])
t = [sum(p[i]*p[n-i] for i in range(n+1)) for n in range(5)]
a = [400]
for x in t:
    a.append(x-a[-1])
c = a[1]+2*a[3]+a[5]
# Independent bookkeeping: Euler recursion through K in degrees -4..0.
rank = 0
for n in range(-4, 1):
    kn = sum(mult*t[n+shift] for shift, mult in [(0,1),(2,2),(4,1)]
             if 0 <= n+shift < len(t))
    hn = {-4:400, -2:800, 0:400}.get(n, 0)
    rank = kn-rank-hn
assert rank == c
print('p =', p)
print('t =', t)
print('a =', a)
print('dim C_1 =', c)
print('dim F =', 800+159999**5*c)
print('dim Lambda =', 1600+159999**5*c)
```

Executed output:

```text
p = [208, 1968, 18640, 176560, 1672400]
t = [43264, 818688, 11627264, 146816000, 1738108160]
a = [400, 42864, 775824, 10851440, 135964560, 1602143600]
dim C_1 = 1623889344
dim F = 170271818183326072615867045851311456
dim Lambda = 170271818183326072615867045851312256
```

The Euler-recursion assertion passed. The numerical dimensions are derived here, not numerals quoted from the preprint. They use its specified relative bar resolution and deliberately large free modules, not minimal stable representatives. In particular the algebra is finite but enormous. The dimension of End_Λ(Λ⊕Z) is a different quantity:

    dim Λ + dim Z + dim Hom_Λ(Z,Λ) + dim End_Λ(Z).

The frozen application's `2·400 + dim F + …` is compatible with this formula, but does not determine the missing terms or specify a minimal construction.

## 6. Final disposition and limits

- **O.5: no error found; AI-proved**, with the supplied O.4 treated as an input. The most delicate step, acyclicity of the approximation resolution, has the explicit dimension-shifting justification in §1. Two partial-hypothesis examples expose surviving Ext groups.
- **Attribution: supported.** The classical implication is Auslander–Reiten, Theorem 1.1(b), p. 71, proof p. 72. Its actual proof differs from the frozen cokernel proof; no claim of an exact classical source for that presentation is made.
- **Application to this Z: plausible, conditional on the AR preprint's unverified Ext assertions.** The literal conditional “if Z is indecomposable” in the frozen paragraph is valid; the text inspected does not supply that premise for its chosen representative. Nonprojectivity excludes Z itself as a summand of Λ, but permits projective summands inside Z.
- **A nine-simple replacement: AI-proved conditional implication.** Even without indecomposability of Z, choose an indecomposable nonprojective summand Z′. Such a summand exists if Z is nonprojective; finite-dimensional modules have finite indecomposable decompositions. Ext^i(Z′,Z′⊕Λ)=0 follows by taking direct summands of the asserted Ext vanishings for Z. Therefore O.5 applies to End_Λ(Λ⊕Z′), which has exactly nine simple isomorphism classes if Λ has eight. This repairs the existential nine-simple conclusion, while leaving the explicit extraction of Z′ unfinished. It does not identify that algebra with End_Λ(Λ⊕Z).
- **Not performed:** a full audit of the AR preprint, a computation of End_Λ(Z) or its idempotents, explicit extraction of Z′, or an independent verification of O.4. No claim here certifies the advertised AR counterexample.

Only `audit/03-verification-O5-codex.md` was written. No source, excluded file, Git history, library entry, or external file was modified.
