Model: GPT-6 (Codex); effort: unknown.

# V-C23 verification report

Date: 2026-10-08. Completed after incremental recording of the checks below.

Scope: the claims and proofs in `scratch/V-C23-frozen.md`, with
`audit/report-notation.md` binding. Repository governance and the task file were
read; their summaries of earlier mathematical work are not evidence for this
audit. No excluded notes, reports, logs, prior audits, or other agents' outputs
are used. The only file modified by this job is this report. Computations are
recorded here as reproducible code and output, without creating another file.

The verdicts below concern the submitted wording and argument, not human
certification. Supporting mathematical arguments in this report carry the status
AI-proved when complete; finite checks carry the status supported. Unresolved
claims remain plausible at most. Source claims are identified as cited only
after their locators and hypotheses have been read.

## Verdict table

| Statement | Verdict | Scope or finding |
|---|---|---|
| 7.3 | No error found | Explicit formulas and choice-dependent lifting are distinguished correctly; the simple count is `3(l+2)`. |
| 8.7 | No error found | Conditional on AR as stated; nine simples, and infinite **left** findim for `End_Λ(Λ⊕Z′)` without `op`. |
| 8.8, specified representatives | No error found | Independent exact arithmetic gives `dim Λ=170271818183326072615867045851312256`. |
| 8.8, minimal-data computation and lower bound | Gap | Matrices and computation are omitted; unfinished intermediate dimensions do not bound the final algebra. |
| 9.1, lemma/application/sharp form | No error found | Grading argument, twist signs, and necessary weight equality checked, retaining the stated scalar-target and zero-indeterminacy setting. |
| 9.2 | No error found | Complete periodic resolution and chain identities checked explicitly and by exact arithmetic. |
| 9.3, theorem and bracket consequence | No error found | Tate duality and Toda composition argument checked, including zero classes. |
| 9.3, assertion about every design | Gap | Requires a definition of the class of designs and its invariant `c`; the proof checks the specified bracket. |
| 9.3, following interpretation | Error found | The tensor-square simple still satisfies the theorem's hypotheses; `dim Ext³=2` is not a failure of any hypothesis. |
| 9.4, all three bullets | Gap | Actual algebras/modules and reproducible computational evidence are missing. |

## 8.7: no error found, conditional on the stated AR hypothesis

Status: AI-proved for the implication. The AR existence theorem is an assumed
input here, not reverified in this job. The cited AR Theorem 1.1 was read in
`.cache/ar-src/01-introduction.tex:26–38`; it explicitly states
`Λ/rad Λ ≃ k^8`. Thus it supplies split basicness as well as the eight simple
isomorphism classes. Its field and left-module conventions agree with the
dossier. The locator 3.4 (C-1) is absent from the permitted frozen input; it was
not opened. The following independent argument checks the required implication
and its side convention without relying on that locator.

Put `M=Z′`, `G=Λ⊕M`, and `E=End_Λ(G)` with ordinary composition. Additivity in
both arguments gives `Ext^i_Λ(M,G)=0` for every `i>0`. For a projective
resolution of `M`, applying `Hom_Λ(−,G)` gives an exact sequence

```
0 → Hom(M,G) → Hom(P₀,G) → Hom(P₁,G) → ⋯ .
```

These are finitely generated projective **left E-modules**, with action by
postcomposition: all arguments belong to `add(G)`. The contravariant functor
`Hom_Λ(−,G)` is fully faithful on `add(G)` (first for finite sums of `G`, then
for summands). Its first injection cannot split, since a retraction would
correspond to a section of `P₀ → M`, making `M` projective.

For each `n≥1`, truncate after `Hom(P_{n−1},G)` and denote its cokernel by
`L_n`. This is a projective resolution of `L_n` of length `n`. After applying
`Hom_E(−,Hom(M,G))`, the identity of `Hom(M,G)` is not in the image of the last
differential, precisely because the first injection did not split. Hence
`Ext_E^n(L_n,Hom(M,G))≠0`, and `pd_E L_n=n`. (If the original resolution
terminated, its dual exact sequence would force that same first injection to
split by descending induction; therefore this construction exists for every
`n`.) Consequently `findim_left E=∞`, equivalently `findim_right Γ=∞` for
`Γ=E^op`. The submitted opposite convention is correct; it does **not** assert
infinite left finitistic dimension for `Γ`.

The indecomposable summand classes of `G` are the eight projective classes of
`Λ` and the new class `M`. The projectives over `E` (and over `Γ`) therefore
have nine isomorphism classes of indecomposable summands, hence nine simple
classes. Repeated summands in the regular module of a nonbasic algebra change
multiplicities, not this count. The parenthetical basicness qualification is
unnecessary: the same count holds without it. Krull–Schmidt also ensures that
a nonprojective `Z` has an indecomposable nonprojective summand.

## 9.3: theorem has no error found; its following interpretation has an error

Status: AI-proved for the bracket argument. Linckelmann,
*Tate duality and transfer in Hochschild cohomology*, arXiv:1211.5999v1,
§2, pp. 3–6, was read in the Library PDF, including (2.1)–(2.3) and
(2.6)–(2.10). It uses left modules and `[1]=Σ=Ω⁻¹` and states that the
duality is natural in both variables. Formula (2.8), `⟨ζη,τ⟩=⟨ζ,ητ⟩`,
is the needed compatibility with multiplication. Version metadata was also
checked at <https://arxiv.org/abs/1211.5999v1>.

For a nonprojective simple with `End(s)=k`, a nonzero endomorphism factoring
through a projective would make the identity factor and would make `s`
projective. Thus `H⁰=k`, and duality gives `H⁻¹=k` and
`H⁻²=H⁻³=H⁻⁵=0`. The original bracket is defined because
`τβ∈H²=0` and `β²∈H⁻²=0`. Its indeterminacy is exactly
`τH⁻³+H¹β=0`.

For `τ≠0`, the composition pairing `H⁻⁴×H³→H⁻¹` makes
`γ↦γτ` a nonzero functional into a one-dimensional space. It is surjective,
so one can choose `γτ=β`, including when `β=0`. Then `βγ∈H⁻⁵=0` and
`⟨τ,β,γ⟩⊂H⁻³=0`. Right-composition of a defining Toda system with `τ`
gives `⟨τ,β,γ⟩τ⊆⟨τ,β,γτ⟩`. The rule holds with compatible shifts;
any overall sign is immaterial for this zero-element argument. It can also be
checked on dg representatives by multiplying the chosen null-homotopy for
`βγ` on the right by a closed representative of `τ`. This supplies the rule
labelled 2.2, whose report locator is unavailable in the frozen input.
Zero indeterminacy then gives the asserted singleton. For `τ=0`, choose its
zero representative and the zero null-homotopy for its product with `β`;
the bracket contains zero and still has zero indeterminacy. This routine case
is omitted in the supplied proof but does not invalidate the theorem.

If `H^{≥0}=k[τ]`, `|τ|=p>3`, then `τβ=0`, `β²=0`, and the target
`H^{p−3}` is zero. Thus the stated triple bracket vanishes for all `p≥3`.
An assertion about **every** conversion-principle design additionally needs
the definition of that class of designs and the identification of its `c`
with this bracket. Neither is supplied in the frozen dossier. The precise
checked consequence is vanishing whenever `c` is this bracket's scalar.

Error at frozen lines 90–92: `dim Ext³(S,S)=2` does not cause any hypothesis
of Theorem 9.3 to fail. In the asserted tensor-square example, the algebra is
symmetric, the simple is one-dimensional and nonprojective, and the polynomial
ring with two degree-three generators has zero components in degrees 1, 2
and 4. The theorem therefore applies there too. This is an error in the
explanatory remark, not a counterexample to the theorem.

Proposed repair: delete the assertion that its hypotheses fail. Explain that
the actual AR construction uses two cones and maps into their shifted target,
not the forbidden triple bracket on `S`. The source's
`.cache/ar-src/05-cones.tex`, `cone:cells`, `cone:profile`, and
`.cache/ar-src/07-branches.tex:34–93` exhibit that different target and its
top projection. A rank-two Ext group by itself does not evade this theorem.

## 8.8: dimension calculation and limits of the numerical claims

The first bullet can be recomputed from the permitted source, without forming
its enormous matrices. In `.cache/ar-src/03-algebra.tex`, `alg:C-corners`,
`alg:dual-actions`, and `alg:bar`, the corner dimension matrices of `C`, `T`
and `rad T` are respectively

```
[[4,2],[2,2]],  [[8,4],[4,4]],  [[7,4],[4,3]].
```

Thus, writing `p_n=dim P_n`, the relative bar terms satisfy
`p_n=(12,8) [[7,4],[4,3]]^n (12,8)^t`. If
`b_n=Σ_{i=0}^n p_i p_{n−i}`, with `b_n=0` for `n<0`, the four cone cells
give `dim K_n=b_n+2b_{n+2}+b_{n+4}`. Over the field, the two individual cone
homologies give `dim H_n(K)=400,800,400` at `n=0,−2,−4`, respectively,
and zero elsewhere. Starting at the bottom degree `−4` therefore computes
`dim im(d₁)=dim C₁` from the alternating rank recurrence. These shifts are
the AR source's homological indices; in the binding cohomological notation
the corresponding component is in degree `−n`.

The following exact Python calculation is stored inside the sole authorised
output file. It creates no files. Its claim is only the dimensions of the
specified relative-bar and nonminimal finite representatives.

```python
# V-C23 dimensions: exact integers; AR homological indexing; left modules.
C = [[4, 2], [2, 2]]
T = [[C[i][j] + C[j][i] for j in range(2)] for i in range(2)]
rad = [[T[i][j] - int(i == j) for j in range(2)] for i in range(2)]
left = [sum(T[i][j] for i in range(2)) for j in range(2)]
right = [sum(row) for row in T]
p = []
v = right[:]
for n in range(6):
    p.append(sum(left[i] * v[i] for i in range(2)))
    v = [sum(rad[i][j] * v[j] for j in range(2)) for i in range(2)]
def b(n):
    return sum(p[i] * p[n-i] for i in range(n+1)) if n >= 0 else 0
def kn(n):
    return b(n) + 2*b(n+2) + b(n+4)
h = {-4: 400, -2: 800, 0: 400}
rank = 0  # rank of d_{-4}: K_{-4} -> 0
rows = []
for n in range(-4, 1):
    next_rank = kn(n) - rank - h.get(n, 0)
    rows.append((n, kn(n), h.get(n, 0), next_rank))
    rank = next_rank
c1 = rank
dim_r = 400**2
dim_y = (dim_r - 1)**4 * c1
dim_f = 2*400 + (dim_r - 1)*dim_y
dim_lambda = 2*400 + dim_f
print('bar dimensions:', p)
print('(n, dim K_n, dim H_n, rank d_{n+1}):', rows)
print('dim C1:', c1)
print('dim F:', dim_f)
print('dim Lambda:', dim_lambda)
print('dim Lambda scientific:', format(dim_lambda, '.12e'))
```

Executed with Python 3 using the code extracted from this report; output:

```text
bar dimensions: [208, 1968, 18640, 176560, 1672400, 15841200]
(n, dim K_n, dim H_n, rank d_{n+1}): [(-4, 43264, 400, 42864), (-3, 818688, 0, 775824), (-2, 11713792, 800, 10937168), (-1, 148453376, 0, 137516208), (0, 1761405952, 400, 1623889344)]
dim C1: 1623889344
dim F: 170271818183326072615867045851311456
dim Lambda: 170271818183326072615867045851312256
dim Lambda scientific: 1.702718181833e+35
```

First bullet: **no error found**, status supported by this independent exact
calculation and the dimension argument above. In the source,
`branch:finite-embedding` is `M→Hom_k(E^e,M)`, with cokernel dimension
`(160000−1)dim M`. The four iterations in `branch:Y` give the fourth power;
the free surjection in `branch:finite-fiber` gives the fifth. Adding the two
diagonal copies of `E` contributes the other `800`. This multiplier is valid
for the **specified** representatives, not for arbitrary cosyzygies or
minimal injective embeddings.

Second bullet: **gap**. The source supplies the meaning and proof of the
two-cone profile, but the frozen input does not supply the alternative minimal
bimodules, their matrices, or the linear system whose size it reports. Thus the
dimensions `784704`, `1377984`, and `3.6·10⁶` unknowns are not reproduced.
They remain unverified computational claims in this audit.

Moreover, the claimed conclusion “an algebra of dimension of order at least
10⁶” does not follow from the dimensions of unfinished intermediate modules.
Taking a kernel or cokernel, or removing projective summands from a stable
representative, need not preserve a lower bound. For example, a minimal
cosyzygy of a projective-injective module is zero, regardless of its dimension.
No final `F` or inequality bounding its dimension from below is supplied.
This is a gap in the asserted lower bound, not evidence that the opposite
bound holds. Proposed repair: report the two intermediate dimensions and the
unfinished linear system only, after supplying their reproducible evidence;
remove the inferred lower bound until an argument for it is available.

The profile must be written with its two arguments:
`W^a=Hom_stmod(E)(S,(𝒞⊗_E S)[a])`, not as the self-Ext algebra of `S`.
The latter has `dim H³=2` and `dim H⁶=3`. In the AR source,
`cone:profile` computes `W^a=k` for `a=0,3` and zero otherwise in **all**
integer degrees. Its two exact sequences use the Koszul row and column on
`k[τ₁,τ₂]` and their Tate duals. I checked the seam terms: the cokernel of
the row survives only at `a=0`, the kernel of the column only at `a=3`,
`K₁⁴=0`, and the only possible incoming top-cell group at `a=0` is
`H⁻⁵=0`. Consequently no additional attaching map changes those two groups.
This checks the profile conditional on the source's positive Ext computation;
it does not validate the omitted minimal-data computation.

## 7.3: no error found

Status: supported as a statement about the inspected construction, with the
simple-count calculation AI-proved. The main preprint's finite generating set
is `T₁,T₂,T₃`, three `u_i`, three `v_i`, and six `w_ij` with `i≠j`, totalling
15 (`02-selection-process.tex:86–98`). This means a specified generating set,
not a claim that 15 is the least possible number. Formal inverses are added in
the group-algebra presentation (`:313–318`); auxiliary partial products are
added during quadratisation (`03-localization-and-lifting.tex:21–32`). The
two arrow sets in that file, lines 34–38, each have `d+1` members. All encoding
relations have length two, so these `2+2d` arrows are not removed by linear
relations.

In `03-localization-and-lifting.tex:286–444`, the Ore construction takes cones
of composites and the cancellation construction refines denominators. Finite
families are combined into a single roof; zero relations are killed in the
homotopy category and then represented by degree `−1` null-homotopies. The
objects and choices are fixed before the evaluation module is chosen. There
is no numerical upper bound for their support intervals in this argument.
Once these inputs are given, `04-tensor-realization.tex:61–137` specifies `P`
by finite sums and a differential matrix. Its shifts `[1]`, `[2]`, its middle
minus sign, and `d₀h+pq+hd₂=0` agree with the binding cohomological convention.
The simulation is given by formulas in `05-ordinary-simulation.tex:9–57`.

For its `l=b_*−a_*`, the algebra denoted `D` in that source is
`B×(B⊗k C_chain)`. The two split basic factors have respectively 3 and
`3(l+1)` simple classes. The square-zero ideal of `A=D⋉X` lies in the
radical, so `A` has the same simple classes as `D`, giving `3(l+2)`.
This also checks the endpoint `l=0` formally. The count does not require
that every idempotent remain primitive in an arbitrary tensor product: here
the displayed semisimple quotient is explicitly `k^{3(l+2)}`.

The assertion should be read as “no numerical **upper** bound is provided
in the cited construction”, not as an impossibility or uncomputability
result. The frozen report locators 5.2, 6.1, 6.4, 6.5 and 7.1 were not
available; the corresponding preprint constructions above were read instead.

## 9.1: no error found in the conditional weight lemma

Status: AI-proved for the lemma and the stated grading consequence.
Restriction along `h_λ` preserves projectives, so it induces an exact
autoequivalence of the stable category. For a graded module `M`, the map
`u_M:M→h_λ^*M`, `m_n↦λ^n m_n`, is module-linear. For a homogeneous map
`f:M→N` of internal degree `δ`, transport back along these identifications
gives `u_N⁻¹(h_λ^*f)u_M=λ^{−δ}f`. On the simple in degree zero the
identification is the identity. For right twists,
`T_h⊗_T M→{}_{h⁻¹}M`, `a⊗m↦h⁻¹(a)m`, is balanced and left-linear,
so its weight is `δ`, as stated. The source explicitly gives this map in
`.cache/ar-src/07-branches.tex:147–167`.

Choose a complete graded projective resolution of `s`, with differentials
of internal degree zero. If a homogeneous product is null-homotopic, the
component of the null-homotopy of that same internal degree still supplies
the homotopy. Hence the Toda representative has cohomological degree
`p+2r−1` and internal degree `δ(τ)+2δ(β)`. A target concentrated in internal
degree zero has no class in this nonzero internal degree. Thus the bracket
contains zero, and the assumed zero indeterminacy makes it `{0}`. This is a
grading argument and works over finite fields as well: it does not require
finding a scalar `λ` that distinguishes two characters of `k^×`.

For the AR application, the square-zero-ideal grading is distinct from the
positive grading used to identify the radical. In that first grading the
source cocycle lowers dual-letter count by one
(`03-algebra.tex:155–168`; Appendix `09-cochain.tex:19–45`), so its evaluation
has `δ(τ)=−1`. The homogeneous symmetric trace is supported on degree 1.
Graded Tate duality pairs internal degree `d` with internal degree `N−d`
when the symmetric trace is supported on degree `N`; this follows by retaining
the internal degrees in the finite-projective duality construction of
Linckelmann §2. In particular, the class trace-dual to the degree-zero
identity has internal degree `N`, giving `δ(β₀)=1` here. Together with
`H¹=H²=0` and `H⁻²=H⁻³=0`, this verifies definedness and zero indeterminacy
of the application. The missing direct-computation citation at frozen line
60 was not read and is not needed for this argument.

For the sharp form, retain the setting of a graded nonprojective simple with
`H⁰=k`, a homogeneous trace supported on degree `N`, a scalar target, and
zero indeterminacy. Then the same argument gives the necessary equality
`δ(τ′)+2N=0` when `c≠0`. These hypotheses should be repeated if the sharp
form is extracted as a standalone statement. Its omitted Fable/earlier-note
locators were not read; the conclusion is checked here from graded duality.

In the particular AR triangle, the resolution over `C` is placed in internal
degree zero, while `DC⊗_C R` is in internal degree one. Its identification
with a shift of `s` therefore carries that internal shift; forgetting it
turns the degree-zero graded connecting map into a class of internal degree
`−1`. This checks “always” for this mechanism with the stipulated grading,
not for arbitrary regradings. The corresponding source triangle is
`04-resolution.tex:123–156`, with homological shift `[2]` (cohomological
support in degree `−2`) and connecting class in Ext degree 3.

## 9.2: no error found

Status: AI-proved by the explicit periodic calculation below, with a separate
exact computation of all its finite path-algebra identities. Here the simple
is the vertex-1 simple of the six-dimensional example, not the different
simple used in the AR construction.

Write `Q_i=T e_{v_i}`, with `(v₀,v₁,v₂,v₃)=(1,2,2,1)` periodically, and let
`d_i:Q_i→Q_{i−1}` be right multiplication by `a,ab,b,ba` for `i=1,2,3,4`.
These are maps of **left** modules: for example `a∈e₂Te₁` defines
`Te₂→Te₁` by right multiplication. Both indecomposable projectives have
dimension 3. The ranks of these differentials are `2,1,2,1`; consecutive
composites vanish, and consecutive ranks add to 3. This proves exactness in
all degrees by periodicity. Its degree-zero cokernel is the vertex-1 simple.
All entries lie in the radical, so applying `Hom_T(−,s)` gives zero
differentials and the stated pattern `k,0,0,k` modulo 4.

The conversion to the binding convention is `P^{−i}=Q_i`. A cochain of degree
`m` has components `Q_{i+m}→Q_i`. With this indexing, the tuples for `f` and
`t` in the dossier are correctly typed. The periodicity map `v` has identity
components and degree 4. Writing tuples in residues `i=0,1,2,3`, direct
multiplication gives

| Cochain expression | Components |
|---|---|
| `∂f` | `(0,0,0,0)` |
| `f²` | `(a,b,b,a)` |
| `∂t` | `(a,b,b,a)` |
| `ft+tf` | `(e₁,e₂,e₂,e₁)=v²` |

Take null-homotopies `t v⁻¹` for `τβ=f²v⁻¹` and `t v⁻²` for
`β²=f²v⁻²`. In characteristic 2 the Toda representative is
`(ft+tf)v⁻²=id`. The two indeterminacy groups are `H⁻³=H¹=0`, so the
bracket is the singleton `{id_s}`. Thus this is not merely a nonzero choice
from a larger bracket.

For the internal degrees, choose projective generators in degrees
`g₀,g₁,g₂,g₃=0,0,1,2` and `g_{i+4}=g_i+3`. All differentials then have
internal degree zero; `δ(f)=−2`, `δ(v)=−3`, and `δ(β)=1`. Thus the stated
weight equality is `−2+2=0`. There is no contradiction with 9.3: this example
has `Ext⁴(s,s)=k`, which violates one of that theorem's actual hypotheses.

Reproducible finite check, from the path algebra alone; no other computation
or earlier script was read. The coefficients are exactly in `F₂`. Since all
formulas have coefficients 0 and 1, the same identities hold over every field
of characteristic 2.

```python
# V-C23 periodic example: all six basis paths, exact F2 arithmetic.
# Left modules; xy means first y then x; Q_i -> Q_{i-1} uses right multiplication.
basis = ['e1', 'e2', 'a', 'b', 'ab', 'ba']
ends = [(1, 1), (2, 2), (1, 2), (2, 1), (2, 2), (1, 1)]
length = [0, 0, 1, 1, 2, 2]
def basis_mul(i, j):
    if ends[j][1] != ends[i][0] or length[i] + length[j] >= 3:
        return 0
    if length[i] == 0:
        return 1 << j
    if length[j] == 0:
        return 1 << i
    return 1 << basis.index(basis[i] + basis[j])
def mul(x, y):
    z = 0
    for i in range(6):
        for j in range(6):
            if x >> i & 1 and y >> j & 1:
                z ^= basis_mul(i, j)
    return z
one = [1 << i for i in range(6)]
for x in one:
    for y in one:
        for z in one:
            assert mul(mul(x, y), z) == mul(x, mul(y, z))
e1, e2, a, b, ab, ba = one
vertex = [1, 2, 2, 1]
d = [ba, a, ab, b]
f = [e1, b, e2, a]
t = [0, e2, 0, e1]
identity = [e1, e2, e2, e1]
def comp(x, dx, y, dy):
    return [mul(y[(i+dx) % 4], x[i]) for i in range(4)]
def differential(x, degree):
    return [mul(x[(i+1) % 4], d[(i+1) % 4]) ^
            mul(d[(i+degree+1) % 4], x[i]) for i in range(4)]
def rank(cols):
    pivots = {}
    for col in cols:
        while col:
            h = col.bit_length() - 1
            if h not in pivots:
                pivots[h] = col
                break
            col ^= pivots[h]
    return len(pivots)
def display(xs):
    return ['+'.join(basis[j] for j in range(6) if x >> j & 1) or '0' for x in xs]
ranks = []
for i in range(1, 5):
    cols = [mul(one[j], d[i % 4]) for j in range(6)
            if ends[j][0] == vertex[i % 4]]
    ranks.append(rank(cols))
    assert mul(d[i % 4], d[(i-1) % 4]) == 0
assert all(ranks[i] + ranks[(i+1) % 4] == 3 for i in range(4))
ff = comp(f, 3, f, 3)
ft = comp(f, 3, t, 5)
tf = comp(t, 5, f, 3)
assert differential(f, 3) == [0]*4
assert differential(t, 5) == ff
assert [x ^ y for x, y in zip(ft, tf)] == identity
print('associativity:', 6**3, 'basis triples passed')
print('ranks d1,d2,d3,d4:', ranks)
print('df:', display(differential(f, 3)))
print('dt = f^2:', display(ff))
print('ft+tf:', display(identity))
```

Executed with Python 3 using the second Python block in this report; output:

```text
associativity: 216 basis triples passed
ranks d1,d2,d3,d4: [2, 1, 2, 1]
df: ['0', '0', '0', '0']
dt = f^2: ['a', 'b', 'b', 'a']
ft+tf: ['e1', 'e2', 'e2', 'e1']
```

## 9.4: gap in every computational bullet

The frozen input does not define `E_{λ_i}`, the two displayed modules and
their structure maps, the minimal cone/fibre choices for `Λ₁`, or any of the
three further algebras/modules. It gives neither the finite-field parameter
values nor rank certificates, scripts, or saved outputs. A module's dimension
does not determine its Ext groups. The omitted sources therefore cannot be
replaced by the preprints or inferred from these dimensions.

| Bullet | Checks possible from the frozen input | Missing evidence |
|---|---|---|
| `Λ₀,Z₀` | If the two bimodules are rank-one twists of the 20-dimensional `T`, the triangular algebra has dimension 80 and four simple classes. | Actual bimodule/module data; all claimed Ext ranks through degree 6, generic-field ranks through degree 2, and the comparison identifying Ext¹ with a cokernel. |
| `Λ₁,Z₁` | `352+2·20=392`; a triangular algebra with these two diagonal copies of `T` has four simple classes. The displayed 2-by-2 matrix has rank 1 and a one-dimensional cokernel over every field. | The claimed bimodule and module dimensions, the matrix's identification with the actual comparison map, and every claimed Ext rank. |
| Dimensions `6,12,40` | No algebra/module pair is specified, so no Ext computation can be made. | Presentations, modules, parameter choices, and the degree-≤12 ranks witnessing failure of the specified polynomial profile. |

Status: supported only for the elementary arithmetic and matrix-rank checks
just stated; the reported computational outcomes remain unverified here.
Nonzero Ext¹ would imply nonprojectivity, but its nonvanishing is itself one
of the missing computational claims. Finite-field samples alone cannot
establish an all-degree or generic-field vanishing assertion. Conversely,
an explicit failure of a required low-degree coefficient would suffice to
exclude that particular polynomial profile; those coefficients are absent
from the third bullet.

Proposed repair: freeze the defining matrices and exact parameter choices
together with each result, and include a reproducible calculation or rank
certificate. State `dim_k Ext^a=...`, since the listed numbers are dimensions,
not Ext groups. For the first bullet the explicit range is `a=1,…,6`; for
the second it is `a=1,2,3`, so the leading 1 denotes Ext¹, not End. Neither
profile reports an AR counterexample.

## Statements whose wording does not match their justification

1. **8.8, second bullet (lines 36–39):** dimensions of unfinished
   intermediate bimodules do not justify a lower bound for the final algebra.
   Remove that conclusion or supply the missing inequality and its hypotheses.
2. **8.8, profile notation (line 37):** specify the two-cone target in `W^a`.
   Reading the bare notation as self-Ext of `S` gives a different, incompatible
   profile. The source computes stable Hom into the cone, not self-Ext.
3. **9.3, interpretation (lines 90–92):** the tensor square does not violate
   the theorem's hypotheses. Its two-dimensional Ext³ is irrelevant to those
   hypotheses. The two-cone construction is a different operation.
4. **9.3, “every one-factor design” (lines 80–82):** the proof establishes
   vanishing of the specified bracket. Extend this to a class of designs only
   after defining the class and identifying its invariant `c` with that bracket.
5. **9.4, all bullets (lines 97–104):** the asserted computed profiles have no
   defining data or evidence in the frozen dossier. Also distinguish dimensions
   from vector spaces and repeat the degree range beside each tuple.

The minor omission of `τ=0` from 9.3's written proof is repaired above.
Basicness is not needed for the simple-count conclusion in 8.7. Neither of
these is a counterexample to the submitted statement.

## Locators and scope of source reading

The preprint titles and dates were read in `build/paper.tex` and
`.cache/ar-src/main.tex`: both local source versions are dated 2026-09-23.
No claim of a full audit of either preprint is made.

| Citation/dependency | Read and used here |
|---|---|
| Main construction underlying 7.3 | Main preprint's `02-selection-process.tex`, generating set and group-algebra passage; `03-localization-and-lifting.tex`, quadratic encoding, denominator clearing, and fixed lifted diagram; `04-tensor-realization.tex`, explicit differential; `05-ordinary-simulation.tex`, support interval and algebra; final algebra passage in `06-square-zero-and-conclusion.tex`. |
| AR Theorem 1.1 | `.cache/ar-src/01-introduction.tex:26–38`, including field, module handedness, and semisimple quotient. |
| AR finite dimensions | `03-algebra.tex`, corner table, trivial extension, and relative bar terms; `05-cones.tex`, tail definition and `cone:finite`; `07-branches.tex`, `branch:finite-embedding`, `branch:Y`, `branch:finite-fiber`. |
| AR gradings and tensor-square profile | `03-algebra.tex:155–168`; `04-resolution.tex`, simple resolution, polynomial Ext calculation and tensor product; `05-cones.tex`, negative duality and full proof of `cone:profile`; `07-branches.tex`, twist convention; `09-cochain.tex:1–112`, displayed table and its weight rule. The 179-entry table's full Hochschild cocycle/boundary equations were not recomputed in this job. |
| Tate duality | Library PDF `Lin12a - Tate Duality and Transfer in Hochschild Cohomology.pdf`, arXiv:1211.5999v1, §2, pp. 3–6, formulas (2.1)–(2.10), and preceding left-module conventions. Text extraction was readable; a supplementary web screenshot attempt returned cache misses, so no visual-PDF check is claimed. |
| Report 2.2, 3.4 (C-1), and 8.6 | Not included in the allowed frozen input; not opened. The Toda rule and the implication needed from 3.4 were checked independently above; 8.6 is the expressly assumed AR hypothesis. |
| Report 5.2, 6.1, 6.4, 6.5, 7.1 | Not included; corresponding preprint passages were inspected as listed above. |
| Omitted computations; Fable consult 02 §2; earlier-note §1; audit/11 and audit/12 pointers in the conventions | Not read. Unavailable or excluded locators are not treated as evidence. |

Input SHA-256 digests:

```text
ceef4e1504af3b73de304d0125db3a13c5caadf40f10d8ba7c4a0ecba1b3f7a7  scratch/V-C23-frozen.md
18f7d074a008866cefe229e6c2d8cd0025dc5d71874adf5c5427958919227488  audit/report-notation.md
4bad02ddbcf0bd2af21e3467a77beaae26e21f3fc6060e7a3d7712527ff05cb0  Linckelmann Library PDF
```

All output from this job is in this file. Other worktree changes were present
and continued during this audit; they were not opened as mathematical evidence
or modified by this job. No agents were delegated, no preprint inputs were
changed, and no commit or push was made.

Additional finite check of the degree rule in the AR cochain table (status:
supported; this does not test its cocycle equations):

```python
# V-C23 weights: all 179 nonzero AR table entries, DC-degree grading.
from pathlib import Path
import re
s = Path('.cache/ar-src/09-cochain.tex').read_text()
table = s.split(r'\begin{tabular}', 1)[1].split(r'\end{tabular}', 1)[0]
entries = [w for row in re.findall(r'\\texttt\{([^}]+)\}', table) for w in row.split()]
assert len(entries) == len({w[:3] for w in entries}) == 179
assert all(len(w) == 4 and sum(c.isupper() for c in w[:3]) - int(w[3].isupper()) == 1 for w in entries)
print('179 distinct cochain inputs: every output has internal degree input-degree minus 1.')
```

Executed output:

```text
179 distinct cochain inputs: every output has internal degree input-degree minus 1.
```
