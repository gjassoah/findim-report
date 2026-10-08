Model: GPT-6 (Codex); effort: unknown.

# Codex job 04: finite data of the Auslander–Reiten preprint

This is an autonomous computational audit of the supplied, unverified source,
not a manuscript edit or human certification. Results below have status
**supported** unless a complete argument is explicitly labelled otherwise.
The requested order is binding: stop at the first failed claim.

## Inputs and conventions

- Inputs: `.cache/ar-src/{main,03-algebra,04-resolution,09-cochain}.tex`.
  The multiplication, module maps and cochain coefficients are inputs to test,
  not assumptions of correctness. No previous agents' output is used.
- Ordered basis of C: `(e,x,y,z,u,v,t,j,f,n)`. A corner `iCj` has left
  endpoint i and right endpoint j; products are as printed, without reversal.
- Modules are left modules; vectors are columns for maps. Sage row spaces
  represent subspaces of coordinate vectors. Resolution degrees are homological,
  with augmentation in degree zero; the Hom complex has cohomological degrees.
- All arithmetic has characteristic two. The exact base field is F₂(q).
  A separate specialisation uses F₂¹⁶ and a primitive element q of order 65535.
  Finite-field agreement is supporting evidence only, not an all-degree claim.
- Scripts are new implementations from the displayed definitions. Reusable
  arithmetic and algebra construction live in the item-1 script; later items
  import them without executing its audit. Each item has a separate saved output.
- Run from this repository with `DOT_SAGE="$PWD/computations/02-ar-finite-data"
  PYTHONDONTWRITEBYTECODE=1 /usr/bin/python computations/02-ar-finite-data/NN_name.py`.
  No source, other audit, progress, ledger, or conversation file is modified.

## Running results

Items 1–5: not yet reached. Entries below supersede this initial checkpoint.

### Item 1 — PASS; status: supported

`01_algebra.py` and `01_algebra.out` record all 1,000 basis associativity
tests, the unit and orthogonal idempotents, and corner dimensions `(4,2,2,2)`.
The dimensions of N through N⁵ are `(8,5,3,1,0)`. The projection onto the
e and f coordinates is checked to be a surjective algebra map to k × k,
with kernel N. Since N is nilpotent and this quotient is semisimple, N is
the radical. The computed product is `((ut)u)t = (q²+q)z ≠ 0`.
All checks agree after specialisation to q = a in
F₂[a]/(a¹⁶+a⁵+a³+a²+1), where a has order 65535.

The implementation initially attempted to mutate Sage's immutable zero
vector; this programming error was corrected before obtaining the saved
successful output. It was not a failed mathematical claim.

### Item 2 — PASS; finite results: supported; uniform formula: AI-proved

`02_resolution.py` and its output check the f-character on every product,
then construct d₁ through d₉ by right multiplication. Exactness at degrees
0–8 is checked by equality of kernel and image subspaces, not only dimensions.
All d₁,…,d₉ have rank 3; the augmentation has rank 1. Every differential
lands in the radical of its target projective, so the resolution is minimal.
Both fields give identical results.

For the all-index calculation, set r = qⁱ. On `(e,x,y,z,t,j)`, right
multiplication by x+ry gives `(x+ry, qr z, z, 0, (1+q²r)j, 0)`.
The three independent vectors `x+qr y,z,j` lie in its kernel. The minor
with columns e,y,t and rows x,z,j is `1+q²r`; it is nonzero at every
r=qⁱ, i≥0. Hence the rank is 3, the displayed vectors span the kernel,
and the image is `<x+ry,z,j>`. Right multiplication by u has kernel
`<x+y,z,j>` and image `<u,v,n>`, as checked separately. These subspaces
give exactness at every index over F₂(q). This is an AI argument with
an exact symbolic certificate, not an extrapolation from degrees 0–8.

### Item 3 — PASS; status: supported

`03_ext_C.py` constructs the Hom complex by left multiplication, independently
of the source's kernel formulas. In degrees 0–8 its kernel dimensions are
`(0,4,3,3,3,3,3,3,3)` and boundary dimensions are
`(0,4,2,3,3,3,3,3,3)`. Thus the Ext dimensions are
`(0,0,1,0,0,0,0,0,0)`, as claimed. The class of v is a non-boundary in
degree 2. Its products by all ten basis vectors, modulo boundaries, give
exactly the right f-simple character. Both fields agree. No all-degree
Ext claim is inferred from these finite computations.

### Item 4 — PASS; status: supported

`04_trivial_extension.py` constructs the dual actions from the multiplication
coefficients of C. It checks all 8,000 associators in T and all basis triples
for associativity of the trace form. The Gram matrix of λ(ab) is
`[[0,I₁₀],[I₁₀,0]]`: it is symmetric, has rank 20, and gives the stated
starred dual basis. The radical-power dimensions are `(18,14,10,5,2,0)`.

For Ext, the script starts with the f-character and repeatedly computes
M/rM, chooses e- and f-homogeneous generators, maps the corresponding
projectives onto M, and takes the kernel with its restricted T-action.
Every cover is checked to be surjective and T-linear on all 20 basis
elements, with kernel contained in the radical of the projective. Thus
the resulting Hom differentials into s vanish. The multiplicities of
`(Te,Tf)` in degrees 0–9 are
`(0,1),(1,0),(1,0),(1,1),(2,0),(2,0),(2,1),(3,0),(3,0),(3,1)`.
The computed Ext dimensions are `(1,0,0,1,0,0,1,0,0,1)`.
All results agree in the finite-field specialisation. These computations
test the requested dimensions, not the Yoneda product or the all-degree
polynomial-algebra assertion.

### Item 5 — PASS; status: supported

`05_cochain.py` parses the coefficient rows directly from `09-cochain.tex`,
between the tabular delimiters. It reads precisely 179 four-letter entries
with 179 distinct three-letter inputs. Every entry has composable radical
inputs, the required output endpoints, and weight −1. Unlisted values are
zero. The complete T multiplication is reconstructed from the dual actions.

The Hochschild differential is computed on all 18⁴ = 104,976 radical
four-words, including incompatible corners; every output coefficient is zero
over F₂(q). Exactly 15,250 words are composable. For the boundary identity,
the script uses F₂(q,H), treats H as an independent indeterminate, and
checks the equality on all 324 radical pairs. It also checks separately
the constant and linear coefficient identities printed in the appendix.
Here `w*` switches the two copies of the ten-letter basis,
`h(w)=H^ε_w w`, and `z_H(a)=Hγ_a a` with exactly the stated support.

In the bar complex with both endpoint f-simples, the outer terms vanish.
Direct multiplication gives zero differential on
`q²[t|x|J]+[t|y|J]`. Evaluation gives `q³f`, hence the scalar `q³ ≠ 0`
on s. Both the zero entry `p(t,x,J)` and the entry `p(t,y,J)=q³f` are
checked explicitly. The exact calculations are repeated over F₂¹⁶ with
q=a and H=a⁷; both have multiplicative order 65535, and every check agrees.

## Final scope

| Item | Result | Scope |
|---|---|---|
| 1 | PASS; supported | Complete multiplication, associativity, unit, corners, radical and fourth product |
| 2 | PASS; supported, with AI-proved uniform formula | Exactness/minimality in degrees 0–8 and the symbolic all-index kernel argument above |
| 3 | PASS; supported | Ext_C(s,C) in degrees 0–8, including its right C-action |
| 4 | PASS; supported | Symmetric form on T and Ext_T(s,s) dimensions in degrees 0–9 |
| 5 | PASS; supported | Entire cochain table, cocycle, twisted boundary identities and cycle evaluation |

No requested item failed or was left unreached. The finite-field runs use
a different coefficient field and repeat the linear algebra; they share
the algebra transcription with the exact runs and are supporting evidence
only. They are not a second independent transcription or implementation.
The finite Ext computations do not certify the all-degree polynomial
Yoneda algebra, nor any later cone, lifting, or counterexample claim in
the preprint. No assertion receives human-certified status. External
historical attributions are not inputs to these computations and are not
certified by this audit.

## Reproduction and source identity

Run scripts 01–05 in order with `/usr/bin/python` (the system Sage Python),
redirecting each script's stdout and stderr to its matching `.out` file.
All five recorded runs exited with status 0. The only library dependency
is the installed SageMath; no packages were installed. The item-1 module
sets `DOT_SAGE` to its own directory before importing Sage. The generated
lazy-import cache was removed after the runs; rerunning may regenerate it.
No bytecode files are written. The repository occupied 11 MB at verification.

SHA-256 of the supplied sources read for this audit:

```text
c4da7a8976713e71ad392c2dfa451c216436f5fcf09cce609f85236abfe64208  main.tex
f3da85912c346824c1532feb9b410e169a0b520e8261ebbea2a95e8527908af5  03-algebra.tex
d19c8a962c5883d1f53d920604c137229b01c9c8370a17ca6fbfa0abbdbf2636  04-resolution.tex
838a489943b88b3501248a02d4835d09124a6b0002834de6fd380057948d340a  09-cochain.tex
```
