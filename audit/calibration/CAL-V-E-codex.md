Model: GPT-6 (Codex); effort: unknown.

# V-E (W2): adversarial verification

Review completed, 2026-10-09. This is an AI review, not human or formal certification.
Statements are judged as written; a proposed repair is not an edit to the dossier.
Mathematical findings below have status **AI-proved** when a full argument is given;
finite checks have status **supported**, confined to the specified identities.

## Scope and inputs

The claim/proof input is `scratch/V-E-frozen.md`, SHA-256
`71a1da53b1386e11eb9cf214d5050de4f1a7e4c22bbec83215541f1e8aa421b2`.
Binding conventions: `audit/report-notation.md`, SHA-256
`f69ee451cfbff429f46196434626154173f6ed52cc4657c8c8976e20fd6db8d5`.
The conversion principle 8.1 is assumed. No prohibited notes, ledgers,
earlier audits, logs, escalations, or previous computation scripts were read.
The task, README, AGENTS and available personal instructions were read;
`PROGRESS.md` and `docs/WORKING_RULES.md` are absent in this isolated checkout.
Three read-only subordinate reviews cover 8.2–8.3, 8.4, and 8.6 respectively;
their suggestions are checked before inclusion. The primary reviewer covers
8.5, independently reruns the finite definitions and assesses the combined findings.

The task's permission for new scripts under `computations/CAL-V-E/` is read
together with its restriction on other modifications: only this report and
new certificate scripts/results in that directory are output paths.

## Findings recorded during review

### E1 — 8.4.2: missing shift in the quoted Tate duality

**Error found; status AI-proved.** Frozen lines 438–447 display
`Ext^n(V,U) ≅ D Ext^{-n}(U,V)` and say it yields (2). The binding convention
is instead `Ext^n(V,U) ≅ D Ext^{-n-1}(U,V)`. The displayed unshifted formula
contradicts the asserted support: for example `H^0=k` whereas `H^{-1}=k`
and `H^1=0`, so the proposed duality fails at n=1. The actual action argument
at line 455 uses the correctly shifted stable-Hom duality.
**Repair:** change the left exponent at line 441 from `n` to `n-1`.
This is exactly the source's indexing and preserves the substitution `n=-a`
at line 447. Alternatively, changing the right exponent to `-n-1` requires
also changing that substitution to `n=-a-1`.
The primary reviewer and the cone reviewer read the original
[Linckelmann, arXiv:1211.5999v1](https://arxiv.org/pdf/1211.5999v1),
§2, (2.1), p.3: its left exponent is `n-1`. The other cited locators,
(2.3), (2.6), (2.7)–(2.8) and (2.10), agree with the stated uses.

### E2 — 8.6: the finite target of the lifts has the wrong shift

**Error found; status AI-proved.** At lines 998–999, `C=C1[1]`. Thus the
choice `Y=Σ_R^3 C1` at lines 1041–1047 represents `C[2]`, not `C[3]`.
The latter is the required target of `f_i`.
**Repair:** use `Y=Σ_R^4 C1`. This agrees with the actual tail shift in 8.5
and the local preprint, `07-branches.tex:34–49`.
This is consequential: with the written target, `Hom_st(S,YS)=W^2=0`.
Every evaluated map to it is zero. A fibre with that target would instead
have `V^0=k^2`, by `W^1=W^2=0`, so no map `k^2→V^0` can be both
surjective and have a one-dimensional kernel. The correctly shifted
construction, not the written one, supplies the comparison hypotheses.

### E3 — 8.6: source dimension does not imply surjectivity

**Error found in a proof step; status AI-proved.** Lines 1095–1097 infer
surjectivity of `(H^0)^2 → W^3` from its larger source dimension. A zero
map from k² to k refutes that inference. The preceding formula supplies
the valid reason: `(c,d) ↦ (c+d)w`, with `w≠0`, is surjective because
`(1,0)` maps to the basis vector w. **Repair:** replace the dimension
inference with this explicit evaluation. The claimed endpoint conclusion
does follow after this local repair.

## Exact finite checks completed

`computations/CAL-V-E/finite_check.py` is a new implementation using sparse
sets of monomials in `F₂[q,H,H⁻¹]`, written from the multiplication definition.
It reads only the literal 179-entry table from the allowed preprint,
`.cache/ar-src/09-cochain.tex`; no old script or output was used.
Its saved output is `computations/CAL-V-E/finite_check.out`.

All of the following passed (status **supported** for these exact checks):

| Identity | Cases |
|---|---|
| Associativity | 1,000 C triples and 8,000 T triples |
| Grading, corners, symmetric trace | all 400 T products / trace entries |
| Fourth radical product | `utut=(q+q²)z` |
| Resolution multiplication formulas F.3/F.6 | indices 0–11; consecutive products |
| Cochain table | 179 distinct inputs, every corner and weight |
| Hochschild differential | 104,976 radical four-words, including all 15,250 composable ones |
| Boundary identity (8.5.1) | all 324 radical pairs, with symbolic H and H⁻¹ |
| Casimir | all 20 twisted commutation identities, augmentation zero, both endpoint sums |
| Nonzero evaluation | the two-term bar cycle evaluates to `q³`; Casimir evaluates to `H f*` |
| Bar homotopies B and G | lengths 0,1,2,3, with respectively 2,18,170,1610 relative generators |

There was one implementation correction before completion: an expected
zero vector initially retained a zero coefficient at i=0. Removing that
zero entry made the representation canonical. No mathematical input was
changed. The all-degree proofs are checked separately below; no extrapolation
from these bounded bar/resolution checks is used.

The second new script, `computations/CAL-V-E/resolution_profile_check.py`,
builds projective covers successively from module kernels and radical images,
without using the asserted resolution. Its saved output is
`computations/CAL-V-E/resolution_profile_check.out`. Over
`F₂[q]/(q⁴+q+1)`, q has order 15. It constructs degrees 0–10, checks
exactness and minimality, and obtains the following Ext dimensions in
degrees 0–9 (status **supported**, only for this specialisation and range):

| Groups | Dimensions |
|---|---|
| `Ext_C^i(s,s)` | 1,0,0,0,0,0,0,0,0,0 |
| `Ext_C^i(s,C)` | 0,0,1,0,0,0,0,0,0,0 |
| `Ext_T^i(s,s)` | 1,0,0,1,0,0,1,0,0,1 |

The T-projective multiplicities `(Te,Tf)` are
`(0,1),(1,0),(1,0),(1,1),(2,0),(2,0),(2,1),(3,0),(3,0),(3,1),(4,0)`.
The script also constructs the monomial/contraction matrices of the formal
Tate Koszul rows over F₂. For total cone degrees −31 through 31, middle
exactness and consecutive zero products hold; the only outer defects are
`(degree,cokernel,kernel)=(0,1,0),(3,0,1)`.
This checks the formal Tate calculation, conditional on the written action
formulas. It does **not** reconstruct the old module-level cone matrices.
The script reexecutes the complete first certificate successfully before
these additional checks. Neither finite-field test tests infinite order of q
or proves the polynomial Yoneda product assertion.

## Statement and lemma coverage

Line numbers in this table refer to the frozen dossier. “After E1/E2/E3”
is a conditional assessment of the proposed repaired argument; the verdict
on the text as supplied remains an error wherever indicated.

| Statement / lemma | Lines | Verdict and checked step |
|---|---:|---|
| 8.2: C, unit, associativity, radical, radical powers, simples | 69–139 | No error found. Complete basis checks; positive grading and semisimple quotient identify the radical. The 11 remaining hand-check triples have the stated values. |
| 8.2: all-degree resolution and minimality | 141–172 | No error found. Right multiplication is left-linear; F.3 gives each kernel and image. The coefficients `1+q^(i+2)` never vanish under the stated hypothesis. Radical kernels are superfluous by nilpotence. |
| 8.2: self-Ext and right-module RHom | 174–202 | No error found. Evaluation identifies Hom(Ce,C) with eC on the right; precomposition becomes left multiplication. F.6 has the exceptional index 0 and the sole degree-2 class v, with right f-simple action. Degree +2 is `s^r[-2]`. |
| 8.3: T, trace, injectivity, radical | 221–281 | No error found. Dual actions satisfy bimodule identities; trace has nonsingular exchange Gram matrix. `DA` is injective by exactness of vector-space duality. Opposite algebras and degree `5-deg(a)` are compatible. |
| 8.3: finite-projective duality, triangle and derived adjunction | 283–336 | No error found. F.9 is balanced and left-linear. Duality reverses complex degrees, giving `L⊗R≃s[2]`. Tensor exactness uses each left-projective term of R, not right flatness of T. The bounded-above projective argument computes the derived Hom groups in F.11. |
| 8.3: all-degree algebra and Yoneda product | 338–358 | No error found. The exact segment is `B^(a-1)→V^(a-3)→V^a→B^a`. The a=1 endpoint is handled; for a≥2 the connecting map is `β[3]∘η`. It yields nonzero powers in every multiple of 3 and zero in all other positive degrees. |
| 8.3: chosen τ, stable endomorphisms | 360–381 | No error found with the independently checked 8.5 cochain. Its value on the cycle is q³; a nonzero scalar identity cannot factor through a projective unless s is projective. |
| 8.4.1: tensor ring, symmetry and degree zero | 404–425 | No error found. Total degrees have finite sums; vector-space splittings justify Künneth. Comparison maps in different slots commute in characteristic two and yield every monomial, including multiplicative independence. |
| 8.4.2: cited Tate formula | 438–447 | **Error found, E1.** The quoted exponent differs from both the original and the binding convention. |
| 8.4.2: Tate support and all left/right products | 430–466 | No further error found after E1. Naturality identifies negative multiplication with the transpose of positive multiplication; the seam has target H²=0. Products of two negative classes vanish by their degree; the source pairing symmetry gives the right actions. |
| 8.4.3: finite cone representatives | 471–528 | No error found. Cone cells are Q, Q[-2]², Q[-4], so negative cohomology vanishes. The cokernel injectivity argument uses `H^(-N-1)=0` in the quotient. Filtration factors are actual bar cokernels, stably minimal syzygies. Separate left/right splittings persist through cosyzygies. Tail independence, homotopy factorizations and evaluated triangles have the required shifts. |
| 8.4.4: both cones, profile, actual top projection | 533–585 | No further error found after E1. First cone gives `U^(3m)=kx_m` and `U^(1-3m)=ky_m`, with no overlap. The second action raises x and contracts y, with y₀ killed. The two exact sequences give W only in degrees 0,3; the composite of their projection isomorphisms is the actual π[3]. |
| 8.5.1: relative bar resolution and contraction | 607–627 | No error found. I is split semisimple and all terms decompose into projective corner bimodules. The radical projection is I-bilinear. The stated right-linear insertion contracts the augmented complex and survives evaluation. |
| 8.5.1: p, weight, closure, boundary and cycle | 629–707 | No error found for the table in the cited preprint. All coefficients and all input tuples were checked independently, with H indeterminate. The two-term cycle has zero boundary and value q³, so the evaluation is not a coboundary. See the data-access qualification below. |
| 8.5.1: all-degree comparison p | 709–720 | No error found. Strict-prefix terms cancel; the only remaining terms for n≥4 are the full Hochschild boundary. At n=3 the target differential and the lower component vanish. |
| 8.5.2: twists and every homogeneous eigenvalue | 727–759 | No error found. `a⊗m↦h⁻¹(a)m` has the correct balancing and left action. The comparison into the twisted bar resolution applies h⁻¹ to the first coefficient and all bars. One dual input gives λ⁻¹; product preservation gives λ⁻ᵐ on every degree-3m monomial. This assertion is for m≥0, as stated. |
| 8.5.3: projective cover, Casimir, β | 763–833 | No error found. The projective bimodule cover has four-dimensional top; after evaluation it is the cover `E(f⊗f)→S`. Casimir commutation yields a map from the right twist, and both even corner dimensions give zero augmentation. β takes values in the kernel. |
| 8.5.3: first homotopy B | 835–871 | No error found. Extension by h⁻¹ on the terminal coefficient is essential. The projected Casimir formula cancels the two terms at the last old bar with the endpoint sum. At n=0 the omitted idempotent is restored. This proves the identity at arbitrary n, independently of the bounded test. |
| 8.5.3: explicit second homotopy G | 873–894 | No error found. For n≥2, prefix cancellation leaves exactly `a z(b)+z(ab)+z(a)h⁻¹(b)` as terminal coefficient, equal to pB by the checked boundary identity. Both sides vanish for n=0,1. |
| 8.5.3: tail lift and projection | 896–918 | No error found. B has cohomological degree −1 and G degree +1. The singleton defect cancels pB; every deletion in the other slot vanishes because pD_b=0. The only defect is at source degree 0. Taking n≥4 gives the stable map; n=4 has target C₁[4]=C[3], precisely the shift missed later in E2. |
| 8.5.3: stable nonzero evaluation | 920–941 | No error found. Only the terminal f term remains, giving λ²(F⊗F). For symmetric E the left socle annihilates the radical on the right; hence every projective factorization S→ΩS is zero. The value is nonzero and the top projection identifies its class. |
| 8.6: finite target and representatives | 1022–1055 | **Error found, E2.** The coinduced embedding itself is valid; its iteration count is wrong. Four iterations supply the specified target and actual representatives. |
| 8.6: fibre, both-side projectivity, evaluation, naturality | 1057–1083 | No further error found after E2. The free bimodule surjection makes an actual finite kernel. The sequence splits on both E-sides; evaluation sends its free bimodule term to a projective. |
| 8.6: V⁰ and all positive Vᵃ | 1085–1104 | **Error found in the a=1 reasoning, E3**, in addition to the dependence on E2. Using the explicit surjection repairs the endpoint; for a≥2 both neighbouring W-groups vanish. |
| 8.6: comparison, kernel and determinant | 1106–1135 | No further error found after E2/E3. Naturality gives both rows with inverse twist eigenvalues. At a=0 the kernel is k(1,1). At a=3m>0 the determinant clears to `H₁^m+H₂^m`, a nonzero polynomial for every positive m, including even m. Other positive degrees are zero on both sides. |
| 8.6: conversion application | 1137–1158 | No further error found after the repairs, with 8.1 assumed. The symmetric algebra, both-side projective finite F, stable v and all comparison hypotheses then match the source conversion statement. The forbidden conversion dossier was not opened. |
| Consequences: eight simples, fourth radical power, noncommutativity | 1171–1221 | No further error found conditional on constructing Λ. The split quotients identify all three radicals. If J_E^N=0, the triangular radical has power 2N zero. Surjections carry radicals onto radicals, so the nonzero fourth product in C suffices. |
| Consequences: every field extension | 1223–1261 | No further error found conditional on constructing Λ,Z. Finite-projective Hom base change works termwise; flatness preserves kernels/images and the dual of the complete resolution. Faithfulness keeps the nonsplit extension nonzero. The split semisimple quotient, fourth product and commutator survive. A field extension is not a specialisation of transcendental parameters. |

## Wording that does not match the supplied argument or evidence

1. **8.4.2, lines 438–445:** the claimed quotation is not the source formula;
   the later action proof itself uses the missing shift. This is E1.
2. **8.6, lines 1041–1047:** the claimed identification of the actual target
   with C[3] does not match its definition. The construction supplies C[2]
   as written. This is E2 and affects the statement that “the following
   construction” gives the required comparisons at lines 1011–1019.
3. **8.5.1, lines 629–635:** the description as a “self-contained finite
   definition” points to a script outside the permitted input set; the literal
   table is not in the frozen text. The allowed preprint supplies it. The
   current certificate checks that source table, not the claimed bytewise
   identity with an unread old script. Replace that path by the precise
   preprint-table citation, or include the table in the frozen dossier.
4. **Final assessment, lines 1311–1341:** earlier review claims and the
   blanket “no mathematical gap remains” are not evidence for the supplied
   text. They do not accommodate E1–E3. No claimed earlier run or verdict
   has been adopted as a premise in this review.

E3 is an invalid proof inference, not a mismatch in its stated conclusion:
the correct surjectivity argument is already available immediately before it.
No other mathematical statement/proof mismatch was found in the stated scope.

## Sources and locator register

All local locators below were read in the supplied `.cache/ar-src/` snapshot,
identified by `main.tex` as *An explicit counterexample to the Auslander–Reiten
conjecture*, OpenAI, dated September 23, 2026. This records the local input's
identity; it does not claim bytewise identity with an external release.

| Source | Locators actually read and used |
|---|---|
| `01-stable.tex` | lines 1–67: module sides, shifts, stable triangles, complete resolutions and evaluation |
| `03-algebra.tex` | lines 12–62 (`alg:C`); 80–129 (`alg:T`, dual actions, simples); 133–229 (`alg:bar`, `coc:data`, `coc:boundary`, cycle and comparison) |
| `04-resolution.tex` | lines 22–104 (`res:base`) and 114–200 (`res:polynomial`), including complete proofs |
| `05-cones.tex` | lines 1–323, especially 28–79 (duality/action), 93–140 (tail lemmas), 142–190 (`cone:finite`), 216–316 (`cone:profile`) |
| `06-lift.tex` | lines 10–284: `lift:main`, Casimir, `lift:B`, `lift:G`, tail and `lift:evaluation`; recursive G proof at 191–224 checked against the dossier's explicit alternative |
| `07-branches.tex` | lines 12–233: finite target, fibre, `branch:profile`, `branch:twist`, `branch:comparison`; specifically 34–49 and 125–127 expose E2 and E3 |
| `08-consequences.tex` | lines 7–79: `prop:radical`, `prop:basechange`, complete proofs |
| `09-cochain.tex` | complete 179-entry table and all four cited coefficient recurrences, plus the two cycle values |
| `02-conversion.tex` | lines 28–59, `conv:proposition`: statement/hypotheses only; its proof is assumed as authorised |
| Linckelmann, arXiv:1211.5999v1 | §2, pp.3–6: (2.1), (2.3), (2.6), (2.7)–(2.8), (2.10), with finite left-module and symmetric-algebra conventions |

The dossier supplies direct arguments for the bar comparison and Casimir
identity; the Lowen and Broué references appearing inside the preprint are
not dependencies of those direct arguments and were not separately checked.
The Schulz antecedent is explicitly excluded by the dossier and was not used.
No main-preprint (`build/`) assertion was needed once 8.1 was assumed.

## Limits and final verdict

The universal algebra/cochain certificates were independently rebuilt.
The bounded C/T resolution checks were rebuilt from projective covers.
The old certificate hashes, saved module-cone matrix ranks at lines
1281–1288, and supplementary bracket witnesses were not audited or replayed:
their data are outside the permitted proof inputs and the bracket is unused.
The formal Koszul test above must not be described as validating those
specific saved matrices. This limitation leaves the quoted historical
computation receipts unverified; it is not used to fill a step in the
all-degree written argument.

| Statement | Verdict on the supplied dossier |
|---|---|
| 8.2 | No error found |
| 8.3 | No error found |
| 8.4 | Error found: E1, incorrect Tate-duality quotation/index |
| 8.5 | No mathematical error found with the cited source table; data-path qualification above |
| 8.6 | Error found: E2, wrong cosyzygy count; E3, invalid surjectivity inference |
| Additional consequences | No further error found, conditional on the repaired construction and assumed 8.1 |

The written arguments admit the local repairs specified above. Those repairs
have not been applied to the frozen dossier. There is no human certification,
and no claim of formal verification or exhaustive machine verification of
the stable-category arguments.
