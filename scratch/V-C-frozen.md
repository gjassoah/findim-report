Model: unknown; effort: unknown.

# D-C. The selection group (report §5.2)

Date: 2026-10-08. This is an AI-written proof dossier, not manuscript
prose or a record of human certification. The exact runtime model and
effort are not exposed to this session; project defaults are not used to
infer them. Conventions are those of [audit omitted] and
`report/notes/outline.md`. All modules are left modules. Source files and
the earlier computations are read-only.

## 0. Independent attempt and scope

Before reading any proof in `build/sections/02-selection-process.tex`,
I extracted its text outside `proof` environments. This supplied the
definition of the group and the four statements. The following argument
was then developed from the defining relations, without reading either
the preprint proofs or `computations/01-selection-quotients.py`:

- Express each indexed generator by torus conjugation of its index-zero
  generator. Impose centralisation by a basis of the integral kernel of
  its weight. Transport the index-zero binary relations using explicit
  integral right inverses of their two weights.
- For $x=U_i(a)$, $w=W_{ij}(s)$, $v=V_j(b)$, conjugate
  $[w,v]$ by $x$. The relations $[x,v]=1$,
  $[[w,v],[x,w]]=1$ and $[[w,v],v]=1$ give
  $[x,[w,v]]=[[x,w],v]$. Vary $s$ to transfer the two
  arguments while keeping their sum fixed.
- Represent the resulting commutator with an index different from that
  of a given $U$ or $V$, and with the third index for a given $W$,
  to obtain centrality. Use $U_i(a)^2=1$ to obtain its square.
- Check translations by $+1$ and $-1$ on every family of relators.
- Map $U_i(r),V_i(r),W_{ij}(r)$ to elementary matrices in positions
  $(1,i+1),(i+1,5),(i+1,j+1)$, respectively, with entry $t^r$.
  Put $t$ at the $(i+1)$-st diagonal entry for $T_i$. The
  $(1,5)$-entry of the commutator is $t^{a+b}$. Independence follows
  from the polynomial basis modulo the monic polynomial $t^m-1$,
  without assuming that this quotient is a field or is reduced.
- Induce a character of the central subgroup with signs $+1$ through
  index $m-2$ and sign $-1$ at index $m-1$. Induction gives a
  non-zero finite-dimensional module by a coset-basis argument. Induct
  on the iterate, keeping the left action $r\mapsto\alpha^j(r)$.

These are independent proof attempts, not independent verification.
The detailed arguments and the subsequent source comparisons are below.
Status labels apply to the statements with the hypotheses written here.

## 1. The group and a finite presentation

### 1.1 Definition

Write $I=\{1,2,3\}$, let $\varepsilon_i$ be the standard basis
of $\mathbb Z^3$, and use

\[
[x,y]=xyx^{-1}y^{-1},\qquad
T^n=T_1^{n_1}T_2^{n_2}T_3^{n_3}.
\]

Let $G$ have generators $T_1,T_2,T_3$ and

\[
U_i(r),\ V_i(r),\ W_{ij}(r)
\quad(i,j\in I,\ i\ne j,\ r\in\mathbb Z).
\]

The torus generators commute. The weights of the twelve other types are

\[
\lambda_{U_i}=-\varepsilon_i,\qquad
\lambda_{V_i}=\varepsilon_i,\qquad
\lambda_{W_{ij}}=\varepsilon_i-\varepsilon_j.
\]

We regard each weight as the integral homomorphism
$\lambda_S(n)=\sum_{\ell=1}^3\lambda_{S,\ell}n_\ell$.

For every type $S$, impose

\[
T_\ell S(r)T_\ell^{-1}=S(r+\lambda_{S,\ell}). \tag{G1}
\]

The remaining relations are the following; all displayed integer
parameters are independent, and every allowed choice of indices occurs:

\[
\begin{array}{ll}
\text{(G2)}&U_i(r)^2=1;\\
\text{(G3)}&[U_i(r),U_j(s)]=[V_i(r),V_j(s)]
 =[U_i(r),V_j(s)]=1\quad(i\ne j);\\
\text{(G4U)}&[W_{ij}(s),U_h(r)]=1\quad(h\ne i);\\
\text{(G4V)}&[W_{ij}(s),V_h(r)]=1\quad(h\ne j);\\
\text{(G5U)}&[U_i(r),W_{ij}(s)]=U_j(r+s)\quad(i\ne j);\\
\text{(G5V)}&[W_{ij}(s),V_j(r)]=V_i(s+r)\quad(i\ne j).
\end{array}
\]

No commutation of two different parameters of the *same* type, and no
relation between two $W$-types, is included without derivation.

### 1.2 Statement

The group $G$ has a finite presentation on the fifteen generators

\[
T_1,T_2,T_3,\quad u_i,v_i\ (i\in I),\quad
w_{ij}\ (i,j\in I,\ i\ne j).
\]

Here is a specific presentation $P$. Its relators consist of the
three torus commutators, the kernel centralisers listed below, and all
the relations (G2)–(G5V) with every integer parameter replaced by zero
and $U_i(0),V_i(0),W_{ij}(0)$ replaced by $u_i,v_i,w_{ij}$.
Only finitely many index choices remain.

For a type $S$, write $s_S=u_i,v_i,w_{ij}$ as appropriate, choose

\[
q_{U_i}=-\varepsilon_i,\qquad q_{V_i}=\varepsilon_i,
\qquad q_{W_{ij}}=\varepsilon_i,
\]

and impose $[T^b,s_S]=1$ for the two basis vectors in this table:

| Type $S$ | Integral basis of $K_S=\ker(\lambda_S:\mathbb Z^3\to\mathbb Z)$ |
| --- | --- |
| $U_i$ | $\varepsilon_h$, for the two $h\ne i$ |
| $V_i$ | $\varepsilon_h$, for the two $h\ne i$ |
| $W_{ij}$ | $\varepsilon_i+\varepsilon_j,\varepsilon_k$, where $\{i,j,k\}=I$ |

For the first two rows the kernel condition is $n_i=0$.
For the last row it is $n_i=n_j$, and every such vector is

\[
n_i(\varepsilon_i+\varepsilon_j)+n_k\varepsilon_k.
\]

Thus these are bases of the integral kernels, not merely bases after
tensoring with a field. Each $\lambda_S(q_S)=1$.

### 1.3 Proof

In $P$, define words indexed by all integers by

\[
\widetilde S(r)=T^{rq_S}s_ST^{-rq_S}. \tag{1.1}
\]

Products and inverses of elements centralising $s_S$ also centralise
$s_S$. The basis relators therefore imply that $T^b$ centralises
$s_S$ for every $b\in K_S$. For any $n\in\mathbb Z^3$,
the vector $n-\lambda_S(n)q_S$ lies in $K_S$. The torus
commutation relators and (1.1) now give

\[
T^n\widetilde S(r)T^{-n}
=\widetilde S(r+\lambda_S(n)). \tag{1.2}
\]

In particular, all of (G1) holds in $P$. Conjugating $u_i^2=1$
by $T^{rq_{U_i}}$ gives (G2) for every integer $r$.

For the binary relations, it is enough to solve the two integral weight
equations for each pair of types. The following table was obtained
before reading the source table. Coordinates not displayed are zero.
In rows involving $k$, the three indices $i,j,k$ are distinct.
The entries $(r,s)$ or $(s,r)$ specify the required weights in
the order of the types in the second column.

| Relation | Ordered types | Required weights | An integral preimage $n$ |
| --- | --- | --- | --- |
| G3 | $U_i,U_j$ | $(r,s)$ | $-r\varepsilon_i-s\varepsilon_j$ |
| G3 | $V_i,V_j$ | $(r,s)$ | $r\varepsilon_i+s\varepsilon_j$ |
| G3 | $U_i,V_j$ | $(r,s)$ | $-r\varepsilon_i+s\varepsilon_j$ |
| G4U, $h=j$ | $W_{ij},U_j$ | $(s,r)$ | $(s-r)\varepsilon_i-r\varepsilon_j$ |
| G4U, $h=k$ | $W_{ij},U_k$ | $(s,r)$ | $s\varepsilon_i-r\varepsilon_k$ |
| G4V, $h=i$ | $W_{ij},V_i$ | $(s,r)$ | $r\varepsilon_i+(r-s)\varepsilon_j$ |
| G4V, $h=k$ | $W_{ij},V_k$ | $(s,r)$ | $s\varepsilon_i+r\varepsilon_k$ |
| G5U | $U_i,W_{ij}$ | $(r,s)$ | $-r\varepsilon_i-(r+s)\varepsilon_j$ |
| G5V | $W_{ij},V_j$ | $(s,r)$ | $(s+r)\varepsilon_i+r\varepsilon_j$ |

For the first three rows, applying the signed coordinate weights yields
$(r,s)$. In the next four rows the pairs of evaluations are,
respectively,

\[
((s-r)-(-r),-(-r)),\quad (s-0,-(-r)),\quad
(r-(r-s),r),\quad (s-0,r),
\]

and each is $(s,r)$. In row G5U the evaluations are
$(-(-r),-r-(-(r+s)))=(r,s)$, while the output weight is
$-n_j=r+s$. In row G5V the evaluations are
$((s+r)-r,r)=(s,r)$, while the output weight is $n_i=s+r$.

Conjugate the relevant index-zero relator by $T^n$ and use (1.2).
For G3 and G4 this gives the requested commutation relation. For G5U
and G5V it gives both the requested inputs and the correctly indexed
output, by the last two weight calculations. These nine rows exhaust
the binary relators because $I$ has three elements. Consequently,
every defining relation of $G$ holds on the elements of $P$.

Conversely, in $G$, (G1) iterated over positive and negative powers
gives

\[
T^nS(r)T^{-n}=S(r+\lambda_S(n)). \tag{1.3}
\]

Negative powers are justified by solving (G1) for conjugation by
$T_\ell^{-1}$; commuting the $T_\ell$ combines the three
coordinates. Equation (1.3) implies the kernel centralisers in $P$,
and the remaining finite relators are among the defining relators of
$G$. Hence the two assignments

\[
P\longrightarrow G:\quad s_S\longmapsto S(0),\qquad
G\longrightarrow P:\quad S(r)\longmapsto\widetilde S(r),
\]

fixing the torus generators, are homomorphisms. Their composite on
$s_S$ is the identity by (1.1) at $r=0$; their composite on
$S(r)$ is the identity by (1.3) and $\lambda_S(q_S)=1$.
They are mutually inverse. This gives the claimed finite presentation.

calculations above.

### 1.4 Comparison with the source

The proof at source lines 86–167 has the same finite presentation and
kernel bases. Its table at lines 135–145 always calls the target pair
$(r,s)$, whereas the table in §1.3 retains the parameters of (G4)
and (G5V), where the ordered pair is $(s,r)$. After that renaming
the nine rows agree. To check every source row *in its own order*, the
two evaluations are listed here:

| Source line | Ordered types | Evaluation of the displayed source vector |
| --- | --- | --- |
| 135 | $U_i,U_j$ | $(-(-r),-(-s))=(r,s)$ |
| 136 | $V_i,V_j$ | $(r,s)$ |
| 137 | $U_i,V_j$ | $(-(-r),s)=(r,s)$ |
| 138 | $W_{ij},U_j$ | $((r-s)-(-s),-(-s))=(r,s)$ |
| 139–140 | $W_{ij},U_h$ | $(r-0,-(-s))=(r,s)$ |
| 141 | $W_{ij},V_i$ | $(s-(s-r),s)=(r,s)$ |
| 142–143 | $W_{ij},V_h$ | $(r-0,s)=(r,s)$ |
| 144 | $U_i,W_{ij}$ | $(-(-r),-r-(-r-s))=(r,s)$ |
| 145 | $W_{ij},V_j$ | $((r+s)-s,s)=(r,s)$ |

The output weights in the last two rows are $-(-r-s)=r+s$
and $r+s$. No error or missing integral-surjectivity hypothesis was
found. The explicit inverse homomorphisms in §1.3 expand the source's
last sentence; they do not change its argument.

## 2. The central elements

### 2.1 Statement and transfer identity

For the group of §1 and every $N\in\mathbb Z$, the expression

\[
z_N=[U_i(a),V_i(b)],\qquad i\in I,\quad a,b\in\mathbb Z,
\quad a+b=N, \tag{2.1}
\]

is independent of all three choices. It belongs to the centre of $G$
and satisfies $z_N^2=1$. Non-triviality, hence order exactly two,
will follow from §4; it is not assumed in this proof.

Fix distinct $i,j$ and arbitrary integers $a,s,b$, and put

\[
x=U_i(a),\quad w=W_{ij}(s),\quad v=V_j(b),\quad
p=[x,w]=U_j(a+s),\quad q=[w,v]=V_i(s+b).
\]

Relation (G3) gives $[x,v]=1$, $[q,p]=1$ and $[q,v]=1$.
Use $xwx^{-1}=pw$ and $wvw^{-1}=qv$ to compute

\[
\begin{aligned}
xqx^{-1}
 &=x(wvw^{-1}v^{-1})x^{-1}\\
 &=(pw)v(pw)^{-1}v^{-1}\\
 &=p(wvw^{-1})p^{-1}v^{-1}\\
 &=pqvp^{-1}v^{-1}\\
 &=q(pvp^{-1}v^{-1})=q[p,v].
\end{aligned}
\]

The last equality uses $[q,p]=1$. Since $q$ commutes with both
$p$ and $v$, it commutes with $[p,v]$. Multiplication on the
right by $q^{-1}$ therefore gives the exact identity

\[
[U_i(a),V_i(s+b)]=[U_j(a+s),V_j(b)]. \tag{2.2}
\]

This calculation neither assumes centrality of these commutators nor
uses any unstated commutation within a single generator type.

### 2.2 Independence of the choices

Suppose $a+b=c+d=N$ and $i\ne j$. In (2.2), use first input
$a$, middle input $c-a$, and last input $d$. Its left second argument is
$c-a+d=N-a=b$, and its right first argument is $c$. Thus

\[
[U_i(a),V_i(b)]=[U_j(c),V_j(d)].
\]

For two splittings at the same index $i$, choose $j\ne i$ and
compare each with $[U_j(N),V_j(0)]$. This yields independence at
fixed $i$ as well as between indices.

### 2.3 Centrality and square

To commute $z_N$ with $U_h(r)$, use (2.1) at an index $i\ne h$.
Relation (G3) says that $U_h(r)$ commutes with $U_i(a)$ and
$V_i(b)$, so it commutes with their commutator. To commute with
$V_h(r)$, the same choice of $i$ and the other two instances of
(G3) give commutation with both factors. For $W_{ij}(r)$, choose
the unique $k\notin\{i,j\}$ and express $z_N$ at index $k$.
Relations (G4U) and (G4V) give commutation with both factors.

Conjugation by $T_\ell$ sends the expression at index $i$ to

\[
[U_i(a-\delta_{\ell i}),V_i(b+\delta_{\ell i})]=z_N,
\]

where the equality is the splitting independence in §2.2. This treats
every generator of $G$, and hence $z_N\in Z(G)$.

For completeness, if $c=[x,y]\in Z(G)$, the equality $xyx^{-1}=cy$
implies $x^2yx^{-2}=c^2y$. Taking $x=U_i(a)$, $y=V_i(b)$
and using $x^2=1$ gives $c^2=1$, as required.

obtains (2.2) by comparing two reorderings of $xyv$. The direct
conjugation calculation here is a different derivation of the same
identity with the same three commutation hypotheses. The source then
uses the same choices of internal indices. No sign error, circular
use of centrality, or missing same-type commutation was found.

## 3. The shift automorphism

### 3.1 Statement

For every integer $c$, the assignments

\[
\beta_c(T_\ell)=T_\ell,\quad
\beta_c(U_i(r))=U_i(r+c),\quad
\beta_c(V_i(r))=V_i(r),\quad
\beta_c(W_{ij}(r))=W_{ij}(r) \tag{3.1}
\]

define automorphisms of $G$, with
$\beta_c\beta_d=\beta_{c+d}$. In particular,
$\alpha_G=\beta_1$ satisfies $\alpha_G(z_N)=z_{N+1}$.

### 3.2 Proof, by relator family

The torus commutators are fixed. For (G1) on a $U_i$-generator,
the translated relation is

\[
T_\ell U_i(r+c)T_\ell^{-1}
=U_i(r+c-\delta_{\ell i})
=\beta_c(U_i(r-\delta_{\ell i})).
\]

For (G1) on $V_i$ or $W_{ij}$, all terms are fixed. Relation
(G2) is sent to the instance $U_i(r+c)^2=1$.

The three families in (G3) become, in their displayed order,

\[
[U_i(r+c),U_j(s+c)]=1,\qquad
[V_i(r),V_j(s)]=1,\qquad
[U_i(r+c),V_j(s)]=1.
\]

Each is a defining relation because the integer parameters range
independently. Relation (G4U) is sent to
$[W_{ij}(s),U_h(r+c)]=1$, with its unchanged condition $h\ne i$.
Relation (G4V) is fixed. Finally, (G5U) becomes

\[
[U_i(r+c),W_{ij}(s)]=U_j(r+s+c),
\]

which is its instance with first input $r+c$; (G5V) is fixed.
Every relator is respected, so (3.1) defines an endomorphism. Its
composite with $\beta_{-c}$ fixes every generator in either order,
and the same calculation proves $\beta_c\beta_d=\beta_{c+d}$.
Applying $\beta_1$ to (2.1) increases the sum of its arguments
by one, so §2.2 gives $\alpha_G(z_N)=z_{N+1}$.

checks of (G1)–(G4); all those checks hold, including the conjugation
relations. The argument here expands each family and also records
all integer translations. No correction to the source is needed.

## 4. Finite quotients and independence

### 4.1 Statement and construction

For each integer $m\geq1$, put

\[
S_m=\mathbb F_2[t]/(t^m-1).
\]

There is a homomorphism $\pi_m:G\to\operatorname{GL}_5(S_m)$
whose image $F_m$ is finite and in which
$\pi_m(z_0),\ldots,\pi_m(z_{m-1})$ generate a central subgroup
$Z_m\cong(\mathbb Z/2\mathbb Z)^m$.

Use matrix rows and columns $1,2,3,4,5$, and write $E_{ab}$ for
the matrix unit. Define the images by

\[
\begin{aligned}
\pi_m(T_\ell)&=D_\ell
 =\operatorname{diag}(1,d_1,d_2,d_3,1),
 \quad d_\ell=t,\quad d_h=1\ (h\ne\ell),\\
\pi_m(U_i(r))&=I_5+t^rE_{1,i+1},\\
\pi_m(V_i(r))&=I_5+t^rE_{i+1,5},\\
\pi_m(W_{ij}(r))&=I_5+t^rE_{i+1,j+1}.
\end{aligned} \tag{4.1}
\]

Division by a monic polynomial gives a unique representative of degree
less than $m$ for every class in $S_m$: subtraction of its leading
multiple reduces a polynomial's degree, and a non-zero multiple of
$t^m-1$ cannot have degree less than $m$. Consequently $S_m$
has $2^m$ elements, with basis $1,t,\ldots,t^{m-1}$. Also
$t\,t^{m-1}=1$, so all integer powers in (4.1) exist. These facts
hold for $m=1$ and for even $m$.

### 4.2 Proof that every relation is respected

Every off-diagonal matrix unit $A$ in (4.1) has $A^2=0$.
Over $S_m$,

\[
(I_5+aA)^2=I_5+2aA+a^2A^2=I_5. \tag{4.2}
\]

The elementary matrices in (4.1) are therefore invertible, and (G2)
holds. The diagonal matrices are invertible and commute. If $D$
is diagonal with unit entries $d_a$, entrywise multiplication gives

\[
DE_{ab}D^{-1}=d_ad_b^{-1}E_{ab}.
\]

For $D=D_\ell$, the three ratios in (4.1) are
$t^{-\delta_{\ell i}}$, $t^{\delta_{\ell i}}$ and
$t^{\delta_{\ell i}-\delta_{\ell j}}$. They give exactly (G1),
including its negative shifts.

For two matrix units, $E_{ab}E_{cd}=\delta_{bc}E_{ad}$.
The following list records both possible products for every family of
commutation relations. The indicated restrictions are exactly those
in §1.

| Relation | Matrix units $A,B$ | $AB$ | $BA$ |
| --- | --- | --- | --- |
| G3, $U_i,U_j$ | $E_{1,i+1},E_{1,j+1}$ | $0$ | $0$ |
| G3, $V_i,V_j$ | $E_{i+1,5},E_{j+1,5}$ | $0$ | $0$ |
| G3, $U_i,V_j$, $i\ne j$ | $E_{1,i+1},E_{j+1,5}$ | $0$ | $0$ |
| G4U, $h\ne i$ | $E_{i+1,j+1},E_{1,h+1}$ | $0$ | $\delta_{hi}E_{1,j+1}=0$ |
| G4V, $h\ne j$ | $E_{i+1,j+1},E_{h+1,5}$ | $\delta_{jh}E_{i+1,5}=0$ | $0$ |

Thus $I_5+aA$ and $I_5+bB$ commute for these pairs, for all
coefficients $a,b\in S_m$.

For three distinct indices $a,b,c$, put $A=E_{ab}$, $B=E_{bc}$.
Then $A^2=B^2=BA=0$, $AB=E_{ac}$, and every product involving
$AB$ followed or preceded by $A$ or $B$ is zero. Expanding the
commutator using (4.2) gives

\[
\begin{aligned}
[I_5+xA,I_5+yB]
 &=(I_5+xA)(I_5+yB)(I_5+xA)(I_5+yB)\\
 &=(I_5+yB+xyAB)(I_5+yB)\\
 &=I_5+xyAB.
\end{aligned} \tag{4.3}
\]

Apply (4.3) with the triples $(1,i+1,j+1)$ and
$(i+1,j+1,5)$, using coefficients $(t^r,t^s)$ and $(t^s,t^r)$,
respectively. This gives (G5U)
and (G5V), with output coefficient $t^{r+s}$. Every defining
relator has now been treated, so (4.1) defines a homomorphism.
The image $F_m$ is finite, since the set of all $5$-by-$5$
matrices over the finite ring $S_m$ is finite. The map
$G\to F_m$ is surjective by the definition of the image.

### 4.3 The central subgroup

Apply (4.3) to the triple $(1,i+1,5)$. Equations (2.1) and
(4.1) give, for every integer $N$,

\[
\overline z_N:=\pi_m(z_N)=I_5+t^NE_{1,5}. \tag{4.4}
\]

The matrix unit $E_{1,5}$ has zero product in both orders with every
off-diagonal matrix unit in (4.1), and each $D_\ell$ has the same
entry $1$ in positions $1$ and $5$. Thus (4.4) is central in
$F_m$, also by a direct matrix calculation.

For $c_0,\ldots,c_{m-1}\in\{0,1\}$, multiplication using
$E_{1,5}^2=0$ gives

\[
\prod_{q=0}^{m-1}\overline z_q^{\,c_q}
=I_5+\left(\sum_{q=0}^{m-1}c_qt^q\right)E_{1,5}. \tag{4.5}
\]

By the basis statement in §4.1, this is the identity if and only if
all $c_q$ vanish. Equations (4.2) and (4.5) therefore identify
$Z_m$ with $(\mathbb Z/2\mathbb Z)^m$. No semisimplicity of
$S_m$, restriction on the parity of $m$, or bound on $m$ was
used.

As a consequence, each $z_N$ has order exactly two in $G$, since
its image $I_5+t^NE_{1,5}$ is not the identity: $t^N$ is a unit
in the non-zero ring $S_m$. In fact, the entire family is independent
in $G$. If $N_1<\cdots<N_a$ are distinct, take
$m>N_a-N_1$. Their residues modulo $m$ are distinct, so the
images $t^{N_b}$ are distinct members of the basis of $S_m$.
Equation (4.5), with these residues, detects every non-empty product
of the corresponding $z_{N_b}$. Thus the subgroup they generate
over all $N\in\mathbb Z$ is the direct sum of copies of
$\mathbb Z/2\mathbb Z$. This does not assert that it is the whole
centre of $G$.

The source at lines 251–305 uses matrix indices $0,1,2,3,4$;
subtracting one from both indices in every matrix unit here recovers
its formulas. The proof agrees with the independent construction in
§0. The source explicitly includes the non-reduced case. No error was
found, and no numerical check is used to extend a finite range to all
$m$.

## 5. The group algebra and the selection functor

### 5.1 Statement

Let $G$ be the group of §1. Set

\[
R=\mathbb C G,\qquad
\alpha\left(\sum_g c_g g\right)=\sum_g c_g\alpha_G(g),
\qquad e=\frac{1+z_0}{2}.
\]

Then $R$ is a finitely presented unital complex algebra, $\alpha$ is
an algebra automorphism, and $e$ is a central idempotent. With the
report's convention for restriction of scalars, put

\[
H(Y)={}_{\alpha}(eY).
\]

More generally, let $R$ be any unital $k$-algebra, let $e\in Z(R)$
be an idempotent, and let $\alpha$ be a unital $k$-algebra
automorphism. Write

\[
e_q=\alpha^q(e),\qquad
p_j=\prod_{q=0}^{j-1}e_q,\qquad p_0=1.
\]

For every left $R$-module $Y$, with no finite-generation hypothesis,
and every integer $j\geq0$, there is a natural isomorphism

\[
H^j(Y)\cong{}_{\alpha^j}(p_jY). \tag{5.1}
\]

Here $H^0$ is the identity functor. In this dossier $H^j$ denotes
iteration, as in the job statement; the source writes $H^{\circ j}$
to distinguish iteration from cohomology. On the right of (5.1),
the action of $r\in R$ is the original action of $\alpha^j(r)$.
The automorphism hypothesis ensures that all $e_q$ are central
in $R$; no assertion that arbitrary endomorphisms preserve the centre
is needed.

### 5.2 Finite presentation of the group algebra

Take the fifteen generators $g_1,\ldots,g_{15}$ and finitely many
relators $w_a=1$ from §1.2. Let $A$ be the quotient of the free
unital associative complex algebra on $x_1,y_1,\ldots,x_{15},y_{15}$
by

\[
x_i y_i=y_i x_i=1\quad(1\leq i\leq15),
\qquad w_a(x_1,y_1,\ldots,x_{15},y_{15})=1.
\]

In each word, $g_i^{-1}$ is replaced by $y_i$. Evaluation
$x_i\mapsto g_i$, $y_i\mapsto g_i^{-1}$ gives an algebra
homomorphism $A\to\mathbb CG$. Conversely, the units $x_i$ in $A$
satisfy the group relators, so the group presentation gives a group
homomorphism $G\to A^\times$. Linear extension gives an algebra
homomorphism $\mathbb CG\to A$. Their composites fix each algebra
generator on the respective side, so they are inverse. This is a
finite algebra presentation; the fifteen count refers to group
generators, while this algebra presentation uses thirty symbols.

Multiplicativity of $\alpha_G$ gives multiplicativity of its linear
extension $\alpha$; extending $\alpha_G^{-1}$ gives its inverse.
Centrality of $z_0$ gives centrality of $e$, and

\[
e^2=\frac{1+2z_0+z_0^2}{4}
=\frac{1+z_0}{2}=e.
\]

Moreover, $\alpha^q(e)=(1+z_q)/2$. Every $e_q$ is a central
idempotent, either by §2 or because an automorphism sends the
centre to itself.

### 5.3 The functor and its iterates

For a general triple $(R,e,\alpha)$ as in §5.1, centrality of $e$
makes $eY$ an $R$-submodule. If $f:Y\to Y'$ is $R$-linear, then
$f(ey)=ef(y)$, so restricting $f$ defines the map $H(f)$. The
module axioms after restriction of scalars follow from the fact that
$\alpha$ is a unital algebra homomorphism. In particular, $H$ is
additive and preserves finite dimensionality.

To identify this with the report's bimodule notation, give
$\Psi={}_{\alpha}(eR)$ its usual right action and left action
$r\cdot x=\alpha(r)x$. The map

\[
\Psi\otimes_R Y\longrightarrow{}_{\alpha}(eY),
\qquad x\otimes y\longmapsto xy
\]

is balanced and left $R$-linear. Its inverse sends $v\in eY$ to
$e\otimes v$: the composite on $x\otimes y$ is
$e\otimes xy=ex\otimes y=x\otimes y$, and the other composite is
$v\mapsto ev=v$. Thus this is also $H=\Psi\otimes_R-$.

For (5.1), start with $j=0$, when both the subspace and action are
those of $Y$. Suppose that the stage $j$ is the vector space $p_jY$
with action $r\cdot v=\alpha^j(r)v$. Selection by $e$ in that
module has image

\[
\alpha^j(e)p_jY=e_jp_jY=p_{j+1}Y.
\]

The subspace is an $R$-submodule for the original action because
each factor in $p_{j+1}$ is central. Restricting scalars once more
makes the new action

\[
r\cdot v=\alpha^j(\alpha(r))v=\alpha^{j+1}(r)v.
\]

This proves the induction step. For every $R$-linear map $f$, the
identification restricts the same underlying linear map to $p_jY$,
so the isomorphism is natural in $Y$. No inverse twist occurs.

explicit algebra maps and the induction. The source at lines 314–328
and 355–368 gives the same presentation and twist direction. The
tensor description is included to match the report's notation.
No error or gap was found.

## 6. Modules with extinction exactly at m

### 6.1 Statement and construction

For the fixed triple $(R,e,\alpha)$ of §5.1 and every integer
$m\geq1$, there is a non-zero finite-dimensional left $R$-module
$Y_m$ such that

\[
H^j(Y_m)\ne0\quad(0\leq j<m),\qquad
H^j(Y_m)=0\quad(j\geq m). \tag{6.1}
\]

Let $F_m$ and $Z_m$ be as in §4, and write
$\overline z_q=\pi_m(z_q)$. Independence in §4.3 permits the
character $\chi_m:Z_m\to\mathbb C^\times$ specified by

\[
\chi_m(\overline z_q)=
\begin{cases}
1,&0\leq q<m-1,\\
-1,&q=m-1.
\end{cases}
\]

Explicitly, the value on
$\prod_{q=0}^{m-1}\overline z_q^{\,c_q}$ is $(-1)^{c_{m-1}}$.
The unique expression of each element as such a product makes this
a well-defined homomorphism. Define

\[
p_{\chi_m}=\frac{1}{2^m}\sum_{z\in Z_m}\chi_m(z)^{-1}z
\quad\text{in }\mathbb C[F_m],
\qquad Y_m=\mathbb C[F_m]p_{\chi_m}, \tag{6.2}
\]

and use $\pi_m$ to regard $Y_m$ as a left $R$-module.

### 6.2 The module is non-zero and has the prescribed character

The elements of $F_m$ are a basis of its group algebra. The identity
coefficient of $p_{\chi_m}$ is $2^{-m}$, so $p_{\chi_m}\ne0$.
For $h\in Z_m$, substitute $u=hz$ in its defining sum to get

\[
\begin{aligned}
hp_{\chi_m}
&=\frac{1}{2^m}\sum_{u\in Z_m}\chi_m(h^{-1}u)^{-1}u\\
&=\chi_m(h)p_{\chi_m}.
\end{aligned} \tag{6.3}
\]

Since $Z_m$ is central in $F_m$, $p_{\chi_m}$ is central in the
group algebra. Equations (6.2)–(6.3) give

\[
p_{\chi_m}^2
=\frac{1}{2^m}\sum_{z\in Z_m}\chi_m(z)^{-1}
                         \chi_m(z)p_{\chi_m}
=p_{\chi_m}.
\]

The left ideal in (6.2) contains $p_{\chi_m}$ and is contained in
the finite-dimensional vector space $\mathbb C[F_m]$, so it is
non-zero and finite dimensional. If $f\in F_m$ and $h\in Z_m$,
centrality and (6.3) imply

\[
h(fp_{\chi_m})=f(hp_{\chi_m})
=\chi_m(h)fp_{\chi_m}.
\]

Linearity gives the prescribed character on every vector of $Y_m$.
This proves the requisite properties without a semisimplicity theorem.

The induction construction in the independent attempt is the same
module. To see this directly, choose representatives $f$ for the
cosets $fZ_m$. The group algebra is the direct sum of the right
$\mathbb C[Z_m]$-modules $f\mathbb C[Z_m]$. Hence
$\mathbb C[F_m]\otimes_{\mathbb C[Z_m]}\mathbb C_{\chi_m}$ has
basis $f\otimes1$. The map $f\otimes1\mapsto fp_{\chi_m}$ is
balanced by (6.3). The vectors $fp_{\chi_m}$ are non-zero and
have disjoint supports in those cosets, so they are independent;
they span $Y_m$. This identifies the two constructions and gives
$\dim_{\mathbb C}Y_m=[F_m:Z_m]$.

### 6.3 Extinction

On the original module $Y_m$, equations (5.1), (6.2) and (6.3) give

\[
e_q|_{Y_m}=
\begin{cases}
\operatorname{id}_{Y_m},&0\leq q<m-1,\\
0,&q=m-1.
\end{cases}
\]

For $0\leq j<m$, the product $p_j$ therefore acts as the identity,
and (5.1) identifies $H^j(Y_m)$ with the non-zero vector space
$Y_m$, endowed with the action precomposed by $\alpha^j$. For
$j=m$, the product includes $e_{m-1}$ and has zero image.
For every larger $j$, the product still includes that factor, so
its image remains zero. At $m=1$, the list of positive signs is
empty, $e_0Y_1=0$, and $H^0(Y_1)=Y_1\ne0$.

All choices in $(R,e,\alpha)$ were made before $m$ was selected.
The argument uses the quotient only to construct $Y_m$ and its
original central character. Each iterate is an $R$-module obtained
by restriction of scalars, so it does not require an automorphism
of a finite quotient.

The source at lines 330–353 uses precisely (6.2), while the independent
attempt began with induction. The explicit isomorphism above reconciles
them. The source's iterate and boundary-case arguments at lines
370–376 have the stated twist and extinction time. No correction was
found.

## 7. The Santos Rego comparison

The comparison is with Yuri Santos Rego, *On the finiteness length of
some soluble linear groups*, arXiv:1901.06704v3, 20 April 2021,
[pinned arXiv record](https://arxiv.org/abs/1901.06704v3).
The Library copy is
[Reg19 PDF](<Reg19 - On the Finiteness Length of Some Soluble Linear Groups.pdf>).
The PDF's version banner and the arXiv record agree. The source's
bibliography key Rego2022 points to the 2022 journal article and also
explicitly to this arXiv version. All locators below refer to the
arXiv version, not to journal pagination.

The standing coefficient ring is commutative and unital (p. 1).
The commutator convention is $[x,y]=xyx^{-1}y^{-1}$ (§2, p. 6),
the same as here. Proposition 4.9 is stated on p. 24 for $n\geq4$;
it identifies the unipotent group with a colimit of the specified
contracting subgroups. In its proof, the exact comparison formulas
are, on p. 26,

\[
[e_{1j}(t),e_{jn}(1)]
 =[e_{1j}(1),e_{jn}(t)]=e_{1n}(t)
\quad\text{(4.9)}
\]

and

\[
[e_{ij}(t),e_{1n}(s)]=1
\quad\text{(4.10)}.
\]

Here (4.9) ranges over $t$ in the chosen additive generating set and
$2\leq j\leq n-1$; (4.10) ranges over $s,t$ in that set and
$1\leq i<j\leq n$. The proof of (4.9) is on pp. 27–28 and uses
Hall's identity from Lemma 4.7 (p. 23) to transfer a commutator
between different internal indices. The proof of (4.10), on p. 28,
uses the alternative commutator expressions to obtain centrality.
The relevant formulas and calculations were read in the extracted
text and in rendered images of pp. 26–28.

This supports the preprint's limited comparison at lines 37–42:
transfer of a commutator and centrality by changing the intermediate
index are the common mechanisms. There are differences in the
presentations. Santos Rego works with upper-unitriangular groups;
our $W_{ij}$ occur for both orders of distinct indices. Also, three
internal indices in this dossier allow a third-index centrality
argument for every $W_{ij}$; the cited proof handles internal
elementary matrices by a longer calculation, including at $n=4$.
No claim that the groups coincide is made, and no result from
Santos Rego is a premise in §§1–6.

Status of the attribution: **cited comparison**, with the locators
read in v3. The source's comparison has the stated scope; no
misattribution was found.

## 8. Computation and final statuses

The new script
[D-C-selection-checks.py](../../../computations/D-C-selection-checks.py)
and its saved
[output](../../../computations/D-C-selection-checks.out)
were produced in this session. The script was written before reading
the earlier computation. It uses exact integers for the weight
identities and sparse matrices with bit-mask coefficients over
$S_m$ for the finite checks.

The completed checks are:

- all twelve kernel bases, their chosen right inverses, and the
  determinants of the three-column integral bases;
- all nine rows of the source table, for each of the six ordered
  choices of distinct indices, as identities in the coefficients of
  $r,s$, together with both output weights;
- for every $m=1,\ldots,10$, every residue of every input parameter
  and every allowed index choice in (G1)–(G5V), plus torus
  commutation, invertibility, central commutator images and centrality;
- all $2^m$ subset products of the $m$ central images, for each of
  those ten values of $m$;
- the products of the chosen scalar selection signs for $j=0,\ldots,m$,
  for those same ten values of $m$.

All listed checks passed. The scalar calculation does not construct
the full induced representations. The finite matrix calculations
do not establish identities in the abstract group or finite
presentability, and do not replace the universal proofs above.

The archived files computations/01-selection-quotients.py and
computations/01-selection-quotients.out were subsequently inspected.
They were not modified or rerun and are not premises of this dossier.
Their alternative-conjugation failures for $m\geq3$ concern
$T^{-1}ST=S(r+\lambda)$, which is not the defining convention.
For the stated convention, the inverse conjugation is
$T^{-1}S(r)T=S(r-\lambda)$, as used in §1.3.

| Assigned result | Final status | Reason / proof locator |
| --- | --- | --- |
| Presentation and equivalence with a finite presentation on fifteen generators | [status omitted] | §1.3 constructs inverse homomorphisms |
| Kernel-lattice centralisers and every integral-preimage row | [status omitted] | §§1.2–1.4 give the integral bases and all evaluations |
| Commutator transfer and independence of $z_N$ from $(i,a,b)$ | [status omitted] | §§2.1–2.2 use only the defining commutations |
| Centrality and $z_N^2=1$ | [status omitted] | §2.3 checks each generator family |
| Automorphism and $\alpha_G(z_N)=z_{N+1}$ | [status omitted] | §3.2 checks every relator, including conjugation, for both translations |
| Finite quotients and independence of the first $m$ central images | [status omitted] | §§4.1–4.3 apply for every $m\geq1$ |
| Order exactly two and independence of all $z_N$ in $G$ | [status omitted] | §4.3 separates each finite subset in a suitable quotient |
| Finite presentation of $R$ and central idempotent $e$ | [status omitted] | §5.2 gives an explicit finite algebra presentation |
| Iterate formula for arbitrary left modules | [status omitted] | §5.3 tracks the subspace and the action separately |
| Selection modules and extinction exactly at $m$ | [status omitted] | §6 constructs the non-zero module and evaluates every iterate |

No assigned result is left plausible, open or refuted. No proof
depends on an unread literature locator. The source comparison found
no mathematical error or missing proof step requiring a correction.
The most consequential points for the next fresh-context review are
the implication from the finite relators to all indexed relators
(§1.3) and the non-circular commutator calculation (§2.1).
This drafting job does not assign [status omitted] status or replace the
fresh-context review required before the report is drafted.
