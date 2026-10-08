Model: unknown; effort: unknown.

# W4-05: adversarial review of the drafted selection section

Status: complete. Only this audit file was modified by this job; all source access was read-only.
During the review, an independent update in commit `3ec6473` repaired F2 in both sections 5 and 6.
Those changes were reread. The current verdict table incorporates them; F2 is retained below
as a resolved finding, and its historical diff is not a pending proposal.

Scope: every statement, proof, example, remark and interpretive paragraph in
`report/sections/05-selection.tex`; citations and standing hypotheses in the permitted sources;
compatibility with `def:selection-data` and `lemma:selection-matrix` in section 6.
Line references refer to the current LaTeX sources, not the eventual printed numbering.

Verdicts are `no error found`, `error found`, `gap`, or `unsupported claim`.
Mathematical derivations in this audit have status **AI-proved** when fully justified here;
finite computations have status **supported**, restricted to the cases stated. These are AI
assessments, not author certification. Source dossiers and other agents' reports are leads only.

## Verdict by block

All locations in this table refer to `report/sections/05-selection.tex` unless section 6 is named.
The listed findings concern the current draft; no source repair was applied by this job.

| Lines / label | Verdict | Finding or scope |
| --- | --- | --- |
| 4–10, opening | no error found | Matches the construction and preprint Section 2 |
| 15–27, `def:selection-data` | no error found | Includes scalar compatibility and right finite projectivity |
| 29–34, well-definedness and exactness | no error found | F2 was repaired independently during review; current wording checked |
| 36–46, `ex:twisted-corner` | no error found | Endomorphisms suffice; both inverse maps checked |
| 48–77, rank functions, `eq:rank-shift`, visible rank | no error found | Tensor map is defined on right projectives; common kernel is stable |
| 79–109, `prop:rank-obstruction` and proof | no error found | Fitting argument and zero-rank case checked |
| 111–133, `coro:rank-obstruction`, statement and case (i) | no error found | Finite projective generators; finite-dimensional example |
| 134–140, corollary case (iii) | error found | F5: right-projective K-group notation; cited mathematics applies |
| 142–165, corollary case (ii) | no error found | Component-rank factorisation and both Stacks citations |
| 167–168, whole K-group side claim | unsupported claim | F6: no example or citation in permitted evidence; not alleged false |
| 168–170, comparison of classes of algebras | unsupported claim | F4: “most common”/“tractable” comparison has no supplied basis |
| 170–172, explanation of visible rank | gap | F3: idempotent independence alone is not visible independence |
| 177–206, conventions and `def:selection-group` | no error found | All indexed relators and commutator convention match |
| 208–213, group interpretation and Reg19 citation | no error found | Limited comparison of arguments, not application of its theorem to G |
| 215–224, `prop:group-presentation` | no error found | Fifteen generators and finite list of relators |
| 226–279, presentation proof and `eq:torus-conjugation` | no error found | Integral kernels, all nine vector entries, both output weights, inverse maps |
| 281–321, `prop:central-involutions`, proof and `eq:commutator-transfer` | no error found | No circular use of centrality; all integer indices |
| 323–343, `prop:shift-automorphism` and proof | no error found | Every relator family and inverse translation checked |
| 348–352, coefficient-ring paragraph | no error found | All m>=1, including even m and m=1 |
| 354–406, `prop:finite-quotients` and proof | no error found | Every matrix relation, centrality and independence |
| 408–422, `coro:z-independent` and proof | no error found | Negative indices, singleton families, finitely generated centre argument |
| 424–428, interpretive conclusion | no error found | Only separation of finite subfamilies asserted |
| 433–438, fixed group-algebra data | no error found | Complex scalars and central idempotent |
| 440–462, `lemma:selection-iterates` and proof | no error found | Correct forward twist and naturality, including j=0 |
| 464–484, `thm:selection-unbounded`, statement and algebra presentation | no error found | Both algebra maps and hypotheses checked |
| 486–504, character construction and extinction proof | error found | F1: missing lower bound at 490; subsequent steps valid with intended range |
| 507–520, `rem:selection-visible-rank` | no error found | Triangular evaluations and induced-module dimension checked; future simulation reference not certified |
| Section 6, 394–496, 735–745, 806–830 | no error found | Definition/interface agrees; the earlier F2 wording was repaired at 427–430 |

## Findings recorded during the review

### F1. Missing range in the character prescription — error found

Location: `report/sections/05-selection.tex:490`, proof of `thm:selection-unbounded`.
The previously defined parameter of `z_q` ranges over all integers. The displayed matrix images
satisfy `overline z_{-1} = overline z_{m-1}` because `t^m=1`. The unqualified condition
`q<m-1` therefore assigns `+1` to the very element assigned `-1` in the next clause, for
every `m>=1`. The preceding basis list makes the intention recoverable, but the missing lower
bound should be restored. Both dossier §6.1 and `build/sections/02-selection-process.tex:337`
include that bound. Status of this diagnosis: **AI-proved**.

```diff
--- a/report/sections/05-selection.tex
+++ b/report/sections/05-selection.tex
@@ -490,1 +490,1 @@
-  $\chi_m(\overline{z}_q)=1$ for $q<m-1$ and $\chi_m(\overline{z}_{m-1})=-1$.
+  $\chi_m(\overline{z}_q)=1$ for $0\leq q<m-1$ and $\chi_m(\overline{z}_{m-1})=-1$.
```

### F2. The splitting is not a splitting of left modules — resolved during review

**Current verdict: no error found.** Commit `3ec6473`, made independently while this job was
running, explicitly restricts the splitting to vector spaces and detects exactness there.
The current section 5 lines 29–32 and section 6 lines 427–430 were reread and resolve the issue.
The following records the original diagnosis and superseded diff; do not apply this diff.

Location: `report/sections/05-selection.tex:29–32`, after `def:selection-data`.
The asserted exactness and preservation of finite dimension are correct. However, the given
right-module splitting of `Psi` gives a natural splitting only after forgetting the left action.
It does not make `H` a summand of the ordinary `n`-fold identity endofunctor on left modules.
For example, take `R=k x k`, `e=1`, `alpha(a,b)=(b,a)`, and `Psi={}_alpha R`.
Then `Psi_R` is free of rank one, but for `Y=(k,0)` we have `HY=(0,k)`, which is not a
left-module summand of `Y^n` for any `n`. Status: **AI-proved** by the two central-idempotent
actions. This is a category qualification, not a defect in the definition or the extinction result.

```diff
--- a/report/sections/05-selection.tex
+++ b/report/sections/05-selection.tex
@@ -29,4 +29,5 @@
 The functor $H$ is well defined and exact: $\Psi_R$ is a direct summand of
-some $R^n$, so $HY$ is a direct summand of $Y^n$ and $H$ is a direct summand of
-an exact functor; see \Cref{lemma:selection-matrix} for an explicit
+some $R^n$, so the underlying vector space of $HY$ is a direct summand of
+$Y^n$. Exactness follows from the projectivity of $\Psi_R$;
+see \Cref{lemma:selection-matrix} for an explicit
 description. Iterates of $H$ are written $H^t$, with $H^0$ the identity. A
```

The same qualification was originally missing in the forward lemma at section 6 lines
424–425; the corrected passage is now at 427–430. Its matrix construction and hypotheses
agree with the definition. This job did not modify either section.

### F3. The explanation of infinite visible rank omits visibility — gap

Location: `report/sections/05-selection.tex:170–172`.
Linear independence of central idempotents as algebra elements, even together with a permutation
by an automorphism, does not by itself supply independence of their rank functions on
finite-dimensional modules. The permitted source `audit/02-verification-codex.md`,
“Consequences after O.3”, explicitly distinguishes these statements. The needed evidence is
provided later by the character modules and the triangular evaluation matrix in
`rem:selection-visible-rank`. The following minimal replacement points to that actual argument.
This is a defect in the stated reason, not a failure of the later proof of infinite visible rank.

```diff
--- a/report/sections/05-selection.tex
+++ b/report/sections/05-selection.tex
@@ -170,3 +170,4 @@
-tractable finite-dimensional representations. In the example below the visible
-rank is infinite because a group algebra contains infinitely many independent
-central idempotents, permuted by an automorphism.
+tractable finite-dimensional representations. In the example below the visible
+rank is infinite because the finite-dimensional modules constructed below
+detect linearly independent rank functions, as shown in
+\Cref{rem:selection-visible-rank}.
```

### F4. Comparative claim about tractable algebras — unsupported claim

Location: `report/sections/05-selection.tex:168–170`.
Neither the corollary nor the permitted sources justify “the most common sources” of algebras
with “tractable” representations. These terms have no defined comparison class here. The
corollary establishes only the three listed exclusions. Minimal repair (overlaps F3 at line 170;
combine these two hunks before application):

```diff
--- a/report/sections/05-selection.tex
+++ b/report/sections/05-selection.tex
@@ -168,3 +168,1 @@
-finite rank; only the rank functions matter. \Cref{coro:rank-obstruction}
-excludes the most common sources of infinite-dimensional algebras with
-tractable finite-dimensional representations. In the example below the visible
+finite rank; only the rank functions matter. In the example below the visible
```

### F5. Right-projective Grothendieck groups change notation — error found (notation)

Location: `report/sections/05-selection.tex:137–140`, hereditary-localisation case.
The relevant group was explicitly denoted `K_0(R^op)` at lines 50–51, because it is formed
from projective right modules. Schofield uses right modules too. The proof changes to
`K_0(B)` and `K_0(B_Sigma)` without explaining a change of convention or the usual duality
between left and right projectives. This does not invalidate finite generation; it should be
written in the established notation. Minimal repair:

```diff
--- a/report/sections/05-selection.tex
+++ b/report/sections/05-selection.tex
@@ -137,4 +137,4 @@
-  of the form studied in~\cite{Sch07a}, and for these the map from $K_0(B)$ to
-  $K_0(B_\Sigma)$ is surjective~\cite[Lemma~4.1]{Sch07a}. Since $K_0(B)$ is
+  of the form studied in~\cite{Sch07a}, and for these the map from $K_0(B^{\op})$ to
+  $K_0(B_\Sigma^{\op})$ is surjective~\cite[Lemma~4.1]{Sch07a}. Since $K_0(B^{\op})$ is
   finitely generated by case~\eqref{it:rank-finite-list}, so is
-  $K_0(B_\Sigma)$.
+  $K_0(B_\Sigma^{\op})$.
```

### F6. Infinite rank of the whole commutative K-group — unsupported in the permitted evidence

Location: `report/sections/05-selection.tex:167–168`.
The assertion that `K_0(R)` itself need not have finite rank is not accompanied by an example
or a citation in the draft. The permitted O.3 audit repeats it but provides neither. This
review does **not** claim the assertion is false. The proved component-rank factorisation only
shows that finite rank of the whole K-group is unnecessary for this argument. Minimal repair:

```diff
--- a/report/sections/05-selection.tex
+++ b/report/sections/05-selection.tex
@@ -167,2 +167,3 @@
-In case~\eqref{it:rank-noetherian} the group $K_0(R)$ itself need not have
-finite rank; only the rank functions matter. \Cref{coro:rank-obstruction}
+In case~\eqref{it:rank-noetherian} the argument bounds the image of $\chi$
+using the finitely many component ranks, without requiring finite rank of
+$K_0(R)$. \Cref{coro:rank-obstruction}
```

Combined repair for the overlapping findings F3, F4 and F6:

```diff
--- a/report/sections/05-selection.tex
+++ b/report/sections/05-selection.tex
@@ -167,6 +167,6 @@
-In case~\eqref{it:rank-noetherian} the group $K_0(R)$ itself need not have
-finite rank; only the rank functions matter. \Cref{coro:rank-obstruction}
-excludes the most common sources of infinite-dimensional algebras with
-tractable finite-dimensional representations. In the example below the visible
-rank is infinite because a group algebra contains infinitely many independent
-central idempotents, permuted by an automorphism.
+In case~\eqref{it:rank-noetherian} the argument bounds the image of $\chi$
+using the finitely many component ranks, without requiring finite rank of
+$K_0(R)$. In the example below the visible rank is infinite because the
+finite-dimensional modules constructed below detect linearly independent
+rank functions, as shown in
+\Cref{rem:selection-visible-rank}.
```

## Independently written finite computation

The executable check is embedded here, rather than in a second file, to comply with the
job-specific instruction to modify only this audit. It is independent of the dossier's scripts,
which were not opened or run. Its assertions concern finite matrix images, not the abstract
group presentation. General arguments and the weight table are recorded separately below.

```python
# Claim: the proposed matrices respect all defining relators and central independence.
# Cases: m=1,...,6; every i,j,h,l; every r,s in [-m,m]; every central subset.
# Conventions: zero-based matrix coordinates; [x,y]=xyx^-1y^-1; coefficients in
# F_2[t]/(t^m-1) represented by bit masks; all elementary generators are involutions.
from itertools import permutations, product

for m in range(1, 7):
    def mul(a, b):
        out = 0
        for i in range(m):
            for j in range(m):
                if (a >> i) & (b >> j) & 1:
                    out ^= 1 << ((i+j) % m)
        return out
    def mm(A, B):
        C = {}
        for (a,b), x in A.items():
            for (c,d), y in B.items():
                if b == c:
                    C[a,d] = C.get((a,d), 0) ^ mul(x,y)
        return {ij:x for ij,x in C.items() if x}
    I = {(i,i):1 for i in range(5)}
    def elem(a,b,r):
        A = I.copy()
        A[a,b] = 1 << (r % m)
        return A
    def diag(l, sign):
        A = I.copy()
        A[l,l] = 1 << (sign % m)
        return A
    def comm(A,B):
        return mm(mm(mm(A,B),A),B)
    U = lambda i,r: elem(0,i,r)
    V = lambda i,r: elem(i,4,r)
    W = lambda i,j,r: elem(i,j,r)
    Z = lambda r: elem(0,4,r)
    idx = (1,2,3)
    pars = range(-m,m+1)
    types = [(lambda r,i=i:U(i,r), tuple(-int(l==i) for l in idx)) for i in idx]
    types += [(lambda r,i=i:V(i,r), tuple(int(l==i) for l in idx)) for i in idx]
    types += [(lambda r,i=i,j=j:W(i,j,r),
               tuple(int(l==i)-int(l==j) for l in idx))
              for i,j in permutations(idx,2)]
    for l,h in product(idx,repeat=2):
        assert mm(diag(l,1),diag(h,1)) == mm(diag(h,1),diag(l,1))
    for S,wt in types:
        for r in pars:
            A = S(r)
            assert mm(A,A) == I
            assert mm(A,Z(r)) == mm(Z(r),A)
            for l in idx:
                assert mm(mm(diag(l,1),A),diag(l,-1)) == S(r+wt[l-1])
                assert mm(diag(l,1),Z(r)) == mm(Z(r),diag(l,1))
    for r,s in product(pars,repeat=2):
        for i in idx:
            assert comm(U(i,r),V(i,s)) == Z(r+s)
        for i,j in permutations(idx,2):
            assert comm(U(i,r),U(j,s)) == I
            assert comm(V(i,r),V(j,s)) == I
            assert comm(U(i,r),V(j,s)) == I
            assert comm(U(i,r),W(i,j,s)) == U(j,r+s)
            assert comm(W(i,j,s),V(j,r)) == V(i,r+s)
            for h in idx:
                if h != i: assert comm(W(i,j,s),U(h,r)) == I
                if h != j: assert comm(W(i,j,s),V(h,r)) == I
    images = set()
    for mask in range(1 << m):
        A = I
        for q in range(m):
            if (mask >> q) & 1: A = mm(A,Z(q))
        images.add(tuple(sorted(A.items())))
    assert len(images) == 1 << m
    assert Z(-1) == Z(m-1)  # Detects the omitted bound in the drafted character.
    print(f'm={m}: all matrix relators and {1 << m} central products passed')
```

Saved output, executed with the installed `python3 -B`, exit status 0:

```text
m=1: all matrix relators and 2 central products passed
m=2: all matrix relators and 4 central products passed
m=3: all matrix relators and 8 central products passed
m=4: all matrix relators and 16 central products passed
m=5: all matrix relators and 32 central products passed
m=6: all matrix relators and 64 central products passed
```

Status: **supported** in precisely those cases. No finite computation is used to infer the
abstract group relations or the assertions for arbitrary m.

## Required detailed checks

### Rank argument and edge cases

Status of the following checked deductions: **AI-proved**.

For a projective right module P split out of R^b, tensoring its splitting with Psi makes
`P tensor_R Psi` a right-module summand of `Psi^b`, hence finitely generated projective.
This justifies T. The split-exact relations defining K_0 are preserved. Associativity yields
the two rank identities. Vanishing of the common rank function at all finite-dimensional Y
therefore also implies vanishing after T, because HY is one of the test modules. The proof
uses this common kernel, not the generally noninvariant kernel of an individual evaluation.

On the finite-dimensional visible space the Fitting decomposition is applicable. The
nilpotent summand is killed by T^r. The span of the orbit of v_1 in the invertible summand is
T-stable; injectivity on this finite-dimensional span implies bijectivity. Every tail has the
same span. Evaluation at an eventually extinct Y annihilates this span, proving H^rY=0.
At r=0, the function v(Y)=dim Y is zero, so all test modules are zero and their extinction
time is 0. For Psi=0 and nonzero test modules, visible rank is 1 and nonzero modules die at
time 1. The zero module always has time 0.

In the commutative case, finite k-dimension implies finite length without any finite-type
hypothesis on R. The simple factors are finite-dimensional residue fields. Exactness of
`P tensor_R -` gives the displayed sum with the factor `[R/m:k]`, so non-algebraically-closed
fields cause no omission. Each irreducible component is connected; finitely many such
components give finitely many connected components. Local constancy then gives one rank on
each connected component, including the empty-spectrum/zero-ring case.

### Every entry in the finite-presentation table

For distinct i,j,k, coordinates not displayed in the draft are zero. The following are
identities for all integer r,s, not a finite sample. Status: **AI-proved**.

| Input types and parameters | Input weight evaluations, in the displayed order | Output weight |
| --- | --- | --- |
| U_i(r), U_j(s) | `(-(-r),-(-s))=(r,s)` | Identity; unchanged by conjugation |
| V_i(r), V_j(s) | `(r,s)` | Identity |
| U_i(r), V_j(s) | `(-(-r),s)=(r,s)` | Identity |
| W_ij(s), U_j(r) | `((s-r)-(-r),-(-r))=(s,r)` | Identity |
| W_ij(s), U_k(r) | `(s-0,-(-r))=(s,r)` | Identity |
| W_ij(s), V_i(r) | `(r-(r-s),r)=(s,r)` | Identity |
| W_ij(s), V_k(r) | `(s-0,r)=(s,r)` | Identity |
| U_i(r), W_ij(s) | `(-(-r),-r-(-(r+s)))=(r,s)` | `lambda_Uj(n)=-(-(r+s))=r+s` |
| W_ij(s), V_j(r) | `((r+s)-r,r)=(s,r)` | `lambda_Vi(n)=r+s` |

The listed kernel generators are integral bases, and `lambda_S(q_S)=1`. Therefore
`n-lambda_S(n)q_S` lies in the integral kernel, giving the claimed conjugation rule even
without assuming the torus embeds in either group. Both proposed group homomorphisms respect
the full relator sets; their composites fix all indexed generators, also for negative parameters.
“The last two cases” at 268 refers to the two noncommuting cases in the right column; the
arithmetic is correct despite the two-column arrangement.

### Commutators, matrix relations and independent central elements

Status of the universal calculations: **AI-proved**.

In the transfer calculation, the three available relations are `[x,v]=[q,p]=[q,v]=1`.
They give `xqx^-1=pqvp^-1v^-1=q[p,v]`. Since q commutes with both p and v, it commutes
with `[p,v]`, giving `[x,q]=[p,v]` on multiplying on the right by q^-1. Centrality is not
assumed. The substitution `s=c-a` has `s+d=b`; an auxiliary index treats two splittings
at the same index. Each U/V generator commutes with a representation at another index;
each W generator uses the third index. Torus conjugation shifts the two arguments oppositely.
Finally, `x^2 y x^-2 = z_N^2 y` and `x^2=1` imply `z_N^2=1`.

The translations beta_c preserve every relator family: both U parameters in a U/U relation
shift, only the U parameter in a mixed relation shifts, and the U output of the noncommuting
relation shifts by the same c. Composition on generators gives beta_c beta_d=beta_(c+d)
and inverse beta_(-c).

For the matrix checks the products of the two off-diagonal units, in both orders, are:

| Pair | AB | BA |
| --- | --- | --- |
| U_i,U_j | 0 | 0 |
| V_i,V_j | 0 | 0 |
| U_i,V_j, i!=j | `delta_ij E_15=0` | 0 |
| W_ij,U_h, h!=i | 0 | `delta_hi E_(1,j+1)=0` |
| W_ij,V_h, h!=j | `delta_jh E_(i+1,5)=0` | 0 |

For a composable pair E_ab,E_bc with distinct a,b,c, BA=0, AB=E_ac, and every product
of AB with A or B in either order is zero. In characteristic 2 the commutator expansion is
`1+xyAB`. The three choices `(1,i+1,j+1)`, `(i+1,j+1,5)`, `(1,i+1,5)` give both
noncommuting relators and the image of z_N, respectively. The diagonal conjugation factors
are exactly the three weights. E_15 annihilates all listed off-diagonal units on both sides,
and the diagonal entries at 1 and 5 agree, proving centrality in F_m.

Monic division gives the m-element polynomial basis, even when m is even and the ring is
nonreduced. At m=1, t=1 and D_l=1, but `1+E_15` is nonidentity, so Z_1 has order 2.
All negative powers exist since t^m=1. The central subset product has coefficient
`sum c_q t^q`, which is zero exactly for the empty subset. For arbitrary distinct integer
indices, including negative ones, choosing m greater than their diameter makes their residues
distinct; for a singleton m=1 suffices. Thus every nonempty product is detected. The argument
does not assert that these involutions generate the whole centre.

### Character, iterates, final remark and the section 6 interface

Status with F1's intended range restored: **AI-proved**.

The idempotent `(1+z_0)/2` is available over C. The finite algebra presentation uses thirty
symbols for fifteen group generators and their inverses, and the two universal-property maps
are inverse. For general twisted-corner data, centrality of e makes `alpha(r)eR` lie in eR
even when alpha is merely an endomorphism. The two tensor maps in the example are balanced
and respect the twisted left action.

For the iterate lemma alpha is an automorphism, so all alpha^q(e) are central. At stage j,
the operator e on the twisted module is alpha^j(e), giving p_(j+1)Y. The next action is
alpha^j(alpha(r))=alpha^(j+1)(r), not the inverse twist. Restrictions of a module map to
these images commute with the identifications, giving naturality. The empty product at j=0
returns Y.

The repaired character is explicitly `chi_m(product zbar_q^c_q)=(-1)^c_(m-1)`.
The identity coefficient of p_chi is nonzero. Substituting u=hz gives
`chi_m(h^-1 u)^-1=chi_m(h)chi_m(u)^-1`, hence `h p_chi=chi_m(h)p_chi`.
Centrality transfers the same scalar action to all of `(C F_m)p_chi`.
For m=1 the positive-sign list is empty and e_0 kills a nonzero Y_1.
For all m, p_j acts as the identity for j<m and as zero for j>=m.

In the final remark choose rows j=0,...,s-1 and columns Y_m, m=1,...,s. The entries
are `dim Y_m` for j<m and zero for j>=m: the diagonal (row j=m-1) is nonzero.
For the induced-module assertion, representatives f of the cosets f Z_m give a basis
`f tensor 1` of induction. The map `f tensor 1 -> f p_chi` is balanced; the images have
nonzero, disjoint coset supports and span Y_m. Thus its dimension is `[F_m:Z_m]`.
R,e,alpha and hence Psi were chosen independently of m. No automorphism of F_m is required.

The definition supplies exactly the data used by section 6: columns of R^n have right-module
endomorphisms M_n(R), the splitting yields epsilon, and the left action yields the unital
map `rho:R -> epsilon M_n(R)epsilon`. The coincident scalar actions ensure k-linearity.
The matrix formula for HY and its left action follows by tensoring the right-module splitting.
If Psi=0 one can take n=1, epsilon=0 and rho=0. Finite presentation of R is imposed
separately at section 6 lines 6–7, 433 and 735–736. In the special case n=1,
`rho(r)=e alpha(r)e` is multiplicative because e is central; left projectivity of Psi is
not needed. The current wording also resolves F2; no definition/use mismatch was found.

## Citation checks and limits

- **Stacks 00NX**, [Lemma 10.78.2](https://stacks.math.columbia.edu/tag/00NX), read live on
  2026-10-08. Condition (2), finite projectivity, implies condition (8), whose rank function
  “is locally constant in the Zariski topology.” This is exactly the implication used for P.
  No noetherian or finite-type assumption is needed for this part.
- **Stacks 00FR**, [Lemma 10.31.6](https://stacks.math.columbia.edu/tag/00FR), read live on
  2026-10-08: “If R is a Noetherian ring then Spec(R) has finitely many irreducible components.”
  The hypothesis holds in corollary case (ii). The passage to connected components is justified above.
- **Schofield**, [local PDF](<Sch07a - Universal Localisations of Hereditary Rings.pdf>),
  banner arXiv:0708.0257v1, 2 August 2007 (the printed title-page date is October 25, 2018).
  Printed p. 2 fixes hereditary to mean left and right hereditary; Theorem 2.3, pp. 3–4,
  parametrises all universal localisations of a right hereditary ring by well-placed subcategories.
  These are exact abelian full subcategories of finitely presented modules closed under extensions.
  The article uses right modules, as is explicit in its tensor notation. Lemma 4.1, p. 9, states:
  “The map from K_0(R) to K_0(R_E) is surjective.” The cited maps become the maps in F5's notation.
  The proof represents a localisation-projective as an induced finitely presented module and
  tensors a length-one projective resolution.
- **Schofield standing injectivity qualification:** p. 4 says the paper will “usually assume”
  that R embeds in the localisation and describes reduction by the trace ideal of the killed
  projectives. Lemma 4.1 itself is not restricted in its statement. Even under the conservative
  injective reading, the reduction in the permitted O.3 audit supplies the missing bridge here:
  for B finite-dimensional hereditary and trace ideal I, I^2=I. Put C=B/I. Then
  `Tor_1^B(C,C)=I/I^2=0`. For a finite right C-module M, choose `0->L->C^n->M->0`.
  The tensor sequence shows `Tor_1^B(M,C)=0` because `L tensor_B C=L` and its map into C^n
  is the original injection. Tensoring a finite length-one B-projective resolution gives a
  length-one C-projective resolution. The left-module argument is identical, so C is again
  finite-dimensional hereditary. For a projective C-module Q that resolution splits over C,
  giving `[Q]=[P_0 tensor_B C]-[P_1 tensor_B C]`; hence the right K_0 map B->C is surjective.
  Applying the cited result to the reduced localisation gives the claimed finite generation.
  Thus this review finds no substantive citation gap for noninjective localisations.
- **Santos Rego**, [local PDF](<Reg19 - On the Finiteness Length of Some Soluble Linear Groups.pdf>),
  arXiv:1901.06704v3, 20 April 2021. Read printed/PDF pp. 1, 6 and 24–28.
  R is commutative and unital; the commutator is xyx^-1y^-1. Proposition 4.9 (p. 24)
  identifies U_n(R) with the relevant colimit for n>=4. Its proof fixes an additive generating
  set containing 1. On p. 26, (4.9) transfers `[e_1j(t),e_jn(1)]` between intermediate
  indices and equates it with `[e_1j(1),e_jn(t)]`; (4.10) asserts centrality of e_1n(s).
  The arguments on pp. 27–28 justify the draft's limited parallel of mechanisms. The draft
  does not apply the colimit theorem directly to G, whose W types occur in both index orders.
- **Main preprint Section 2**, `build/sections/02-selection-process.tex`, read for the general
  endomorphism case (lines 4–16), attribution (37–42), and construction/character/iterate
  comparison (314–376), alongside the full group dossier. The draft's claims of origin match;
  the lost character bound is recorded in F1.

The prescribed dossier and O.3 passages were compared with the independent calculations; their
status labels were not treated as evidence. Three read-only subagents supplied additional checks
of the group, rank/citations and forward interface. Their model variants/effort were not exposed;
their reports were checked against the permitted sources and calculations before inclusion.

No LaTeX build was run, no manuscript source was edited, and no global bibliography or
cross-reference audit was attempted. In particular, `sec:simulation` is a reference to a later
section outside the requested forward check; this audit checks the fixed-data assertion, not
that later simulation theorem. The whole-K-group claim F6 remains unsupported in the restricted
source set, rather than being silently supplemented with a new literature search.

Initial draft SHA-256: `fcc729a11e1aa612cfa344cba5cfc8a04ee3e76898eb9e93135e4f0d46bc2669`.
Initial forward section SHA-256: `df7eec41638b611c6855a2252b79dd4e250c702b4b387b3149326ca52fdcdbd2`.
Final reviewed draft SHA-256: `d0a488bd4ffe7bbbf081d630089f1feea9a32e0a2eb662efb754d4a166313919`.
Final forward section SHA-256: `e9680092008b59e41b6475e60aa0462c83d42fa3b1ba3018e88140f002af1742`.
