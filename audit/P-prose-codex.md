Model: unknown; effort: unknown (Codex).

# P-prose: proposals only

Scope: the existing AI-written research report, all fourteen files in `report/sections/*.tex`, and the abstract and caveat in `report/main.tex`. No venue-specific style is assumed. This is a prose audit, not a new mathematical verification. All replacements below are **proposals**; mathematical content quoted or rephrased retains its source status and receives no new certification. No report source is edited.

Rules: **S** = `MATHEMATICAL_WRITING_STYLE.md` (read in full); **P** = `AI_WRITING_PROCESS.md` (read in full). Section numbers refer to those files. Quotations join source lines with spaces; ellipses delimit excerpts, not text to insert. A replacement applies only to the quoted words unless a whole sentence or range is expressly identified. Labels, citation keys, mathematical formulas and repository filenames are not renamed. Where rows concern overlapping passages, use the fuller replacement once.

Status: complete, proposals only. Every requested source file was read in full; the named terminology was then searched across line breaks and checked in context. All proposals await the author's decision. No mathematical statements, source files, proof statuses or disclosure records were changed. No build or new mathematical verification was performed.

## report/main.tex

| File:line | Current text (short quotation) | Proposed replacement | Rule |
|---|---|---|---|
| report/main.tex:192–193 | `one realises a selection functor on modules over a finitely presented algebra` | `one realises an exact tensor endofunctor on finite-dimensional modules over a finitely presented algebra` | S §§10.1, 11.1: undefined local name in the abstract; describe the functor. |
| report/main.tex:194–195 | `from stable data over a symmetric algebra` | `from a bimodule and a morphism in the stable module category of a symmetric algebra` | S §§8.5–8.6: compressed, unspecified “data”; name the objects. |

The caveat (204–210) is concise and necessary; retain it. The explicit lack of human verification is not stylistic hedging (P §§3, 6.3). Retain the abstract's attribution and scope; no cut to a mathematical conclusion is proposed.

## report/sections/01-introduction.tex

| File:line | Current text (short quotation) | Proposed replacement | Rule |
|---|---|---|---|
| report/sections/01-introduction.tex:17–22 | `in a common framework ... isolates the mechanisms ... It is not a rewrite ...` | `This article reconstructs both constructions with complete proofs, organised around general statements, some more general than the applications require. It also gives criteria and obstructions that explain the choices in the constructions.` Keep the following sentences on AI review unchanged. | S §§2, 8.2, 15: “framework”, “mechanisms”, and the defensive comparison obscure the concrete contribution. |
| report/sections/01-introduction.tex:28–30 | `The main construction has three layers. A \emph{selection functor} $H=\Psi\otimes_R-$` | Delete the first sentence; begin `An exact tensor endofunctor $H=\Psi\otimes_R-$`. | S §§8.1, 9, 10.1, 15: announcement and metaphorical “layers”; use the mathematical description. |
| report/sections/01-introduction.tex:34 | `Finally, $P$ is simulated` | `The complex $P$ is simulated` | S §13: the order is already given by the construction; name the object instead of a sequencing connective. |
| report/sections/01-introduction.tex:42 | `be selection data over a field` | `satisfy \Cref{def:selection-data} over a field` | S §10.1: replace the coined name by the defining reference; retain every hypothesis. |
| report/sections/01-introduction.tex:48–54 | `Selection data with unbounded extinction exist: ... provides them ... The selection data must be infinite-dimensional in an essential way` | `The complex group algebra of a finitely presented group with independent central involutions shifted by an automorphism gives a pair $(R,\Psi)$ with unbounded extinction (\Cref{thm:selection-unbounded}), and hence the counterexample of the main preprint (\Cref{coro:main}). For any such pair, the rank functions on finite-dimensional modules must span an infinite-dimensional space`. Retain the reference and exclusion list that follow. | S §§8.4, 8.6, 10.1, 15: unspecified “essential way” and local terminology; state the actual necessity once. |
| report/sections/01-introduction.tex:63–64 | `while its odd double does` | `while $U\oplus U[3]$ does` | S §§10.1, 12.1: an invented name adds no information to the explicit object just given. |
| report/sections/01-introduction.tex:68 | `The Auslander--Reiten route` | `The counterexample to the Auslander--Reiten conjecture` | S §§10.1, 11.2: project shorthand in a heading. |
| report/sections/01-introduction.tex:70–71 | `rests on a conversion principle, proved here over an arbitrary field` | `uses the following result over an arbitrary field` | S §§8.5, 10.5, 15: inflated label for a theorem. |
| report/sections/01-introduction.tex:77–78 | `The ingredients are a ten-dimensional algebra $C$` | `The construction uses a ten-dimensional algebra $C$` | S §§2, 8.5: replace the recipe metaphor by the mathematical action. |
| report/sections/01-introduction.tex:93–95 | `simple witnesses of this failure ... an Auslander--Reiten counterexample` | `simple modules witnessing this failure ... a counterexample to the Auslander--Reiten conjecture` | S §§8.6, 10.1; author's explicit example: name the module and the conjecture. |
| report/sections/01-introduction.tex:98–100 | `so that witnesses must grow; the last statement holds for trivial extensions of algebras of finite global dimension` | `where the assertion about extinction times is for trivial extensions of algebras of finite global dimension` | S §§4.4, 8.7, 15: “witnesses must grow” repeats the bound as a slogan; replace ambiguous “last statement” while retaining its scope. |
| report/sections/01-introduction.tex:100 | `For the Auslander--Reiten route` | `For the construction of the counterexample to the Auslander--Reiten conjecture` | S §§8.6, 10.1: informal route label. |
| report/sections/01-introduction.tex:113–114 | `selection data and the group` | `the pair $(R,\Psi)$ and the group $G$` | S §§10.1, 12.1: name the defined objects. |
| report/sections/01-introduction.tex:115 | `The Auslander--Reiten route occupies` | `The counterexample to the Auslander--Reiten conjecture is constructed in` | S §§8.5, 10.1: state what the sections construct. |

## report/sections/02-preliminaries.tex

| File:line | Current text (short quotation) | Proposed replacement | Rule |
|---|---|---|---|
| report/sections/02-preliminaries.tex:7–8 | `although the algebras of selection data in \Cref{sec:selection} need not be` | `although the algebra $R$ in \Cref{sec:selection} need not be` | S §§8.6, 10.1: remove the local noun stack; retain the exception. |

The explanations of Tate duality, Toda-bracket conventions and the trivial extension fix conventions used later; they are not flagged as explanations of the obvious.

## report/sections/03-criteria.tex

| File:line | Current text (short quotation) | Proposed replacement | Rule |
|---|---|---|---|
| report/sections/03-criteria.tex:4–8 | `This section collects ... both mechanisms ... All of them are elementary ... We begin ...` | `Both constructions use a module with prescribed homological behaviour. The following dimension-shifting argument produces modules of every finite projective dimension.` | S §§2, 8.1, 9, 15: section announcement, vague mechanism and evaluative “elementary”. |
| report/sections/03-criteria.tex:40 | `Strong Nakayama failure` | `The strong Nakayama conjecture` | S §§8.6, 11.2: compressed verdict used as a heading. |
| report/sections/03-criteria.tex:43–47 | `the source of the explicit witnesses ... Its mechanism is classical ... We record` | `The following argument shows that finiteness of the finitistic dimension of $A^{\op}$ implies the strong Nakayama conjecture for $A$~\cite[Section~3.2, Proposition~5]{CB19}; it also gives the exact projective dimensions of the modules constructed.` | S §§8.1–8.2, 15: redundant framing and metaphor; retain attribution and the additional information. |
| report/sections/03-criteria.tex:82 | `The projective-dimension conclusion` | `The conclusion about projective dimension` | S §8.5: unnecessary compound noun. |
| report/sections/03-criteria.tex:88–89 | `have projective dimension one at the start, and the condition can be read on $C_1$ alone` | `The hypothesis on $E$ in \Cref{thm:strong-nakayama} can be expressed in terms of $C_1$, which has projective dimension one.` | S §§4.4, 8.6: vague “at the start” and “the condition”; identify the hypothesis. |
| report/sections/03-criteria.tex:137 | `Auslander--Reiten counterexamples` | `Counterexamples to the Auslander--Reiten conjecture` | Author's explicit example; S §§10.1, 11.2. |
| report/sections/03-criteria.tex:195–196 | `simple witnesses of strong Nakayama failure` | `simple modules witnessing failure of the strong Nakayama conjecture` | S §§8.5–8.6: compressed noun stack. |
| report/sections/03-criteria.tex:253 | `Gluing and dimension` | `Triangular matrix algebras and bounds on projective dimension` | S §11.2: name the objects and the dimension being discussed. |
| report/sections/03-criteria.tex:256 | `produce strong Nakayama failure` | `produce a counterexample to the strong Nakayama conjecture` | S §§8.6, 10.1: shorthand for failure of a conjecture. |
| report/sections/03-criteria.tex:287 | `Finally, finite projective dimensions` | `Finite projective dimensions` | S §13: no concluding inference; this starts a separate result. |
| report/sections/03-criteria.tex:320–323 | `of a witness of strong Nakayama failure ... cannot be witnesses by themselves` | `of a module $E$ as in \Cref{thm:strong-nakayama} ... cannot themselves satisfy the hypothesis of that theorem` | S §§4.4, 8.6: say what is witnessed, without the metaphor “by themselves”. |

## report/sections/04-trivial-extensions.tex

| File:line | Current text (short quotation) | Proposed replacement | Rule |
|---|---|---|---|
| report/sections/04-trivial-extensions.tex:9–10 | `This section shows that projective dimensions of inflated $A$-modules are governed by the iterates of $\Phi$:` | Delete this lead-in and begin `For an inflated $A$-module $N$, $\Phi^rN\not\simeq0$ forces ...`. | S §§8.1, 9, 15: announcement and vague “governed by” immediately followed by its content. |
| report/sections/04-trivial-extensions.tex:16–17 | `without flatness hypotheses on~$X$` | `without assuming that $X$ is flat on either side` | S §8.6: state the absent hypothesis about its object. |
| report/sections/04-trivial-extensions.tex:17–20 | `Under the same hypothesis ... the section ends with two constraints ...` | Delete this roadmap sentence; the two assertions and their proofs remain in the subsection at 259–325. | S §§8.7, 9, 11.8, 15: an extra announcement of the subsection's contents. |
| report/sections/04-trivial-extensions.tex:270–276 | `although $\Phi^rN$ may be nonzero: a module ... invisible in the Grothendieck group ... this is the role of the odd double` | End the first sentence after `although $\Phi^rN$ may be nonzero.` Keep the application and its displayed object; replace the last clause by `as in \Cref{prop:odd-double}`. | S §§8.7, 10.1, 15: repeat explanation, visibility metaphor and unnecessary name for the direct sum. |
| report/sections/04-trivial-extensions.tex:327–330 | `By \Cref{prop:bounded-extinction} ... This is consistent with ...` | `Compare \Cref{prop:bounded-dimension}, which bounds finite projective dimensions on modules of bounded dimension.` | S §§8.7, 9: retain the useful comparison without repeating the result just established. |

## report/sections/05-selection.tex

| File:line | Current text (short quotation) | Proposed replacement | Rule |
|---|---|---|---|
| report/sections/05-selection.tex:1 | `Selection data` | `Tensor endofunctors` | S §§10.1, 11.2: the general definition does not describe a selection operation. |
| report/sections/05-selection.tex:4–10 | `The main construction starts ... This section fixes ... shows ... constructs ...` | `The main construction uses an exact tensor endofunctor on finite-dimensional modules whose finite extinction times are unbounded. The example in~\cite[Section~2]{OAI26findim} is defined over the complex group algebra of a finitely presented group.` | S §§8.1, 9, 11.8, 15: replace the section itinerary by its mathematical purpose and example. |
| report/sections/05-selection.tex:12 | `Selection data and extinction` | `Extinction times` | S §§10.1, 11.2: remove the coined name and repetition of the section title. |
| report/sections/05-selection.tex:17–20 | `\emph{Selection data} over $\kk$ consist of a ...` | `Let $R$ be a $\kk$-algebra and $\Psi$ an $R$-bimodule on which the two actions of $\kk$ agree and which is finitely generated and projective as a right $R$-module.` Retain the opening `Let $\kk$ be a field.` | S §10.1: describe the pair without giving a general algebra–bimodule pair an artificial name. |
| report/sections/05-selection.tex:20–22 | `The \emph{selection functor} is $H=...$` | `Put $H=...$.` Keep the complete displayed domain and codomain. | S §§10.1, 12.1: use $H$ or “tensor endofunctor” thereafter; no second name is needed. |
| report/sections/05-selection.tex:24–26 | `The selection data have \emph{unbounded extinction} if ...` | `We say that $(R,\Psi)$ has \emph{unbounded extinction} if ...` | S §10.1: retain the defined property and its full condition; remove only the name for the pair. |
| report/sections/05-selection.tex:32–34 | `A module of extinction time $t$ satisfies ...` | Delete this sentence. Retain `Iterates of $H$ are written $H^t$, with $H^0$ the identity.` | S §8.7: repeats the immediately preceding least-time definition and preservation of zero. |
| report/sections/05-selection.tex:48–50 | `Selection data with unbounded extinction must detect infinitely many independent numerical invariants ... To make this precise` | Begin `Let $K_0(R^{\op})$ be ...`; omit the two lead-in clauses. | S §§8.1, 8.7, 15: vague anticipation of the proposition, with an announcement of precision. |
| report/sections/05-selection.tex:73–76 | `The \emph{visible rank} of the selection data is the dimension of the subspace` | `Put` before the existing display defining $\mathcal V$. Use `$\dim_{\mathbb Q}\mathcal V$` in subsequent occurrences. | S §10.1: “visible” supplies a metaphor rather than a mathematical description; existing notation suffices. |
| report/sections/05-selection.tex:81 | `Let $(R,\Psi)$ be selection data of finite visible rank $r$.` | `Let $(R,\Psi)$ satisfy \Cref{def:selection-data}, and suppose that $r=\dim_{\mathbb Q}\mathcal V<\infty$.` | S §§8.6, 10.1: state the finiteness assumption about the defined vector space. |
| report/sections/05-selection.tex:113–114 | `Selection data $(R,\Psi)$ over $\kk$ have bounded extinction in each of the following cases.` | `Let $(R,\Psi)$ satisfy \Cref{def:selection-data} over $\kk$. Its finite extinction times are bounded in each of the following cases.` | S §§8.6, 10.1: avoid both the pair name and an undefined abbreviation that could include infinite extinction times. |
| report/sections/05-selection.tex:168–172 | `the argument bounds the image ... component ranks ... the visible rank is infinite ...` | `In case~\eqref{it:rank-noetherian}, the argument bounds the dimension of the image of $\chi$ by the number of connected components, without requiring $K_0(R)$ to have finite rank. In the example below, $\mathcal V$ is infinite-dimensional; see \Cref{rem:selection-visible-rank}.` | S §§8.5–8.7, 10.1: noun stack and local name; keep the nontrivial distinction concerning $K_0$. |
| report/sections/05-selection.tex:239–240 | `the torus elements commute` | `the elements $T_1,T_2,T_3$ commute` | S §§10.1, 12.1: “torus” has not been defined for this abstract group. |
| report/sections/05-selection.tex:266–267 | `For instance, for $n=(s-r)...$ we have ...` | Delete this illustrative sentence, retaining the following verification of the third weight. | S §§2, 8.7: substitutes coordinates into already stated linear forms; the third-weight check does add information. |
| report/sections/05-selection.tex:338–339 | `Hence $\beta_c$` | `Hence, $\beta_c$` | S §6.3: missing comma after a sentence-initial connective. |
| report/sections/05-selection.tex:424–428 | `By the argument ... every group ... The matrix shape of $G$ provides ...` | `The group $G$ is finitely presented, has an automorphism shifting the independent central involutions, and has finite quotients $F_m$ separating every finite subfamily of them.` | S §§8.7, 9, 15: remove the restatement of the corollary and undefined “matrix shape”; retain the useful conjunction of properties. |
| report/sections/05-selection.tex:430 | `Selection data with unbounded extinction` | `A tensor endofunctor with unbounded extinction` | S §§10.1, 11.2: descriptive heading. |
| report/sections/05-selection.tex:443–444 | `let $H$ be the selection functor of $\Psi={}_\alpha(eR)$` | `put $\Psi={}_\alpha(eR)$ and $H=\Psi\otimes_R-$` | S §§10.1, 12.1: replace the local name by its formula. |
| report/sections/05-selection.tex:466–467 | `The pair $(R,\Psi)$ is selection data over $\mathbb{C}$ with $R$ finitely presented.` | `The pair $(R,\Psi)$ satisfies \Cref{def:selection-data} over $\mathbb{C}$, and $R$ is finitely presented.` | S §10.1: consistent removal of the defined name, with unchanged assertion. |
| report/sections/05-selection.tex:477 | `the evident homomorphism` | `the homomorphism` | S §10.3: “evident” adds nothing; the maps are specified in the same sentence. |
| report/sections/05-selection.tex:482–483 | `so $(R,\Psi)$ is selection data, by` | `so $(R,\Psi)$ satisfies \Cref{def:selection-data}, by` | S §10.1: consistent replacement; retain the example reference. |
| report/sections/05-selection.tex:513 | `the visible rank of $(R,\Psi)$ is infinite` | `$\mathcal V$ is infinite-dimensional` | S §10.1: replace the coined term by the existing vector space. |
| report/sections/05-selection.tex:515 | `this description is not needed` | Delete this clause and end the preceding sentence after `$[F_m:Z_m]$`. | S §§2, 15: commentary on the usefulness of a sentence the article has just included. |
| report/sections/05-selection.tex:516–519 | `a sign pattern of the central involutions ... fixed once and for all, which is what the passage ... requires` | `the values of $\chi_m$ on the central involutions; $R$, $e$ and $\alpha$ are independent of $m$, as required in \Cref{sec:simulation}` | S §§8.2, 8.6: name the character values and the actual independence, retaining the necessary quantifier distinction. |

## report/sections/06-realisation.tex

| File:line | Current text (short quotation) | Proposed replacement | Rule |
|---|---|---|---|
| report/sections/06-realisation.tex:1 | `Bimodule complexes from selection data` | `Bimodule complexes and tensor endofunctors` | S §§10.1, 11.2: replace the local name. |
| report/sections/06-realisation.tex:4–7 | `This section turns selection data ... Let $(R,\Psi)$ be selection data in the sense of ...` | Delete the announcement; begin `Let $(R,\Psi)$ satisfy \Cref{def:selection-data}, with $R$ finitely presented, and put $H=\Psi\otimes_R-$.` | S §§8.1, 9, 10.1: the following theorem summary already states the construction. |
| report/sections/06-realisation.tex:9 | `and one bounded complex $P$` | `and a bounded complex $P$` | S §8.4: the shared choice is already expressed by the order of quantifiers and later discussed. |
| report/sections/06-realisation.tex:16 | `is read off from a presentation` | `is constructed from a presentation` | S §8.5: name the action without conversational shorthand. |
| report/sections/06-realisation.tex:20 | `The bimodule $\Psi$ cuts out a direct summand` | `The bimodule $\Psi$ determines a direct summand` | S §§2, 8.5: unnecessary metaphor. |
| report/sections/06-realisation.tex:33 | `makes non-explicit choices` | `uses choices that are not made explicit` | S §§7.2, 8.5: avoid an awkward compressed adjective. |
| report/sections/06-realisation.tex:104 | `The encoding algebra` | `The algebra \texorpdfstring{$B$}{B}` | S §§10.1, 11.2: the formula and fixed notation suffice. |
| report/sections/06-realisation.tex:139–140 | `The \emph{encoding algebra} of the presentation is $B=\kk Q/(J_2)$, with` | `Put $B=\kk Q/(J_2)$, with` | S §10.1: dispense with a metaphorical name; retain its dependence on the presentation. |
| report/sections/06-realisation.tex:146–150 | `It forgets the multiplication of $R$ and records only ...` | `Its defining relations span $J_2$. In the quotient category of \Cref{subsec:action}, $s$ and $s'$ become invertible and $x_h$ acts as $s^{-1}a_h$.` Retain `The algebra $B$ depends on the presentation.` | S §§2, 8.6, 15: anthropomorphic “forgets/records” is less informative than the relation space and action. |
| report/sections/06-realisation.tex:285–287 | `No identification ... is needed here or later, and none is claimed` | `The argument uses the action $\theta$ and the evaluation functors; it does not require an identification of $\mathcal Q$ with a derived category of $R$.` | S §§8.2, 15: retain the substantive limitation without the repeated disclaimer. |
| report/sections/06-realisation.tex:289 | `The odd double` | `Direct sums with odd shifts` | S §§10.1, 11.2: “double” does not specify the shift and is not needed as a new name. |
| report/sections/06-realisation.tex:381–383 | `The class $[V]=0$ lives in ... does not by itself say anything about classes in other categories. The cancellation ... reappears, however` | `The equality $[V]=0$ is in $K_0(\mathcal T)$. Cancellation between summands with shifts of opposite parity also occurs` | S §§8.2, 8.7, 13: retain which group contains the class; remove the obvious warning about other unspecified categories and the rhetorical “however”. |
| report/sections/06-realisation.tex:391 | `If the selection diagram were built on` | `If the diagram of \Cref{cons:diagram-V} were defined using` | S §§10.1, 12.1: term used before its introduction; provide the defining reference. |
| report/sections/06-realisation.tex:393 | `would sit in degrees` | `would be in degrees` | S §2: informal spatial metaphor. |
| report/sections/06-realisation.tex:402–404 | `We now apply ... to selection data. Recall from ...` | `For the pair $(R,\Psi)$ of \Cref{def:selection-data}, $\Psi$ is finitely generated and projective as a right $R$-module, and $H=\Psi\otimes_R-$.` | S §§8.1, 10.1: omit the announcement; retain the recalled hypothesis needed for the lemma. |
| report/sections/06-realisation.tex:411 | `Let $(R,\Psi)$ be selection data.` | `Let $(R,\Psi)$ satisfy \Cref{def:selection-data}.` | S §10.1: remove the local name consistently. |
| report/sections/06-realisation.tex:449 | `since endomorphisms of a direct sum compose as matrices` | Delete this clause, ending the sentence at the display. | S §8.7: explains standard matrix composition immediately after its formula. |
| report/sections/06-realisation.tex:475–477 | `The \emph{selection diagram} $\mathbb{V}$ is the $B$-diagram` | `Let $\mathbb{V}$ be the $B$-diagram` | S §10.1: use the notation already assigned; “selection” does not describe the diagram's structure. |
| report/sections/06-realisation.tex:484–486 | `The remaining steps reverse this: they lift ...` | `We lift $\mathbb{V}$ to $\mathcal{K}$ and replace the lift by a complex of bimodules.` | S §§8.1, 15: state the action directly. |
| report/sections/06-realisation.tex:512 | `Lifting the selection diagram` | `Lifts of \texorpdfstring{$\mathbb{V}$}{V}` | S §§10.1, 11.2: noun phrase naming the objects, without the coined diagram name. |
| report/sections/06-realisation.tex:569–570 | `chosen once, from the selection diagram` | `chosen from $\mathbb V$` | S §§8.2, 10.1: the following clause already states independence of $Y$. |
| report/sections/06-realisation.tex:580 | `makes existential choices at four points` | `uses choices not given by explicit formulas at four points` | S §§8.5–8.6: “existential choices” is procedural jargon; preserve the computational limitation. |
| report/sections/06-realisation.tex:583–584 | `the denominator $v$ annihilating the relation errors` | `the denominator $v$ for which $g_\rho v=0$ for every $\rho\in\mathcal R$` | S §§8.6, 12.1: replace “relation errors” by the already defined maps and equation. |
| report/sections/06-realisation.tex:592–594 | `The argument thus yields a complex of unspecified length, and the integer $l$ ... is not determined by it.` | `The argument therefore does not determine the integer $l$ used in \Cref{sec:simulation}.` | S §§8.7, 9: retain the consequence for $l$ without repeating the preceding lack of a length bound. Keep the next sentence distinguishing absence of a bound from nonexistence of an algorithm. |
| report/sections/06-realisation.tex:738–740 | `no coherence data beyond ... this is where the absence ... enters` | `no homotopies beyond $h_\rho$ are required` | S §§8.6–8.7, 15: name the required objects; the preceding clause already gives the reason. |
| report/sections/06-realisation.tex:747–749 | `be selection data ... the encoding algebra and the functor` | `satisfy \Cref{def:selection-data} ... the algebra and the functor` | S §10.1: remove both artificial names; retain the field, finite presentation and construction reference. |
| report/sections/06-realisation.tex:784 | `since a $B$-module is determined by its vertex spaces and arrow actions` | Delete this clause; end the preceding display as a sentence. | S §8.7: the sentence before the display already gives the needed compatibility with every arrow. |

The four-step roadmap and the proof's explicit sign and homotopy calculations are retained: they explain dependencies that a specialist could miss (S §§10.6–10.7, 11.8).

## report/sections/07-simulation.tex

| File:line | Current text (short quotation) | Proposed replacement | Rule |
|---|---|---|---|
| report/sections/07-simulation.tex:1 | `Simulation and the main theorem` | `Trivial extensions from bimodule complexes` | S §11.2: name the construction's objects, rather than a process and a result's place in the article. |
| report/sections/07-simulation.tex:5 | `iterates the selection functor` | `realises the iterates of $H=\Psi\otimes_R-$ as in \Cref{coro:realisation-iterates}` | S §§8.6, 10.1: the complex does not literally induce $H$; the existing reference specifies the direct sums and shifts. |
| report/sections/07-simulation.tex:6–9 | `This section bridges the two: ... Combining the three steps gives the main theorem.` | `A bounded complex of bimodules is simulated, up to a shift, by the square of the derived tensor functor of an ordinary bimodule over a larger algebra.` | S §§8.1, 9, 15: remove bridge metaphor and redundant announcement of the theorem. |
| report/sections/07-simulation.tex:11 | `Simulation of a bimodule complex` | `An ordinary bimodule associated with a complex` | S §11.2: heading naming the object. |
| report/sections/07-simulation.tex:107–112 | `The simulation trades ... stores ... The cost is ...` | `The vertices of $K_l$ correspond to the degrees of $P$, the arrows act on $O$ by the differential of $P$, and $Y\Lotimes[B_1]O\cong P[b]$. The construction uses $l+2$ copies of $B$; the resulting number of simple modules and the bounds on global dimension grow linearly with $l$.` | S §§2, 8.5, 15: replace trading/storage/cost metaphors by the stated correspondences. Say “bounds” to match the proposition, without asserting equality for global dimension. |
| report/sections/07-simulation.tex:119 | `be selection data over a field $\kk$` | `satisfy \Cref{def:selection-data} over a field $\kk$` | S §10.1: consistent removal of the name. |
| report/sections/07-simulation.tex:133–134 | `the encoding algebra $B$` | `the algebra $B$` | S §10.1: the construction reference already identifies it. |
| report/sections/07-simulation.tex:161–163 | `The order of the choices matters ... A separate complex ... would not give a counterexample.` | Delete this paragraph; retain the explicit independence of the choices from $Y$ in the proof at 140–141. | S §§8.7, 9, 15: repeats the same quantifier warning immediately after the proof. |
| report/sections/07-simulation.tex:176 | `to the selection data of` | `to the pair $(R,\Psi)$ of` | S §10.1: use the notation. |
| report/sections/07-simulation.tex:179 | `The encoding algebra $B$` | `The algebra $B$` | S §10.1: consistent name removal. |
| report/sections/07-simulation.tex:186–191 | `Every step ... except one. ... The exception is the input ...` | Delete only `Every step of the construction is explicit except one.` Keep the detailed list and the sentence identifying the exception. | S §§8.7, 9: generic opening repeated by the detailed sentences. |
| report/sections/07-simulation.tex:187 | `the selection data` | `the pair $(R,\Psi)$` | S §10.1. |
| report/sections/07-simulation.tex:188 | `the encoding algebra $B$` | `the algebra $B$` | S §10.1. |
| report/sections/07-simulation.tex:198–203 | `The encoding algebra itself is large but explicit: applying the quadraticisation of ...` | Replace the sentence beginning `The encoding algebra` by: `Applying the procedure of \Cref{subsec:encoding} to the chosen presentation of $\mathbb{C}G$ introduces auxiliary generators for the relators of degree larger than two, in addition to the thirty symbols for the fifteen generators of $G$ and their inverses. For a resulting presentation with $d$ generators, $B$ has $2(d+1)$ arrows.` | S §§8.4–8.6, 10.1: replace evaluative “large” and compressed “quadraticisation”; retain the generator and arrow counts. |
| report/sections/07-simulation.tex:209 | `by a directed-vertex argument` | `using the ordering of the vertices` | S §§8.5–8.6: unnecessary coined compound; retain the cited locator. |

## report/sections/08-conversion.tex

| File:line | Current text (short quotation) | Proposed replacement | Rule |
|---|---|---|---|
| report/sections/08-conversion.tex:1 | `The conversion principle` | `Tate cohomology and the Auslander--Reiten conjecture` | S §§10.5, 11.2: name the mathematical subject rather than an informal principle. |
| report/sections/08-conversion.tex:4–9 | Repeated definition of the conjecture, ending `a counterexample yields an algebra of infinite little finitistic dimension` | `By \Cref{thm:ar-to-findim}, a counterexample to the Auslander--Reiten conjecture yields an algebra of infinite little finitistic dimension.` Then continue with the preprint sentence. | S §§8.7, 10.10: the conjecture is already defined at 03:140–142; retain the useful dependency. |
| report/sections/08-conversion.tex:8–9 | `The Auslander--Reiten preprint~\cite{OAI26ar}` | `The preprint~\cite{OAI26ar}` | S §§8.6, 10.1: the citation identifies the work; the shortened name could suggest authorship by Auslander and Reiten. |
| report/sections/08-conversion.tex:11–14 | `This section proves the principle behind that construction ... The principle reduces` | `\Cref{thm:conversion} gives this construction over an arbitrary field; the preprint treats characteristic two, in which the signs disappear. The theorem reduces` | S §§8.1–8.2, 10.5, 15: announcement and vague “principle”; retain the characteristic distinction. |
| report/sections/08-conversion.tex:59 | `Moreover $\operatorname{Ext}` | `Moreover, $\operatorname{Ext}` | S §6.3. |
| report/sections/08-conversion.tex:132–133 | `In particular $F\otimes_E-$` | `In particular, $F\otimes_E-$` | S §6.3. |
| report/sections/08-conversion.tex:199 | `The conversion theorem` | `A module with no positive self-extensions` | S §§10.5, 11.2: replace the informal theorem name by the object constructed. |
| report/sections/08-conversion.tex:263 | `Hence $Z$` | `Hence, $Z$` | S §6.3. |
| report/sections/08-conversion.tex:294 | `Hence $\partial` | `Hence, $\partial` | S §6.3. |
| report/sections/08-conversion.tex:328 | `and it locates the obstructions:` | `In particular,` (start a new sentence before `if $\delta^1$ ...`). | S §§8.5–8.6, 15: state the exact consequence rather than announcing its interpretive role. |
| report/sections/08-conversion.tex:329–330 | `A construction by the conversion principle` | `An application of \Cref{thm:conversion}` | S §§10.1, 10.5: reference the result. |
| report/sections/08-conversion.tex:335–336 | `is a single line. The bimodule ... achieves this with` | `is one-dimensional. The bimodule ... is obtained as` | S §§8.4–8.5, 15: unnecessary emphasis and achievement language. |

## report/sections/09-ar-counterexample.tex

| File:line | Current text (short quotation) | Proposed replacement | Rule |
|---|---|---|---|
| report/sections/09-ar-counterexample.tex:1 | `An Auslander--Reiten counterexample` | `A counterexample to the Auslander--Reiten conjecture` | Author's explicit example; S §§10.1, 11.2. |
| report/sections/09-ar-counterexample.tex:4–6 | `This section constructs the data ... following the Auslander--Reiten preprint ...` | `Following~\cite{OAI26ar}, we construct a bimodule and a stable morphism satisfying the hypotheses of \Cref{thm:conversion}, and deduce a second algebra of infinite little finitistic dimension, with nine simple modules.` | S §§8.1, 8.6, 9: start with the mathematical action and name the data; avoid the shortened preprint name. |
| report/sections/09-ar-counterexample.tex:12–13 | `The construction has four layers: a ten-dimensional algebra $C$` | `The construction uses a ten-dimensional algebra $C$` (continue the existing list). | S §§8.1, 15: remove the layer metaphor without deleting the useful roadmap. |
| report/sections/09-ar-counterexample.tex:13–14 | `whose resolution is periodic up to a parameter` | `whose resolution has differentials depending on successive powers of $q$` | S §§8.6, 10.1: “periodic up to a parameter” is not a defined form of periodicity; describe the displayed resolution. |
| report/sections/09-ar-counterexample.tex:89 | `Consequently` | `Consequently,` | S §6.3. |
| report/sections/09-ar-counterexample.tex:108 | `the self-extensions follow` | `the asserted vanishing of self-extensions follows` | S §8.6: an object is used as shorthand for an assertion about it. |
| report/sections/09-ar-counterexample.tex:124 | `Hence the only cohomology` | `Hence, the only cohomology` | S §6.3. |
| report/sections/09-ar-counterexample.tex:134–135 | `not an Auslander--Reiten counterexample over $C$` | `not a counterexample to the Auslander--Reiten conjecture over $C$` | Author's explicit example; S §10.1. |
| report/sections/09-ar-counterexample.tex:135–136 | `the next step trades this behaviour for a polynomial Ext algebra` | `over $T=C\ltimes DC$, its Ext algebra is polynomial on a generator of degree three (\Cref{thm:T-ext})` | S §§8.1, 8.6, 15: replace the trading metaphor and announcement with the precise comparison already established later. |
| report/sections/09-ar-counterexample.tex:165 | `Moreover $s$` | `Moreover, $s$` | S §6.3. |
| report/sections/09-ar-counterexample.tex:173 | `Hence` | `Hence,` | S §6.3. |
| report/sections/09-ar-counterexample.tex:203 | `Hence` | `Hence,` | S §6.3. |
| report/sections/09-ar-counterexample.tex:273–274 | `Statement~\eqref{it:weight} is also visible in the table.` | Delete this sentence. | S §§8.7, 9: the preceding sentence already says the assertions were checked on all inputs; “visible” supplies no further check or reason. |
| report/sections/09-ar-counterexample.tex:303 | `Hence $\tau\neq0$` | `Hence, $\tau\neq0$` | S §6.3. |
| report/sections/09-ar-counterexample.tex:327 | `Hence the functor` | `Hence, the functor` | S §6.3. |
| report/sections/09-ar-counterexample.tex:345 | `Moreover $S$` | `Moreover, $S$` | S §6.3. |
| report/sections/09-ar-counterexample.tex:396 | `The two-cone bimodule` | `The bimodule \texorpdfstring{$\mathcal{C}$}{C}` | S §§10.1, 11.2: the construction uses a tensor product of cones and subsequent cokernels and shifts; the compound is a local label. |
| report/sections/09-ar-counterexample.tex:407–408 | `a filtration by the four cells` | `a filtration with four subquotients` | S §§8.6, 10.1: use the mathematical role of these complexes, not an undeclared cellular analogy. |
| report/sections/09-ar-counterexample.tex:443 | `Hence $C_N$` | `Hence, $C_N$` | S §6.3. |
| report/sections/09-ar-counterexample.tex:457 | `Hence $\mathcal{C}$` | `Hence, $\mathcal{C}$` | S §6.3. |
| report/sections/09-ar-counterexample.tex:497–498 | `The second-factor action of $\tau_2$` | `The action of $\tau_2$ on the second tensor factor` | S §8.5: avoid an unnecessary compound. |
| report/sections/09-ar-counterexample.tex:507 | `Hence $W^0\cong\kk$` | `Hence, $W^0\cong\kk$` | S §6.3. |
| report/sections/09-ar-counterexample.tex:574 | `Hence` | `Hence,` | S §6.3. |
| report/sections/09-ar-counterexample.tex:585 | `Hence $pB=dG+Gd$` | `Hence, $pB=dG+Gd$` | S §6.3. |
| report/sections/09-ar-counterexample.tex:589 | `into the top cell $(\mathbb{B}\otimes\mathbb{B})[-4][3]$` | `into the summand $(\mathbb{B}\otimes\mathbb{B})[-4][3]$ of the underlying graded bimodule` | S §§8.6, 10.1: specify the actual component; it is not a direct summand as a complex. |
| report/sections/09-ar-counterexample.tex:590 | `into the cell coming from the second factor` | `into the summand corresponding to the cone in the second tensor factor` | S §§8.6, 10.1: identify the component (in the underlying graded bimodule, as specified in the preceding row). |
| report/sections/09-ar-counterexample.tex:591 | `the other two cells` | `the other two summands` | S §10.1: same graded-module convention. |
| report/sections/09-ar-counterexample.tex:591–592 | `The defect $d\Phi-\Phi d$ in the top cell` | `The component of $d\Phi-\Phi d$ in $(\mathbb B\otimes\mathbb B)[-4][3]$` | S §§8.6, 10.1: use the defined map and summand rather than two informal labels. |
| report/sections/09-ar-counterexample.tex:592 | `in the second cell the defect $(dG+Gd)\otimes D_b$` | `in the summand corresponding to the second tensor factor, the component $(dG+Gd)\otimes D_b$` | S §§8.6, 10.1: same terminology. |
| report/sections/09-ar-counterexample.tex:594 | `Hence $\Phi$` | `Hence, $\Phi$` | S §6.3. |
| report/sections/09-ar-counterexample.tex:599 | `the projection onto the top cell` | `the projection onto $(\mathbb B\otimes\mathbb B)[-4][3]$` | S §§8.6, 10.1: identify the target. |
| report/sections/09-ar-counterexample.tex:614 | `Finally $\beta_0\neq0$` | `Finally, $\beta_0\neq0$` | S §6.3; retain the connective because this verifies the remaining assertion. |
| report/sections/09-ar-counterexample.tex:726–727 | `Hence the vanishing` | `Hence, the vanishing` | S §6.3. |
| report/sections/09-ar-counterexample.tex:734 | `Consequences` | `An endomorphism algebra of infinite finitistic dimension` | S §11.2: name the object, not its role in the exposition. |
| report/sections/09-ar-counterexample.tex:761 | `The algebra $\Lambda$ is explicit but very large.` | `The algebra $\Lambda$ is explicit.` | S §§8.4, 15: the numerical dimension below supplies the scale. |
| report/sections/09-ar-counterexample.tex:776–780 | `The number ... nine, is small, in contrast with ...` | `The algebra in \Cref{coro:ar-findim} has nine simple modules; the number $3(l+2)$ for \Cref{coro:main} is not determined.` | S §§8.4, 15: keep the meaningful comparison between a determined and an undetermined number; remove subjective “small”. |

## report/sections/10-obstructions.tex

| File:line | Current text (short quotation) | Proposed replacement | Rule |
|---|---|---|---|
| report/sections/10-obstructions.tex:8–9 | `This section explains why the tensor square is used: the analogous construction` | `The analogous construction` (capitalise, retaining the remainder of the assertion and its references). | S §§8.1, 9, 15: the concrete obstruction can start directly. |
| report/sections/10-obstructions.tex:11–12 | `Computations supporting this picture are recorded at the end of the section.` | Delete the sentence; the computations and their scope remain at 197–223. | S §§8.1, 11.8, 15: vague “picture” and unnecessary itinerary. |
| report/sections/10-obstructions.tex:49 | `In the two-factor construction` | `In the construction over $T\otimes_\kk T$` | S §§8.6, 10.1: identify the tensor product. |
| report/sections/10-obstructions.tex:53–54 | `unless certain secondary compositions are nonzero` | `unless at least one of the compositions $w_i[-1]\circ\beta_0$ in \Cref{prop:one-factor} is nonzero` | S §§8.6, 12.1: “certain secondary compositions” neither names nor locates the operations; retain the proposition's requirement that both vanish for the obstruction. |
| report/sections/10-obstructions.tex:67–68 | `the module $Z$ of the conversion construction, if defined` | `the module $Z$ constructed by the formula in \Cref{thm:conversion}, if defined` | S §§10.1, 12.1: replace the project label, retaining the qualification. |
| report/sections/10-obstructions.tex:82 | `Hence $\dim V^0=2$` | `Hence, $\dim V^0=2$` | S §6.3. |
| report/sections/10-obstructions.tex:93–94 | `the conversion construction from a single cone never produces` | `the formula in \Cref{thm:conversion}, applied to a single cone as above, never produces` | S §§8.6, 10.1: identify which construction fails; retain the scope supplied by the proposition. |
| report/sections/10-obstructions.tex:165–166 | `The two-factor construction` | `The construction over $T\otimes_\kk T$` | S §§8.6, 10.1. |
| report/sections/10-obstructions.tex:166–168 | `uses the second cone to create the gap between the degrees $0$ and $3$` | `uses a second cone, after which the only nonzero groups $W^a$ are in degrees $0$ and $3$` | S §8.6: state which groups and degrees are meant by “the gap”. |
| report/sections/10-obstructions.tex:170 | `constructions of other shapes` | `other constructions` | S §§8.4, 15: “shapes” adds no restriction; retain all examples that follow. |
| report/sections/10-obstructions.tex:171–172 | `a different conversion principle` | `a different construction from stable morphisms to modules` | S §§8.6, 10.1: replace the informal principle label without restricting other constructions to this triangular algebra. |
| report/sections/10-obstructions.tex:182 | `the one-factor pair $(T,s)$` | `the pair $(T,s)$` | S §§8.4, 10.1: the objects already identify the case. |
| report/sections/10-obstructions.tex:188 | `a bracket of this shape` | `a bracket $\langle\tau,\beta_0,\beta_0\rangle$` | S §§4.4, 8.6: make the intended operation explicit. |
| report/sections/10-obstructions.tex:197–200 | `test the one-factor shape directly ... The results agree ... They are finite computations ...` | `The following computations concern constructions with a single cone, or without cones. Their scripts and parameters are described in \Cref{app:computations}; the results agree with \Cref{coro:one-factor} in the stated cases and degrees.` Retain `They are finite computations with the stated scope, not proofs in all degrees.` | S §§8.6, 9, 15: replace “shape”, retain the finite scope and distinguish the experiment without a cone. |
| report/sections/10-obstructions.tex:202 | `A test bed without cones:` | `An example without cones:` | S §10.1: engineering label for a mathematical example. |
| report/sections/10-obstructions.tex:211 | `The one-factor candidate built from` | `The candidate constructed over $T$ from` | S §§8.6, 10.1: name the base algebra. |
| report/sections/10-obstructions.tex:218–220 | `Three further one-factor attempts ... fail earlier ... their Ext profiles` | `Three further attempts to use a single cone over algebras of dimensions $6$, $12$ and $40$ fail because the relevant simple modules do not have polynomial Ext algebras on one generator of degree three; their Ext dimensions ...` | S §§8.6, 10.1, 15: replace project shorthand and the narrative “earlier”; specify what was computed. |

The limitation at 169–172 is mathematically necessary and is retained; these results do not exclude every smaller construction. The degree and field limitations of the experiments are also retained.

## report/sections/A1-computations.tex

| File:line | Current text (short quotation) | Proposed replacement | Rule |
|---|---|---|---|
| report/sections/A1-computations.tex:4–5 | `This appendix describes ... They are of two kinds.` | Delete these two sentences and begin with the descriptions of the two kinds of computation. | S §§8.1, 9, 15: heading and ensuing text already identify the appendix's purpose. |
| report/sections/A1-computations.tex:17 | `the minimised two-factor attempt` | `the attempt using minimal bimodule resolutions over $T\otimes_\kk T$` | S §§8.6, 10.1: name what was minimised and the algebra. |
| report/sections/A1-computations.tex:29–30 | `A script check confirms` | `A script confirms` | S §8.5: redundant nominalisation. |
| report/sections/A1-computations.tex:93 | `Sizes` | `Dimensions` | S §11.2: identify the measured quantity. |
| report/sections/A1-computations.tex:108–109 | `The minimised attempt ... used minimal bimodule resolutions` | `The computation ... used minimal bimodule resolutions` | S §§8.4, 11.7: only the resolutions are known to be minimal; the construction is not claimed to have minimal dimension. |
| report/sections/A1-computations.tex:113–114 | `gives the profile of \Cref{prop:two-cone-profile}` | `gives the dimensions of the Tate cohomology groups in \Cref{prop:two-cone-profile}` | S §§8.6, 10.1: replace “profile” by the actual computed invariant. |
| report/sections/A1-computations.tex:120 | `The test bed $\Lambda_0$` | `The algebra $\Lambda_0$` | S §10.1: use the mathematical noun. |
| report/sections/A1-computations.tex:127 | `The one-factor candidate $\Lambda_1$` | `The algebra $\Lambda_1$ constructed over $T$` | S §§8.6, 10.1. |
| report/sections/A1-computations.tex:131 | `the profile of the cone` | `the dimensions of the Tate cohomology groups of the cone` | S §§8.6, 10.1: say what the sequence of numbers measures. |
| report/sections/A1-computations.tex:134 | `Further one-factor attempts` | `Further attempts using a single cone` | S §§8.6, 10.1. |
| report/sections/A1-computations.tex:152 | `the selection group for $m\leq10$` | `the finite quotients of $G$ for $m\leq10$` | S §§8.6, 10.1: the parameter $m$ indexes the quotients, not $G$. Preserve the script name. |

Retain the distinctions between exhaustive polynomial identities and tests in finitely many degrees, and the exact rerun exceptions at 16–18. They record the scope of the evidence (P §§3, 6.3).

## report/sections/A2-verification.tex

| File:line | Current text (short quotation) | Proposed replacement | Rule |
|---|---|---|---|
| report/sections/A2-verification.tex:4 | `This appendix records how each result of the article was checked.` | Delete this sentence; begin `All checks were carried out by AI models ...`. | S §§8.1, 9: the title and following table already state the purpose. |
| report/sections/A2-verification.tex:9 | `Proof notes and fresh-context verification` | `Proof notes and checks in fresh sessions` | S §8.5; P §6.3: replace the procedural compound while preserving the nature of the review. |
| report/sections/A2-verification.tex:40–41 | `one input gap closed` | `one missing input supplied` | S §8.5: compressed workflow label. |
| report/sections/A2-verification.tex:46 | `the one-factor argument` | `the argument for a single cone` | S §§8.6, 10.1: identify the case. |
| report/sections/A2-verification.tex:52 | `an undeclared side convention` | `an unstated convention on left and right modules` | S §8.6: state what “side” refers to. |
| report/sections/A2-verification.tex:53 | `a minimised Auslander--Reiten construction` | `a construction of a counterexample to the Auslander--Reiten conjecture using minimal bimodule resolutions` | Author's example; S §§8.6, 10.1, 11.7: expand the conjecture name and distinguish minimal resolutions from minimal size. |
| report/sections/A2-verification.tex:84–86 | `A search of Mathlib for the infrastructure ... require large foundations that are not available` | `A search of Mathlib shows that a complete formalisation of either construction would require theories not currently available there` | S §§8.2, 8.5, 15: avoid “infrastructure” and evaluative “large foundations”; retain the specific missing theories that follow. |
| report/sections/A2-verification.tex:88–89 | `the Auslander--Reiten route. Smaller parts are within reach:` | `the construction of the counterexample to the Auslander--Reiten conjecture. The feasibility review identifies the following smaller parts:` | S §§8.6, 10.1, 15: replace route and possibility slogan by the recorded assessment; do not upgrade feasibility to completed formalisation. |
| report/sections/A2-verification.tex:91–92 | `over an explicit interface carrying Tate duality` | `with Tate duality included among the explicit formal hypotheses` | S §8.6: state that the formalisation is conditional instead of using implementation jargon; retain that qualification on the obstruction arguments. |

No changes are proposed to the reported model names, effort settings, versions, counts, axiom lists or limits of formalisation. These are disclosure facts, not rhetorical padding.

## report/sections/A3-companion.tex

| File:line | Current text (short quotation) | Proposed replacement | Rule |
|---|---|---|---|
| report/sections/A3-companion.tex:1 | `The companion preprints` | `The preprint on Tachikawa's second conjecture` | S §11.2: the appendix discusses one additional preprint. |
| report/sections/A3-companion.tex:16 | `Its consequences fit the criteria of \Cref{sec:criteria}.` | Delete this sentence; start with `Given $A$ and $M$, ...`. | S §§8.1, 8.7, 9: generic announcement followed immediately by the precise application. |
| report/sections/A3-companion.tex:25 | `Its own proof` | `The preprint's proof` | S §4.4: “its” follows several modules, algebras and internal results. |
| report/sections/A3-companion.tex:27–31 | `The comparison ... shows the role ... an Auslander--Reiten counterexample ... stable data ...` | `In \Cref{sec:ar-route}, a bimodule and a morphism in the stable category of a symmetric algebra instead give a counterexample to the Auslander--Reiten conjecture over a triangular algebra, without requiring a module with vanishing self-extensions over the symmetric algebra itself.` | Author's example; S §§8.1, 8.6, 15: name the objects and preserve the substantive distinction between the constructions. |

Retain `We have not verified that preprint, and nothing in this article depends on it.` This is a statement of scope (P §3), not unnecessary hedging.

## report/sections/A4-ai-declaration.tex

| File:line | Current text (short quotation) | Proposed replacement | Rule |
|---|---|---|---|
| report/sections/A4-ai-declaration.tex:1 | `Declaration of the use of AI and outline of the process` | `Use of AI` | S §§8.2, 11.2: the long procedural title adds no information. |
| report/sections/A4-ai-declaration.tex:6 | `; no part of it was written by a human` | Delete this clause and end the sentence after `AI models`. Keep the human-review disclosure at 7–8. | S §8.7; P §6.3: the preceding “All its text ... were produced by AI models” already says this. |
| report/sections/A4-ai-declaration.tex:15–16 | `orchestration of the work` | `coordination of the work` | S §§2, 8.5: procedural metaphor; preserve the recorded role. |
| report/sections/A4-ai-declaration.tex:38–43 | `The work had two parts. The first part ... it produced ... and the conclusion that no counterexample verifiable by hand was found.` | Delete `The work had two parts.` Replace the second half with `it produced the criteria of \Cref{sec:criteria} and the obstructions of \Cref{sec:obstructions}, but found no counterexample verifiable by hand.` Keep both dates and the sentence about the second part. | S §§8.1–8.2, 9: repeated announcement and nominalisation of a negative search result. |
| report/sections/A4-ai-declaration.tex:47–48 | `no claim was promoted without its evidence being recorded` | `every change to a stronger status was accompanied by a record of the supporting evidence` | S §8.6: replace process jargon with its meaning; retain the claim about how statuses were changed. |
| report/sections/A4-ai-declaration.tex:58 | `in autonomous mode` | `without waiting for human approval of each block` | S §8.6; P §6.3: explain the operational term for readers outside the project; retain the report of the review's autonomy. |

## Terminology decisions and occurrence index

This index covers every rendered occurrence of the terms proposed for systematic replacement, including headings and introductions of terms. It does not propose changing occurrences inside `\label`, `\Cref`, `\input`, or literal script paths. Here `01`, …, `10`, `A1`, …, `A4` abbreviate the corresponding section files in the tables above; `main` means `report/main.tex`.

| Current name or family | Preferred wording or notation | All occurrences in scope |
|---|---|---|
| `Auslander--Reiten counterexample(s)` | `counterexample(s) to the Auslander--Reiten conjecture` | 01:95; 03:137; 09:1, 134; A3:28. |
| `Auslander--Reiten route` | `construction of the counterexample to the Auslander--Reiten conjecture`, or the relevant section reference | 01:68, 100, 115; 03:44; A2:89. |
| `Auslander--Reiten preprint` / `Auslander--Reiten construction` | the existing citation / an explicit reference to the conjecture | 08:8–9; 09:5; A2:53. |
| `selection data` | the pair $(R,\Psi)$; in hypotheses, `satisfy \Cref{def:selection-data}` | 01:42, 48, 52, 113; 02:8; 05:1, 12, 17, 24, 48, 73, 81, 113, 430, 466, 482; 06:1, 4, 6, 402, 411, 747; 07:119, 176, 187. |
| `selection functor` | $H$, its formula, or `exact tensor endofunctor` before notation is available | main:192; 01:28; 05:20, 443; 07:5. |
| `selection diagram` | the diagram $\mathbb V$, with the defining reference at its earlier use | 06:391, 476, 512, 569–570. |
| `selection group` | the group $G$ or its finite quotients, according to the object being checked | A1:152. |
| `visible rank` | $\dim_{\mathbb Q}\mathcal V$; for the infinite case, `$\mathcal V$ is infinite-dimensional` | 05:73, 81, 170, 513. |
| `odd double` | $U\oplus U[3]$; heading `Direct sums with odd shifts` | 01:63; 04:275; 06:289. No formal definition of the phrase occurs; the proposition describes the objects explicitly. |
| `encoding algebra` | the algebra $B$ of the existing construction | 06:104, 139, 748; 07:133–134, 179, 188, 198. |
| `conversion principle` / `conversion theorem` / `conversion construction` | `\Cref{thm:conversion}`, its formula, or a description of the construction | 01:70; 08:1, 11–14 (two uses of `principle`), 199, 330; 10:68, 93, 172. |
| `two-cone bimodule` | the bimodule $\mathcal C$ | 09:396 only. The expression is a heading, not a separately defined notion. |
| `one-factor` (argument, pair, shape, candidate, attempts) | `a single cone`, `over $T$`, or the actual pair, as specified in each row | 10:182, 197, 211, 218; A1:127, 134; A2:46. The exact phrase `one-factor design` does not occur. |
| `two-factor` (construction, attempt) | `over $T\otimes_\kk T$`, specifying minimal bimodule resolutions where relevant | 10:49, 165; A1:17. |
| `test bed` | example / algebra $\Lambda_0$ | 10:202; A1:120. |
| `profile(s)` | dimensions of the specified Ext or Tate cohomology groups | 10:220; A1:113, 131. |
| `cell(s)` | filtration subquotients, then summands of the underlying graded bimodule | 09:408, 589, 590, 591 (twice), 592, 599. |

Names retained after review: **extinction time** is a short descriptive name with an exact definition and consistent usage; **unbounded extinction** is likewise defined. **Rank function**, **$B$-diagram**, **evaluation**, **homogenisation**, **rectification**, **fibre**, **weight**, **defining system**, and **indeterminacy** describe the relevant mathematical objects or operations without an additional slogan. The computational category **certificates** has a precise local explanation, including its scope, and need not be renamed.

The only occurrences of **precisely** are `More precisely` at 05:217 and 07:168; both introduce a strictly more detailed assertion and are retained. There are no rendered occurrences of **machinery**, **insight**, **key**, **crucial**, or **genuinely** in scope. **Mechanism(s)** at 01:18 and 03:4,44, **layers** at 01:28 and 09:12, and **ingredients** at 01:77 are covered above. Logical uses of `Hence`, `Indeed`, `Moreover`, and `Finally` are retained unless a specific row identifies a defect; no rotation or blanket deletion is proposed.

The manuscript consistently uses closed forms such as `nonzero` and `nonprojective`; no global spelling normalisation is proposed (S §0.3). The long proof calculations and explicit degree, sign, sidedness and quantifier checks are retained unless a row identifies a strictly redundant explanation. The user requested prose proposals, so this audit does not recommend deleting or weakening theorem statements, changing hypotheses, or replacing proofs by unverified citations.

## Review record

Reviewed on 2026-10-08: all 4,170 source lines in the fourteen section files, plus the abstract and caveat in `report/main.tex`. The tables contain 194 proposal rows. A source check confirmed that every quoted fragment occurs within its stated line range and that every proposal table has four columns. No external citation was added or verified.

Source snapshot SHA-256: `b016c51994abbdd782f4710bbf79eca1aed843436a48e7aa44842e73141f6d20`. This digest concatenates, in order, `report/main.tex` and the lexicographically sorted `report/sections/*.tex`, each as its relative path, a NUL byte, its contents, and a NUL byte. Repository state changed concurrently during the review; the final quoted fragments and line ranges were checked against the current saved sources. This job wrote only this audit file; it did not edit, commit or build the report.
