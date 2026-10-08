Model: GPT-6 (Codex); effort: unknown (the job requests max).

# Codex job 12: one-factor search

Date: 2026-10-08. This is a running AI research report, not human
certification. Inputs are read-only. Only this report and
`computations/07-one-factor-search/` are written. Neither `log/` nor
`LEDGER.md` is read. Genre: research audit; no manuscript is edited.

## Checkpoint

Completed. Step 1 has the scope corrections below. Step 2 has a general
obstruction, with status AI-proved, promoted from the initial plausible
outline after checking the composition inclusion and Tate pairing. A
fresh-context audit found no error. Three concrete attempts fail the Ext
requirement; all computations and controls have completed. The stopping
rule applies after step 2: no eligible candidate remains for steps 3--4.

Conventions: left modules; products are composition right to left;
[1]=Omega^-1; H^a=stable Hom(s,s[a]); internal map degree is delta;
the right-twisted tensor functor has character H^delta, restriction along
the same scaling automorphism has character H^-delta. A triple bracket
<x,y,z> has degree |x|+|y|+|z|-1. Signs will be recorded in the argument;
finite computations use characteristic two.

## 1. Fable's sections 2.1--2.4

Statuses here are assessments from this job, not inherited labels.

| Passage | Verdict and scope | Status |
|---|---|---|
| 2.1 | Correct for a graded symmetric form concentrated in degree N and a graded simple: delta(beta_0)=N, and dual homogeneous classes have internal degrees summing to N. | AI-proved |
| 2.2 | Correct as a necessary weight condition for degree three. It is not sufficient. For polynomial generator degree p>3 the target H^(p-3) already vanishes, so a zero weight sum cannot help. | AI-proved |
| 2.3 | Correct for the AR connecting-map mechanism with the dual-simple identification stated explicitly. The phrase '(simple)' alone omits that hypothesis. | AI-proved, corrected scope |
| 2.4 | Every defined homogeneous triple bracket of elements of H*(s,s) contains zero. Include all permutations of the one-positive/two-negative pattern; Fable's list as printed is incomplete. This does not classify arbitrary maps between cones or higher brackets. | AI-proved, corrected scope |

There is an additional error in the last sentence of 2.4: eTe has
dimension eight, whereas the quantum exterior corner eCe has dimension
four. The conclusion that the e-simple cannot have the requested
polynomial Ext algebra in generator degree at least three survives:
its Ext^1 has dimension two. This is supported by a direct minimal-cover
calculation over F_2(q) in `validation.json`.

For 2.1, the graded bimodule identification supplied by the form gives
the natural perfect pairing between Hom_A(P,M) and Hom_A(M,P), for
finite graded projectives P, with total internal degree N. For P=A
it sends (f,g) to lambda(g(f(1))); the degree sum must be N, and
nondegeneracy is the Frobenius identification Hom_A(M,A)=D M with
that degree shift. Finite sums, summands and shifts give the general
projective case. Applying this termwise to a graded complete resolution
gives the stable pairing of total internal degree N. Pairing the
identity (degree zero) with its dual gives
delta(beta_0)=N. In the AR code this can be read without invoking the
general statement: `witness.py` has beta_0(1)=F and tau(V)=1, where F and
V are dual letters. Thus their internal degrees are 1 and -1. The Casimir
summands w tensor w* all have total internal degree N; applying a
degree-preserving twist does not change it. This checks the weight claim
for the conversion-type lift; it does not assert that every arbitrary lift
is nonzero or homogeneous.

For 2.2, the target is H^(p-3) and the indeterminacy at p=3 is
tau H^-3 + H^1 beta_0. Polynomial Ext and symmetric duality make both
summands zero. A homogeneous defining system has internal degree
delta(tau)+2N. Since H^0=k has degree zero, a nonzero scalar bracket would
require delta(tau)=-2N. The argument uses integer grading, not distinct
characters on the points of a finite field.

For 2.3, take C and s in internal degree zero. The nonzero homology of
DC tensor_C R lies in internal degree one. The required ungraded
identification is D Ext_C^d(s,C) congruent to s, not merely that this
module is some simple. The connecting class is then a degree-zero map
to a copy of s in internal degree one; after identifying that copy with
the unshifted s its internal degree is -1. Replacing DC-degree one by
N gives delta(tau)=-N, delta(beta_0)=N, still with nonzero sum N
when N is nonzero. As a check on the omitted hypothesis, for C=k(1->2)
the left source simple has Ext_C^1(s,C) equal to the right simple at
vertex 2, whose dual is not s. This is not the AR self-returning triangle.

For 2.4, use the AR polynomial Ext profile over F_2(q), with the
self-returning triangle just described. The uniform C-resolution in
`.cache/ar-src/04-resolution.tex`, `res:base`, has the needed hypotheses:
its two pivot families are 1+q^i (i>=1) and 1+q^(i+2) (i>=0), nonzero
over this field. Its induction triangle `res:triangle` gives multiplication
by the connecting class as an isomorphism E^(n-3)->E^n for n>=2.
The cocycle's nonzero evaluation makes it a scalar multiple of that class.
Thus write tau^a in degree 3a with internal degree -a, and beta_i
in degree -3i-1 with internal degree i+1. Exactly one negative input
gives a target degree congruent to 1 modulo 3, hence a zero group.
Exactly two negative inputs, in any order, give total degree
3(a-i-j-1). If this group is nonzero, its internal degree is
-(a-i-j-1), whereas the sum of input degrees is -a+i+j+2, one more.
Three negative inputs give degree -3(i+j+l+1)-1, whose internal
degree is i+j+l+2, again one less than the input sum. With no negative
input a nonzero bracket target could only arise from three degree-zero
units; that triple is not defined. If an input is zero, choose its
representative and adjacent nullhomotopy zero. Thus every defined case
has a homogeneous defining system with zero cohomology class. A nonzero
indeterminacy can remain; the assertion is 'contains zero', not '{0}'.

Stopping decision after step 1: proceed. The six-dimensional control
shows the grading obstruction is not universal, but it does not satisfy
the polynomial Ext requirement.

## 2. A grading-independent obstruction

**Claim (AI-proved).** Let A be a finite-dimensional symmetric k-algebra,
and let s be a nonprojective simple with End_A(s)=k. Suppose

    Ext_A^1(s,s) = Ext_A^2(s,s) = Ext_A^4(s,s) = 0.

For every nonzero tau in Ext_A^3(s,s) and every beta in H^-1,

    <tau,beta,beta> = {0}.

This does not require polynomial multiplication, an internal grading,
an automorphism family, or a dimension bound.

Argument. Since s is nonprojective, a nonzero scalar endomorphism cannot
factor through a projective. Thus H^0=k. Symmetric Tate duality gives
D H^a=H^(-a-1), with perfect pairings induced by composition and a
trace H^-1->k. In particular, H^-1 is one-dimensional. For beta nonzero,
choose gamma in H^-4 with

    gamma tau = beta.

This uses the perfect pairing against the chosen nonzero tau, followed
by a scalar normalisation; it does not invert tau. The zero beta case
has the zero defining system and the same zero indeterminacy.

The displayed Ext vanishings now imply

    tau beta in H^2=0,
    beta^2 in H^-2=D H^1=0,
    beta gamma in H^-5=D H^4=0,
    H^-3=D H^2=0.

Therefore <tau,beta,gamma> is defined and lies in H^-3=0. The elementary
outer-composition inclusion for Toda brackets gives

    {0} = <tau,beta,gamma> tau
          subset <tau,beta,gamma tau> = <tau,beta,beta>.

Here is a direct check of that inclusion. For an unshifted composable
triple X --f--> Y --g--> Z --h--> W, form a triangle
Y --g--> Z --i--> C --q--> Y[1].
A defining system consists of a:X[1]->C and b:C->W with
qa=f[1] and bi=h; its value is ba. Given u:X'->X, the same b and
a u[1] form a defining system for f u, with value b a u[1]. This is the
stated inclusion after the shifts in the graded endomorphism ring.
It requires gf=hg=0 for the original triple; beta gamma=0 is precisely
the extra condition that supplies this here.

Finally, the indeterminacy of <tau,beta,beta> is
tau H^-3 + H^1 beta=0, so containing zero means being {0}.

For a signed dg check, take closed representatives T,B,G of degrees
3,-1,-4 and choose dU=TB, dV=BG. The degrees of U,V are 1,-6,
and D=TV+UG is closed because d(TV)=-TBG and d(UG)=TBG.
Since H^-3=0 there is W of degree -4 with dW=D. The defining system
U,VT for the triple T,B,GT gives

    T(VT)+U(GT) = (TV+UG)T = d(WT).

This argument works over every characteristic. It does not assume
commutativity of the endomorphism dg algebra or equality of the two
cochain representatives of beta.

The Tate input was checked against Linckelmann, *Tate duality and transfer
in Hochschild cohomology*, arXiv:1211.5999v1 (26 November 2012), Section 2,
equations (2.1)--(2.3), printed pages 3--4, and (2.7)--(2.8), pages 5--6.
The source states 'which is natural in U and V' after (2.1), and writes
the composition identity as <zeta eta,tau>=<zeta,eta tau> in (2.8).
Both apply to finitely generated left modules over a symmetric algebra
over a field, with suspension Sigma=Omega^-1. Source read online:
[pinned v1 PDF](https://openaccess.city.ac.uk/id/eprint/1949/1/1211.5999v1.pdf).
No external paper was downloaded into this repository or the library.

**Consequence (AI-proved).** No pair satisfying the task's polynomial
Ext hypothesis in degree three can have the required nonzero bracket.
If the polynomial generator has degree p>3, the bracket is defined
but belongs to H^(p-3)=0, so it vanishes in that case as well. This
excludes the specified bracket for all the proposed algebra families,
including algebras with no grading. It does not exclude different
brackets, nonscalar stable endomorphism rings, or a redesigned conversion
construction.

## 3. Concrete attempts and computational evidence

The following three pairs were screened as attempts, not accepted as
pairs satisfying all of step 2. The original AR pair is a separate
control. Status of the numerical data: supported in the stated fields.
Every simple mentioned has endomorphism ring k.

| Attempt | Explicit algebra and simple | Dimension / simples | Reason to try it | First failed requirement |
|---|---|---|---|---|
| A | B=k(1 --a--> 2 --b--> 1)/(aba,bab), s at 1 | 6 / 2 | Length grading has symmetric form degree N=2, delta(tau)=-4, delta(beta)=2; no weight obstruction. | Ext^4=k and tau^2=0, so Ext is not k[tau]. |
| B | B tensor k[epsilon]/(epsilon^2), s tensor k | 12 / 2 | Tensor of symmetric algebras; give epsilon degree zero, preserving the balanced weights of A. | Ext^1=k. |
| C | T(T_AR), with the f-simple inflated along T(T_AR)->T_AR | 40 / 2 | Iterated trivial extension; a symmetric form in degree two, and a diagonal scaling can balance the bracket weights. | Ext^1=k. |

For attempt A the entire complete resolution has projective vertex
pattern (1,2,2,1), repeated, and differentials given by right multiplication
by a,ab,b,ba. The script checks exactness and the bracket identities in
all four residues, and a separate minimal-cover algorithm computes its
Ext dimensions through degree 12. Scaling both arrows by H is an
automorphism and acts by H^-4 on tau in the inverse-twist convention.
It gives a nontrivial character on tau, but there are no nonzero powers
tau^m for m>=2. This is why the nonzero bracket here does not trigger
step 4. Status of the all-degree conclusion from this periodic
resolution: AI-proved.

For attempt B the symmetrising form is the tensor product of the forms
on B and the dual numbers. Its Ext profile is computed directly from
minimal covers, and also agrees with the tensor-resolution convolution.
The degree-one class comes from the dual numbers. Scaling the two arrows
and fixing epsilon preserves the balanced internal degrees of the
degree-three class, but cannot remove this extra self-extension.
Status of this explanation: AI-proved by the tensor complex; its
degree-12 numerical comparison is supported.

The tensor-resolution argument used here is as follows. Over a field,
the two augmented resolutions split as complexes of vector spaces, so
their tensor product is homotopy equivalent, as a vector-space complex,
to the tensor product of their degree-zero homology modules. Its total
complex is consequently a projective resolution over the tensor algebra.
Each differential component lies in the radical of one tensor factor,
so the resolution is minimal. Applying Hom to the tensor simple gives
zero differentials and the convolution of the two Ext-dimension lists.
Only degrees at most 12 of the factor resolutions enter these lists.

For attempt C, the map T_AR tensor k[epsilon]/(epsilon^2)->T(T_AR)
is (a tensor 1)->(a,0), (a tensor epsilon)->(0,a lambda), where lambda
is the symmetric form on T_AR. Its basis permutation and all 40^2
multiplication identities are checked. The natural grading gives old
DC degree one and epsilon degree one, so the form has degree two.
There is also a grading with old DC degree four and epsilon degree -2:
the form still has degree two, while delta(tau)=-4 and delta(beta)=2.
The 40-dimensional multiplication table is homogeneous for this grading
(`validation.json`). Thus even a balanced diagonal twist is available,
but Ext^1 remains nonzero. Direct minimal covers compute degrees 0--1;
the displayed degrees 2--12 use the checked algebra isomorphism and
the tensor product of the separately computed minimal resolutions.
Status of the tensor argument: AI-proved; numerical data: supported.

The profiles, including degree zero, are:

```text
degree           0 1 2 3 4 5 6 7 8 9 10 11 12
AR control       1 0 0 1 0 0 1 0 0 1  0  0  1
A: B             1 0 0 1 1 0 0 1 1 0  0  1  1
B: B tensor D    1 1 1 2 3 3 3 4 5 5  5  6  7
C: T(T_AR)       1 1 1 2 2 2 3 3 3 4  4  4  5
```

The AR control was reconstructed over F_2(q) and at q=a,a^7 in
F_(2^16), with a primitive of order 65535 and modulus
x^16+x^5+x^3+x^2+1. In each case the code checks the algebra table,
symmetry, radical, covers, their exactness and minimality, and all 179
Hochschild cochain entries (all 18^4 radical words). It replays the
explicit Toda certificate after redirecting only its Sage cache path.
The results are c=0 and <beta_0,beta_0,beta_0>={0}. Character separation
was checked for H1=a^11, H2=a^13 and exponents 1--12; both parameters
and their ratio have order 65535. These finite-field checks do not
assert separation for infinitely many exponents or a polynomial Ext
algebra in all degrees over a finite field.

The same scripts check attempts A and B through degree 12 over that
finite field, with symmetry and associativity verified on every basis
triple. Attempt C is checked over that field as just specified. The
bracket control for A works in characteristic two without a parameter
specialisation, hence over F_2(q) as well. In its complete resolution,
let v be the degree-four identity period, f the degree-three map, and U
the degree-five homotopy. The checked identities are

    df=0, dU=f^2, fU+Uf=v^2.

Consequently <f,f/v,f/v>={1}. Here gamma=v^-1 and
beta gamma=f/v^2 is nonzero in H^-5: the Ext^4 hypothesis of section 2
fails exactly where the auxiliary bracket would need it. This is an
AI-proved explanation of the supported chain calculation.

A further formula screen covers all 27 uniform cyclic presentations
k Q_r/J^(mr+1) with r>=2, m>=1 and dimension r(mr+1)<=60. Right
multiplication alternately by paths of lengths 1 and mr gives
P_(2j)=A e_(j(mr+1)), P_(2j+1)=A e_(j(mr+1)+1), with indices modulo r.
The first nonzero positive self-Ext degrees are 2r-1 and 2r, so none
has the required polynomial pattern. The kernels are the complementary
path-length spans, which checks exactness at every index. The trace
on paths of length mr gives the symmetric pairing by complementary
paths. Status: AI-proved for the formula; the enumeration and stored
degree-12 profiles are supported. This is a screen of that specific
family, not an exhaustive enumeration of algebras of dimension at most 60.

## 4. Verification, stopping decisions and remaining scope

- After step 1: continue with the corrected scope of Fable's claims.
- After step 2: stop the construction search. Section 2 excludes every
  pair with the exact requested polynomial Ext and bracket requirements;
  each of the three concrete attempts also fails an explicit Ext check.
- Step 3: exact bracket controls were computed (AR: {0}; six-dimensional
  algebra: {1}). No eligible new pair reached this step. Section 2 gives
  the exact value {0} for any pair satisfying the requested hypotheses.
- Step 4: not entered. No F, Lambda_1 or Z was built in this job, and
  their dimensions and Ext groups are not claimed.

The independent review is
`computations/07-one-factor-search/independent-review.md` (model and
effort unknown). It was given the statement, proposed argument and
conventions in a fresh context and asked to find errors. It found none,
checked the duality source, and supplied a same-representative signed
certificate. With dE=GT-B, K=VT+BE satisfies dK=B^2 and

    TK+UB=d(WT+UE).

`controls.py` checks these formal identities over Z independently of any
field specialisation. The claim retains status AI-proved; this report
does not substitute AI checks for an author's review. The author-review
point most worth checking is the factorisation gamma tau=beta from the
functorial Tate pairing, rather than merely from equal dimensions.

All scripts have completed successfully. The largest linear system was
37 by 78 (the degree-12 cover for attempt B), below the requested
approximately one-million-unknown bound. The algebra checks and the
formal word calculations are exhaustive only in their stated finite
bases or ranges. `validation.out` records source-hash checks, agreement
of the separately computed profiles and the two Fable scope checks.
Reproduction commands and output locations are in the computation
directory's `README.md`; `SHA256SUMS` pins the final report and evidence.

Outcome: no candidate with the stated requirements. The grading-independent
obstruction answers this particular search more strongly than a bounded
failure to find an example. Designs with different bracket inputs or
different homological requirements remain outside this result. Nothing
was committed or pushed, and no other repository file was modified.
