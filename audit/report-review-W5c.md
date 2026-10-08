Model: unknown; effort: unknown.

# W5c autonomous block review

Scope: `report/sections/08-conversion.tex`, `09-ar-counterexample.tex`,
`10-obstructions.tex`. Research article; existing AI-written manuscript;
no venue-specific style assumed. Review date: 2026-10-08.

The current task authorises only evident slips, typesetting corrections and
genuine grammar/style corrections. Substantive mathematics is proposed, not
applied. No commits. Other sections and `report/main.tex` are read-only for this
job. `paper.pdf`, `build/` and `log/CONVERSATION.md` are untouched.

Original scope snapshots are in `scratch/W5c-original/`. Line anchors below refer
to those snapshots unless a post-edit line is explicitly given. Mathematical
assessments are AI assessments, never human certification; clean means no
finding in this review, not a claim that an earlier audit supplies evidence.

Baseline Git revision: `9971fba395d8f560400240f2b235ac06277b83e5`.
Baseline SHA-256 (in scope):

- 08: `d487913a95d9c5424c249871975a0ebdd833392998ca1cce83dd5f234caac8a3`
- 09: `ea17c30a964b6a26fe97d99c88dd3cf9706bd6e91f97d48e3c3311d58f0cfc54`
- 10: `4cd3d0d98fe9dc4c19481833e4c0581ae00db976e236661ea6940fe12abc2f11`

State: complete. Instruction files and every `report/sections/*.tex` were
read in full. All 96 blocks below were checked, including cross-references,
side and shift conventions, proof endpoints, and the cited primary-source
locators. An initial document-wide recurring-grammar sweep found no reason
for blanket changes. The manuscript's consistent closed forms (`nonzero`,
`nonprojective`, etc.) are retained under the style file's existing-conventions
precedence. Independent agents checked Sections 9 and 10; their findings were
leads, and the root reviewer checked the decisive arguments and records.

Mathematical status: the checked general arguments are **AI-proved**, subject
to the four explicit proposals below; exact finite certificates and historical
computations have their stated **supported** scope. These statuses are AI
assessments, not human certification. Three grammar corrections and five local
typesetting corrections were applied; no mathematical proposal was applied.

## Block coverage

| Block | Stable anchor (file:lines; first words) | Status | Decision / reason |
|---|---|---|---|
| 8.01 | `08-conversion.tex:1–16`, “The Auslander–Reiten conjecture” | clean | Opening and dependency on the endomorphism-algebra criterion. |
| 8.02 | `08-conversion.tex:18–28`, “Let A be a finite-dimensional algebra” | clean | Hom differential and shift convention. |
| 8.03 | `08-conversion.tex:29–44`, “For an exact complex” | clean | Cokernel sequences and complete-resolution definitions. |
| 8.04 | `08-conversion.tex:46–61`, “Let P be a totally acyclic complex” | clean | Lemma statement, including arbitrary integer shifts. |
| 8.05 | `08-conversion.tex:63–69`, “Let epsilon_n” | clean | Extension property into projectives. |
| 8.06 | `08-conversion.tex:71–79`, “A chain map” | clean | Lifting in both directions. |
| 8.07 | `08-conversion.tex:81–97`, “If f=d_W h+h d_P” | clean | Both homotopy recursions; no convergence issue for products. |
| 8.08 | `08-conversion.tex:99–110`, “The case of general a” | clean | Shift identifications and positive Ext. |
| 8.09 | `08-conversion.tex:112–135`, “Now let E” | clean | Symmetry, complete resolutions and the bimodule functor. |
| 8.10 | `08-conversion.tex:137–155`, “For E and F as above” | clean | Left triples, multiplication and the two exact functors. |
| 8.11 | `08-conversion.tex:157–175`, “In the situation above” | clean | All three clauses of the triangular lemma. |
| 8.12 | `08-conversion.tex:177–183`, “A morphism L_1 M” | clean | All four Hom identifications. |
| 8.13 | `08-conversion.tex:185–188`, “The first column” | clean | Projective summands and the first component. |
| 8.14 | `08-conversion.tex:190–197`, “The terms are finitely generated” | clean | Dual complexes and total acyclicity. |
| 8.15 | `08-conversion.tex:199–230`, “Let E be a finite-dimensional symmetric algebra” | corrected | T1: split an overwide display; hypotheses, quotient and maps unchanged. |
| 8.16 | `08-conversion.tex:232–250`, “The complete resolution” | clean | Cone and total acyclicity. |
| 8.17 | `08-conversion.tex:252–264`, “Its cokernel” | clean | Quotient sign changed by `(t,q) -> (t,-q)`; structure map preserved. |
| 8.18 | `08-conversion.tex:266–288`, “The endomorphism complex” | corrected | T2: display the long differential formula to remove overflow; signs checked. |
| 8.19 | `08-conversion.tex:289–310`, “Hence partial(g,j,h)” | clean | Connecting map and degrees 1 and at least 2. |
| 8.20 | `08-conversion.tex:312–315`, “Nonprojectivity” | clean | Nonzero stable endomorphism space and first component. |
| 8.21 | `08-conversion.tex:317–334`, “The proof uses of the symmetry” | corrected | A1: grammatical complement of “uses”; mathematics unchanged. |
| 9.01 | `09-ar-counterexample.tex:1–24`, “This section constructs the data” | clean | Setting, field, signs and roadmap. |
| 9.02 | `09-ar-counterexample.tex:26–43`, “Let C be the k-algebra” | clean | Full multiplication table, corners and simples. |
| 9.03 | `09-ar-counterexample.tex:45–50`, “The algebra C is associative” | clean | Statement including grading and radical. |
| 9.04 | `09-ar-counterexample.tex:52–66`, “Every product above is homogeneous” | clean | All eleven remaining triples checked; exact certificate rerun. |
| 9.05 | `09-ar-counterexample.tex:68–78`, “For i >= 0 put” | clean | Both rows of the multiplication display. |
| 9.06 | `09-ar-counterexample.tex:80–92`, “The complex R” | clean | Resolution and dual shift statement. |
| 9.07 | `09-ar-counterexample.tex:94–108`, “Since q is transcendental” | clean | Kernels, images, smallest index and minimality. |
| 9.08 | `09-ar-counterexample.tex:110–128`, “Identifying Hom_C(Ce,C)” | clean | Right-module dual and degree-two cohomology. |
| 9.09 | `09-ar-counterexample.tex:130–136`, “The parameter q makes” | clean | Aperiodicity invariant and failed AR condition. |
| 9.10 | `09-ar-counterexample.tex:138–144`, “Let T=C” | clean | Dual actions and inflation. |
| 9.11 | `09-ar-counterexample.tex:146–151`, “The algebra T is a twenty-dimensional” | clean | Symmetry and radical statement. |
| 9.12 | `09-ar-counterexample.tex:153–158`, “The algebra T is symmetric” | clean | Grading and nilpotence; certificate rerun. |
| 9.13 | `09-ar-counterexample.tex:160–167`, “There is tau” | clean | Yoneda algebra and stable endomorphisms. |
| 9.14 | `09-ar-counterexample.tex:169–190`, “Let R be the resolution” | clean | Dual-tensor identification, flatness and triangle. |
| 9.15 | `09-ar-counterexample.tex:192–209`, “Put V^a” | clean | Boundary cases a=1,2,3 and all powers. |
| 9.16 | `09-ar-counterexample.tex:211–232`, “The construction of the bimodule F” | clean | Relative bar complex, contraction and projectivity. |
| 9.17 | `09-ar-counterexample.tex:234–243`, “Let p” | clean | Table conventions, automorphism and z_lambda. |
| 9.18 | `09-ar-counterexample.tex:245–268`, “The map p has” | clean | All four identities matched to the certificate. |
| 9.19 | `09-ar-counterexample.tex:270–275`, “These are finitely many polynomial identities” | clean | Exact certificate inspected and rerun; all 179 entries match the source. |
| 9.20 | `09-ar-counterexample.tex:277–285`, “Define a map of degree three” | proposal | P1: degree relative to the already shifted target. Formula and chain-map calculation check. |
| 9.21 | `09-ar-counterexample.tex:287–292`, “The class tau” | clean | Generator statement. |
| 9.22 | `09-ar-counterexample.tex:294–305`, “The class is represented” | clean | Cycle and nonzero evaluation checked and rerun. |
| 9.23 | `09-ar-counterexample.tex:307–313`, “For lambda” | clean | Inverse twist in every nonnegative multiple of three. |
| 9.24 | `09-ar-counterexample.tex:315–330`, “The map T_h” | clean | Tensor identification and cocycle scaling. |
| 9.25 | `09-ar-counterexample.tex:332–336`, “Let E=T” | clean | Tensor square and Tate notation. |
| 9.26 | `09-ar-counterexample.tex:338–347`, “The algebras E and E^e” | clean | Symmetry, Ext ring, nonprojectivity. |
| 9.27 | `09-ar-counterexample.tex:349–365`, “The tensor product of the symmetrising forms” | clean | Tensor resolution, multiplicative Kunneth argument and signs. |
| 9.28 | `09-ar-counterexample.tex:367–369`, “For m >= 0 let” | clean | Polynomial-degree versus cohomological-degree convention. |
| 9.29 | `09-ar-counterexample.tex:371–382`, “The Tate groups of S” | clean | All degrees and endpoint H^-1. |
| 9.30 | `09-ar-counterexample.tex:384–394`, “The first assertion follows” | clean | Duality compatibility read in Linckelmann v1, Section 2 (2.8). |
| 9.31 | `09-ar-counterexample.tex:396–414`, “Let L be the mapping cone” | proposal | P2: C_0 is used later but excluded from the definition. Other cone indices check. |
| 9.32 | `09-ar-counterexample.tex:416–435`, “For N >= 1” | clean | Both-sided projectivity, cosyzygies and two triangles. |
| 9.33 | `09-ar-counterexample.tex:437–451`, “The cokernel functor” | clean | Exactness, four filtered factors and syzygy sequence. |
| 9.34 | `09-ar-counterexample.tex:453–465`, “A cosyzygy of a bimodule” | clean | Side splittings and stable evaluation. |
| 9.35 | `09-ar-counterexample.tex:467–469`, “Write pi” | clean | Composite projection and W^a. |
| 9.36 | `09-ar-counterexample.tex:471–478`, “For every a” | clean | Two-cone profile and top projection. |
| 9.37 | `09-ar-counterexample.tex:480–499`, “Put U^a” | clean | First long exact sequence and both tau_2 strings. |
| 9.38 | `09-ar-counterexample.tex:500–511`, “The second triangle gives” | clean | Second long exact sequence, degrees 0 and 3, projection. |
| 9.39 | `09-ar-counterexample.tex:513–522`, “For lambda let E_lambda” | clean | Diagonal twist and tensor-square beta_0. |
| 9.40 | `09-ar-counterexample.tex:524–529`, “For every lambda” | clean | Lift statement and normalisation. |
| 9.41 | `09-ar-counterexample.tex:531–551`, “Let B be the basis” | clean | Casimir identity, endpoint counts and radical sums. |
| 9.42 | `09-ar-counterexample.tex:553–570`, “Let Q be B with the right action” | corrected | T3: split the overwide B_n/G_n display; twisted extension rule checked. |
| 9.43 | `09-ar-counterexample.tex:571–580`, “Using this identity” | clean | Homotopy B, including degree zero. |
| 9.44 | `09-ar-counterexample.tex:581–585`, “In dG+Gd” | clean | Homotopy G and n <= 1. |
| 9.45 | `09-ar-counterexample.tex:587–608`, “The complex Q tensor Q” | clean | Defect, tail range n >= 4, shifts and projective cover. |
| 9.46 | `09-ar-counterexample.tex:610–621`, “Evaluating at S” | clean | Lambda squared and nonzero socle class. |
| 9.47 | `09-ar-counterexample.tex:623–644`, “Let w” | clean | Cosyzygy representative, four shifts, fibre and free cover. |
| 9.48 | `09-ar-counterexample.tex:646–658`, “The bimodule F is finite-dimensional” | clean | Uniqueness and all comparison-map degrees. |
| 9.49 | `09-ar-counterexample.tex:660–683`, “All terms of” | clean | Triangle and degree-zero/degree-one endpoints. |
| 9.50 | `09-ar-counterexample.tex:685–697`, “By naturality” | clean | Inverse powers, determinant, vanishing degrees. |
| 9.51 | `09-ar-counterexample.tex:699–709`, “Let Lambda” | clean | AR theorem and field extensions; cited Theorem 1.1 checked. |
| 9.52 | `09-ar-counterexample.tex:711–720`, “The first assertion about Z” | clean | Radical product count and eight split simples. |
| 9.53 | `09-ar-counterexample.tex:722–732`, “For a field extension K” | clean | Faithful scalar extension, nonsplitting and total acyclicity. |
| 9.54 | `09-ar-counterexample.tex:734–744`, “Let Z prime” | clean | Nine-simple endomorphism algebra, correct side. |
| 9.55 | `09-ar-counterexample.tex:746–757`, “The module Z prime exists” | clean | Additive Ext, indecomposable summands and scalar extension. |
| 9.56 | `09-ar-counterexample.tex:759–781`, “The algebra Lambda is explicit” | proposal | P2: undefined C_0; dimension recurrence rerun, historical finite-field record checked (supported). |
| 10.01 | `10-obstructions.tex:1–12`, “The algebra of” | clean | Opening comparison and dependencies. |
| 10.02 | `10-obstructions.tex:14–25`, “In this subsection A” | clean | One-factor setting, Tate degrees and multiplication. |
| 10.03 | `10-obstructions.tex:27–34`, “Let s[-3]” | clean | One-cone profile statement. |
| 10.04 | `10-obstructions.tex:36–47`, “The triangle gives” | clean | All degrees and both nonzero endpoints. |
| 10.05 | `10-obstructions.tex:49–54`, “In the two-factor construction” | clean | Comparison of the cone profiles. |
| 10.06 | `10-obstructions.tex:56–70`, “In the situation of” | corrected | T4: discretionary word hyphenation removes overflow; no hypothesis changed. |
| 10.07 | `10-obstructions.tex:72–87`, “Put V^0” | clean | Exact sequence, dimension two and scalar rank bound. |
| 10.08 | `10-obstructions.tex:89–95`, “The hypothesis w_1” | clean | Scope is the preceding single-cone construction. |
| 10.09 | `10-obstructions.tex:97–107`, “Since tau is nonzero” | clean | Pairing and shifted composition through U^-3. |
| 10.10 | `10-obstructions.tex:109–123`, “Let A be a finite-dimensional symmetric algebra” | clean | Tate obstruction and all hypotheses. |
| 10.11 | `10-obstructions.tex:125–146`, “Write H^a” | corrected | A2: comma splice; bracket degrees, zero tau, indeterminacy and juggling checked. |
| 10.12 | `10-obstructions.tex:148–154`, “Let A be a finite-dimensional symmetric algebra” | clean | General degree p >= 3. |
| 10.13 | `10-obstructions.tex:156–160`, “For p=3” | clean | Bracket defined and target zero also for p > 3. |
| 10.14 | `10-obstructions.tex:162–172`, “The tensor square S” | clean | Tensor-square application and stated limitations. |
| 10.15 | `10-obstructions.tex:174–190`, “For trivial extensions” | proposal | P3: distinguish the one-factor beta_0 from Section 9's tensor-square class. Six-dimensional example checked separately. |
| 10.16 | `10-obstructions.tex:192–198`, “The following computations” | corrected | T5: local line break removes overflow. |
| 10.17 | `10-obstructions.tex:199–208`, “A test bed without cones” | corrected | A3: complete the clause after the semicolon; finite historical claims supported by saved records. |
| 10.18 | `10-obstructions.tex:209–215`, “The one-factor candidate” | clean | Both saved cases match the dimensions and profiles (supported). |
| 10.19 | `10-obstructions.tex:216–221`, “Three further one-factor attempts” | proposal | P4: experiments exclude a single degree-three polynomial generator, not all polynomial Ext algebras. |

## Applied changes (unified diff)

- **A1**, original `08:319`: repair “uses of ... only that” without changing
  the stated use of symmetry.
- **A2**, original `10:131`: replace the comma splice by a semicolon.
- **A3**, original `10:206–207`: supply the missing subject and verb in the
  exact-computation clause. The existing scope (the same two Ext profiles,
  only through degree two) is retained and agrees with the saved exact record.
- **T1**, original `08:218–221`: split a display that overran by 10.8867 pt.
- **T2**, original `08:282–284`: display the differential calculation that
  caused a 6.0291 pt overrun. Its formula and the following calculation are unchanged.
- **T3**, original `09:559–562`: align the two defining equations on separate
  lines, removing a 16.32266 pt overrun.
- **T4**, original `10:58`: allow a local discretionary word break, removing
  a 4.15788 pt overrun.
- **T5**, original `10:195`: insert a local line break after “with” in the
  run-in subsection paragraph, removing a 4.45117 pt overrun.

The diff is against the original scope snapshots, not against concurrent
reviewers' changes. All five layout repairs were checked in the final PDF.

```diff
--- a/report/sections/08-conversion.tex
+++ b/report/sections/08-conversion.tex
@@ -216,8 +216,10 @@
   representing $v$ and an injective homomorphism $i\colon S\to Q$ into a
   finitely generated projective module $Q$, and put
   \[
-    Z_2=(FS\oplus Q)/\set{(v_0(s),i(s))}[s\in S],\qquad
+    \begin{gathered}
+    Z_2=(FS\oplus Q)/\set{(v_0(s),i(s))}[s\in S],\\
     \iota\colon FS\to Z_2,\ t\mapsto[t,0],\qquad Z=(S,Z_2,\iota).
+    \end{gathered}
   \]
   Then $Z$ is a finite-dimensional, nonprojective and Gorenstein-projective
   $\Lambda$-module, and
@@ -279,7 +281,10 @@
   \]
   where $h$ stands for the map $\mathsf{L}_2\mathbb{P}\to\mathsf{L}_1
   \mathbb{P}$ corresponding to it under \Cref{lemma:triangular}. Expanding
-  $\partial\Phi=d_{\mathbb{P}_Z}\Phi-(-1)^n\Phi d_{\mathbb{P}_Z}$, the diagonal
+  \[
+    \partial\Phi=d_{\mathbb{P}_Z}\Phi-(-1)^n\Phi d_{\mathbb{P}_Z},
+  \]
+  the diagonal
   entries are $\mathsf{L}_1(\partial g)$ and $(-1)^{n+1}\mathsf{L}_2(\partial
   j)$, and the upper right entry is
   \[
@@ -316,7 +321,7 @@
 
 \begin{remark}
   \label{rem:conversion-mechanism}
-  The proof uses of the symmetry of $E$ only that finitely generated
+  The proof uses the symmetry of $E$ only to ensure that finitely generated
   projective modules are injective and that every module embeds into a
   projective one; it uses neither Tate duality nor the simplicity of~$S$. The
   sequence~\eqref{eq:conversion-sequence} holds without the hypotheses on
--- a/report/sections/09-ar-counterexample.tex
+++ b/report/sections/09-ar-counterexample.tex
@@ -556,10 +556,10 @@
   a_0\psi([\cdots])h_\lambda^{-1}(a_{n+1})$, which is the rule for bimodule
   maps from $\mathbb{Q}$. Let $D_b\colon\mathbb{Q}\to\mathbb{B}$ be $b$
   composed with the augmentation in degree zero and zero elsewhere, and put
-  \[
-    B_n([a_1|\cdots|a_n])=\sum_w[a_1|\cdots|a_n|h_\lambda(w)]w^*,\qquad
-    G_n([a_1|\cdots|a_n])=[a_1|\cdots|a_{n-1}]z_\lambda(a_n),
-  \]
+  \begin{align*}
+    B_n([a_1|\cdots|a_n])&=\sum_w[a_1|\cdots|a_n|h_\lambda(w)]w^*,\\
+    G_n([a_1|\cdots|a_n])&=[a_1|\cdots|a_{n-1}]z_\lambda(a_n),
+  \end{align*}
   with $w$ running through the radical basis vectors and $G_0=0$, maps of
   degrees $-1$ and $+1$. Projecting $a\xi_\lambda=\xi_\lambda h_\lambda^{-1}(a)$
   to the radical in the first factor gives, for a radical $a$ with right
--- a/report/sections/10-obstructions.tex
+++ b/report/sections/10-obstructions.tex
@@ -55,7 +55,7 @@
 
 \begin{proposition}
   \label{prop:one-factor}
-  In the situation of \Cref{prop:one-cone}, let $F$ be a finite-dimensional
+  In the situation of \Cref{prop:one-cone}, let $F$ be a finite-dimen\-sional
   $A$-bimodule, projective on each side, with a triangle
   \[
     Fs\xrightarrow{(\rho_1,\rho_2)}s\oplus s\xrightarrow{(w_1,w_2)}X[1]
@@ -128,7 +128,7 @@
   and $H^{-1}\cong DH^0$ is one-dimensional, since $H^0=
   \underline{\operatorname{End}}_A(s)=\kk$ for the nonprojective module $s$
   with $\operatorname{End}_A(s)=\kk$. The bracket is defined, since
-  $\tau\beta\in H^2=0$ and $\beta^2\in H^{-2}=0$, it lies in $H^0$, and its
+  $\tau\beta\in H^2=0$ and $\beta^2\in H^{-2}=0$; it lies in $H^0$, and its
   indeterminacy $\tau H^{-3}+H^1\beta$ is zero. If $\tau=0$, then $0$ is an
   element of the bracket, obtained with $b=0$ in the defining system. If
   $\tau\neq0$, the nondegenerate pairing of \Cref{thm:tate-duality}, which is
@@ -192,7 +192,8 @@
 \subsection{Computational evidence}
 \label{subsec:obstruction-computations}
 
-The following computations, described with their scripts and parameters in
+The following computations, described with\linebreak
+their scripts and parameters in
 \Cref{app:computations}, test the one-factor shape directly, in accordance with
 \Cref{coro:one-factor}. They are finite computations with the stated scope,
 not proofs in all degrees.
@@ -203,8 +204,8 @@
     Over finite fields $\mathbb{F}_{2^{16}}$, in three runs and up to degree
     six, $\operatorname{Ext}^a_{\Lambda_0}(Z_0,Z_0)$ has dimensions
     $1,0,0,0,0,0$ for $a=1,\dots,6$ and
-    $\operatorname{Ext}^a_{\Lambda_0}(Z_0,\Lambda_0)=0$; exactly over
-    $\mathbb{F}_2(q,H_1,H_2)$ up to degree two. The surviving class is the
+    $\operatorname{Ext}^a_{\Lambda_0}(Z_0,\Lambda_0)=0$; the same holds exactly
+    over $\mathbb{F}_2(q,H_1,H_2)$ up to degree two. The surviving class is the
     cokernel of $\delta^0$, as predicted by~\eqref{eq:conversion-sequence}.
   \item The one-factor candidate built from the cone of $\tau$ over $T$, lifts of
     the twists and a fibre $F_1$, of dimension $352$, giving an algebra
```

## Proposals (not applied)

### P1 — Degree of the map into the shifted bar complex

Anchor: `09-ar-counterexample.tex:277`, “Define a map of degree three”.
Status: **AI-proved** degree bookkeeping; proposed notation correction.
The displayed formula sends \(\mathbb B^{-n}\) to
\(\mathbb B^{-n+3}=(\mathbb B[3])^{-n}\), so it is a degree-zero map to the
already shifted target. Its underlying endomorphism of \(\mathbb B\) has
degree three. Removing the extra description avoids counting the shift twice.
The formula and subsequent chain-map argument need no change. This is left as
a proposal because it changes the description of a proof map.

```diff
--- a/report/sections/09-ar-counterexample.tex
+++ b/report/sections/09-ar-counterexample.tex
@@ -275,5 +275,5 @@
 \end{proof}
 
-Define a map of degree three $p\colon\mathbb{B}\to\mathbb{B}[3]$ by
+Define a map $p\colon\mathbb{B}\to\mathbb{B}[3]$ by
 \[
   p(a_0[a_1|\cdots|a_n]a_{n+1})=a_0[a_1|\cdots|a_{n-3}]\,
```

### P2 — Define the cokernel C_0 used in the size remark

Anchors: `09-ar-counterexample.tex:411`, “of E; in particular”, and
`:773`, “to C_0 and C_1”. Status: **AI-proved** notation gap.
The definition currently names \(C_N\) only for \(N\geq1\), while the size
remark uses \(C_0\). The displayed cokernel is defined also for \(N=0\),
without any need for exactness at degree zero. Extend only this definition;
retain \(N\geq1\) in Lemma 9.12 and its projectivity/exactness assertions.
The historical minimised-complex dimensions remain finite-computation evidence.

```diff
--- a/report/sections/09-ar-counterexample.tex
+++ b/report/sections/09-ar-counterexample.tex
@@ -409,5 +409,5 @@
 $(\mathbb{B}\otimes\mathbb{B})[-2]$ twice, and $(\mathbb{B}\otimes\mathbb{B})
 [-4]$, where $\mathbb{B}\otimes\mathbb{B}$ is a projective bimodule resolution
-of $E$; in particular $K$ is exact in negative degrees. For $N\geq1$ put
+of $E$; in particular $K$ is exact in negative degrees. For $N\geq0$ put
 \[
   C_N=\operatorname{coker}(K^{-N-1}\to K^{-N}).
```

### P3 — Specify the one-factor class in the weight argument

Anchor: `10-obstructions.tex:182–184`, “internal degrees add up to zero”.
Status: **AI-proved** distinction of the two internal weights; proposed
clarification of mathematical notation.
The asserted weight \(\delta(\beta_0)=1\) is correct for the one-factor pair
\((T,s)\). Section 9, however, names the tensor-square socle class
\(f^*\otimes f^*\) by \(\beta_0\), with total \(DC\)-weight two. The
current sentence invokes Section 9 without specifying which class is meant.
Make the one-factor interpretation explicit. The bracket weights then sum to
\(-1+1+1=1\), so its degree-zero target cannot contain a nonzero value.
The tensor-square argument also has noncancelling weights, but it requires
its own weight-two class; it is not the displayed calculation.

```diff
--- a/report/sections/10-obstructions.tex
+++ b/report/sections/10-obstructions.tex
@@ -180,6 +180,8 @@
   \Cref{lemma:twist}; a bracket of homogeneous classes with zero indeterminacy
   and target concentrated in internal degree zero vanishes unless the
-  internal degrees add up to zero. In the situation of \Cref{sec:ar-route},
-  $\delta(\tau)=-1$ by \Cref{lemma:twist} and $\delta(\beta_0)=1$, since
+  internal degrees add up to zero. For the one-factor pair $(T,s)$ of
+  \Cref{sec:ar-route}, let $\beta_0$ span
+  $\widehat{\operatorname{Ext}}{}^{-1}_T(s,s)$. Then $\delta(\tau)=-1$ by
+  \Cref{lemma:twist} and $\delta(\beta_0)=1$, since
   $\beta_0$ is dual to the identity under a form of internal degree one, so
   the weights do not cancel. This argument, and a six-dimensional example in
```

### P4 — Narrow the claim about the three unsuccessful experiments

Anchor: current `10-obstructions.tex:218–220` (original `:217–219`),
“and 40 fail earlier”. Status: the exclusion of a single degree-three
polynomial generator is **supported** by the recorded profiles; the blanket
exclusion of polynomial Ext algebras is unsupported and has a structural
counterexample in the intended generic construction (**AI-proved**).
The forty-dimensional algebra is the iterated trivial extension
\(T\ltimes DT\). Symmetry identifies \(DT\cong T\) as a bimodule, so it is
\(T\otimes \kk[\epsilon]/(\epsilon^2)\). For the generic parameter and the
chosen simple, the tensor-product resolution gives the ordinary Ext algebra
\(\kk[\tau,z]\), with \(|\tau|=3\) and \(|z|=1\), in characteristic two.
Thus it is polynomial, but not on a single generator of degree three.
The same tensor-product description is explicitly used by
`computations/07-one-factor-search/profiles.py:289–311`; the positive
one-dimensional Ext in degree one already excludes the required profile.
This generic all-degree observation is not being attributed to the finite-field
samples, which were checked only through degree twelve. Appendix A already
states the narrower degree-three requirement. Retain the finite range and
replace only the overbroad description.

```diff
--- a/report/sections/10-obstructions.tex
+++ b/report/sections/10-obstructions.tex
@@ -217,5 +217,6 @@
   \item Three further one-factor attempts with algebras of dimensions $6$, $12$
     and $40$ fail earlier: the relevant simple modules do not have polynomial
-    Ext algebras; their Ext profiles were computed over $\mathbb{F}_{2^{16}}$
+    Ext algebras on one generator of degree three; their Ext profiles were
+    computed over $\mathbb{F}_{2^{16}}$
     up to degree twelve, using a tensor-product formula in degrees $2$ to $12$
     for the forty-dimensional example.
```

## Validation

### Mathematical checks and evidence

The block table records checks of every statement, paragraph, proof segment,
remark and display group in scope, using original line ranges and first words.
Related displays are grouped with their surrounding argument. No previous
audit verdict was used as evidence.

- **Section 8 — AI-proved local argument.** Rechecked both directions of
  lifting stable maps to complete resolutions, homotopies in both unbounded
  directions, the left-module triangular convention, all four Hom
  identifications, total acyclicity, and the sign-changing cokernel
  isomorphism. Direct expansion in the cone coordinates gives
  `d(g,j,h)=(dg,dj,delta(g,j)-dh)`, hence the stated exact sequence with
  `coker(delta^(a-1))` and `ker(delta^a)`. The endpoint `a=1` and
  nonprojectivity argument use exactly the hypotheses in the statement.
- **Section 9 — AI-proved general arguments, supported exact finite data.**
  Rechecked the resolution kernels, dual conventions, dimension/degree
  shifts, the tensor-product Ext algebra, the mixed Tate action, both cone
  endpoint calculations, tail range `n >= 4`, the evaluation of the socle
  class, the fibre and its comparison maps. The scalar determinant is
  `H_1^(-m)+H_2^(-m)`, nonzero for every `m > 0` by algebraic independence;
  degree zero has the claimed diagonal kernel. The radical, side of the
  endomorphism algebra, eight/nine-simple counts, and arbitrary field
  extensions were checked separately from the finite computations.
- **Section 10 — AI-proved local arguments.** Recomputed the one-cone groups
  in every degree, the two-dimensional degree-zero fibre and scalar rank
  bound. For the Tate obstruction, duality gives the required zero groups
  in degrees `-2,-3,-5`; the case `tau=0`, the chosen `gamma` for nonzero
  `tau`, all bracket degrees, the zero indeterminacy, and the juggling
  inclusion were checked. For `p>3`, the target degree is `p-3`, strictly
  between zero and `p`. The six-dimensional periodic example was checked
  from the alternating two-cycle paths of length below three: the four
  residues of its complete resolution give `df=0`, `dU=f^2`, and
  `fU+Uf=v^2`; thus `<f,f/v,f/v>={1}` with zero indeterminacy. Its
  trivial-extension weights are `-2,1,1`, consistent with the example and
  with the fact that its Ext algebra fails the obstruction's hypotheses.

Fresh executions, all exit status 0, with output saved privately:

- `python3 -B computations/08-D-E/certificate_receipt.py` ->
  `scratch/W5c-build/certificates.txt`. Both complete finite-certificate
  implementations were read. Fresh foundations and cocycle output matches
  the saved output exactly. The check includes all 8,000 basis associativity
  triples, all 104,976 radical cocycle quadruples, the 324 boundary pairs
  with polynomial coefficients, cycle evaluation and the Casimir identities.
  It also checks all 179 cochain entries against the preprint source.
- An additional literal comparison of all 179 report table entries against
  the certificate table passed; receipt:
  `scratch/W5c-build/report-table-check.txt`. The table is an input to the
  scoped argument; Appendix A was not edited by W5c.
- `python3 -B computations/09-sizes/dimensions.py` ->
  `scratch/W5c-build/dimensions.txt`. The recurrence was read and checked:
  `dim C_1 = 1623889344` and
  `dim Lambda = 170271818183326072615867045851312256`.
- Read-only calls to `signed_identity()` and `nakayama_control()` from
  `computations/07-one-factor-search/controls.py` ->
  `scratch/W5c-build/obstruction-controls.txt`. The signed calculation is
  over the integers, not just characteristic two. The periodic control
  enumerates all four residues. The script's output-writing main routine
  was not run, so the historical records were not overwritten.

The longer historical experiments were **not rerun**. Their claims retain
**supported**, finite-degree status. Their raw/saved records were compared
with the text: `03-testbed-lambda0/summary.out` and the finite/exact result
records; `05-candidate1/summary.out`, summary and both case records;
`06-two-factor/sizes.json`; `07-one-factor-search/profiles.out` and the
corresponding tensor-product code. These support, respectively, the three
finite samples through degree six and exact generic calculation through
degree two; the two one-factor samples through degree three; the minimised
sizes with matrices never formed; and the further profiles through degree
twelve. They do not certify unsampled parameters or additional degrees.

### Citation and cross-reference check

- `AR75a`: the original library PDF, printed p. 70, was read and rendered.
  It states the generator formulation. The module formulation in Section 8
  follows by adjoining the regular module and using additivity of Ext.
  OCR's ambiguous inequality was checked visually as `i >= 1`.
- `Lin12a`: read the standing symmetric-algebra/left-module assumptions and
  Section 2, especially (2.1), (2.2) and (2.8), in the pinned
  [arXiv v1](https://arxiv.org/abs/1211.5999v1). The composition identity
  cited in Section 9 is (2.8) on printed p. 6, also visually checked.
  Local PDF SHA-256:
  `4bad02ddbcf0bd2af21e3467a77beaae26e21f3fc6060e7a3d7712527ff05cb0`.
- `OAI26ar`: read the repository's source preprint and its table. Theorem 1.1,
  printed p. 2, agrees with the theorem attribution in Section 9, including
  the base field, finite-dimensional left module, Gorenstein-projectivity,
  eight split simples and field extensions. The rendered source page was
  inspected. PDF SHA-256:
  `22f6a9d5151fca3a323b9a1b91f6eb3ccf4c84cde00e9dfdeccb760a380ed6c3`.
- Internal references were checked against the target statements, including
  the Section 2 duality and Toda conventions and the Section 3
  endomorphism-algebra criterion. P2 and P3 record the two notation issues.
  No bibliography entry or citation locator was changed.

### Build and layout

Ran exactly from `report/`:

```sh
latexmk -pdf -outdir=../scratch/W5c-build main.tex
```

The final post-edit run exited 0 and produced a 51-page PDF. Its stdout is
`scratch/W5c-build/final-latexmk.txt`; its TeX log is
`scratch/W5c-build/main.log`. The baseline stdout/log are separately saved
as `baseline-latexmk.txt` / `baseline-main.log`; the baseline build is not
being used as post-edit validation.

Final log: no overfull boxes and no undefined references or citations.
There are 31 duplicate-destination warnings and 22 underfull-box warnings
in the full document. No underfull-box warning is attached to a paragraph
in the assigned sections. The duplicate destinations include scoped labels,
but arise from the shared section-reset equation/theorem counter and hyperlink
setup in `report/main.tex`; this requires coordination outside W5c's edit
scope. Printed reference numbers are correct; hyperlink targets cannot be
certified while the duplicate destinations remain. No global preamble change
was made.

Rendered and inspected final pages 32, 33, 40, 43, 44 and 45, including every
layout correction and the last two grammar corrections. The baseline
renderings and primary-source renderings are also in the private build
folder. Concurrent changes to other sections were present in the compiled
article; this review does not certify those reviewers' edits.

Final PDF SHA-256:
`268e02694bf277726c7757a815b8783f7c620bc2dab1b8159d89242b8d433add`.
Final TeX log SHA-256:
`481060f17cc96f03b22313fb2b964845ac74b5e5c7194179b8f78e635f268a4c`.

Final in-scope SHA-256:

- `08-conversion.tex`: `da92bccd44e4623867af4f9c26fa6e70d62af6142e9ed622dbae98734a56ef85`
- `09-ar-counterexample.tex`: `a6ed76103772a224a592287a58d7fba8910d01ffe2c805ad7af0da10780619f5`
- `10-obstructions.tex`: `365664b9f0860932920eaf8cb39c1f39242243665c6e9d548cbbc796475a2852`

`git diff --check` passed for the assigned source files. Repository size after
rendering: 85 MB, below the stated storage limit. W5c changed only its three
assigned sources, this audit, and its private scratch artifacts. No commit,
push, changes to other reviewers' files, or writes to `log/CONVERSATION.md`
were made. The four proposals remain unapplied.
