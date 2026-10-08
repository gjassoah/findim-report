Model: GPT-6 (Codex); effort: unknown.

# Codex job 10

Status: **stopped at the requested size bound**, before forming the finite
two-factor bimodule matrices. The next coefficient matrix has 2,162,688
rows and 3,591,168 unknowns. The computed stable profile agrees with the
source for -4 through 7, but F, Lambda, Z and their requested Ext checks
were not reached. This is a partial construction with a recorded bound
stop, not a verification of the AR example.

The inputs are the local AR source in `.cache/ar-src/` and the mathematical
code in computations 02--05. Earlier numerical outputs are leads, not premises.
All new files are confined to this report and `computations/06-two-factor/`.
The forbidden directories and ledger are not inputs.

Conventions: characteristic two, left modules, column matrices, homological
complex indices, stable `[1]` equal to cosyzygy, and right twist
`u.a = u sigma(a)`. The field will be GF(2^16), with seeded primitive
parameters and a separately checked order for H1/H2.

The main representation issue (status: **AI-proved**, by the comparison
argument below) is that external tensor product does not
descend from both one-factor stable categories to the A^e-stable category:
a projective T-bimodule tensored with a nonprojective T-bimodule need not
be A^e-projective. Consequently the ordinary cone complexes must be retained
until after totalisation. This is the order used in `05-cones.tex`,
`cone:finite`; simply using the external square of the 312-dimensional
one-factor cone would require a separate justification.

The workflow reconstructed the one-factor data, retained its two lower
projective terms, resolved its finite cone by projective covers, computed
the evaluated two-factor cone, and measured the total bimodule complex
before the large linear solve. The guard is 2,000,000 scalar unknowns in one
coefficient system. Independent right-hand sides are not flattened together.

## Field and reconstructed data

Status: **supported**, one fresh sample, seed 10102026. The field is
`GF(2^16)` with modulus `x^16+x^5+x^3+x^2+1` and primitive element `b`.
The parameters `(q,H1,H2)` are `(b^45499,b^55487,b^38596)`.
All three parameters and `H1/H2` have order 65535. This is a finite
specialisation, not the source's rational function field; no assertion
in all degrees follows from it.

The multiplication code agrees with `03-algebra.tex`, `alg:C-products`
and `alg:dual-actions`. The fresh run checks every basis associator of
the 10-dimensional algebra and its 20-dimensional trivial extension,
the symmetrising form, the radical, all 104976 radical four-word cocycle
equations, and the 324 twisted-boundary equations for each H. It also
checks the bar cycle with nonzero evaluation `q^3*f`.

To avoid a notation collision, write `D` for the one-factor cone module;
the source uses `C` for the 10-dimensional algebra and calligraphic C
for the two-factor stable bimodule. The reconstructed data are:

| Object | Dimension | Top multiplicities (ee,ef,fe,ff), where applicable |
|---|---:|---|
| T | 20 | |
| P0(T) over T^e | 208 | (1,0,0,1) |
| Omega(T) | 188 | |
| P1(T) | 480 | (2,1,1,0) |
| Omega^2(T) | 292 | |
| P2(T) | 768 | (4,1,1,0) |
| Omega^3(T) | 476 | |
| D | 312 | (4,1,1,0) |
| P0(D) | 768 | (4,1,1,0) |
| P1(D) | 1056 | (6,1,1,0) |
| P2(D) | 1344 | (8,1,1,0) |
| P3(D) | 1632 | (10,1,1,0) |
| P4(D) | 1920 | (12,1,1,0) |

The successive syzygies of D have dimensions 456, 600, 744, 888, 1032.
Every cover is computed from the radical quotient; the code checks
surjectivity, all left/right action identities, and invariance of its
kernel. The cocycle is transferred from the supplied bar table using
an explicit comparison and contraction, not chosen from its desired
evaluation. The actual maps are saved in `one-factor.sobj`.

## Two-factor dimensions and stop

Status: **supported** by the factor matrices and the exact-complex
dimension calculation in `sizes.py`; the large matrices themselves were
not formed. The dimensions of A, A^e and X are 400, 160000 and 1.
Each twisted regular bimodule U_i has dimension 400.

| Degree | -4 | -3 | -2 | -1 | 0 | 1 | 2 |
|---|---:|---:|---:|---:|---:|---:|---:|
| dim K_n | 43,264 | 199,680 | 549,888 | 1,176,576 | 2,162,688 | 3,591,168 | 5,544,960 |
| rank d_n | 0 | 42,864 | 156,816 | 392,272 | 784,304 | 1,377,984 | 2,213,184 |

The term dimensions are convolutions of the measured dimensions of L.
The ranks in this table are **inferred**, not obtained by eliminating
the large matrices: K has homology of dimensions 400,800,400 in degrees
-4,-2,0, respectively, by tensoring the checked one-factor extension
over the field. The recurrence
`rank d_(n+1) = dim K_n - rank d_n - dim H_n(K)` gives the displayed
ranks. Thus the implicit cokernels have dimensions

- `dim C1 = dim coker(d2) = 1,377,984`;
- `dim C0 = dim coker(d1) = 784,704`.

The finite module C0 represents calligraphic C, since
`0->C1->K0->C0->0` identifies C0 with C1[1] stably. Neither C0 nor C1
was expanded as bimodule action matrices. Their defining factor data
are saved.

Exactness at degree one permits using `C1 = im(d1)` instead of the
larger presentation `coker(d2)`. Even this operation has 3,591,168
scalar source coordinates against 2,162,688 equations. The alternative
d2 presentation has 5,544,960 source coordinates. `sizes.py` recorded
the bound stop before allocating either system.

This is a bound stop for the implemented full-space presentation.
It is not a lower bound for every algorithm or stable representative:
cornerwise elimination or a different construction could avoid this
particular system. Neither was pursued past the requested stop.

## Comparison with the source construction

The following comparison argument has status **AI-proved**, with its
matrix inputs **supported** only at the recorded parameters.

The external-tensor obstruction stated above has a direct test. If Q is
a nonzero projective B-module and N is a nonprojective B-module, the
restriction of `Q tensor_k N` to the second factor is a direct sum of
`dim Q` copies of N. A projective `B tensor B`-module restricts to a
projective B-module because `B tensor B` is free over that factor.
Thus `Q tensor N` cannot be projective. This is why discarding the
one-factor projective terms before forming the external tensor is
not a permitted stable-category operation.

Let B=T^e. The transferred map is `tau:Omega_B^3(T)->T`. The pushout

`D=(T direct_sum P2(T))/im(tau,inclusion)`

gives the exact sequence

`0 -> T -> D -> P1(T) -> P0(T) -> T -> 0`.

This is the extension represented by the original bar cocycle. More
explicitly, start with the ordinary cone complex in `cone:finite`.
After passing from the bar resolution to a projective resolution of T,
its terms in degrees -2,-1 are P0(T),P1(T). Its degree-zero cokernel
is precisely the pushout D above: the augmentation in the unshifted
cell replaces P0(T) by T, and the remaining relation is
`(tau,inclusion)` on Omega^3(T). Since the cone is exact above zero,
this truncation is a quasi-isomorphism. Replace its degree-zero term
D by its projective resolution, retaining the map D->P1(T).

The resulting projective complex L has terms

`L_-2=P0(T), L_-1=P1(T), L_n=P_n(D) (n>=0)`.

Its differential from degree zero is the composite
`P0(D)->D->P1(T)`. Its homology is T in degrees -2 and 0 and zero
elsewhere. The checked comparison into the bar complex preserves the
extension class, so this L and the source's one-factor ordinary cone
are quasi-isomorphic. Bounded-below acyclic complexes of projectives
are contractible: split the surjection onto the lowest nonzero term,
remove that two-term contractible summand, and repeat upwards.
Consequently these two projective models are homotopy equivalent.

Tensor those homotopy equivalences over the field. Each total degree
contains finitely many summands, so they give a homotopy equivalence
from `K=Tot(L tensor_k L)` to the source's two-cone complex. Each term
is A^e-projective. Maps induced on sufficiently high cokernels by
homotopic tail maps differ by a projective factorisation: a homotopy
component gives the intervening projective term. Hence the stable
two-cone is unchanged.

The two lower differentials and the computed positive tail have zero
maps on projective tops (checked in the final size audit). Thus these
terms form a minimal projective complex. The tensor differential is
also radical: it belongs to
`rad(B) tensor B + B tensor rad(B) = rad(B tensor B)`.
The equality follows because the ideal on the left is nilpotent and
its quotient is `k^4 tensor k^4 = k^16`. This rules out cancelling
contractible projective summands of this complex. It does not assert
that its finite stable representatives have the smallest dimension.

The representation changes are therefore:

| Change | Reason it preserves the relevant object |
|---|---|
| Bar resolution to minimal covers of T | Explicit transfer of the same cocycle, followed by the comparison argument above |
| Infinite one-factor cone to D->P1(T)->P0(T), then resolution of D | Truncation is a quasi-isomorphism; both homology groups and their extension class are retained |
| Tensor these projective complexes | Homotopy equivalences tensor over the field; all terms remain A^e-projective |
| Compute projective generators in the radical quotient | Only basis selection changes; the cover is checked directly |
| For evaluation, resolve D tensor_T s minimally before tensoring the complexes | The evaluated bounded complexes are quasi-isomorphic; their projective replacements are homotopy equivalent |
| Use the cokernel at index zero for the evaluated cone | Exactness at index one gives `0->C1->K0->C0->0`; hence `C0` represents `C1[1]` |

No injective-envelope substitution, minimal cosyzygy construction,
replacement of the free fibre cover by a projective cover, or transfer
of the two lifts has yet been carried out. These must not be described
as checked changes. Changing cosyzygy embeddings or projective
surjections would require transporting the maps, not merely changing
dimension formulas.

## Stable profile at X

Status: **supported** by actual module and Hom matrices, not by using
`cone:profile` as a premise. The evaluated one-factor complex has term
dimensions 8,12 in degrees -2,-1, and 12 in each computed degree 0--4.
Its total external square has dimensions

| Degree | -4 | -3 | -2 | -1 | 0 | 1 | 2 |
|---|---:|---:|---:|---:|---:|---:|---:|
| Dimension | 64 | 192 | 336 | 480 | 624 | 768 | 912 |
| Differential rank | 0 | 63 | 129 | 205 | 275 | 348 | 420 |

The computed homology is one-dimensional in degrees -4 and 0,
two-dimensional in degree -2, and zero in the remaining checked
degrees through 1. The actual quotient `coker(K1->K0)` has dimension
276 and represents calligraphic C evaluated at X.

A complete resolution of X is assembled from tensor products of
minimal resolutions of the left and right f-simples. The negative
half is obtained by dualising the right resolution and identifying
dual projectives using the checked symmetrising trace. The seam map
is the augmentation followed by the dual augmentation. The code
checks the differential identities and computes the full Hom ranks:

| a | -4 | -3 | -2 | -1 | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| dim W^a | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | 0 |

`evaluated.json` records every cochain dimension and adjacent rank;
`profile-matrices.sobj` contains the differentials. This matches the
source's predicted profile in the checked window only. The top-cell
projection on W^3 and the evaluated source lifts are not computed here.

A separate calculation in `validate.py` finds ordinary Hom dimensions
`dim Hom_A(X,M)=1` and `dim Hom_A(M,X)=0` for the saved 276-dimensional
module M. The socle operator `f* tensor f*` has rank zero. Thus the
direct stable-module calculations give W^0=1 and W^-1=0, independently
of the complete-resolution seam calculation. These results are
**supported**, with matrices and system sizes recorded in
`validation.json`.

## Unperformed checks and reproducibility

| Requested output | Outcome |
|---|---|
| Four minimal cosyzygies, Y representing calligraphic C[3] | Not constructed; dimension unknown |
| Normalised bimodule lifts U_i->Y | Not constructed or transported |
| Fibre F and its dimension | Not constructed |
| dim Lambda=800+dim F; dim Z | Unknown; no actual Lambda or Z formed |
| Ext^1 and Ext^2 of Z against Z and Lambda | Not computed; no vanishing claim |
| delta^0, its kernel and cokernel | Not computed |
| Stable profile -4 through 7 | Computed as above, supported in one sample |
| Indecomposable nonprojective Z' | Not selected or tested |
| Number of simples and dimension of End(Lambda direct_sum Z') | Not computed; the expected nine is not an achieved result |

In particular, W^2=0 and W^3=k do not on their own constitute a check
of delta^0: the actual normalised lifts and their compatibility are
still missing. The next unverified step in a continuation is constructing
and transporting these bimodule maps on a representative that can be
handled within the size bound.

The source is the local cache of OpenAI's *An explicit counterexample
to the Auslander--Reiten conjecture*, dated September 23, 2026 in
`main.tex`. The locators used here are `alg:C-products`,
`alg:dual-actions`, `coc:comparison`, `cone:finite`, `cone:profile`,
`branch:Y` and `branch:finite-fiber`. The cache and reused Python sources
are pinned by SHA256 in `sizes.json`; output hashes are in
`computations/06-two-factor/SHA256SUMS`.

The new comparison, reconstruction, calculations, and report are by
Codex (GPT-6; effort unknown). The code reuses the specified earlier
algebra, bar-transfer and projective-cover implementations after
reading them and rerunning their relevant checks. No numerical output
from an earlier job supplies a premise. No subagents, Lean verification,
or human certification were used. Execution commands, recoveries from
the concatenation error, and performance adaptations are documented in
`computations/06-two-factor/README.md`. Only the two authorised output
paths were modified; no commit or push was made.
