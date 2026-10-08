Model: GPT-6 (Codex; exact variant unknown); effort: unknown.

# W4-0809 verification

Status: complete.
This is an adversarial AI review, not author certification.
The only output file modified by this job is this report. Source edits below are
proposals, not applied changes. Mathematical findings are labelled **AI-proved**
when accompanied by a complete derivation, or **supported** for finite checks.

Scope: every numbered statement, proof, equation and remark in
`report/sections/08-conversion.tex` and `report/sections/09-ar-counterexample.tex`,
compared with dossiers D-D and D-E, the used preliminaries and criteria, and
`audit/report-notation.md`. The prohibited ledgers, logs, escalations, Codex
outputs and other audit files are excluded. Existing unrelated working-tree
changes are left alone.

Work is split between the complete-resolution/conversion argument, the algebra
and cohomology foundations, and the cone/lift/fibre argument. Findings from
parallel readers are leads and are checked before inclusion. The final pass
also checks simple modules, dimensions, citations and certificate coverage.

## Verdict table

The verdicts below concern the written blocks, including their proofs. A
`no error found` verdict is not a certification or a promotion to author-checked
status. Reasons for findings and proposed changes follow the table.

| Block (source lines) | Verdict |
|---|---|
| §8 introduction, Hom and cokernel conventions, (8.1) (4–44) | No error found. |
| Lemma 8.2, complete resolutions (46–110) | No error found: both comparison and homotopy recursions, shifts, and positive Ext identification checked. |
| Symmetric-algebra and tensor-functor consequences (112–135) | No error found. |
| Triangular setup and Lemma 8.3 (140–197) | No error found in all three parts. |
| Theorem 8.4 and (8.5) (202–315) | No error found, in arbitrary characteristic, including the sign automorphism, endomorphism coordinates and connecting map. |
| Remark 8.6 (317–332) | Unsupported necessity claim: F1. |
| §9 field and roadmap (4–24) | Field and parameters correct; computation-appendix gap F2. |
| Lemma 9.1, algebra `C` (29–66) | No mathematical error found; all eleven hand-check triples match. Missing appendix reference: F2. |
| (9.2) and Proposition 9.3, resolution and dual (68–128) | No error found; both kernel/image tables recomputed. |
| Aperiodicity paragraph (130–133) | Unsupported as written; missing isomorphism-invariant argument supplied in F4. |
| Lemma 9.4, symmetric `T` (138–155) | No error found. |
| Theorem 9.5 and (9.6), triangle and Yoneda algebra (157–206) | No mathematical error found; wrong derived-category macro F3. |
| Bar resolution, Lemma 9.7, degree-three chain lift (211–282) | Gap F2: table absent from report. Finite identities and chain lift check against the cited source table. |
| Proposition 9.8, bar cycle and generator (284–302) | No error found, with that table. |
| Lemma 9.9, twist action (304–327) | No error found: inverse-twist eigenvalue `λ^{-m}` for every `m≥0`. |
| Proposition 9.10, tensor-square Ext (332–362) | No error found. |
| Proposition 9.11, Tate groups and multiplication (364–391) | No error found; original duality and composition locators checked. |
| Lemma 9.12, finite two-cone bimodule (396–461) | Error in first-cone representative: missing shift F5. Other finiteness and splitting steps check. |
| Proposition 9.13, all-integer profile (463–507) | No error found after interpreting the first-cone object with its required shift. |
| Proposition 9.14, lifts (512–608) | Gap F6 in the degree-zero `B` homotopy. Other `B/G` degrees, tail map and stable nonvanishing check; omitted minimal-cover justification recorded separately. |
| Finite representative and fibre sequence (9.15) (613–629) | Missing coinduced action and projectivity justification F7. |
| Proposition 9.16, fibre comparison (631–681) | Determinant wording error F8; groups, naturality and invertibility conclusion check. |
| Theorem 9.17, AR counterexample (683–716) | No further error found: conversion hypotheses, radical, eight split simples and every field extension check. Depends on preceding local repairs. |
| Corollary 9.18, nine-simple algebra (721–741) | No error found; correct endomorphism-algebra orientation and choice of a summand after scalar extension. |
| Remark 9.19, sizes (743–761) | Literal size recomputed correctly; unsupported run-history figures F9 and missing computation reference F2. Clarify which algebra has nine simples. |

## Findings and coverage

### F1. Unsupported necessity in the conversion remark

**Verdict: unsupported claim; status: AI-proved correction.**
`08-conversion.tex:325–329`, `rem:conversion-mechanism`.
The hypotheses require a surjective degree-zero comparison with nonzero
kernel; they do not require its target to be a single line. Replacing any
admissible pair `(S,v)` by `(S⊕S,v⊕v)` replaces every comparison by its
entrywise map on 2-by-2 matrices, preserving the hypotheses and multiplying
the target dimension by four. The theorem also imposes no separate condition
that the two actions be distinct. The one-dimensional assertion belongs to
the specific construction in Section 9.

```diff
--- a/report/sections/08-conversion.tex
+++ b/report/sections/08-conversion.tex
@@ -328,2 +328,3 @@
-  with two different actions of the Tate algebra of $S$, while
-  $\widehat{\operatorname{Ext}}{}^0_E(S,FS)$ is a single line. The bimodule of \Cref{sec:ar-route} achieves this with a
+  with the two actions of the Tate algebra of $S$. In the construction below,
+  $\widehat{\operatorname{Ext}}{}^0_E(S,FS)$ is a single line.
+  The bimodule of \Cref{sec:ar-route} achieves this with a
```

### F2. Missing computation appendix and cocycle definition

**Verdict: gap.** `09-ar-counterexample.tex:23,63,232,270,547,753,755` all
refer to `app:computations`, which is not defined in the files input by
`report/main.tex`. At lines 231–235 this is mathematical input: the purported
appendix is the only in-report definition of the 179-entry cochain. The
dossier instead supplies the exact source file and certificate table. The
table exists in the allowed external sources, but it has not been included
in the report. Minimal definition repair while that appendix remains absent:

```diff
--- a/report/sections/09-ar-counterexample.tex
+++ b/report/sections/09-ar-counterexample.tex
@@ -231,3 +231,3 @@
 Let $p\colon\mathfrak{r}^{\otimes_I3}\to T$ be the $I$-bilinear map given by
-the table of $179$ coefficients in \Cref{app:computations}, reproduced from the
-appendix of~\cite{OAI26ar}: an entry $abcw$ in the row $q^d$ means that the
+the table of $179$ coefficients in Appendix~A
+of~\cite{OAI26ar}: an entry $abcw$ in the row $q^d$ means that the
```

Appendix A is titled *The complete degree-three cochain*, verified in the
local preprint's `main.tex` and `09-cochain.tex`. Completing and inputting
the promised computation appendix, including its table and certificates,
would instead resolve the full group of references. Merely adding a label
without the table and receipts would not repair the missing content.

### F3. Derived-category macro uses the wrong argument

**Verdict: error found (notation); status: AI-proved correction.**
`09-ar-counterexample.tex:183`, proof of `thm:T-ext`.
In `main.tex`, the angle-bracket argument of `\DerCat` is a subscript;
its optional square-bracket argument is the superscript. The draft prints
`D_-(mod T)`, whereas the bounded-above category is `D^-(mod T)`.

```diff
--- a/report/sections/09-ar-counterexample.tex
+++ b/report/sections/09-ar-counterexample.tex
@@ -183,1 +183,1 @@
-  in $\DerCat<->{\operatorname{mod}T}$. The terms $T\otimes_CCe=Te$ and
+  in $\DerCat[-]{\operatorname{mod}T}$. The terms $T\otimes_CCe=Te$ and
```

### F4. Aperiodicity is asserted without an isomorphism invariant

**Verdict: unsupported claim as written; status: AI-proved repair.**
`09-ar-counterexample.tex:130–133`. Different differential matrices alone
do not exclude periodicity up to change of bases. Here the assertion does
hold: put `M_i=⟨ℓ_i,z,j⟩=Ω^{i+2}s`. On `eM_i=⟨ℓ_i,z⟩`, the operator
`y` is nonzero, and `x=q^{i+1}y`. Every module isomorphism preserves this
ratio. Transcendence of `q` therefore makes these syzygies pairwise
nonisomorphic. The phrase “nothing is gained” is also too broad: the precise
obstruction here is `Ext_C²(s,C)≠0`, so `s` is not an AR witness over `C`.

```diff
--- a/report/sections/09-ar-counterexample.tex
+++ b/report/sections/09-ar-counterexample.tex
@@ -130,4 +130,8 @@
 The parameter $q$ makes the resolution aperiodic, with the differentials
 $\ell_i$ never repeating, while the self-extensions of $s$ vanish in positive
-degrees. Over $C$ alone nothing is gained; the next step trades this
+degrees. Indeed, on $e\langle\ell_i,z,j\rangle$ the actions satisfy
+$x=q^{i+1}y$ with $y\neq0$. This ratio is preserved by $C$-module
+isomorphisms, so these syzygies are pairwise nonisomorphic.
+The module $s$ is not an Auslander--Reiten counterexample over $C$, since
+$\operatorname{Ext}^2_C(s,C)\neq0$; the next step trades this
 behaviour for a polynomial Ext algebra.
```

### F5. The first-cone representative is missing its shift

**Verdict: error found as literally defined; status: AI-proved correction.**
`09-ar-counterexample.tex:427–429`, `lemma:two-cones`.
The raw cokernel in degree `−N` represents the first cone shifted by `−N`.
The displayed first triangle requires its `[N]` shift, just as for
`𝒞=C_N[N]` earlier in the same statement. The dossier's §8.4.3 retains
this cosyzygy step. Using `N=1` gives a minimal unambiguous repair:

```diff
--- a/report/sections/09-ar-counterexample.tex
+++ b/report/sections/09-ar-counterexample.tex
@@ -427,3 +427,5 @@
   in $\operatorname{\underline{mod}}E$, where $\mathcal{C}_1S$ is the
-  evaluation at $S$ of the analogous cokernel of
-  $\mathcal{L}\otimes_\kk\mathbb{B}$, and the second $\tau_2$ is induced by $p$
+  evaluation at $S$ of a bimodule representing
+  $\operatorname{coker}((\mathcal{L}\otimes_\kk\mathbb{B})^{-2}\to
+  (\mathcal{L}\otimes_\kk\mathbb{B})^{-1})[1]$ in the stable category,
+  and the second $\tau_2$ is induced by $p$
```

### F6. The degree-zero case of the first homotopy is missing

**Verdict: gap in the compressed proof; status: AI-proved repair.**
`09-ar-counterexample.tex:567–571`, `prop:lifts`.
The cancellation involving the “last bar of the source” treats `n>0`.
Precisely at `n=0`, where there is no last bar, `D_b` is nonzero. Dossier
§8.5.3 separately restores the omitted idempotent summand. The finite
Casimir identity needed for this repair is covered by the rerun certificate.

```diff
--- a/report/sections/09-ar-counterexample.tex
+++ b/report/sections/09-ar-counterexample.tex
@@ -570,2 +570,9 @@
   the appended bar with its coefficient gives the same element. Hence
-  $dB+Bd=D_b$. In $dG+Gd$ the products among the first bars cancel, and what
+  $dB+Bd=0$ in negative degrees. In degree zero, for $r=e,f$,
+  \[
+    dB_0(r[\,]r)=
+    \sum_{\substack{w\text{ radical}\\\operatorname{left}(w)=r}}
+    h_\lambda(w)\otimes_Iw^*+r\otimes_Ir^*
+    =r\xi_\lambda=D_b(r[\,]r).
+  \]
+  Thus $dB+Bd=D_b$. In $dG+Gd$ the products among the first bars cancel, and what
```

### F7. The action on the coinduced module has been omitted

**Verdict: gap in construction data; status: AI-proved repair.**
`09-ar-counterexample.tex:615–618`. The injection is linear for the
coinduced action `(rφ)(t)=φ(tr)`, not the pointwise action coming from `M`.
The draft gives no action. Dossier §8.6 specifies it and explains why the
resulting module is projective-injective. This is also what justifies the
dimension multiplier used in the final remark.

```diff
--- a/report/sections/09-ar-counterexample.tex
+++ b/report/sections/09-ar-counterexample.tex
@@ -615,3 +615,6 @@
 $E^e$-module $M$, put $\Sigma M=\operatorname{coker}(M\to\Hom[\kk]{E^e}{M})$,
-where $M\to\Hom[\kk]{E^e}{M}$, $m\mapsto(r\mapsto rm)$, is an injection into a
-projective-injective module; if $M$ is projective on each side, so is $\Sigma
+where $(r\varphi)(t)=\varphi(tr)$ is the action on the Hom space.
+The map $m\mapsto(t\mapsto tm)$ is linear and injective. Its target is
+projective-injective, since $\Hom[\kk]{E^e}{M}\cong D(E^e)\otimes_\kk M
+\cong E^e\otimes_\kk M$, with $M$ regarded as a vector space on the right.
+If $M$ is projective on each side, so is $\Sigma
```

### F8. Scalar determinant versus determinant of the full map

**Verdict: error found (wording of the computation); status: AI-proved correction.**
`09-ar-counterexample.tex:676–679`, `prop:fibre`.
The displayed map acts on `(H^{3m})²`, with `dim H^{3m}=m+1`. Its determinant
is `(H_1^{-m}+H_2^{-m})^{m+1}`. The quantity in the draft is the determinant
of its scalar 2-by-2 matrix. The dossier explicitly makes that distinction;
invertibility and the theorem are unaffected.

```diff
--- a/report/sections/09-ar-counterexample.tex
+++ b/report/sections/09-ar-counterexample.tex
@@ -678,1 +678,2 @@
-  by \Cref{lemma:twist}, with determinant $H_1^{-m}+H_2^{-m}\neq0$, since
+  by \Cref{lemma:twist}; its scalar $2\times2$ matrix has determinant
+  $H_1^{-m}+H_2^{-m}\neq0$, since
```

### F9. The stopped-minimisation numbers have no receipt in the permitted certificates

**Verdict: unsupported claim within the specified evidence set.**
`09-ar-counterexample.tex:754–757`, `rem:ar-sizes`.
Neither D-E nor the scripts/receipts in `computations/08-D-E/` records
the claimed intermediate dimensions `784704` and `1377984`. The named
report appendix is absent. These run-history assertions cannot be checked
against the supplied dossiers and certificates. This is not a claim that
the numbers are false. Supply and cite the actual minimisation-run receipt,
or omit the sentence until that evidence is included:

```diff
--- a/report/sections/09-ar-counterexample.tex
+++ b/report/sections/09-ar-counterexample.tex
@@ -754,4 +754,1 @@
-  $\dim_\kk\Lambda\approx1.7\cdot10^{35}$. A computation with minimal bimodule resolutions of
-  the two cones, recorded in \Cref{app:computations}, reached intermediate
-  bimodules of dimensions $784\,704$ and $1\,377\,984$ before being stopped; it
-  gives no lower bound for the dimension of a minimised construction. The
+  $\dim_\kk\Lambda\approx1.7\cdot10^{35}$. The
```

The preceding literal size is independently supported below, but that
dimension calculation is likewise not among the `08-D-E` certificates.
The remark's final “nine” refers to the endomorphism algebra in
`coro:ar-findim`, not to `Λ`, which has eight simples. To remove the
ambiguous change of algebra, replace `The number of simple modules, nine,`
by `The number of simple modules of the algebra in \Cref{coro:ar-findim}, nine,`.

### Additional compressed step: the minimal bimodule syzygy

**Verdict: omitted justification, routine check completed; status: AI-proved.**
`09-ar-counterexample.tex:592–595` identifies the kernel of the bar
augmentation with `Ω_{E^e}E`, under a convention that reserves `Ω` for a
minimal projective cover. The identification is correct, but the dossier's
explicit top computation is omitted. Its source is
`(B⊗B)^0=⊕_r Er⊗_k rE` for the four primitive vertex idempotents `r` of `E`.
Both tops consist of the same four diagonal simple `E^e`-modules, and
multiplication is the identity on them. Thus the augmentation is a projective
cover. This is not a counterexample to the lift, but is a requested example
of a dossier justification dropped during compression.

```diff
--- a/report/sections/09-ar-counterexample.tex
+++ b/report/sections/09-ar-counterexample.tex
@@ -595,1 +595,4 @@
   which takes values in the kernel of the augmentation, since $b$ does.
+  This augmentation is a projective cover: its source is
+  $\bigoplus_r Er\otimes_\kk rE$, over the four primitive vertex idempotents,
+  and the induced map on tops is an isomorphism.
```

### Computation checkpoint: literal size (supported, exact integers)

The dimension in `rem:ar-sizes` is reproduced independently. The corner
dimension matrix of `T` is `[[8,4],[4,4]]`, the radical matrix is
`R=[[7,4],[4,3]]`, and `v=(12,8)` records the projective dimensions. Therefore
`dim B^{-n}=v R^n v^t` gives
`208, 1968, 18640, 176560, 1672400` for `n=0,…,4`.
For `Q=B⊗B`, convolution gives
`43264, 818688, 11627264, 146816000, 1738108160`.
Thus the dimensions of `K^j=Q^j⊕(Q^{j-2})²⊕Q^{j-4}`, `j=0,…,4`, are
`1761405952, 148453376, 11713792, 818688, 43264`.
The cohomology dimensions in these degrees are `400,0,800,0,400`.
The finite Euler calculation yields

```
dim C_1 = 1623889344
dim F = 800 + 159999^5 dim C_1
      = 170271818183326072615867045851311456
dim Λ = 170271818183326072615867045851312256
      = 1.702718181833260726... × 10^35.
```

The universal finite certificates were inspected and rerun without writing
files: `python3 -B computations/08-D-E/certificate_receipt.py` exited 0,
confirmed all 179 entries equal the preprint table, and reproduced both
saved certificate outputs exactly. They cover the finite algebra, cochain,
bar-cycle and Casimir identities; further coverage details follow below.

## Independent algebra and proof checks

### Multiplication tables and kernels (supported by exact computation; uniform formulas AI-proved)

An independent inline implementation of the twelve products of `C`, its
idempotents and its corners, over the exact rational-function field
`F₂(q,r)`, checked all `10³` associators. The eleven composable radical
triples of total degree at most four are exactly those listed at lines
58–60, with the same eleven values. Multiplication with matching
idempotents is tautologically associative; mismatched corners give zero.

Here is the full linear-algebra reduction, which also makes the parameter
specialisations reproducible without extrapolating from a few syzygies.
Let `ℓ(r)=x+ry`, use the ordered bases in the draft, and read each list
below as the columns of the corresponding multiplication matrix:

| Map | Columns | Rank and kernel |
|---|---|---|
| `Ce → Cf`, right multiplication by `u` | `u,v,v,0,(1+q)n,0` | Rank 3; kernel `⟨x+y,z,j⟩`. |
| `Ce → Ce`, right multiplication by `ℓ(r)` | `ℓ(r),qr z,z,0,(1+q²r)j,0` | Rank 3; kernel `⟨x+qr y,z,j⟩`, if `1+q²r≠0`. |
| `fC → eC`, left multiplication by `u` | `u,qx+y,z,v` | Rank 4; kernel zero. |
| `eC → eC`, left multiplication by `ℓ(r)` | `ℓ(r),r z,qz,0,(1+r)v,0` | Rank 3; kernel `⟨x+(r/q)y,z,v⟩`, if `r≠1`. |
| The previous map at `r=1` | `x+y,z,qz,0,0,0` | Rank 2; kernel `⟨qx+y,z,u,v⟩`. |

Each proposed kernel is annihilated, has dimension equal to nullity, and
each image basis spans the displayed columns. For `r=q^i`, `i≥0`,
`1+q²r≠0`; moreover `1+r≠0` exactly when `i≥1`. These are the only
specialisations needed. Thus the formulas apply to every index. The
degree-two dual cohomology is `⟨v⟩` modulo `⟨ℓ₀,z⟩`; right multiplication
by `t` sends `v` to the boundary `qz`, and all other radical products with
`v` vanish. Its right-module structure is therefore precisely `s^r`.

### Signs, degrees and exceptional cases (AI-proved checks)

- In Lemma 8.2 the negative comparison recursion uses projectivity; the
  positive recursion uses extension of maps from `C^n(P)` into projectives.
  For a stable-zero map the chosen `h¹` first removes its projective
  factorisation, then `h⁰` starts the negative recursion and `h¹=0` starts
  the positive one. Exactness makes each induction step possible, with no
  boundedness assumption. The Hom product permits all the resulting
  components simultaneously.
- The cone quotient has relation `(v₀(s),−i(s))`; `(t,q)↦(t,−q)` converts
  it to the stated relation while preserving the inclusion of `FS`.
  For degree `n` the off-diagonal differential is
  `(-1)^n(dh+(-1)^n hd+fj−F(g)f)` and equals
  `(-1)^{n+1}(δ(g,j)−∂h)`. Thus the coordinate differential and connecting
  homomorphism are exactly those in the draft in every characteristic.
- The derived triangle for `T` is `s[2]→I→s→s[3]`; applying the
  contravariant Hom gives `Hom(I,s[a−1])→V^{a−3}→V^a→Hom(I,s[a])`.
  At `a=1`, `V^{−2}=0` suffices even though the first outer term is nonzero;
  at `a≥2` both outer terms vanish. The middle map is
  `β↦β[3]η`, so the recurrence proves nonzero Yoneda powers, not just
  the dimensions of Ext.
- The bar cycle has cancelling inner terms from `tx=j`, `ty=q²j`,
  `xj*=t*`, `yj*=q²t*`; the two outer terms vanish on the simples.
  Its evaluation is `q³`. The lower cases `n<3` and `n=3` of the lifted
  cochain identity are zero directly from the declared target degrees.
- The right-twist tensor functor is restriction along `h_λ^{-1}`. Pulling
  the evaluated cochain back along this inverse scales the unique dual
  input by `λ^{-1}`. Thus `λ^{-m}`, not `λ^m`, occurs on positive Ext.
- Tate duality supplies the negative groups and the transpose action.
  In the first cone, the positive cokernel contributes `U^{3m}` and the
  negative kernel contributes `U^{1−3m}`, including `m=0`. The second
  action is `x_m↦x_{m+1}`, `y_m↦y_{m−1}` for `m≥1`, and `y₀↦0`.
  Hence only `W⁰,W³` survive, and the actual composite top projection
  identifies `W³` with `H^{−1}`.
- Once F6's degree-zero case is supplied, `dB+Bd=D_b` in every degree.
  For `G`, the boundary identity gives `dG+Gd=pB` for `n≥2`, and both
  sides vanish for `n=0,1`. The only tail-map defect is `D_b⊗D_b` in
  source degree zero. At `n≥4`, cokernels therefore yield
  `E_λ[−n]→𝒞[3−n]`, as required. Evaluation retains only the terminal
  coefficient `f`, giving `λ²(f*⊗f*)`.
- The stable-nonvanishing argument uses both symmetry and the radical:
  a map through a free module sends `S` into the left socle, and subsequent
  multiplication by a radical element is zero by the trace pairing.
  The displayed socle element is nonzero.
- The fibre sequence gives the diagonal `V⁰`, handles `a=1` by the
  surjection `(H⁰)²→W³`, and gives `V^a≅(H^a)²` for all `a>0`.
  In every positive multiple of three, the scalar determinant is nonzero
  because `H₁^m` and `H₂^m` are distinct monomials, also for even `m`.
  No finite-field or finite-degree approximation is used in this step.

### Simple modules and field extensions (AI-proved checks)

The sum `J_T⊗T+T⊗J_T` is nilpotent and has quotient `k⁴`. The triangular
radical ideal has quotient `k⁸`; if `J_E^n=0`, its `2n`-th power is zero,
because an off-diagonal monomial has at most one `F` factor and at least
`n` radical factors on one side. Thus `Λ` is split basic with eight
indecomposable projectives. An indecomposable nonprojective summand `Z'`
is distinct from all eight. The nine distinct indecomposable summands of
`Λ⊕Z'` give nine simples for its endomorphism algebra. No algebraically
closed hypothesis is needed for this count. The conclusion of
`thm:ar-to-findim` uses `End_Λ(Λ⊕Z')` itself for **left** finitistic
dimension, agreeing with the corollary.

Flat scalar extension preserves the computed Ext groups and total
acyclicity termwise. The nonzero extension class of a nonsplit projective
surjection to `Z` stays nonzero after tensoring with a field extension,
so nonprojectivity persists. The corollary correctly chooses a new
indecomposable nonprojective summand after extension; it does not assume
that the old `Z'` stays indecomposable.

## Certificate and citation coverage

| Attribution in the draft | Evidence actually inspected and rerun | Scope |
|---|---|---|
| Associativity, grading, trace | `foundations_certificate.py` and its saved output | All 1,000 `C` and 8,000 `T` associators, every basis-product grading, all 400 trace entries over exact `F₂[q]`. |
| Cocycle, corners, weight | `finite_cochain_certificate.py` and output | All 179 entries; all 104,976 radical four-words (including 15,250 composable ones), not a sample. |
| Twisted boundary identity | Same certificate | All 324 radical pairs, both coefficients of `λ⁰,λ¹`; inverse factors cancel as specified in the dossier. |
| Bar cycle and evaluation | Same certificate | Exact cycle differential zero and value `q³f`. |
| Twisted Casimir and endpoint sums | Same certificate | Constant and linear coefficients in `λ`, separately at both vertices. The all-degree `B/G` identities still require the written cancellation arguments. |
| Equality of the cochain table with the source | `certificate_receipt.py` | All 179 entries agree; fresh executions reproduce both saved outputs byte-for-byte. |
| Literal `C₁`, `F`, `Λ` dimensions | Independent inline integer calculation recorded above | Correct, but no corresponding `08-D-E` certificate was found. |
| Stopped minimisation dimensions | No matching supplied receipt | Unsupported within this job's evidence set: F9. |

The finite certificates do not establish all-degree Ext, homotopies,
Tate duality or stable-category conclusions by themselves. Those were
checked by the arguments above. The saved finite-range cone replay and
the earlier low-degree Ext receipts are not substitutes for those arguments.

- `AR75a`: read the original library PDF *On a Generalized Version of the
  Nakayama Conjecture*, Proceedings AMS 52 (1975), pp. 69–71. Its p. 70
  conjecture uses a generator with vanishing positive self-Ext. The page
  was rendered directly to memory to check the inequality `i≥1` where OCR
  was ambiguous. Taking `Z⊕Λ` gives the formulation used in §8, by
  additivity and projectivity of `Λ`; the attribution is appropriate.
- `OAI26ar`: checked the title/date and included source order in the local
  preprint snapshot, the characteristic-two conversion statement in
  `02-conversion.tex`, Theorem 1.1 in `01-introduction.tex`, and the entire
  defining cochain table in Appendix A (`09-cochain.tex`). The stated
  theorem citation supports the field, eight split simples, Gorenstein
  property and arbitrary scalar extension. The report's extra proof
  supplies the specific construction it uses.
- `Lin12a`: read the library PDF of arXiv:1211.5999v1, 26 November 2012,
  Section 2. The standing hypotheses are a finite-dimensional symmetric
  algebra and finitely generated left modules. Equation (2.1), printed
  p. 3, gives `Ext-hat^{n−1}(V,U)≅D Ext-hat^{−n}(U,V)`, “which is natural
  in U and V.” Equation (2.2), p. 4, is its nondegenerate pairing, and
  (2.8), p. 6, states `⟨ζη,τ⟩=⟨ζ,ητ⟩`. Substituting a positive-degree
  monomial, `τ_i`, and a negative class gives precisely the transpose
  action used in Proposition 9.11.
- Every `Cref`, `eqref` and `ref` in §§8–9 was compared with the labels
  in the files actually input by `report/main.tex`. The only unresolved
  label in these sections is `app:computations`, at the seven locations
  in F2. All other references resolve; their used statements in §§2–3
  have the requisite hypotheses and orientations. The reference to
  `coro:main` indeed states `3(l+2)` simples with existential `l`.

## Reproducibility and limits

Only this audit file was written. New scripts, rendered files, build
outputs, manuscript edits, commits and other audit changes were not made.
The certificate runner and its child processes use `-B`, and the independent
checks ran inline. The PDF rendering went to memory. No forbidden ledger,
log, escalation, Codex output or other audit file was opened. No full
report compilation was performed; the macro issue was checked directly
against its definition, and the references were checked against the
actual input graph. The minimisation-run history remains outside the
evidence supplied for this job.

Final validation: all ten proposed unified-diff hunks were checked in memory
against their stated current source lines; every old/new hunk count matches.
The report's equation and statement numbering was also checked against the
shared section counters. Other working-tree changes appeared concurrently;
this job did not inspect or alter their contents.

Reviewed input SHA-256 values:

```
08-conversion.tex       fb95ad30edeb279603d439ceb0ecbcb4d332c391adcb2461fb7b6b5fab26b4f7
09-ar-counterexample.tex adb5f00b3f1734d6ba8363cdaee0ae87ea39dfdb6e442ff4e3827191fb9fb853
D-D-conversion.md       cec105bc0c6abc78b3a1a777639165888e55b7d12296000be07532f1c542ca37
D-E-ar-ingredients.md   e2c5cb35796b34586c918c4c45b256501f4c835108e3c998b235e8c67812d136
```

Repository HEAD at final validation:
`d2da017c41565ae28b2c181da02df87a33ae05e4`.
