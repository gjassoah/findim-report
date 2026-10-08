Model: unknown; effort: unknown.

# Fresh-context review of Codex job 07

Scope: read-only mathematical audit of `toda.py`, `exact.json`, and the
reused algebra/projective constructors in `01_algebra.py` and
`04_trivial_extension.py`; subsequently extended to `witness.py` and
`witness.out`. No computation was rerun by this reviewer. This review
does not independently reproduce the full stable-Hom dimension table.

Verdict: no error found in the two cone constructions or their
shift bookkeeping. The detailed checks below are AI-proved statements
about the algorithms, conditional on the supplied algebra and resolution
matrices. The recorded numerical results retain status supported.

Put M_i = Omega^i(s), with inclusions i_i: M_i -> P_(i-1) and
surjections pi_i: P_i -> M_i. The lift equations defining beta_i give
beta_i = Omega^i(beta_0) in the stable category. The stored beta matrices
have their only nonzero entries at (6,1), (4,1), and (4,1), respectively
(indices here are one-based). Consequently beta_1 beta_0 and
beta_2 beta_1 are literally zero. The stored tau has only entry (1,7),
so tau beta_2 is literally zero too.

The first cone is (s + P_2)/im(tau,i_3). Its triangle is
M_3 -> s -> C -> M_2 -> s[1]. Thus the last map represents tau shifted
by one from its representative M_3 -> s. For the composable chain
s -> M_1 -> M_2 -> s[1], the associated Toda value belongs to
Hom(s[1],s[1]), hence H^0. A lift L: M_1 -> C with pL=beta_1 yields
L beta_0=j c; the desuspension of the bracket value is c: s -> s.
The stored L has only entry (5,1), while beta_0 lands in coordinate 6,
so this representative c is zero.

The second cone is (M_1 + P_0)/im(beta_0,i_1 beta_0). Its triangle starts
s -> M_1 -> C_beta -> s[1]. The stored maps give an extension
G: C_beta -> M_2 of beta_1. The map U: C_beta -> P_0 restricts to i_1
on M_1. A solution r i_1 = beta_2 beta_1 makes beta_2 G + rU vanish
on M_1 and therefore descend to V: s[1] -> M_3. The summand rU factors
through a projective and is zero in the stable category. Thus V is a
representative of <beta_0,beta_0,beta_0>, in Hom(s[1],s[-3]) = H^-4.
Taking its syzygy with the projective presentation
0 -> s -> P_0 -> s[1] -> 0 gives the code's omegaV: s -> M_4.
Here r, V, and omegaV are all stored as zero matrices.

The two algorithms in `toda.py` share the algebra, resolutions, and Hom solver. They
are distinct cone calculations of two different brackets, not independent
implementations of the same calculation. A claim that the beta triple
determines the first bracket requires an additional mathematical
comparison; the code by itself does not supply one. This limitation does
not obstruct either separate zero conclusion.

For `stable_data` (lines 120--126), every map X -> Q -> Y through a
projective Q belongs to the computed subspace: the map Q -> Y lifts
through the epimorphism P -> Y. Conversely, every computed map factors
through P. Thus this is exactly the projective-factor subspace.
For `stable_via_injection` (lines 129--134), a map X -> Q -> Y extends
across X -> P because Q is injective; all projectives are injective for
the symmetric algebra T. Conversely, every computed map factors through
P. Thus that factor subspace is exact too. The full-Hom equations use
row-major vectorisation, for which F a - b F is represented by
I tensor a^t - b tensor I; the implementation has these factors in the
correct order. There is no inadvertent opposite-module convention here.

The use of symmetry is justified algebraically for a trivial extension:
the functional lambda(c,phi)=phi(1) gives
lambda((c,phi)(d,psi))=psi(c)+phi(d), a symmetric nondegenerate pairing.
Associativity makes T -> DT a left-module isomorphism, and DT is
injective because Hom_T(-,DT) identifies with the exact vector-space
dual functor. Hence direct summands of finite sums of T are injective.
The imported construction uses precisely the bimodule actions
(c phi)(d)=phi(dc) and (phi c)(d)=phi(cd).

For degrees (h,g,f)=(3,-1,-1), the Toda indeterminacy is
tau H^-3 + H^1 beta_0. For degrees (-1,-1,-1), it is
beta_0 H^-3 + H^-3 beta_0. Both are zero conditional on the reported
vanishings H^-3=H^1=0, and the stored dimension table includes these
vanishings. The first composition beta_0 beta_0 has degree -2;
tau beta_0 has degree 2 and is represented by tau beta_2: M_2 -> s.
The requested degrees are therefore respected throughout.

The wording error originally at line 174 is resolved: the comment now
says "Choose a generator of the one-dimensional stable Hom(M3,s)."
This comment-only correction does not affect the computation.
Signs cause no ambiguity over the specified
characteristic-two fields. Rescaling either generator cannot change
zero versus nonzero, since the Toda sets here have zero indeterminacy
and are homogeneous under nonzero scalar changes.

Scope limitations of the initial audit: the Hom-space ranks in the full
dimension table were not rerun. The JSON
does not save the factor-space bases or the covers beyond P_4, so the
full degree -7..7 table cannot be checked from this JSON alone without
regenerating data. No conclusion about other parameters, characteristic,
or all cohomological degrees is supplied by this review. The original
finite-field JSON files were outside the assigned numerical inspection
scope; the later `witness.out` inspection covers the four fields below.

## Extension: explicit certificates

Verdict on `witness.py`: no error found. It reconstructs multiplication
without importing the earlier scripts and checks concrete formulas rather
than solving Hom spaces. Its left-dual term has coefficient
sum a_j psi_k [b_i b_j:b_k] at b_i^*, while its right-dual term has
coefficient sum phi_k b_i [b_i b_j:b_k] at b_j^*; these are the correct
two dual actions. Its syzygies are kernels of the successive maps
Tf -> s, Te -> M_1 (right multiplication by u), and Te -> M_2
(right multiplication by x+y). The rank and kernel assertions check
exactness for these explicit presentations; their minimality is not
needed for the Toda certificates.

Right multiplication by U gives the lift of beta_0, since Uu=F.
Right multiplication by X gives the lift of beta_1, since X(x+y)=E
and beta_1(u)=E. The checked T-linearity and the cyclic generator of
the source Te extend these two identities to the full projective maps.
Their restrictions are the displayed beta_1 and beta_2.

With W=<x+qy,z,j,E,X+Y,U>, the first cone is Te/W. Indeed, the map
(s + Te)/im(tau,i_3) -> Te/W sends [(a,p)] to [p+aV]; the defining
relation maps to zero because m+tau(m)V belongs to W. Its inverse is
induced by p -> [(0,p)]. The map s -> Te/W sends 1 to [V], and the
quotient map to M_2 is right multiplication by x+y. The asserted lift
u -> [X], all other displayed M_1 basis vectors -> 0, is checked
T-linear modulo W on every basis pair. It maps F to zero, giving the
first bracket's zero representative.

The beta cone is (M_1 + Tf)/<(F,F)>. The map G(m,p)=beta_1(m) is
well-defined because beta_1(F)=0, and beta_2 G is literally zero.
This gives the second bracket's zero representative without a Hom solve
or a projective-factor rank computation.

The script also removes the earlier rank-table dependency for the two
indeterminacy vanishings. Its cyclicity assertion gives M_1=Tu with
eu=u, so every map M_1 -> s kills the generator. A map s -> M_3 has
image in fM_3=<j,U,V> and is killed by u. The checked injectivity of
left multiplication by u on this three-dimensional subspace forces the
map to be zero. Thus H^1=H^-3=0 follows directly from the certificates.

For completeness, the generator-survival checks admit the following
direct arguments (AI-proved from the multiplication table). Since
Hom(Te,s)=0, the nonzero map tau:M_3 -> s cannot factor through a
projective, by the injection criterion above. The f-part of Te is
<t,j,U,V>; left multiplication by u maps this basis to
<qx+y,z,E,X+Y>, respectively, which is linearly independent. Hence
Hom(s,Te)=0. Every projective factor s -> M_1 factors through the
cover Te -> M_1, so beta_0(1)=F is stably nonzero. The dimensions
asserting that these classes span H^-1 and H^3 still use the main
calculation; the zero-bracket certificates themselves only require
these nonzero classes and the indeterminacy vanishings.

The saved `witness.out` records successful completion over F_2(q) and
GF(2^8), GF(2^12), GF(2^16), with the finite parameters of orders
255, 4095, and 65535. This supplies a separate implementation of the
zero certificates and the relevant indeterminacy vanishings. It does
not independently reproduce the full degree table or independently
check every algebra associator, and this review cannot certify that
the certificate derivation was blind to the original calculation.
Both brackets are checked individually; no general comparison theorem
between them is required or claimed.

## Final report check

The explicit proof in `audit/07-toda-bracket-codex.md` was subsequently
read for consistency with both implementations. No error found. In
particular, its generation assertion for M_3 has the following direct
identities, with w=x+qy:

\[
yw=z,\qquad tw=(1+q^3)j,\qquad vV=E,\qquad
uV=X+Y,\qquad nV=U.
\]

These produce every listed basis vector from w and V. The scalar
1+q^3 is nonzero over F_2(q) and for each listed finite parameter,
whose order does not divide 3. Since w is e-fixed and V is f-fixed,
the already checked T-linearity of t and t(V)=1 identify Hom(M_3,s)
with its one-dimensional span. The proof that t survives projective
factors is valid as written.

The cone paragraph uses the chain
M_1 -> M_2 -> M_3 -> s. Its Toda target is
Hom(M_1[1],s)=H^0; suspending the two beta maps gives exactly the
lift and composite used by the algorithm. The separate beta chain
starts at s and ends at M_3, giving H^-4. There is no degree reversal.
The report's rescaling factors ab^2 and b^3 agree with the respective
three homogeneous inputs. Zero indeterminacy makes the normalisation
conclusion valid. The cited external thesis was not independently
checked by this reviewer; the source-and-formula audit does not rely
on that citation.

Reviewed SHA-256:

- `toda.py`, after the comment correction: `9ccdcde3589f65ae0a27a25936205a9f9dcf8bcdd2ce2f4514a6bc31a5ed8352`
- `exact.json`: `e536ebc587ebff7d672e66d6d6cbeb31ba594714b91673198e5f90019165f3a4`
- `witness.py`: `618bb230bc28927b392857f51a2aa142730146b432603b6b41d9647c9e48bc14`
