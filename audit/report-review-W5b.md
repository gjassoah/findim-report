Model: GPT-6 (specific variant unknown); effort: unknown.

# W5b autonomous block review

Review completed, 2026-10-08. Research article; existing AI-written manuscript;
no target venue specified. Scope: sections 04, 05, 06, 07 and Appendix A1.
Only those manuscript files may be edited. Other sections are read for context.
The user's explicit autonomous editing boundary governs: evident slips,
typesetting and genuine grammar/style errors may be corrected; substantive
mathematical changes remain unapplied proposals. No commits or pushes.

The standing index, full review protocol, writing style, preamble style,
AI-writing and AI-research process, code/build rules, project instructions,
task W5b and notation table have been read. Initial grammar sweep performed
across every section; each match was judged in context. Original scoped
sources are saved in `scratch/W5b-source/`. Initial Git status: only
`codex/QUEUE.md` modified. Other reviewers' subsequent changes are outside this
review's edit scope.

Three supporting reviewers examined sections 05, 06 and 04/07; Appendix A1
received a second read. Their reports were used as leads. The primary reviewer
read the entire article and independently checked the scoped arguments,
reported issues, source locators and the finite checks documented below.
Review decisions are AI assessments, never human certification. `clean` means
no issue found in the stated review, not a promotion of the repository's claim
statuses. The mathematical assessments in the table have status **supported**
(independent informal review). These editorial statuses do not mean that a
proof assistant or a human has certified the claims.

## Block coverage

Line numbers refer to the original snapshot unless explicitly called current;
the first words and labels identify blocks after line shifts. Each heading,
label, displayed formula and displayed list is included with its surrounding
statement or proof step. The table covers all 149 blocks, with proofs divided
where the argument changes. Every block was checked for correctness,
hypotheses, quantifiers, sides, degrees/signs, edge cases, cross-references,
citation locators, grammar and typesetting; the last column records the
principal mathematical check and any disposition.

| Block | Anchor (file:lines; first words) | Status | Finding / decision |
|---|---|---|---|
| 04.01 | `report/sections/04-trivial-extensions.tex:4–20` — “Let $\Delta$ be a finite-dimensional algebra” | clean | Extinction implications match the later formula and corollary; finite global dimension is retained. |
| 04.02 | `report/sections/04-trivial-extensions.tex:25–29` — “Complexes are graded cohomologically” | clean | Tensor differential and bounded-above category agree with section 2. |
| 04.03 | `report/sections/04-trivial-extensions.tex:31–41` — “Minamoto--Yamaura / Let $N$ be a left” | clean | Direct sum lies in the stated category; shift and zeroth term agree with MY20, Lemma 4.13(4) and proof of Theorem 4.17. |
| 04.04 | `report/sections/04-trivial-extensions.tex:43–48` — “The source states the decomposition” | clean | Source uses right modules and internal grading; opposite-algebra translation preserves tensor order. |
| 04.05 | `report/sections/04-trivial-extensions.tex:50–57` — “Choose a resolution” | clean | Bimodule projective resolutions have finitely generated terms; the square-zero dg extension maps quasi-isomorphically to $A$. |
| 04.06 | `report/sections/04-trivial-extensions.tex:59–85` — “The bar module” | corrected | Projectivity, shifted action, mixed-term cancellation and square-zero bar differential checked; connective commas supplied. Split the overlong differential display into two rows. |
| 04.07 | `report/sections/04-trivial-extensions.tex:87–105` — “The bar module resolves $N$” | corrected | Summand pairing and degree-minus-one contraction give the stated augmentation homotopy; connective commas supplied. |
| 04.08 | `report/sections/04-trivial-extensions.tex:107–124` — “Base change to $A$” | corrected | Split filtration proves K-flatness; base change preserves the quasi-isomorphism, and terms are bounded above and projective; connective comma supplied. |
| 04.09 | `report/sections/04-trivial-extensions.tex:126–139` — “Tensoring with $\Delta$” | corrected | Bar faces vanish after tensoring; internal signs, derived powers and functorial resolution choice checked; connective commas supplied. |
| 04.10 | `report/sections/04-trivial-extensions.tex:141–158` — “Let $\Delta=\kk(0\to1\to2)$” | corrected | Path bases give the displayed exact minimal resolution and projective dimension three; “nonzero terms” changed to “finite terms” because omitted terms are minus infinity. |
| 04.11 | `report/sections/04-trivial-extensions.tex:163–170` — “For a nonzero object $C$” | corrected | Degree bound, shift formula and zero-object convention are consistent. Inserted a local line break to resolve the remaining run-in-heading overflow. |
| 04.12 | `report/sections/04-trivial-extensions.tex:172–180` — “Let $\Lambda$ be a finite-dimensional algebra” | clean | Simple-module detection includes all integral degrees and infinite projective dimension. |
| 04.13 | `report/sections/04-trivial-extensions.tex:182–194` — “Represent $C$ by a bounded-above complex” | clean | Top cancellation yields a degreewise finite minimal representative; Hom to a simple detects precisely its nonzero terms. |
| 04.14 | `report/sections/04-trivial-extensions.tex:196–205` — “Minamoto--Yamaura / Let $N$ be a nonzero” | clean | Formula and lower bound agree with MY20, Corollary 4.11, after passage to opposite algebras. |
| 04.15 | `report/sections/04-trivial-extensions.tex:207–221` — “Every simple $A$-module $S$” | corrected | Square-zero ideal annihilates simples; adjunction, shifted Hom factors and nonpositive support justify the supremum; connective comma supplied. |
| 04.16 | `report/sections/04-trivial-extensions.tex:223–236` — “Suppose that the left and the right” | clean | Both side bounds and nonzero-module hypothesis retained; estimate includes extinction time one. |
| 04.17 | `report/sections/04-trivial-extensions.tex:238–255` — “Truncating a projective bimodule resolution” | corrected | Right-projective truncation gives amplitude bound; cohomology triangles give projective-dimension estimate and converse extinction; connective comma supplied. |
| 04.18 | `report/sections/04-trivial-extensions.tex:260–275` — “Suppose that $\Delta$ has finite global dimension” | corrected | Rational generalised kernel is killed by the rank-th power; odd-shift cancellation matches realisation and simulation; connective comma supplied. |
| 04.19 | `report/sections/04-trivial-extensions.tex:277–281` — “For an integer $d\geq0$” | clean | Multiplicativity and unitality give polynomial equations; the representation space is noetherian, including dimension zero. |
| 04.20 | `report/sections/04-trivial-extensions.tex:283–288` — “Suppose that $\Delta$ has finite right global dimension” | clean | Right global dimension suffices for the bounded right-projective complexes used below. |
| 04.21 | `report/sections/04-trivial-extensions.tex:290–304` — “Let $X'\to X$ be a bounded resolution” | corrected | Tensor powers retain finite-dimensional right-projective terms; complementary idempotent ranks give finitely many clopen strata; connective comma supplied. |
| 04.22 | `report/sections/04-trivial-extensions.tex:306–323` — “Fix such a subset $Z$” | corrected | Fixed-rank strata give polynomial differential matrices; exactness is open and the ascending open chain stabilises; connective comma supplied. |
| 04.23 | `report/sections/04-trivial-extensions.tex:325–328` — “By \Cref{prop:bounded-extinction}” | clean | Unbounded extinction forces unbounded dimensions; comparison with bounded-dimension projective-dimension result has the stated scope. |
| 05.01 | `report/sections/05-selection.tex:4–10` — “The main construction starts” | clean | Scope matches the selection, rank-obstruction and group constructions below; input preprint Section 2 inspected. |
| 05.02 | `report/sections/05-selection.tex:15–27` — “Let $\kk$ be a field” | clean | Right finite projectivity and scalar centrality give a finite-dimensional exact tensor functor; extinction includes the zero module at time zero. |
| 05.03 | `report/sections/05-selection.tex:29–34` — “The functor $H$ is well defined” | clean | A right-module splitting induces natural vector-space splittings after tensoring; vanishing persists under iteration. |
| 05.04 | `report/sections/05-selection.tex:36–46` — “Let $e\in R$” | clean | Centrality preserves $eR$ under the twisted left action; the two displayed tensor maps are inverse and respect that action. |
| 05.05 | `report/sections/05-selection.tex:48–77` — “Selection data with unbounded extinction” | clean | Both tensor products defining rank and $\mathsf T$ are well defined; associativity gives rank-shift and the visible cyclic subspace. |
| 05.06 | `report/sections/05-selection.tex:79–84` — “Let $(R,\Psi)$ be selection data” | clean | The bound includes visible rank zero and extinction time zero. |
| 05.07 | `report/sections/05-selection.tex:86–99` — “By~\eqref{eq:rank-shift}” | corrected | The kernel of $\chi$ is invariant; Fitting nilpotence is bounded by $r$, and every tail spans the invertible cyclic part. Added the comma after “Hence” at original line 88. |
| 05.08 | `report/sections/05-selection.tex:101–109` — “Let $Y$ be a finite-dimensional module” | corrected | Evaluation annihilates the invertible part and the nilpotent part after $r$ steps. Added the comma after “Hence” at original line 106. |
| 05.09 | `report/sections/05-selection.tex:111–125` — “Selection data $(R,\Psi)$ over $\kk$” | clean | Each stated class has finite-dimensional visible rank by the following proof; localisation is on the right-module convention. |
| 05.10 | `report/sections/05-selection.tex:127–141` — “By \Cref{prop:rank-obstruction}” | clean | Finite projective generators span $K_0$; Sch07a v1 Theorem 2.3, p.3, and Lemma 4.1, p.9, support localisation and surjectivity. |
| 05.11 | `report/sections/05-selection.tex:143–166` — “In case~\eqref{it:rank-noetherian}” | corrected | Finite length, locally constant projective ranks and finitely many components give the $d_i$-span; Stacks locators checked. Added the introductory comma at 144, removed the subject–verb comma at 148, and added the comma after “Hence” at 164. |
| 05.12 | `report/sections/05-selection.tex:168–172` — “In case~\eqref{it:rank-noetherian}” | clean | The proof bounds the image rather than the full $K_0$; the later character modules supply the asserted independent functions. |
| 05.13 | `report/sections/05-selection.tex:177–180` — “We write $[x,y]$” | clean | Commutator and torus conventions agree with all subsequent calculations. |
| 05.14 | `report/sections/05-selection.tex:182–206` — “Let $G$ be the group” | clean | Indices, independent integer parameters, weights and every defining relation agree with the subsequent presentation and quotients. |
| 05.15 | `report/sections/05-selection.tex:208–213` — “No relation between” | clean | The excluded relation families are indeed absent; Reg19 v3 Proposition 4.9, relations (4.9)–(4.10), contains the attributed parallel arguments. |
| 05.16 | `report/sections/05-selection.tex:215–224` — “The group $G$ is finitely presented” | clean | There are fifteen generators; the listed centralisers form bases of the appropriate integral kernel lattices. |
| 05.17 | `report/sections/05-selection.tex:226–244` — “Let $P$ be the group” | corrected | Each $q_S$ has weight one; kernel centralisation makes the translated generators and conjugation formula valid for all integers. Added the comma after “Hence” at 235. |
| 05.18 | `report/sections/05-selection.tex:245–270` — “This gives the relations” | corrected | All nine integral witnesses attain the two prescribed parameters; both noncommuting relations have output parameter $r+s$. Added the comma after “Hence” at 269. |
| 05.19 | `report/sections/05-selection.tex:272–279` — “Conversely, the relations” | corrected | Both presentation homomorphisms respect relations and their composites fix every generator. Added the comma after “Thus” at 275. |
| 05.20 | `report/sections/05-selection.tex:281–289` — “For every $N\in\ZZ$” | clean | The assertion permits negative parameters and all splittings of $N$; the proof treats independence, centrality and order separately. |
| 05.21 | `report/sections/05-selection.tex:291–310` — “Let $i\neq j$” | clean | The three required commutations give the displayed conjugation calculation and transfer identity; a third expression compares splittings at the same index. |
| 05.22 | `report/sections/05-selection.tex:312–321` — “Let $g$ be a generator” | corrected | An unused index handles each root generator; torus conjugation preserves the sum, and $U_i(a)^2=1$ gives $z_N^2=1$. Added the comma after “Hence” at 318. |
| 05.23 | `report/sections/05-selection.tex:323–329` — “For every $c\in\ZZ$” | clean | Shifting only the $U$-parameters preserves every relation and shifts $z_N$ in the stated direction. |
| 05.24 | `report/sections/05-selection.tex:331–343` — “The assignment sends” | clean | All affected relation families are accounted for; composition and the inverse follow on generators. |
| 05.25 | `report/sections/05-selection.tex:348–352` — “For an integer $m\geq1$” | clean | Monic division gives dimension $m$ even when the ring is nonreduced; $t^{-1}=t^{m-1}$ also holds for $m=1$. |
| 05.26 | `report/sections/05-selection.tex:354–370` — “For every $m\geq1$” | clean | Matrix assignments have the required conjugation weights, central images and independent order-two generators. |
| 05.27 | `report/sections/05-selection.tex:372–396` — “Every matrix unit $A$” | clean | Characteristic two, matrix-unit multiplication and all index restrictions give the asserted relations and image of $z_N$. |
| 05.28 | `report/sections/05-selection.tex:398–406` — “The unit $E_{15}$” | corrected | Products with $E_{15}$ and torus entries establish centrality; the basis of $S_m$ gives independence. Replaced “unit” by “matrix unit” at 398. |
| 05.29 | `report/sections/05-selection.tex:408–413` — “The elements $z_N$” | clean | Finite-subfamily separation gives the infinite direct sum; its embedding contradicts finite generation of an abelian centre. |
| 05.30 | `report/sections/05-selection.tex:415–422` — “Let $N_1<\dots<N_a$” | clean | Choosing $m$ larger than the span separates residues, including negative integers and singleton families. |
| 05.31 | `report/sections/05-selection.tex:424–428` — “By the argument” | clean | The general centre claim and the three specific properties of this group follow from the preceding results. |
| 05.32 | `report/sections/05-selection.tex:433–438` — “Let $R=\mathbb{C}G$” | clean | The group automorphism extends linearly, and the central involution gives the stated complex idempotent. |
| 05.33 | `report/sections/05-selection.tex:440–452` — “Let $R$ be a $\kk$-algebra” | clean | Twisting uses positive powers of $\alpha$; the empty product at $j=0$ and the left action are consistent. |
| 05.34 | `report/sections/05-selection.tex:454–462` — “The elements $e_q$” | clean | The induction multiplies by $\alpha^j(e)$ and composes the action with $\alpha$, giving $p_{j+1}$ and $\alpha^{j+1}$ naturally. |
| 05.35 | `report/sections/05-selection.tex:464–470` — “The pair $(R,\Psi)$” | clean | Finite presentation and a nonzero witness for every $m\geq1$ suffice for unbounded extinction. |
| 05.36 | `report/sections/05-selection.tex:472–484` — “By \Cref{prop:group-presentation}” | corrected | Adding inverse generators presents the group algebra; the two maps are inverse, and $e_q=(1+z_q)/2$. Added the comma after “Hence” at 479. |
| 05.37 | `report/sections/05-selection.tex:486–505` — “Fix $m\geq1$” | corrected | The central character projector is nonzero, has the asserted scalar action and yields first vanishing exactly at $m$, including $m=1$. Added the comma after “Hence” at 500. |
| 05.38 | `report/sections/05-selection.tex:507–520` — “In the notation” | clean | For $j=0,\ldots,s-1$, evaluation on $Y_1,\ldots,Y_s$ is triangular with nonzero diagonal; coset representatives give the induced-module dimension. |
| 06.01 | `report/sections/06-realisation.tex:1–14` — “This section turns selection data” | clean | The stated realisation, handedness and degree-3 shift agree with the theorem. |
| 06.02 | `report/sections/06-realisation.tex:15–32` — “The algebra B is read off” | clean | The four steps match encoding, odd doubling, lifting and rectification; global dimension two supplies the final splitting. |
| 06.03 | `report/sections/06-realisation.tex:33–34` — “The argument makes non-explicit choices” | clean | The cited remark identifies the existential choices used in the two steps. |
| 06.04 | `report/sections/06-realisation.tex:36–43` — “Throughout this section” | clean | Centrality over the field and the left/right module categories agree with Section 2. |
| 06.05 | `report/sections/06-realisation.tex:45–64` — “Let K be an essentially small” | clean | The cone class is multiplicative; right roofs have the displayed orientation. All Stacks locators checked; Tag 04VB identifies the section containing Lemma 4.27.19. |
| 06.06 | `report/sections/06-realisation.tex:66–80` — “In the situation above, let X” | clean | Both finite-family assertions follow from right fractions; the empty family is allowed. |
| 06.07 | `report/sections/06-realisation.tex:82–95` — “By induction on the number” | corrected | The Ore square gives a common denominator without requiring the other leg to belong to the system; the identity handles the empty family. Added introductory and Hence commas. |
| 06.08 | `report/sections/06-realisation.tex:97–102` — “Replacing the family by the single” | clean | The finite direct sum and Stacks Lemma 4.27.14 give one denominator annihilating all maps, including an empty family. |
| 06.09 | `report/sections/06-realisation.tex:104–113` — “Every finitely presented algebra” | clean | Eliminating the new partial-product generators recovers each original monomial and introduces only quadratic relations. |
| 06.10 | `report/sections/06-realisation.tex:115–144` — “Let R be a k-algebra” | clean | Homogenisation respects right-to-left multiplication, including constant terms; the relation basis and module representation have the required domains. |
| 06.11 | `report/sections/06-realisation.tex:146–150` — “The algebra B depends” | clean | Inverting the two distinguished arrows recovers the indicated generator action; no identification of quotient categories is asserted. |
| 06.12 | `report/sections/06-realisation.tex:152–159` — “Let Lambda be a finite-dimensional algebra” | clean | Directed idempotents give the claimed two-sided bound, including one idempotent. |
| 06.13 | `report/sections/06-realisation.tex:161–178` — “Let N be a left Lambda-module” | clean | The projective surjection removes the lowest supported vertex; the last supported module is projective. Reversing idempotents treats the opposite algebra. |
| 06.14 | `report/sections/06-realisation.tex:180–191` — “In Construction encoding-algebra” | clean | Path counts, the global-dimension bound and the exact fully faithful functor have the stated hypotheses. |
| 06.15 | `report/sections/06-realisation.tex:193–200` — “The quiver has three paths” | clean | There are no paths of length three, so the relation ideal equals its quadratic span and the dimension formula follows. |
| 06.16 | `report/sections/06-realisation.tex:202–210` — “On M(Y) the element” | corrected | Relations vanish; the two identity arrows force the vertex maps to agree, and the generator arrows force R-linearity. Added the Hence comma. |
| 06.17 | `report/sections/06-realisation.tex:212–230` — “In the situation of Construction” | clean | Left multiplication gives maps between projective right modules with the required composition; the quotient inverts both distinguished arrows. |
| 06.18 | `report/sections/06-realisation.tex:232–243` — “For a finite-dimensional left R-module” | clean | Bounded right-projective complexes are K-flat; tensoring preserves the relevant triangulated operations and gives the stated arrow actions. |
| 06.19 | `report/sections/06-realisation.tex:245–257` — “In the situation above, there is” | clean | The generator formula defines a unital action, and exact evaluation factors through the specified quotient. |
| 06.20 | `report/sections/06-realisation.tex:259–269` — “In Q the relation” | corrected | Cancelling the invertible arrows gives the quadratic, linear and constant terms with the correct order. Added the Hence comma. Displayed the long substituted relation. |
| 06.21 | `report/sections/06-realisation.tex:271–279` — “The cones of s and s'” | clean | The kernel of evaluation contains the thick subcategory; Stacks Lemma 13.6.8(2) supplies the exact factorisation. |
| 06.22 | `report/sections/06-realisation.tex:281–283` — “No identification of Q” | clean | Subsequent arguments use only the quotient action and evaluation functors. |
| 06.23 | `report/sections/06-realisation.tex:285–296` — “Let T be an additive category” | clean | Objects, morphisms, identity and the extended shift in the idempotent completion are specified consistently. |
| 06.24 | `report/sections/06-realisation.tex:298–306` — “Let T be a triangulated category” | clean | The cone-splitting statement has the requisite identity summand and zero complementary map. |
| 06.25 | `report/sections/06-realisation.tex:308–313` — “Let Z=(Z0,p)” | corrected | Taking the image of the compatible idempotent preserves exactness of the Hom sequence. Added the Hence comma. |
| 06.26 | `report/sections/06-realisation.tex:315–327` — “Let iota ... be the inclusions” | clean | The triangle identities remove the identity summands; injectivity, middle exactness and surjectivity are justified separately. |
| 06.27 | `report/sections/06-realisation.tex:329–336` — “Taking Z=X1'[1] gives” | corrected | The section and the injective first map yield bijections on every Hom functor; Yoneda gives the isomorphism. Displayed the long isomorphism morphism. |
| 06.28 | `report/sections/06-realisation.tex:338–349` — “Let T be an essentially small” | clean | Both odd doubles are asserted in the original category, with the Grothendieck classes taken there. |
| 06.29 | `report/sections/06-realisation.tex:351–367` — “Let C be a cone” | clean | The two cone constructions leave shifts 1 and 3 respectively; triangle relations give both zero classes, including zero and identity idempotents. |
| 06.30 | `report/sections/06-realisation.tex:369–378` — “Any object of T isomorphic” | corrected | Full faithfulness transports the isomorphism; odd shifts cancel in the later iterates. Corrected the ambient Grothendieck group from K0(Q) to K0(T). |
| 06.31 | `report/sections/06-realisation.tex:380–392` — “The cones of Proposition odd-double” | clean | The connecting morphism has degree c+1; 3 is the first positive odd shift whose vanishing follows from the stated bound alone. |
| 06.32 | `report/sections/06-realisation.tex:394–399` — “We now apply Proposition odd-double” | clean | Column vectors identify endomorphisms of the free right module with matrices acting from the left. |
| 06.33 | `report/sections/06-realisation.tex:401–415` — “Let (R,Psi) be selection data” | clean | Finite right projectivity gives an idempotent matrix, a unital corner action and the dimension bound; zero Psi is allowed. |
| 06.34 | `report/sections/06-realisation.tex:417–431` — “Choose a split surjection” | clean | The splitting transports the left action correctly; tensoring identifies the idempotent image and proves exactness on underlying vector spaces. |
| 06.35 | `report/sections/06-realisation.tex:433–450` — “Now suppose that R is finitely presented” | corrected | Entrywise application of theta respects matrix composition; the corner action has identity theta_n(epsilon) on U. Displayed the long corner-identity equation. |
| 06.36 | `report/sections/06-realisation.tex:452–456` — “By Proposition odd-double there is” | clean | The chosen odd-double isomorphism transports the same R-action onto both summands without depending on a module Y. |
| 06.37 | `report/sections/06-realisation.tex:458–467` — “A B-diagram in a k-linear category” | clean | The relation convention matches the quiver and the selection diagram assigns consistent identity and generator maps. |
| 06.38 | `report/sections/06-realisation.tex:469–474` — “The relations hold in V” | clean | The unital R-action supplies all homogenised relations; a right-projective bimodule complex gives the indicated diagram. |
| 06.39 | `report/sections/06-realisation.tex:476–483` — “For every finite-dimensional left R-module” | clean | Evaluation of the odd double has both the claimed objects and their R-actions. |
| 06.40 | `report/sections/06-realisation.tex:485–498` — “Idempotents split in Db(mod k)” | corrected | Complexes of vector spaces split into cohomology; idempotent images and the matrix action give HY in each summand. Added two Hence commas. |
| 06.41 | `report/sections/06-realisation.tex:500–521` — “In the situation of Construction diagram-V” | clean | The lifting statement specifies all arrow domains, the quotient squares and relation homotopies of degree minus one. |
| 06.42 | `report/sections/06-realisation.tex:523–527` — “The objects of Q are those of K” | clean | Working backwards through vertices preserves previously lifted arrows. |
| 06.43 | `report/sections/06-realisation.tex:529–550` — “Apply Lemma fractions” | clean | Two common denominators lift the arrows; one further denominator kills every relation error without changing outgoing compatibility. |
| 06.44 | `report/sections/06-realisation.tex:552–555` — “Finally choose chain maps” | corrected | Equality to zero in the homotopy category gives the specified null-homotopies for arbitrary representatives. Added the Finally comma. |
| 06.45 | `report/sections/06-realisation.tex:557–564` — “All the data of Proposition lifting” | clean | The fixed quotient squares give simultaneous evaluation identifications, including the generator actions, independently of Y. |
| 06.46 | `report/sections/06-realisation.tex:566–585` — “The construction makes existential choices” | clean | The non-explicit choices are identified; given finite complexes, the homotopies satisfy finite linear systems and rectification has support within [a-2,b]. |
| 06.47 | `report/sections/06-realisation.tex:587–594` — “The following construction applies” | corrected | The general three-vertex quiver and the basis of its quadratic relation space provide precisely the assumptions used below. Inserted a local line break to keep the short algebra formula together after the run-in heading. |
| 06.48 | `report/sections/06-realisation.tex:596–607` — “Let B be as above” | clean | Right projectivity and the relation homotopies suffice for the stated bimodule complex and arrow-compatible homotopy equivalences. |
| 06.49 | `report/sections/06-realisation.tex:609–663` — “All unadorned tensor products” | clean | Bimodule sides, total degrees and all entries of d_P squared check; the relation composite is minus f_rho and is cancelled by eta. |
| 06.50 | `report/sections/06-realisation.tex:665–702` — “For a vertex i, let iota_i” | corrected | The decreasing source-index filtration is preserved; the relation basis makes its final three-term subquotient exact, and the tensor contraction has the correct signs. Added the Hence comma. |
| 06.51 | `report/sections/06-realisation.tex:704–712` — “The terms of C_i are projective” | corrected | The degreewise split quotient is bounded projective and contractible; r and K satisfy the displayed chain-map and homotopy identities. Added the Hence comma. |
| 06.52 | `report/sections/06-realisation.tex:714–722` — “For an arrow a:i to j” | corrected | The shifted internal differential cancels H_a d and leaves the required arrow difference with its stated sign. Added the Hence comma. |
| 06.53 | `report/sections/06-realisation.tex:724–728` — “The three columns of P” | clean | Relations cannot meet another nonidentity path, so no additional coherence term is required by this construction. |
| 06.54 | `report/sections/06-realisation.tex:730–747` — “Let (R,Psi) be selection data” | clean | The theorem states the finite-dimensional output, right-projective terms and a single P independent of Y. |
| 06.55 | `report/sections/06-realisation.tex:749–756` — “Let P be the complex obtained” | clean | Ordinary tensor computes derived tensor; the vertex projections and left arrow multiplications give the stated evaluation. |
| 06.56 | `report/sections/06-realisation.tex:758–772` — “Applying ev_Y to the homotopy equivalences” | clean | Arrow compatibility survives cohomology, giving full B-module identifications in degrees zero and minus three. |
| 06.57 | `report/sections/06-realisation.tex:774–792` — “Put N0=H0(TY) and N-3=H-3(TY)” | corrected | Good truncation gives the triangle with an Ext4 connecting class; global dimension two kills it and the splitting induces cohomology isomorphisms. Added the Hence comma. |
| 06.58 | `report/sections/06-realisation.tex:794–804` — “In the situation of Theorem realisation” | clean | The binomial iterate formula has the correct shifts and includes j=0; faithfulness detects vanishing. |
| 06.59 | `report/sections/06-realisation.tex:806–818` — “For j=0 there is nothing” | clean | Exact finite-dimensional selection permits induction; finite sums, shifts and Pascal's identity give the multiplicities, including endpoints. |
| 06.60 | `report/sections/06-realisation.tex:820–831` — “The main preprint” | clean | The Sections 3–4 attribution was checked in the input source; central e gives the n=1 corner homomorphism, while the general proof needs no left projectivity. |
| 07.01 | `report/sections/07-simulation.tex:4–9` — “\Cref{thm:realisation} provides a complex $P$” | clean | Dependencies distinguish a complex of bimodules from the ordinary bimodule required for extinction. |
| 07.02 | `report/sections/07-simulation.tex:14–28` — “For an integer $l\geq0$” | corrected | Right projective bases, arrow multiplication, kernels and cohomological indexing checked, including the length-zero case; connective comma supplied. |
| 07.03 | `report/sections/07-simulation.tex:30–55` — “Let $B$ be a finite-dimensional algebra” | clean | Bimodule sides, central supports, boundedness and right projectivity support the formula for arbitrary complexes. |
| 07.04 | `report/sections/07-simulation.tex:57–76` — “The bimodule $O$ is well defined” | clean | Differential relations define $O$; tensor identification and degreewise sign give precisely $P[b]$. |
| 07.05 | `report/sections/07-simulation.tex:78–89` — “The complex $R_X=O\oplus R_Y$” | clean | Bounded right-projective resolution computes both iterates on arbitrary complexes; supports and associativity preserve order and signs. |
| 07.06 | `report/sections/07-simulation.tex:91–105` — “For the global dimensions” | corrected | Nilpotent ideal and split chain quotient identify the radical over every field; tensor resolutions and radical filtrations give both bounds; connective comma supplied. |
| 07.07 | `report/sections/07-simulation.tex:107–112` — “The simulation trades the complex $P$” | clean | Vertex count, differential encoding and recovered shift agree with the construction. |
| 07.08 | `report/sections/07-simulation.tex:117–130` — “Let $(R,\Psi)$ be selection data” | clean | A single algebra is chosen before all modules; lower and upper bounds include extinction time one. |
| 07.09 | `report/sections/07-simulation.tex:132–141` — “Fix a presentation of $R$” | clean | Quadraticisation, encoding, realisation and simulation have the required hypotheses; both global dimensions are bounded by $l+2$. |
| 07.10 | `report/sections/07-simulation.tex:143–159` — “Let $Y$ be a finite-dimensional left $R$-module” | corrected | Iteration gives shift $rb+3j$ and binomial multiplicities; vanishing at $2t$ and survival at $2t-2$ give the stated bounds; connective comma supplied. |
| 07.11 | `report/sections/07-simulation.tex:161–163` — “The order of the choices matters” | clean | Quantifier order matches the fixed-algebra requirement for infinite finitistic dimension. |
| 07.12 | `report/sections/07-simulation.tex:165–173` — “There is a finite-dimensional complex algebra” | clean | Original preprint Theorem 1.1 checked; refined simple-module count follows from the displayed construction. |
| 07.13 | `report/sections/07-simulation.tex:175–182` — “Apply \Cref{thm:main}” | clean | Selection modules have the needed extinction times; the square-zero quotient and tensor-factor simples give $3(l+2)$. |
| 07.14 | `report/sections/07-simulation.tex:184–204` — “Every step of the construction is explicit” | corrected | Claimed unresolved lengths agree with the lifting discussion; fifteen group generators yield thirty algebra symbols before quadraticisation; connective comma supplied. |
| 07.15 | `report/sections/07-simulation.tex:206–213` — “The main preprint bounds the global dimensions” | corrected | Original Proposition 5.1 proof gives $3l+2$; the report's tensor argument gives $l+2$, used in its explicit upper bound. Made the citation space breakable to keep the short bound together and remove the initial overflow. |
| A1.01 | `report/sections/A1-computations.tex:4–19` — “This appendix describes the computations” | proposal | The certificates/experiments distinction and stated field modulus agree with the scripts. P1 corrects historical rerun coverage; P2 corrects the location of the recorded parameter exponents. |
| A1.02 | `report/sections/A1-computations.tex:23–29` — “The following table, reproduced” | clean | The basis and coefficient convention agree with Section 9 and the source; fresh comparison confirms all 179 entries in order. |
| A1.03 | `report/sections/A1-computations.tex:31–56` — “coefficient & input and output letters” | clean | All 179 inputs are distinct; coefficient-degree counts are 32, 123, 20, 4 for degrees 0, 1, 2, 3. Ordered source equality checked afresh. |
| A1.04 | `report/sections/A1-computations.tex:61–69` — “The algebras $C$ and $T$” | corrected | Read the polynomial implementation and reran it byte-for-byte against its saved output; basis counts, duality and product checks have the stated scope. Broke the long script path to remove overflow. |
| A1.05 | `report/sections/A1-computations.tex:70–79` — “The cochain” | clean | Read and freshly reran the exact characteristic-two polynomial certificate; radical and corner restrictions, 104976 four-input identities, 324 boundary identities, special values and bar-cycle check match the description. |
| A1.06 | `report/sections/A1-computations.tex:80–85` — “Casimir identities” | corrected | The same certificate checks the full and two idempotent-restricted sums. Displayed the sum to prevent overflow; the other cited identities are arguments in Section 9. |
| A1.07 | `report/sections/A1-computations.tex:89–99` — “The dimension of $C_1$” | corrected | Independently enumerated compatible corner strings for bar dimensions and recovered boundary ranks downwards from degree four; all five term dimensions and both displayed final dimensions agree. Split the overlong equality into two rows. |
| A1.08 | `report/sections/A1-computations.tex:100–107` — “The minimised attempt” | proposal | The recorded cokernel dimensions, system bound, pre-allocation stop and profile agree with saved data. P3 corrects the assertion that the whole complex is exact; its three nonzero homology groups enter the rank recurrence. |
| A1.09 | `report/sections/A1-computations.tex:112–118` — “The test bed $\Lambda_0$” | corrected | Saved finite-field and exact-run degree ranges agree. Replaced the ambiguous relative clause by “this map” so rank and kernel refer to delta^0; rank one agrees with comparison-0.json, and the kernel description agrees with crosscheck-0.json. |
| A1.10 | `report/sections/A1-computations.tex:119–125` — “The one-factor candidate $\Lambda_1$” | clean | The two parameter cases, cone dimension 312, fibre dimension 352, profile degrees -4..4, delta^0 and Ext degrees 1..3 match the saved case, W, profile and summary files. Cached rerun limitation is P1. |
| A1.11 | `report/sections/A1-computations.tex:126–134` — “Further one-factor attempts” | clean | The three algebras, degree ranges and direct-versus-tensor calculation agree with profiles.py/profiles.out. Failure already in these degrees rules out the stated polynomial Ext algebra. |
| A1.12 | `report/sections/A1-computations.tex:135–139` — “Brackets for $T$” | clean | The witness checks both rational-function and listed finite fields; the defining system and zero indeterminacy give the asserted singleton bracket for the tested cases. The general claim is supplied by the cited theorem. |
| A1.13 | `report/sections/A1-computations.tex:143–150` — “The remaining scripts check signs” | proposal | Read the cited scripts and saved outputs; the finite checks have the stated algebraic scope. P4 corrects a stale cross-reference: only one of the two D-A examples appears in Section 4. These supplementary checks do not replace the general arguments. |

## Applied changes

Applied only evident lexical/notation slips, grammar/punctuation and typesetting.
The three local slips are “finite terms” at 04:156 (zero objects contribute
minus infinity), “matrix unit” at 05:398, and the generic ambient group
$K_0(\mathcal T)$ at 06:373. No hypothesis or argument was altered.
Connective commas follow the mandatory style rule; the existing spelling
conventions were retained. Appendix A1's rank/kernel antecedent was clarified.
Long formulas and paths were broken without changing their mathematical text.

The following unified diffs compare the original private snapshots with the
current scoped files (intermediate layout adjustments are not separate edits).

```diff
--- a/report/sections/04-trivial-extensions.tex
+++ b/report/sections/04-trivial-extensions.tex
@@ -69,17 +69,19 @@
   to $w\in\widetilde{A}\otimes_\Delta F_r$. Let $\widetilde{A}$ act by
   $a\cdot s^rw=(-1)^{r|a|}s^r(aw)$, and define the differential by
   \[
-    D(s^rw)=(-1)^rs^r\,dw+b(s^rw),\qquad
-    b\bigl(s^r(a\otimes q_1\otimes\cdots\otimes q_r\otimes v)\bigr)=
-    s^{r-1}(aq_1\otimes q_2\otimes\cdots\otimes q_r\otimes v)
+    \begin{gathered}
+      D(s^rw)=(-1)^rs^r\,dw+b(s^rw),\\
+      b\bigl(s^r(a\otimes q_1\otimes\cdots\otimes q_r\otimes v)\bigr)=
+      s^{r-1}(aq_1\otimes q_2\otimes\cdots\otimes q_r\otimes v)
+    \end{gathered}
   \]
   for $r>0$, and $b=0$ on the summand of index zero; here $d$ is the
   differential of the tensor product $\widetilde{A}\otimes_\Delta F_r$. The
   multiplication $\widetilde{A}\otimes_\Delta F_r\to\widetilde{A}\otimes_\Delta
   F_{r-1}$ is a chain map, so the mixed terms of $D^2$ cancel, with
   coefficients $(-1)^r+(-1)^{r-1}$; and $b^2=0$ because $q_1q_2=0$ in
-  $\widetilde{A}$. Moreover $b(a\cdot z)=(-1)^{|a|}a\cdot b(z)$, since
-  $r|a|\equiv|a|+(r-1)|a|$ modulo two. Thus $\mathcal{B}$ is a dg
+  $\widetilde{A}$. Moreover, $b(a\cdot z)=(-1)^{|a|}a\cdot b(z)$, since
+  $r|a|\equiv|a|+(r-1)|a|$ modulo two. Thus, $\mathcal{B}$ is a dg
   $\widetilde{A}$-module. The other faces of the usual bar construction
   vanish: they multiply two elements of $\widetilde{X}$, or let
   $\widetilde{X}$ act on $\widetilde{N}$.
@@ -90,7 +92,7 @@
   $\widetilde{A}$-module through $\widetilde{A}\to\Delta$. As a complex of
   left $\Delta$-modules, $\widetilde{A}\otimes_\Delta F_r=F_r\oplus F_{r+1}$,
   according to the decomposition $\widetilde{A}=\Delta\oplus\widetilde{X}$.
-  Hence $\mathcal{B}$ is the direct sum of $\widetilde{N}$, in index zero, and
+  Hence, $\mathcal{B}$ is the direct sum of $\widetilde{N}$, in index zero, and
   of the complexes
   \[
     F_r[r]\oplus F_r[r-1]\qquad(r\geq1),
@@ -102,7 +104,7 @@
   complexes is the mapping cone of an identity map, so the map of degree $-1$
   sending the second summand identically to the first is a contraction. These
   contractions give $h$ with $Dh+hD=\id-\iota\epsilon$, where $\iota$ is the
-  inclusion of $\widetilde{N}$. Hence $\epsilon$ is a quasi-isomorphism.
+  inclusion of $\widetilde{N}$. Hence, $\epsilon$ is a quasi-isomorphism.
 
   \emph{Base change to $A$.} Filter $\mathcal{B}$ by the subcomplexes of the
   summands of index at most $r$. The subquotients are
@@ -121,16 +123,16 @@
   $\widetilde{N}\to N$ is a quasi-isomorphism. The terms of $L$ are direct sums
   of modules $(A\otimes_\Delta F_r^j)$, which are projective over $A$, and
   they vanish in positive degrees; in each degree only finitely many indices
-  $r$ contribute. Hence $L$ is a bounded-above projective resolution of~$N$.
+  $r$ contribute. Hence, $L$ is a bounded-above projective resolution of~$N$.
 
   \emph{Tensoring with $\Delta$.} In $\Delta\otimes_AL$ the bar differential
   vanishes, since its image has a leading factor in the ideal $X$, which acts
-  as zero on~$\Delta$. Hence
+  as zero on~$\Delta$. Hence,
   \[
     \Delta\otimes_AL\cong\bigoplus_{r\geq0}F_r[r],
   \]
   with the differential $(-1)^rd_{F_r}$ on the summand of index $r$, which is
-  the differential of $F_r[r]$. Finally $F_r$ represents $\Phi^rN$: by
+  the differential of $F_r[r]$. Finally, $F_r$ represents $\Phi^rN$: by
   induction on $r$, $F_{r-1}$ is a bounded-above complex of projective modules
   representing $\Phi^{r-1}N$, hence K-flat, and
   $F_r=\widetilde{X}\otimes_\Delta F_{r-1}\to X\otimes_\Delta F_{r-1}$ is a
@@ -153,14 +155,15 @@
     Ae_2\xrightarrow{\,\cdot b\,}Ae_1\longrightarrow S_1\longrightarrow0,
   \]
   by right multiplications, shows that $\operatorname{pd}_AS_1=3$, in agreement
-  with \Cref{prop:pd-formula}: the two nonzero terms of the formula are
+  with \Cref{prop:pd-formula}: the two finite terms of the formula are
   $\operatorname{pd}_\Delta S_1=1$ and $\operatorname{pd}_\Delta(S_0[1])+1=3$.
 \end{example}
 
 \subsection{Projective dimension and extinction}
 \label{subsec:pd-formula}
 
-For a nonzero object $C$ of $\DerCat[-]{\operatorname{mod}\Delta}$, the
+For a nonzero object $C$ of
+\newline$\DerCat[-]{\operatorname{mod}\Delta}$, the
 derived category of bounded-above complexes with finitely generated
 cohomology, let $\operatorname{pd}_\Delta C$ be the least integer $p$ such
 that $C$ is represented by a bounded-above complex of projective modules
@@ -206,7 +209,7 @@
 
 \begin{proof}
   Every simple $A$-module $S$ is annihilated by $X$: the submodule $XS$ is $0$
-  or $S$, and $XS=S$ would give $S=X^2S=0$. Hence the simple $A$-modules are the
+  or $S$, and $XS=S$ would give $S=X^2S=0$. Hence, the simple $A$-modules are the
   simple $\Delta$-modules, inflated. For such $S$, adjunction and
   \Cref{thm:bar-decomposition} give
   \[
@@ -245,7 +248,7 @@
   \Cref{lemma:pd-detection} applied to the triangles of its cohomology
   truncations: in a triangle $C_1\to C\to C_2\to C_1[1]$, if
   $\Hom{C_1}{S[n]}=0=\Hom{C_2}{S[n]}$, then $\Hom{C}{S[n]}=0$, and
-  $H^i(C)[-i]$ has projective dimension at most $d_L-i$. Hence
+  $H^i(C)[-i]$ has projective dimension at most $d_L-i$. Hence,
   $\operatorname{pd}_\Delta\Phi^rN\leq d_L+rd_R$. If $\Phi^tN\simeq0$, then
   $\Phi^rN\simeq0$ for all $r\geq t$, and \Cref{prop:pd-formula} gives the
   displayed equality and bound. Conversely, if $\operatorname{pd}_AN=p<\infty$,
@@ -264,7 +267,7 @@
   generated modules, by the proof of \Cref{coro:extinction}, and induces an
   endomorphism $[\Phi]$ of $K_0(\Delta)\cong\ZZ^n$. If $\Phi^tN\simeq0$, then
   $[\Phi]^t[N]=0$, so $[N]$ lies in the generalised kernel of $[\Phi]$ on
-  $\mathbb{Q}^n$, which is annihilated by $[\Phi]^n$. Hence
+  $\mathbb{Q}^n$, which is annihilated by $[\Phi]^n$. Hence,
   $[\Phi^rN]=[\Phi]^r[N]=0$ for $r\geq n$, although $\Phi^rN$ may be nonzero:
   a module of extinction time larger than $n$ has iterates that are nonzero but
   invisible in the Grothendieck group. In the main construction,
@@ -299,7 +302,7 @@
   The function $N\mapsto\dim_\kk f_iN$ is the rank of an idempotent matrix
   depending polynomially on $N$, and it is locally constant: the conditions
   $\operatorname{rank}f_i\geq c$ and $\operatorname{rank}(1-f_i)\geq d-c$ are
-  open, and the two ranks add up to $d$. Hence $\operatorname{Rep}_d(\Delta)$
+  open, and the two ranks add up to $d$. Hence, $\operatorname{Rep}_d(\Delta)$
   is the disjoint union of finitely many open and closed subsets on each of
   which all the numbers $\dim_\kk f_iN$ are constant.
 
@@ -314,7 +317,7 @@
   are polynomial functions of~$N$. The rank of the differential $C^j\to
   C^{j+1}$ is the rank of $D^j$. The complex is exact at $C^j$ if and only if
   $\operatorname{rank}D^{j-1}+\operatorname{rank}D^j\geq\dim C^j$, which is an
-  open condition. Hence the sets $U_t=\set{N\in Z}[\Phi^tN\simeq0]$ are
+  open condition. Hence, the sets $U_t=\set{N\in Z}[\Phi^tN\simeq0]$ are
   open. They form an ascending chain, since $\Phi$ preserves zero objects, so
   the chain is stationary, say from $T_Z$ on. Every $N\in Z$ of finite
   extinction time therefore has extinction time at most $T_Z$, and the maximum
--- a/report/sections/05-selection.tex
+++ b/report/sections/05-selection.tex
@@ -85,7 +85,7 @@
 
 \begin{proof}
   By~\eqref{eq:rank-shift}, if $\chi(x)=0$ then $\chi(\mathsf{T}x)=0$, since
-  $HY$ is again finite-dimensional. Hence $\mathsf{T}$ induces an endomorphism
+  $HY$ is again finite-dimensional. Hence, $\mathsf{T}$ induces an endomorphism
   $\overline{\mathsf{T}}$ of $\mathcal{V}$, and $\mathcal{V}$ is spanned by the
   vectors $\overline{\mathsf{T}}^tv$ for $t\geq0$, where $v=\chi([R])$. The
   Fitting decomposition of $\overline{\mathsf{T}}$ gives
@@ -103,7 +103,7 @@
   $\phi_Y(\overline{\mathsf{T}}^tv)=\dim_\kk H^tY=0$ for $t\geq t_0$
   by~\eqref{eq:rank-shift}. For $t\geq\max(t_0,r)$ we have
   $\overline{\mathsf{T}}^tv=\overline{\mathsf{T}}^tv_1$, so $\phi_Y$ vanishes on
-  $\mathcal{V}_2$. Hence
+  $\mathcal{V}_2$. Hence,
   $\dim_\kk H^rY=\phi_Y(\overline{\mathsf{T}}^rv_0)+
   \phi_Y(\overline{\mathsf{T}}^rv_1)=0$.
 \end{proof}
@@ -141,11 +141,11 @@
   is $K_0(B_\Sigma^{\op})$.
 
   In case~\eqref{it:rank-noetherian}, for a finitely generated projective
-  $R$-module $P$ the function
+  $R$-module $P$, the function
   \[
     \rho_P\colon\operatorname{Spec}R\longrightarrow\ZZ,\qquad
     \mathfrak{p}\longmapsto
-    \dim_{\kappa(\mathfrak{p})}P\otimes_R\kappa(\mathfrak{p}),
+    \dim_{\kappa(\mathfrak{p})}P\otimes_R\kappa(\mathfrak{p})
   \]
   is locally constant~\cite[Tag~00NX, Lemma~10.78.2]{Stacks}. The space
   $\operatorname{Spec}R$ has finitely many irreducible
@@ -161,7 +161,7 @@
     \chi_Y([P])=\sum_{i=1}^c\rho_P(Z_i)\,d_i(Y),
   \]
   where $d_i(Y)$ is the sum of the dimensions of the composition factors
-  $R/\mathfrak{m}$ of $Y$ with $\mathfrak{m}\in Z_i$. Hence the image of
+  $R/\mathfrak{m}$ of $Y$ with $\mathfrak{m}\in Z_i$. Hence, the image of
   $\chi$ lies in the span of the $c$ functions $d_i$.
 \end{proof}
 
@@ -232,7 +232,7 @@
   $\lambda_S$: for $U_i$ and $V_i$ the kernel is $\set{n}[n_i=0]$, with basis
   $\varepsilon_h$ for $h\neq i$, and for $W_{ij}$ it is $\set{n}[n_i=n_j]$,
   whose elements are $n_i(\varepsilon_i+\varepsilon_j)+n_k\varepsilon_k$.
-  Hence $T^b$ commutes with $s_S$ for every $b\in K_S$. In $P$ put
+  Hence, $T^b$ commutes with $s_S$ for every $b\in K_S$. In $P$ put
   \[
     \widetilde{S}(r)=T^{rq_S}s_ST^{-rq_S}\qquad(r\in\ZZ).
   \]
@@ -266,13 +266,13 @@
   For instance, for $n=(s-r)\varepsilon_i-r\varepsilon_j$ we have
   $\lambda_{W_{ij}}(n)=(s-r)+r=s$ and $\lambda_{U_j}(n)=r$. In the last two
   cases the weight of the third generator is $\lambda_{U_j}(n)=r+s$ and
-  $\lambda_{V_i}(n)=r+s$, as required. Hence all defining relations of $G$
+  $\lambda_{V_i}(n)=r+s$, as required. Hence, all defining relations of $G$
   hold for the elements $T_\ell$ and $\widetilde{S}(r)$ of $P$.
 
   Conversely, the relations~\eqref{eq:group-conjugation} give
   $T^nS(r)T^{-n}=S(r+\lambda_S(n))$ in $G$ for all $n\in\ZZ^3$, which implies
   the relations $[T^b,S(0)]=1$ for $b\in K_S$; the other relations of $P$ are
-  instances of relations of $G$. Thus there are homomorphisms $P\to G$ sending
+  instances of relations of $G$. Thus, there are homomorphisms $P\to G$ sending
   $s_S$ to $S(0)$ and $G\to P$ sending $S(r)$ to $\widetilde{S}(r)$, both
   fixing the $T_\ell$. Their composites fix all generators, since
   $\widetilde{S}(0)=s_S$ and $T^{rq_S}S(0)T^{-rq_S}=S(r)$.
@@ -315,7 +315,7 @@
   $k\notin\set{i,j}$, and use the relations $[W_{ij},U_k]=[W_{ij},V_k]=1$. If
   $g=T_\ell$, then~\eqref{eq:group-conjugation} gives
   $T_\ell z_NT_\ell^{-1}=[U_i(a-\delta_{\ell i}),V_i(b+\delta_{\ell i})]=z_N$.
-  Hence $z_N$ is central. Finally, with $x=U_i(a)$ and $y=V_i(b)$, centrality
+  Hence, $z_N$ is central. Finally, with $x=U_i(a)$ and $y=V_i(b)$, centrality
   of $z_N=[x,y]$ gives $xyx^{-1}=z_Ny$ and then $x^2yx^{-2}=z_N^2y$; since
   $x^2=1$, we obtain $z_N^2=1$.
 \end{proof}
@@ -395,7 +395,7 @@
   $\pi_m(z_N)=\mathbf{1}+t^{a+b}E_{15}=\mathbf{1}+t^NE_{15}$. The image $F_m$ is
   finite since $M_5(S_m)$ is finite.
 
-  The unit $E_{15}$ has zero product on both sides with every matrix unit
+  The matrix unit $E_{15}$ has zero product on both sides with every matrix unit
   $E_{ab}$, $a\neq b$, occurring above, and every $D_\ell$ has equal entries
   in positions $1$ and $5$, so $\pi_m(z_N)$ is central in $F_m$. Since
   $E_{15}^2=0$, we have
@@ -476,7 +476,7 @@
   and relations $x_iy_i=y_ix_i=1$ and $w_c(x,y)=1$, in which $g_i^{-1}$ is
   replaced by $y_i$, is isomorphic to $R$: the evident homomorphism to $R$ has
   an inverse given by the linear extension of the group homomorphism from $G$
-  to its group of units sending $g_i$ to $x_i$. Hence $R$ is finitely
+  to its group of units sending $g_i$ to $x_i$. Hence, $R$ is finitely
   presented. The map $\alpha$ is an automorphism with inverse the linear
   extension of $\alpha_G^{-1}$, and $e$ is a central idempotent by
   \Cref{prop:central-involutions}; so $(R,\Psi)$ is selection data, by
@@ -497,7 +497,7 @@
   identity in $p_{\chi_m}$ is $2^{-m}$, so $Y_m\neq0$, and $Y_m$ is
   finite-dimensional. For $h\in Z_m$, the substitution $u=hz$ gives
   $hp_{\chi_m}=\chi_m(h)p_{\chi_m}$, and since $Z_m$ is central in $F_m$,
-  every $h\in Z_m$ acts on $Y_m$ as the scalar $\chi_m(h)$. Hence $e_q$ acts on
+  every $h\in Z_m$ acts on $Y_m$ as the scalar $\chi_m(h)$. Hence, $e_q$ acts on
   $Y_m$ as the identity for $0\leq q<m-1$ and as zero for $q=m-1$. By
   \Cref{lemma:selection-iterates}, $H^jY_m$ is the subspace $p_jY_m$, which is
   $Y_m\neq0$ for $j<m$ and zero for $j\geq m$, since then $p_j$ contains the
--- a/report/sections/06-realisation.tex
+++ b/report/sections/06-realisation.tex
@@ -80,14 +80,14 @@
 \end{lemma}
 
 \begin{proof}
-  \eqref{it:fractions-denominator} By induction on the number of morphisms it
+  \eqref{it:fractions-denominator} By induction on the number of morphisms, it
   suffices to give two roofs $(f_1,u_1)$ and $(f_2,u_2)$ from $X$, with
   $u_i\colon X_i\to X$, a common denominator. The Ore condition for the right
   multiplicative system $\mathcal{W}$~\cite[Tag~04VC,
   Definition~4.27.1]{Stacks} gives morphisms $t\colon X'\to X_2$ in
   $\mathcal{W}$ and $g\colon X'\to X_1$ with $u_1g=u_2t$. The morphism
   $u\coloneqq u_2t$ lies in $\mathcal{W}$, and $q(g)=q(u_1)^{-1}q(u)$ is
-  invertible. Hence
+  invertible. Hence,
   \[
     q(f_1)q(u_1)^{-1}=q(f_1g)q(u)^{-1}\qquad\text{and}\qquad
     q(f_2)q(u_2)^{-1}=q(f_2t)q(u)^{-1}.
@@ -205,7 +205,7 @@
   homomorphism $M(Y)\to M(Y')$. Conversely, a homomorphism $M(Y)\to M(Y')$
   consists of three linear maps; compatibility with $s$ and $s'$ forces them
   to be equal, and compatibility with the arrows $a_h$ forces the common map
-  to commute with every $x_h$. Hence $M$ is fully faithful. It is exact
+  to commute with every $x_h$. Hence, $M$ is fully faithful. It is exact
   because exactness of a sequence of $B$-modules is tested at each vertex.
 \end{proof}
 
@@ -264,7 +264,11 @@
     (s's)^{-1}s'a_h=s^{-1}a_h,\qquad(s's)^{-1}s's=\id[E_0].
   \end{gather*}
   Multiplying the relation $\widetilde{p}_j=0$ on the left by $(s's)^{-1}$
-  thus gives $p_j(s^{-1}a_1,\dots,s^{-1}a_d)=0$, constant term included. Hence
+  thus gives
+  \[
+    p_j(s^{-1}a_1,\dots,s^{-1}a_d)=0,
+  \]
+  constant term included. Hence,
   the homomorphism from the free algebra sending $x_h$ to $s^{-1}a_h$ factors
   through~$R$; it is unique since the $x_h$ generate $R$.
 
@@ -310,7 +314,7 @@
   sequence obtained by applying $\Hom{Z}{-}$ to the triangle is the image of
   the idempotent endomorphism $\Hom{p}{-}$ of the long exact sequence obtained
   by applying $\Hom{Z_0}{-}$, and a direct summand of an exact sequence is
-  exact. Hence $\Hom{Z}{-}$ takes the triangle to a long exact sequence.
+  exact. Hence, $\Hom{Z}{-}$ takes the triangle to a long exact sequence.
 
   Let $\iota\colon X_2'\to X_2$ and $\kappa\colon X_1'[1]\to X_1[1]$ be the
   inclusions, let $\pi_2\colon X_2\to X_2'$ and $\pi\colon X_1[1]\to X_1'[1]$
@@ -327,7 +331,11 @@
   $f[1]\kappa g=0$, so $\kappa g=vh$ for some $h$ and $g=\pi\kappa g=v'h$.
 
   Taking $Z=X_1'[1]$ gives $\sigma\colon X_1'[1]\to X_3$ with $v'\sigma=\id$.
-  The morphism $(j',\sigma)\colon X_2'\oplus X_1'[1]\to X_3$ induces a
+  The morphism
+  \[
+    (j',\sigma)\colon X_2'\oplus X_1'[1]\longrightarrow X_3
+  \]
+  induces a
   bijection on $\Hom{Z}{-}$ for every $Z$: a morphism $g\colon Z\to X_3$ is the
   image of $(g',v'g)$, where $j'g'=g-\sigma v'g$, and the injectivity follows by
   applying $v'_*$, since $v'j'=\pi vj\iota=0$, and then the injectivity of
@@ -370,7 +378,7 @@
 $\operatorname{Kar}\mathcal{T}$ is isomorphic to $V$ in $\mathcal{T}$, since
 the inclusion of $\mathcal{T}$ is fully faithful, and so has class zero as well.
 The object $U$ itself need not be isomorphic to an object of $\mathcal{T}$; for
-$p=0$ or $p=\id$ it is. The class $[V]=0$ lives in $K_0(\mathcal{Q})$, and it
+$p=0$ or $p=\id$ it is. The class $[V]=0$ lives in $K_0(\mathcal{T})$, and it
 does not by itself say anything about classes in other categories. The
 cancellation of odd shifts that it reflects reappears, however, in the
 iterates of \Cref{coro:realisation-iterates}, whose classes vanish for $j\geq1$,
@@ -444,8 +452,12 @@
   \operatorname{Kar}\mathcal{Q}.
 \]
 For $r\in R$ the endomorphism $\theta_n(\rho(r))$ of $E_0^{\oplus n}$
-satisfies $\theta_n(\rho(r))=\theta_n(\varepsilon)\theta_n(\rho(r))
-\theta_n(\varepsilon)$, so it is an endomorphism of $U$, and
+satisfies
+\[
+  \theta_n(\rho(r))=\theta_n(\varepsilon)\theta_n(\rho(r))
+  \theta_n(\varepsilon),
+\]
+so it is an endomorphism of $U$, and
 $r\mapsto\theta_n(\rho(r))$ is a homomorphism of unital algebras
 $R\to\operatorname{End}(U)$, since $\theta_n(\varepsilon)=\id[U]$.
 
@@ -487,11 +499,11 @@
   complex of vector spaces is isomorphic to its cohomology with zero
   differential, morphisms between such complexes have only components of
   degree zero, and an idempotent is then a family of idempotent linear maps,
-  whose images are direct summands. Hence $\operatorname{ev}_Y$ extends to
+  whose images are direct summands. Hence, $\operatorname{ev}_Y$ extends to
   $\operatorname{Kar}\mathcal{Q}$, with $(Z,p)$ sent to the image of
   $\operatorname{ev}_Y(p)$. By \Cref{prop:quotient-action}, the functor
   $\operatorname{ev}_Y$ sends $E_0^{\oplus n}$ to $Y^n$ and $\theta_n(m)$ to
-  $m_Y$ for $m\in M_n(R)$. Hence it sends $U$ to $\varepsilon_Y(Y^n)\cong HY$
+  $m_Y$ for $m\in M_n(R)$. Hence, it sends $U$ to $\varepsilon_Y(Y^n)\cong HY$
   and $\theta_n(\rho(r))$ to the action of $r$, by
   \Cref{lemma:selection-matrix}. Since $\operatorname{ev}_Y$ commutes with the
   shift, the statement follows.
@@ -549,7 +561,7 @@
   and $\sum_{b,a}\rho_{ba}f_bf_a=g_\rho v=0$ in $\mathcal{K}$; no further
   compatibility arises, since no arrow ends at~$0$.
 
-  Finally choose chain maps representing the morphisms $f_a$ of $\mathcal{K}$.
+  Finally, choose chain maps representing the morphisms $f_a$ of $\mathcal{K}$.
   For each $\rho\in\mathcal{R}$ the chain map $f_\rho$ is then null-homotopic,
   and we choose a homotopy $h_\rho$ with $dh_\rho+h_\rho d=f_\rho$.
 \end{proof}
@@ -587,7 +599,8 @@
 \subsection{Rectification}
 \label{subsec:rectification}
 
-The following construction applies to any algebra $B=\kk Q/(J_2)$ in which $Q$
+The following construction applies to any algebra
+\newline$B=\kk Q/(J_2)$ in which $Q$
 has vertices $0$, $1$ and $2$, finite sets of arrows $\mathcal{A}_{01}$ from
 $0$ to $1$ and $\mathcal{A}_{12}$ from $1$ to $2$ and no other arrows, and
 $J_2$ is a subspace of the span of the paths of length two, with basis
@@ -698,7 +711,7 @@
   differential is $\partial_K\otimes\id+(-1)^m\id\otimes d$, and the terms of
   $(\sigma\otimes\id)(\id\otimes d)$ and $(\id\otimes d)(\sigma\otimes\id)$
   appear with the opposite signs $(-1)^m$ and $(-1)^{m-1}$. These signs agree
-  with those of $d_P$. Hence all subquotients are acyclic, and so is $C_i$, by
+  with those of $d_P$. Hence, all subquotients are acyclic, and so is $C_i$, by
   induction along the finite filtration and the long exact cohomology sequence.
 
   The terms of $C_i$ are projective right modules, since $\iota_i$ is split in
@@ -708,14 +721,14 @@
   $\left(\begin{smallmatrix}d&t\\0&d_C\end{smallmatrix}\right)$ with
   $dt+td_C=0$, and a contraction $\sigma$ of $C_i$. Then
   $r(x,c)=x-t\sigma c$ is a chain map with $r\iota_i=\id$, and $K(x,c)=(0,\sigma
-  c)$ satisfies $d_PK+Kd_P=\id-\iota_ir$. Hence $\iota_i$ is a homotopy
+  c)$ satisfies $d_PK+Kd_P=\id-\iota_ir$. Hence, $\iota_i$ is a homotopy
   equivalence.
 
   For an arrow $a\colon i\to j$, let $H_a\colon\widetilde{V}_i\to e_jP$ be the
   map of degree $-1$ sending $v$ to $(e_j\otimes v)_a\in e_jL_1[1]$. The
   component of $d_PH_a(v)$ in $L_1[1]$ is $-(e_j\otimes dv)_a=-H_a(dv)$, and its
   component in $L_0$ is $\partial_1(e_j\otimes v)_a=(a\otimes v)_i-(e_j\otimes
-  f_av)_j$. Hence
+  f_av)_j$. Hence,
   \[
     d_PH_a+H_ad=a\iota_i-\iota_jf_a.\qedhere
   \]
@@ -784,7 +797,7 @@
   \]
   in $\DerCat[b]{\operatorname{mod}B}$. By \Cref{prop:encoding-algebra},
   $N_0$ has a projective resolution of length at most two, so that
-  $\delta\in\Hom{N_0}{N_{-3}[4]}=\operatorname{Ext}^4_B(N_0,N_{-3})=0$. Hence
+  $\delta\in\Hom{N_0}{N_{-3}[4]}=\operatorname{Ext}^4_B(N_0,N_{-3})=0$. Hence,
   the identity of $N_0$ lifts to a morphism $N_0\to T_Y$, and together with
   the first morphism of the triangle it gives a morphism
   $N_{-3}[3]\oplus N_0\to T_Y$, which is a quasi-isomorphism by the long exact
--- a/report/sections/07-simulation.tex
+++ b/report/sections/07-simulation.tex
@@ -16,7 +16,7 @@
 of length two, with vertex idempotents $1_0,\dots,1_l$, so that
 $c_i\in1_iK_l1_{i-1}$. Let $W$ be the simple right $K_l$-module at the
 vertex~$l$. For $i>0$ the right module $1_iK_l$ has basis $1_i,c_i$ and radical
-spanned by $c_i$, and $1_0K_l=\kk1_0$. Hence left multiplication by $c_i$ maps
+spanned by $c_i$, and $1_0K_l=\kk1_0$. Hence, left multiplication by $c_i$ maps
 $1_{i-1}K_l$ onto the radical of $1_iK_l$ with kernel the radical of
 $1_{i-1}K_l$, and
 \begin{equation}
@@ -94,7 +94,7 @@
   whose successive syzygies are simple at the following vertices. The ideal
   $I=J_B\otimes K_l+B\otimes J_K$ of $B_1$, where $J_B$ and $J_K$ denote the
   radicals, is nilpotent, being the sum of two commuting nilpotent ideals, and
-  $B_1/I\cong(B/J_B)^{l+1}$ is semisimple. Hence $I$ is the radical of $B_1$
+  $B_1/I\cong(B/J_B)^{l+1}$ is semisimple. Hence, $I$ is the radical of $B_1$
   and the simple left $B_1$-modules are the modules $S\otimes_\kk L$ for simple
   modules $S$ over $B$ and $L$ over $K_l$. The tensor product of projective
   resolutions of $S$ and $L$ is a projective resolution of $S\otimes_\kk L$ of
@@ -149,7 +149,7 @@
     \Phi^{2r}N\cong\bigoplus_{j=0}^r\bigl(M(H^rY)[rb+3j]\bigr)^{\oplus
     \binom{r}{j}}.
   \]
-  Hence $\Phi^{2t}N\simeq0$, since $H^tY=0$, and $\Phi^{2t-2}N\not\simeq0$,
+  Hence, $\Phi^{2t}N\simeq0$, since $H^tY=0$, and $\Phi^{2t-2}N\not\simeq0$,
   since $H^{t-1}Y\neq0$ and hence $M(H^{t-1}Y)\neq0$ by
   \Cref{prop:encoding-algebra}. By \Cref{coro:extinction}, with
   $d_L=d_R=l+2$ and with $2t$ in place of $t$, the module $N$ has finite
@@ -192,7 +192,7 @@
   the rectification: the complexes $\widetilde{V}_i$, the chain maps $f_a$ and
   the homotopies $h_\rho$ of \Cref{prop:lifting} exist by the calculus of
   fractions, but the proof gives no bound on the lengths of the
-  $\widetilde{V}_i$ (\Cref{rem:uncontrolled-length}). Consequently the integer
+  $\widetilde{V}_i$ (\Cref{rem:uncontrolled-length}). Consequently, the integer
   $l$, the number $3(l+2)$ of simple modules of $A$ and the dimension of $A$
   are not determined by the argument. Whether the lifting can be made
   effective, with a bound on $l$, is not settled here. The encoding algebra
@@ -206,7 +206,7 @@
 \begin{remark}
   \label{rem:simulation-bound}
   The main preprint bounds the global dimensions of $\Delta$ by
-  $3l+2$~\cite[Proposition~5.1]{OAI26findim}, by a directed-vertex argument;
+  $3l+2$ \cite[Proposition~5.1]{OAI26findim}, by a directed-vertex argument;
   the bound $l+2$ of \Cref{prop:simulation} comes from the tensor product
   description of the radical of $B_1$. Neither bound is needed beyond
   finiteness, except for the explicit upper bound in \Cref{thm:main}.
--- a/report/sections/A1-computations.tex
+++ b/report/sections/A1-computations.tex
@@ -59,7 +59,8 @@
 
 \begin{enumerate}
   \item \emph{The algebras $C$ and $T$} (\Cref{lemma:algebra-C,lemma:T-symmetric};
-    \texttt{08-D-E/foundations\_certificate.py}, over $\mathbb{F}_2[q]$). All
+    \texttt{08-D-E/foundations\_}\allowbreak\texttt{certificate.py},
+    over $\mathbb{F}_2[q]$). All
     $1000$ associators of basis vectors of $C$ and all $8000$ of $T$ vanish; the
     grading is respected by all products; the trace form of $T$ is symmetric,
     associative and has the stated dual bases; $(ut)^2=q(1+q)z$. An earlier,
@@ -78,7 +79,10 @@
     \texttt{08-D-E/certificate\_receipt.py} confirms that its table equals the
     source table.
   \item \emph{Casimir identities} (\Cref{prop:lifts}; the same script). The sum
-    $\sum_wh_\lambda(w)w^*$ over the twenty basis vectors vanishes, and the sum
+    \[
+      \sum_wh_\lambda(w)w^*
+    \]
+    over the twenty basis vectors vanishes, and the sum
     over the radical basis vectors with left idempotent $r$ equals $r^*$, for
     $r\in\set{e,f}$. The other identities used in that proof are proved in the
     text.
@@ -94,8 +98,10 @@
 $11\,713\,792$, $818\,688$ and $43\,264$, which gives $\dim C_1=1\,623\,889\,344$
 and
 \[
-  \dim_\kk\Lambda=1600+159999^5\cdot1\,623\,889\,344
-  =170\,271\,818\,183\,326\,072\,615\,867\,045\,851\,312\,256.
+  \begin{aligned}
+    \dim_\kk\Lambda&=1600+159999^5\cdot1\,623\,889\,344\\
+    &=170\,271\,818\,183\,326\,072\,615\,867\,045\,851\,312\,256.
+  \end{aligned}
 \]
 The minimised attempt (\texttt{06-two-factor/}, over $\mathbb{F}_{2^{16}}$)
 used minimal bimodule resolutions of the cones and determined, from the ranks
@@ -114,7 +120,7 @@
     $\mathbb{F}_2(q,H_1,H_2)$ in degrees up to two compute minimal projective
     resolutions of $Z_0$ and the groups $\operatorname{Ext}^a(Z_0,Z_0)$ and
     $\operatorname{Ext}^a(Z_0,\Lambda_0)$. A separate script compares the
-    surviving class with the cokernel of $\delta^0$, which has rank one with
+    surviving class with the cokernel of $\delta^0$; this map has rank one and
     kernel spanned by $(1,1)$.
   \item \emph{The one-factor candidate $\Lambda_1$} (\texttt{05-candidate1/}).
     Two runs over $\mathbb{F}_{2^{16}}$ construct minimal bimodule covers, the
```

## Proposals

All four proposals below are **unapplied**. Findings have status **supported**
by direct source inspection; none changes the construction or a theorem. The
diffs are against the final reviewed source, with current hunk line numbers.

### P1 — distinguish omitted runs from resumed stages

Original A1:13–16. The existing statement conflates three Lambda0 finite-field
runs that were not repeated with two Lambda1 stages rerun from cached
cosyzygies, and omits the two resumed stages of the minimised two-factor
attempt. The inventory records 45 invocations, not a fresh complete rerun of
every experiment. The proposed wording reports that recorded scope and avoids
asserting an independently unverified release chronology.

Evidence: `report/notes/appendix-A-inventory.md:760–778, 800, 809, 815–824,
835–842`; the case JSON files record the three original runtimes; the cache
and resume branches are in `computations/05-candidate1/finish.py` and
`computations/06-two-factor/{one_factor,evaluated}.py`. A successful invocation
of `sizes.py` reproduced an intended size stop, not a completed construction.

```diff
--- a/report/sections/A1-computations.tex
+++ b/report/sections/A1-computations.tex
@@ -12,6 +12,7 @@
 outputs are in the directory \texttt{computations/} of the repository described
-in \Cref{app:ai-declaration}. Every script was rerun before the release of the
-article with Python~3.14 and SageMath~10.10; all runs completed and reproduced
-the saved mathematical output, except that five experiments of more than ten
-minutes were rerun only from saved intermediate results. The finite fields
+in \Cref{app:ai-declaration}. The rerun inventory records 45 commands executed
+with Python~3.14 and SageMath~10.10; their mathematical output agreed with the
+saved results. Three finite-field runs for $\Lambda_0$ were not repeated;
+two stages for $\Lambda_1$ and two stages of the minimised two-factor attempt
+were rerun from saved intermediate results. The finite fields
 $\mathbb{F}_{2^{16}}$ below are defined by the modulus
```

### P2 — identify where the parameter values are recorded

Original A1:19. The numerical exponents are saved in result files. Some
scripts derive them from seeded pseudorandom generators rather than listing
the resulting values. This is a factual reproducibility claim, so it is
proposed rather than silently changed.

Evidence: `computations/03-testbed-lambda0/testbed.py:224–233` and
`result-{0,1,2}.json`, and `computations/05-candidate1/candidate.py:204–210`
and `case-{0,1}.json`. For example, the first test-bed output records the
exponents 48448, 2749 and 15926; the source records the seed and selection
algorithm.

```diff
--- a/report/sections/A1-computations.tex
+++ b/report/sections/A1-computations.tex
@@ -18,3 +18,3 @@
 $x^{16}+x^5+x^3+x^2+1$, and the parameters $q$, $H_1$ and $H_2$ are powers of a
-generator, with exponents recorded in the scripts.
+generator, with exponents recorded in the saved outputs.
 
```

### P3 — do not call the whole minimised complex exact

Original A1:101–102. The rank recurrence uses nonzero homology of dimensions
400, 800 and 400 in homological degrees -4, -2 and 0. Exactness in degree 1
identifies the cokernel of $d_2$ with the image of $d_1$. The numerical results
are unchanged, but the asserted justification needs correction.

Evidence: `computations/06-two-factor/sizes.py:30–37,48–49`, `sizes.json`,
and the independently recomputed recurrence in
`computations/W5b-review-checks.py` / `.out`. The supplied dimensions give
C0 = 784704 and C1 = 1377984 after subtracting those homology dimensions.

```diff
--- a/report/sections/A1-computations.tex
+++ b/report/sections/A1-computations.tex
@@ -106,4 +106,5 @@
 The minimised attempt (\texttt{06-two-factor/}, over $\mathbb{F}_{2^{16}}$)
-used minimal bimodule resolutions of the cones and determined, from the ranks
-of an exact complex, cokernels of dimensions $784\,704$ and $1\,377\,984$; it
+used minimal bimodule resolutions of the cones and determined, from the term
+and homology dimensions of the complex, cokernels of dimensions $784\,704$ and
+$1\,377\,984$; it
 stopped, before forming the bimodule matrices, at a linear system with
```

### P4 — remove the stale attribution of both examples to Section 4

Original A1:146–147. Section 4 contains only `ex:derived-powers`, the
three-vertex example of finite extinction. The script also checks a
radical-square-zero two-cycle, which is not an example in the report.
Retain the valid example locator while removing the unsupported collective
section attribution.

Evidence: the sole example environment in
`report/sections/04-trivial-extensions.tex` (original lines 141–158), and
`computations/D-A-checks.py:179–224` (the two separate example functions).

```diff
--- a/report/sections/A1-computations.tex
+++ b/report/sections/A1-computations.tex
@@ -151,3 +151,3 @@
 (\texttt{D-C-selection-checks.py}); the signs of the bar decomposition, of the
-simulation and the two examples of \Cref{sec:extinction}, including
+simulation and two examples, including
 \Cref{ex:derived-powers} (\texttt{D-A-checks.py}); the rectification for an
```

## Validation and limitations

The review is complete: **149 blocks — 102 clean, 44 corrected, 3 marked
proposal**. The three proposal blocks contain the four distinct proposals
above. No content line of the original five files is left outside the table's
ranges; section headings, labels and environment delimiters are attached to
the adjacent blocks. All applied source changes were reread against their
original private snapshots. No optional prose restructuring was applied.

### Source and citation checks

The rest of `report/sections/*.tex`, `report/main.tex`, the bibliography and
`audit/report-notation.md` were read for notation and dependencies. In
particular, left modules, right-projective bimodule resolutions, right-to-left
composition, cohomological shifts, and the opposite-algebra translations were
checked throughout Sections 4–7. Citation checks used the primary sources,
not earlier AI verdicts:

- MY20, published version, Section 1.1 (right-module conventions), Corollary
  4.11, Lemma 4.13(4) and the proof of Theorem 4.17; local Library PDF
  `MY20 - Homological Dimension Formulas for Trivial Extension Algebras.pdf`,
  pp. 4–5 and 20–22. The left-module version uses opposite algebras.
- Sch07a, arXiv:0708.0257v1, Theorem 2.3 (p. 3) and Lemma 4.1 (p. 9), with
  the standing hereditary and right-module conventions checked in the local
  Library PDF `Sch07a - Universal Localisations of Hereditary Rings.pdf`.
- Reg19, arXiv:1901.06704v3, Proposition 4.9 and relations (4.9)–(4.10),
  pp. 26–28 in `Reg19 - On the Finiteness Length of Some Soluble Linear Groups.pdf`.
  This is the attributed parallel argument, not a substitute for the report's
  own centrality calculation.
- The input preprint's Section 2, Sections 3–4, Theorem 1.1 and Proposition
  5.1 were compared with the read-only `build/sections/` source. The original
  bound is 3l+2; the report supplies its own tensor-product argument for l+2.
- Stacks [Tag 00NX](https://stacks.math.columbia.edu/tag/00NX) and
  [Tag 00FR](https://stacks.math.columbia.edu/tag/00FR): locally constant
  projective rank and finitely many irreducible components in the noetherian
  case. Quotient and fraction locators were checked at
  [05RG](https://stacks.math.columbia.edu/tag/05RG),
  [05RI](https://stacks.math.columbia.edu/tag/05RI),
  [04VH](https://stacks.math.columbia.edu/tag/04VH),
  [04VK](https://stacks.math.columbia.edu/tag/04VK),
  [04VC](https://stacks.math.columbia.edu/tag/04VC),
  [04VJ](https://stacks.math.columbia.edu/tag/04VJ) and
  [05RJ](https://stacks.math.columbia.edu/tag/05RJ).
  The existing reference to Tag 04VB, Lemma 4.27.19 is correct: the tag names
  the containing section; the individual lemma is
  [04VL](https://stacks.math.columbia.edu/tag/04VL). It was retained.

### Computations and build

`python3 -B computations/W5b-review-checks.py` exited 0. The script has the
required claim/cases/conventions header; its saved output is
`computations/W5b-review-checks.out`. It independently compares all 179
ordered report/source entries, enumerates compatible corner strings for the
bar dimensions, recovers the five-term boundary-rank calculation, recomputes
the saved minimal-tail recurrence, and checks the saved two-factor profile.
It also freshly executes both exact-polynomial certificates and compares
their stdout byte-for-byte with the saved output. All these finite checks
passed. Long Sage experiments were inspected through source and saved data;
they were not rerun as part of W5b. Historical rerun coverage is precisely the
subject of P1.

The requested command, run from `report/`, exited 0:

```sh
latexmk -pdf -outdir=../scratch/W5b-build main.tex
```

It produced a 51-page PDF. The final log contains no overfull boxes,
undefined citations/references, duplicate destinations or LaTeX errors.
There remain 21 underfull-box messages: the Appendix A page boundary (one
vertical box), the verification table and repository declaration outside this
scope. Rendered pages 8–30 and 45–47, covering the complete scope, were
visually inspected. Later changed pages were rerendered and checked; no
clipping, overlapping or illegible scoped content remains.

The baseline had 31 duplicate-destination warnings and 23 overfull boxes in
the full article. The concurrent review changed the shared preamble's line
breaking and PDF destination definitions; those changes were not made by
W5b. Local changes in this review are exactly the five-file diff above.
`git diff --check` passed for those files. `paper.pdf`, `build/`, the
conversation log and other reviewers' files were not modified by W5b.
No commit or push was made. The result is an AI review with the stated
finite checks, not human certification or an all-degree computational proof.

The machine-readable final receipt is `scratch/W5b-review-receipt.json`;
it records source/build digests so concurrent subsequent changes can be
distinguished from this review state.

### Resumption check after the time-limit interruption

The completed record had been saved before the interruption. On resumption,
all 149 coverage rows, all five scoped source hashes, the four unapplied
proposal hunks and the recorded applied diff were checked again. No scoped
content remained unreviewed. One ambiguity in the explanation of P3 was
removed: exactness in degree 1 is used; it is not the only exact degree.

Six context files had changed concurrently: `report/main.tex`, Sections 01
and 03, and Appendices A2, A3 and A4. Those changes were read for their effect
on the scope. The private build was refreshed successfully, and the original
receipt was preserved as `scratch/W5b-review-receipt-before-resume.json`.
The mathematical computation inputs and the five reviewed manuscript files
were unchanged, so the successful finite checks did not require repetition.
The final receipt and warning count above refer to this refreshed build.
