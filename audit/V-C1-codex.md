Model: unknown (Codex); effort: unknown.

# V-C1 verification record

Status: complete, 2026-10-08. This is an adversarial AI review, not human certification.
The current runtime does not expose an exact model identifier or effort setting; project descriptions
of earlier jobs are not evidence for this run's identity.

The claims and proofs under review are exclusively those in `scratch/V-C1-frozen.md`, with the binding conventions in
`audit/report-notation.md`. Required procedural instructions were read separately. No prior audit,
notes, ledger, escalation, or Codex output is used as mathematical evidence. Only this report is modified.

Input SHA-256:

- Dossier: `56daa7c5cbe045d5e30beddd15120eff7fa0ff5dd577a8e8cd625149a71ef508`.
- Conventions: `18f7d074a008866cefe229e6c2d8cd0025dc5d71874adf5c5427958919227488`.

Verdicts below concern the frozen text, including its side statements. A proposed repair with a full
argument is labelled AI-proved; an unresolved repair is labelled plausible. A verdict of no error found
does not assert that no error remains. Source checks and wording/proof mismatches are recorded separately.

## Verdict table

| Statement | Verdict on the frozen text | Finding or scope |
|---|---|---|
| 2.2 | gap | Categorical lemma: no error found. General-characteristic graded normalization is delegated to an excluded file. |
| 3.1 | no error found | Upper bound and dimension shifting, including the base case. |
| 3.2 | no error found | Exact dual coresolution, transpose formula, left/right direction, Tor equivalence; attribution checked. |
| 3.3 | error found; also gap | Dimension-only inference in the consequence is invalid; proof of (c) lacks both directions. Parts (a),(b): no error found. |
| 3.4 | no error found | Resolution, degree-zero vanishing, opposite algebra, simple count, and classical locator. |
| 3.5 | error found; also gap | Undeclared right-B convention; full counterexample equivalence needs higher-Ext comparison and a simple-witness argument. |
| 3.6 | gap | No proof supplied; nonzero derived-complex case needs a separate argument. |
| 3.7 | no error found | Open loci, finite-pd bound, transpose estimate; arbitrary-field extension checked directly. |
| 4.3 | gap | No proof supplied; openness of derived extinction and its noetherian argument are missing. |
| 4.4 | no error found | Kernel stabilization and odd-shift cancellation; no certification of the full preprint construction. |
| 5.1 | no error found | T descends to V, exponent r is correct, and all three exclusions are justified. |

The demonstrated errors concern an inference and a module-side declaration; no counterexample to the
correctly sided main propositions was found. Complete proposed arguments for the mathematical proof
gaps are included below. The missing external sign normalization remains unresolved. An additional
issue in the binding syzygy convention is listed separately.

## Detailed checks

### 2.2 — no error found in the categorical inclusion (lines 11–18)

The equalities `qa=f[1]` and `bi=h` are preserved by replacing `a` with `a u[1]`, and the value becomes
`(ba)u[1]`. Existence follows from the two long exact Hom sequences and `gf=hg=0`. Varying the lifts
has the indeterminacy specified in the conventions. The inclusion remains valid if the entire bracket
is given the opposite global sign. The displayed categorical inclusion is therefore AI-proved in the
cone convention explicitly used in the proof. The graded translation is checked separately below;
agreement with the excluded general-characteristic normalization remains unresolved.

### 3.1 — no error found (lines 22–30)

Status: AI-proved. Enough projectives suffices to form Ext in the first variable; enough injectives is
not needed. The first exact sequence gives the upper bound one and nonprojectivity gives equality.
For finite projective dimension `n>=1`, nonvanishing `Ext^n(c_n,V)` for some `V` follows by taking a
nonsplit extension of the nonprojective penultimate syzygy and dimension shifting. Applying Hom to
the next short exact sequence gives the indicated isomorphism for every `j>=1`. Induction gives both
bounds, with no finiteness or module-side assumption missing.

### 3.2 — no error found in the mathematical argument (lines 34–52)

Status: AI-proved; the attribution was checked against the source recorded below. Dualising a
resolution of the right module produces projective left modules. Degree zero exactness is exactly
`Hom(E,A)=0`; positive degree exactness is
the remaining hypothesis. The short exact sequences are
`0 -> C_n -> P_{n+1}* -> C_{n+1} -> 0`, starting at `C_0=P_0*`.
If `C_1` were projective, the displayed splitting argument would give `E=0`. Minimality gives precisely
the presentation required for `Tr Omega^{n-1}E`. Thus the left, rather than right, finitistic dimension
is the one made infinite.

For the side statement, degreewise finite-dimensional duality gives
`Ext^i_{A^op}(E,A) = D Tor_i^A(E,DA)`. A finite projective resolution would dualise to a bounded exact
complex of projectives; splitting from the right and dualising back forces `E=0`. Thus `pd E` is
infinite. In the binding cohomological convention, these Tor groups occur in degrees `-i` of
`E tensor_A^L DA`; the vanishing assertion has the correct grading.

### 3.3 — error found in the consequence; gap in (c) (lines 56–73)

Parts (a) and (b): no error found; status AI-proved. The transpose of a minimal presentation has no
projective summand. Indeed, a projective summand of its cokernel would lift to a summand of the last
dual projective; dualising would give a summand of the original first projective mapped to zero,
contrary to minimality. For a module with no projective summand, the double transpose recovers the
module. In (a), dualising the length-one resolution of `C` also gives
`Ext^1_A(C,A)=coker(P_1 -> P_0)=E` directly. In (b), dualising the cokernel defining `E` gives
`E*=ker(Q_0 -> Q_1)=0`. If `E=0`, the epimorphism onto `Q_0*` splits and dualisation makes `C`
projective. The positive Ext groups are exactly the stated hypothesis, with the correct module side.

Part (c), lines 67–69: the displayed obstruction calculation only identifies the left-approximation
condition with `Ext^1_A(C_m,A)=0`. It does not construct the coresolution or relate this condition to
all the groups `Ext^i_{A^op}(Tr C,A)`. Its sole supporting locator is `[source omitted]`, so it cannot
be checked under this job's input restrictions. This is a gap in the supplied proof, not a
counterexample to the equivalence.

Proposed repair (AI-proved). For a projective-summand-free `C` of projective dimension one, set
`E=Tr C` and choose `0 -> Q_0 -> Q_1 -> C -> 0` minimal. If the transpose Ext groups vanish, (b)
gives vanishing also in degree zero. Dualise a minimal projective resolution of `E`; its first
cokernel is `Tr E=C`, and its tail is the required projective coresolution. The dual of every short
exact sequence in this tail is exact: it is the corresponding segment of the original resolution
of `E`. Hence the inclusions are left `add(A)`-approximations.

Conversely, dualising such an approximation coresolution gives an exact sequence
`... -> Q_3* -> Q_2* -> C* -> 0`. Splice it with
`0 -> C* -> Q_1* -> Q_0* -> E -> 0` to obtain a projective resolution of `E`. Its dual is
`0 -> Q_0 -> Q_1 -> Q_2 -> Q_3 -> ...`, which is exact by the two original sequences.
It computes `Ext^{>=0}(E,A)=0`. If (c) is intended to assume only `pd C=1`, first split off the
projective summand of `C`; add it back using the coresolution `0 -> P -> P -> 0`.

The consequence at lines 72–73 uses an invalid implication: modules of unbounded dimension can all
be sums of one indecomposable torsionless module, as `k^m` over `A=k` shows. This refutes the
dimension-only inference, not the stated consequence under the full hypotheses.

Minimal repair (AI-proved): use the unbounded *finite projective dimensions* `pd C_m=m`. Every
indecomposable summand of `C_m` is torsionless and has finite projective dimension. If only finitely
many such indecomposables occurred, their projective dimensions would have a finite maximum, also
bounding `pd C_m`. The unbounded vector-space dimensions then follow separately from 3.7.

### 3.4 — no error found (lines 77–94)

Status: AI-proved. The functor `Hom_Lambda(G,-)` takes values in right `End_Lambda(G)`-modules,
hence left `Gamma`-modules. Its restriction to `add G` takes values in projectives. Finite right
`add G`-approximations exist by choosing bases of the finite-dimensional Hom spaces; the generator
summand makes them epimorphisms. Left exactness and the approximation property give the displayed
resolution. Surjectivity at `F M` would lift the projection `G -> M`; restriction to the `M`
summand would split `pi`. Thus `S` is nonzero.

Under Yoneda, `Hom_Gamma(FY,Gamma)=Hom_Lambda(Y,G)` as right Gamma-modules. Its first term
`Hom(M,G)` lies in degree zero. To check the acyclic-resolution step without a convergence
assumption, use `0 -> K_0 -> P -> M -> 0` and then
`0 -> K_{j+1} -> G_j -> K_j -> 0`. Since `Ext^{>0}(M,G)=0` and
`Ext^{>0}(G_j,G)=0`, induction gives `Ext^{>0}(K_j,G)=0`. Each dual short exact sequence is
therefore exact; the augmented Hom complex in the dossier has zero cohomology in every degree.
This proves the asserted Ext vanishing, including degree zero.

Applying 3.2 with algebra `Gamma^op` gives infinite *left* finitistic dimension of
`Gamma^op=End_Lambda(G)`, as written. The simple count counts isomorphism classes, not repeated
summands. A nonprojective indecomposable summand `M'` still has both required Ext vanishings, so
adjoining it to Lambda contributes exactly one new class.

The attribution to Auslander–Reiten 1975, Theorem 1.1(b), printed page 71, proof page 72, matches
the implication used. Both pages and the left-module/opposite-ring conventions on pages 69–70
were read. This source proves failure of the generalized Nakayama property by an injective-resolution
argument; it is not the source of the particular displayed cokernel construction without further
explanation.

### 3.5 — error found in the side convention; gap in the consequence (lines 98–112)

`Af` and `M=eAf` are **right B-modules**. The statement never declares this exception to the binding
left-module default. Restricting left multiplication to B makes its identity f act as the projection
onto fAf, so it is not a unital left action on Af when M is nonzero. The proposition
and its proof must say `End_{B^op}(Af)` under the report's convention that `Hom_B` means maps of
left B-modules; alternatively explicitly declare throughout this paragraph that endomorphisms are
of right B-modules. Its Auslander–Reiten consequence is on right B-modules, or on left `B^op`-modules.
There is no extra opposite on the double-centralizer isomorphism: with right-to-left composition,
`L_a L_b=L_{ab}`.

After this side correction, no error was found in the proposition's proof (status AI-proved).
The right A-action on the coinduced module is `(h.a)(x)=h(ax)`. Multiplication by f identifies
`eta_V f` with the identity on `Vf`; thus its kernel and cokernel have only S as a composition
factor. Induction on length gives `Ext^1(T,V)=0` from `Ext^1(S,V)=0` for every such T. The resulting
splitting and the stated adjunction kill the cokernel. For `V=A` the resulting bijection is the
left-multiplication ring homomorphism. The complement removes exactly one isomorphism class of
simples, irrespective of multiplicities. If M were projective, `B+M` would be a progenerator and
its endomorphism algebra would have the same simple count as B, a contradiction.

The consequence at lines 111–112 is not obtained just from the two vanishings in the proposition
and 3.4: it needs the full strong-Nakayama hypothesis, a higher-Ext comparison, and a converse
argument producing a *simple* witness. The following supplies those missing arguments; status
AI-proved after the explicit side correction.

If `Ext^i_{A^op}(S,A)=0` for every `i>=0`, a minimal injective resolution `A -> I^bullet` has no
summand with socle S. Each `I^j` is consequently a sum of modules `D(Ae_t)` with `e_t<=f`.
Restriction gives `I^j f = D(fAe_t)=D(Be_t)`, injective as a right B-module, and the coinduction
unit for `I^j` is an isomorphism by the proposition's argument. Therefore
`Hom_{B^op}(Af,I^bullet f)=Hom_{A^op}(A,I^bullet)` computes
`Ext^{>0}_{B^op}(Af,Af)=0`. Since `Af=B+M` and M is nonprojective, M is a right-B
Auslander–Reiten counterexample.

Conversely, apply 3.4 after choosing M indecomposable. Its nonzero cokernel S (call it U here)
is supported only on the one extra vertex: at every projective summand of Lambda, maps to M lift
through pi. Thus all composition factors of U are copies of one simple T. If d were the least
degree with `Ext^d_Gamma(T,Gamma)!=0`, lower Ext groups would vanish for every module filtered
by T. An exact sequence `0 -> U' -> U -> T -> 0` would then inject
`Ext^d_Gamma(T,Gamma)` into `Ext^d_Gamma(U,Gamma)`, a contradiction (use Hom left exactness
when `d=0`). Hence T is a simple left-Gamma, or right-`Gamma^op`, strong-Nakayama witness.
The original corner is recovered up to the stated left/right translation.

Small example, checked by hand (status supported; exact calculations). Let
`A=k(1 -a-> 2 -b-> 3)/(ba)` and let S be the right simple at 3. Its minimal resolution is
`0 -> e_1 A -> e_2 A -> e_3 A -> S -> 0`, with maps left multiplication by a and b.
The dual maps are right multiplication by b and a. Hence
`Hom(S,A)=Ext^1(S,A)=0`, but `Ext^2(S,A)=Ae_1/(ka)!=0`.
Here `f=e_1+e_2`, `B=k(1 -> 2)`, and `M=e_3Af` is the nonprojective right simple at 2.
It has `Ext^1_{B^op}(M,B)!=0`. This tests precisely why the two vanishings in the proposition
cannot on their own justify the stronger consequence.
It also checks the rejected dimension formula: `dim B=3`, `dim M=1`,
`dim End_{B^op}(M)=1`, and `Hom_{B^op}(M,B)=0`, so the actual endomorphism dimension is 5,
whereas the rejected expression gives 6.

### 3.6 — gap (lines 116–123)

No proof or source is supplied. The nonzero-Z branch needs a statement about an object of
`D^-(mod B^op)`, not just the module criterion 3.2. The notation should explicitly declare
`{}_C M_B`, right modules throughout, and `RHom_{A^op}`, `RHom_{B^op}`, `RHom_{C^op}` under
the binding left-module convention. With these declarations, the following repair is AI-proved.

Write `e=diag(1,0)` and `f=diag(0,1)`. Let
`j_!Y=Y tensor_C^L fA` and let `i_*` inflate right B-modules. There is a triangle
`j_!Y -> E -> i_*Z -> (j_!Y)[1]`, where
`Z=cone(Y tensor_C^L M -> X)`. This follows from the derived unit map: on the C component it
is the identity, and on the B component it is the displayed multiplication map. Since
`eA=i_*B`, adjunction gives
`RHom_{B^op}(Z,B)=RHom_{A^op}(E,eA)=0`.

If Z is nonzero, choose a nonzero minimal bounded-above complex `P^bullet` of finitely generated
projective right B-modules representing it, and let m be its largest nonzero degree. Its dual
is the exact complex
`0 -> (P^m)* -> (P^{m-1})* -> (P^{m-2})* -> ...`
of projective left B-modules. Its first cokernel is nonprojective: otherwise the first monomorphism
would split, contrary to the radical differential in a nonzero minimal complex. Applying 3.1 to
the successive cokernels gives unbounded finite left projective dimensions. This argument works
even when Z has infinitely many nonzero negative cohomology groups.

If `Z=0`, then `E=j_!Y`, and Y is nonzero because E is. The other adjunction gives
`RHom_{C^op}(Y,C)=RHom_{A^op}(j_!Y,fA)=0`, since `(fA)f=C`.
Now 3.2 gives infinite left finitistic dimension of C. The cohomological cone and its shift in
the triangle are consistent with the binding convention.

The product remark has no error found (status AI-proved conditionally on an R with infinite
finitistic dimension). For `A=R x k`, either factor ideal is stratifying: multiplication identifies
`Af tensor_{fAf} fA` with `AfA`, and the higher Tor groups vanish. The R factor's finite-pd
modules embed as `(N,0)` with the same projective dimensions.

### 3.7 — no error found (lines 127–135)

Status: AI-proved by the argument indicated in the dossier. Put `J=rad A` and fix a resolution of
the right module `A/J` with finite free terms. Only three adjacent finite terms are needed to
compute `Tor_{n+1}^A(A/J,N)`. Over a representation scheme the two differentials are regular
matrices. Their ranks are lower semicontinuous, so the dimension of this homology group is upper
semicontinuous and its zero locus is open. For a minimal projective resolution of N, tensoring
with `A/J` makes the differentials zero. Nakayama's lemma therefore gives
`Tor_{n+1}^A(A/J,N)=0` if and only if `pd N<=n`. This includes `n=0`.

The sets so obtained form an increasing chain of open subsets of a noetherian finite-type
representation scheme, hence stabilise. The bound is on *finite* projective dimensions only;
no assertion is made about modules of infinite projective dimension. There are only finitely
many dimension vectors of bounded total dimension. The argument also works for the k-points
over an arbitrary field; algebraic closedness is not needed.

For the transpose estimate, put `a=dim_k A` and `d=dim_k N`. A projective cover of N is a summand
of `A^d`, so its kernel has dimension at most `ad`. A projective cover of that kernel is a
summand of `A^{ad}`. Its A-dual is consequently a summand of `A^{ad}` on the opposite side and
has dimension at most `a^2 d`. Its cokernel `Tr N` satisfies the same bound. This reasoning
does not assume that a projective and its A-dual have equal k-dimension, which would fail in
general. Combining the estimate with `pd Tr Omega^n E=n+1` proves that the dimensions of the
witness syzygies are unbounded.

The two cited sources were read. Happel's Section 2.3, printed page 5, contains the increasing-open
argument and credits Schofield. GLS v2, Corollary 2.6, printed page 8, states upper semicontinuity
of Ext dimensions; fixing the second module to `A/J` gives the alternative Ext proof of the open
loci. Both sources assume an algebraically closed field. They support that special case; the
direct Tor argument above justifies the dossier's arbitrary-field formulation.
Happel's intermediate wording drops the finite-projective-dimension restriction: the stationary
open set is the union of the finite-pd loci, not necessarily the whole representation variety.
The frozen dossier correctly retains this restriction.

### 4.3 — gap (lines 139–140)

The proposition has neither proof nor citation in the frozen dossier. In particular, openness of
derived extinction is not supplied by 3.7, which concerns projective dimension. No counterexample
was found. Proposed repair (AI-proved):

For each `t>=0`, let `U_t={N : Phi^t N=0}` in the fixed representation scheme. Finite global
dimension gives a bounded resolution Q of X by finite-dimensional bimodules which are projective
on the right. Such a resolution can be obtained by truncating the right bar resolution at a
projective syzygy; the syzygy retains its left action. This does not require the enveloping
algebra to have finite global dimension or the field to be perfect.

For fixed t, the complex `Q tensor_Delta ... tensor_Delta Q` is bounded, finite-dimensional
termwise, and right projective termwise. For the last assertion, a tensor of two such terms is
a right-module direct summand of a finite sum of copies of the second term. It computes the
t-th derived tensor power, with the cohomological tensor differential. Tensoring it with the
universal module gives a bounded complex of finite-rank vector bundles on the representation
scheme: each term is a direct summand of a finite sum of the underlying universal bundle.
The locus on which its fibre is exact is open, by the ranks of the finitely many differentials.
Thus U_t is open. Since `U_t` is contained in `U_{t+1}`, noetherianity makes this chain stationary.
Every module with a finite extinction time lies in its union, which equals one U_t. This is
the required uniform bound. The zero dimension vector and the case with no nonzero extinguishing
modules cause no exception.

### 4.4 — no error found (lines 144–147)

Status: AI-proved for the K_0 argument and for the stated consequence of the displayed iterate
formula. The group has rank n, the number of simple Delta-modules. After tensoring with Q, the
increasing kernels of powers of `[Phi]` stabilise by n. Torsion-freeness of `K_0=Z^n` transfers
this conclusion back to the integral group. Consequently eventual extinction of N implies
`[Phi]^r[N]=0` for every `r>=n`, not merely for r beyond its extinction time.

The displayed construction formula has class
`((-1)^b+(-1)^(b+3))[M(HY)]=0`. The cancellation uses that the difference of the shifts is odd;
it does not use characteristic two. The object `k[0]+k[3]` in `D^b(k)` is a small test: its class
is zero and its cohomology is nonzero in degrees 0 and -3.

The formula was located in `build/sections/06-square-zero-and-conclusion.tex`, lines 291–311,
and its immediate inputs were read: the realization theorem and its closing proof in
`04-tensor-realization.tex`, and the ordinary simulation proposition with its proof in
`05-ordinary-simulation.tex`. The shift in the latter is `b_*`, with differential corrected by
the degreewise factor `(-1)^(b_* n)`, consistent with the conventions. The full lifting and
rectification construction is outside this dossier and has not been independently verified
here. The no-error verdict on this remark does not certify that construction.

### 5.1 — no error found (lines 151–161)

Status: AI-proved for the definition, the rank-function argument and the first two consequences;
cited plus AI-proved for the universal-localisation consequence.

The right-projectivity assumption makes H exact and preserves finite-dimensionality: a right
splitting of Psi as a summand of a finite free module gives a k-linear splitting after tensoring.
Likewise `P tensor_R Psi` is finitely generated projective on the right, so T is defined on K_0.
The natural associativity isomorphism gives exactly
`chi_Y(T[P])=chi_{HY}([P])`. It also proves that T descends to the image V: a function zero on
all finite-dimensional modules remains zero after precomposition with H. This descent is needed
before applying Fitting decomposition and is not an extra hypothesis.

Write `v_0=chi_(-)([R])`, and let `ell_Y` denote evaluation on Y. If `H^N Y=0`, then
`ell_Y T^N` vanishes on all V, since `T^t v_0(Y)=dim H^tY`. The descending images of T on an
r-dimensional space stabilise at r. Hence `im T^r=im T^{r+N}` is annihilated by ell_Y, giving
`0=ell_Y(T^r v_0)=dim H^rY`. This verifies the exponent r, including r=0.

The examples excluded in the consequence require the following justifications.

- A commutative noetherian R has finitely many connected components of its spectrum. A finite
  projective has a constant rank on each component. For a finite-dimensional module Y, its
  tensor dimension is the sum, over these components, of that rank times the dimension of
  the corresponding summand of Y. Thus all the rank functions, and therefore V, span a finite
  dimensional vector space. Finite generation of R as a k-algebra is unnecessary.
- For `R=kQ` with Q a finite quiver, cycles are allowed. Represent a right projective by an
  idempotent matrix over R. For a fixed dimension vector, evaluating that matrix on a
  representation gives an idempotent whose rank is locally constant. The representation scheme
  is an affine space and is connected, so this rank equals its value at the representation
  with every arrow zero. Hence every rank function is a linear combination of the finitely
  many vertex-dimension functions. Equivalently, scale all arrows by a parameter u: an
  idempotent over `k[u]` has constant rank and can be evaluated at u=0 and u=1. This argument
  also works over finite fields and avoids an unverified K_0 computation for quivers with cycles.
- If R is a universal localisation of a finite-dimensional hereditary algebra R_0, Schofield
  v1, Lemma 4.1, gives the surjection `K_0(R_0) -> K_0(R)`. The former group is finitely
  generated by the indecomposable projectives, so its rational quotient, and therefore V,
  is finite dimensional. The source's hereditary assumption is on both sides, satisfied here;
  its Section 2 treats general sets of maps, including reduction to injective ones.

For the preprint example, `Psi={}_alpha(eR)` is right projective because eR is an idempotent
summand. Its left action is `r.x=alpha(r)x`, and tensoring identifies its functor with
`Y -> {}_alpha(eY)`, in the stated direction of the twist. The concrete selection proposition
does use an automorphism; the earlier general definition in the preprint permits a unital
endomorphism.

Small sharpness test, checked by hand (status supported). For `R=k^3`, choose Psi so that
`H(Y_0,Y_1,Y_2)=(Y_1,Y_2,0)`. It is right projective. The three orbit rank functions are
`d_0+d_1+d_2`, `d_1+d_2`, and `d_2`, so r=3. The module `(0,0,k)` has extinction time exactly
3. This checks the bound's index and also tests 4.3 in the semisimple case.

## Convention checks and wording/proof mismatches

1. **2.2, graded clause, lines 17–18:** the categorical proof is sign-consistent. A fully explicit
   graded translation can be made as follows. For degrees p, q, r of a, b, c, use the chain
   `O[-p-q-r] -> O[-p-q] -> O[-p] -> O`, with maps
   `c[-p-q-r]`, `b[-p-q]`, `a[-p]`. For d of degree s, precompose by
   `d[-p-q-r-s]`. The output lies in degree `p+q+r+s-1` and is precisely right multiplication
   by d after shifting to a map with source O; no sign is introduced in this convention.
   The binding file, however, delegates the *general-characteristic* normalization to
   `audit/12` Section 2, which this job explicitly forbids reading. Thus the graded clause's
   agreement with that particular normalization is a **gap in the supplied convention data**.
   Repair: supply that convention in the permitted notation file or state the translation above.
   The categorical lemma, degree formula, and characteristic-two reading have no error found.

2. **3.3(c), lines 60–69:** the wording claims an equivalence; the proof provides only a local
   obstruction identity and an inaccessible omitted reference. Both directions of a repair
   are written above. If (c) is meant to include C with projective summands, say so and use the
   split-summand argument given above.

3. **3.3 consequence, lines 72–73:** the written reason is unbounded dimension; the conclusion
   about infinitely many indecomposables needs unbounded finite projective dimension. Replace
   that reason, preserving the conclusion.

4. **3.5, lines 100–112:** the proof is about right B-modules, while the statement does not
   declare the required exception to the left-module default. Also replace the simple-count
   wording with “B has exactly one fewer isomorphism class of simple modules than A,” with no qualification
   about idempotent multiplicities. The final equivalence of counterexamples needs the extra
   higher-Ext and simple-witness arguments recorded above; it is not a consequence of the two
   low-degree vanishings alone.

5. **3.6 and 4.3:** the propositions end with a proof terminator but no proof or citation. The
   omitted arguments are substantive: detection of a nonzero bounded-above complex by the
   finite-finitistic-dimension obstruction in 3.6, and openness of each derived extinction
   locus in 4.3. Complete proposed repairs are given above.

6. **3.7 attribution:** its arbitrary-field statement is wider than the standing algebraically
   closed-field hypotheses in both cited accounts. The dossier's own Tor proof supports that
   wider statement. Do not present either cited result alone as giving it verbatim.

There is also an internal issue in the *binding conventions*, line 20: a kernel of a projective
cover need not have no projective summands for a general finite-dimensional algebra. For example,
the right simple at vertex 2 of `k(1 -> 2)` has syzygy `e_1B`, a nonzero projective. This is a
supported counterexample to that unconditional qualification. It causes no failure of 3.2–3.3
for the witnesses actually used: for a minimal cover `P -> U` with `Ext^1(U,A)=0`, a projective
summand of `Omega U` would have its projection extended to P, splitting off a summand contained
in `rad P`, which is impossible. Dimension shifting gives this Ext vanishing for every witness
syzygy. The convention should distinguish minimal projective-cover syzygies from stable
representatives, where projective summands may be discarded.

## Source register

All claims of prior reading in the frozen dossier were disregarded. The following records describe
this run's own reading; no sources in the excluded directories were opened.

| Source and pinned version | Locator actually read | Result of the locator check |
|---|---|---|
| Crawley–Boevey, *Noncommutative Algebra 2*, Bielefeld winter 2019/20, [author-hosted PDF](https://www.math.uni-bielefeld.de/~wcrawley/1920noncommalg2/NA2.pdf), accessed 2026-10-08 | Section 3.2, Proposition 5 and complete proof, printed page 63 (PDF page 65) | The proposition's title says generalized Nakayama; its proof explicitly treats an arbitrary module and the strong property. It dualises to the opposite side and uses the finite finitistic-dimension bound there. The dossier's attribution and side translation are accurate. |
| Auslander–Reiten, *On a generalized version of the Nakayama conjecture*, published 1975, [library PDF](<AR75a - On a Generalized Version of the Nakayama Conjecture.pdf>) | Printed pages 69–72; Theorem 1.1(a),(b) on page 71 and proof through page 72 | Correct locator. Pages 71–72 were also rendered in memory and read visually because OCR confused `>=1` with `>1`. The theorem includes degree one. The full strong-Nakayama vanishing implies its generalized failure; the source's construction is by injective resolutions. |
| Happel, *Homological conjectures in representation theory of finite-dimensional algebras*, Sherbrooke notes, [library PDF](<Hap90 - Homological Conjectures in the Representation Theory of Finite Dimensional Algebras.pdf>), also [author-hosted copy](https://www.math.uni-bielefeld.de/~sek/dim2/happel2.pdf) | Standing assumptions on page 1; Section 2.3, pages 3–5, especially the proof on page 5; bibliography entry [Sc] | Correct locator for the ascending-open argument. The field is algebraically closed. The cited Schofield paper is *Bounding the global dimension in terms of the dimension*, Bull. LMS 17 (1985), 393–394. Happel is the source actually read for that attribution. |
| Geiß–Labardini-Fragoso–Schröer, *Semicontinuous maps on module varieties*, [arXiv:2302.02085v2](https://arxiv.org/pdf/2302.02085v2), watermark 5 July 2024; library copy | Page 1 assumptions, Section 2.4 and Corollary 2.6 on page 8 | Correct locator for upper semicontinuity of Ext dimensions, from which the projective-dimension open locus follows. It is not itself phrased as an openness theorem for projective dimension. |
| Schofield, *Universal localisations of hereditary rings*, [arXiv:0708.0257v1](https://arxiv.org/pdf/0708.0257v1), library copy with v1 watermark | Pages 1–3 conventions and Section 2 setup, Lemma 2.1 and Theorems 2.2–2.3; Section 4 opening on page 8 and Lemma 4.1 with proof on page 9 | Correct locator and K_0 surjectivity direction. Quotation: “The map from K_0(R) to K_0(R_E) is surjective.” |
| Linckelmann, *Tate duality and transfer in Hochschild cohomology*, [arXiv:1211.5999v1](https://arxiv.org/pdf/1211.5999v1), library copy | Section 2, printed pages 3–5, formulas (2.1)–(2.7), and the preceding side conventions | With `Sigma=[1]`, formula (2.1) gives the binding degree `-1-a`, not `-a`. None of this dossier's homological arguments requires Tate duality; this checks the cited convention only. |
| Main preprint, OpenAI, 23 September 2026, local `build/` LaTeX | Section 2 definition and selection proposition, final iterate calculation; Section 4 realization statement and closing proof; Section 5 simulation statement and complete proof; Section 6 second-iterate formula | Confirms the exact formulas used in 4.4 and 5.1. This was a locator and immediate-argument check, not a full verification of the preprint. |

The original Schofield 1985 article was not read: no matching library entry or file was found,
and the publisher page available in this run exposed only bibliographic information and a paywall.
Its attribution remains secondary through Happel. The `[source omitted]` locators in the dossier
cannot be checked from the permitted inputs. The convention-file pointers to other audits and to
report sections were not followed. No mathematical evidence from memory or earlier AI output was used.

No computation scripts were created or modified. The small examples and dimension calculations
above were checked by hand; PDF text extraction and in-memory rendering created no extra files.
