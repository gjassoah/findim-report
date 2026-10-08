Model: unknown; effort: unknown.

# §6.5: rectification proof fragment

Status: **AI-proved** for the statement below. This is an incremental working
fragment for integration into the parent dossier, not human certification.

## Statement and conventions

Let (k) be a field. Let (Q) have vertices (0,1,2), finite arrow sets
(\mathcal A_{01}:0\to1) and (\mathcal A_{12}:1\to2), and no other
arrows. Let (W=k\{ba:a\in\mathcal A_{01},b\in\mathcal A_{12}\}).
Choose a subspace (J\subseteq W), a vector-space basis (\mathcal R) of
(J), and put (B=kQ/(J)). Products of paths are read right to left.
Write (e_i) for the primitive idempotents. All complexes are cohomological,
with (C[s]^n=C^{n+s}) and (d_{C[s]}=(-1)^sd_C).

Suppose (D_i\in C^b(\operatorname{proj}B)) are complexes of finitely
generated **right** (B)-modules. For each arrow (a:i\to j), suppose
given a right-linear chain map (f_a:D_i\to D_j). For each
(\rho=\sum_{b,a}\rho_{ba}ba\in\mathcal R), suppose given a right-linear
map (h_\rho:D_0\to D_2) of degree (-1), with
\[
d_{D_2}h_\rho+h_\rho d_{D_0}
 =\sum_{b,a}\rho_{ba}f_bf_a=:f_\rho.
\]
Then there is a bounded complex (P) of finite-dimensional (B)-bimodules,
projective in every degree as a right (B)-module, and right-linear chain
homotopy equivalences
\[
\iota_i:D_i\longrightarrow e_iP
\]
such that (a\iota_i\simeq\iota_j f_a) for every arrow (a:i\to j).
Here the multiplication by (a) uses the **left** (B)-action on (P).

The hypothesis that (\mathcal R) is a basis matters to the construction:
an arbitrary redundant relation list would leave extra cohomology in the
leftmost column. It is available in the preprint, §3,
`build/sections/03-localization-and-lifting.tex:55–63`.

## Independent attempt and comparison

Before reading the source proof, the three columns and maps below were
derived from the presentation complex. The horizontal composite is
(-f_\rho), forcing the (+h_\rho) correction. The two-column calculation
at vertex 1 also gave a direct retraction and contraction. The source proof
was then read in full (`04-tensor-realization.tex:61–224`); it gives the same
matrices. The proof of the vertex equivalences below adopts its finite
filtration and supplies the tensor contraction and the passage from
contractible quotient to homotopy equivalence explicitly.

## Construction and all signs

All tensor products in the following formulas are over (k). Define
complexes with their unshifted internal differentials (d_0,d_1,d_2) by
\[
L_0=\bigoplus_{i=0}^2Be_i\otimes D_i,\qquad
L_1=\bigoplus_{a:i\to j}Be_j\otimes D_i,\qquad
L_2=\bigoplus_{\rho\in\mathcal R}Be_2\otimes D_0.
\]
The left action is on the first factor and the right action is on (D_i).
For a tensor in an arrow summand define
\[
p(c\otimes v)_a=(ca\otimes v)_i-(c\otimes f_a v)_j.
\]
For a tensor in a relation summand define
\[
q(c\otimes v)_\rho
 =\sum_{b,a}\rho_{ba}\bigl((cb\otimes v)_a
                                  +(c\otimes f_a v)_b\bigr),
\qquad
\eta(c\otimes v)_\rho=(c\otimes h_\rho v)_2.
\]
The maps (p,q) have unshifted degree zero and commute with the internal
differentials because each (f_a) is a chain map. The map (eta) has
unshifted degree (-1). Each formula respects both (B)-actions.
Expanding gives
\[
\begin{aligned}
pq(c\otimes v)_\rho
 &=\sum_{b,a}\rho_{ba}\bigl((cba\otimes v)_0
 -(cb\otimes f_a v)_1
 +(cb\otimes f_a v)_1
 -(c\otimes f_bf_a v)_2\bigr)\\
 &=-(c\otimes f_\rho v)_2.
\end{aligned}
\]
The term in the vertex-0 summand is zero because (\rho=0) in (B).
The homotopy assumption gives
\[
d_0\eta+\eta d_2=-pq.
\]
On (P=L_0\oplus L_1[1]\oplus L_2[2]), set
\[
d_P=\begin{pmatrix}
d_0&p&\eta\\
0&-d_1&q\\
0&0&d_2
\end{pmatrix}.
\]
An element of (L_r[ r]^n) has internal degree (n+r). Thus every
displayed entry has total degree one, including (eta), whose source
internal degree drops by one but whose column drops by two. The diagonal
entries of (d_P^2) are zero. The other three possibly nonzero entries are
\[
d_0p-pd_1=0,\qquad -d_1q+qd_2=0,\qquad
d_0\eta+pq+\eta d_2=0.
\]
This accounts for every entry of the square.

There are finitely many columns and summands, and every (D_i) is bounded,
so (P) is bounded. Every term (Be_j\otimes D_i^m), as a right module,
is a direct sum of (\dim_k Be_j) copies of (D_i^m). This proves right
projectivity and finite dimensionality. If all (D_i) have support in
([u,v]), this construction has support in ([u-2,v]); the rectification
adds at most two to the amplitude once the input complexes are given.

## Vertex equivalences

Define (\iota_i(v)=(e_i\otimes v)_i). The differential of a column-0
element has no component in another column, so these are chain maps.
They split degreewise as right-module injections.

For a fixed vertex (i), filter (e_iP) decreasingly by retaining those
summands whose second tensor factor is (D_j) with (j\ge r), for
(r=0,1,2,3). The internal differential and path-multiplication terms
preserve (j); every (f_a) term increases (j), and (eta) increases
it from 0 to 2. Hence these are subcomplexes. The image of (D_i) is
contained in a single filtration degree, so the quotient
(C_i=e_iP/\iota_iD_i) inherits a finite filtration by subcomplexes.

The graded piece indexed by (j=i) is zero in (C_i): in (e_iP) this
piece is precisely (e_i\otimes D_i). All pieces with (j>i) are zero
because there are no paths from (j) to (i). For (j<i), the piece
is the total tensor complex of (D_j) and the following horizontal
complex (K_{ji}).

For ((j,i)=(0,1)) or ((1,2)), (K_{ji}) is
\[
0\longrightarrow k\{a:j\to i\}
 \xrightarrow{a\mapsto a} e_iBe_j\longrightarrow0,
\]
in horizontal degrees (-1,0). Its map is an isomorphism since the
ideal of relations contains only paths of length two. For ((j,i)=(0,2)),
it is
\[
0\longrightarrow k\mathcal R\longrightarrow W
 \longrightarrow W/J=e_2Be_0\longrightarrow0,
\]
in horizontal degrees (-2,-1,0). The first map includes the basis
relations and the second is the quotient map. No path of positive length
can be prefixed or suffixed to a path from 0 to 2, so the ideal generated
by (J) has exactly (J) in this path space; this proves the last
identification and exactness.

Every bounded exact complex (K) of vector spaces has a contraction
(s:K^p\to K^{p-1}): split each (K^p) as its cycles plus a complement,
identify each complement with the boundaries in degree (p+1), and
define (s) as the inverse on boundaries and zero on the complements.
This gives (\partial s+s\partial=1). On the total complex
(K\otimes D_j), the differential is
\[
\partial\otimes1+(-1)^p1\otimes d_{D_j}
\quad\text{on }K^p\otimes D_j.
\]
The map (s\otimes1) contracts it: the two internal terms have signs
((-1)^{p-1}) and ((-1)^p), which cancel, and the horizontal terms sum
to the identity. Thus every associated graded piece of (C_i) is
contractible and, in particular, acyclic.

For completeness, acyclicity passes through a finite filtration as
follows. In an exact sequence (0\to A\to C\to E\to0) of complexes
with (A,E) acyclic, a cycle of (C) maps to a boundary in (E). Lift
a preimage, subtract its differential, and obtain a cycle in (A),
which is a boundary. Descending induction over the three filtration
steps proves that (C_i) is acyclic.

The terms of (C_i) are projective: it is the quotient of a direct
summand by a further degreewise direct summand. A bounded acyclic
complex (C) of projectives is contractible. To see this, begin at the
largest degree (N) where (C^N\ne0). The map (C^{N-1}\to C^N)
is surjective, hence splits; its kernel is projective. Continue
downwards with that kernel. The resulting decompositions split (C)
into two-term identity complexes, giving a contraction (s).

One can now recover a homotopy inverse without citing a cone criterion.
Choose a graded splitting (e_iP=D_i\oplus C_i). Its differential is
\[
\begin{pmatrix}d_D&t\\0&d_C\end{pmatrix},
\qquad d_Dt+td_C=0.
\]
Choose a contraction (s) of (C_i). Define
\[
r(x,c)=x-tsc,\qquad H(x,c)=(0,sc).
\]
The equation (d_Dt=-td_C), together with (d_Cs+sd_C=1), gives
(d_Dr=r d_P). Also (r\iota_i=1), and direct matrix multiplication
gives
\[
d_PH+Hd_P=(tsc,c)=1-\iota_i r.
\]
Therefore (r) is a right-linear chain homotopy inverse of (\iota_i).

## Arrow homotopies

For (a:i\to j), define the degree-(-1) right-linear map
\[
H_a(v)=(e_j\otimes v)_a\in e_jL_1[1].
\]
Its column-1 component under (d_PH_a) is (-e_j\otimes d_{D_i}v),
which cancels the column-1 component of (H_ad_{D_i}). Its column-0
component is
\[
p(e_j\otimes v)_a=(a\otimes v)_i-(e_j\otimes f_av)_j.
\]
There are no further components, hence
\[
d_PH_a+H_ad_{D_i}=a\iota_i-\iota_jf_a.
\]

## Source comparison and computation scope

Read source locators: `04-tensor-realization.tex:36–59` (statement),
`:64–129` (columns, maps and signs), `:133–137` (finiteness and
projectivity), `:142–208` (vertex equivalences), `:210–223` (arrow
homotopies), and `:226–233` (absence of further coherence equations).
No sign, convention or mathematical error found in this scope. The
independence of the relation basis is already explicitly used by the
source; it is not an omission there. No result of Keller is used as
evidence in this proof, so the contextual citations at source lines
28–34 need no unexamined locator in the dossier.

The exact rational computation `D-B-rectification-check.py`, with saved
output `D-B-rectification-check.out`, takes (B=kQ/(ba)), right-free
(D_i=(B\oplus B\xrightarrow{(1,0)}B)) in degrees 0 and 1,
(f_a=1), (f_b) the projection onto the contractible disk, and
(h_{ba}) its contraction. It tests a nonzero relation homotopy,
all differential squares, both arrow homotopies, and the cohomology
maps of all three inclusions. Omitting the correction produces nonzero
squares in two degrees. The computation only supports this example;
the general status **AI-proved** rests on the preceding proof.
