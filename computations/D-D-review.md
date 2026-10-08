Model: GPT-6 (exact variant unknown); effort: unknown.

# Review of the D-D conversion argument

Date: 2026-10-08. Genre: supplementary mathematical review of a proof dossier;
the candidate source is not edited by this reviewer.

Scope: §§1–6 of `report/notes/proofs/D-D-conversion.md`, with binding conventions
from `audit/report-notation.md` and the statement assigned in
`codex/tasks/D-D-conversion.md`. The review seeks errors in the hypotheses,
comparison lemma, quotient, cone signs and all-degree Ext calculation.
Literature attribution and source locators are assigned to the parent agent and
are not checked here. No preprint proof under `.cache/ar-src/` has been read.

Independence disclosure: the first targeted range read began at line 29 rather
than the §1 heading and inadvertently displayed the latter part of §0 (the
initial proof-attempt skeleton). Its opening and confidence/status discussion
were not read. This therefore does not satisfy the requested exclusion of
every part of §0. No verdict from another agent is used as evidence.

This is an AI review by the same model family, not a formal or human
certificate; it alone cannot promote the result to AI-verified.

## Verdict and checked snapshot

No mathematical error or unresolved gap found in §§1–6. No correction to the
mathematical argument is requested. Result 8.1 and its auxiliary assertions
have status **AI-proved** for this review: the written general argument was
checked, with the qualifications on independence and exclusions above.

Reviewed source lines: 60–614, from the §1 heading to immediately before §7.
SHA-256 of that section range, including its terminal blank line:
`77dee9a7d41fd9d5d2c50331030893e2a14554a9ec60a2da163bc2e29d07c7d0`.

| Scope | Mathematical checking completed |
|---|---|
| §1, (1.1)–(1.4) | Quantifiers, handedness, signs, product Hom, complete-resolution definition, passage to arbitrary projective targets. |
| §2.1 | Duality, projective embeddings, prescribed coresolution, and both separate bimodule projectivity hypotheses. |
| §2.2, (2.2)–(2.3) | Extension property; all chain-map and homotopy recursions; all integer shifts; stable quotient; positive ordinary Ext; source-versus-target total acyclicity. |
| §3, (3.1)–(3.4) | Multiplication, module action, component exactness, column adjunctions, all four Hom spaces, projective-module criterion. |
| §4, (4.1)–(4.7) | Total acyclicity of columns and cone, literal finite quotient and its sign correction, structure-map injectivity, dimensions, Ext against the ring. |
| §5, (5.1)–(5.7) | Graded coordinates and differential, mixed composition, connecting-map sign, all-degree short exact sequence, boundary degree one. |
| §6 | Both non-projectivity arguments, each use of hypotheses, arbitrary characteristic, and the stated self-injective weakening. |

## Delicate points checked directly

1. **No infinite-product shortcut.** The extension and null-homotopy arguments
   in §2.2 choose components recursively in both directions from degrees zero
   and one. They require no limit operation or finite-support restriction.
   In §1 the target ring or free module is concentrated in degree zero, so
   each degree of its Hom complex has only one potentially non-zero factor.
   Finite generation therefore does justify the asserted direct-sum identity.

2. **Total acyclicity is required only of the comparison's source.** Its
   consequence used to extend maps to the right is surjectivity of
   \(\operatorname{Hom}_R(P^{n+1},L)\to
   \operatorname{Hom}_R(C^n(P),L)\) for finite projective \(L\).
   Projectivity of \(P^n\) and exactness of \(W\) handle the leftward
   lifting. The null-homotopy recursion uses these same properties in the
   same respective directions. No injectivity or total acyclicity of the
   target is silently assumed.

3. **The stable quotient computes all positive Ext groups.** In degree
   \(a>0\), the truncated resolution gives the quotient of maps
   \(C^{-a}(P)\to N\) by maps extending to \(P^{-a+1}\).
   Extension implies factorisation through this projective. A factorisation
   through another finite projective extends by the property in item 2.
   This also works at \(a=1\), without imposing an extra Ext-vanishing
   hypothesis on \(N\).

4. **Composition and shift signs.** A degree-\(a\) cocycle gives the
   chain map \(P\to W[a]\), and its Hom boundary is the chain-homotopy
   boundary with homotopy \((-1)^a h\). Under the target-shift comparison,
   its stable morphism is induced by \(f^0\). For graded composable maps,
   \((gf)^0=g^a f^0\), matching the shifted composition. In the two
   terms of (5.1), this gives precisely \(T_F(g)v\) and \(v[a]j\).
   An unsigned, separately chosen iteration of cosyzygy sequences could
   introduce a sign when comparing the two middle descriptions in (2.2);
   the candidate instead transports shifts coherently through complete
   resolutions, so this is not an error in the stated application.

5. **The prescribed module is obtained literally.** Quotienting (4.4) first
   by \(T_F(d^{-1})\) leaves the relations
   \((v_0(s),-i(s))\). The map \((t,q)\mapsto(t,-q)\) takes these
   to \((v_0(s),i(s))\) and fixes the image of the first summand.
   Thus it is an isomorphism of triples with the exact module in (1.2),
   for every permitted representative and projective embedding. This check
   does not identify an arbitrary cokernel with a minimal syzygy as an
   ordinary module.

6. **The endomorphism differential has the claimed sign.** At source degree
   \(r\), direct block multiplication gives the upper-right entry
   \[
   (-1)^n d^{r+n}_{T_FP}h^{r+1}
   +(-1)^n f^{r+n+1}j^{r+1}
   -(-1)^n T_F(g^{r+1})f^{r+1}
   +h^{r+2}d_P^{r+1}.
   \]
   This is \((-1)^n(\partial h-\boldsymbol\delta(g,j))^{r+1}\).
   Dividing by the coordinate sign \((-1)^{n+1}\) in the next degree
   gives the third component of (5.4). The lower diagonal block is
   \((-1)^{n+1}\partial j\), so the diagonal projection in (5.5)
   is a chain map. Lifting a diagonal cocycle with zero mixed component
   gives connecting map \(+\delta^a\). Consequently the cokernel in
   (5.6) is indexed by \(a-1\), as required.

7. **Hypotheses and endpoints.** The vanishing at degree one needs
   surjectivity of \(\delta^0\) and injectivity of \(\delta^1\).
   Every higher degree uses the two positive-degree hypotheses explicitly.
   Non-projectivity needs only \(\ker\delta^0\ne0\). If \(S\) is
   zero or projective, that condition cannot hold; in particular the field
   or semisimple cases do not provide a degenerate counterexample. No use
   of bimodule projectivity over \(E^e\), of minimality, or of
   characteristic two was found.

A subordinate fresh-context agent was given only the abstract assertion of
§2.2 and the conventions, without the candidate proof or preprint. Its direct
derivation of the comparison and its shift caution were examined against the
argument above. It supplies an additional same-model reading, not a different
kind of verification. No computational result from another agent was used as
evidence for this review.

The most delicate remaining point for an author to inspect is the passage
through coherent complete-resolution shifts in §2.2 and (5.2). This review
found no missing sign there; it does not certify any unexamined comparison
with an independently fixed convention in another document.
