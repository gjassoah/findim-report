Model: GPT-6 (Codex); effort: unknown.

# Codex job 08: Candidate 1

The prediction is supported in both tested specialisations: the actual module Z has
self-Ext dimensions (1,0,0) in degrees 1,2,3, and regular-target Ext dimensions
(0,0,0). Candidate 1 therefore fails self-orthogonality in both samples.
The comparison map delta^0 has a one-dimensional cokernel.

All mathematical conclusions below have status **supported** in these two
finite-field cases. The construction and ordinary Ext computation are complete
through the requested degree. No all-parameter or all-degree claim is made.

## Results

Both cases give the following dimensions.

| Object | Dimension |
|---|---:|
| T | 20 |
| C, the bimodule cone representative | 312 |
| N = C[1], represented by a cosyzygy | 376 |
| P(N) | 688 |
| F | 352 |
| Lambda_1 | 392 |
| C tensor s | 6 |
| N tensor s | 14 |
| F tensor s | 8 |
| Y | 15 |
| Z | 16 |

| Degree a | dim Ext^a(Z,Z) | dim Ext^a(Z,Lambda_1) |
|---:|---:|---:|
| 1 | 1 | 0 |
| 2 | 0 | 0 |
| 3 | 0 | 0 |

The direct stable profile is

| a | -4 | -3 | -2 | -1 | 0 | 1 | 2 | 3 | 4 |
|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| dim W^a | 0 | 0 | 0 | 0 | 1 | 1 | 0 | 0 | 0 |

The computed space V^0 = stable Hom(s,F tensor s) has dimension two.
In the quotient basis produced by `profile.py`, with first vector v,

\[
 \delta^0:k^2\longrightarrow k^2,
 \qquad \delta^0=\begin{pmatrix}1&1\\0&0\end{pmatrix}.
\]

Its kernel is k(1,1), and its cokernel is represented by the second coordinate
line. The evaluations of the two normalised bimodule lifts agree as actual
maps s -> N tensor s, and both represent a nonzero stable class. This last
assertion is separately checked in `normalisation-{0,1}.json`.

Thus the one-factor analogue does not satisfy the degree-zero surjectivity
hypothesis of `conv:proposition`. The nonzero self-Ext in degree one was also
computed from ordinary Lambda-projective resolutions, without using that
proposition or assuming the reported value of the Toda bracket.

## Parameters

The field is k = F_2[b]/(b^16+b^5+b^3+b^2+1), with primitive generator b.
The entries below are exponents of b, selected by the recorded Python seeds.

| Case | Seed | q | H1 | H2 |
|---:|---:|---:|---:|---:|
| 0 | 8082026 | 2377 | 63797 | 37483 |
| 1 | 8082027 | 8654 | 62198 | 5212 |

All six parameter values in the table, and both ratios H1/H2,
have multiplicative order 65535. The case JSON files record the modulus,
parameters and orders. Environment: Python 3.14.7, SageMath 10.10; see
`computations/05-candidate1/environment.out`.

## Construction and one-factor choices

The source is the local September 23, 2026 preprint *An explicit counterexample
to the Auslander--Reiten conjecture*, in `.cache/ar-src/`. The relevant locators
are `cone:tail-definition`, `cone:finite`, `lift:casimir`, `lift:B`, `lift:G`,
`branch:finite-fiber`, and `conv:finite-module`. Its asserted conclusions are
not premises for the ordinary Ext calculation.

1. Work over T, with one cone having cells T and T[-2]. The lift target is
   C[1], with top projection to T[-1]; the two-factor target C[3] is not used.
   All modules are left modules, maps use columns, right multiplication
   satisfies R(ab)=R(b)R(a), and stable [1] means a cosyzygy. Characteristic
   two removes the cone signs.
2. Choose deterministic echelon bases and corner-ordered projective generators.
   Construct a minimal T-bimodule resolution through P2. Transfer the supplied
   normalised-bar cocycle to tau:Omega^3(T)->T using the left bar contracting
   homotopy. The bar comparison identities and all 40 bimodule-action equations
   for tau are checked. Choose the actual pushout
   C=(T+P2)/{(tau(z),z):z in Omega^3(T)}. No globally smallest representative
   is claimed.
3. Choose an injective envelope of C by dualising a minimal projective cover
   of its side-swapping vector-space dual, using the trace-dual basis to
   identify dual projectives. Its dimension is 688. Take its quotient by C
   for N. Extend the map C->Omega^2(T)->P1 by dual projective lifting, producing
   the actual projection N->Omega(T). All extension and projection equations
   are checked; the resulting projection has rank 188.
4. Use U_H=T_h, with u.a=u h_H(a). Solve the bimodule-map equations with top
   projection beta_H, the twisted trace-dual tensor of `lift:casimir`.
   In all four instances an exact top lift exists; no projective correction
   is required. Choose the particular linear-solver solution and multiply
   it by H^-1. This replaces the H^-2 normalisation of the two-factor source.
   Each resulting g_H has rank 20. The actual maps are saved in the candidate
   Sage objects, and their evaluated equality/nonvanishing is checked again
   by a separate tensor-quotient calculation.
5. Use the minimal bimodule cover P(N), rather than the free surjection in
   `branch:finite-fiber`, and form the actual kernel of (g_1,g_2,pi).
   Its action is obtained by restriction and checked on all 40 actions.
6. The one-factor calculation gives dim V^0=2, so the two-factor assertion
   that the diagonal stable lift is unique does not carry over. Choose an
   actual s->F tensor s by solving its module-map equations with both
   projections equal to 1, using the particular solution returned by Sage.
   This chosen v is saved. The stated Ext dimensions concern this choice.
7. In `conv:finite-module`, choose Q=T f and i(1)=F, the trace-dual letter of f.
   Form Y=((F tensor s)+Q)/<(v(1),F)> and the induced triangular module Z.
   The quotient-action equations and all off-diagonal module relations are
   checked.

## Direct computation and validation

The algebra constructors and cocycle table from job 04 were inspected and
reused. Both cases rerun the algebra associators, the symmetric trace checks,
all 104976 radical four-word cocycle equations, both twisted boundary tests,
and the nonzero evaluation of the supplied cocycle. The triangular routines
were written for this actual F after inspecting the job 06 implementation.
No result from job 07 is a premise, and no predicted Ext dimension appears
as an assertion in the construction or Ext scripts.

The bimodule resolution has projective dimensions 208,480,768 and syzygy
dimensions 20,188,292,476. Its Betti vectors, in order ee,ef,fe,ff, are
(1,0,0,1), (2,1,1,0), (4,1,1,0). The transferred tau has rank 20.
The cover P(N) has Betti vector (3,1,1,1). Minimal left covers of F and of
D(F_right) have top (24,8) and zero kernel, checking projectivity on both sides.

The four indecomposable Lambda-projectives have dimensions 236,136,12,8,
in order upper e, upper f, lower e, lower f. The ordinary resolution of Z has

| Index | Syzygy dimension | Projective dimension | Betti vector |
|---:|---:|---:|---|
| 0 | 16 | 144 | (0,1,0,1) |
| 1 | 128 | 244 | (1,0,0,1) |
| 2 | 116 | 248 | (1,0,1,0) |
| 3 | 132 | 384 | (1,1,1,0) |
| 4 | 252 | 492 | (2,0,1,1) |

Every cover is surjective and minimal; its kernel action is checked. Successive
resolution differentials and successive Hom differentials compose to zero.
The Hom cochain dimensions and outgoing ranks, for indices 0,1,2,3, are

| Target | Cochain dimensions | Outgoing ranks |
|---|---|---|
| Z | (8,7,8,9) | (1,5,3,6) |
| Lambda | (144,148,248,256) | (16,132,116,140) |

Subtracting adjacent differential ranks gives the displayed Ext dimensions.
Degree-zero ordinary Hom dimensions are 7 and 128, respectively. The saved
`ext-matrices-{0,1}.sobj` files contain the resolution and both Hom complexes.
The separate W calculation uses actual syzygies of C tensor s in negative
degrees, the simple socle modulo projective factors in degree zero, and
ordinary Hom complexes of a resolution of s in positive degrees.

## Bounds, evidence and scope

Work stops at Ext degree three. The term P4 is needed for the differential
out of degree three; no Ext in degree four was computed. The separate W
request requires auxiliary T-resolution terms through index five.

The largest guarded unknown count is 768, in a system with 292 equations
(the P2 cover kernel). Independent right-hand sides are solved separately,
without flattening them into a coupled matrix-variable system. The largest
raw tensor-relation matrix is 376 by 7144. The 100000-unknown limit was not
reached.

All output is in `computations/05-candidate1/` and this report. The README gives
reproduction commands and explains the exact sparse execution adapter.
Preliminary runs were interrupted for performance fixes; one later run hit
Sage's dense/sparse concatenation error, which was repaired using the checked
kernel pivot coordinates. Final stages completed successfully. Diagnostic
`Timeout` stack samples in outputs are from faulthandler, not termination.
The adapter's arithmetic was checked against classical and Karatsuba products.

The most delicate implementation step is the bar transfer and the subsequent
cosyzygy projection. Their matrices, exact equations, and particular lift
choices are saved for review. The scope is two specialisations and one recorded
diagonal choice in each, through degree three. The Toda bracket itself, the
infinite-field version, and higher Ext degrees were not checked in this job.
