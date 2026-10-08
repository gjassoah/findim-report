Model: GPT-6 (exact variant unknown); effort: unknown.

# W4-rest: adversarial verification

Date: 2026-10-08. Scope: report sections 1, 2, 3, 10 and appendices B, C,
against the sources named in `codex/tasks/W4-rest.md`. Only this file is modified.
The launch record in `codex/QUEUE.md` names `gpt-6-astra`, effort `ultra` for
W4-rest; the runtime does not independently expose the exact variant or effort.
The report source and the preprints are read-only. Proposed diffs below are not
applied. Parallel reviewers inspect sections 2–3, section 10, and appendices B–C;
the coordinating reviewer checks the introduction, cross-references, and findings.

Verdicts use `no error found`, `error found`, `gap`, and `unsupported claim`.
These are AI review verdicts, not human certification. New mathematical reasoning
in this audit is labelled AI-proved when complete; finite checks are supported.
An earlier audit's verdict is treated as a lead, not as mathematical evidence.

## Progress

- Repository instructions and task read; pre-existing worktree changes preserved.
- Source checking completed; coverage, source locators, and limitations appear below.
- F8 and F9 are optional precision improvements, not demonstrated mathematical errors.

## Findings recorded during the first pass

### F1. The quoted size belongs to a different algebra — error found

Locations: `01-introduction.tex:80–83`; `10-obstructions.tex:4–7`.
The cited `09-ar-counterexample.tex:759–778` computes
`dim Λ = 1600 + 159999^5 · 1623889344 ≈ 1.7·10^35` for the **eight-simple**
triangular algebra. The nine-simple algebra in `coro:ar-findim` is
`End_Λ(Λ ⊕ Z')`. Neither its dimension nor the dimension of the chosen
indecomposable summand `Z'` is supplied. The dossier C-2 §8.8 likewise labels
the numerical dimension as that of Λ. The stated dimension of the nine-simple
algebra is unsupported; it does not follow by transferring the number for Λ.

```diff
--- a/report/sections/01-introduction.tex
+++ b/report/sections/01-introduction.tex
@@ -81,3 +81,4 @@
 infinite little finitistic dimension with nine simple modules
-(\Cref{coro:ar-findim}), of dimension of the order of $10^{35}$
-(\Cref{rem:ar-sizes}).
+(\Cref{coro:ar-findim}). The triangular algebra used to obtain it has
+eight simple modules and dimension of the order of $10^{35}$
+(\Cref{rem:ar-sizes}).
--- a/report/sections/10-obstructions.tex
+++ b/report/sections/10-obstructions.tex
@@ -4,3 +4,4 @@
-The algebra of \Cref{coro:ar-findim} has nine simple modules, but its dimension
-is of the order of $10^{35}$ (\Cref{rem:ar-sizes}). Most of this size comes
+The algebra of \Cref{coro:ar-findim} has nine simple modules. The triangular
+algebra used to obtain it has eight simple modules and dimension of the order
+of $10^{35}$ (\Cref{rem:ar-sizes}). Most of this size comes
 from the tensor square $E=T\otimes T$ and from the bimodule cosyzygies
```

### F2. The one-factor obstruction is not connected to its hypothesis — gap

Locations: `10-obstructions.tex:90–100`, affecting its opening `8–12` and
`01-introduction.tex:98–103`. Proposition `prop:one-factor` assumes
`w[-1] β₀ = 0`. The following paragraph explicitly declines to establish the
equivalence with the Toda bracket used to justify that hypothesis. Theorem
`thm:tate-obstruction` consequently does not, as written, complete the universal
failure claim. The finite computations cannot replace this missing implication.

There is a short direct repair (AI-proved here, checked independently by the
coordinating reviewer and the section-10 reviewer). Tate duality makes
`H^{-4} → H^{-1}`, `γ ↦ γτ`, surjective because τ is nonzero and `H^{-1}=k`.
Choose `β₀=γτ`. The groups `U^*` are a graded right `H^*`-module by
precomposition. For `w∈U^1`, the product `wγ` lies in `U^{-3}=0`, hence
`wβ₀=(wγ)τ=0`. In explicit shifted maps:
`β₀=γ[3]∘τ` and `w[-1]∘β₀=(w[-4]∘γ)[3]∘τ=0`.
This argument needs no convention comparison for Toda brackets.

```diff
--- a/report/sections/10-obstructions.tex
+++ b/report/sections/10-obstructions.tex
@@ -90,11 +90,10 @@
-The composite $w[-1]\circ\beta_0$, for $w\in U^1$ with $\pi[1]w$ a nonzero
-multiple of $\beta_0$, is a secondary composition: $\pi\circ w[-1]\circ\beta_0$
-is a multiple of $\beta_0^2=0$, so $w[-1]\circ\beta_0$ lies in the image of $i$,
-that is, in $H^0$. Compositions of this form, computed through the cone of the
-first map, describe the Toda brackets $\langle\tau,\beta_0,\beta_0\rangle$ in
-one of the standard equivalent formulations of Toda brackets. We do not prove
-the equivalence of this formulation with the definition of
-\Cref{subsec:toda} here, so the following theorem explains, but does not by
-itself prove, the vanishing hypothesis of \Cref{prop:one-factor}; the
-computations of \Cref{subsec:obstruction-computations} confirm the failure in
-the cases tested.
+The vanishing hypothesis of \Cref{prop:one-factor} always holds in this
+situation. Indeed, since $\tau\neq0$, Tate duality and compatibility with
+composition give $\gamma\in H^{-4}$ with $\gamma\tau=\beta_0$.
+The groups $U^*$ form a graded right $H^*$-module by precomposition.
+For $w\in U^1$ we have $w\gamma\in U^{-3}=0$ by
+\Cref{prop:one-cone}, so $w\beta_0=(w\gamma)\tau=0$.
+Thus \Cref{prop:one-factor} applies to every such fibre triangle.
+The following theorem gives a related vanishing statement for Toda brackets;
+the computations of \Cref{subsec:obstruction-computations} also test the
+one-factor failure directly.
```

This is a proposed addition to the mathematics, not an applied correction.
To avoid retaining the unestablished identification even after that repair,
the introduction's final obstruction sentence should cite the direct vanishing:

```diff
--- a/report/sections/01-introduction.tex
+++ b/report/sections/01-introduction.tex
@@ -100,4 +100,6 @@
-(\Cref{prop:one-factor}), and the secondary compositions that would rescue it
-are of a kind that vanishes for every simple module with polynomial Ext algebra
-on a generator of degree three over a symmetric algebra, by Tate duality
-(\Cref{thm:tate-obstruction}). Whether a counterexample with a small explicit
+(\Cref{prop:one-factor} and the argument following it). Tate duality also
+forces $\langle\tau,\beta,\beta\rangle=\{0\}$ for a nonprojective simple
+module over a symmetric algebra, with endomorphism ring $\kk$ and
+with self-extensions vanishing in
+degrees $1$, $2$ and $4$ (\Cref{thm:tate-obstruction}).
+Whether a counterexample with a small explicit
```

The same separation of the direct obstruction and the related Toda statement is
proposed in `10:9–12`; it is covered in the final consolidated findings below.

### F2 (continued). Opening formulation after the direct repair

The opening of section 10 should likewise distinguish the directly checked
compositions from the related Toda brackets; no equivalence of their definitions
has been supplied in the report.

```diff
--- a/report/sections/10-obstructions.tex
+++ b/report/sections/10-obstructions.tex
@@ -8,6 +8,5 @@
 construction over $T$ itself, with a single cone, fails in degree zero
-(\Cref{prop:one-factor}), and the secondary compositions that would have to be
-nonzero to avoid this failure vanish in Tate cohomology for every symmetric
-algebra and simple module with polynomial Ext algebra on a generator of degree
-three (\Cref{thm:tate-obstruction}). Computations supporting this picture are
+(\Cref{prop:one-factor} and the argument following it). Tate duality also
+gives a related vanishing statement for Toda brackets
+(\Cref{thm:tate-obstruction}). Computations supporting this picture are
 recorded at the end of the section.
```

### F3. The introduction strengthens or outruns the body — unsupported claims

Locations: 01:16–23, 31, 53–55, 63–64.
The cited body statement gives global dimension at most two
(prop:encoding-algebra), while the introduction twice states equality.
For the unbounded-extinction example equality can also be recovered from its
nonzero quadratic relations; it is not a counterexample to that specific
construction. The proposed bound wording matches exactly the result cited and
does not require an additional argument. The localisation exclusion is specifically
for universal localisations of finite-dimensional hereditary algebras
(coro:rank-obstruction), not an unspecified class of hereditary localisations.
The assertion that the article proves every step and that all proofs have already
been checked also outruns the expressly missing one-factor implication (F2),
the unfinished computational appendix (F10), and the pending W4 checks in
Appendix B. This is a diagnosis of the current draft; it is not an independent
claim that all the other sections' proofs are incomplete.

```diff
--- a/report/sections/01-introduction.tex
+++ b/report/sections/01-introduction.tex
@@ -15,4 +15,4 @@
 
-This article reconstructs both constructions in a common framework, proves
-every step, and isolates the mechanisms on which they rest. It is not a
+This article reconstructs both constructions in a common framework and
+isolates the mechanisms on which they rest. It is not a
 rewrite of the preprints: the arguments are reorganised around a small number
@@ -20,4 +20,4 @@
 article adds criteria and obstructions that explain why the constructions take
-the form they do. All proofs were written and checked by AI models, as
-described in \Cref{app:verification,app:ai-declaration}; the article has not
+the form they do. AI models wrote the proofs; completed and pending checks
+are described in \Cref{app:verification,app:ai-declaration}. The article has not
 been peer reviewed.
@@ -30,3 +30,3 @@
 (\Cref{def:selection-data}). A bounded complex $P$ of bimodules over a
-finite-dimensional algebra $B$ of global dimension two realises $H$, in the
+finite-dimensional algebra $B$ of global dimension at most two realises $H$, in the
 sense that $P\Lotimes[B]M(Y)\cong M(HY)\oplus M(HY)[3]$ for a fully faithful
@@ -52,4 +52,5 @@
 functions on finite-dimensional modules must span an infinite-dimensional space
-(\Cref{prop:rank-obstruction}), which excludes finite-dimensional, commutative
-noetherian and hereditary-localisation algebras
+(\Cref{prop:rank-obstruction}), which excludes finite-dimensional algebras,
+commutative noetherian algebras and universal localisations of
+finite-dimensional hereditary algebras
 (\Cref{coro:rank-obstruction}). The realisation is the only step that is not
@@ -63,3 +64,3 @@
 the realisation lies in an $\operatorname{Ext}^4$ over an algebra of global
-dimension two (\Cref{rem:why-three}).
+dimension at most two (\Cref{rem:why-three}).
 
```

### F4. The gluing slogan asserts more than the proposition — unsupported claim

Location: 03:254–255. In the nonzero-Z branch, prop:triangular produces
unbounded finite projective dimensions over B from a bounded-above complex.
It does not produce a nonzero B-module killed by RHom(-,B). Infinite
finitistic dimension is not identified with strong Nakayama failure anywhere in
this argument. Thus the claim that failure cannot arise from pieces "without it"
is stronger than what is established. No counterexample to that stronger
sentence is asserted here. The following contrapositive matches the proposition.

```diff
--- a/report/sections/03-criteria.tex
+++ b/report/sections/03-criteria.tex
@@ -253,4 +253,4 @@
 
-Triangular matrix algebras cannot produce strong Nakayama failure from pieces
-without it.
+Triangular matrix algebras cannot produce strong Nakayama failure when both
+diagonal algebras have finite little finitistic dimension.
 
```

### F5. Two local proof errors in section 3 — error found

Locations: 03:233–235 and 271. The injective I^j was a sum of modules D(Ae_t),
with multiplicities, so I^j f is the corresponding sum of D(Be_t), not one
summand. Also j_! is left adjoint to (-)f, Y=Ef, and j_!Y -> E is its counit,
not its unit. Both underlying arguments survive these corrections.

```diff
--- a/report/sections/03-criteria.tex
+++ b/report/sections/03-criteria.tex
@@ -233,4 +233,4 @@
   so each $I^j$ is a sum of modules $D(Ae_t)$ with $e_t\leq f$. Then
-  $I^jf=D(Be_t)$ is an injective right $B$-module and, by the first part of the
-  proof applied to $V=I^j$, the complex
+  $I^jf$ is a sum of modules $D(Be_t)$, hence an injective right $B$-module.
+  By the first part of the proof applied to $V=I^j$, the complex
   $\Hom[B^{\op}]{Af}{I^\bullet f}\cong\Hom[A^{\op}]{A}{I^\bullet}$ computes
@@ -270,3 +270,3 @@
   Let $e=\operatorname{diag}(1,0)$ and $f=\operatorname{diag}(0,1)$, let $i_*$
-  inflate right $B$-modules and put $j_!Y=Y\Lotimes[C]fA$. The derived unit gives
+  inflate right $B$-modules and put $j_!Y=Y\Lotimes[C]fA$. The derived counit gives
   a triangle $j_!Y\to E\to i_*Z\to(j_!Y)[1]$. Since $eA=i_*B$, adjunction gives
```

### F6. Scope of the Lean strong-Nakayama formalisation — unsupported claim / gap

Locations: 03:81–85; A2:64–70 (refreshed snapshot).
StrongNakayama.lean explicitly excludes the comparison between Ext vanishing
and dual exactness (lines 18–20). Its hypotheses (45–48, 69–71) impose dual
exactness and a nontrivial surjective augmentation killing d_0, not exactness
of the original sequence. Its final declarations give finite generation and
exact projective dimensions for n >= 1. They do not identify the cokernels
with transposes of syzygies. Thus "The proof" of the whole informal theorem is
too broad. The Ext equivalence in A2 requires that the original sequence be
a projective resolution of E; it is not an equivalence for an arbitrary family
having only the stated augmentation. The general-ring Lean implication itself
has no error found.

```diff
--- a/report/sections/03-criteria.tex
+++ b/report/sections/03-criteria.tex
@@ -81,4 +81,4 @@
 \begin{remark}
-  The proof of \Cref{thm:strong-nakayama} is formally verified in Lean over an
-  arbitrary ring, with the exactness of the dual complex as the hypothesis in
+  The projective-dimension conclusion of \Cref{thm:strong-nakayama} is formally
+  verified in Lean over an arbitrary ring, with dual exactness as the hypothesis in
   place of the vanishing of $\operatorname{Ext}$; see \Cref{app:verification}.
```

```diff
--- a/report/sections/A2-verification.tex
+++ b/report/sections/A2-verification.tex
@@ -67,5 +67,7 @@
     map, the cokernels of the dual complex are finitely generated left modules
-    of projective dimension exactly~$n$. The hypothesis on the vanishing of
-    $\operatorname{Ext}^i_{A^{\op}}(E,A)$ is replaced by the exactness of the
-    dual complex, which it is equivalent to.
+    of projective dimension exactly~$n$ for every $n\geq1$. For a projective
+    resolution of $E$, the vanishing of
+    $\operatorname{Ext}^i_{A^{\op}}(E,A)$ for all $i\geq0$ is equivalent to
+    exactness of the dual complex; this equivalence is not formalised.
+    The formal statement assumes dual exactness directly.
 \end{enumerate}
```

### F7. The first two-factor cone does not have the one-factor profile — error found

Location: 10:50–53.
The proof of prop:two-cone-profile, 09:494–499, gives one-dimensional
U^{3m} and U^{1-3m} for every m >= 0 after the first cone. In contrast,
prop:one-cone has support exactly {0,1}. The second cone removes the two
infinite tails; it is not merely moving one class in an otherwise identical
two-dimensional profile.

```diff
--- a/report/sections/10-obstructions.tex
+++ b/report/sections/10-obstructions.tex
@@ -49,5 +49,6 @@
 
-In the two-factor construction of \Cref{sec:ar-route}, the profile of the
-first cone has the same shape, and the second cone, taken in the other tensor
-factor, moves the class in degree one to degree three
+In the two-factor construction of \Cref{sec:ar-route}, the first cone has
+one-dimensional groups in degrees $3m$ and $1-3m$ for $m\geq0$.
+After the second cone, taken in the other tensor factor, only the groups in
+degrees zero and three remain
 (\Cref{prop:two-cone-profile}). With a single cone the two nonzero degrees are
```

### F8. Zero-beta normalisation — no error found; optional clarification

Location: 10:128–130. The theorem quantifies over all beta. The argument
works if "rescaling" includes multiplication by zero, as it may; thus this is
not counted as a demonstrated error. Audit/12 §2 explicitly separates the zero
case. The following optional clarification instead uses surjectivity and removes
any ambiguity about beta=0. The substantive Tate-duality argument has no error
found.

```diff
--- a/report/sections/10-obstructions.tex
+++ b/report/sections/10-obstructions.tex
@@ -127,5 +127,6 @@
   $\tau\neq0$, the nondegenerate pairing of \Cref{thm:tate-duality}, which is
-  compatible with composition, gives $\gamma\in H^{-4}$ with $\gamma\tau\neq0$
-  in the one-dimensional space $H^{-1}$; rescaling $\gamma$ we may assume
-  $\gamma\tau=\beta$. The bracket $\langle\tau,\beta,\gamma\rangle$ is defined,
+  compatible with composition, makes the map $H^{-4}\to H^{-1}$,
+  $\gamma\mapsto\gamma\tau$, nonzero and hence surjective. Choose
+  $\gamma\in H^{-4}$ with $\gamma\tau=\beta$.
+  The bracket $\langle\tau,\beta,\gamma\rangle$ is defined,
   since $\beta\gamma\in H^{-5}=0$, and it lies in $H^{-3}=0$. By
```

### F9. Corollary ambient hypotheses — no error found under inherited setting

Location: 10:140–145. The opening "In this subsection" hypotheses at 18–21
end before the new subsection at 102. The corollary does not specify A or s.
Under the usual reading that the corollary retains the symmetric/simple setting
of the preceding theorem, no mathematical error is found. State that setting
explicitly to avoid an unqualified assertion using Tate groups not defined
in the report for arbitrary A. Do not import every hypothesis of the preceding
theorem: p=4 is allowed here and gives nonzero Ext^4.

```diff
--- a/report/sections/10-obstructions.tex
+++ b/report/sections/10-obstructions.tex
@@ -141,2 +141,3 @@
   \label{coro:tate-obstruction}
+  Let $A$ be a finite-dimensional symmetric algebra and $s$ a simple $A$-module.
   If $\operatorname{End}_A(s)=\kk$ and $\operatorname{Ext}^*_A(s,s)=\kk[\tau]$
```

### F10. Computational documentation and field scope — gap

Locations: 10:186–188 and 206–208; introduction 115.
The numerical assertions in 10:190–205 match audits 06 and 08: dimensions,
sample counts, finite fields, exact rational-function field, and degree ranges.
But app:computations is currently only a CHECK placeholder, so the claim that
scripts and parameters are described there is false for this snapshot.
Item 3 also omits its field, F_{2^16}. Audit/12 §3 states that for the
40-dimensional attempt, degrees 2–12 use the checked tensor-product formula,
whereas only degrees 0–1 are obtained from direct minimal covers.
These are record/source comparisons, not new executions of the computations.
The repair leaves the appendix explicitly unfinished rather than modifying it.

```diff
--- a/report/sections/10-obstructions.tex
+++ b/report/sections/10-obstructions.tex
@@ -185,5 +185,6 @@
 
-The following computations, described with their scripts and parameters in
-\Cref{app:computations}, test the one-factor shape directly. They are finite
-computations with the stated scope, not proofs in all degrees.
+The following finite computations test the one-factor shape directly, with
+the stated scope, and do not give proofs in all degrees.
+\CHECK{Add the scripts, parameters and output locators to
+  \Cref{app:computations}.}
 \begin{enumerate}
@@ -207,3 +208,5 @@
     and $40$ fail earlier: the relevant simple modules do not have polynomial
-    Ext algebras, as computed up to degree twelve.
+    Ext algebras; their Ext profiles were computed over
+    $\mathbb{F}_{2^{16}}$ through degree twelve, using a tensor-product
+    calculation in degrees $2$--$12$ for the $40$-dimensional example.
 \end{enumerate}
```

```diff
--- a/report/sections/01-introduction.tex
+++ b/report/sections/01-introduction.tex
@@ -114,3 +114,3 @@
 and \Cref{sec:obstructions} discusses obstructions to smaller constructions.
-\Cref{app:computations} describes the computations used,
+\Cref{app:computations} will describe the computations used,
 \Cref{app:verification} the verification and formalisation record,
```

### F11. Verification-history claims do not match the record — error found

Locations: A2:11–20, 27–28, 41–43 (refreshed snapshot).
The frozen inputs did not completely remove earlier assessments:
scratch/V-C-frozen.md:903–905 retains a no-error/no-gap verdict, and
scratch/V-D-frozen.md:13,658–659 retains status and no-gap language.
The verifiers were instructed to treat such assessments as leads, which is
different from never receiving them. Also, some W4 checks are still marked CHECK.

The V-C1 verdict table (audit/V-C1-codex.md:26–34) records gaps in five
blocks (2.2, 3.3, 3.5, 3.6, 4.3), two of which also contain errors.
"Two errors and three gaps" can be read as a shorthand partition, but does
not accurately give the total gap coverage. The proposed wording makes the
overlap explicit.

For obstruction sources, codex/QUEUE.md:26 records the weight job 11 at
medium effort; job 12 was max (:27), while computational jobs 06/08 were high.
The uniform max attribution is wrong. V-C23 also reports computational-input
and design-reduction gaps, not only two corrected readings
(audit/V-C23-codex.md:27,31,33). The table should not imply that the computations
or the general design reduction were verified by that job.

```diff
--- a/report/sections/A2-verification.tex
+++ b/report/sections/A2-verification.tex
@@ -13,5 +13,6 @@
 the note was then checked by a fresh session of GPT-6 Astra that had not seen
-the note being written and was given the statements and proofs without any
-earlier verdicts, statuses or audit reports. Each drafted section was checked
-again, by another fresh session, against its note and its sources. The
+the note being written and was instructed not to use earlier verdicts,
+statuses or audit reports as evidence. Each drafted section was submitted
+to another fresh session for checking against its note and its sources;
+pending checks are marked below. The
 following table lists, for each part of the article, the author of the proof
@@ -26,4 +27,4 @@
   \hline
-  \Cref{sec:criteria}&Claude Opus~5.5&GPT-6 Astra (max): two errors and three
-    gaps, repaired&\CHECK{W4 of sections 2, 3 and 10}\\
+  \Cref{sec:criteria}&Claude Opus~5.5&GPT-6 Astra (max): two errors and gaps
+    in five blocks, repaired&\CHECK{W4 of sections 2, 3 and 10}\\
   \Cref{sec:extinction,sec:simulation}&GPT-6 Astra (max)&GPT-6 Astra (ultra):
@@ -40,4 +41,5 @@
     steps restored from the note, one definition completed, wording repairs\\
-  \Cref{sec:obstructions}&Claude Opus~5.5, from proofs by GPT-6 Astra (max)&
-    GPT-6 Astra (max): two readings corrected&\CHECK{W4 of sections 2, 3
+  \Cref{sec:obstructions}&Claude Opus~5.5, from proofs by GPT-6 Astra (medium--max)&
+    GPT-6 Astra (max): two readings corrected; computational inputs and the
+    one-factor reduction not verified there&\CHECK{W4 of sections 2, 3
     and 10}\\
```

### F12. Lean authorship and correspondence-review attribution — error found / unsupported claim

Location: A2:72–74 (refreshed snapshot).
The formalisation README:78 explicitly attributes both the stage-1 statements
and their proofs to Claude Opus 5.5; root PROGRESS.md:40 agrees. Thus not all
proofs were written by GPT-6 Astra. Stage 2 was implemented by Codex from
Claude's specification. The implementation audit and formalisation README:81–83
record a same-model correspondence/readability review with a Claude review then
pending; the later LEDGER.md:30 reports that Claude reviewed stage-2 statements.
This supports that later review, not the assertion that each formal statement
in both stages was reviewed by the model that did not write it. No distinct-model
stage-1 correspondence-review receipt was located. The proposed wording reports
the documented division without treating the design's planned split as evidence
of a completed review.

```diff
--- a/report/sections/A2-verification.tex
+++ b/report/sections/A2-verification.tex
@@ -71,5 +71,6 @@
 \end{enumerate}
-The statements were written by Claude Opus~5.5 and the proofs by GPT-6 Astra,
-and each formal statement was compared with its informal counterpart by the
-model that did not write it. Acceptance required five checks: a scan of the
+The first formalisation was written by Claude Opus~5.5, including its proof.
+The second was implemented by GPT-6 Astra from Claude's specification;
+the record reports a subsequent review of its statements by Claude.
+Acceptance required five checks: a scan of the
 sources for placeholders and new axioms, a build with warnings treated as
```

## Block coverage

Line numbers in this table refer to the final refreshed source snapshot.
A statement and its proof are one block where listed together. "No error found"
records the specified check, not a general certification. Findings F8 and F9
are optional clarifications and are not counted as errors in their blocks.

### Introduction

| Lines / claim | Verdict and source comparison |
|---|---|
| 4–8: definition and Bass attribution | No error found. Definition agrees with section 2. ZHui95, arXiv:1407.2383v1 §2, p.3, attributes the questions to Bass's 1960 problems. Bas60 itself was not reread. |
| 8–14: the two releases, fields, AR consequence | No error found against build/paper.tex, build/sections/01-introduction.tex, .cache/ar-src/main.tex and 01-introduction.tex, Theorem 1.1, and the sided implication in thm:ar-to-findim. |
| 16–23: scope and completed checks | Unsupported completion claims: F3, read with F2, F10 and F11. The AI authorship/no-human-review description agrees with the project record. |
| 27–38: three-layer mechanism | No error found in the tensor formula, fully faithful M, simulation or order of constructions. Use the stated global-dimension bound: F3. References point to the intended definition, realisation theorem, simulation and extinction corollary. |
| 40–45: unnumbered main theorem | No error found. Same field, finite-presentation hypothesis, fixed algebra and unbounded-extinction implication as thm:main. |
| 47–50: central involutions and selection | No error found against prop:central-involutions, prop:shift-automorphism, coro:z-independent and thm:selection-unbounded. The independence assertion uses the finite quotients, not merely centrality. |
| 51–55: numerical obstruction and exclusions | Rank-function necessity agrees with prop:rank-obstruction; the localisation class needs the explicit scope in F3. |
| 55–64: existential length, simple count, odd double, shift three | No error found in the claimed lack of a bound in this argument, the count 3(l+2), or the Ext^4 splitting mechanism. The text does not claim no algorithm can exist. Global-dimension bound wording: F3. |
| 68–75: conversion theorem summary | No error found. Arbitrary field, symmetric E, both projectivity sides, stable v, all positive degrees and degree-zero kernel/surjectivity match thm:conversion. |
| 75–80: C, T, polynomial Ext, tensor square, cones/twists | No error found against the current section 9 statements and its aperiodicity paragraph (09:130–136). |
| 80–83: nine simples and dimension | Error found: F1 assigns the intermediate algebra's size to the final algebra. |
| 87–89: search did not produce a hand-verifiable counterexample | No conflicting claim in the supplied research/audit record. Read as a report of this search, not a nonexistence theorem. |
| 90–94: strong Nakayama and simple witnesses | No error found against thm:strong-nakayama and prop:simple-witness, including opposite-side conventions. Projective dimension zero is supplied by projectives; the constructed cokernels have n >= 1. |
| 94–98: bounded dimensions and extinction | No error found. The extra finite-global-dimension/trivial-extension scope is stated and matches prop:bounded-extinction. |
| 98–104: one-cone failure and bracket interpretation | Gap/unsupported deduction in the written draft: F2. No nonexistence conclusion about all small constructions follows or is asserted. |
| 108–118: roadmap and appendix descriptions | Section labels point to the intended sections. The description of the unfinished computation appendix is premature: F10. |

### Section 2

| Lines / block | Verdict |
|---|---|
| 4–19: conventions | No error found; matches report/main.tex and audit/report-notation.md. |
| 21–30: finitistic dimensions, history and sides | No error found. Left/right difference supported by Hap90 p.2; historical qualification as in the introduction row. |
| 35–46: stable category, suspension and Tate notation | No error found. |
| 48–57: thm:tate-duality | No error found; source hypotheses and locator checked. |
| 59–67: pairing and composition | No error found; Lin12a (2.2), (2.8) support the order and sign. |
| 72–88: Toda definition, existence, indeterminacy and degree | No error found. Exactness supplies the defining systems; the mixed variation term is zero since qi=0. |
| 90–102: lemma:toda-juggling and proof | No error found; precomposition is u[1] exactly as stated. |
| 107–113: trivial extensions and inflation | No error found. |
| 115–123: symmetry of C ⋉ DC | No error found; both dual actions, trace identity and nondegeneracy checked directly. |

### Section 3

| Lines / block | Verdict |
|---|---|
| 4–8: introductory interpretation | No error found. |
| 10–33: prop:coresolution and proof | No error found; induction starts at pd c_1=1, and the dimension-shift target exists for each n >= 1. |
| 35–38: Lean coresolution remark | No error found; the formal statement actually needs no enough-projectives assumption. |
| 43–47: classical strong-Nakayama mechanism | No error found against CB19 §3.2, Proposition 5. |
| 49–74: thm:strong-nakayama and proof | No error found; sided dualisation, nonzero first cokernel obstruction, indices and minimal-transpose identification checked. |
| 76–79: derived Nakayama interpretation, infinite pd E | No error found. |
| 81–85: Lean strong-Nakayama remark | Unsupported full-proof scope: F6. |
| 87–88: reading the condition on C_1 | No error found. |
| 90–120: prop:infinitely-torsionfree and proof, all three conditions | No error found; no-projective-summand hypothesis supplies Tr Tr C = C, and the approximation property supplies exact dual tails in both directions. |
| 122–134: coro:infinitely-many-torsionless and proof | No error found; use unbounded projective dimensions, not merely unbounded dimensions. |
| 139–145: AR conjecture and classical implication | No error found against AR75a, Theorem 1.1(b). |
| 147–187: thm:ar-to-findim and proof | No error found; nonzero S, approximation resolution, acyclic Hom(-,G) computation and final opposite algebra checked. |
| 189–192: indecomposable replacement and simple count | No error found. |
| 194–196: corner interpretation and right-module exception | No error found. |
| 198–213: prop:simple-witness statement | No error found. |
| 215–239: prop:simple-witness proof | Error found in the displayed single-injective equality: F5. The double-centraliser and higher-Ext arguments otherwise check. |
| 241–249: three-vertex example | No error found; dual complex has image ka and gives Ext^2 = Ae_1/ka. The corner has a nonprojective right simple with nonzero Ext^1 into B. |
| 254–255: gluing interpretation | Unsupported claim: F4. |
| 257–283: prop:triangular and proof | Wrong adjunction name: F5. No further error found in the derived triangle, both cases, or bounded-above minimal-complex argument. |
| 285–290: openness attribution and field scope | No error found; cited sources have algebraically closed base, and the report supplies its arbitrary-field argument. |
| 292–314: prop:bounded-dimension and proof | No error found; Tor criterion, fixed free terms, polynomial ranks and ascending-chain condition on opens checked. |
| 316–321: transpose bound, syzygy growth, Schulz | No error found; a projective cover of a syzygy is a summand of A^r with r <= dim ΩN <= dim A dim N, giving the stated transpose bound. Schu95 Example 7 is the relevant family. |

### Section 10

| Lines / block | Verdict |
|---|---|
| 4–13: opening interpretation and size | Error found / gap: F1 and F2. |
| 18–26: one-factor setting and Tate groups | No error found, including the negative multiplication range m >= 1. |
| 28–48: prop:one-cone and proof | No error found; the unique cokernel is at a=0, the unique kernel at a=1. |
| 50–55: first-cone comparison | Error found: F7. |
| 57–88: prop:one-factor and proof | No error found as a conditional statement. dim V^0=2, image δ^0 <= 1, and its cokernel injects into Ext^1. |
| 90–100: identification with secondary compositions | Gap in the deduction claimed elsewhere: F2; direct repair supplied. |
| 105–138: thm:tate-obstruction and proof | No error found under scalar multiplication including zero; optional explicit zero-case repair F8. All required products, vanishings, indeterminacy and graded shifts checked. |
| 140–151: coro:tate-obstruction and proof | No error found in the inherited symmetric/simple setting; optional scope clarification F9. For p>3, the bracket is defined since H^{p-1}=H^{-2}=0 and its target H^{p-3} vanishes. |
| 153–163: tensor-square interpretation and limits | No error found. The tensor-square simple still satisfies the theorem; the two-cone construction uses the different profile. |
| 165–181: rem:weights | No error found against audit/11 §§1–4: inverse-twist weight is the internal degree; tau has degree -1 and beta_0 degree +1. The integer-grading proof works over finite fields too. The six-dimensional control is periodic, not polynomial. |
| 186–188: evidence description | Gap: F10, missing computational appendix. |
| 190–198: no-cone test bed | No error found in recorded dimensions, fields, samples, cutoffs or nonprojectivity; audit/06. |
| 199–205: one-factor candidate | No error found in recorded F, Λ, Z dimensions, Ext lists, rank, field or two-sample scope; audit/08. |
| 206–208: three other attempts | Numerical/source match; field and method scope incomplete: F10, audit/12 §3. |

### Appendices B and C

| Lines / block | Verdict |
|---|---|
| A2:4–7: nature of checks | No error found as a description of AI versus proof-assistant checks; completion scope qualified by F11. |
| A2:11–20: fresh-context process | Error found / unsupported completed-scope claim: F11. |
| A2:27–28: criteria verification entry | Record wording undercounts gap-bearing blocks: F11. |
| A2:29–40: remaining construction entries | No error found against queue launch records and the named audits, including the W4-0809 updates received during this review. |
| A2:41–43: obstruction entry | Error found in effort attribution; verification scope incomplete: F11. |
| A2:47–53: previous repairs/withdrawals | No error found against LEDGER.md and the cited review record. |
| A2:57–63: versions, axioms and coresolution formalisation | No error found against toolchain, manifest, actual Coresolution.lean and saved gates. |
| A2:64–70: strong-Nakayama formalisation | Scope gap: F6. The directly assumed exactness implication itself matches the Lean declaration. |
| A2:72–74: Lean authorship and independent correspondence reviews | Error found / unsupported claim: F12. |
| A2:74–78: five acceptance checks | No error found in the description of saved checks. No new build/replay performed by this audit. |
| A2:79–80: W6 | Explicit unresolved marker; not evidence of a completed feasibility evaluation. |
| A3:4–13: companion theorem and consequences | No error found as a description of the preprint's assertions, not verification of that theorem. |
| A3:15–18: AR-to-findim application/simple count | No error found; the report's construction gives End(A ⊕ M), without op. |
| A3:19–26: simple Γ witness, Γ^op consequence and dominant-dimension route | No error found; the two opposite-sided conclusions are correctly distinguished. |
| A3:26–30: triangular versus symmetric construction | No error found in the comparison with sections 8–9. |

## Source checks and limits

The supplied dossiers were read as leads. The local proofs, sided functors,
exact sequences and graded products were checked independently, including the
zero cases. Source locators read by the reviewers:

- Lin12a: local Library PDF, arXiv:1211.5999v1, §2, (2.1), (2.2), (2.8),
  printed pp.3–6. These give symmetric Tate duality and composition compatibility.
  In the juggling step the degrees (3,-1,-4) use source s[2] and
  u=tau[2]:s[-1]->s[2], hence u[1]=tau[3]; no extra sign appears.
- AR75a: local published PDF, Theorem 1.1(b), p.71 and its proof p.72.
  The theorem page was read visually to resolve the extracted inequality.
- CB19: [official 2019/20 notes](https://www.math.uni-bielefeld.de/~wcrawley/1920noncommalg2/NA2.pdf),
  §3.2, Proposition 5, printed p.63 (PDF page 65); the classical dual-exactness
  argument and its opposite side match. The Library had no local CB19 PDF.
- Hap90: local PDF, p.2 for differing sided invariants; §2.3, p.5 for
  the bounded-dimension argument and Schofield attribution.
- GLS23: local PDF, arXiv:2302.02085v2, §1.4 and Corollary 2.6, p.7;
  field hypotheses and semicontinuity statement match.
- Schu95: [published paper](https://doi.org/10.1017/S1446788700037265),
  Example 7, p.372, for the constant-dimensional parameterised syzygies.
  Adding that locator to the report's existing citation would improve precision,
  but the generic citation is not erroneous.
- ZHui95: [arXiv:1407.2383v1](https://arxiv.org/pdf/1407.2383v1),
  §2, p.3, supports the Bass 1960 historical attribution. Bas60 was not read
  directly; this historical check is through the report's cited survey.
- Main and AR preprints: local September 23, 2026 sources in build/
  and .cache/ar-src/. The corresponding report statements, rather than every
  proof of sections 4–9, were checked for the introduction and applications.
  The broader proofs of those sections are outside this job.
- Companion: .cache/companion-src/sections/introduction.tex:23–35,
  267–285, 305–314 and consequences.tex:185–222. These support the asserted
  symmetric example, left Γ simple witness, dominant dimension and left
  finitistic dimension of Γ. The report's independent criterion instead gives
  left finitistic dimension of Γ^op; Appendix C keeps these statements separate.
- Sch07a and MY20 were not reread in this job: no new external invocation of
  them occurs in the assigned proofs. The introduction's uses were compared to
  the explicit scope of the referenced report results.

Computational claims were compared with audits 06, 08, 11 and 12 and their
recorded fields/ranges; the large computations were not rerun. The ordinary Ext
lists were not promoted beyond their finite scope.

For Lean, the four actual modules Coresolution.lean, Duality.lean,
ExactCoresolution.lean and StrongNakayama.lean were inspected in the separate
formalisation repository. The stage-2 saved source-hash list matches all ten
current source/configuration/listing files. The pin is Lean 4.33.1 and Mathlib
0df444a360eaa60ab8c11dca51a86af692955474. Both recorded stage gates report
zero exits for source scan, build, axiom audit, statement listing and leanchecker.
The stage-2 report contains 95 declarations (61 theorem entries); their axiom
union is exactly {propext, Classical.choice, Quot.sound}. This audit checked the
saved evidence and correspondence, and did not rerun Lean or claim a new replay.

All 115 internal-reference occurrences in the six assigned files resolve to
defined, nonduplicate labels. Semantic misreferences/scope mismatches are
reported in F1, F2, F3, F7 and F10 rather than treated as unresolved labels.

## Snapshot and completion

Initial HEAD: d2da017c41565ae28b2c181da02df87a33ae05e4.
Refreshed HEAD: 4d9fae89f7be6c20adb6d81cb0ad8c3f897ff1e4.
Other work was committed during this review; this job did not commit or modify
those files. Appendix B acquired the W4-0809 results and one extra source line.
That update was reread, and the proposed hunks below/above were rebased by their
actual source text. The other five assigned sources retain their initial hashes.
Referenced section-9 locations were likewise refreshed.

| Assigned source | Final SHA-256 |
|---|---|
| 01-introduction.tex | 3c7ada0c52d9b8b53669ad4d19b4de31424fdfb8385317bd2980a2fb2cccaad7 |
| 02-preliminaries.tex | 41c3810325356f0a7e19f5d20505e9004c7e3c76a520538984641236d1587198 |
| 03-criteria.tex | 22f637110b72d0f9fa0a4de161d42da303a8d258d5a4d132f2dcffcec49dbfff |
| 10-obstructions.tex | f804ecae8c296e315b527ee6e7c5120d8cd9ff5cc45dce8f536492b261d0fc56 |
| A2-verification.tex | 1d39c4cb88063e780411e72535e21450a6ba8ade8f02204e0fbd98eadcc35523 |
| A3-companion.tex | f84e1f9e185332bd139cb3bb6ef3f942dfc57057aa88e1f97d1caebabd6a9a85 |

Only audit/W4-rest-codex.md was written by this job. All report repairs remain
proposals. All 25 proposed diff hunks were checked against the saved source;
their old-side text matches uniquely and their line counts were refreshed.
The definite mathematical-content findings concern scope/inference
and proof wording; no counterexample to the principal criteria or conditional
one-factor proposition was found. The most consequential missing implication
has the direct proposed argument in F2. The core Tate-duality obstruction,
including the report's graded juggling convention, has no error found.
