Model: GPT-6 (Codex); effort: unknown.

# Codex job 06: the near-miss test bed

Completed 2026-10-07. Genre: computational research audit; AI-written.
All numerical conclusions below have status **supported**, with exactly the
field and degree scope specified here. No deviation from the requested
positive-degree pattern was found.

Three random primitive parameter triples in F_(2^16) give the same results
through degree 6. Exact arithmetic over F_2(q,H1,H2) gives the same results
through degree 2. The stable endomorphism space has dimension 1 in all four
runs, so Z_0 is nonprojective. Its ordinary endomorphism space has dimension
5, of which the maps factoring through projectives form a subspace of
dimension 4. The construction gives dim Lambda_0=80, four simples,
Q=Tf of dimension 8, Y_0 of dimension 9, and Z_0 of dimension 10.

## Dimensions

In the table, degree zero Ext means ordinary Hom. Write
P_a -> Omega^a Z_0 for the minimal projective cover. Betti multiplicities
are in vertex order (upper e, upper f, lower e, lower f); the corresponding
indecomposable projectives have dimensions (36,24,12,8).

| a | dim Ext^a(Z_0,Z_0) | dim Ext^a(Z_0,Lambda_0) | dim Omega^a Z_0 | Betti multiplicities of P_a | dim P_a |
|---|---:|---:|---:|---|---:|
| 0 | 5 | 22 | 10 | (0,1,0,1) | 32 |
| 1 | 1 | 0 | 22 | (1,0,0,1) | 44 |
| 2 | 0 | 0 | 22 | (1,0,1,0) | 48 |
| 3 | 0 | 0 | 26 | (1,1,1,0) | 72 |
| 4 | 0 | 0 | 46 | (2,0,1,1) | 92 |
| 5 | 0 | 0 | 46 | (2,0,2,0) | 96 |
| 6 | 0 | 0 | 50 | (2,1,2,0) | 120 |
| 7 | not computed | not computed | 70 | (3,0,2,1) | 140 |

The next kernel, Omega^8 Z_0, also has dimension 70. The finite-field runs
all reached the requested cutoff: none stopped early. The exact-field run
computed Ext through degree 2, covers through P_3 and syzygies through
Omega^4. Higher exact-field degrees were not attempted.

The Hom-complex dimensions and outgoing differential ranks, in degrees
0,...,6, are

| target | cochain dimensions | outgoing ranks |
|---|---|---|
| Z_0 | (6,5,4,5,9,8,9) | (1,3,1,4,5,3,6) |
| Lambda_0 | (32,36,48,56,84,96,104) | (10,26,22,34,50,46,58) |

Subtracting the outgoing rank and the preceding outgoing rank gives the
Ext dimensions above (there is no incoming differential at degree zero).
The saved JSON files retain both adjacent ranks explicitly.

## Parameters and reproducibility

Let b be the primitive root of
`x^16+x^5+x^3+x^2+1` used by SageMath. The table lists the exponents of
(q,H1,H2) as powers of b. Each individual parameter has order 65535.
The script explicitly tests H1^m != H2^m for m=1,...,100.

| case | Python random seed | exponents (q,H1,H2) | order H1/H2 | run time |
|---|---:|---|---:|---:|
| 0 | 6062026 | (48448,2749,15926) | 65535 | 694 s |
| 1 | 6062027 | (63731,13111,8078) | 65535 | 1081 s |
| 2 | 6062028 | (49513,57191,64202) | 21845 | 1056 s |

The exact-field run took about 62 seconds. Some runs overlapped, so these
wall times are not benchmarks. Environment: Python 3.14.7, SageMath 10.10.
The system Sage launcher rejected `sage -python`; the successful runs use
`python3` with Sage installed and a local `DOT_SAGE`. An initial finite run
was interrupted while improving the minimality check; the retained runs
all completed with exit status zero.

Commands, headers and saved outputs are in
[`computations/03-testbed-lambda0/`](../computations/03-testbed-lambda0/README.md).
The main evidence is `result-{0,1,2,exact}.json` and the matching `case-*.out`;
`summary.out` reconciles all cases, checks input hashes and dimension
identities, and checks the independently computed Hom and comparison data.
`SHA256SUMS` pins the scripts, outputs and source snapshot.

## Inputs and conventions

Inputs read: the repository instructions and job file, all five job 04
scripts, and the relevant cached preprint sources. The source is the supplied
local snapshot of *An explicit counterexample to the Auslander--Reiten
conjecture*, dated September 23, 2026 in `main.tex`; no arXiv version number
is inferred. Its source hashes are recorded in `SHA256SUMS`.

The multiplication table in `01_algebra.py` agrees entry by entry with
`03-algebra.tex`, equations `alg:C-corners` and `alg:C-products`; the dual
actions in `04_trivial_extension.py` agree with `alg:dual-actions`.
The reused C and T constructors and their structural audits were rerun in
each field. The Lambda construction, quotient module, minimal covers and
Hom computations are new code for this job.

Conventions: left modules, column matrices, right-to-left composition,
characteristic two. The source specifies the right twist in `06-lift.tex`
and `07-branches.tex`: u.a=u h_H(a). The balanced identification
T_h tensor M -> {}_(h^-1)M sends a tensor m to h^-1(a)m; this accounts for
the inverse scalars in the comparison check below. Here A=T, as requested.
The injection s -> Tf sends 1 to the basis letter dual to f.

## What the computation checks


The triangular algebra has basis blocks (upper T, lower T, first U, second U).
The four projectives, in vertex order (upper e, upper f, lower e, lower f),
have dimensions (36,24,12,8). Every one of the 80^3 associators is tested.
The non-idempotent basis span is tested to be an ideal and nilpotent;
its quotient is the four-dimensional diagonal algebra. The displayed radical
support counts are upper bounds on the dimensions of its powers, not ranks
claimed for those powers.

The lower component is constructed as the actual quotient of s+s+Tf by
(1,1,dual f). A projection and section are stored in the code and their
identities checked. Every one of the 80^2 module action identities is tested.

At every degree, the cover algorithm selects generators modulo the radical,
builds the corresponding direct sum of left principal projectives, checks
surjectivity and linearity on an algebra-generating set, and computes the
kernel. The kernel's generator-coordinate rows are zero, which tests that
it lies in the radical of the projective. Its restricted actions are checked
against the inclusion for all 80 basis elements. Thus the resolution and
Betti multiplicities are obtained without using any predicted Ext dimension.

For a target N, a map from a projective summand Lambda e to N is specified by
an element of eN. Evaluation on those generators constructs the Hom
differentials. Consecutive differentials are multiplied and checked to give
zero. The outputs retain the cochain dimensions and both adjacent ranks.

For stable End, let p:P_0 -> Z be the computed projective cover. The code
computes Hom(Z,P_0) as the kernel of its first Hom differential and the rank
of the map induced by p into End(Z). Every projective factorisation
Z -> P -> Z factors through p, since the second map lifts to P_0 by
projectivity of P. Conversely, every map in this image factors through P_0.
This justifies the computed quotient without assuming Gorenstein projectivity.

## Relation of the explicit extensions to delta^0

The explicit checks in this section were run in finite case 0 and over
F_2(q,H1,H2), with the same results. Write rho(a) for the action on Z.
For i=1,2, define B_i(a)=rho(a) on the ith off-diagonal bimodule summand
and B_i(a)=0 on the other three blocks. The matrices
`[[rho(a),B_i(a)],[0,rho(a)]]` define self-extensions: the code checks
`rho(a) B_i(b)+B_i(a) rho(b)=B_i(ab)` on all 6400 basis pairs for each i.
Direct intertwiner equations give dim End(Z)=5 and dim Hom(Z,Lambda)=22,
agreeing with the projective-resolution computation.

The coboundary matrix has rank 37. Adjoining either B_i raises its rank
to 38; adjoining both still gives 38, while adjoining B_1+B_2 gives 37.
Thus `(c_1,c_2) -> [c_1 B_1+c_2 B_2]` has kernel spanned by (1,1).

The independent script also identifies the branch variations with variations
of the conversion quotient. In coordinates Y=s_2+Q, the first structure map
sends 1 to s_2+i(1), and the second sends 1 to s_2. Replacing v_0 by
(1+epsilon*c_1,1+epsilon*c_2) over the dual numbers changes the first map by
c_1(s_2+i(1))+c_2*s_2. The c_1 variation is B_1. The c_2 variation differs
from B_2 by the coboundary of the projection Y -> s_2; the script checks
this identity on every algebra basis element.

The independent calculation also checks stable End_T(s)=k and
Ext_T^1(s,s)=0: the socle of Tf is one-dimensional and killed by its simple
quotient, while the top of rad(Tf) has no f-simple summand. Thus delta^0
has the matrix [[1,1],[1,1]], and delta^1 has zero source and target.
The explicit extension map has diagonal kernel and one-dimensional image.
Together with dim Ext^1_Lambda(Z,Z)=1, this checks the cokernel identification
in the computed fields, rather than only noting equal dimensions.

These are **supported** checks in the recorded fields. The argument that the
explicit map realises the source comparison is given above; this job does not
certify the preprint's general complete-resolution conversion proposition.

## Comparison maps in positive degrees

Additional independent comparison computation (**supported**, case 0):
`comparison.py` constructs a minimal T-resolution of s and solves the chain
lifting equations into the h_H^-1-twisted resolution, checking linearity and
commutation with the differentials. It computes the induced action on
Hom(P_a,s), whose differentials vanish by the checked minimality.

| a | dim Ext_T^a(s,s) (stable Hom for a=0) | rank delta^a | dim ker | dim coker |
|---|---:|---:|---:|---:|
| 0 | 1 | 1 | 1 | 1 |
| 1 | 0 | 0 | 0 | 0 |
| 2 | 0 | 0 | 0 | 0 |
| 3 | 1 | 2 | 0 | 0 |
| 4 | 0 | 0 | 0 | 0 |
| 5 | 0 | 0 | 0 | 0 |
| 6 | 1 | 2 | 0 | 0 |

The computed twist scalars are H_i^-1 at degree 3 and H_i^-2 at degree 6.
Their values are computed by chain lifts and then compared with these
expressions; the expressions are not used to construct the lifts.
The dimensions `coker(delta^(a-1)) + ker(delta^a)` agree with the independent
Lambda self-Ext computation for a=1,...,6. Thus the only failed comparison
hypothesis in this tested range is surjectivity of delta^0.


## Scope and limitations

The finite data support exactly the intended near miss through degree 6:
Ext^1(Z_0,Z_0) is one-dimensional, the other requested positive Ext groups
vanish, and Z_0 is nonprojective. The failure of surjectivity of delta^0 is
also checked directly, including a nonzero extension representative.

No all-degree conclusion follows from these finite computations. In
particular, the finite-field parameters have finite multiplicative order.
The exact rational-function calculation covers only Ext degrees 0,1,2.
This job does not certify the general triangular conversion proposition,
the full Auslander--Reiten preprint, or a finitistic-dimension counterexample.

The intertwiner, extension-cocycle and comparison-chain calculations give
checks of different kinds, but share the inspected algebra constructors;
there was no independent human or formal verification. This shared input
is the main remaining implementation dependence.

Only the requested report and output directory were written by this job.
The prohibited directories and ledger were not opened, and no commit or
push was made. Concurrent work was left untouched.
