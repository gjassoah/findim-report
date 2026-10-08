Model: unknown; effort: unknown.

# Codex job 12: independent review of the Toda vanishing argument

Date: 2026-10-08. Scope: the proposed ungraded vanishing statement for a
finite-dimensional symmetric algebra, its polynomial-Ext consequence, and
its compatibility with the six-dimensional example in audit 11. This is a
fresh mathematical review, not an author certification. Only this report
is written. No files in `log/` or `LEDGER.md` were read.

Verdict: no error found. Status: AI-proved. The argument below justifies
the statement in every characteristic. The duality input and its
naturality were checked in a pinned source; the bracket inclusion is
derived directly at the differential graded level. This review alone
does not assert that the separate, project-wide AI-verified threshold
has been met.

## Statement and conventions

Let A be a finite-dimensional symmetric algebra over a field k. Let s be
a non-projective simple A-module with End_A(s)=k. Write

    H^n = stable Hom_A(s,s[n]),       [1] = Omega^(-1).

For x in H^a and y in H^b, the product is

    xy = x[b] composed with y.

All products are written right to left. The claim under review assumes
H^1=H^2=H^4=0 and 0 != tau in H^3. If beta generates H^(-1), the conclusion
is that the triple bracket <tau,beta,beta> is defined and equals {0}.
No grading, automorphism, periodicity, or multiplication condition on tau
is used.

## Duality source

The source checked is Markus Linckelmann, *Tate duality and transfer in
Hochschild cohomology*, arXiv:1211.5999v1, 26 November 2012, Section 2,
equations (2.1)--(2.3), printed pages 3--4, and (2.7)--(2.8), pages 5--6.
The [repository PDF](https://openaccess.city.ac.uk/id/eprint/1949/1/1211.5999v1.pdf)
contains an added cover sheet; its PDF pages 4--7 are the cited pages.
The [arXiv record](https://arxiv.org/abs/1211.5999) lists only version 1.
The library bibliography was searched for this title; no entry was found.
The source was read remotely and no PDF was saved.

The standing assumptions are a field k, a finite-dimensional symmetric
k-algebra A, and finitely generated left modules. The source defines
Sigma as the cokernel of an embedding into an injective, hence as the
inverse of Omega on the stable category. Equation (2.3) gives

    stable Hom_A(V,Omega U) = D stable Hom_A(U,V),

and the accompanying sentence says it is "natural in U and V". The
product compatibility in (2.7) is

    T(zeta eta)(tau) = T(zeta)(eta tau).

These are precisely the duality and naturality needed here. No statement
about transfer maps is used, and no originality claim is made.

## Degrees and the composition step

The required form of Tate duality is a natural perfect pairing

    stable Hom(X,Y) x stable Hom(Y,X[-1]) -> k,
    (f,g) |-> tr_X(gf).

To check that composition, rather than an unrelated vector-space
pairing, occurs, write the isomorphism as Phi_(X,Y). Define
tr_X(h)=Phi_(X,X)(h)(id_X). Naturality in Y, applied to f:X->Y, gives

    Phi_(X,Y)(g)(f)=Phi_(X,X)(gf)(id_X)=tr_X(gf).

Here f is an ordinary morphism between X and the object Y=s[3]; no
permutation of homogeneous factors or cyclic trace identity is required.

For X=s and Y=s[3], its second factor identifies with H^(-4): the class
gamma corresponds to gamma[3]:s[3]->s[-1]. Thus the pairing on the two
factors is tr_s(gamma tau), in the order required by the argument. Because
the identity of a non-projective simple cannot factor through a
projective, H^0=End_A(s)=k. The same duality gives H^(-1)=D H^0=k.
Non-degeneracy therefore permits the choice gamma tau=beta after scaling
gamma by a non-zero scalar.

The remaining duality consequences and degrees are

    H^(-2) = D H^1 = 0,
    H^(-3) = D H^2 = 0,
    H^(-5) = D H^4 = 0,
    tau beta in H^2 = 0,
    beta gamma in H^(-5) = 0,
    <tau,beta,gamma> contained in H^(-3) = 0.

In particular beta^2=0, either from H^(-2)=0 or from
beta^2=beta(gamma tau)=(beta gamma)tau. Both brackets are defined.

For an explicit sign check, use the endomorphism differential graded
algebra of a complete projective resolution, with cohomological
differential d satisfying

    d(XY)=d(X)Y+(-1)^|X| X d(Y).

Choose cycles T, B and G of degrees 3, -1 and -4 representing tau, beta
and gamma. There are U of degree 1 and V of degree -6 such that

    dU=TB,       dV=BG.

The triple bracket is represented, in this convention, by

    R=TV+UG,       |R|=-3.

Indeed d(TV)=-TBG and d(UG)=TBG. Because H^(-3)=0, there is W of degree
-4 with dW=R. The product GT represents gamma tau=beta. The elements U
and VT are a defining system for <[T],[B],[GT]>, since

    dU=TB,       d(VT)=BGT.

Its bracket representative is

    T(VT)+U(GT)=(TV+UG)T=d(WT).

Thus zero belongs to <tau,beta,beta>. This proves the claimed inclusion

    <tau,beta,gamma> tau subset <tau,beta,gamma tau>

in the stated differential graded convention. It uses associativity and
the Leibniz rule, not graded commutativity or a cyclicity assertion about
the bracket. Conventions changing an overall bracket sign preserve the
conclusion that zero belongs to it.

One can also keep the identical cycle B in both beta slots. Choose E of
degree -2 with dE=GT-B, and set K=VT+BE, of degree -3. The signs are

    d(BE)=-B(GT-B),       dK=B^2,
    d(UE)=TBE-U(GT-B),
    TK+UB=(TV+UG)T+d(UE)=d(WT+UE).

Thus U and K are explicit nullhomotopies for TB and B^2 whose original
bracket representative is exact. No appeal to a representative-change
convention is needed for the vanishing conclusion.

For a triple of degrees (a,b,c), varying the nullhomotopies changes the
bracket value by the subgroup

    x H^(b+c-1) + H^(a+b-1) z.

For (a,b,c)=(3,-1,-1), this is tau H^(-3)+H^1 beta=0. Hence the bracket
is the singleton {0}. These calculations hold in characteristic 2 as
well as in other characteristics.

## The six-dimensional example

Status: AI-proved for the following path and chain-map calculations in
characteristic 2. They were recomputed directly from the two-cycle with
all paths of length 3 zero, using the data in audit 11 as a lead. The
algebra has basis e1,e2,a,b,ab,ba, where a:1->2 and b:2->1. The linear
form taking value 1 on ab and ba and value 0 on the other basis elements
has a symmetric non-degenerate multiplication pairing: the dual pairs
are (e1,ba), (e2,ab) and (a,b). This checks symmetry independently of
its identification with T(k A2).

The indecomposable projectives have bases

    Ae1 = span(e1,a,ba),       Ae2 = span(e2,b,ab).

Right multiplication by an arrow has a one-dimensional kernel spanned
by the length-two path; right multiplication by a length-two path has
the two-dimensional radical as kernel. Thus the displayed resolution
with vertex pattern (1,2,2,1) and differentials (a,ab,b,ba) is exact and
minimal in every degree. Applying Hom_A(-,s) gives zero differentials,
so H^n=k for n congruent to 0 or 3 modulo 4, and H^n=0 otherwise.

Write v for the degree-4 identity shift. The degree-3 endomorphism f
and the degree-5 endomorphism t have right-multiplier components

    f_i = (e1,b,e2,a),       t_i = (0,e2,0,e1).

For maps x,y of degrees r,q, the component of xy is right multiplication
by y_(i+r) x_i. The following four-residue table checks the relations;
the columns for df show its two summands, which cancel in characteristic
2. All other displayed entries are actual multipliers.

| i modulo 4 | first df term | second df term | f^2 | dt | ft | tf |
|---|---|---|---|---|---|---|
| 0 | ba | ba | a | a | e1 | 0 |
| 1 | ab | ab | b | b | 0 | e2 |
| 2 | ab | ab | b | b | e2 | 0 |
| 3 | ba | ba | a | a | 0 | e1 |

Consequently df=0, dt=f^2 and ft+tf=v^2. The degree-3 class of f is
non-zero because its component P3->P0 induces the identity on the
simple top; v is an invertible degree-4 class. All displayed sequences
are four-periodic, so v commutes strictly with f and t. Taking

    tau=f,       beta=f v^(-1),       gamma=v^(-1)

gives gamma tau=beta, but beta gamma=f v^(-2) is non-zero because f is
non-zero and v is invertible. It belongs to H^(-5)=k, dual to H^4=k.
Hence <tau,beta,gamma> is undefined. This is the precise failed step of
the vanishing argument in this example.

The nullhomotopies t v^(-1) for tau beta and t v^(-2) for beta^2 give

    <tau,beta,beta> = {(ft+tf)v^(-2)} = {id_s},

with zero indeterminacy because H^(-3)=H^1=0. There is no contradiction:
this example fails H^4=0, and its positive Ext algebra is not k[tau].

## Polynomial positive Ext

Status: AI-proved. Suppose Ext_A^*(s,s)=k[tau] with |tau|=p>=3. In
positive degrees, ordinary Ext agrees with H. For p=3, the assumed
vanishings H^1=H^2=H^4=0 hold, so the preceding argument applies.
For p>3, tau beta belongs to H^(p-1)=0 and beta^2 belongs to
H^(-2)=D H^1=0, so the bracket is defined. Its target is H^(p-3)=0,
since 0<p-3<p. Thus <tau,beta,beta>={0} for every such p.

Changing a grading or an automorphism family does not remove this
obstruction to the specific bracket required in job 12. The theorem
does not classify constructions using different objects or different
bracket inputs.

The point requiring the most attention in an author review is the
duality-induced factorisation gamma tau=beta. Its justification uses
the functorial form of Tate duality above, not only equality of the
dimensions of H^3 and H^(-4). No unresolved mathematical gap was found
in this limited audit. No cone, twist-family, or module search was
performed.

## Reproducible sign check

This exact calculation in a free differential graded algebra over the
integers checks the three identities used for the defining system. The
script is embedded to respect the instruction to write only this report.
It does not assume any graded commutation rule.

```python
# Codex job 12 independent review.
# Claim: the displayed Toda defining system has the claimed differential.
# Cases: formal generators over Z, so the identities hold in every characteristic.
# Conventions: right-to-left noncommutative products; differential of degree +1.
from collections import Counter

degree = dict(T=3, B=-1, G=-4, U=1, V=-6, E=-2, W=-4)
derivative = dict(T={}, B={}, G={}, U={'TB': 1}, V={'BG': 1},
                  E={'GT': 1, 'B': -1}, W={'TV': 1, 'UG': 1})

def clean(poly):
    return {word: coeff for word, coeff in poly.items() if coeff}

def add(*polys):
    out = Counter()
    for poly in polys:
        for word, coeff in poly.items():
            out[word] += coeff
    return clean(out)

def mul(left, right):
    out = Counter()
    for x, a in left.items():
        for y, b in right.items():
            out[x+y] += a*b
    return clean(out)

def diff(poly):
    out = Counter()
    for word, coeff in poly.items():
        prior_degree = 0
        for i, letter in enumerate(word):
            sign = 1 if prior_degree % 2 == 0 else -1
            for replacement, value in derivative[letter].items():
                out[word[:i]+replacement+word[i+1:]] += coeff*sign*value
            prior_degree += degree[letter]
    return clean(out)

R = {'TV': 1, 'UG': 1}
K = {'VT': 1, 'BE': 1}
Q = {'WT': 1, 'UE': 1}
assert diff(R) == {}
assert diff(K) == {'BB': 1}
assert diff(Q) == add(mul({'T': 1}, K), {'UB': 1})
assert all(diff(value) == {} for value in derivative.values())
print('PASS over Z: dR=0; dK=B^2; dQ=TK+UB; d^2=0 on generators.')
```

Executed with Python using only its standard library; exit code 0.
Saved output:

```text
PASS over Z: dR=0; dK=B^2; dQ=TK+UB; d^2=0 on generators.
```
