Model: unknown; effort: unknown.

# Adversarial review of the D-E lift contribution

Scope: newly written `computations/08-D-E/lifts.md` and
`finite_cochain_certificate.py`, with source comparisons against
`.cache/ar-src/03-algebra.tex:215–229` and `06-lift.tex`. This is an
AI review record, not an independent overall certification status.

## Checkpoint before the completed contribution

The initially available note contained only its independent attempt. The
finite script was read completely. Its polynomial representation and
coefficientwise H reduction are correct: z_H supplies one H factor, so
z_H(a)h_H^{-1}(b) has H exponent 1−ε(b), always zero or one. Its coefficient
formula is therefore universal, not a test at H=0 and H=1. The other two
boundary terms have exponent one. The left side separates lower-case and
upper-case final radical letters, whose h_H factors have exponents zero and
one. All identities are over exact F₂[q,H], then hold for every invertible H
in any characteristic-two extension field. The script checks 18⁴ radical
quadruples, including every composable one, and all 18² radical pairs.
There is no inference from finitely many bar lengths in this certificate.

The complete source table has not yet been compared character-by-character
by this reviewer; the certificate's internal assertions check distinct inputs,
input composability, output corners, and weight for its own 179 entries.
The original source proof uses recursive projective lifts for G. An explicit
suffix formula, if the contribution uses it, can be checked directly:
\[
G_i([a_1|\dots|a_i])
=[a_1|\dots|a_{i-1}]z_H(a_i),\qquad G_0=0,
\]
with the required right extension by h_H^{-1}. For i≥2 the strict-prefix
terms in dG+Gd pair off, leaving in the final coefficient
\[
a_{i-1}z_H(a_i)+z_H(a_{i-1}a_i)
+z_H(a_{i-1})h_H^{-1}(a_i).
\]
This equals the suffix coefficient of pB by the finite boundary identity.
At i=0 and i=1 both sides vanish in the unaugmented bar complexes.
In particular, πG₁=z_H need not vanish: the relevant d:P₀→P_{−1}
is zero, while π is the separate augmentation. No problem was found in
this proposed all-degree formula.

## Completed contribution: final adversarial read

The completed note was read in full after the lifts agent's notification.
The direct comparison script `lifts_table_review.py` and its saved output
`lifts_table_review.out` now discharge the table-transcription point above:
all 179 input/output words, q exponents, and within-row order agree with
`09-cochain.tex:19–38`. The row cardinalities are 32,123,20,4 for
q exponents 0,1,2,3. This auxiliary script checks transcription only.

**No substantive error found in the requested proof scope.** More precisely:

- The relative-bar contraction is right linear and compatible with the
  I-balancing relation because T=I⊕rad T is an I-bimodule splitting.
  Thus the bar complex and its evaluation on s are resolutions with
  the stated projective terms.
- The suffix map p is a chain map at every index. For bar length at least
  four, the uncancelled terminal terms are the five Hochschild terms;
  length three uses the zero differential from P⁰ to P¹, and lower
  lengths have zero source for the suffix operation.
- The h⁻¹ comparison goes from the ordinary resolution to its twisted
  resolution, as required to compute the tensor functor's action on Ext.
  Its inverse eigenvalue λ⁻¹ on τ, and hence λ⁻ᵐ on τᵐ, has the
  correct direction.
- The trace-to-End identification gives aξ=ξa in the untwisted case;
  applying h only to the first factor gives h(a)ξ_λ=ξ_λa. The deleted
  idempotent term in the projected identity is a⊗r*, where r is the
  right vertex of a. The separate endpoint sum is r*, so the three
  terminal terms in dB+Bd cancel at positive bar length. At bar length
  zero the endpoint sum restores the single missing idempotent term.
- Formula (8.5.10) for G is valid with the precise right extension rule
  (8.5.7), not with the ordinary unmodified right coefficient. Its
  terminal defect is exactly (8.5.1), and its bottom two indices vanish
  in unaugmented complexes. This is an all-degree argument, not a
  finite-degree computation.
- In K[3], B⊗D_b has its values in the top Ptot[−1] cell and G⊗D_b
  in the singleton Ptot[1] cell. The only defect is D_b⊗D_b in source
  degree zero. At source degree −4, the target cokernel is
  coker(K⁻²→K⁻¹)[4]=C₁[4]=C[3], using C=C₁[1]. Thus the
  cohomological shifts and the high-cokernel construction agree.
- The top comparison has augmentation β_λ. The evaluated Casimir has
  only the terminal f term, so its value is λ²(f*⊗f*). The trace
  argument shows a left-socle element annihilates the radical also on
  the right. Therefore every projective factorization S→ΩS is zero,
  while this specific map is nonzero. This gives the required stable
  nonvanishing without a dimension-only inference.

Two precision suggestions were sent to the lifts agent and root:

1. Binding notation defines Ω by minimal covers. The note writes
   ker(Ptot,0→E)=Ω_(E^e)E. Supply the short cover argument: since
   E/rad E=k⁴, the relative bar augmentation has the same diagonal
   simple top as E, its kernel lies in rad(E^e)Ptot,0, and so it is a
   projective cover. Alternatively specify the kernel as a chosen
   syzygy representing Ω stably. After evaluation its term is E(f⊗f),
   which is the projective cover of S for the corresponding top reason.
2. The finite cocycle and boundary assertions need only characteristic
   two (and q≠0 for the nonzero cycle value), whereas the identification
   of p(s) as a polynomial generator invokes 8.3 and its infinite-order
   q hypothesis. The report's standing transcendental q supplies it.
   Making this distinction explicit avoids reading the weaker opening
   hypothesis as a general polynomial-Ext statement.

Neither suggestion is a mathematical error in the source proof. No
additional overall status promotion is assigned by this review.

## Resolution of the two precision suggestions

The revised `lifts.md` was reread at the two affected passages. Both
suggestions are resolved: the nonzero cycle paragraph now separates the
finite polynomial identities from the infinite-order q hypothesis needed
for the polynomial-generator conclusion; the lift statement now identifies
Ptot,0 as ⊕_r Er⊗rE, checks the diagonal top map to E/rad E, and
supplies the radical/Nakayama projective-cover argument. No outstanding
issue from this review remains.
