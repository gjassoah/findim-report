Model: unknown; effort: unknown.

# D-E contribution: tensor square and the two-cone profile

## Reading and independent-attempt record

The binding project instructions, README, PROGRESS, working rules, notation sheet and outline were read. The statement extraction from `05-cones.tex` omitted `proof` environments, but the source places its preparatory Tate-duality and finite-tail arguments outside those environments; those preparatory arguments were therefore read before the attempt below. The proofs of `cone:finite` and `cone:profile` have not yet been read at this checkpoint. This limitation is recorded instead of asserting complete independence.

Independent attempt (before reading the two named proofs). Starting with the polynomial positive Ext ring and its symmetric Tate dual, use *successive cones*, not the four-cell filtration: for the first evaluated cone Y of τ₁:S[-3]→S,

\[
0\to\operatorname{coker}(\tau_1:H^{a-3}\to H^a)
 \to U^a\to\ker(\tau_1:H^{a-2}\to H^{a+1})\to0.
\]

Multiplication by τ₁ is injective on positive polynomial degrees and contraction, hence surjective, on negative degrees. Consequently U^{3m}=k (m≥0), U^{1-3m}=k (m≥0), all other U^a=0. Multiplication by τ₂ is an isomorphism U^{3m}→U^{3m+3} and U^{1-3m}→U^{4-3m} for m≥1; it kills U¹. There is no degree in which both summands of the displayed exact sequence are nonzero, so these actions are fixed by naturality, without an extension ambiguity. Taking the second cone gives W⁰=W³=k and W^a=0 otherwise. The degree-three connecting map identifies W³ with U¹, whose first-cone connecting map identifies it with H^{-1}. This is the desired top projection.

No Toda bracket is needed for this profile proof, because the two tensor-factor maps commute already on the ordinary bicomplex. Higher attaching maps cannot change a computation by two exact cone triangles.

Status at this checkpoint: plausible; full checked proof and preprint comparison will be appended.

## 1. Tensor-square Ext algebra (report §8.4)

**Statement.** Work over k=F₂(q,H₁,H₂). Suppose T is the symmetric algebra of §8.3 and s its one-dimensional simple with Ext*_T(s,s)=k[τ], |τ|=3. Put E=T⊗ₖT and S=s⊗ₖs. Then E is symmetric and

\[
\operatorname{Ext}^*_E(S,S)=k[\tau_1,\tau_2],\qquad |\tau_i|=3,
\quad\tau_1=\tau\otimes1,\quad\tau_2=1\otimes\tau.
\tag{1}
\]

**Proof.** Let t:T→k be a symmetrizing form. The form t⊗t on E is symmetric because t(ab)=t(ba), associative because the induced pairing is (x,y)↦(t⊗t)(xy), and nondegenerate because the tensor product of the two nonsingular Gram matrices is nonsingular. Thus E≅DE as bimodules. The same argument applies to Eᵉ=E⊗Eᵒᵖ.

Choose a projective resolution Q→s in cohomological degrees ≤0 with finite terms. The total complex Q⊗ₖQ has finitely many summands in each degree and finite projective E-terms: tensor products of summands of finite free T-modules are summands of finite free E-modules. It resolves S. For the last assertion, choose vector-space splittings of boundaries and cycles in Q, expressing Q as its cohomology s in degree zero plus contractible two-term complexes. Tensoring a contractible complex with any complex is contractible by the tensor of its contracting homotopy with the identity (the signs vanish here). Therefore Q⊗Q has cohomology S in degree zero and no other cohomology.

Termwise Hom into S gives a canonical isomorphism of complexes

\[
\operatorname{Hom}_E(Q\otimes Q,S)
 =\operatorname{Hom}_T(Q,s)\otimes_k\operatorname{Hom}_T(Q,s).
\]

The same splitting argument gives the Künneth isomorphism on cohomology. Its multiplicative compatibility can be checked on comparison maps: represent τ by a lift Q→Q[3]. On Q⊗Q the two induced degree-three maps act on different tensor factors and commute in characteristic two. Their powers represent the external products τ^i⊗τ^j. In degree 3m these m+1 elements, for i+j=m, form the Künneth basis; all other positive degrees vanish. Hence there are no polynomial relations, and (1) follows.

Since S is one-dimensional, End_E(S)=k. Its degree-three Ext group is nonzero, so S is not projective. If a nonzero endomorphism of S factored through a projective, it would be a nonzero scalar multiple of the identity, making S a direct summand of that projective. This contradicts its nonprojectivity. Hence stable End_E(S)=k as well.

**Status: AI-proved**, conditional only on the stated §8.3 input, with a complete argument for the tensor-square passage and stable degree zero.

## 2. All Tate degrees and multiplication by τ₁,τ₂

Write H^a=Êxt^a_E(S,S). Let P_m=k[τ₁,τ₂]_m, assigning each variable polynomial degree one; set P_m=0 for m<0. Then

\[
H^{3m}=P_m,\qquad H^{-3m-1}=DP_m\quad(m\ge0),
\qquad H^a=0\text{ otherwise}.
\tag{2}
\]

Here the duality is the Tate duality for symmetric algebras, with [1]=Ω⁻¹. The source has been read in its pinned version: Markus Linckelmann, *Tate duality and transfer in Hochschild cohomology*, arXiv:1211.5999v1, 26 November 2012, local file `Lin12a - Tate Duality and Transfer in Hochschild Cohomology.pdf`. The title, author, arXiv version and the convention of finite left modules were checked. Exact locators: §2, (2.1), p.3, gives

\[
\widehat{\operatorname{Ext}}^{n-1}_E(V,U)
 \cong D\widehat{\operatorname{Ext}}^{-n}_E(U,V).
\]

The text immediately following states, verbatim, “which is natural in U and V.” Formula (2.3), p.4, is its degree-zero stable-Hom form. Shift compatibility is (2.6), p.5. Compatibility with Yoneda composition is (2.7)–(2.8), pp.5–6; symmetry of the pairing is (2.10), p.6. These locators, including the displayed identities, were read, rather than inferred from the preprint's bibliography.

Applying (2.1) with U=V=S and n=-a proves (2). The action

\[
\tau_i:H^{-3m-1}=DP_m\longrightarrow
 H^{-3(m-1)-1}=DP_{m-1}\quad(m\ge1)
\tag{3}
\]

is the transpose of multiplication P_{m-1}→P_m by τ_i. To see the direction without an indexing guess, use the natural isomorphism D Hom(S,N)≅Hom(N,S[-1]) with N=S[a]. The transpose of postcomposition by τ_i[a]:S[a]→S[a+3] is precomposition by that same map, namely Hom(S[a+3],S[-1])→Hom(S[a],S[-1]). After shifting source and target, this is right multiplication by τ_i from H^{-a-4} to H^{-a-1}. For a=-3m-1 these degrees are 3m-3 and 3m, so they are the positive polynomial multiplication map. The shift identifications are compatible with the source's (2.6).

For an explicit basis, let ε_{ij}∈H^{-3(i+j)-1} be dual to τ₁^iτ₂^j. Then

\[
\tau_1\varepsilon_{ij}=\begin{cases}\varepsilon_{i-1,j}&i>0,\\0&i=0,\end{cases}
\qquad
\tau_2\varepsilon_{ij}=\begin{cases}\varepsilon_{i,j-1}&j>0,\\0&j=0.\end{cases}
\tag{4}
\]

The remaining product from H^{-1} lands in H²=0. Iterating (4) determines every action of a nonnegative-degree monomial on a negative group. Products of two negative classes vanish by (2), since their sum has degree -3r-2, which is outside the support. Right actions agree with (4), by symmetry of the duality pairing (2.10) and its composition compatibility (2.8). Thus this also specifies the full multiplication on the negative part; no finite truncation has been used.

**Status: AI-proved**, using the explicitly read Tate-duality result and its naturality.

## 3. Finite side-projective bimodule representing the two cones

**Statement and definitions.** Let P→T be the bimodule bar resolution, now written cohomologically in degrees ≤0. Assume a chain map p:P→P[3] represents a Hochschild class whose evaluation at s is τ. This is the cocycle input of report §8.5; it is not inferred merely from the positive Ext algebra. Put

\[
L=\operatorname{Cone}(p[-3]:P[-3]\to P),\qquad
K=L\otimes_k L.
\tag{5}
\]

Set R=Eᵉ. For N≥1 put C_N=coker(K^{-N-1}→K^{-N}) and let 𝒞 be a finite R-module representing C_N[N] in stmod R. Then every term of K is a finite projective R-module, K is exact in degrees <0, and C_N and 𝒞 are projective separately as left and right E-modules. Evaluation on S gives exact stable triangles

\[
S[-3]\xrightarrow{\tau_1}S\longrightarrow Y\xrightarrow{\pi_1}S[-2],
\tag{6}
\]
\[
Y[-3]\xrightarrow{\tau_2}Y\longrightarrow \mathcal C\otimes_E S
 \xrightarrow{\pi_2}Y[-2].
\tag{7}
\]

The label τ₂ in (7) denotes the map induced by the comparison map on the second tensor factor. The top-cell projection is

\[
\pi=\pi_1[-2]\pi_2:\mathcal C\otimes_E S\longrightarrow S[-4].
\tag{8}
\]

**Proof.** Since the bar resolution is finite in every degree and bounded above, each degree of K contains finitely many external tensor summands. Every summand is projective over R, by the direct-summand argument used for (1). Put Q=P⊗P, a projective E-bimodule resolution of E. The four cone cells give a filtration of K with associated complexes Q, Q[-2]⊕Q[-2], Q[-4]. Their cohomology is supported in degrees 0,2,4 respectively. The long exact cohomology sequences of this finite filtration show that K and every filtration subcomplex have no cohomology in negative degrees.

Passing a degreewise split exact sequence of these complexes to cokernels in degree -N is exact. Here is the injectivity check. Suppose b∈B^{-N} becomes a boundary in V^{-N}, where 0→B→V→D→0 is such a sequence. Choose v∈V^{-N-1} with dv=b. Its image d̄ in D^{-N-1} is a cycle. Since H^{-N-1}(D)=0, it is the differential of an element of D^{-N-2}. Lift that element to V and subtract its differential from v. The result lies in B^{-N-1} and still has differential b. Thus b was already a boundary in B. Surjectivity and exactness in the middle follow by lifting representatives.

Consequently C_N has a filtration with factors Ω^{N}E, two copies of Ω^{N+2}E, and Ω^{N+4}E, where these are syzygies over R, formed from Q. Each factor is projective on both E-sides: the augmented resolution of E splits on each side because E is projective there, and induction along the resolution gives the same property for every syzygy. The short exact sequences of the filtration split on each side because their quotients are projective on that side. Hence C_N is side-projective.

An E-bimodule syzygy of a side-projective module is side-projective: take an R-projective surjection and split its kernel sequence on each side. An E-bimodule cosyzygy is likewise side-projective: R is symmetric, so a finite R-module embeds into a finite R-projective-injective module; side-projective modules are side-injective since E is symmetric, and the embedding splits on each E-side. Its cokernel is therefore projective on each side. Applying N cosyzygies produces the finite side-projective representative 𝒞.

The tail choice is independent of N. Exactness gives

\[
0\to C_{N+1}\to K^{-N}\to C_N\to0,
\]

so C_{N+1}≅C_N[-1] in stmod R and C_{N+1}[N+1]≅C_N[N]. A chain map on sufficiently negative tails induces maps of these cokernels. A homotopy changes the induced map by a map through a projective term; therefore the resulting stable maps are well-defined. Applying the preceding cokernel exactness to the degreewise split cone sequences shows that they give the corresponding triangles in stmod R, with connecting maps induced by the differential between cone cells.

The first-factor cone tensored externally with P is the first object used for (6). Acting on its second factor by p gives a chain map to its shift by three; its cone is exactly K, with the tensor differential. This is a chain-level assertion: each differential consists of the internal differential and one copy of p between its two cells, so grouping terms first by the second cone factor yields that cone, with no additional component. The two factor maps commute since they act in different tensor slots and characteristic two removes the tensor signs.

For any side-projective E-bimodule M, tensoring M⊗_E− is exact and sends projectives to projectives: a projective left module is a summand of E^r, and its image is a summand of M^r. Every R-projective also evaluates at S to an E-projective, since a free R-module evaluates to E⊗ₖS. All the short exact sequences above split on the right, so evaluation at S preserves them. Hence it preserves their stable triangles and shifts. This yields (6), (7), and the projection (8).

**Conventions compared with the source.** The source uses homological complexes and says K is exact in positive degrees, with cells in degrees 0,-2,-4. The cohomological translation here is exactness in negative degrees and cells in degrees 0,2,4. In both conventions the stable cells are S,S[-2]²,S[-4], and the tail is the N-fold cosyzygy of the indicated cokernel. No change to the stable shift has been made.

**Status: AI-proved**, conditional on the explicit Hochschild representative supplied in §8.5. Finite module representatives and evaluation were justified without replacing external tensor products by a tensor product of stable objects.

## 4. All-degree profile and the actual top projection

**Statement.** For the bimodule in (5), put W^a=Êxt^a_E(S,𝒞⊗_E S). Then, for every a∈Z,

\[
W^a=\begin{cases}k&a=0\text{ or }3,\\0&\text{otherwise.}\end{cases}
\tag{9}
\]

The bottom-cell inclusion S→𝒞⊗S induces H⁰≅W⁰. The actual projection (8) induces an isomorphism

\[
\pi[3]_*:W^3\xrightarrow{\sim}H^{-1}=k\varepsilon_{00}.
\tag{10}
\]

**Proof.** Put U^a=Êxt^a_E(S,Y). Apply stable Hom from S to (6). Exactness gives

\[
0\to\operatorname{coker}(\tau_1:H^{a-3}\to H^a)
\longrightarrow U^a\xrightarrow{\pi_1[a]_*}
\ker(\tau_1:H^{a-2}\to H^{a+1})\to0.
\tag{11}
\]

On the positive part of H, multiplication by τ₁ is injective and its cokernel is k[τ₂]; in degree zero this includes the cokernel of the zero map H^{-3}→H⁰. On the negative part it is the transpose of the injective map P_{m-1}→P_m, and hence surjective. Its kernel in DP_m is the line kε_{0m}. At m=0, its target is H²=0 and the same kernel description applies. No other degrees have a source or target. It follows that

\[
U^{3m}=kx_m\ (m\ge0),\qquad
U^{1-3m}=ky_m\ (m\ge0),\qquad U^a=0\text{ otherwise},
\tag{12}
\]

where x_m is the image of τ₂^m under H^{3m}→U^{3m}, and π₁[1−3m]_*(y_m)=ε_{0m}. The two lists in (12) do not overlap, because their degrees are incongruent modulo three. This also means that every nonzero U^a in (11) is identified canonically either with the cokernel on its left or with the kernel on its right; there is no choice of an extension splitting.

The second-factor comparison map acts on the entire triangle (6), by its commuting chain map described above. Therefore the maps in (11) commute with its action. Using (4),

\[
\tau_2x_m=x_{m+1}\quad(m\ge0),\qquad
\tau_2y_m=y_{m-1}\quad(m\ge1),\qquad \tau_2y_0=0.
\tag{13}
\]

The last equality also follows from U⁴=0. Thus multiplication by τ₂ on U has one-dimensional cokernel only at degree zero, and one-dimensional kernel only on U¹.

Apply stable Hom from S to (7). The result is

\[
0\to\operatorname{coker}(\tau_2:U^{a-3}\to U^a)
\to W^a\xrightarrow{\pi_2[a]_*}
\ker(\tau_2:U^{a-2}\to U^{a+1})\to0.
\tag{14}
\]

By (13), the first end of (14) is k only if a=0, while the second end is k only if a−2=1, namely a=3. Both ends vanish in every remaining degree. This gives (9), without a finite-range argument. In degree zero the isomorphism is induced by the bottom-cell inclusion. In degree three, (14) identifies W³ with U¹ via the second-cone projection, and (11) identifies U¹ with H^{-1} via the first-cone projection. Their composite is exactly π[3] from (8). Therefore (10) holds for the actual projection, not just for an abstract one-dimensional vector-space identification.

**Status: AI-proved**, with all integer degrees covered.

## 5. Comparison with the preprint and issues

After recording the independent attempt, the complete proofs of `.cache/ar-src/05-cones.tex`, Lemma `cone:finite` and Proposition `cone:profile`, were read. The source uses the filtration by the number of shifted factors and an exact Koszul row; this note uses two successive cone triangles. Both track the top projection. The source separately excludes the possible further top attaching map by examining its actual long exact sequence; the successive-cone proof incorporates that map from the outset. No error was found in those two source proofs.

Precise convention issue for the report: source homological support 0,-2,-4 translates into cohomological support 0,2,4, while the stable cells retain their shifts S,S[-2]²,S[-4]. Copying the source's assertion of exactness in positive complex degrees into cohomological conventions would reverse the assertion. The source itself is consistent.

Dependency to retain explicitly: the complex (5) requires a Hochschild representative evaluating to τ. The abstract polynomial Ext algebra alone does not supply that representative. The full dossier must link this input to its checked cocycle construction in §8.5; this note does not silently infer it from (1).

No bracket computation is required for §§1–4. The multiplication needed here is the Tate-duality action (4), not a claim about a Toda bracket. The source's full top-cell map is preserved by (8) and (10).

## 6. Supplementary finite computation receipts

### Saved two-cone matrices

Read: `computations/06-two-factor/README.md`, `reuse.py`, `evaluated.py`, and `validate.py`. The new script `computations/08-D-E/replay_cones.py` reads the old `profile-matrices.sobj` and `evaluated.sobj` without modifying them. Its full completed run is `replay_cones-repeat.out`; `replay_cones.json` is the final receipt. The field is GF(2^16), the original seed is 10102026, and the saved evaluated module has dimension 276.

The script recomputed the ranks of the saved Hom differentials in degrees −5 through 7 and checked every consecutive product in that range is zero. The ranks in increasing degree are

\[
276,148,92,36,0,35,93,147,276,444,612,888,1224.
\]

Using the actual loaded matrix dimensions gives W^a=k at a=0,3 and W^a=0 at every other a in −4≤a≤7. It also recomputed the direct degree-zero stable-Hom checks on the saved module: ordinary Hom(S,M) has dimension 1, ordinary Hom(M,S) has dimension 0, and the projective-factor image has rank 0. Thus the direct computations give W⁰=1 and W^{-1}=0. The (f,f)-corner projection reduces these character-equation systems to 36 unknowns before their ranks are computed; this is algebraically equivalent to imposing both idempotent equations first.

The first run finished the Hom ranks/products but was interrupted on the optional dense seam equations; its partial output is retained as `replay_cones-initial.out`. The revised full run completed the same ranks/products and the smaller seam equations. A final `--resume-initial-ranks` invocation packaged the already completed first rank pass and recomputed the seam, with `replay_cones.out` recording that scope. The completed full-run transcript remains separately available, so the receipt does not substitute a claimed earlier success for an actual full pass.

**Scope:** these replays certify the exact linear algebra on the saved matrices and action data in this one finite-field case. They do not rebuild the algebra, the cocycle, the projective resolution, or the cone that produced those matrices. They do not give a statement in uncomputed degrees or over k=F₂(q,H₁,H₂). The all-degree result (9) is justified by §§1–4 instead.

### Earlier bracket witnesses

Read `computations/04-toda-bracket/witness.py` in full before its replay. The script rebuilds the multiplication from the table and trivial-extension definition, then checks explicit first-three-syzygy bases, right-U and right-X lifts, module-linearity equations, a lift into Cone(τ), and the zero composite extending through the β₀ cone. It also checks the two indeterminacy vanishings by generation and an injective left-u map, without solving the large Hom systems of `toda.py`.

The new wrapper `rerun_bracket_witness.py` executed that old source unchanged, relocating only `__file__` so the original script's Sage state remains under this new directory and disabling bytecode writes. The saved output `bracket-witness-rerun.out` records completed assertions over F₂(q) and for a primitive q in GF(2⁸), GF(2¹²), GF(2¹⁶), of orders 255,4095,65535 respectively.

**Exact content certified:** the displayed finite module-map identities and the given nullhomotopies for ⟨τ,β₀,β₀⟩ and ⟨β₀,β₀,β₀⟩, together with the indicated zero-indeterminacy checks in those cases. The script does not compute all Tate degrees, does not assert a general comparison theorem between those two brackets, and does not certify a nonzero bracket. These are supplementary records only: no step of the two-cone argument in §§1–4 uses either bracket.

All new runtime state and outputs are under `computations/08-D-E/`. The repository size after these runs was below 50 MB; no cleanup was needed.
