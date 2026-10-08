Model: unknown; effort: unknown.

# Work file for D-E, report 8.5

Provenance: AI dossier work on 2026-10-08. This is a new proof note in the
report conventions: left modules, cohomological shifts, characteristic two,
\(k=\mathbb F_2(q,H_1,H_2)\). Source computations are leads only.
The first extraction of source statements also exposed formula explanations
outside proof environments in 06-lift.tex, the finite table recurrences in
09-cochain.tex, and the twist proof in 07-branches.tex; those are source inputs,
not an independent attempt. The homotopy arguments below are reconstructed
before reading the proofs of Lemmas lift:B and lift:G.

## Initial proof attempt for the lift

The algebra is graded by the number of dual-ideal letters, taking values zero
and one. The right-twisted tensor functor is restriction by the inverse
scaling automorphism; hence a homogeneous Ext class of internal weight
minus one is multiplied by \(H^{-1}\). The missing input is a representative
of the degree-three generator of precisely that weight; the supplied cocycle
table is a candidate and requires a complete polynomial check.

Let \(b:T_h\to T\otimes_I T\) be determined by the twisted Casimir
\(\xi_H=\sum h(w)\otimes_I w^*\). The trace pairing gives
\(h(a)\xi_H=\xi_H a\), the needed twisted bimodule identity. Multiplication
annihilates this tensor because the row and column dimensions of C are 6 and
4, hence zero in characteristic two. Appending the second Casimir factor to
a bar word is a candidate chain contraction \(B\) of \(b\epsilon\).
Internal prefix multiplications cancel in \(dB+Bd\); the only remaining
terms occur at the old endpoint and the appended letter. Their cancellation
must use the Casimir identity after removal of idempotents, leaving the
endpoint socle term at the bottom degree.

The suffix comparison \(p\) lowers bar length by three. The composite \(pB\)
therefore lowers length by two, and its bottom value is
\(r_H(a,b)=\sum_w p(a,b,h(w))w^*\). A one-cochain \(z_H\) with
\(r_H(a,b)=a z_H(b)+z_H(ab)+z_H(a)h^{-1}(b)\) should give a global
homotopy by replacing the terminal bar by \(z_H\) and inverse-twisting the
terminal coefficient. Prefix terms cancel, and only this two-input identity
remains. Consequently a finite certificate of the displayed boundary
identity suffices for all bar lengths; truncating a finite-degree check would
not suffice. This is the all-degree point to check in the full source proof.

The two-cone map then uses only two nonzero cells:
\(B\otimes b\epsilon\) in the top cell and \(G\otimes b\epsilon\) in the
second singleton cell. Its sole defect is supported at source degree zero,
so a high syzygy yields a stable map. Its top evaluation is the socle map
\(s\otimes s\to\Omega(s\otimes s)\). To rule out factoring through a
projective, write every map from the simple to its projective cover as a
socle inclusion; the socle annihilates the radical in a symmetric algebra,
so subsequent maps to the radical cover kernel vanish.

Status at this checkpoint: plausible; the finite identities and the omitted
endpoint cancellation remain to be checked.

## 8.5(a). The cochain and its boundary identity

Assume \(k\) is a field of characteristic two with \(q\ne0\); the
application uses \(k=\mathbb F_2(q,H_1,H_2)\).
Use \(C,T,s,I=ke\oplus kf,\mathfrak r\) from 8.2–8.3 and put
\(\varepsilon(a)=0\) on lower-case letters and \(1\) on their capital
duals. All complexes below are cohomological. Define
\[
 P^{-n}=T\otimes_I\mathfrak r^{\otimes_I n}\otimes_I T\quad(n\ge0),
 \qquad P^j=0\quad(j>0).
\]
The differential sums adjacent multiplications and the augmentation
\(\pi:P^0\to T\) is multiplication. Each term decomposes into copies of
\(Ti\otimes_kjT\), \(i,j\in\{e,f\}\), so is projective as a bimodule.
For exactness, write \(a_0=a_0^I+\overline a_0\) according to
\(T=I\oplus\mathfrak r\), and insert \(\overline a_0\) as the first
bar, replacing the first coefficient by \(1\). In augmented degree send
\(a\) to \(1[]a\). In \(d\sigma+\sigma d\), all adjacent
multiplications except the first occur twice; the first contribution is
\(\overline a_0\), while balancing \(a_0^I\) over \(I\) supplies the
remaining \(a_0^I\). Thus \(d\sigma+\sigma d=1\). This contraction is
right linear, so \(P\otimes_Ts\) is a projective resolution of \(s\).

Define \(p:\mathfrak r^{\otimes_I3}\to T\) by the complete literal table
in the variable 'table' of
'computations/08-D-E/finite_cochain_certificate.py': a word \(abcv\)
in row \(d\) means that the coefficient of \(v\) in \(p(a,b,c)\) is
\(q^d\); all unlisted coefficients are zero. The script contains all 179
entries and the complete multiplication definition of \(C\), so this is a
self-contained finite definition.

For \(\lambda\in k^\times\), let
\[
 h_\lambda(c+\phi)=c+\lambda\phi,\qquad
 z_\lambda(a)=
 \begin{cases}
 \lambda q a,&a\in\{u,v,t,E,X,Y,Z,U,V\},\\
 0,&\text{otherwise}.
 \end{cases}
\]
Then \(h_\lambda\) is an automorphism, because \(DC\) is a square-zero
bimodule ideal and all mixed products are linear in that ideal.
The cochain \(p\) has dual-letter weight \(-1\), is a Hochschild
cocycle, has nonzero evaluation on \(s\), and satisfies
\[
 \sum_{w\in\mathcal B_{\mathfrak r}}p(a,b,h_\lambda(w))w^*
 =az_\lambda(b)+z_\lambda(ab)+z_\lambda(a)h_\lambda^{-1}(b)
 \quad(a,b\in\mathfrak r).                               \tag{8.5.1}
\]

Finite identity proof and scope. The new script represents polynomials
in \(\mathbb F_2[q]\) as exact binary coefficient vectors: addition is
XOR and multiplication is carry-free polynomial multiplication. It
constructs \(T\) from \(C\) using
\[
 \mu_{a,b^*}^{c^*}=\mu_{ca}^{b},\qquad
 \mu_{b^*,a}^{c^*}=\mu_{ac}^{b},\qquad (DC)^2=0.
\]
It checks all \(20^3=8000\) associativity triples. For every radical
four-word it computes
\[
 ap(b,c,d)+p(ab,c,d)+p(a,bc,d)+p(a,b,cd)+p(a,b,c)d
\]
as a complete coefficient vector and finds zero. The \(18^4=104976\)
inputs include every one of the 15250 composable four-words. The script
checks corners and
\(\varepsilon(a)+\varepsilon(b)+\varepsilon(c)-\varepsilon(v)=1\)
on each nonzero entry. Corner agreement supplies well-definedness over
\(I\); multilinearity gives the Hochschild and weight identities on all
inputs.

For (8.5.1) write \(z_\lambda(a)=\lambda\gamma_a a\). On each of the
324 radical input pairs, for each output letter \(v\), the script
checks both the constant and linear coefficients in \(\lambda\):
\[
 \varepsilon(b)\gamma_a\mu_{ab}^v,\qquad
 \bigl(\gamma_b+\gamma_v+(1-\varepsilon(b))\gamma_a\bigr)\mu_{ab}^v.
\]
These are exactly the right-hand coefficients, since its last term has
coefficient \(\lambda^{1-\varepsilon(b)}\gamma_a\mu_{ab}^v\).
Thus the identity holds over \(\mathbb F_2[q,\lambda]\), and hence
after every characteristic-two specialisation with \(\lambda\ne0\).
There is no numerical specialisation in this certificate.
Its saved output, 'finite_cochain_certificate.out' in the same directory,
records 'all enumerated polynomial identities hold'.
The certificate covers precisely the stated finite multilinear identities,
the cycle and Casimir calculations below; it does not alone claim any
all-degree Ext or stable-category conclusion.

To establish nonzero evaluation, use the two-sided-simple bar cycle
\[
 \zeta=q^2[t|x|J]+[t|y|J]
 \in s^{\mathrm r}\otimes_TP^{-3}\otimes_Ts.
\]
Outer radical actions vanish, and
\(tx=j,\ ty=q^2j,\ xJ=T,\ yJ=q^2T\) make the inner differential terms
cancel in pairs. The table gives \(p(t,x,J)=0\) and
\(p(t,y,J)=q^3f\). Hence the simple-valued cochain evaluates to
\(q^3\ne0\) on \(\zeta\). A coboundary evaluates to zero on every cycle,
because its pairing is evaluation after the bar differential. Thus
\(\tau=[p\otimes_Ts]\ne0\). For the polynomial-generator assertion
we now impose the standing hypothesis of 8.3 that \(q\) has infinite
multiplicative order (in particular, the report's transcendental \(q\));
under that hypothesis 8.3 identifies it as a polynomial generator.
The finite polynomial identities themselves require no infinite-order
hypothesis.

Use the same letter for the comparison \(p:P\to P[3]\):
\[
 p(a_0[a_1|\cdots|a_n]a_{n+1})
 =a_0[a_1|\cdots|a_{n-3}]
      p(a_{n-2},a_{n-1},a_n)a_{n+1}\quad(n\ge3),
\]
and zero for \(n<3\). In \(dp+pd\), every multiplication strictly before
the last four bars occurs twice; the remaining five terms are the
Hochschild equation following the unchanged prefix. At \(n=3\), the
target differential has zero target and \(p\) vanishes on \(P^{-2}\).
The lower indices give zero too. This proves the chain identity at
every index.

Status: **AI-proved**, using the exhaustive polynomial certificate and
the cycle calculation. Identification as a polynomial generator depends
on 8.3.

## 8.5(b). Twists on every homogeneous self-extension

For a left \(T\)-module \(M\), the map
\[
 T_{h_\lambda}\otimes_TM\longrightarrow{}_{h_\lambda^{-1}}M,\qquad
 a\otimes m\longmapsto h_\lambda^{-1}(a)m
\]
is a balanced left-module isomorphism, with inverse \(m\mapsto1\otimes m\).
The target action is \(b\cdot m=h_\lambda^{-1}(b)m\).
The character of \(s\) is fixed, giving a canonical identification of its
twist with \(s\).

On \(P\otimes_Ts\), applying \(h_\lambda^{-1}\) to the first coefficient
and all bars gives a comparison to this twisted resolution: it is left
linear for the specified action, commutes with every adjacent product,
and induces the identity on the augmented simple. Only weight-zero
outputs of \(p\) act nontrivially on \(s\). The weight identity therefore
says that every nonzero component of its simple-valued cochain has exactly
one capital input. The comparison multiplies it by \(\lambda^{-1}\).
Thus the exact tensor functor sends \(\tau\) to \(\lambda^{-1}\tau\).
It preserves splices of extensions, hence Yoneda products, and sends
\[
 \tau^m\longmapsto\lambda^{-m}\tau^m\qquad(m\ge0).
\]

Put \(E=T\otimes_kT\), \(S=s\otimes_ks\) and
\(E_\lambda=E_{h_\lambda\otimes h_\lambda}\). The tensor functor twists
both factors; under 8.4, it sends
\[
 \tau_1^r\tau_2^{m-r}\longmapsto
 \lambda^{-m}\tau_1^r\tau_2^{m-r}\quad(0\le r\le m).
\]
These monomials form a basis, so its action on all of
\(\widehat{\operatorname{Ext}}_E^{3m}(S,S)\) is the scalar
\(\lambda^{-m}\), including \(m=0\).
Status: **AI-proved**, using the polynomial calculation of 8.3–8.4.

## 8.5(c). The lift to the two-cone bimodule

Let
\[
 K=\operatorname{Cone}(p:P[-3]\to P)\otimes_k
   \operatorname{Cone}(p:P[-3]\to P).
\]
Its cell indexed by \(J\subseteq\{1,2\}\) is
\(P^{\mathrm{tot}}[-2|J|]\), where \(P^{\mathrm{tot}}=P\otimes_kP\).
Let \(\mathcal C\) be its finite stable bimodule representative from 8.4.
For each \(\lambda\ne0\), there is a stable bimodule map
\[
 f_\lambda:E_\lambda\longrightarrow\mathcal C[3]            \tag{8.5.2}
\]
whose top projection to \(E[-1]\) is represented by
\[
 \beta_\lambda:E_\lambda\longrightarrow
 \Omega_{E^e}E\subset P^{\mathrm{tot},0},\qquad
 \beta_\lambda(1)=\xi_\lambda\otimes\xi_\lambda,\quad
 \xi_\lambda=\sum_{w\in\mathcal B}h_\lambda(w)\otimes_Iw^*.
\]
On evaluation at \(S\), the latter sends
\[
 1\longmapsto\lambda^2(f^*\otimes f^*)
 \in\Omega_ES=\operatorname{rad}(E)(f\otimes f).            \tag{8.5.3}
\]
This is nonzero stably, and hence so is the evaluation of \(f_\lambda\).

Here \(\Omega\) has the report's minimal-syzygy meaning. Indeed, writing
\(r\) for the four primitive vertex idempotents of \(E\), the module
\(P^{\mathrm{tot},0}\) is \(\bigoplus_r Er\otimes_k rE\).
Its top as an \(E^e\)-module is \(k^4\), and the augmentation induces
an isomorphism from that top onto
\(E/(\operatorname{rad}(E)E+E\operatorname{rad}(E))=E/\operatorname{rad}(E)
\cong k^4\). Its kernel lies in the radical of its projective source,
so it is a projective cover. To justify the last implication, a submodule
mapping surjectively to \(E\), together with the kernel, generates the
source; the quotient by that submodule is equal to its radical and must
be zero because the radical is nilpotent. On evaluation at \(S\), the
same augmentation is the cover \(E(f\otimes f)\to S\).

The Casimir identities. The tensor \(\sum w\otimes w^*\) corresponds
to the identity under
\[
 T\otimes_kT\longrightarrow\operatorname{End}_k(T),\quad
 x\otimes y\longmapsto(t\mapsto x\operatorname{tr}(yt)).
\]
Both its left multiplication by \(a\) and its right multiplication by
\(a\) correspond to \(t\mapsto at\). Applying \(h_\lambda\) to the
first factor and projecting to \(\otimes_I\) gives
\[
 h_\lambda(a)\xi_\lambda=\xi_\lambda a.                   \tag{8.5.4}
\]
Consequently \(b:T_{h_\lambda}\to P^0,\ b(x)=x\xi_\lambda\), is a
bimodule map. For a lower-case \(w\), the products \(ww^*\) and \(w^*w\)
are the duals of its left and right idempotents. The dual-action formulas
reduce this to the coefficient of \(w\) in \(cw\) and \(wc\); the
positive grading makes those coefficients zero for radical \(c\), while
idempotents give the claimed value. Since both the row and column
dimensions of \(C\) are \(6,4\), characteristic two gives
\[
 \pi\xi_\lambda=\sum_{w\in\mathcal B_C}ww^*
       +\lambda\sum_{w\in\mathcal B_C}w^*w=0.              \tag{8.5.5}
\]
Separating by left vertex and deleting its sole idempotent summand yields
\[
 \sum_{\substack{w\in\mathcal B_{\mathfrak r}\\
                   \operatorname{left}(w)=r}}
 h_\lambda(w)w^*=r^*\qquad(r=e,f).                       \tag{8.5.6}
\]
The certificate also checks both identities coefficientwise in
\(\lambda\). Since \(\pi b=0\), \(b\otimes_kb\) takes values in the
kernel of the augmentation to \(E\), as required for \(\beta_\lambda\).

The first homotopy. Set \(Q=P_{h_\lambda}\), with augmentation
\(\epsilon:Q^0\to T_{h_\lambda}\). Every map from \(Q\) to an
untwisted target is specified below on bar generators and extended by
\[
 \psi(a_0[a_1|\cdots|a_n]a_{n+1})
 =a_0\psi([a_1|\cdots|a_n])h_\lambda^{-1}(a_{n+1}),       \tag{8.5.7}
\]
where the last coefficient is its underlying element of \(T\).
This is exactly the twisted-source right-linearity rule.
Let \(D_b:Q\to P\) have degree-zero component \(b\epsilon\) and all
other components zero. It is a chain map since \(\epsilon d=0\).
Define
\[
 B_n:Q^{-n}\to P^{-n-1},\qquad
 B_n([a_1|\cdots|a_n])
 =\sum_w[a_1|\cdots|a_n|h_\lambda(w)]w^*\quad(n\ge0),     \tag{8.5.8}
\]
where \(w\) ranges over the composable radical letters.
Then \(dB+Bd=D_b\), as follows.

For a radical \(a\) with right vertex \(r\), project the first factor of
\(a\xi_\lambda=\xi_\lambda h_\lambda^{-1}(a)\) onto \(\mathfrak r\).
Deleting idempotent letters on the first side removes \(a\otimes r^*\);
on the second side the idempotent first factors project to zero. Hence
\[
 \sum_w ah_\lambda(w)\otimes_Iw^*
 +\sum_w h_\lambda(w)\otimes_Iw^*h_\lambda^{-1}(a)
 =a\otimes_Ir^*,                                        \tag{8.5.9}
\]
with \(w\) radical. At \(n>0\), all prefix multiplications in
\(dB_n+B_{n-1}d\) cancel pairwise. The two terms involving the old
last bar sum to \([a_1|\cdots|a_n]r^*\) by (8.5.9); the terminal
multiplication of the appended bar gives that same expression by
(8.5.6), so the total vanishes. At \(n=0\), on \(r[]r\), the
differential gives the radical part of \(r\xi_\lambda\) plus \(r[]r^*\),
which restores precisely its omitted idempotent summand. Its value is
therefore \(b\epsilon(r[]r)\). Bimodule linearity completes degree zero.

An explicit second homotopy. Set \(G_0=0\) and
\[
 G_n:Q^{-n}\to P^{-n+1},\qquad
 G_n([a_1|\cdots|a_n])
 =[a_1|\cdots|a_{n-1}]z_\lambda(a_n)\quad(n\ge1),          \tag{8.5.10}
\]
using (8.5.7). Corners are preserved, so these maps are well defined.
For \(n\ge2\), prefix cancellation in \(dG+Gd\) leaves
\[
 [a_1|\cdots|a_{n-2}]
 \bigl(a_{n-1}z_\lambda(a_n)+z_\lambda(a_{n-1}a_n)
       +z_\lambda(a_{n-1})h_\lambda^{-1}(a_n)\bigr).
\]
By (8.5.1), this equals \(pB_n\), since \(p\) evaluates the final
three bars of (8.5.8). At \(n=0,1\), both sides vanish:
\(pB_n\) has target \(P^{2-n}=0\), \(G_0=0\), and \(d:P^0\to P^1=0\).
It follows that
\[
 pB=dG+Gd                                                \tag{8.5.11}
\]
in every degree. The preprint obtains \(G_n\) by recursive projective
lifting; formula (8.5.10) is a direct alternative.

The tail map. The complex \(Q\otimes_kQ\) resolves \(E_\lambda\).
In \(K[3]\), the top cell is \(P^{\mathrm{tot}}[-1]\) and the
singleton cells are \(P^{\mathrm{tot}}[1]\). Define
\[
 \Phi_{\{1,2\}}=B\otimes D_b,\qquad
 \Phi_{\{2\}}=G\otimes D_b,\qquad
 \Phi_{\{1\}}=\Phi_\varnothing=0.
\]
The indicated degrees agree with (8.5.8) and (8.5.10).
The top internal defect is \(D_b\otimes D_b\). Deleting slot 1 gives
\(pB\otimes D_b\) in cell \(\{2\}\), cancelling its internal defect
\((dG+Gd)\otimes D_b\). Deleting slot 2 gives zero because \(pD_b=0\).
Thus only \(D_b\otimes D_b\) remains, supported at source degree zero.
The map commutes with the differential at every degree \(-n\), \(n>0\).

For \(n\ge4\), both relevant complexes are in their exact tails. Taking
cokernels at degree \(-n\) and then the stable shift \([n]\) gives
(8.5.2). At \(n=4\), the target is
\(\operatorname{coker}(K^{-2}\to K^{-1})[4]\), representing
\(\mathcal C[3]\). The top component has defect
\((b\otimes b)\epsilon^{\mathrm{tot}}\), so it is exactly the
resolution comparison of \(\beta_\lambda\) with its syzygy target.
This identifies the asserted top projection.

Stable nonzero evaluation. Tensoring \(\xi_\lambda\) with \(s\)
kills every term except the one whose terminal coefficient is \(f\).
That term has \(w=f^*\) and value \(\lambda f^*\). Taking the square
gives (8.5.3). The augmentation sequence is right split, so evaluation
preserves its kernel; its degree-zero evaluated projective is
\(E(f\otimes f)\), with kernel \(\operatorname{rad}(E)(f\otimes f)\).

A map \(S\to\Omega_ES\) factoring through a projective factors through
a finite free module. Each component \(S\to E\) takes values in the
left socle, since the radical annihilates \(S\). If \(u\) is in that
socle and \(j\) is radical, then for all \(a\in E\),
\[
 \operatorname{tr}(auj)=\operatorname{tr}(jau)=0,
\]
because \(ja\) is radical. Nondegeneracy gives \(uj=0\).
A left-module map \(E\to\Omega_ES\) is right multiplication by its
value at \(1\), which is radical, so it kills the socle. Every
projective factorisation in question is therefore zero. Since
\(\lambda^2(f^*\otimes f^*)\ne0\), (8.5.3) is nonzero stably.
This also makes the lift's evaluation nonzero. By the top projection
isomorphism of 8.4, it generates
\(\widehat{\operatorname{Ext}}_E^3(S,\mathcal C\otimes_ES)\).

Status: **AI-proved**, using the finite representative and its profile
from 8.4. The all-degree homotopies are written above; the finite
certificate is used only for the multilinear coefficient identities.

## Comparison with the preprint and issue record

Read source locators: 03-algebra.tex, equations alg:bar,
coc:comparison, coc:boundary and Lemma coc:data; 09-cochain.tex, the
complete table and recurrences coc:transpose-recurrence,
coc:closure-recurrence, coc:boundary-constant and coc:boundary-linear;
06-lift.tex, Proposition lift:main and Lemmas lift:B, lift:G and
lift:evaluation; 07-branches.tex, Lemma branch:twist. The comparison is
to these supplied local source files, not to a bibliographic claim about
an externally obtained version.

No mathematical error was found in these source statements or proofs.

- The preprint uses homological indices \(P_n\); the report uses
  \(P^{-n}\). In particular \(B\) has cohomological degree \(-1\),
  \(G\) has degree \(1\), and the comparison \(p\) has degree \(3\).
  The top cell of \(K[3]\) is \(P^{\mathrm{tot}}[-1]\), not
  \(P^{\mathrm{tot}}[1]\).
- The right twist \(T_{h_\lambda}\) induces restriction by
  \(h_\lambda^{-1}\), giving the inverse eigenvalue
  \(\lambda^{-m}\). A direct twist would reverse this exponent;
  the source has the correct convention.
- Cocycle closure alone does not imply the existence of the cone lift:
  the extra boundary identity (8.5.1) is used in (8.5.11).
  The source explicitly identifies this dependency.
- The source's recursive construction of \(G_n\), at
  06-lift.tex lines 191–224, is valid. The explicit suffix formula
  (8.5.10) is an additional reconstruction that avoids choices and proves
  its homotopy identity at every index.
- The 179 entries are not a sample: the new certificate checks the full
  multilinear cocycle and boundary identities over a polynomial ring.
  The old script was read only after the independent script was complete,
  then rerun successfully with the system Python/Sage installation;
  its complete output is saved as 'old_cochain_rerun.out'.
  The first Sage launch failed because its default state directory was
  outside writable roots; using a task-local DOT_SAGE and invoking the
  system Python resolved this. No package installation was performed.
- Reading-order limitation: extraction of statements from 06-lift.tex
  also exposed explanations outside proof environments, and the twist
  proof of 07-branches.tex was read before its independent reconstruction.
  The initial homotopy attempt was saved before reading the proofs of
  Lemmas lift:B and lift:G. The finite certificate was written from
  definitions before reading the prior computation. This record does
  not claim full pre-reading independence for the twist argument.

Statuses at completion: cocycle/boundary **AI-proved**; twist action
**AI-proved** relative to 8.3–8.4; lift and nonzero evaluation
**AI-proved** relative to the finite cone construction in 8.4.
These are AI assessments, not human certification.
