Model: GPT-6 (Codex); effort: unknown.

# Appendix A: factual computation inventory

Job A-inventory; 2026-10-08. This is source material for the appendix, not
report prose. Status of the mathematical results recorded here: **supported**
in the explicitly stated computational scope. No all-degree conclusion or
human certification is supplied by a finite run. Quotations retain the
original outputs' wording, including `PASS`.

Paths and line numbers were refreshed against report commit `6a9252d`
after concurrent report edits. The ten citation occurrences below exclude
the defining label at `report/sections/A1-computations.tex:2`.
Commands below run from the repository root. `python3` means the system
`/usr/bin/python3`; Sage scripts import `sage.all` using that interpreter.
They do not require `sage -python` (unsupported by this Arch launcher).
The rerun register at the end is part of every entry: it gives actual exit
status, elapsed time, and comparison with saved evidence for each command.
Scripts that write checkpoints were executed in disposable copies, with
bytecode disabled and Sage/cache directories redirected there. Original
scripts, outputs, source inputs, and Sage objects were not overwritten.
Only the two requested deliverables are retained as repository changes.

## Every explicit reference to `app:computations`

| Report locator | Label/context; statement supported | Inventory entries |
|---|---|---|
| `report/sections/01-introduction.tex:116` | `sec:introduction`; roadmap to the computations | Entire inventory; no additional experiment |
| `report/sections/09-ar-counterexample.tex:23` | `sec:ar-route`; finite algebra and cocycle identities | A1–A6 |
| `report/sections/09-ar-counterexample.tex:63` | `lemma:algebra-C`; all 1000 associators | A1 |
| `report/sections/09-ar-counterexample.tex:235` | `subsec:cocycle`; the 179 coefficients defining p | A4, T1 |
| `report/sections/09-ar-counterexample.tex:273` | `lemma:cocycle`, `it:cocycle`, `it:weight`, `it:boundary`, `it:evaluation` | A4 |
| `report/sections/09-ar-counterexample.tex:551` | `prop:lifts`; total and radical-endpoint Casimir products | A5 |
| `report/sections/09-ar-counterexample.tex:769` | `rem:ar-sizes`; dimension of the bar representative C_1 | S1 |
| `report/sections/09-ar-counterexample.tex:771` | `rem:ar-sizes`; the minimised two-factor attempt and size stop | S2–S3 |
| `report/sections/10-obstructions.tex:196` | `subsec:obstruction-computations`; all three enumerated computational items | O1–O6 |
| `report/sections/A4-ai-declaration.tex:54` | AI declaration (section label `app:ai-declaration`); scope of exact finite computations | Entire inventory and rerun register; this reference introduces no additional experiment |

There are no literal references to `app:computations` in sections 4–8 in this
snapshot. Their supporting computations are nevertheless listed in G1–G5.

## Shared finite-field parameters

All GF(2^16) computations below use
`x^16 + x^5 + x^3 + x^2 + 1` as modulus. The displayed generator `a` or `b`
has multiplicative order 65535. In each seeded triple, `(q,H1,H2)` means
`(b^e0,b^e1,b^e2)` with exponents in the following table. Every component
has order 65535; the ratio order is stated separately. Seeds are Python
`random.Random` seeds; scripts select exponents coprime to 65535.

| Experiment/case | Seed | Exponents `(e0,e1,e2)` | Order of H1/H2 |
|---|---:|---|---:|
| Lambda0 / 0 | 6062026 | `(48448,2749,15926)` | 65535 |
| Lambda0 / 1 | 6062027 | `(63731,13111,8078)` | 65535 |
| Lambda0 / 2 | 6062028 | `(49513,57191,64202)` | 21845 |
| Lambda1 / 0 | 8082026 | `(2377,63797,37483)` | 65535 |
| Lambda1 / 1 | 8082027 | `(8654,62198,5212)` | 65535 |
| minimised two-factor | 10102026 | `(45499,55487,38596)` | 65535 |

Finite-field samples support only the stated degree ranges. They do not
satisfy the report's algebraic-independence hypothesis on q,H1,H2.

## Algebra, cochain and lifts

### A1. Associativity, grading and radical of C

- Report: `report/sections/09-ar-counterexample.tex:45–65`,
  `lemma:algebra-C` (appendix citation at line 63).
- Scripts: `computations/02-ar-finite-data/01_algebra.py` (Python + Sage);
  `computations/08-D-E/foundations_certificate.py` (Python standard library,
  independently encoded multiplication, polynomial coefficients as bitsets).
- Rings/parameters: the former uses F_2(q) and GF(2^16), q=a, no seed;
  the latter uses F_2[q] without specialisation.
- Scope: all 10^3=1000 basis triples; unit and orthogonal idempotents;
  corner dimensions `(4,2,2,2)`; radical powers; polynomial certificate
  additionally checks all 100 products for the stated grading and enumerates
  the 11 compatible positive-degree triples of total degree at most four.
- Saved evidence: `computations/02-ar-finite-data/01_algebra.out`:
  `PASS: associativity on all 1000 basis triples`;
  `PASS: N two-sided; dimensions N^1..N^5 = [8, 5, 3, 1, 0] ; C/N = k x k`.
  `computations/08-D-E/foundations_certificate.out`:
  `C fourth radical product: utut=(q+q^2)z, nonzero in F_2[q].`
- Commands: `python3 -B computations/02-ar-finite-data/01_algebra.py`;
  `python3 -B computations/08-D-E/foundations_certificate.py`.
- Rerun: both executed; see R11 and R05.

### A2. Resolution of the f-simple and its C-dual

- Report: `report/sections/09-ar-counterexample.tex:68–127`,
  `eq:C-right-multiplication`, `prop:C-resolution`.
- Scripts: `computations/02-ar-finite-data/02_resolution.py` and
  `computations/02-ar-finite-data/03_ext_C.py`, importing `01_algebra.py`;
  Python + Sage.
- Fields: F_2(q), GF(2^16) with q=a, and additionally F_2(q,r) for the
  uniform kernel/image identity in `02_resolution.py`.
- Scope: augmentation and d_1,...,d_9, exactness/minimality in degrees 0,...,8;
  d_1 is right multiplication by u, d_(i+2) by x+q^i y.
  Symbolic rank-three minor `1+q^2*r`, kernel
  `<x+qr*y,z,j>`, image `<x+r*y,z,j>` (invertibility qualifications belong
  to the symbolic statement). Dual Hom complex in degrees 0,...,8 and all
  ten right basis actions on the degree-two class v.
- Saved evidence: `02_resolution.out`:
  `PASS: simple character, kernel/image formulas, minimality; degrees 0..8`;
  `Rank-3 minor (columns e,y,t; rows x,z,j) = q^2*r + 1`.
  `03_ext_C.out`: `ITEM 3 PASS (supported): [0, 0, 1, 0, 0, 0, 0, 0, 0]`;
  `PASS: class of v generates Ext^2 and has the right f-simple action`.
  Both outputs are in `computations/02-ar-finite-data/`.
- Commands: `python3 -B computations/02-ar-finite-data/02_resolution.py`;
  `python3 -B computations/02-ar-finite-data/03_ext_C.py`.
- Rerun: R12–R13. The finite Ext list is not an all-degree Ext calculation.

### A3. T=C semidirect DC: associativity, symmetric form and finite Ext profile

- Report: `report/sections/09-ar-counterexample.tex:146–166`,
  `lemma:T-symmetric`, `thm:T-ext`.
- Scripts: `computations/02-ar-finite-data/04_trivial_extension.py`
  (Python + Sage, imports `01_algebra.py`) and
  `computations/08-D-E/foundations_certificate.py` (standard library).
- Fields/ring: F_2(q), GF(2^16), q=a; independent structural certificate
  over F_2[q]. Dual actions `(a phi)(c)=phi(ca)`, `(phi a)(c)=phi(ac)`.
- Scope: 20^3=8000 associators; trace pairing rank 20, symmetry and
  associativity; radical powers; minimal covers P_0,...,P_9 for the f-simple,
  including surjectivity, T-linearity, minimality and syzygy actions.
  Independent certificate: 400 grading identities and 400 trace entries.
- Saved evidence: `computations/02-ar-finite-data/04_trivial_extension.out`:
  `PASS: dim T=20; all 8000 associators; form symmetric, associative, rank 20`;
  `PASS: trace-dual stars; radical powers dimensions [18, 14, 10, 5, 2, 0]`;
  `Ext dimensions degrees 0..9: [1, 0, 0, 1, 0, 0, 1, 0, 0, 1]`;
  `ITEM 4 PASS (supported); no Yoneda product or all-degree claim tested`.
- Commands: `python3 -B computations/02-ar-finite-data/04_trivial_extension.py`;
  `python3 -B computations/08-D-E/foundations_certificate.py`.
- Rerun: R14 and R05. Polynomial/Yoneda generation is outside this run's scope.

### A4. All four parts of lemma:cocycle, including both evaluations

- Report: `report/sections/09-ar-counterexample.tex:234–303`,
  `lemma:cocycle`, `it:cocycle`, `it:weight`, `it:boundary`, `it:evaluation`,
  `prop:cocycle-generator`; appendix references at lines 235 and 273.
- Scripts: `computations/02-ar-finite-data/05_cochain.py` (Python + Sage,
  imports the algebra/extension constructors and parses the source table);
  `computations/08-D-E/finite_cochain_certificate.py` (Python standard
  library, separately transcribed table and multiplication).
- Exact coefficients: independent certificate in F_2[q], with H=lambda
  compared coefficientwise in degrees 0 and 1; this checks the whole
  identity in F_2[q,lambda], not selected values of lambda. The original
  script uses F_2(q) for cocycle/evaluation, F_2(q,H) for boundary, then
  GF(2^16) with q=a and H=a^7 (both primitive; no random seed).
- Scope: 179 distinct nonzero three-input coefficients; input radicalness,
  endpoints and weight −1 for every entry; all 18^4=104976 radical
  four-words, including all 15250 composable four-words; all 18^2=324
  radical pairs, comparing both constant and linear H coefficients.
  The original script separately asserts p(t,x,J)=0 and p(t,y,J)=q^3 f.
  Both scripts check the bar cycle q^2[t|x|J]+[t|y|J] and its value q^3 f.
  Unlisted coefficients are zero. Multilinearity handles arbitrary inputs;
  no infinite chain-map or Ext assertion is inferred merely from enumeration.
- Saved evidence: `computations/02-ar-finite-data/05_cochain.out`:
  `PASS: 179 entries, distinct inputs, endpoints and weight -1`;
  `PASS: all 104976 radical four-words; composable count = 15250`;
  `PASS: all 324 twisted boundary pairs, both coefficient identities`;
  `PASS: d(q^2[t|x|J]+[t|y|J])=0; p evaluates to q^3*f != 0`.
  `computations/08-D-E/finite_cochain_certificate.out`:
  `"boundary_H_coefficients": [0, 1]` (displayed across lines in JSON) and
  `"outcome": "all enumerated polynomial identities hold"`.
- Commands: `python3 -B computations/02-ar-finite-data/05_cochain.py`;
  `python3 -B computations/08-D-E/finite_cochain_certificate.py`.
- Rerun: R15 and R06. Table-copy verification is T1 below.

### A5. Casimir identities in the twisted-lift construction

- Report: `report/sections/09-ar-counterexample.tex:531–569`, `prop:lifts`;
  appendix citation at line 551.
- Script: `computations/08-D-E/finite_cochain_certificate.py`, standard
  library; F_2[q] with the two coefficients of H=lambda treated separately.
- Scope: sum of h_H(w)w* over all 20 basis vectors is zero in both
  coefficients; sum over radical w with left endpoint r is r*, for each
  r=e,f. The script does not enumerate the tensor centrality identity
  h_H(a)xi_H=xi_H a or the projected tensor identity at report line 568;
  those are written arguments in the report and `computations/08-D-E/lifts.md`.
- Saved evidence: `computations/08-D-E/finite_cochain_certificate.out`:
  `"Casimir_multiplication_H_coefficients": [0, 1]` (multiline JSON);
  `"radical_endpoint_Casimir": "sum_{left(w)=r} h(w) w* = r*, r=e,f"`.
- Command: `python3 -B computations/08-D-E/finite_cochain_certificate.py`.
- Rerun: R06; the scope distinction above applies even when the run passes.

### A6. Source transcription and duplicate certificate receipts

- Report: `report/sections/09-ar-counterexample.tex:23,235,273,551`,
  `sec:ar-route`, `lemma:cocycle`, `prop:lifts`.
- Scripts: `computations/08-D-E/lifts_table_review.py` and
  `computations/08-D-E/certificate_receipt.py`, Python standard library.
  These check data/receipts rather than a new ground-field calculation.
- Scope: literal equality of all 179 words and q-exponents with
  `.cache/ar-src/09-cochain.tex`, preserving within-row order in the table
  review; rerun of the two independent polynomial certificates and byte
  comparison against their saved outputs; source SHA-256 receipts.
- Saved evidence: `computations/08-D-E/lifts_table_review.out`:
  `All 179 literal source-table entries, exponents, and within-row order match.`;
  `Row cardinalities: {0: 32, 1: 123, 2: 20, 3: 4}`.
  `computations/08-D-E/certificate_receipt.out`:
  `foundations_certificate: fresh execution exactly matches saved output.`;
  `finite_cochain_certificate: fresh execution exactly matches saved output.`
- Commands: `python3 -B computations/08-D-E/lifts_table_review.py`;
  `python3 -B computations/08-D-E/certificate_receipt.py`.
- Rerun: R07–R08. `foundations-review-certificate.out` and
  `foundations_certificate.out` replay the same foundation script;
  `old_cochain_rerun.out` replays `02-ar-finite-data/05_cochain.py`;
  `reused_01_algebra.out`, `reused_02_resolution.out`, `reused_03_ext_C.out`,
  `reused_04_trivial_extension.out` are replays of A1–A3, not new independent
  implementations. Their prose reviews and PNG literature extracts are
  not executable computations.

## Dimensions and two-factor attempt

### S1. Bar-complex dimension of C_1 and the specified Lambda

- Report: `report/sections/09-ar-counterexample.tex:399–413,759–777`,
  `lemma:two-cones`, `rem:ar-sizes`; appendix reference at line 769.
- System: new inline Python standard-library integer calculation below.
  During this job, a separate contributor added
  `computations/09-sizes/dimensions.py` and `dimensions.out`. That script
  independently computes the same dimensions using integer 2-by-2 matrix
  products. It was read and rerun here (R44), without modifying either file.
  Command: `python3 -B computations/09-sizes/dimensions.py`.
  Saved key line in `computations/09-sizes/dimensions.out`:
  `dim Lambda = 170271818183326072615867045851312256 (1.7027e+35)`.
  The inline code and its output below are retained in this deliverable
  to obey the two-file-only instruction for this job's own writes.
- Ground field: the report's F_2(q,H1,H2); only integer dimensions are
  computed. Input cohomology is E, E^2, E in degrees 0,2,4 respectively;
  this cohomology is an input from the cone construction, not verified by
  allocating its enormous differentials.
- Let R be the radical corner-dimension matrix `[[7,4],[4,3]]` and
  v=`(12,8)` the dimensions of Te,Tf (also eT,fT). Then
  b_n=dim B^(-n)=v R^n v^t. Use dim L^j=b_(2-j)+b_(-j), with b_n=0 for n<0,
  and dim K^j=sum_i dim L^i dim L^(j-i).

| n | 0 | 1 | 2 | 3 | 4 | 5 |
|---|---:|---:|---:|---:|---:|---:|
| b_n | 208 | 1968 | 18640 | 176560 | 1672400 | 15841200 |

| j | 4 | 3 | 2 | 1 | 0 |
|---|---:|---:|---:|---:|---:|
| dim K^j | 43264 | 818688 | 11713792 | 148453376 | 1761405952 |
| dim H^j | 400 | 0 | 800 | 0 | 400 |
| rank d^(j−1) | 42864 | 775824 | 10937168 | 137516208 | 1623889344 |

The last row uses rank d^(j−1)=dim K^j−dim H^j−rank d^j, starting
with d^4=0. Negative-degree exactness identifies C_1=coker d^(-2) with
im d^(-1). Thus dim C_1=1623889344. Four cosyzygies multiply its dimension
by 159999^4; the free-cover kernel contributes one further factor 159999.
The specified algebra has dimension 1600+159999^5 dim C_1.

Command (from the root; no files are written):

```sh
python3 -B - <<'PY'
# Claim: integer dimensions of the specified bar representative.
# Cases: B^(-n), n=0..5; K^j, j=0..4. Cohomological convention.
R = ((7, 4), (4, 3))
v = u = (12, 8)
b = []
for n in range(6):
    b.append(sum(v[i]*u[i] for i in range(2)))
    u = tuple(sum(R[i][j]*u[j] for j in range(2)) for i in range(2))
L = {j: (b[2-j] if 0 <= 2-j < len(b) else 0)
        + (b[-j] if 0 <= -j < len(b) else 0) for j in range(-3, 3)}
K = {j: sum(L[i]*L[j-i] for i in L if j-i in L) for j in range(5)}
h = {0: 400, 2: 800, 4: 400}
r = 0
for j in range(4, -1, -1):
    r = K[j] - h.get(j, 0) - r
assert r == 1623889344
lam = 1600 + 159999**5*r
print('C1 =', r)
print('Lambda =', lam)
print('Lambda scientific =', format(lam, '.12e'))
PY
```

Rerun now: success. Saved output of this inline computation:

```text
C1 = 1623889344
Lambda = 170271818183326072615867045851312256
Lambda scientific = 1.702718181833e+35
```

### S2. Minimised two-factor complex: dimensions and bound stop

- Report: `report/sections/09-ar-counterexample.tex:771–773`, `rem:ar-sizes`.
- Scripts: `computations/06-two-factor/one_factor.py`, `sizes.py` and
  their helper `reuse.py`; Python + Sage, using the inspected constructors
  in `02-ar-finite-data/` and the candidate/profile code in `05-candidate1/`.
- Field: GF(2^16), seed 10102026 and triple in the shared parameter table.
- Scope: reconstruct one-factor cone of dimension 312; its initial
  bimodule projectives have dimensions 208,480,768; five minimal tail
  projectives have dimensions 768,1056,1344,1632,1920. Homological indexing
  here is the negative of the report's cohomological indexing.
  L_n for n=−2,...,4: `208,480,768,1056,1344,1632,1920`.
  K_n for n=−4,...,2: `43264,199680,549888,1176576,2162688,3591168,5544960`.
  Homology dimensions in n=−4,...,1: `400,0,800,0,400,0`.
  Rank recurrence yields C0=784704 and C1=1377984; these are dimensions
  inferred from the checked complex, not constructed two-factor bimodules.
- Saved evidence: `computations/06-two-factor/one-factor-tail-optimized.out`:
  `one-factor cone and five minimal tail terms reconstructed` (following a
  timing prefix and followed by the five records).
  `computations/06-two-factor/sizes.out` contains
  `'C1': 1377984, 'C0': 784704` and
  `'dimension_qualification': 'C0 and C1 dimensions determined from the exact complex; bimodule matrices not formed'`.
- Exact stopped operation: representing C1 as im(d1:K1→K0), with
  2162688 equations and 3591168 scalar unknowns per right-hand side;
  the requested bound was 2000000 unknowns per coefficient system.
  The alternative coker(d2) would have 3591168 equations and 5544960
  unknowns per right-hand side. Stop was checked before allocation.
  `sizes.out`: `'status': 'stopped at requested system-size bound'`.
  No Y, F, Lambda, Z, delta0, ordinary Ext^1/Ext^2, indecomposable summand,
  or endomorphism-algebra dimension was computed after this stop.
- Commands: `python3 -B computations/06-two-factor/one_factor.py`
  (full reconstruction); `python3 -B computations/06-two-factor/one_factor.py --resume`
  (rebuild the tail using the saved cone);
  `python3 -B computations/06-two-factor/sizes.py`.
- Rerun: resume and size audit, R37 and R40. Saved `one-factor.out` ends
  with a dense/sparse concatenation TypeError; `one-factor-tail.out` is an
  interrupted elimination attempt. The corrected continuation is
  `one-factor-tail-optimized.out`. Do not report those interrupted logs as
  completed reconstructions. No lower bound for other representatives or
  cornerwise algorithms follows from this stop.

### S3. Evaluated two-cone and saved-matrix replay

- Report: `report/sections/09-ar-counterexample.tex:471–510`,
  `prop:two-cone-profile`; also context for `rem:ar-sizes`.
- Scripts: `computations/06-two-factor/evaluated.py`, `validate.py`,
  helper `reuse.py`; `computations/08-D-E/replay_cones.py`; Python + Sage.
- Field: same seeded two-factor GF(2^16) case as S2. Base E dimension 400,
  simple S dimension one. Actual evaluated cone representative dimension 276.
- Scope: replace the one-factor evaluated projective complexes by smaller
  resolutions before external tensoring; form tensor differentials in
  homological degrees −3,...,2 and a complete-resolution Hom calculation
  for W^a, −4≤a≤7. Hom differential ranks for a=−5,...,7 are
  `276,148,92,36,0,35,93,147,276,444,612,888,1224`.
  The separate validation recomputes direct stable Hom in degrees 0,−1.
  Replay loads the saved Hom matrices, recomputes ranks and consecutive
  zero products and independently computes the same two seam dimensions;
  it does not reconstruct the cocycle or the cones.
- Saved evidence: `computations/06-two-factor/profile.out` contains
  `'status': 'stable profile completed by complete-resolution Hom matrices'`
  and `'dim_coneX': 276`; `evaluated.json` records
  W^0=W^3=1 and W^a=0 for all other a in −4,...,7.
  `computations/06-two-factor/validation.out` contains
  `'ordinary_Hom_X_M': 1, 'ordinary_Hom_M_X': 0, 'projective_factor_rank': 0`.
  `computations/08-D-E/replay_cones.out`:
  `seam False corner dimension 36 ordinary Hom 1`;
  `seam True corner dimension 36 ordinary Hom 0`.
- Commands: `python3 -B computations/06-two-factor/evaluated.py`
  (reconstruct); `python3 -B computations/06-two-factor/evaluated.py --resume`
  (saved cone, fresh Hom profile); `python3 -B computations/06-two-factor/validate.py`;
  `python3 -B computations/08-D-E/replay_cones.py`.
- Rerun: R38–R39 and R10. Saved `evaluated.out` is an interrupted initial
  run; `profile.out` is its completed continuation. Saved
  `replay_cones.out`/`replay_cones-repeat.out` used
  `--resume-initial-ranks`, packaging ranks from `replay_cones-initial.out`;
  this job requested a fresh rank pass without that flag. An actual run's
  600-second deadline is distinct from periodic `Timeout (0:01:00)!`
  faulthandler stack samples in these logs.

## Obstruction experiments

### O1. Test bed Lambda0 without cones

- Report: `report/sections/10-obstructions.tex:200–208`,
  `subsec:obstruction-computations`, item 1; also
  `report/sections/08-conversion.tex:302`, `eq:conversion-sequence`.
- Script: `computations/03-testbed-lambda0/testbed.py`, Python + Sage;
  imports the C/T constructors, but builds Lambda, Z, covers and Hom
  complexes separately. Left modules, column matrices, right twist
  u.a=u h_H(a), characteristic two.
- Fields/parameters: three seeded GF(2^16) triples above, degrees 0,...,6;
  exact F_2(q,H1,H2) with independent variables, degrees 0,...,2.
- Dimensions: T=20, off-diagonal bimodule=40, Lambda0=80, four simples;
  Q=Tf=8, lower component Y=9, Z0=10. Covers are carried one step beyond
  the last requested Ext degree to obtain the outgoing differential.
- Saved evidence: `computations/03-testbed-lambda0/summary.out`:
  `Case 0 self [5, 1, 0, 0, 0, 0, 0] regular [22, 0, 0, 0, 0, 0, 0] stable End 1`;
  cases 1 and 2 give the same lists;
  `Case exact self [5, 1, 0] regular [22, 0, 0] stable End 1`.
  Full ranks/Betti numbers in `result-{0,1,2,exact}.json` and
  `case-{0,1,2,exact}.out`. Degree zero entries mean ordinary Hom.
- Commands: `python3 -B computations/03-testbed-lambda0/testbed.py --case C --degree D`,
  with `(C,D)=(0,6),(1,6),(2,6),(exact,2)`.
- Rerun: exact case R16. Full finite-field runs were not repeated: their
  saved measured times are 693.85,1081.47,1056.34 seconds, all exceeding
  the user's ten-minute threshold. These are saved-only results in this
  job, with independent lower-degree checks rerun below.

### O2. Lambda0 direct extension check, twist comparison and receipt summary

- Report: `report/sections/10-obstructions.tex:208`, item 1's surviving
  coker(delta0) class; `report/sections/09-ar-counterexample.tex:307–312`,
  `lemma:twist`, in the tested degrees.
- Scripts: `computations/03-testbed-lambda0/crosscheck.py`, `comparison.py`
  (Python + Sage), `summarise.py` (standard library).
- Scope/fields: crosscheck cases 0 and exact from O1; ordinary module
  intertwiners, two explicit self-extension cocycles, all 80^2=6400
  products for each cocycle, and independence modulo coboundaries.
  Comparison case 0: actual comparison chain maps and the two twist
  actions in degrees a=0,...,6. Summary reconciles all four saved cases,
  source hashes, ranks, and kernel/cokernel predictions.
- Saved evidence: `crosscheck-0.out` and `crosscheck-exact.out`:
  `Direct intertwiner equations: End dimension 5 Hom(Z,Lambda) dimension 22`;
  `Coboundary rank 37 ; with B1 38 ; with B2 38 ; with both 38 ; with B1+B2 37`;
  `SUPPORTED: (c1,c2) -> [c1 B1+c2 B2] has kernel <(1,1)> and rank 1.`
  `comparison-0.out` has delta rank/kernel/cokernel `(1,1,1)` in degree 0,
  `(2,0,0)` in degrees 3 and 6, `(0,0,0)` otherwise; both twist eigenvalues
  equal H_i^(-a/3) in the nonzero groups. `summary.out`:
  `PASS: direct comparison-map kernel/cokernel dimensions reproduce Ext^1..Ext^6 in case 0.`
  All these files are under `computations/03-testbed-lambda0/`.
- Commands: `python3 -B computations/03-testbed-lambda0/crosscheck.py 0`;
  the same with `exact`; `python3 -B computations/03-testbed-lambda0/comparison.py 0`;
  `python3 -B computations/03-testbed-lambda0/summarise.py`.
- Rerun: R17–R20. The summary checks saved data; it does not reconstruct
  the three longer finite-field resolutions.

### O3. Actual one-factor candidate Lambda1 and ordinary Ext

- Report: `report/sections/10-obstructions.tex:209–215`, computational item 2;
  `prop:one-factor` at lines 57–87 and `prop:one-cone` at lines 28–47.
- Scripts in `computations/05-candidate1/`: `candidate.py`, `finish.py`,
  `cone_profile.py`, `normalisation.py`, `profile.py`, `ext.py`;
  execute through `runner.py`. Python + Sage; runner applies an AST
  adapter for exact sparse matrix multiplication and dense concatenation.
- Fields/parameters: two GF(2^16) triples with seeds 8082026,8082027 above.
  No exact transcendental candidate run is saved.
- Scope: actual minimal bimodule covers, cocycle transfer from the bar
  resolution, 312-dimensional cone; cosyzygy N of dimension 376;
  normalised lifts (literally equal on s, stably nonzero); fibre F1=352,
  Lambda1=392 with four simples, Z1=16. Cone evaluation Cs=6, fibre
  evaluation Fs=8; W^a for −4≤a≤4 is one in degrees 0,1 and zero elsewhere.
  Stable Hom(s,Fs)=2; delta0 is the matrix `[[1,1],[0,0]]`, rank one,
  kernel and cokernel dimension one. Ordinary minimal Lambda resolutions
  and two Hom complexes give Ext in degrees 1,2,3; projectivity of F1
  on both sides is checked. Per-system bound 100000 scalar unknowns;
  largest guarded count 768 in saved completed cases.
- Saved evidence: `summary.out`:
  `case 0 dimensions {'dim_C': 312, 'dim_N': 376, 'dim_F': 352, 'dim_Lambda': 392, 'dim_Cs': 6, 'dim_Fs': 8, 'dim_Z': 16} Ext self [1, 0, 0] Ext regular [0, 0, 0] largest guarded unknown count 768`;
  case 1 has the same dimensions/results.
  `normalisation-0.out`/`normalisation-1.out` contain
  `'equal_stably': True, 'both_stably_nonzero': True, 'equal_as_actual_maps': True`.
  `profile-0.out`/`profile-1.out` contain
  `'rank': 1, 'kernel_dimension': 1, 'cokernel_dimension': 1`.
  Output locations are all `computations/05-candidate1/`; `.sobj` files
  retain actual cones, cosyzygies, fibres and Ext matrices.
- Commands: for each `C=0,1`, run
  `python3 -B computations/05-candidate1/runner.py STAGE C`, with STAGE in
  order `candidate`, `cone_profile`, `finish`, `normalisation`, `profile`,
  `ext`. Each stage must complete before a downstream fresh reconstruction.
  `finish` reuses `N-raw-C.sobj` and `cosyzygy-C.sobj` if present; `profile`
  can reuse `W-C.json` after checking its cone hash.
- Rerun: R23–R34, each in its own baseline copy. Thus successful later
  stages validate the saved predecessor artifacts, not necessarily the
  newly generated artifacts of an earlier rerun. Cached `finish` was
  attempted; full uncached saved finish times 641.10 and 629.04 seconds
  exceed ten minutes.

### O4. Candidate execution adapter and summary

- Report: same locators as O3; reproducibility support only.
- Scripts: `computations/05-candidate1/benchmark.py`, `runner.py`,
  `summarise.py`. Benchmark uses Sage over GF(2^16), 188-by-188
  deterministic matrices (no random seed): A[i,(3i+j) mod 188]=b^(i mod 16)
  for j=0,1,2 and B[i,(7i+j) mod 188]=b^(i mod 15) for j=0,...,4;
  all other entries zero. Compares classical, Karatsuba and sparse
  products. It is an arithmetic-backend consistency check, not additional
  evidence for a mathematical candidate. Summary is standard-library
  reconciliation of the two completed saved receipts.
- Saved evidence: `benchmark.out`: `1.61 all three exact products agree`;
  `summary.out`: `Codex job 08: both case receipts complete; numerical results agree.`
- Commands: `python3 -B computations/05-candidate1/benchmark.py`;
  `python3 -B computations/05-candidate1/summarise.py`.
- Rerun: R35–R36. Benchmark elapsed times are not deterministic.

### O5. Toda scalar and explicit nullhomotopies for the AR one-factor case

- Report: `report/sections/10-obstructions.tex:89–99,174–189`,
  `prop:one-factor` context, `rem:weights`; finite support for the
  displayed vanishing in `thm:tate-obstruction`, not its general argument.
- Scripts: `computations/04-toda-bracket/toda.py`, `witness.py`
  (Python + Sage); `computations/08-D-E/rerun_bracket_witness.py` executes
  `witness.py` with its runtime/cache destination relocated.
- Fields: F_2(q) and GF(2^n), n=8,12,16, q the multiplicative generator,
  order 2^n−1; no seed. Moduli for n=8,12,16, respectively:
  `x^8+x^4+x^3+x^2+1`, `x^12+x^7+x^6+x^5+x^3+x+1`,
  `x^16+x^5+x^3+x^2+1`.
- Scope of `toda.py`: actual minimal covers through P7, stable Hom degrees
  −7,...,7; actual cone of tau dimension six and cone of beta dimension 14;
  scalar c and brackets `<tau,beta,beta>`, `<beta,beta,beta>` by ordinary
  Hom/quotient maps. `witness.py` independently rebuilds multiplication and
  checks explicit first-three-syzygy bases, right-U/right-X lifts,
  nullhomotopies and all basis-pair linearity identities; indeterminacy
  zero is checked using H^1=H^(−3)=0 by explicit cyclicity/injectivity.
- Saved evidence: `computations/04-toda-bracket/results.out`:
  `RESULT (supported): c = 0 ; beta triple = {0}` in each field;
  `witness.out` and `computations/08-D-E/bracket-witness-rerun.out`:
  `RESULT: both Toda brackets are {0}; c=0 (exact certificates)`.
  Matrices are retained in `computations/04-toda-bracket/{exact,8,12,16}.json`.
- Commands: `python3 -B computations/04-toda-bracket/toda.py`
  (all four cases; an argument `exact`, `8`, `12` or `16` selects a case);
  `python3 -B computations/04-toda-bracket/witness.py`;
  `python3 -B computations/08-D-E/rerun_bracket_witness.py`.
- Rerun: R21–R22 and R09.

### O6. Three further attempts of dimensions 6,12,40

- Report: `report/sections/10-obstructions.tex:216–218`,
  `subsec:obstruction-computations`, item 3; also `rem:weights`.
- Script: `computations/07-one-factor-search/profiles.py`, Python + Sage;
  actual algebra tables, symmetric-form checks and minimal projective covers.
- Fields/parameters: three AR20 control runs over F_2(q), GF(2^16) q=a,
  GF(2^16) q=a^7. In the finite controls H1=a^11,H2=a^13; each has order
  65535 and character separation is checked for m=1,...,12.
  All three new attempts use GF(2^16), generator a; the 40-dimensional
  attempt uses the AR algebra at q=a. No random seed.
- Attempts and exact scope:
  1. `Nakayama6 = T(k A2)`: two simples, simple dimension one; actual
     minimal covers through degree 12. Ext^a, a=0,...,12:
     `[1,0,0,1,1,0,0,1,1,0,0,1,1]`. Fails the polynomial-generator-in-degree-3
     condition already at Ext^4; the separate four-periodic control has
     tau^2=0 and a nonzero bracket `{1}`.
  2. `tensor12 = Nakayama6 tensor k[epsilon]/(epsilon^2)`: two simples,
     simple dimension one; actual covers through degree 12, checked
     against convolution with the dual-numbers profile `[1,...,1]`.
     Ext list `[1,1,1,2,3,3,3,4,5,5,5,6,7]`; fails at Ext^1.
  3. `iterated40 = T(T_AR)`: two simples, simple dimension one;
     actual covers **only in degrees 0 and 1**, yielding `[1,1]`.
     Its identification with AR20 tensor dual numbers is checked on all
     40^2 products, and the tensor-resolution convolution gives degrees
     0,...,12: `[1,1,1,2,2,2,3,3,3,4,4,4,5]`. This is not a direct
     13-degree cover computation for iterated40. Fails already at Ext^1.
- Saved evidence: `computations/07-one-factor-search/profiles.out`:
  `Nakayama6 Ext dimensions: [1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1]`;
  `tensor12 Ext dimensions: [1, 1, 1, 2, 3, 3, 3, 4, 5, 5, 5, 6, 7]`;
  `Iterated T(T_AR) Ext 0..12 from checked tensor resolution: [1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4, 5]`;
  `COMPLETED completed; no eligible candidate; step 4 not entered max unknowns 78`.
- Command: `python3 -B computations/07-one-factor-search/profiles.py`.
- Rerun: R42. No fibre, triangular algebra or conversion module was
  constructed for these three rejected attempts. The current report explicitly distinguishes the tensor-product formula
  for iterated40 in degrees 2 through 12.

### O7. One-factor sign/weight controls, periodic example and auxiliary validation

- Report: `report/sections/10-obstructions.tex:112–145,174–189,216–218`,
  `thm:tate-obstruction`, `rem:weights`, computational item 3.
- Scripts: `computations/07-one-factor-search/controls.py` (standard
  library), `validate.py` (Sage, imports `profiles.py`).
- Scope/rings: formal signed noncommutative dg identities over Z,
  `K=VT+BE`, `TK+UB=d(WT+UE)`; enumeration of 26 scalar classes tau^m and
  beta_m for 0≤m≤12 (26^3 triples screened), with 5525 defined triples,
  2236 zero targets and 3289 nonzero targets of mismatched weight.
  Six-dimensional characteristic-two example: all 6^3 associators,
  symmetric trace, four residues of its complete periodic resolution,
  chain identities giving `<f,f/v,f/v>={1}` and tau^2=0.
  Screen of 27 uniform symmetric cyclic Nakayama presentations with
  r≥2 vertices, length mr+1, total dimension r(mr+1)≤60; formula-derived
  simple Ext dimensions through degree 12, not 27 separate matrix resolutions.
  Validation over F_2(q): direct AR e-simple Ext^1=2, dim eTe=8;
  path algebra k(1→2) example showing D Ext^1(s0,C)=s1≠s0;
  balanced grading of iterated40 (old DC weight 4, epsilon weight −2).
- Saved evidence: `controls.out`:
  `AR weight enumeration: {'index_bound': 12, 'defined_triples': 5525, 'zero_target': 2236, 'nonzero_target_weight_mismatch': 3289}`;
  `PASS: T(k A2), all four complete-resolution residues; c=1; tau^2=0`;
  `Symmetric cyclic Nakayama presentations with r>=2, dim<=60: 27`.
  `validation.out`: `Codex job 12: validation PASS`;
  `AR e-simple: Ext^1 dimension 2; eTe dimension 8, not 4.`
  Both output paths are under `computations/07-one-factor-search/`.
  The e-simple/path-algebra checks support the search dossier rather than
  an explicit assertion in the current report; they are included for coverage.
- Commands: `python3 -B computations/07-one-factor-search/controls.py`;
  `python3 -B computations/07-one-factor-search/validate.py`.
- Rerun: R41 and R43. The additional embedded standard-library script in
  `computations/07-one-factor-search/independent-review.md:237–284`
  was also executed now, successfully, and its output exactly matches the
  saved line at 290:
  `PASS over Z: dR=0; dK=B^2; dQ=TK+UB; d^2=0 on generators.`
  It checks the formal signed defining system over Z, with generator degrees
  T=3, B=−1, G=−4, U=1, V=−6, E=−2, W=−4; it does not construct modules.
  Rerun it without creating another file using:

```sh
python3 -B - <<'PY'
from pathlib import Path
import re
p = Path('computations/07-one-factor-search/independent-review.md')
code = re.search(r'```python\n(.*?)\n```', p.read_text(), re.S).group(1)
exec(compile(code, str(p), 'exec'), {})
PY
```

## Selection-group and sign checks supporting sections 4–8

### G1. Original selection-quotient check

- Report: `report/sections/05-selection.tex:216,282,355,409`,
  `prop:group-presentation`, `prop:central-involutions`,
  `prop:finite-quotients`, `coro:z-independent`.
- Script: `computations/01-selection-quotients.py`; standard library,
  exact bitmask ring S_m=F_2[t]/(t^m−1), 5-by-5 matrices;
  commutator aba^(-1)b^(-1), ordinary matrix composition.
- Scope: m=1,...,6, integer arguments in [−2m,2m]; all permitted root
  indices, transfer triples, z_N independence/centrality, all 2^m central
  subset products, and 4374 integral-preimage weight instances
  (r,s=−4,...,4, nine rows and six ordered index choices). Alternative commutator,
  opposite-composition and inverse-conjugation readings are also tested
  as diagnostics. The inverse-conjugation reading fails for m≥3, as expected.
- Saved evidence: `computations/01-selection-quotients.out` has for m=6
  `PASS     transfer [U_i(r),V_i(q+s)]=[U_j(r+q),V_j(s)]: 93750 pass, 0 fail`;
  it also explicitly labels inverse-conjugation failures
  `FAIL (alternative reading, informational)`.
- Command: `python3 -B computations/01-selection-quotients.py`.
- Rerun: R00. Informational alternative-reading failures are not failures
  of the stated group convention.

### G2. Selection checks through m=10

- Report: `report/sections/05-selection.tex:216–280,282–321,355–428,465–506`,
  `prop:group-presentation`, `prop:central-involutions`,
  `prop:finite-quotients`, `coro:z-independent`, `thm:selection-unbounded`.
- Script: `computations/D-C-selection-checks.py`, Python standard library.
  Integer weight identities over Z; matrix ring S_m=F_2[t]/(t^m−1),
  m=1,...,10; same commutator and 5-by-5 matrix convention as G1.
- Scope: 12 unimodular kernel bases; nine integral-preimage rows in all
  six index permutations; all parameter residues, root indices,
  conjugations, centrality, transfer identities, every 2^m central subset;
  prescribed sign sequence `(+1,...,+1,−1)` has first zero iterate m.
  Counts of exact matrix equalities for m=1,...,10:
  `143,418,833,1390,2093,2950,3977,5206,6701,8590`.
- Saved evidence: `computations/D-C-selection-checks.out`:
  `Kernel bases: 12/12; weight(q)=1, weight(b)=0, determinant=+/-1.`;
  `m=10: 8590 exact matrix equalities; 1024 distinct central subset products; first zero iterate=10.`;
  `All listed finite checks passed. No all-m conclusion is inferred from them.`
- Command: `python3 -B computations/D-C-selection-checks.py`.
- Rerun: R03.

### G3. D-A signs and two nonflat examples

- Report: `report/sections/04-trivial-extensions.tex:33–139`,
  `thm:bar-decomposition`; lines 142–159, `ex:derived-powers`;
  lines 197–253, `prop:pd-formula`, `coro:extinction`;
  `report/sections/07-simulation.tex:31–111`, `prop:simulation`.
- Script: `computations/D-A-checks.py`, Python standard library,
  integer parity and exact rational arithmetic (`fractions.Fraction`).
- Scope: bar lengths 0,...,5, block lengths 0,...,3; dg lengths 0,...,6,
  internal degrees −2,−1,0; simulation shifts −3,...,4, lengths 0,...,6.
  Counts: 69633 multibar faces, 73791 mixed dg terms,
  29511 shifted actions, 168 simulation differential checks.
  Nonflat radical-square-zero two-cycle example over Q: dim Delta=3,
  dim A=4, X=S0 tensor S1, N=S0; resolution terms through index 9,
  cohomology of Delta tensor_A resolution through index 8.
  Finite-extinction example over Q: dim Delta=6, dim A=7,
  X=S0 tensor S2, N=S1; full minimal resolution of length three.
- Saved evidence: `computations/D-A-checks.out`:
  `SIGN CHECKS: {'multibar_faces': 69633, 'dg_mixed_terms': 73791, 'dg_shifted_action': 29511, 'simulation_differentials': 168}`;
  `dim H^{-n}(Delta tensor_A resolution), n=0..8: [1, 0, 1, 0, 1, 0, 1, 0, 1]`;
  `Phi N=S_0[1], Phi^2 N=0; ordinary X tensor_Delta N=0`;
  `pd_A N=3 from the complete minimal resolution`.
  The finite-extinction seven-dimensional example is supplementary
  support for the formula, not a separately stated example in the report.
- Command: `python3 -B computations/D-A-checks.py`.
- Rerun: R01.

### G4. Rectification signs, nonzero nullhomotopic relation

- Report: `report/sections/06-realisation.tex:597–728`, `prop:rectification`,
  especially `eq:rectification-maps` and `eq:eta-homotopy`.
- Script: `computations/D-B-rectification-check.py`; Python + SymPy
  (not standard library, and not Sage), exact Q arithmetic.
- Case: B=Q(0→1→2)/(ba), dim B=5; each D_i is `(B⊕B→B)` in degrees 0,1,
  differential (1,0); f_a=id, f_b projection onto the contractible summand,
  h_ba its contraction. Thus f_b f_a is nonzero but nullhomotopic.
  Matrices suppress the common right-free B factor.
- Scope: all degrees of this finite example, d_P^2, both arrow
  homotopies, and all three iota_i cohomology isomorphisms; removing h
  is a sensitivity check that gives nonzero squares in two degrees.
- Saved evidence: `computations/D-B-rectification-check.out`:
  `PASS: d_P^2=0 in all degrees of this example`;
  `SENSITIVITY: omitting h gives nonzero squares in 2 degrees`;
  `PASS: d H_a+H_a d=a iota-iota f_a` (and the b version);
  `PASS: iota_0 induces an isomorphism on cohomology; dimensions {-2: 0, -1: 0, 0: 1, 1: 0}`
  (same for iota_1,iota_2).
- Command: `python3 -B computations/D-B-rectification-check.py`.
- Rerun: R02. Multiply dimensions by five when reinserting the B factor.

### G5. D-D cone signs

- Report: `report/sections/08-conversion.tex:203–315`, `thm:conversion`,
  `eq:conversion-sequence`; cone block differential and its Hom differential.
- Script: `computations/D-D-cone-signs.py`, Python standard library;
  free noncommutative polynomial arithmetic over Z and Z/2Z.
- Scope: both parities of n over both coefficient rings;
  Q^i=A^i⊕B^(i+1), d_Q=`[[a,V],[0,−b]]`, right-to-left composition,
  h of unshifted degree n−1. Coordinate differential, its square,
  and d_Q^2 reduce to zero using a^2=b^2=0 and aV=Vb.
  Four parity/ring coordinate checks and four square checks, plus
  one cone-square check in each ring. This is a formal sign identity;
  no module resolution or Ext vanishing is computed.
- Saved evidence: `computations/D-D-cone-signs.out`:
  `Z, n mod 2 = 0: coordinate differential PASS; endomorphism d^2 PASS`
  (also n=1 and Z/2Z);
  `All checks passed. The identity covers all integer n by parity.`
- Command: `python3 -B computations/D-D-cone-signs.py`.
- Rerun: R04.

## T1. Literal cochain table deliverable and copy check

- Report: `report/sections/09-ar-counterexample.tex:234–238`,
  `subsec:cocycle`; defining data for `lemma:cocycle`.
- Input: `.cache/ar-src/09-cochain.tex:15–45`. The actual `tabular` occupies
  lines 17–40; surrounding `center`, `small` and subsequent prose are not
  part of the table. The delivered
  `report/notes/appendix-A-cochain-table.tex` copies the complete tabular
  byte for byte, with a provenance comment before it. No words, coefficients,
  row order or within-row order have been changed.
- System/parameters: Python standard library, literal text comparison;
  polynomial-coefficient exponents 0,1,2,3. No field arithmetic.
- Scope/result: 179 ordered `(coefficient,word)` pairs, 179 distinct
  three-letter inputs; counts by exponent `{0:32,1:123,2:20,3:4}`.
- Rerun now: success, using the following reproducible script check.

```sh
python3 -B - <<'PY'
# Claim: the requested cochain table is an exact copy, all 179 entries.
# Cases/conventions: ordered q-exponent/four-letter-word pairs, case sensitive.
from pathlib import Path
import re
source = Path('.cache/ar-src/09-cochain.tex').read_text()
copy = Path('report/notes/appendix-A-cochain-table.tex').read_text()
def table(s):
    return s[s.index(r'\begin{tabular}'):
             s.index(r'\end{tabular}')+len(r'\end{tabular}')]
def entries(s):
    pattern = r'\$(q(?:\^\d+)?|1)\$\s*&\s*\\texttt\{([^}]+)\}'
    return [(c, w) for c, words in re.findall(pattern, s)
            for w in words.split()]
original = '\n'.join(source.splitlines()[14:45])
a, b = entries(original), entries(copy)
assert len(a) == len(b) == 179 and a == b
assert len({word[:3] for _, word in b}) == 179
assert table(source) == table(copy)
print('PASS: byte-identical tabular; 179 ordered coefficient/word entries; 179 distinct inputs.')
PY
```

Saved output:

```text
PASS: byte-identical tabular; 179 ordered coefficient/word entries; 179 distinct inputs.
```

## Rerun register

Environment: system Python 3.14.7, SageMath 10.10, SymPy 1.14.0.
All 45 commands below completed with exit code 0 within a 600-second
wall-clock limit per invocation. Up to three independent invocations ran
concurrently in separate copies of the saved inputs. Times are measured
wall seconds, including interpreter startup. No packages were installed.

Comparison codes: **B** = stdout/stderr exactly equals the saved `.out`
bytes; **T** = same output after removing elapsed-time values and periodic
faulthandler stack samples; **C** = cached cosyzygy notice replaces the
original cosyzygy-construction log, all remaining mathematical output
matches; **R** = fresh ranks match, with only the saved resume banner absent;
**J** = all mathematical JSON fields match; the systems audit list has
55 additional repeated guard records from the new Hom-profile pass.
The benchmark T comparison additionally ignores its three backend timings.

Count: 26 byte-identical outputs, 15 timing/diagnostic-only differences,
two cached-cosyzygy logs, one fresh-rank/resume-banner difference, and one
additional-audit-record difference. No mathematical output discrepancy
was found. These comparisons do not enlarge any entry's scope.

In the table, prepend `/usr/bin/python3 -B ` to every command.

| ID | Command arguments | Saved output | Seconds | Exit | Comparison |
|---|---|---|---:|---:|---|
| R00 | `computations/01-selection-quotients.py` | `computations/01-selection-quotients.out` | 200.62 | 0 | B |
| R01 | `computations/D-A-checks.py` | `computations/D-A-checks.out` | 0.22 | 0 | B |
| R02 | `computations/D-B-rectification-check.py` | `computations/D-B-rectification-check.out` | 1.47 | 0 | B |
| R03 | `computations/D-C-selection-checks.py` | `computations/D-C-selection-checks.out` | 1.27 | 0 | B |
| R04 | `computations/D-D-cone-signs.py` | `computations/D-D-cone-signs.out` | 0.06 | 0 | B |
| R05 | `computations/08-D-E/foundations_certificate.py` | `computations/08-D-E/foundations_certificate.out` | 0.12 | 0 | B |
| R06 | `computations/08-D-E/finite_cochain_certificate.py` | `computations/08-D-E/finite_cochain_certificate.out` | 1.12 | 0 | B |
| R07 | `computations/08-D-E/lifts_table_review.py` | `computations/08-D-E/lifts_table_review.out` | 0.11 | 0 | B |
| R08 | `computations/08-D-E/certificate_receipt.py` | `computations/08-D-E/certificate_receipt.out` | 1.07 | 0 | B |
| R09 | `computations/08-D-E/rerun_bracket_witness.py` | `computations/08-D-E/bracket-witness-rerun.out` | 12.72 | 0 | B |
| R10 | `computations/08-D-E/replay_cones.py` | `computations/08-D-E/replay_cones.out` | 179.33 | 0 | R |
| R11 | `computations/02-ar-finite-data/01_algebra.py` | `computations/02-ar-finite-data/01_algebra.out` | 4.28 | 0 | B |
| R12 | `computations/02-ar-finite-data/02_resolution.py` | `computations/02-ar-finite-data/02_resolution.out` | 4.99 | 0 | B |
| R13 | `computations/02-ar-finite-data/03_ext_C.py` | `computations/02-ar-finite-data/03_ext_C.out` | 5.46 | 0 | B |
| R14 | `computations/02-ar-finite-data/04_trivial_extension.py` | `computations/02-ar-finite-data/04_trivial_extension.out` | 64.83 | 0 | B |
| R15 | `computations/02-ar-finite-data/05_cochain.py` | `computations/02-ar-finite-data/05_cochain.out` | 5.69 | 0 | B |
| R16 | `computations/03-testbed-lambda0/testbed.py --case exact --degree 2` | `computations/03-testbed-lambda0/case-exact.out` | 72.93 | 0 | T |
| R17 | `computations/03-testbed-lambda0/crosscheck.py 0` | `computations/03-testbed-lambda0/crosscheck-0.out` | 10.19 | 0 | B |
| R18 | `computations/03-testbed-lambda0/crosscheck.py exact` | `computations/03-testbed-lambda0/crosscheck-exact.out` | 29.77 | 0 | B |
| R19 | `computations/03-testbed-lambda0/comparison.py 0` | `computations/03-testbed-lambda0/comparison-0.out` | 30.13 | 0 | B |
| R20 | `computations/03-testbed-lambda0/summarise.py` | `computations/03-testbed-lambda0/summary.out` | 0.11 | 0 | B |
| R21 | `computations/04-toda-bracket/toda.py` | `computations/04-toda-bracket/results.out` | 173.19 | 0 | B |
| R22 | `computations/04-toda-bracket/witness.py` | `computations/04-toda-bracket/witness.out` | 14.43 | 0 | B |
| R23 | `computations/05-candidate1/runner.py candidate 0` | `computations/05-candidate1/case-0.out` | 282.35 | 0 | T |
| R24 | `computations/05-candidate1/runner.py cone_profile 0` | `computations/05-candidate1/W-0.out` | 21.30 | 0 | T |
| R25 | `computations/05-candidate1/runner.py finish 0` | `computations/05-candidate1/finish-0.out` | 592.31 | 0 | C |
| R26 | `computations/05-candidate1/runner.py normalisation 0` | `computations/05-candidate1/normalisation-0.out` | 11.67 | 0 | T |
| R27 | `computations/05-candidate1/runner.py profile 0` | `computations/05-candidate1/profile-0.out` | 12.21 | 0 | T |
| R28 | `computations/05-candidate1/runner.py ext 0` | `computations/05-candidate1/ext-0.out` | 313.29 | 0 | T |
| R29 | `computations/05-candidate1/runner.py candidate 1` | `computations/05-candidate1/case-1.out` | 251.45 | 0 | T |
| R30 | `computations/05-candidate1/runner.py cone_profile 1` | `computations/05-candidate1/W-1.out` | 20.38 | 0 | T |
| R31 | `computations/05-candidate1/runner.py finish 1` | `computations/05-candidate1/finish-1.out` | 573.33 | 0 | C |
| R32 | `computations/05-candidate1/runner.py normalisation 1` | `computations/05-candidate1/normalisation-1.out` | 6.80 | 0 | T |
| R33 | `computations/05-candidate1/runner.py profile 1` | `computations/05-candidate1/profile-1.out` | 5.29 | 0 | T |
| R34 | `computations/05-candidate1/runner.py ext 1` | `computations/05-candidate1/ext-1.out` | 289.84 | 0 | T |
| R35 | `computations/05-candidate1/benchmark.py` | `computations/05-candidate1/benchmark.out` | 5.23 | 0 | T |
| R36 | `computations/05-candidate1/summarise.py` | `computations/05-candidate1/summary.out` | 0.12 | 0 | B |
| R37 | `computations/06-two-factor/one_factor.py --resume` | `computations/06-two-factor/one-factor-tail-optimized.out` | 299.31 | 0 | T |
| R38 | `computations/06-two-factor/evaluated.py --resume` | `computations/06-two-factor/profile.out` | 245.46 | 0 | J |
| R39 | `computations/06-two-factor/validate.py` | `computations/06-two-factor/validation.out` | 312.73 | 0 | T |
| R40 | `computations/06-two-factor/sizes.py` | `computations/06-two-factor/sizes.out` | 10.40 | 0 | T |
| R41 | `computations/07-one-factor-search/controls.py` | `computations/07-one-factor-search/controls.out` | 0.12 | 0 | B |
| R42 | `computations/07-one-factor-search/profiles.py` | `computations/07-one-factor-search/profiles.out` | 178.81 | 0 | B |
| R43 | `computations/07-one-factor-search/validate.py` | `computations/07-one-factor-search/validation.out` | 3.93 | 0 | B |
| R44 | `computations/09-sizes/dimensions.py` | `computations/09-sizes/dimensions.out` | 0.07 | 0 | B |

Additional inline checks executed successfully: the S1 dimension calculation,
T1 exact table-copy check, and O7 embedded signed-identity script. Each
reproduced the output quoted at its entry. The T1 table body is byte-identical
and has 179 entries, not merely the same set after reordering.

Not rerun from scratch: Lambda0 finite-field cases 0–2 (saved runtimes
693.85,1081.47,1056.34 seconds); uncached Lambda1 `finish` constructions
(641.10,629.04 seconds). Their exact commands and evidence are in O1/O3.
R25/R31 successfully reran `finish` from the saved cosyzygy checkpoints;
R37 rebuilt the minimal tail from its saved cone; R38 rebuilt the Hom
profile from its saved evaluated cone. No claim of a fresh end-to-end
two-factor reconstruction is made. R40 successfully reproduced the intended
pre-allocation size stop; exit 0 does not mean the stopped construction was
completed.

Coverage: all 40 Python source files currently under `computations/` are
accounted for above, including the execution helpers `runner.py` and
`reuse.py` through their callers; the embedded signed calculation is also
covered. `.sobj` files are saved inputs/checkpoints, JSON files retain
parameters and ranks, environment outputs and SHA256SUMS files are receipts,
and PNGs are source-page images, not additional executable experiments.

Preservation check: every original file in `computations/` included in the
pre-rerun snapshot still has the same SHA-256 after all reruns. The new
`09-sizes/` files were supplied concurrently by another contributor and
were only read and executed by this job. The report itself was not edited
by this job; locators were refreshed after its concurrent edits.
