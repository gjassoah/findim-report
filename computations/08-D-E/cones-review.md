Model: unknown; effort: unknown.

# Bounded adversarial review of final dossier §8.4

Scope: only §8.4 of `report/notes/proofs/D-E-ar-ingredients.md`, as read
on 2026-10-08 after its bar-cokernel and second-factor-cone corrections.
This is a mathematical review record, not an overall status promotion.

**No error found in the successive-cone proof, all-degree support, actual
top projection, or tail shifts.**

1. With cohomological grading, Cone(P[−3]→P) has cells P and P[−2];
   the tensor square has cells Q, Q[−2]², Q[−4], whose cohomology is
   in degrees 0,2,4. Thus exactness in negative degrees is the correct
   translated assertion. At degree −N the actual cokernel factors are
   Z_N(Q), Z_(N+2)(Q)², Z_(N+4)(Q), with Z_j(Q) stably Ω_R^jE.
   The note correctly distinguishes actual bar cokernels from minimal
   syzygy modules. The exact sequence
   0→C_(N+1)→K^(−N)→C_N→0 gives
   C_(N+1)[N+1]≅C_N[N], with no sign or off-by-one discrepancy.

2. Acting by p on the second factor of the first-cone complex gives a
   map to its shift [3]. Taking the cone after shifting that map by
   [−3] produces K. Therefore its evaluated second triangle is
   Y[−3]→Y→CS→Y[−2], as stated. The ordinary tensor construction
   supplies a commuting degree-three map of the first triangle, so
   the second action commutes with both maps in its Hom exact sequence.

3. The first triangle gives exactly
   H^(a−3)→H^a→U^a→H^(a−2)→H^(a+1).
   On negative Tate groups the transpose of positive multiplication
   by τ₁ is onto, with kernel k ε_(0,m), including the endpoint
   ε_(0,0) in H^(−1). Consequently U has precisely the two disjoint
   supports U^(3m)=k x_m and U^(1−3m)=k y_m for m≥0. There is no
   extension-splitting choice hidden here because the two support
   congruence classes do not overlap.

4. Naturality then gives τ₂x_m=x_(m+1), τ₂y_m=y_(m−1) for m≥1,
   and τ₂y₀=0 since U⁴=0. The second triangle therefore gives a
   cokernel only at a=0 and a kernel only when a−2=1, namely a=3.
   This covers every integer degree, including arbitrarily negative
   degrees and the exceptional positive degree one of U.

5. In degree three, the actual second projection identifies W³ with
   U¹, and the actual first projection identifies U¹ with H^(−1).
   Their composite is π₁[1]π₂[3]=(π₁[−2]π₂)[3]=π[3]. Thus the
   claimed isomorphism concerns the specified top map, not merely a
   comparison of dimensions. The bottom-cell map likewise induces the
   degree-zero isomorphism by the two cokernel identifications.

The finite-representative argument preserves evaluation because each
relevant sequence splits on the right E-side and an E^e-projective
module evaluates to an E-projective. The tensor-square Künneth argument
uses finitely many summands in every degree, so its termwise Hom
tensor identification introduces no infinite product issue.

This review uses the Tate-duality statement and compatibility formulas
as quoted in the bounded section; it does not duplicate the source-reading
receipt for those cited locators. No new external input or computation
was needed, and the review stops at this section as requested.
