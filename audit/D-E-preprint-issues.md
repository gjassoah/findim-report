Model: GPT-6; effort: unknown.

# D-E source comparison and issues

This incremental record distinguishes errors, missing justifications, and convention translations. Source files are read-only. Final findings will be appended with exact locators.

## §8.6: fibre, comparison and consequences

- **No error found in the fibre comparison.** `07-branches.tex:113–130`
  treats \(a=1\) separately, using the surjection
  \((H^0)^2\to W^3\). This is required: the support assertion for
  \(W\) alone does not make the preceding term vanish in degree one.
- **No determinant exception in characteristic two.**
  `07-branches.tex:203–216` uses algebraic independence, not a
  derivative or separability argument. It covers all \(m>0\), including
  even \(m\). The general scalar determinant is a difference; here it
  is also the sum.
- **Convention translation.** Source \(A,X,U_H\) become
  \(E,S,E_\lambda\). The source bimodule has a right twist, so the
  induced left-module restriction uses the inverse automorphism;
  reversing this would change \(\lambda^{-m}\) to \(\lambda^m\).
- **No error found in the stated extra consequences.**
  `08-consequences.tex:7–79` gives the eight simple modules, non-zero
  fourth radical power, noncommutativity, and persistence under every
  field extension. The argument does not license parameter
  specialisation to a finite field.
- **Dependency boundary, not a preprint error.** The assertion that
  Theorem AR follows uses report §8.1 / job D-D. Its task statement and
  the source statement `02-conversion.tex:28–59` were read. The status
  of D-E must not be used as a replacement for completing that separate
  conversion proof.

## §§8.2–8.3: algebra, resolution and multiplicative Ext

- **No mathematical discrepancy found.** The multiplication and radical
  claims in `03-algebra.tex:12–62,80–124` agree with the independent
  polynomial certificate. The source's list of eleven compatible
  radical triples of total positive degree at most four is complete;
  an initial suspicion that it omitted triples was resolved by direct
  enumeration and is not an issue in the preprint.
- **Added assertion with proof: minimality.** Lemma `res:base` in
  `04-resolution.tex:22–104` gives the resolution and its kernels but
  does not explicitly state minimality. The dossier adds the radical
  image and superfluous-kernel argument requested for report §8.2.
- **Shift and side translation.** The non-zero group
  \(\operatorname{Ext}_C^2(s,C)\) is the *right* \(f\)-simple,
  so \(\operatorname{RHom}_C(s,C)\simeq s^{\mathrm r}[-2]\) in
  cohomological notation. Its dual is \(s[2]\), in cohomological
  degree \(-2\). These signs are consistent with
  `04-resolution.tex:114–200`; the source uses homological complexes.
- **Expanded justifications.** The dossier supplies the termwise
  finite-projective duality and the bounded-above projective-complex
  argument used for the derived triangle. The recurrence is Yoneda
  multiplication, so it proves the algebra structure, not just its
  dimensions. The \(a=1\) endpoint is handled explicitly.
- **Normalisation dependency.** The recurrence first gives a generator
  \(\eta\); identifying the supplied cocycle evaluation with a
  non-zero scalar multiple of \(\eta\) requires cocycle closedness
  and the cycle evaluation in `03-algebra.tex:189–212` and
  `09-cochain.tex:119–124`. Neither the finite Ext dimensions nor the
  two non-zero table values alone discharge that dependency.

## §8.4: tensor product, Tate degrees and two cones

- **Alternative complete argument.** For Lemma `cone:finite`
  (`05-cones.tex:142–214`) and Proposition `cone:profile`
  (`05-cones.tex:216` to the end), the dossier first takes the cone
  of \(\tau_1\), then the cone of \(\tau_2\), using both long
  exact sequences. The source uses the filtration by shifted factors
  and its Koszul row. Both calculations retain the actual top
  projection \(W^3\to H^{-1}\). No error was found in the source's
  treatment of its additional attaching map.
- **Degree translation.** Source homological cells at \(0,-2,-4\)
  become cohomological cells at \(0,2,4\); the stable shifts remain
  \(S,S[-2]^2,S[-4]\). Exactness in positive homological degrees
  becomes exactness in negative cohomological degrees. The source
  itself is consistent.
- **The Hochschild lift is a real dependency.** The abstract equality
  \(\operatorname{Ext}^*_E(S,S)=k[\tau_1,\tau_2]\) does not itself
  supply the bimodule maps needed to define the two cones. The
  dossier links their construction explicitly to the §8.5 cocycle.
- **Tate-duality citation read.** Linckelmann,
  [arXiv:1211.5999v1](https://arxiv.org/abs/1211.5999v1), §2,
  formulas (2.1), (2.3), (2.6)–(2.8) and (2.10), pp. 3–6,
  supplies the duality, shifts, and composition compatibility. These
  were read in the author's Library PDF. The negative action is the
  transpose of positive polynomial multiplication. No Toda-bracket
  assertion is used in this argument.

## §8.5: cocycle, twists and lifts

- **No mathematical error found.** The identities of Lemma `coc:data`
  (`03-algebra.tex:166–212`) and all the table recurrences in
  `09-cochain.tex` pass the new exact polynomial certificate.
  The literal independent transcription has exactly the same 179
  entries and exponents as the source table; this comparison and a
  fresh rerun are saved in `computations/08-D-E/certificate_receipt.out`.
- **Additional explicit formula.** Instead of the recursive projective
  lifting in Lemma `lift:G` (`06-lift.tex:184–224`), the dossier gives
  \(G_n([a_1|\cdots|a_n])=[a_1|\cdots|a_{n-1}]z_\lambda(a_n)\),
  using inverse-twist extension on the final coefficient. Prefix
  cancellation and the stated boundary identity prove
  \(pB=dG+Gd\) in every degree. The source's recursive argument is
  also valid; this is an alternative construction, not a correction.
- **Two distinct identities are used.** Hochschild closedness makes
  \(p\) a comparison map, while the extra boundary identity makes
  \(pB\) nullhomotopic. The latter is essential to the bimodule lift;
  the source correctly separates them at `06-lift.tex:173–182`.
- **Degree bookkeeping.** In cohomological indices, \(B\) has degree
  \(-1\), \(G\) has degree \(+1\), and \(p\) has degree \(+3\).
  The top cell of \(K[3]\) is \(P^{\mathrm{tot}}[-1]\), whereas
  each singleton cell is \(P^{\mathrm{tot}}[1]\).
- **Stable non-zero evaluation.** Lemma `lift:evaluation`
  (`06-lift.tex:253–280`) uses the symmetric trace to show that the
  left socle annihilates the radical on the right. Thus every
  projective factorisation from \(S\) to \(\Omega S\) is zero;
  the explicit value \(\lambda^2(f^*\otimes f^*)\) survives.
  No missing assumption was found in this argument.

## Reading-order limitation of this dossier job

This is a process limitation, not an issue in the preprint. Removing
`proof` environments from the initial statement extraction still exposed
some preparatory arguments outside those environments. In particular,
the twist proof in `07-branches.tex` was read before its independent
reconstruction, so the requested pre-reading attempt was not achieved
for that lemma. The dossier records this explicitly. Independent attempts
for the resolution, derived triangle, cone profile, fibre comparison,
and the two lift homotopies were recorded before their named source
proofs were opened. The new finite certificates were written from the
algebra definitions and literal cochain table before reading the earlier
computation scripts.

## Final integration assessment

The completed D-D proof was subsequently read in
`report/notes/proofs/D-D-conversion.md`, §§1–6, including its precise
comparison (1.1), module (1.2), cone identification (4.5) and exact
sequence (5.6). The characteristic-two specialisation matches D-E.
The earlier dependency warning therefore records an initial boundary;
it is not an outstanding proof gap in the final dossier.

A report-convention correction was needed during integration: a cokernel
in a nonminimal bar resolution is only stably isomorphic to a minimal
syzygy. The final §8.4.3 uses actual cokernels \(Z_j(Q)\) for the
filtration factors. For the separate map \(\beta_\lambda\), the
augmentation \(P^{\mathrm{tot},0}\to E\) is a minimal projective
cover, as shown by its isomorphism on the four-dimensional top. This
justifies the literal minimal-syzygy notation in §8.5.3. These are
precision corrections to our dossier, not demonstrated errors in the
preprint.

**Final assessment:** no mathematical error or unresolved proof gap was
found in the examined source ingredients. The final dossier assigns
AI-proved to §§8.2–8.6, using the read conversion result for the last
application. Its computations have the explicit finite scopes in the
receipt table. This does not assign human certification, a formal-proof
status, or a conclusion about other versions of the preprint. The
reading-order limitation above remains part of the record.

The final read also made one shift explicit in our alternative two-cone
argument: the second-factor comparison initially maps the first cone to
its shift by 3; it must be shifted by \([-3]\) before taking the cone
that is literally \(K\). The displayed definition and stable triangles
already had this shift. The accompanying sentence now agrees with them.
This was a correction to our exposition, not to the source theorem.
