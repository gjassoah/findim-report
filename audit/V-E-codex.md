Model: GPT-6; effort: unknown.

# V-E (W2): adversarial verification

Status: completed with one input-identification gap and two wording items. This is an AI audit, not author certification.

Inputs: `scratch/V-E-frozen.md` (SHA-256 b631bbc15d5bcb60099706729a8b549c2420705f47b76f650c2512f184813601) and `audit/report-notation.md` (SHA-256 18f7d074a008866cefe229e6c2d8cd0025dc5d71874adf5c5427958919227488). Primary sources are checked only where recorded below. Conversion principle 8.1 is assumed. No earlier certificates or excluded dossiers are inputs.

The instruction “Modify no other files” is applied literally: independent certificate scripts and their saved output are embedded in this report, executed from stdin without creating separate script files. The permitted `computations/V-E/` directory is consequently not populated.

## Coverage and findings (incremental)

| Statement | Verdict |
|---|---|
| 8.2: C, resolution, RHom | No error found. |
| 8.3: symmetric T and polynomial Yoneda algebra | No error found for the abstract algebra; normalization by the script-defined p inherits G1. |
| 8.4: tensor square, Tate algebra, two cones and profile | No error found under the explicitly stated Hochschild input. |
| 8.5: twists, cocycle, boundary, lifts | Gap G1 in identifying the specific p; no error found for the permitted source-table p. |
| 8.6: fibre, comparisons and determinant | No error found conditional on the preceding inputs; 8.1 assumed. |
| Consequences and all field extensions | No error found conditional on the construction. |

Complete per-lemma coverage, proposed repairs, source locators and computational
limits are below. The scripts are stored as executable Python blocks in this
single file to obey the write restriction.

## First completed findings

The following mathematical assessments have status **AI-proved** within their
stated hypotheses, except that finite test results alone have status **supported**.
“No error found” records the scope of this audit and is not certification.
All locations below are in the frozen dossier unless another file is named.

| Item | Verdict | Verification and limits |
|---|---|---|
| 8.2 multiplication, unit, radical, fourth radical product (69–140) | No error found | Rebuilt the table; checked every basis associator and corner, positive grading, nilpotent ideal and semisimple quotient. |
| 8.2 resolution and minimality, every index (141–173) | No error found | Recomputed right multiplication. Nonvanishing of `1+q^(i+2)` holds for every `i>=0`; the kernel/image bases match at every seam. Images are radical; the finite nilpotence argument gives projective covers. |
| 8.2 derived Hom and right-module structure (174–203) | No error found | Precomposition becomes left multiplication. The exceptional `ell_0` rank is 2; later ranks are 3. The surviving class is `v` in degree +2, with right f-character, hence `s^r[-2]`. |
| 8.3 symmetry, radical and projective-injective facts (238–282) | No error found | Trace pairs each basis letter with its star. Dual bimodule actions, grading `deg(a*)=5-deg(a)`, and both module sides agree with the conventions. |
| 8.3 dual-tensor isomorphism and derived triangle (283–337) | No error found | The balancing and left action in F.9 agree; exact duality reverses the degree +2 to -2. Termwise tensor exactness uses the left projectivity of `R^n`, not right flatness of `DC`. The bounded-above projective complex has bounded finite cohomology. |
| 8.3 all-degree Yoneda algebra (338–359) | No error found | Applying Hom contravariantly gives `B^(a-1) -> V^(a-3) -> V^a -> B^a`; the map is `beta[3] eta`. The `a=1,2,3` endpoints and all powers give `k[eta]` multiplicatively. |
| 8.3 normalization `tau=p(s)` (360–381) | Gap for the particular p named in the frozen file; no error found for the source-table p | The bar cycle and its nonzero pairing are independently checked. Identification of the named p has the gap G1 below. Stable End(s)=k follows already from the abstract nonzero Ext^3. |

### G1: the frozen definition does not expose the cochain data

**Verdict: gap; status: supported (input/reproducibility finding).**
At lines 629–635 the particular cochain is defined by the variable `table` in
`computations/08-D-E/finite_cochain_certificate.py`. Neither that table nor a
literal copy occurs in the two frozen inputs. That earlier script is outside
this verification's allowed evidence. The claimed equality with the preprint
table at lines 1272–1274 is itself an unchecked receipt claim.

The permitted primary source, `.cache/ar-src/09-cochain.tex:15–45`, does supply
179 entries. Certificate B checks all coefficients of the needed finite identities for that table
by exhaustive exact arithmetic; multilinearity extends them to all inputs. It does not establish equality
with the excluded script. Thus this is a missing identification of the specified
input, not a counterexample to the cocycle identity or to the construction.

**Proposed repair:** define p directly by the permitted appendix (pin its
snapshot/hash), or include the complete table in the frozen dossier. With the
first repair, the finite cochain, weight, boundary and evaluation claims have
status **AI-proved** by Certificate B and its coefficient interpretation. No
change to a coefficient, sign, degree or hypothesis was needed. The dependent
claims below are audited conditionally on this explicit repaired definition;
the gap is not silently treated as closed for the original script-defined p.

## Remaining proof coverage

In this table, “conditional” means that the named p is taken to be the permitted
source-table cochain, as specified in G1. The logical statements with their
explicit hypotheses have status **AI-proved**; computations in finite degrees
or finite fields have status **supported** for precisely those cases.

| Item and frozen location | Verdict | Delicate steps checked |
|---|---|---|
| 8.4.1, 404–425: E, E^e, tensor-square Ext algebra | No error found | Symmetrizing Gram matrices tensor. Finite projective resolutions have finite diagonals; vector-space contractions give the resolution and Künneth isomorphism. Comparison maps on different factors commute in characteristic two and their powers give the full monomial basis. Stable End(S)=k uses nonprojectivity. |
| 8.4.2, 430–466: all Tate groups and products | No error found | The cited duality is for finite left modules over a symmetric algebra. It shifts degree a to -1-a. Transposed multiplication contracts epsilon indices. The H^-1 to H^2 endpoint vanishes; two negative degrees sum outside the support. Pairing symmetry and composition compatibility give both module actions. |
| 8.4.3, 471–528: finite two-cone representative | No error found, conditional | The four cells have cohomology at 0,2,4. Cokernel exactness uses vanishing at degree -N-1, including N=1. The actual bar cokernels are distinguished from minimal syzygies. Filtration quotients and both syzygies/cosyzygies stay projective on each E-side. Tail comparison is independent of N; homotopies factor through projective terms. Right-split evaluation preserves the relevant triangles and shifts. |
| 8.4.4, 533–585: U, W and the actual top projection | No error found, conditional | In the first cone the cokernel and kernel occupy different congruence classes. The second factor acts on the entire first triangle. Its sole cokernel is at 0 and sole kernel is on U^1. This gives W at 0 and 3, with the actual composite projection W^3 to U^1 to H^-1 an isomorphism. No unexamined extension splitting or abstract identification replaces that projection. |
| 8.5.1, 614–627: relative bar resolution | No error found | The insertion contraction respects I-balancing; its remaining I-component is recovered by that balancing. It is right-linear. Terms are sums of Ti tensor jT, so tensoring with s gives a projective resolution. |
| 8.5.1, 629–635: definition of p | Gap G1 | The particular table is not exposed in the permitted dossier inputs. |
| 8.5.1, 637–707: automorphism, cocycle, weight, boundary and nonzero evaluation | No error found for the source-table p | All coefficients checked by Certificate B. The boundary splits into constant and linear lambda coefficients; no numerical specialization is used there. The bar cycle pairs to q^3. |
| 8.5.1, 709–720: suffix comparison map | No error found, conditional | Prefix terms cancel; the remaining five terms are the Hochschild identity. At n=3 the target differential and the comparison on P^-2 vanish. The map has degree +3. |
| 8.5.2, 727–759: twists | No error found in the stated nonnegative range, conditional | T_h tensor M is restriction by h^-1, not h. The comparison on the twisted resolution uses inverse weights. Each nonzero simple-valued cochain input has one dual letter, giving lambda^-1; multiplicativity gives lambda^-m. The tensor-square monomials all have the same total weight. |
| 8.5.3, 789–800: minimal cover identifications | No error found | P^tot,0 has four vertex summands and its top maps isomorphically to the top of E as E^e-module. Its kernel is the minimal Omega_E^e E. Evaluation gives the cover E(f tensor f) to S. |
| 8.5.3, 802–833: Casimir identities | No error found | Twisted centrality has orientation h(a)xi=xi a. Products ww* and w*w count the respective row/column dimensions 6,4; characteristic two kills both counts. Deleting the idempotent term gives the vertex identity. Certificate B checks full, vertex and projected identities. |
| 8.5.3, 835–871: B | No error found | The right-source twist requires h^-1 on the terminal coefficient. B has degree -1. Prefix cancellation, the projected Casimir identity and endpoint sum give zero in negative degrees; degree zero gives exactly b epsilon. Certificate D additionally tests the full bar differential. |
| 8.5.3, 873–894: explicit G | No error found, conditional | G has degree +1. Its three remaining terms are the specified boundary identity. At n=0,1 both sides vanish. The explicit formula supplies an all-degree argument separate from the source's recursive construction. |
| 8.5.3, 896–918: tail map and lift | No error found, conditional | The top and singleton cells of K[3] have shifts -1 and +1. The pB and dG+Gd terms cancel; pD_b=0. The only defect is degree zero. At n=4 the target cokernel shifted by 4 is C_1[4]=C[3]. The top defect identifies the actual syzygy comparison of beta_lambda. |
| 8.5.3, 920–941: evaluated lift and nonvanishing | No error found, conditional | Only the term with terminal f survives, giving lambda^2(f* tensor f*). In a symmetric algebra the left socle is annihilated on the right by the radical, by the nondegenerate trace. Every map through a free module into Omega S is therefore zero. |
| 8.6, 1022–1055: finite cosyzygies and normalization | No error found, conditional | j_M is R-linear and injective; Hom_k(R,M) is finite R-projective since R is symmetric. Separate left/right splitting preserves projectivity. Four cosyzygies of C_1 represent C[3]. Evaluation commutes with these shifts. Scaling by lambda_i^-2 normalizes both maps to the same w. |
| 8.6, 1057–1083: fibre and projections | No error found, conditional | The added free R-module makes the map surjective. Its target is projective on both sides, so the kernel F is projective on both sides. Evaluation preserves exactness and kills the free bimodule stably. Both projections give natural transformations compatible with shifts. |
| 8.6, 1085–1103: V and v | No error found, conditional | The adjacent terms are W^(a+2), W^(a+3). V^0 is the diagonal line and uniquely determines v with both projections the identity. At a=1 the preceding surjection kills the connecting map; at a>=2 both W terms vanish. |
| 8.6, 1105–1134: all comparison maps and determinant | No error found, conditional | Naturality yields each row (lambda_i^-m,1). At degree zero the map is the sum with diagonal kernel. At every m>0 its scalar determinant is nonzero because H_1^m and H_2^m are distinct monomials; even m causes no exception. Remaining positive degrees have zero source and target. |
| 8.6, 1136–1157: conversion | No error found in the application, conditional | Principle 8.1 is assumed as authorized. The source statement has the same left triangular-module convention and comparison hypotheses; its proof was not audited. |
| 8.6 consequences, 1175–1220 | No error found, conditional | The tensor radical is the sum of commuting nilpotent ideals and has split semisimple quotient. The triangular radical has nilpotence bound 2N and quotient k^8. Surjections carry radicals onto radicals; (ut)^2=q(1+q)z survives and eu-ue=u witnesses noncommutativity. |
| 8.6 base change, 1222–1260 | No error found, conditional | Termwise Hom commutes with field extension for finite projectives; exact flat tensoring commutes with its cohomology. The complete resolution and its dual remain exact. A nonsplit finite projective-cover sequence remains nonsplit by faithful flatness. Split radicals and the explicit nonzero product/commutator persist under every field extension. |

## Wording versus proof

1. **Input-scope mismatch, 629–635:** “self-contained finite definition” describes
   a script external to the frozen dossier. Under this job's read restrictions,
   the dossier does not furnish that definition. This is G1, not a failed
   polynomial identity. Repair by copying the 179 entries or replacing the
   defining reference with the permitted appendix and pinned hash.
2. **Heading scope, 725 and 737–759:** “Twists on every homogeneous
   self-extension” can be read as including all Tate degrees. The actual proof
   establishes the action only in nonnegative degrees. Proposed heading:
   “Twists on nonnegative self-extensions”; retain `m>=0` explicitly in the
   tensor-square conclusion. Negative twists are not needed by 8.6. This is
   a wording clarification, not a counterexample to any displayed formula.

No further statement/proof mismatch was found. In particular, the cohomological
support 0,2,4 and the stable cells S,S[-2]^2,S[-4] are consistent; RHom_C(s,C)
is in degree +2, whereas DC tensor_C^L s is in degree -2. The occurrences of
capital E and T as dual basis letters are explicitly disambiguated in 8.5.

## Cited locators actually read

The companion preprint is the **local source snapshot** titled *An explicit
counterexample to the Auslander–Reiten conjecture*, dated September 23, 2026
(`.cache/ar-src/main.tex`). No assertion about agreement with an independently
obtained later version is made. The following cited sections were read by the
lead verifier or a parallel reader, and the associated mathematical uses were
checked against the frozen text:

| Source | Inspected locators |
|---|---|
| `.cache/ar-src/03-algebra.tex` | 12–62 (`alg:C`), 80–124 (`alg:T`), 133–153 (`alg:bar`), 166–212 (`coc:data`, `coc:boundary`, cycle), 215–234 (`coc:comparison`). |
| `.cache/ar-src/04-resolution.tex` | 22–104 (`res:base`), 114–200 (`res:polynomial`), tensor statement and comparison argument 204–241. |
| `.cache/ar-src/05-cones.tex` | Entire file 1–323; in particular `cone:finite` 142–190 and `cone:profile` 216–316. |
| `.cache/ar-src/09-cochain.tex` | Entire file 1–126; table 15–45, transpose recurrence 55–65, closure 67–86, boundary coefficients 88–117, cycle values 119–126. |
| `.cache/ar-src/06-lift.tex` | Entire file 1–286; `lift:main`, `lift:B`, `lift:G` (including recursive step 191–224), and `lift:evaluation`. |
| `.cache/ar-src/07-branches.tex` | Entire file 1–233; `branch:profile` 100–131, `branch:twist` 139–174, `branch:comparison` 176–221. |
| `.cache/ar-src/08-consequences.tex` | Entire file 1–79; `prop:radical` 7–45 and `prop:basechange` 47–79. |
| `.cache/ar-src/02-conversion.tex` | Standing conventions and statement 1–59, especially 28–59; conversion proof deliberately assumed. |
| Linckelmann, *Tate duality and transfer in Hochschild cohomology* | Pinned arXiv:1211.5999v1, 26 November 2012; local Library PDF pp.3–6 and matching arXiv record. Read finite-left-module/symmetric-algebra hypotheses, (2.1), (2.3), shift compatibility (2.6), Yoneda compatibility (2.7)–(2.8), pairing symmetry (2.10). |

For the last row, the exact degree formula is
`Ext-hat^(n-1)(V,U) = D Ext-hat^(-n)(U,V)`, and the source says
“which is natural in U and V.” Its suspension is inverse syzygy. These are the
hypotheses and direction required at frozen lines 440–466.
[Primary arXiv record](https://arxiv.org/abs/1211.5999v1).

The source PDF was inspected read-only:
:codex-file-citation{path="Lin12a - Tate Duality and Transfer in Hochschild Cohomology.pdf" purpose="source"}.
Text extraction of pp.3–6 was legible for the equations used; the attempted
web screenshot retrieval failed with a cache miss and supplied no evidence.
No source file or PDF was changed.

## Scope of the finite-certificate reruns

Certificates A–E below contain the complete new implementations and saved
outputs. None reads `computations/08-D-E`, earlier scripts, saved matrices or
another audit. The lead inspected the delegated code and reran it before
recording its output.

- A: exhaustive C and T basis associativity, grading/corners and trace; C
  resolution ranks and kernel candidates for indices 0–12 over F_2(q).
- B: exhaustive exact source-table cocycle, weight, boundary and Casimir
  checks over F_2[q], with lambda coefficients compared separately.
- C: a **formal** four-cell Koszul Hom complex in degrees -25 through 25.
  This verifies the algebraic rank calculation, not the actual E-module
  realization or absence of additional attaching maps. Those were checked in
  the written successive-cone proof.
- D: direct B/G bar identities on every composable generator of lengths 0–3
  at two finite-field parameter pairs, with the full bar differential.
- E: a freshly constructed minimal T-projective resolution through degree 9
  over F_256; Hom to the simple has zero differential by minimality, so the
  f-projective multiplicities give the displayed Ext dimensions.

The historical output equality, source-to-old-script equality, saved giant cone
matrix ranks, old finite-field seeds and optional Toda-bracket witnesses at
1262–1306 have **not** been replayed. Their artifacts are outside the allowed
inputs. The optional bracket is explicitly unused in 8.4 (line 596). This
report does not authenticate those historical receipts. In particular, the
formal Certificate C must not be described as a reconstruction of the actual
saved cone matrices. The all-degree resolution, multiplication, cone and lift
arguments were checked symbolically and do not follow from these finite tests.

## Audit conclusion

**No mathematical counterexample or sign/side/degree error was found in the
checked arguments.** The frozen dossier still has the explicit input gap G1:
its particular p is defined only in an excluded script. For the permitted
preprint-table p, the independent exact certificate passes, and no further gap
was found in 8.2–8.6 with 8.1 assumed. The original dossier's unqualified claim
that no gap remains should retain this qualification until p is pinned within
the allowed evidence. Two wording items are listed separately above.

Only `audit/V-E-codex.md` was written. Neither the frozen dossier nor the
conventions, preprints, historical computations, other audits or repository
workflow files were edited. No commit or push was made.

## Certificate A: algebra and finite resolution checks

```python
# V-E independent foundation certificate.
# Claims: C/T multiplication, grading, trace; finite C resolution matrices.
# Cases: every C/T basis triple and pair; indices 0..12 over F_2(q).
# Conventions: left modules, multiplication as printed, stars dualize corners.
from itertools import product
from sympy import symbols, GF
from sympy.polys.matrices import DomainMatrix
q=symbols('q'); K=GF(2).frac_field(q); Q=K.gens[0]
basis=list('efxyzuvtjn'); allb=basis+[a.upper() for a in basis]
# Use explicit corners to avoid relying on their presentation order.
corner={a:('e','e') for a in 'exyz'}
corner.update({a:('e','f') for a in 'uv'})
corner.update({a:('f','e') for a in 'tj'})
corner.update({a:('f','f') for a in 'fn'})
deg=dict(zip(list('efutxynvjz'),[0,0,1,1,2,2,2,3,3,4]))
for a in basis:
    corner[a.upper()]=corner[a][::-1]; deg[a.upper()]=5-deg[a]
def plus(*terms):
    z={}
    for term in terms:
        for a,c in term.items():
            z[a]=z.get(a,K.zero)+c
            if not z[a]: del z[a]
    return z
def scale(c,v): return {a:c*t for a,t in v.items() if c*t}
def unit(a): return {a:K.one}
C={}
for a,b in product(basis,repeat=2):
    if a in 'ef': C[a,b]=unit(b) if corner[b][0]==a else {}
    elif b in 'ef': C[a,b]=unit(a) if corner[a][1]==b else {}
    else: C[a,b]={}
for a,b,v in [('x','y',{'z':Q}),('y','x',{'z':K.one}),
 ('x','u',{'v':K.one}),('y','u',{'v':K.one}),('t','x',{'j':K.one}),
 ('t','y',{'j':Q**2}),('u','t',{'y':K.one,'x':Q}),('v','t',{'z':Q}),
 ('u','j',{'z':K.one}),('t','u',{'n':K.one+Q}),('n','t',{'j':Q}),
 ('u','n',{'v':K.one})]: C[a,b]=v
T=dict(C)
for a,b in product(basis,repeat=2):
    T[a,b.upper()]={c.upper():C[c,a][b] for c in basis if b in C[c,a]}
    T[a.upper(),b]={c.upper():C[b,c][a] for c in basis if a in C[b,c]}
    T[a.upper(),b.upper()]={}
def mul(v,w):
    return plus(*(scale(c*d,T[a,b]) for a,c in v.items() for b,d in w.items()))
for B in (basis,allb):
    for a,b,c in product(B,repeat=3):
        assert mul(T[a,b],unit(c))==mul(unit(a),T[b,c]),(a,b,c)
    print('associators',len(B)**3,'PASS')
for a,b in product(allb,repeat=2):
    for c in T[a,b]:
        assert deg[c]==deg[a]+deg[b]
        assert corner[a][1]==corner[b][0] and corner[c]==(corner[a][0],corner[b][1])
    tr=T[a,b].get('E',K.zero)+T[a,b].get('F',K.zero)
    assert tr==(K.one if a.swapcase()==b else K.zero)
print('400 grading/corner/trace checks PASS')
assert mul(mul(T['u','t'],unit('u')),unit('t'))=={'z':Q*(K.one+Q)}
print('utut = (q+q^2)z PASS')
ce=list('exyztj'); ec=list('exyzuv'); cf=list('fuvn'); fc=list('ftjn')
def matrix(images,target):
    return DomainMatrix([[v.get(a,K.zero) for v in images] for a in target],
                        (len(target),len(images)),K)
def ell(i): return {'x':K.one,'y':Q**i}
Ru=matrix([mul(unit(a),unit('u')) for a in ce],cf)
Lu=matrix([mul(unit('u'),unit(a)) for a in fc],ec)
assert Ru.rank()==3 and Lu.rank()==4
for i in range(13):
    rr=matrix([mul(unit(a),ell(i)) for a in ce],ce)
    ll=matrix([mul(ell(i),unit(a)) for a in ec],ec)
    assert rr.rank()==3 and ll.rank()==(2 if i==0 else 3)
    for v in (ell(i+1),unit('z'),unit('j')): assert not mul(v,ell(i))
    if i:
        for v in (ell(i-1),unit('z'),unit('v')): assert not mul(ell(i),v)
    assert not mul(ell(i+1),ell(i))
assert not mul(ell(0),unit('u'))
print('right ranks: u=3, ell_i=3 for i=0..12 PASS')
print('left ranks: u=4, ell_0=2, ell_i=3 for i=1..12 PASS')
print('kernel bases and consecutive differentials for i=0..12 PASS')
```

Saved output (Python 3.14.7, SymPy 1.14.0):

```text
associators 1000 PASS
associators 8000 PASS
400 grading/corner/trace checks PASS
utut = (q+q^2)z PASS
right ranks: u=3, ell_i=3 for i=0..12 PASS
left ranks: u=4, ell_0=2, ell_i=3 for i=1..12 PASS
kernel bases and consecutive differentials for i=0..12 PASS
```

## Certificate B: permitted primary-source cocycle

Independently reconstructed by the cocycle reader, inspected and rerun by the lead verifier. No prior computation was opened. This checks the preprint table, not equality with the inaccessible script named at frozen lines 629–635.

```python
# V-E independent cochain certificate.
# Claims: preprint-table cocycle, boundary and Casimir identities.
# Cases: every basis input over F_2[q]; left modules, char 2.
# Only the permitted source table is read; multiplication is rebuilt here.
import re,itertools,hashlib
B='exyzuvtjfn'; allB=B+B.upper(); rad=allB.replace('e','').replace('f','')
corner=dict(zip(B,[(0,0)]*4+[(0,1)]*2+[(1,0)]*2+[(1,1)]*2))
corner.update({a.upper():corner[a][::-1] for a in B})
def pm(a,b):
 c=0
 while b:
  if b&1:c^=a
  a<<=1;b>>=1
 return c
def add(v,key,c):
 if c:
  v[key]=v.get(key,0)^c
  if not v[key]:del v[key]
def scale(v,c):return {a:pm(b,c) for a,b in v.items() if pm(b,c)}
def plus(*vs):
 o={}
 for v in vs:
  for a,b in v.items():add(o,a,b)
 return o
mu={(a,b):{} for a in allB for b in allB}
for a,b in itertools.product(B,repeat=2):
 if a in 'ef' and corner[a][1]==corner[b][0]:mu[a,b]={b:1}
 elif b in 'ef' and corner[a][1]==corner[b][0]:mu[a,b]={a:1}
for a,b,out in [('x','y',{'z':2}),('y','x',{'z':1}),('x','u',{'v':1}),('y','u',{'v':1}),('t','x',{'j':1}),('t','y',{'j':4}),('u','t',{'y':1,'x':2}),('v','t',{'z':2}),('u','j',{'z':1}),('t','u',{'n':3}),('n','t',{'j':2}),('u','n',{'v':1})]:mu[a,b]=out
for a,b,c in itertools.product(B,repeat=3):
 if b in mu[c,a]:mu[a,b.upper()][c.upper()]=mu[c,a][b]
 if b in mu[a,c]:mu[b.upper(),a][c.upper()]=mu[a,c][b]
def mult(v,w):
 o={}
 for a,ca in v.items():
  for b,cb in w.items():
   for c,cc in mu[a,b].items():add(o,c,pm(pm(ca,cb),cc))
 return o
unit=lambda a:{a:1}
source=open('.cache/ar-src/09-cochain.tex').read(); p={}
print('source SHA-256:',hashlib.sha256(source.encode()).hexdigest())
for row in source.splitlines():
 if '\\texttt{' not in row or '&' not in row:continue
 coefficient=row.split('&')[0]
 power=int(re.search(r'q\^(\d+)',coefficient).group(1)) if '^' in coefficient else (1 if 'q' in coefficient else 0)
 for word in re.search(r'\\texttt\{([^}]+)\}',row).group(1).split():
  a,b,c,v=word; assert (a,b,c) not in p
  p[a,b,c]={v:1<<power}
P=lambda a,b,c:p.get((a,b,c),{})
assert len(p)==179
for (a,b,c),v in p.items():
 out=next(iter(v));assert corner[a][1]==corner[b][0] and corner[b][1]==corner[c][0]
 assert corner[out]==(corner[a][0],corner[c][1])
 assert sum(x.isupper() for x in (a,b,c))-out.isupper()==1
for a,b,c in itertools.product(allB,repeat=3):
 assert mult(mu[a,b],unit(c))==mult(unit(a),mu[b,c]),(a,b,c)
composable=0
for a,b,c,d in itertools.product(rad,repeat=4):
 composable+=all(corner[x][1]==corner[y][0] for x,y in ((a,b),(b,c),(c,d)))
 value=plus(mult(unit(a),P(b,c,d)),mult(P(a,b,c),unit(d)))
 for x,cx in mu[a,b].items():value=plus(value,scale(P(x,c,d),cx))
 for x,cx in mu[b,c].items():value=plus(value,scale(P(a,x,d),cx))
 for x,cx in mu[c,d].items():value=plus(value,scale(P(a,b,x),cx))
 assert not value,(a,b,c,d,value)
gamma={a:(2 if a in 'uvtEXYZUV' else 0) for a in allB}
for a,b in itertools.product(rad,repeat=2):
 lhs=[{},{}]
 for w in rad:lhs[w.isupper()]=plus(lhs[w.isupper()],mult(P(a,b,w),unit(w.swapcase())))
 rhs=[{},{}]
 for v,m in mu[a,b].items():
  rhs[0][v]=pm(gamma[a] if b.isupper() else 0,m)
  rhs[1][v]=pm(gamma[b]^gamma[v]^(0 if b.isupper() else gamma[a]),m)
 rhs=[{v:m for v,m in z.items() if m} for z in rhs]
 assert lhs==rhs,(a,b,lhs,rhs)
# Casimir augmentation, endpoints, and projected Casimir used by B.
for vertex in [None,0,1]:
 full=[{},{}];rads=[{},{}]
 for w in allB:
  if vertex is None or corner[w][0]==vertex:
   full[w.isupper()]=plus(full[w.isupper()],mu[w,w.swapcase()])
   if w in rad:rads[w.isupper()]=plus(rads[w.isupper()],mu[w,w.swapcase()])
 assert full==[{},{}]
 if vertex is not None:assert rads==[{('E' if vertex==0 else 'F'):1},{}]
for a in rad:
 o={}
 for w in rad:
  for c,m in mu[a,w].items():add(o,(c,w.swapcase(),int(w.isupper())),m)
  for c,m in mu[w.swapcase(),a].items():add(o,(w,c,int(w.isupper())-int(a.isupper())),m)
 o={key:v for key,v in o.items() if corner[key[0]][1]==corner[key[1]][0]}
 expected={(a,('E' if corner[a][1]==0 else 'F'),0):1}
 assert o==expected,(a,o,expected)
def bd3(a,b,c):
 o={}
 for x,m in mu[a,b].items():add(o,(x,c),m)
 for x,m in mu[b,c].items():add(o,(a,x),m)
 return o
assert not plus(scale(bd3('t','x','J'),4),bd3('t','y','J'))
assert plus(scale(P('t','x','J'),4),P('t','y','J'))=={'f':8}
print('PASS: 179 distinct cochain inputs; all corners and weight -1.')
print('PASS: all 8000 associativity triples in T.')
print('PASS: all 104976 radical four-words; composable =',composable)
print('PASS: all 324 boundary pairs, constant and linear lambda coefficients.')
print('PASS: full and vertex Casimir augmentation; all 18 projected Casimir identities.')
print('PASS: q^2[t|x|J]+[t|y|J] is a cycle, evaluates to q^3 f.')
```

Saved output:

```text
source SHA-256: 838a489943b88b3501248a02d4835d09124a6b0002834de6fd380057948d340a
PASS: 179 distinct cochain inputs; all corners and weight -1.
PASS: all 8000 associativity triples in T.
PASS: all 104976 radical four-words; composable = 15250
PASS: all 324 boundary pairs, constant and linear lambda coefficients.
PASS: full and vertex Casimir augmentation; all 18 projected Casimir identities.
PASS: q^2[t|x|J]+[t|y|J] is a cycle, evaluates to q^3 f.
```

## Certificate C: finite formal Koszul profile

Independently written by the cone reader, inspected and rerun by the lead. This does not replace the successive-cone argument for actual attaching maps or rebuild the historical giant matrices.

```python
# V-E independent formal four-cell Koszul Hom-complex certificate.
# Cases -25 <= a <= 25 over F_2; cells I shift degree by +2|I|.
# This is a rank check on the stated Tate algebra, not an E-module model.
def h(a):
    if a >= 0 and a % 3 == 0:
        m=a//3
        return [('p',i,m-i) for i in range(m+1)]
    if a < 0 and (-a-1) % 3 == 0:
        m=(-a-1)//3
        return [('n',i,m-i) for i in range(m+1)]
    return []
def mult(z,k):
    t,i,j=z; v=[i,j]
    if t=='p': v[k]+=1
    elif v[k]>0: v[k]-=1
    else: return None
    return (t,*v)
cells=[(),(0,),(1,),(0,1)]
def basis(a):
    return [(I,z) for I in cells for z in h(a-2*len(I))]
def differential(a):
    target={b:i for i,b in enumerate(basis(a+1))}; cols=[]
    for I,z in basis(a):
        col=0
        for k in I:
            w=mult(z,k)
            if w is not None:
                J=tuple(i for i in I if i!=k)
                col ^= 1 << target[(J,w)]
        cols.append(col)
    return cols
def rank(cols):
    piv={}
    for col in cols:
        while col:
            i=col.bit_length()-1
            if i in piv: col ^= piv[i]
            else:
                piv[i]=col
                break
    return len(piv)
def image(cols,v):
    r=0
    while v:
        bit=v & -v
        r ^= cols[bit.bit_length()-1]
        v ^= bit
    return r
for a in range(-26,26):
    A,B=differential(a),differential(a+1)
    assert all(image(B,c)==0 for c in A),(a,'d squared')
for a in range(-25,26):
    n=len(basis(a))-rank(differential(a-1))-rank(differential(a))
    assert n==(1 if a in (0,3) else 0),(a,n)
    if n: print('nonzero cohomology: degree',a,'dimension',n)
for a,gen in [(0,((),('p',0,0))),(3,((0,1),('n',0,0)))]:
    j=basis(a).index(gen)
    assert differential(a)[j]==0
    assert rank(differential(a-1)+[1<<j])==rank(differential(a-1))+1
    print('distinguished surviving class:',gen,'in degree',a)
print('d^2=0 in -26..25; profile and distinguished classes pass in -25..25 over F_2')
```

Saved output:

```text
nonzero cohomology: degree 0 dimension 1
nonzero cohomology: degree 3 dimension 1
distinguished surviving class: ((), ('p', 0, 0)) in degree 0
distinguished surviving class: ((0, 1), ('n', 0, 0)) in degree 3
d^2=0 in -26..25; profile and distinguished classes pass in -25..25 over F_2
```

## Certificate D: direct finite bar homotopies

New independent implementation by the cocycle reader, inspected and rerun by the lead. Finite specializations test the explicit formulas; they do not satisfy the infinite-order hypothesis on q and do not imply all-degree assertions.

```python
# Claim: direct finite bar checks of B and G, not reduced identities.
# Cases: every composable generator n=0,1,2,3; GF(256), two q/lambda pairs.
# Conventions: cohomological degree -n; char 2; Q has right twist by h.
# Field polynomial 0x11b = x^8+x^4+x^3+x+1.
import re,itertools
B='exyzuvtjfn'; basis=B+B.upper();rad=basis.replace('e','').replace('f','')
corner=dict(zip(B,[(0,0)]*4+[(0,1)]*2+[(1,0)]*2+[(1,1)]*2));corner.update({a.upper():corner[a][::-1] for a in B})
def mul(a,b):
 c=0
 while b:
  if b&1:c^=a
  a<<=1
  if a&256:a^=283
  b>>=1
 return c
def power(a,n):
 if n<0:n%=255
 r=1
 while n:
  if n&1:r=mul(r,a)
  a=mul(a,a);n>>=1
 return r
def put(o,key,c):
 if c:
  o[key]=o.get(key,0)^c
  if not o[key]:del o[key]
def plus(*vs):
 o={}
 for v in vs:
  for t,c in v.items():put(o,t,c)
 return o
source=open('.cache/ar-src/09-cochain.tex').read()
for q,lam in [(2,3),(3,5)]:
 mu={(a,b):{} for a in basis for b in basis}
 for a,b in itertools.product(B,repeat=2):
  if a in 'ef' and corner[a][1]==corner[b][0]:mu[a,b]={b:1}
  elif b in 'ef' and corner[a][1]==corner[b][0]:mu[a,b]={a:1}
 for a,b,out in [('x','y',{'z':q}),('y','x',{'z':1}),('x','u',{'v':1}),('y','u',{'v':1}),('t','x',{'j':1}),('t','y',{'j':mul(q,q)}),('u','t',{'y':1,'x':q}),('v','t',{'z':q}),('u','j',{'z':1}),('t','u',{'n':1^q}),('n','t',{'j':q}),('u','n',{'v':1})]:mu[a,b]=out
 for a,b,c in itertools.product(B,repeat=3):
  if b in mu[c,a]:mu[a,b.upper()][c.upper()]=mu[c,a][b]
  if b in mu[a,c]:mu[b.upper(),a][c.upper()]=mu[a,c][b]
 p={}
 for row in source.splitlines():
  if '\\texttt{' not in row or '&' not in row:continue
  coefficient=row.split('&')[0]
  deg=int(re.search(r'q\^(\d+)',coefficient).group(1)) if '^' in coefficient else (1 if 'q' in coefficient else 0)
  for word in re.search(r'\\texttt\{([^}]+)\}',row).group(1).split():p[tuple(word[:3])]={word[-1]:power(q,deg)}
 def insert(o,factors,c):
  if all(corner[a][1]==corner[b][0] for a,b in zip(factors,factors[1:])):put(o,tuple(factors),c)
 def differential(v):
  o={}
  for t,c in v.items():
   if len(t)==2:continue
   for i in range(len(t)-1):
    for x,m in mu[t[i],t[i+1]].items():insert(o,t[:i]+(x,)+t[i+2:],mul(c,m))
  return o
 def mapB(v):
  o={}
  for t,c in v.items():
   left,bs,right=t[0],t[1:-1],t[-1]
   for w in rad:
    scale=power(lam,int(w.isupper())-int(right.isupper()))
    for out,m in mu[w.swapcase(),right].items():insert(o,(left,)+bs+(w,out),mul(c,mul(scale,m)))
  return o
 def mapG(v):
  o={}
  for t,c in v.items():
   if len(t)==2:continue
   left,bs,last,right=t[0],t[1:-2],t[-2],t[-1]
   if last not in 'uvtEXYZUV':continue
   scale=mul(q,power(lam,1-int(right.isupper())))
   for out,m in mu[last,right].items():insert(o,(left,)+bs+(out,),mul(c,mul(scale,m)))
  return o
 def mapp(v):
  o={}
  for t,c in v.items():
   if len(t)<5:continue
   for val,m in p.get(t[-4:-1],{}).items():
    for out,r in mu[val,t[-1]].items():insert(o,t[:-4]+(out,),mul(c,mul(m,r)))
  return o
 def Db(v):
  o={}
  for t,c in v.items():
   if len(t)!=2:continue
   for product,m in mu[t[0],t[1]].items():
    for w in basis:
     for left,r in mu[product,w].items():insert(o,(left,w.swapcase()),mul(c,mul(m,mul(r,power(lam,int(w.isupper()))))))
  return o
 counts=[]
 for n in range(4):
  gens=[('e','e'),('f','f')] if n==0 else [('ef'[corner[w[0]][0]],)+w+('ef'[corner[w[-1]][1]],) for w in itertools.product(rad,repeat=n) if all(corner[a][1]==corner[b][0] for a,b in zip(w,w[1:]))]
  for t in gens:
   v={t:1};dv=differential(v)
   lhs=plus(differential(mapB(v)),mapB(dv));assert lhs==Db(v),('B',q,lam,t,lhs,Db(v))
   lhs=plus(differential(mapG(v)),mapG(dv));assert lhs==mapp(mapB(v)),('G',q,lam,t,lhs,mapp(mapB(v)))
  counts.append(len(gens))
 print('PASS direct B/G bar identities over GF(256), q=%d lambda=%d; n=0..3 counts=%s'%(q,lam,counts))
```

Saved output:

```text
PASS direct B/G bar identities over GF(256), q=2 lambda=3; n=0..3 counts=[2, 18, 170, 1610]
PASS direct B/G bar identities over GF(256), q=3 lambda=5; n=0..3 counts=[2, 18, 170, 1610]
```

## Certificate E: independent minimal T-resolution through degree 9

New implementation by the fibre reader, inspected and rerun by the lead (NumPy exact uint8 field arithmetic). The finite-field parameter has order 255, so the test does not meet the all-degree infinite-order hypothesis. It supports exactly these dimensions, not the Yoneda multiplication or unbounded assertion.

```python
# Claim: minimal left-T resolution of f-simple in degrees 0..9.
# GF256 polynomial 0x11d; q=2, order255. Finite range only.
# T=C+DC; (a phi)(b)=phi(ba), (phi a)(b)=phi(ab).
import numpy as np
poly=0x11d
def fmul(a,b):
    s=0
    while b:
        if b&1:s^=a
        b>>=1;a<<=1
        if a&256:a^=poly
    return s
mul=np.array([[fmul(a,b) for b in range(256)] for a in range(256)],dtype=np.uint8)
inv=np.zeros(256,dtype=np.uint8)
for a in range(1,256):inv[a]=next(b for b in range(1,256) if mul[a,b]==1)
q=2;q2=int(mul[q,q]);order=1;zq=q
while zq!=1:zq=int(mul[zq,q]);order+=1
assert order==255
print('field polynomial = 0x11d; q=2; multiplicative order =',order)
names=['e','f','x','y','z','u','v','t','j','n']
lft=[0,1,0,0,0,0,0,1,1,1];rgt=[0,1,0,0,0,1,1,0,0,1]
c=np.zeros((10,10,10),dtype=np.uint8)
for a in range(10):c[lft[a],a,a]=1;c[a,rgt[a],a]=1
for a,b,terms in [('x','y',{'z':q}),('y','x',{'z':1}),('x','u',{'v':1}),('y','u',{'v':1}),('t','x',{'j':1}),('t','y',{'j':q2}),('u','t',{'y':1,'x':q}),('v','t',{'z':q}),('u','j',{'z':1}),('t','u',{'n':1^q}),('n','t',{'j':q}),('u','n',{'v':1})]:
    for d,s in terms.items():c[names.index(a),names.index(b),names.index(d)]=s
T=np.zeros((20,20,20),dtype=np.uint8);T[:10,:10,:10]=c
for a in range(10):
    for j in range(10):
        for b in range(10):
            T[a,10+j,10+b]=c[b,a,j]
            T[10+j,a,10+b]=c[a,b,j]
def prod(x,y):
    out=np.zeros(20,dtype=np.uint8)
    for a in np.flatnonzero(x):
        for b in np.flatnonzero(y):out^=mul[mul[x[a],y[b]],T[a,b]]
    return out
unit=np.eye(20,dtype=np.uint8)
for a in range(20):
    for b in range(20):
        for d in range(20):assert np.array_equal(prod(T[a,b],unit[d]),prod(unit[a],T[b,d])),(a,b,d)
print('T associativity: 8000 basis triples PASS')
class Span:
    def __init__(self,n):self.n=n;self.rows={}
    def add(self,v):
        v=v.copy()
        for p,b in sorted(self.rows.items()):
            if v[p]:v^=mul[v[p],b]
        nz=np.flatnonzero(v)
        if not len(nz):return False
        p=int(nz[0]);v=mul[inv[v[p]],v];self.rows[p]=v
        return True
    def rank(self):return len(self.rows)
def kernel(A):
    A=A.copy();nr,nc=A.shape;piv=[];r=0
    for j in range(nc):
        nz=np.flatnonzero(A[r:,j])
        if not len(nz):continue
        t=r+int(nz[0]);A[[r,t]]=A[[t,r]];A[r]=mul[inv[A[r,j]],A[r]]
        for i in range(nr):
            if i!=r and A[i,j]:A[i]^=mul[A[i,j],A[r]]
        piv.append(j);r+=1
        if r==nr:break
    free=[j for j in range(nc) if j not in piv];K=np.zeros((nc,len(free)),dtype=np.uint8)
    for h,j in enumerate(free):
        K[j,h]=1
        for i,p in enumerate(piv):K[p,h]=A[i,j]
    return K,r
projidx=[]
for e in (0,1):projidx.append([i for i in range(20) if np.array_equal(T[i,e],unit[i])])
print('dimensions T e, T f =',*[len(x) for x in projidx])
def projective_actions(gentypes):
    blocks=[projidx[e] for e in gentypes];dim=sum(map(len,blocks));A=np.zeros((20,dim,dim),dtype=np.uint8);off=0
    for idx in blocks:
        for j,b in enumerate(idx):
            for a in range(20):
                assert all(not T[a,b,h] for h in range(20) if h not in idx)
                A[a,off:off+len(idx),off+j]=T[a,b,idx]
        off+=len(idx)
    return A
def action_matrix(A,B):
    out=np.zeros((A.shape[0],B.shape[1]),dtype=np.uint8)
    for j in range(A.shape[1]):
        ii=np.flatnonzero(A[:,j])
        for i in ii:out[i]^=mul[A[i,j],B[j]]
    return out
types=[1];A=projective_actions(types);aug=np.zeros((1,len(projidx[1])),dtype=np.uint8)
aug[0,projidx[1].index(1)]=1;B,rank=kernel(aug)
rows=[(0,1,0,1,len(projidx[1]),B.shape[1],1)]
previous_d=None
for n in range(1,10):
    dim=A.shape[1];rad=Span(dim)
    for a in range(2,20):
        C=action_matrix(A[a],B)
        for j in range(C.shape[1]):rad.add(C[:,j])
    gentypes=[];gens=[]
    for e in (0,1):
        C=action_matrix(A[e],B)
        for j in range(C.shape[1]):
            if rad.add(C[:,j]):gentypes.append(e);gens.append(C[:,j].copy())
    assert rad.rank()==B.shape[1],('top does not span',n)
    columns=[]
    for e,g in zip(gentypes,gens):
        for b in projidx[e]:columns.append(action_matrix(A[b],g[:,None])[:,0])
    d=np.stack(columns,axis=1);K,rank=kernel(d)
    assert rank==B.shape[1],('cover not surjective',n)
    if previous_d is not None:assert not np.any(action_matrix(previous_d,d)),('d squared',n)
    else:assert not np.any(action_matrix(aug,d))
    newA=projective_actions(gentypes)
    for a in range(20):assert np.array_equal(action_matrix(A[a],d),action_matrix(d,newA[a])),('T linearity',n,a)
    pe=gentypes.count(0);pf=gentypes.count(1)
    rows.append((n,B.shape[1],pe,pf,d.shape[1],K.shape[1],pf))
    previous_d=d;A=newA;B=K
print('n syzygy_dimension multiplicity_Te multiplicity_Tf projective_dimension next_kernel_dimension dim_Ext(s,s)')
for row in rows:print(*row)
print('All maps T-linear, image=previous kernel, d squared=0, projective generators minimal modulo rad(T): PASS')
```

Saved output:

```text
field polynomial = 0x11d; q=2; multiplicative order = 255
T associativity: 8000 basis triples PASS
dimensions T e, T f = 12 8
n syzygy_dimension multiplicity_Te multiplicity_Tf projective_dimension next_kernel_dimension dim_Ext(s,s)
0 1 0 1 8 7 1
1 7 1 0 12 5 0
2 5 1 0 12 7 0
3 7 1 1 20 13 1
4 13 2 0 24 11 0
5 11 2 0 24 13 0
6 13 2 1 32 19 1
7 19 3 0 36 17 0
8 17 3 0 36 19 0
9 19 3 1 44 25 1
All maps T-linear, image=previous kernel, d squared=0, projective generators minimal modulo rad(T): PASS
```

## Input snapshot hashes

| Read-only input | SHA-256 |
|---|---|
| `scratch/V-E-frozen.md` | `b631bbc15d5bcb60099706729a8b549c2420705f47b76f650c2512f184813601` |
| `audit/report-notation.md` | `f69ee451cfbff429f46196434626154173f6ed52cc4657c8c8976e20fd6db8d5` |
| `.cache/ar-src/main.tex` | `c4da7a8976713e71ad392c2dfa451c216436f5fcf09cce609f85236abfe64208` |
| `.cache/ar-src/03-algebra.tex` | `f3da85912c346824c1532feb9b410e169a0b520e8261ebbea2a95e8527908af5` |
| `.cache/ar-src/04-resolution.tex` | `d19c8a962c5883d1f53d920604c137229b01c9c8370a17ca6fbfa0abbdbf2636` |
| `.cache/ar-src/05-cones.tex` | `6ead1fdaec5fadea2a66c5b7aeace86dbf602f7a3766cc2c00a62b712c926eb3` |
| `.cache/ar-src/06-lift.tex` | `1005f67f0188b8a02c43c1ef67062b785476ad648363eecd1704999ba6a21e39` |
| `.cache/ar-src/07-branches.tex` | `a6d5866ab571891f6845de6dd31b500fa57c9a27f1ac805c3dacd77cb561de66` |
| `.cache/ar-src/08-consequences.tex` | `79abd114831c82382ca0f241368932b7fe7728f5eff88310d7fa327f6cbf72ce` |
| `.cache/ar-src/09-cochain.tex` | `838a489943b88b3501248a02d4835d09124a6b0002834de6fd380057948d340a` |
| `.cache/ar-src/02-conversion.tex` | `816fd48bbb39b30678b89175bfbafc2b06dbca4ab244935d17ecb37a2c76daca` |

## Final reproducibility and convention check

All five embedded Python blocks were extracted from this report and executed
in fresh namespaces. Their complete outputs matched the saved text exactly.
The frozen dossier still has its initial SHA-256 digest. `git diff --check`
passes for this report.

The binding notation file changed concurrently during this audit. Its initial
SHA-256 was `18f7d074a008866cefe229e6c2d8cd0025dc5d71874adf5c5427958919227488`;
the final reread has SHA-256
`f69ee451cfbff429f46196434626154173f6ed52cc4657c8c8976e20fd6db8d5`.
Line 20 now allows projective summands in kernels of projective covers in
general and distinguishes stable syzygies; line 23 expands the graded Toda
translation. Both changes were reread. They do not change the verdicts here:
the C-resolution syzygies have dimension three whereas its indecomposable
projectives have dimensions four and six; the T, E and E^e arguments are over
symmetric algebras, where a projective summand in the kernel of a projective
cover would split off as an injective submodule and contradict superfluity.
The proof in scope does not use a Toda bracket. No other mathematical
convention changed between the two displayed versions.

Source-to-old-script equality and historical giant-matrix receipts remain
unverified as stated above. The snapshot table records the final notation
version and the exact source files used by the embedded computations.

The lead verifier identifies as GPT-6; the model variant and effort are not
available. Three parallel Codex readers checked cones, cocycle/lifts, and
fibre/consequences; no model switch is inferred from older repository metadata.
The lead reread the entire frozen proof, inspected the reported findings and
code, and reran all five certificates. A preliminary memory-registry lookup
was limited to general workflow guidance; no prior V-E mathematics or excluded
proof dossier was used as evidence.
