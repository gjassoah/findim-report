Model: GPT-6 (Codex; exact model identifier unknown); effort: unknown.

# W4-0407: sections 4 and 7

Scope: adversarial mathematical review of the two drafted sections against the named dossiers, binding notation, the statements of sections 5 and 6, the published MY20 source and the main preprint. Only this audit file is modified. This is an AI assessment, not author certification. Every mathematical finding below has the status explicitly attached to it; a verdict of "no error found" records the scope of the check, not a guarantee.

Review complete. No local gap was found in the numbered theorems, propositions, lemma, corollaries or worked example. The findings concern the opening summary (F1), the simulation explanation (F2, two corrections), and an unsupported necessity claim in a remark (F3). Section 7's main theorem has no error found as an implication from the stated section 5/6 inputs.

## Verdict by block

Line numbers refer to the unchanged LaTeX source snapshots listed below. "No error found" in mathematical arguments has the AI-proved status and scope detailed in the checks below; citations have status cited. No author certification is asserted.

| Section / source lines | Block | Verdict |
|---|---|---|
| 4:4–18 | Setup and opening summary | **Error found — F1:** missing hypotheses. |
| 4:23–137 | Conventions, `thm:bar-decomposition`, source translation and complete proof | No error found. |
| 4:139–156 | `ex:derived-powers` | No error found; independently recomputed. |
| 4:161–168 | Projective dimension of complexes | No error found. |
| 4:170–192 | `lemma:pd-detection` and proof | No error found. |
| 4:194–219 | `prop:pd-formula` and proof | No error found. |
| 4:221–253 | `coro:extinction` and proof | No error found. |
| 4:258–273 | `rem:k0-invisibility` | No error found. |
| 4:275–279 | Representation-space setup | No error found. |
| 4:281–321 | `prop:bounded-extinction` and rewritten proof | No error found. |
| 4:323–326 | Dimension consequence and internal citation | No error found. |
| 7:4–9 | Opening interpretation | No error found, read with the odd-double statement it cites. |
| 7:14–28 | Chain algebra, numbered `eq:chain-resolution` and justification | No error found. |
| 7:30–105 | `prop:simulation` and complete proof | No error found. |
| 7:107–112 | Interpretation of the simulation | **Error found — F2:** number of copies and identification of the resolution. |
| 7:117–159 | `thm:main` and proof | No error found, conditional on the stated section 5/6 inputs. |
| 7:161–163 | Order of choices | No error found. |
| 7:165–182 | `coro:main`, citation and proof | No error found, with the same input scope. |
| 7:184–203 | `rem:what-is-explicit` | **Unsupported claim — F3:** necessity of the chosen presentation expansion. |
| 7:205–212 | `rem:simulation-bound` | No error found. |

## F1. Missing hypothesis in the opening summary

**Verdict: error found. Status: AI-proved (counterexample).** Location: `report/sections/04-trivial-extensions.tex:9–18`.

The opening assumes only that the base algebra is finite dimensional, but claims that extinction is equivalent to finite projective dimension. Take `Delta=k[epsilon]/(epsilon^2)`, `X=0` and `N=k`. Then `A=Delta` and `Phi N=0`, whereas the periodic resolution with all differentials multiplication by epsilon gives `pd_A N=infinity`. The later corollary correctly assumes finite global dimension. The opening must make that restriction explicit; its final two constraints are also stated without their later hypotheses. The Grothendieck-group claim should explicitly concern eventually vanishing orbits: for `Delta=X=N=k`, the functor is the identity and every iterate has class 1.

Proposed minimal repair (not applied):

```diff
--- a/report/sections/04-trivial-extensions.tex
+++ b/report/sections/04-trivial-extensions.tex
@@ -9,2 +9,3 @@
 This section shows that projective dimensions of inflated $A$-modules are
-governed by the iterates of $\Phi$: an inflated module $N$ has finite projective
+governed by the iterates of $\Phi$. When $\Delta$ has finite global dimension,
+an inflated module $N$ has finite projective
@@ -15,4 +16,5 @@
-the present conventions, without flatness hypotheses on~$X$. The section ends
-with two constraints on extinction: classes of long iterates in the Grothendieck
-group must vanish, and extinction times are bounded on modules of bounded
-dimension.
+the present conventions, without flatness hypotheses on~$X$. Under the same
+hypothesis on $\Delta$, two constraints hold: classes of sufficiently long
+iterates of eventually vanishing orbits are zero in the Grothendieck group,
+and finite extinction times are bounded on modules of bounded
+dimension.
```

## F2. Two errors in the simulation explanation

**Verdict: error found. Status: AI-proved.** Location: `report/sections/07-simulation.tex:107–112`.

The ordinary bimodule `X` is over `Delta=B x (B tensor K_l)`, not just over `B_1`. The `l+1` diagonal corners in the second factor are accompanied by the first factor `B`: there are `l+2` diagonal copies. Already `l=0` gives `Delta=B x B`. The later count `3(l+2)` is correct.

The phrase "reads off P as the resolution of a simple module" also identifies the wrong complex as a resolution. In general `P` is not a simple-module resolution: take `B=k` and `P=k + k[1]` with zero differential. The projective resolution is `R_W` of the right `K_l`-simple `W`; tensoring it with `B` and then `O` recovers `P[b]`. This is an error in the explanatory sentence, not in the preceding proof.

```diff
--- a/report/sections/07-simulation.tex
+++ b/report/sections/07-simulation.tex
@@ -108,1 +108,1 @@
-over an algebra with $l+1$ copies of $B$: the chain algebra $K_l$ stores the
+over an algebra with $l+2$ copies of $B$: the chain algebra $K_l$ stores the
@@ -110,2 +110,2 @@
-and the derived tensor with $Y$ reads off $P$ as the resolution of a simple
-module. The cost is that the global dimension, and the number of simple
+and the derived tensor with $Y$ recovers $P[b]$ using the resolution of the
+simple module $W$. The cost is that the global dimension, and the number of simple
```

## F3. Quadraticisation is a construction, not a necessity result

**Verdict: unsupported claim. Status: AI-proved as a source-scope finding; the claimed necessity is not supported.** Location: `report/sections/07-simulation.tex:199–202`, `rem:what-is-explicit`.

The word "needs" asserts more than the given construction: section 6, lines 107–113, supplies a particular quadraticisation by adding generators; it does not establish a lower bound for presentations of `C G`. Even the thirty-symbol convention is a choice: the relations `u_i^2=1` let the three inverse symbols for the `u_i` be eliminated. This does not refute the chosen construction or its size; it invalidates an interpretation as a presentation-independent necessity claim. State what the specified quadraticisation does.

```diff
--- a/report/sections/07-simulation.tex
+++ b/report/sections/07-simulation.tex
@@ -199,2 +199,3 @@
-  itself is large but explicit: a presentation of $\mathbb{C}G$ by relations of
-  degree at most two needs, besides the thirty symbols for the fifteen
+  itself is large but explicit: applying the quadraticisation of
+  \Cref{subsec:encoding} to the chosen group-algebra presentation introduces,
+  besides the thirty symbols for the fifteen
```

## Checks of the reorganised arguments

The following mathematical audit conclusions have status **AI-proved**, except for the finite program checks, whose status is **supported** in the ranges specified below. The main-theorem conclusion is conditional on the statements of sections 5 and 6, as the job requires; their proofs are not independently verified here.

- **Bar construction.** The shift of the whole length summand gives degree `|w|-r` and left action `(-1)^(r|a|)`. The multiplication face is an unshifted chain map; the mixed terms have coefficients `(-1)^r+(-1)^(r-1)`, and its square is zero by the square-zero ideal. On `F_r[r] + F_r[r-1]`, the homotopy `(u,v) -> (v,0)` gives the identity because the internal differentials have opposite signs. It is a contraction over `Delta`, which suffices; it need not be linear over the dg algebra. Each `F_r` is left projective termwise. Finite stupid truncations and the split length filtration justify K-flatness. Tensoring the quasi-isomorphism of dg algebras with this K-flat module justifies the base change; there are only finitely many length indices in any degree of `L`. Tensoring with `Delta` kills the remaining face. Replacing `X` by its bimodule resolution preserves each derived iterate, with naturality supplied by a functorial resolution of `N`.
- **Projective-dimension detection and bounds.** Cancellation of invertible blocks in a bounded-above finite-projective complex stabilises in every degree. For its minimal replacement, maps to simples detect exactly the nonzero projective terms. The product in the adjunction formula has zero factors for `r>n`; the shift is `n-r`, and a nonzero iterate has projective dimension at least zero. The right-projective truncated bimodule resolution gives amplitude `[-r d_R,0]`, while the cohomology-triangle estimate gives `pd_Delta Phi^r N <= d_L+r d_R`. The final bound is therefore `d_L+(t-1)(d_R+1)`.
- **K0 remark.** Over `Q`, the increasing kernels of an endomorphism of an `n`-dimensional vector space stabilise by exponent `n`. The embedding `Z^n -> Q^n` then gives integral class zero. Eventual extinction is explicitly assumed in the numbered remark. The two classes in the simulated double sum to `((-1)^b+(-1)^(b+3))[M(HY)]=0`; this calculation takes place in the integral Grothendieck group even in characteristic two. It supplies the asserted numerical cancellation, not a sufficient criterion for extinction.
- **Bounded extinction.** Restriction of a finite bimodule-projective resolution and truncation at a right-projective syzygy supplies `X'`, without a separability assumption. Tensor products of right-projective bimodules remain right projective: split the first right module off a finite free module before tensoring. On `Rep_d`, the two complementary idempotent ranks add to `d`, so each fixed-rank locus is open and closed. There are finitely many such loci. On each, the term dimensions are constant and each differential extends to a polynomial matrix on an ambient free vector space, with zero on the complementary idempotent image. The exactness condition is the finite union of rank-open conditions `rank D^(j-1)+rank D^j >= dim C^j`. Finitely many degrees give an open `U_t`; noetherianity stabilises the ascending chain. The argument uses the topology on k-points and works over an arbitrary field. Empty representation spaces are vacuous; for `d=0` the sole zero module has extinction time zero. No gap found in the rewritten idempotent-rank argument.
- **Simulation.** The degree-`n` term is `P^(b+n)`, with unshifted differential `d_P`. Multiplication by `(-1)^(bn)` gives precisely the differential `(-1)^b d_P` of `P[b]`. The complex `O+R_Y` is a bounded right-projective bimodule resolution, hence works on unbounded input complexes as asserted. No sign is introduced by associativity. The radical quotient is `(B/rad B)^(l+1)`, which is semisimple over every field; this avoids any separability requirement for `B`. Tensoring simple-module projective resolutions gives the two bounds, and the radical filtration also handles modules which are not finitely generated.
- **General main theorem and choices.** Section 5's definition makes `Psi_R` finitely generated projective, so every `H^rY` remains finite dimensional. Section 6 states exactly one right-projective bimodule complex `P` for all such `Y`, with the odd-double formula over the arbitrary ground field. Its encoding algebra has both global dimensions at most two and detects zero modules. Thus the binomial iteration, the shifts `rb+3j`, the vanishing at `2t`, and the nonvanishing at `2t-2` use precisely those statements. No natural choice of splittings is needed. The algebra, the support interval and `l` are all chosen before `Y`. The upper bound uses `2t` as an annihilating exponent, not as an assertion that the actual extinction time of `N` equals `2t`. The corollary's simple count is `3+3(l+1)=3(l+2)`.
- **Remaining interpretation.** The final paragraph of section 4 is under the preceding proposition's finite-right-global-dimension hypothesis. The global-dimension growth language in section 7 has the tensor-product argument behind it (minimal resolutions also give the corresponding lower bound). In `rem:what-is-explicit`, "one" can consistently mean the entire production of the rectification input, including both the cone-splitting and fraction choices listed in section 6, lines 568–584. The remark does not assert that a bound or algorithm is impossible. Apart from F3, no further defect is assigned to that interpretation.

## Edge cases

| Case | Result of check (AI-proved) |
|---|---|
| `N=0` | Bar decomposition is zero. The pd lemma, formula and extinction corollary require nonzero input; `pd 0=-infinity` is stated. Bounded extinction includes the zero module with time 0. In the main theorem `t>=1`, together with minimality of extinction time, excludes `Y=0`. |
| `X=0` | Only the length-zero summand remains and `pd_A N=pd_Delta N`; this exposes F1 without affecting the numbered results. |
| `t=1` | Section 4 gives `pd_A N=pd_Delta N<=d_L`. Section 7 needs only nonzero `Phi^0N` and zero `Phi^2N`, and gives lower bound 0. |
| `d_R=0` | Use `X'=X`; the amplitude and pd estimates remain valid. |
| `l=0` | `K_0=k`, `R_W=W=k` in degree 0, `Delta=B x B`, and `Phi^2N=P^b tensor_B N=(P tensor_B N)[b]`. |
| Negative `a,b` | The equality `a+l+n=b+n` and the parity identity for `(-1)^(bn)` are unchanged. No condition `a<=0<=b` is needed for the simulation or the conditional assembly. |
| Characteristic 2; non-perfect fields | All sign identities specialise correctly. The global-dimension proof uses a split chain-algebra quotient, not separability of the semisimple quotient of an arbitrary tensor factor. |

## Published-source and citation audit

**Verdict: no error found in the cited numbered statements or their handedness translation. Status: cited.**

The source actually inspected is Hiroyuki Minamoto and Kota Yamaura, *Homological dimension formulas for trivial extension algebras*, *Journal of Pure and Applied Algebra* **224** (2020), 106344, DOI `10.1016/j.jpaa.2020.106344`, at `MY20 - Homological Dimension Formulas for Trivial Extension Algebras.pdf`. The first page identifies the published version. This is not the arXiv v1 used by the D-A dossier's source record. Printed and PDF page numbers coincide. Pages 20 and 22 were also rendered and visually inspected in memory, without creating files.

| Report use | Published locator read | Source content and applicability |
|---|---|---|
| Module conventions | Section 1.1, pp. 4–5 | “the word ‘Λ-modules’ means right Λ-modules”; bimodules are k-central. Internal grading and cohomological grading are distinguished. |
| Projective dimension of complexes | Definition 3.2, p. 12; Lemma 3.5(2), p. 13 | The lower projective endpoint is `-n`; a cohomological shift `[n]` adds `n` to pd. |
| Graded versus ungraded pd | Lemma 3.6, pp. 13–14 | For a finitely graded algebra and a complex of graded modules, graded and ungraded projective dimensions agree. It applies to internal degrees zero and one here. |
| Standing hypotheses for section 4 | Opening of section 4, p. 14 | `A=Lambda+C`, with internal degrees 0 and 1; modules from `Lambda` are inflated and internally concentrated in degree 0. No flatness assumption on `C`. |
| Meaning of derived powers | Section 4.2 and Remark 4.9, p. 19 | `M tensor^L C^a` is the a-fold iteration of derived tensor, including a=0. |
| `thm:bar-decomposition` | Lemma 4.13(4), p. 20; proof of Theorem 4.17, p. 22 | The displayed statements are `p_i P=(M tensor_A^L Lambda)_i` and, for internally degree-zero `M`, `p_i P ~= M tensor_Lambda^L C^i[i]` for i>=0, zero for i<0. Summing internal components gives the required decomposition. |
| `prop:pd-formula` | Corollary 4.11, p. 20 | “For M ∈ D(Mod Λ), we have”, followed by `pd_A M = sup{pd_Lambda(M tensor_Lambda^L C^a)+a : a>=0}`. |
| The opening attribution and extinction corollary | Corollary 4.11, p. 20; Theorem 4.17, p. 22 | The latter separately requires each iterate to be perfect and late iterates to vanish. The report's finite-global-dimension hypothesis supplies perfectness. It must not be omitted as in F1. |
| `coro:main` | Main preprint, Theorem 1.1: `build/sections/01-introduction.tex:24–32`; assembly: `build/sections/06-square-zero-and-conclusion.tex:253–341` | A single finite-dimensional complex algebra and modules with `2m-2 <= pd < infinity` are the stated conclusion. The report derives its additional simple count and sharper finite upper bound in its own proof. |
| `rem:simulation-bound` | Main preprint, proof of Proposition 5.1: `build/sections/05-ordinary-simulation.tex:94–113` | The directed-vertex argument explicitly gives `3l+2` on both sides. The report correctly distinguishes its stronger estimate `l+2`. |

**Left-module translation (AI-proved).** Apply MY20 with `Lambda=Delta^op`, `C=X^op` and the trivial extension `A^op`. A left module becomes a right opposite-module. Reversing homogeneous tensor factors uses `u tensor v -> (-1)^(|u||v|) v tensor u`; the balancing relations become the original ones, and the Koszul sign makes the reversal commute with the differential. Thus the right iterate becomes `Phi^rN`, the right base change becomes `Delta tensor_A^L N`, and the cohomological shift remains `[r]`. Forgetting the internal grading sums its components, without changing that shift.

Internal references were checked against their actual statements: the binding conventions and section 2's shift convention; the section 3 bounded-dimension proposition at lines 292–300; the relevant section 5 definitions and selection theorem; and the section 6 encoding, odd-double, lifting, rectification, realisation and iteration statements. No unresolved or misdirected reference was found in the requested sections. The proofs of those external section 3/5/6 inputs remain outside this job.

## Independent recomputation of `ex:derived-powers`

**Verdict: no error found. Status: AI-proved by the explicit bases and kernels; supported by the exact computation below.**

The surviving paths of `A` are `e0,e1,e2,a,b,x,ba`, so `dim Delta=6` and `dim A=7`. In the displayed resolution the ordered projective bases are
`(e1,b)`, `(e0,a,ba)`, `(e2,x)`, `(e1,b)`.
The three maps, from left to right, have matrices
$$
d_3=\begin{pmatrix}0&0\\1&0\\0&1\end{pmatrix},\qquad
d_2=\begin{pmatrix}0&0&0\\1&0&0\end{pmatrix},\qquad
d_1=\begin{pmatrix}0&0\\1&0\end{pmatrix}.
$$
Their images are respectively `<a,ba>`, `<x>` and `<b>`, exactly the following kernels (including the augmentation kernel); the first map is injective. All entries come from radical paths, so the resolution is minimal, and applying `Hom_A(-,S1)` detects nonzero `Ext_A^3(S1,S1)`. Hence `pd_A S1=3` over every field.

Tensoring `0 -> e1 Delta -> e2 Delta -> S2' -> 0` with `S1` gives `k` in degree `-1` and zero in degree 0. Tensoring it with `S0` gives zero in both degrees. Therefore `Phi S1=S0[1]` and `Phi^2 S1=0`, while the ordinary tensor `X tensor_Delta S1` is zero. The base path algebra gives `pd_Delta S1=pd_Delta S0=1`; the formula contributions are `1` and `(1+1)+1=3`.

The following independent Python check was executed from standard input (exit code 0). To obey the one-file restriction, its source and saved output are embedded here instead of creating files in `computations/`. It imports no previous computation and writes no files. The finite parity checks only support their declared ranges; the universal sign identities were checked algebraically above.

```python
# W4-0407: exact checks, no filesystem output.
# Claim: ex:derived-powers matrices and selected dg/simulation parities.
# Cases: the seven-path algebra over Q; r=1..6, degrees=-3..0;
# b=-4..4, l=0..6. Paths compose right to left, complexes cohomological.
from fractions import Fraction
from itertools import product
B=[(0,),(1,),(2,),(0,1),(1,2),(2,0),(0,1,2)]
forbidden={(2,0,1),(1,2,0)}
def mul(p,q):
    if p is None or q is None or q[-1]!=p[0]: return None
    w=q+p[1:]
    if any(w[i:i+3] in forbidden for i in range(len(w)-2)): return None
    assert w in B
    return w
assert all(mul(mul(p,q),r)==mul(p,mul(q,r)) for p,q,r in product(B,repeat=3))
def basis(i): return [p for p in B if p[0]==i]
def matrix(i,j,arrow):
    return [[int(mul(p,arrow)==q) for p in basis(i)] for q in basis(j)]
def rank(M):
    A=[[Fraction(x) for x in row] for row in M]; r=0
    for c in range(len(A[0]) if A else 0):
        pivot=next((i for i in range(r,len(A)) if A[i][c]),None)
        if pivot is None: continue
        A[r],A[pivot]=A[pivot],A[r]
        v=A[r][c]; A[r]=[x/v for x in A[r]]
        for i in range(len(A)):
            if i!=r:
                v=A[i][c]; A[i]=[x-v*y for x,y in zip(A[i],A[r])]
        r+=1
    return r
D3=matrix(1,0,(0,1)); D2=matrix(0,2,(2,0)); D1=matrix(2,1,(1,2))
def mm(A,B):
    return [[sum(x*y for x,y in zip(row,col)) for col in zip(*B)] for row in A]
assert not any(map(any,mm(D2,D3))) and not any(map(any,mm(D1,D2)))
assert [rank(D3),rank(D2),rank(D1)]==[2,1,1]
assert rank(D3)+rank(D2)==len(basis(0))
assert rank(D2)+rank(D1)==len(basis(2))
assert len(basis(1))-rank(D1)==1
print("basis dimensions (Ae1,Ae0,Ae2,Ae1):", [len(basis(i)) for i in [1,0,2,1]])
print("d3,d2,d1:", D3,D2,D1)
print("ranks: 2,1,1; consecutive products zero; augmented dimensions exact")
print("343 associative triples checked")
mixed=action=balanced=simulation=0
for r in range(1,7):
    assert ((r)+(r-1))%2==1; mixed+=1
    for adeg in range(-3,1):
        assert (r*adeg-adeg-(r-1)*adeg)%2==0; action+=1
        for zdeg in range(-3,1):
            assert (r*(zdeg+adeg)-r*adeg-r*zdeg)%2==0; balanced+=1
for b in range(-4,5):
    for ell in range(7):
        for n in range(-ell,0):
            assert (b*(n+1)-b-b*n)%2==0; simulation+=1
print("parities:", dict(mixed=mixed,action=action,balanced=balanced,simulation=simulation))
```

Saved output:

```text
basis dimensions (Ae1,Ae0,Ae2,Ae1): [2, 3, 2, 2]
d3,d2,d1: [[0, 0], [1, 0], [0, 1]] [[0, 0, 0], [1, 0, 0]] [[0, 0], [1, 0]]
ranks: 2,1,1; consecutive products zero; augmented dimensions exact
343 associative triples checked
parities: {'mixed': 6, 'action': 24, 'balanced': 96, 'simulation': 189}
```

## Snapshot and scope limits

Review date: 2026-10-08. Repository revision at review: `3ec6473893fbcbfc4b639f983ec292ea88eedf38`. Existing changes in `codex/QUEUE.md` and the untracked `audit/W4-05-codex.md` were observed in Git status and not read or changed. The prohibited ledgers, logs, escalation files and other prior audit/output files were not consulted. The only created or modified file is this report.

At the final snapshot check, another process had advanced HEAD to `f58d833c63b20949d638f40b92cc09e97cf002e9` and changed section 5. Its diff was inspected: it corrects right-module K0 notation, two interpretive sentences and the range `0<=q<m-1` in a proof. The selection definition, group presentation statement and unbounded-extinction theorem used here are unchanged. Sections 4, 6 and 7 and the dossiers/notation retain their original hashes. The table records both section 5 snapshots. The newly visible `audit/W4-0809-codex.md` was not opened.

| Input | SHA-256 |
|---|---|
| Section 4 | `4ca189ef5aebc81f1e09ebb6c4109a630275be48ee0b23390858355aee6d2690` |
| Section 7 | `51c264e681a859fd7931d03c938cd7d412ab6251597ed095cd04a01cd6db68f8` |
| Section 5, initial | `d0a488bd4ffe7bbbf081d630089f1feea9a32e0a2eb662efb754d4a166313919` |
| Section 5, final | `1084b200565d4c8cee75c0f5f0d6fc0c7147e67253ceb461da2b4aacdc0c771c` |
| Section 6 | `e9680092008b59e41b6475e60aa0462c83d42fa3b1ba3018e88140f002af1742` |
| D-A dossier | `0548e2afa8c98fc76c8b665526b257d1315892abbe7bd86c702e9b2b19d8bac6` |
| C-1 dossier | `a9a53ddb3c7ac5ad00819c303a9aaf5c185c34fb40d2e429be56998206d06d0b` |
| Binding notation | `f69ee451cfbff429f46196434626154173f6ed52cc4657c8c8976e20fd6db8d5` |
| Published MY20 PDF | `8a862f9a0fa699c7eb130a2e9b54aa8af00da196586f2314cf0c4179b8652f08` |

Three parallel same-model subagents supplied adversarial checks of the bar proof/example, simulation/assembly and citations. Their messages were treated as leads: the retained findings and cited passages were rechecked by the primary agent. No different-model check, Lean formalisation, manuscript build, or author certification is claimed. The next review should focus on the proofs of the section 5/6 inputs if an independent assessment of the entire main theorem is wanted; this job checks that section 7 uses their stated generality correctly.
