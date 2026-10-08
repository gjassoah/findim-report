Model: unknown; effort: unknown.

# V-C: fresh-context verification of the selection-group dossier

Date: 2026-10-08. Review complete. This is an AI audit, not human
certification. The runtime does not supply a reliable exact model or effort
identifier, so neither is inferred from project defaults.

The mathematical inputs are `scratch/V-C-frozen.md` (910 lines; SHA-256
`ae53f829e242d4cd549af38db94bb55882192471913330f7320908b664155ffb`)
and the initial `audit/report-notation.md` (39 lines; SHA-256
`18f7d074a008866cefe229e6c2d8cd0025dc5d71874adf5c5427958919227488`).
The notation file changed during the review. Its current 39-line version
was reread before completion (SHA-256
`f69ee451cfbff429f46196434626154173f6ed52cc4657c8c8976e20fd6db8d5`).
The changes concern syzygies and Toda brackets; neither is used here.
The frozen dossier's hash is unchanged.
The repository instructions, README, progress summary, working rules and
`codex/tasks/V-C.md` were read for governance. No prohibited proof or audit
file is used as evidence. This job modified only this report and made no
commit or push.

Verdicts distinguish an error from a missing argument. A finding labelled
AI-proved has a written mathematical justification here; a finite computation
has status supported in precisely its recorded cases. Neither status means
author certification. Earlier status labels in the dossier are not evidence.

## Coverage and findings

### 1. Presentation and central-element arguments

The verdicts in this subsection are **no error found**; the checked assertions
have audit status **AI-proved**. This records an adversarial proof check,
without adopting the dossier's previous assessments.

| Statement in the frozen dossier | Verdict | Check |
| --- | --- | --- |
| Definition of G, lines 52–100 | no error found | Twelve indexed types and three commuting torus generators; the commutator is xyx⁻¹y⁻¹. All indices and integer parameters have the stated ranges. |
| Integral kernels and q-vectors, lines 117–140 | no error found | For U_i,V_i the kernel is n_i=0; for W_ij it is n_i=n_j. The displayed vectors generate these kernels over Z and each λ_S(q_S)=1. |
| All-index conjugation from finite relators, lines 144–162 | no error found | Decompose n as λ_S(n)q_S plus a kernel vector. Commuting torus words move the kernel factor past T^{rq_S}; this does not require the torus map Z³→P to be injective. |
| Nine integral-preimage rows, lines 164–200 | no error found | Both input weights were evaluated in every row, including both possibilities h=j,k and h=i,k. The two output weights equal r+s. |
| Finite presentation on fifteen group generators, lines 197–225 | no error found | All indexed relators follow; conversely all finite relators hold in G. The displayed maps fix the torus and have identity composites on every generator. |
| Transfer identity (2.2), lines 270–300 | no error found | Uses only [x,v]=[q,p]=[q,v]=1, all instances of G3. No same-type commutation or prior centrality is used. |
| Independence of i,a,b at fixed sum, lines 304–314 | no error found | Set the middle parameter to c−a, with last parameter d. For equal internal indices, pass through any different index. All integers, including negative ones, are allowed. |
| Centrality, lines 318–333 | no error found | A different internal index handles U,V; the third internal index handles W. The opposite torus shifts preserve a+b. Every generator family is covered. |
| Square relation, lines 335–337 | no error found | If c=[x,y] is central, conjugation twice by x gives c²y; x²=1 forces c²=1. Exact order is correctly deferred. |
| All translations β_c, their group law, and shift of z_N, lines 349–398 | no error found | G1 and G2 remain instances of themselves; G3 translates the appropriate independent parameters, G4U translates its U parameter, G5U translates input and output by c. The remaining families are fixed. β_{−c} is a two-sided inverse. |

For the integral-preimage table, in its own parameter order the evaluations
are (r,s) in the first three rows and G5U, and (s,r) in the other five
rows. In G5U, −n_j=r+s; in G5V, n_i=s+r. In particular, rational linear
independence of weights is never substituted for integral surjectivity.

The potentially delicate step in the transfer calculation can be checked
without an assumed central commutator. From xwx⁻¹=pw and [x,v]=1,

\[
xqx^{-1}=p(wvw^{-1})p^{-1}v^{-1}
         =pqvp^{-1}v^{-1}=q[p,v].
\]

The two relations [q,p]=[q,v]=1 make q commute with [p,v], so
[x,q]=q[p,v]q⁻¹=[p,v]. Here q=V_i(s+b), p=U_j(a+s), and i≠j,
which is exactly the index restriction needed for both commutations.
The subsequent independence argument precedes every use of centrality;
there is no circularity.

The source `build/sections/02-selection-process.tex`, lines 46–240, was
read in full for comparison. Its definitions agree with the frozen input.
Its table at lines 135–145 agrees after converting the target pair to the
source's uniform (r,s) convention. Its transfer derivation at lines 189–208
uses the same three commutations. These comparisons do not supply premises
missing from the independent calculations above.

### 2. Finite quotients and independence

All verdicts in this subsection are **no error found**, with audit status
**AI-proved** for the mathematical assertions.

| Statement in the frozen dossier | Verdict | Check |
| --- | --- | --- |
| Ring S_m and its basis, lines 408–439 | no error found | A monic polynomial of degree m gives an F₂-basis 1,t,…,t^{m−1}; t^m=1 makes negative powers legitimate. This includes m=1 and non-reduced even-m rings. |
| Invertibility and diagonal conjugation, lines 443–461 | no error found | (I+cE_ab)²=I in characteristic two for a≠b; diagonal conjugation multiplies E_ab by d_a/d_b, giving precisely the signed weights. |
| All matrix commutations and G5 relations, lines 463–497 | no error found | The five zero-product rows cover exactly G3 and G4. For distinct a,b,c, E_ab E_bc=E_ac and all reverse and higher terms in (4.3) vanish. |
| Finite quotient F_m, lines 498–500 | no error found | F_m is the image, hence a quotient of G, inside a finite matrix group. No surjectivity onto GL₅(S_m) is asserted. |
| Central images and Z_m≅(Z/2)^m, lines 504–528 | no error found | z_N maps to I+t^N E_15; E_15 has zero products with every relevant off-diagonal unit, and the endpoint diagonal entries agree. A subset product has coefficient ∑c_qt^q, which vanishes exactly for the empty subset. |
| Exact order and independence of the entire family, lines 530–540 | no error found | t^N is a non-zero unit. For a non-empty finite set of distinct integers, choose m larger than its diameter; reduction modulo m separates all indices, including negative ones. Every non-empty product survives. |

The use of both W_ij and W_ji causes no additional requirement: the
presentation contains no relation between those two types. In particular,
the matrix argument never assumes that F_m is upper unitriangular. For
each G5 calculation its three matrix indices are distinct, so using the
formula for a chain of two matrix units is legitimate in both index orders.

The last row identifies the subgroup generated by the z_N with
⊕_{N∈Z} Z/2; it does not identify the whole centre. Every possible finite
relation is a product with exponents reduced modulo two, which explains
why the finite-subset argument suffices.

### 3. Group algebra, left modules, and extinction

All verdicts in this subsection are **no error found**, with audit status
**AI-proved** for the mathematical assertions.

| Statement in the frozen dossier | Verdict | Check |
| --- | --- | --- |
| Finite algebra presentation, lines 595–613 | no error found | Thirty free algebra symbols encode the fifteen group generators and their inverses. Both inverse equations are imposed. The two maps obtained from the group presentation and linear extension fix the generating symbols. |
| Algebra automorphism and central idempotents, lines 615–626 | no error found | Linear extension of α_G and its inverse gives inverse unital C-algebra maps. z₀²=1 yields e²=e; α^q(e)=(1+z_q)/2. Division by two occurs in C, not in S_m. |
| Definition and functoriality of H, lines 569–591 and 630–635 | no error found | Centrality makes eY an R-submodule, morphisms restrict, and restriction of scalars along the unital map α defines a left action. Additivity and preservation of finite dimension follow on underlying vector spaces. |
| Tensor description, lines 637–649 | no error found | Ψ has left action r·x=α(r)x and ordinary right multiplication. The product map Ψ⊗_R Y→_α(eY) is balanced and left linear; v↦e⊗v is inverse. No opposite ring is missing. |
| Natural iterate formula for arbitrary modules, lines 651–670 | no error found | At stage j, e acts by α^j(e); the next subspace is e_jp_jY, and the next action is α^j∘α=α^{j+1}. Every p_j is central. The empty product gives j=0, and the underlying restricted morphism gives naturality. No finite-generation hypothesis is used. |
| Character and non-zero module, lines 690–750 | no error found | Independence makes χ_m a character. The identity coefficient of p_χ is 2^{−m}; hp_χ=χ_m(h)p_χ by the substitution u=hz. Centrality extends that character to every fp_χ. Averaging gives p_χ²=p_χ. |
| Induction description and dimension, lines 752–761 | no error found | C[F_m] is free as a right C[Z_m]-module on left coset representatives fZ_m. The balanced map f⊗1↦fp_χ has non-zero images with disjoint supports, giving dimension [F_m:Z_m]. |
| Exact extinction for every m≥1, lines 681–688 and 765–787 | no error found | On Y_m, e₀,…,e_{m−2} act as 1 and e_{m−1} as 0. Thus p_jY_m=Y_m for j<m and 0 for j≥m. At m=1 the positive-sign list is empty and H⁰(Y₁)≠0 while H(Y₁)=0. |
| One fixed triple, independent of m, lines 783–787 | no error found | G, R, e and α are fixed first. Only the quotient and the module depend on m. Restriction of scalars is performed over R; descent of α to F_m is unnecessary. |

The binding left-module convention is respected throughout. In particular,
the second stage is _{α²}(α(e)eY), not a selection by α⁻¹(e). The complex
and stable-category degree conventions do not enter these arguments:
all modules here are ordinary modules, and the exponent j of H is explicitly
declared to mean iteration. The general iterate lemma assumes that α is
an automorphism; it makes no claim that a general endomorphism preserves
the centre. The extinction statement concerns the particular C[G] triple,
not an arbitrary triple from the general iterate lemma.

The source at `build/sections/02-selection-process.tex`, lines 251–377,
was read in full. Its matrix indices are lower by one. Its algebra
presentation, character, iterate formula and m=1 boundary case agree with
the frozen dossier. Source lines 4–17 were also read to check the precise
meaning of restriction of scalars.

### 4. Independent exact checks

Status: **supported** in the finite cases below. These checks were written
from the definitions during this review; no earlier computation was opened
or reused. They do not replace the universal arguments in §§1–3.

The one-file restriction takes precedence over the standing preference for
separate computation files. The code was executed in memory, and its complete
source and output are saved in this report. No script or output file was
created under `computations/` or elsewhere.

The weight check tests integral unimodularity and both coefficients of every
linear preimage formula. The matrix check uses carryless polynomial
multiplication followed by reduction modulo t^m+1, and ordinary sparse matrix
multiplication. It tests every residue of every input parameter for m=1,…,8,
all permitted indices, positive and inverse diagonal conjugation, the central
commutator, and all central subset products. Additional negative arguments
were tested. At m=3, replacing TST⁻¹ by T⁻¹ST while retaining the same shift
is explicitly detected as a failure.

Over the rational group algebra of (Z/2)^m, all 126 characters for m=1,…,6
were tested for character action, averaging idempotency, and repeated
selection with the current action followed by the forward twist. This is
a test of the central action, not construction of the full Y_m for m>1.
For m=1 the actual quotient F_1 was enumerated from its twelve elementary
generators: 21,504 matrices and 10,752 central cosets. All generator actions
permute those cosets; the vectors f(1−z₀)/2 give the non-zero left module,
and z₀ acts by −1. Thus the boundary case was checked on the actual quotient.

The two word identities in Santos Rego's Lemma 4.7 were also reduced freely
to the empty word with the stated commutator convention. This is an
algebraic word check, independent of the finite matrix tests.

Executed with system Python 3, exit status 0. Saved output:

```text
weights: 12 unimodular kernel/right-inverse bases; 54 rows x 2 coefficient tests PASS
matrix m=1: 190 equalities and 2 distinct central products PASS
matrix m=2: 486 equalities and 4 distinct central products PASS
matrix m=3: 922 equalities and 8 distinct central products PASS
matrix m=4: 1500 equalities and 16 distinct central products PASS
matrix m=5: 2224 equalities and 32 distinct central products PASS
matrix m=6: 3102 equalities and 64 distinct central products PASS
matrix m=7: 4150 equalities and 128 distinct central products PASS
matrix m=8: 5400 equalities and 256 distinct central products PASS
central modules: 126 characters for m=1..6; idempotency, left character, forward iterates j=0..m+2 PASS
actual F_1: 21504 matrices; Y_1 has 10752 coset vectors; all 12 generator permutations PASS
on Y_1, z_0=-Id, H^0 nonzero and H(Y_1)=0 PASS
Santos Rego Lemma 4.7: both identities freely reduce to the identity PASS
```

### 5. Sources and a local correction in a cited proof

The preprint source was read at every locator cited in the dossier:
`build/sections/02-selection-process.tex`, lines 4–17, 19–42, 46–167,
175–240, 251–305, and 313–377; also `build/references.bib`, entry
`Rego2022`. Verdict: **no error found** in those comparisons.

The source hashes are:

- `build/sections/02-selection-process.tex`:
  `2dbb052ffbf54fd4d553df2ea707806b9bf05ae8477565c7f8fde936f532d948`.
- `build/references.bib`:
  `df89f9700636e9db334530b623562df090a567d0b4a4238eb11de82eacc2ea44`.
- Library PDF `Reg19 - On the Finiteness Length of Some Soluble Linear Groups.pdf`:
  `a591e58b50d4d969500be742995a548aecff48543f62dd98553f2c03d9e190be`.

For [Santos Rego, arXiv:1901.06704v3](https://arxiv.org/abs/1901.06704v3),
the version banner and date were checked against the live record. Read:
p. 1 (ring convention), p. 6 (commutator convention), p. 23 (Lemma 4.7),
pp. 24–28 (Proposition 4.9 and the relevant proof). Pages 26–28 were
also rendered and inspected. The bibliography's v3 link matches.
Verdict for the dossier's comparison: **no error found**; status **cited**.

A **source typo** occurs on p. 27, in the last calculation's first line.
After choosing b=e₂₃(t), the displayed conjugating word ends with
e₂₃(1)⁻¹. Replace that last factor by e₂₃(t)⁻¹ to obtain bcb⁻¹.
The correction matches Hall's identity and the following line.
This is not a counterexample to (4.9), and the dossier does not use this
calculation as a premise. [Pinned PDF, p. 27](https://arxiv.org/pdf/1901.06704v3#page=27).

A citation precision issue also occurs in the first calculation for (4.10)
on p. 28: the terminal label “(4.4)” needs the cross-index commutations
(4.8), with (4.5) and (4.7) supplying the exceptional pairs when n=4.
Those relations are already available; this is not a missing lemma.
[Same PDF, p. 28](https://arxiv.org/pdf/1901.06704v3#page=28).

Status of these two local observations and repairs: **AI-proved**. The
dossier's attribution remains accurate. This review does not claim a
verification of all of Proposition 4.9 or of unrelated results in that paper.

### 6. Wording versus proof, and limits of the audit

No mathematical statement in dossier §§1–6 has wording stronger than its
proof. In particular:

- “Fifteen generators” refers to the group; the algebra presentation
  explicitly has thirty symbols.
- Exact order two is asserted only after the finite images are constructed.
- The infinite independent central family is not claimed to exhaust Z(G).
- The general iterate formula explicitly assumes an automorphism and
  permits arbitrary modules.
- Extinction is asserted for the particular fixed C[G] triple and all
  integers m≥1; the zero module is excluded by construction.
- H^j denotes iteration by an explicit local convention, not cohomology,
  a stable shift, or a degree-j component.

The mismatch in the cited source between the selected b and its displayed
inverse is listed separately in §5. It is not a mismatch between a theorem
statement and the theorem's conclusion.

The frozen excerpt has incomplete prose at lines 227, 339, 400 and 672.
The surrounding mathematical arguments are complete; these fragments should
be restored or removed before manuscript use. The two computation links
at lines 854–856 retain paths relative to another location. Neither issue
creates a mathematical premise.

The procedural assertions in §§0 and 8 about previous sessions, scripts,
saved outputs and the order in which they were read were not authenticated.
Their referenced artifacts were not opened. This review supplies its own
checks and does not adopt the claimed historical computation results.
No prohibited notes, other audit files, ledger, logs, escalations or Codex
outputs were opened.

All requested mathematical statements and their local lemmas have been
covered above. No mathematical error or proof gap was found in dossier
§§1–6. The substantive caution is the limited scope of the computer checks;
the universal conclusions rest on the written arguments, not on the finite
range. No human-certification status is assigned.

### Appendix: exact code used for this audit

```python
# Claim: independent checks of the frozen V-C weights, finite matrices, and modules.
# Cases: all weight types/rows; m=1..8 matrices; m=1..6 central characters; full F_1.
# Conventions: [x,y]=xyx^-1y^-1; left actions; cyclic F_2 polynomials; forward twist.
from itertools import permutations, product
from fractions import Fraction
from collections import deque

def vec(**entries):
    out=[0,0,0]
    for k,v in entries.items(): out[int(k)]=v
    return out
def v3(i,a,j=None,b=0,k=None,c=0):
    x=[0,0,0]; x[i]=a
    if j is not None: x[j]=b
    if k is not None: x[k]=c
    return x
def dot(a,b): return sum(x*y for x,y in zip(a,b))
def det(a,b,c):
    return (a[0]*(b[1]*c[2]-b[2]*c[1])
           -b[0]*(a[1]*c[2]-a[2]*c[1])
           +c[0]*(a[1]*b[2]-a[2]*b[1]))
types=[]
for i in range(3):
    for kind,sgn in [('U',-1),('V',1)]:
        w=v3(i,sgn); q=v3(i,sgn)
        ker=[v3(h,1) for h in range(3) if h!=i]
        types.append((kind,i,None,w,q,ker))
for i,j in permutations(range(3),2):
    k=3-i-j
    types.append(('W',i,j,v3(i,1,j,-1),v3(i,1),[v3(i,1,j,1),v3(k,1)]))
for _,_,_,w,q,ker in types:
    assert dot(w,q)==1 and all(dot(w,b)==0 for b in ker)
    assert abs(det(q,*ker))==1
rows=0
for i,j in permutations(range(3),2):
    k=3-i-j
    U=lambda a:v3(a,-1)
    V=lambda a:v3(a,1)
    W=v3(i,1,j,-1)
    for r,s in [(1,0),(0,1)]:
        cases=[
          (U(i),U(j),v3(i,-r,j,-s),(r,s),None),
          (V(i),V(j),v3(i,r,j,s),(r,s),None),
          (U(i),V(j),v3(i,-r,j,s),(r,s),None),
          (W,U(j),v3(i,s-r,j,-r),(s,r),None),
          (W,U(k),v3(i,s,k,-r),(s,r),None),
          (W,V(i),v3(i,r,j,r-s),(s,r),None),
          (W,V(k),v3(i,s,k,r),(s,r),None),
          (U(i),W,v3(i,-r,j,-r-s),(r,s),U(j)),
          (W,V(j),v3(i,s+r,j,r),(s,r),V(i))]
        for a,b,n,target,out in cases:
            assert (dot(a,n),dot(b,n))==target
            if out is not None: assert dot(out,n)==r+s
            rows+=1
print('weights: 12 unimodular kernel/right-inverse bases; 54 rows x 2 coefficient tests PASS')

for m in range(1,9):
    mod=(1<<m)|1
    def ringmul(a,b):
        c=0
        while b:
            if b&1: c^=a
            a<<=1; b>>=1
        while c.bit_length()>m:
            c ^= mod<<(c.bit_length()-m-1)
        return c
    def mm(a,b):
        c={}
        for (i,k),x in a.items():
            for (l,j),y in b.items():
                if k==l: c[i,j]=c.get((i,j),0)^ringmul(x,y)
        return {ij:x for ij,x in c.items() if x}
    one={(i,i):1 for i in range(5)}
    def elem(i,j,r):
        a=one.copy(); a[i,j]=1<<(r%m); return a
    def diag(i,r):
        a=one.copy(); a[i+1,i+1]=1<<(r%m); return a
    def U(i,r): return elem(0,i+1,r)
    def V(i,r): return elem(i+1,4,r)
    def W(i,j,r): return elem(i+1,j+1,r)
    def z(r): return elem(0,4,r)
    def cm(a,b): return mm(mm(mm(a,b),a),b) # inputs are involutions
    def image(t,r):
        kind,i,j=t[:3]
        return U(i,r) if kind=='U' else V(i,r) if kind=='V' else W(i,j,r)
    nchecks=[0]
    def eq(a,b):
        assert a==b, (m,a,b)
        nchecks[0]+=1
    for i in range(3):
        eq(mm(diag(i,1),diag(i,-1)),one)
        for j in range(3): eq(mm(diag(i,1),diag(j,1)),mm(diag(j,1),diag(i,1)))
    for t in types:
        for r in range(m):
            a=image(t,r)
            eq(mm(a,a),one)
            for ell in range(3):
                eq(mm(mm(diag(ell,1),a),diag(ell,-1)),image(t,r+t[3][ell]))
                eq(mm(mm(diag(ell,-1),a),diag(ell,1)),image(t,r-t[3][ell]))
    for i,j in permutations(range(3),2):
        for r,s in product(range(m),repeat=2):
            for a,b in [(U(i,r),U(j,s)),(V(i,r),V(j,s)),(U(i,r),V(j,s))]:
                eq(cm(a,b),one)
            for h in range(3):
                if h!=i: eq(cm(W(i,j,s),U(h,r)),one)
                if h!=j: eq(cm(W(i,j,s),V(h,r)),one)
            eq(cm(U(i,r),W(i,j,s)),U(j,r+s))
            eq(cm(W(i,j,s),V(j,r)),V(i,r+s))
    for r,s in product(range(m),repeat=2):
        for i in range(3): eq(cm(U(i,r),V(i,s)),z(r+s))
    for n in range(m):
        for t in types:
            for r in range(m): eq(mm(z(n),image(t,r)),mm(image(t,r),z(n)))
        for ell in range(3): eq(mm(z(n),diag(ell,1)),mm(diag(ell,1),z(n)))
    for subset in range(1<<m):
        a=one
        for q in range(m):
            if subset>>q&1: a=mm(a,z(q))
        expected=one.copy()
        if subset: expected[0,4]=subset
        eq(a,expected)
    for r in [-2*m-1,-m,-1,m,2*m+1]:
        for i in range(3):
            eq(mm(mm(diag(i,1),U(i,r)),diag(i,-1)),U(i,r-1))
        eq(cm(U(0,r),V(0,-r-1)),z(-1))
    if m==3:
        assert mm(mm(diag(0,-1),U(0,0)),diag(0,1)) != U(0,-1)
    print(f'matrix m={m}: {nchecks[0]} equalities and {1<<m} distinct central products PASS')

def conv(a,b):
    out=[Fraction(0) for _ in a]
    for i,x in enumerate(a):
        for j,y in enumerate(b):
            out[i^j]+=x*y
    return out
nchars=0
for m in range(1,7):
    d=1<<m
    for mask in range(d):
        p=[Fraction((-1)**((a&mask).bit_count()),d) for a in range(d)]
        assert p[0]==Fraction(1,d)
        assert conv(p,p)==p
        for q in range(m):
            translated=[p[a^(1<<q)] for a in range(d)]
            assert translated==[(-1 if mask>>q&1 else 1)*x for x in p]
        # Iterate H directly on current generator actions, which are XOR translations.
        action=[1<<q for q in range(m)]
        stage=p[:]
        for j in range(m+3):
            expected=p[:] if not any(mask>>(q%m)&1 for q in range(j)) else [0]*d
            assert stage==expected
            stage=[(stage[a]+stage[a^action[0]])/2 for a in range(d)]
            action=action[1:]+action[:1]
        nchars+=1
print(f'central modules: {nchars} characters for m=1..6; idempotency, left character, forward iterates j=0..m+2 PASS')

# Enumerate the actual F_1, using elementary row additions, not group-order formulas.
one5=tuple(1<<i for i in range(5))
positions=[(0,i) for i in range(1,4)]+[(i,4) for i in range(1,4)]+list(permutations(range(1,4),2))
def rowadd(f,a,b):
    g=list(f); g[a]^=g[b]; return tuple(g)
seen={one5}; todo=deque([one5])
while todo:
    f=todo.popleft()
    for a,b in positions:
        g=rowadd(f,a,b)
        if g not in seen: seen.add(g);todo.append(g)
reps={f for f in seen if f[0]&16==0}
assert len(seen)==21504 and len(reps)==10752
assert {rowadd(f,0,4) for f in reps}==seen-reps
for a,b in positions:
    perm=set()
    for f in reps:
        g=rowadd(f,a,b)
        if g[0]&16: g=rowadd(g,0,4)
        perm.add(g)
    assert perm==reps
print('actual F_1: 21504 matrices; Y_1 has 10752 coset vectors; all 12 generator permutations PASS')
print('on Y_1, z_0=-Id, H^0 nonzero and H(Y_1)=0 PASS')

# Free-group verification of the two identities quoted as Lemma 4.7.
def inv(w): return [-a for a in w[::-1]]
def comm(a,b): return a+b+inv(a)+inv(b)
def red(w):
    st=[]
    for a in w:
        if st and st[-1]==-a: st.pop()
        else: st.append(a)
    return st
a,b,c=[1],[2],[3]
assert not red(comm(a+b,c)+inv(a+comm(b,c)+inv(a)+comm(a,c)))
hall=comm(c+a+inv(c),comm(b,c))+comm(b+c+inv(b),comm(a,b))+comm(a+b+inv(a),comm(c,a))
assert not red(hall)
print('Santos Rego Lemma 4.7: both identities freely reduce to the identity PASS')
```
