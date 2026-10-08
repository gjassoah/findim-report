# Escalation 02: answer (Claude Fable 5.1, 2026-10-08)

status: **incomplete** — the agent stopped three times on the 64 000-token output limit (2026-10-08); only §2 was
written. The remaining questions were handed to Codex job 12 (`codex/tasks/12-one-factor-design.md`).

Untrusted input: everything below is a lead, to be checked by computation and by a second model. Statuses
follow `docs/WORKING_RULES.md` (heuristic / plausible / supported / AI-proved / refuted / open). Nothing here
is *proved*. Written in short sections; see the end for the status line.

## 1. Verdict

(placeholder, filled in at the end)

## 2. Question 1: exactly when the weight obstruction applies

Conventions. T = C ⋉ DC graded by DC-degree (C in degree 0, DC in degree 1), s inflated from C, all
structure maps of internal degree 0; δ(x) = internal degree of a homogeneous stable class x, so the
inverse-twist weight is w = δ and the restriction weight is −δ (audit/11 §1). H^a = stable Hom(s, s[a]).

**2.1 The weight of β is not a choice (AI-proved, two lines).** The symmetric form λ(a, φ) = φ(1) is
nonzero only on DC, so the duality D H^a ≅ H^{−1−a} of cone:duality pairs classes with
δ(x) + δ(x^∨) = 1 (the pairing is composition into H^{−1} = k·β₀ followed by λ, and δ(β₀) = 1: β₀ is
1 ↦ f^*). In particular β₀ ∈ H^{−1}, the trace-dual of id_s, always has δ(β₀) = 1. Any lift
U_H → N of conversion-principle type evaluates on s to a multiple of this β₀ (lift:casimir, lift:beta:
the Casimir element Σ h(w) ⊗ w^* has weight 1), so in a one-factor design of the preprint's type the
class β entering the bracket is forced to be β₀, with weight 1. Over a general symmetric graded T′ whose
form lives in degree N (λ ≠ 0 only on T′_N), the same argument gives δ(β₀) = N.

**2.2 The condition (AI-proved given the weight lemma of audit/11 §1–2).** The bracket entering the
design is c = ⟨τ′, β₀, β₀⟩ ∈ H^{|τ′|−3}. With |τ′| = 3 the target is H⁰ = k·id, of weight 0, the
indeterminacy is τ′H^{−3} + H¹β₀ = 0, and c ≠ 0 requires

    δ(τ′) + 2δ(β₀) = 0,  i.e.  δ(τ′) = −2N   (N = 1 for a trivial extension: δ(τ′) = −2).

Check on the two known cases. AR preprint: δ(τ) = −1 (one dual letter V ↦ 1), so the sum is +1 and
c = 0 (job 07). Six-dimensional T(kA₂) of audit/11 §4: δ(f) = −2, δ(β) = 1, sum 0, bracket {id}. So the
6-dimensional example is exactly the case δ(τ) = −2N: the obstruction is a statement about how many
times the degree-3 class "passes through the socle degree", not about homogeneity.

**2.3 Why the AR mechanism forces δ(τ) = −1 (AI-proved from res:polynomial).** For any C and any
s exceptional over C with RHom_C(s, C) ≅ (simple)[−d], the generator τ of Ext_T^*(s, s) = k[τ],
|τ| = d + 1, is the connecting map of the triangle s[d] → T ⊗_C R → s → s[d+1] (res:triangle), where the
s[d] lives in DC ⊗_C R, internal degree 1. Hence δ(τ) = −1 whatever C is. Consequence: **every
trivial extension whose τ arises by the AR mechanism has δ(τ) + 2δ(β₀) = +1 ≠ 0, and the one-factor
bracket vanishes.** Candidate 2 of my first answer (a smaller C) cannot repair this either.

**2.4 Powers, other β, other cones over the AR pair (T, s) (AI-proved given the weight lemma).** Put
β_m for the dual of τ^m in H^{−3m−1}; by 2.1, δ(τ^m) = −m and δ(β_m) = m + 1. The only triple brackets
with a nonzero target group are ⟨τ^a, β_i, β_j⟩ → H^{3(a−i−j−1)} and ⟨β_i, β_j, β_l⟩ → H^{−3(i+j+l+1)−1}
(degree count mod 3). In both cases the weight of the representative exceeds the weight of the target
by exactly 1 (first: −a + i + j + 2 versus −(a − i − j − 1); second: i + j + l + 3 versus i + j + l + 2).
So over the AR pair (T, s), **every** homogeneous triple Toda bracket contains 0, hence equals its
indeterminacy. This covers τ^r, cone(τ^r), every β, and job 07's ⟨β₀, β₀, β₀⟩ = {0}. Using the simple
at e instead of s does not give a polynomial Ext algebra (its corner is the quantum exterior algebra), and
a non-simple X over T is not excluded by this argument (status: open; see §5).

**2.5 Summary of Question 1.** The weight argument is correct as a conditional statement (audit/11),
it is design-dependent, and for one-factor designs of conversion-principle type the condition reduces to
the single integer δ(τ′) = −2N. It kills every design over the AR pair (T, s) and every trivial extension
in which τ arises by the AR mechanism; it does not kill symmetric algebras in which a degree-3 class
passes twice through the socle degree, which is what the proposals below arrange.

