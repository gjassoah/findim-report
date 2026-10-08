# Conventions and notation for the report

Claude Opus 5.5, 2026-10-08. Binding for every dossier note (`report/notes/proofs/`), every verification
job and every section of `report/`. Where a source uses another convention, the note translating it says
so explicitly at the point of use.

## Global conventions

| Item | Convention in the report | Main preprint | AR preprint | Note |
|---|---|---|---|---|
| Field | k arbitrary unless stated; ℂ for the main construction; k = 𝔽₂(q, H₁, H₂) for the AR route | ℂ (also any k for §3–6) | 𝔽₂(q,H₁,H₂) | char 2 kills signs in the AR route |
| Algebras | finite-dimensional unless stated (R, kG may be infinite-dimensional) | same | same | |
| Modules | **left** modules, finitely generated, unless "right" is said; right A-modules = left A^op-modules | left | left (triangular modules as triples) | |
| Composition and paths | right to left: βα means "first α, then β"; an arrow a : i → j lies in e_j A e_i | right to left | (check per section) | |
| Complexes | **cohomological** grading; K[s]^n = K^{n+s}, d_{K[s]} = (−1)^s d_K | cohomological | **homological**, P[a]_j = P_{j−a} | translate AR statements: homological degree j ↔ cohomological −j |
| Stable category | for A self-injective (here symmetric), stmod A, shift [1] = Ω⁻¹ (cosyzygy), so [−1] = Ω | — | [1] = inverse syzygy | same |
| Tate groups | H^a(X, Y) = stable Hom(X, Y[a]), a ∈ ℤ; H^a = Ext^a for a ≥ 1 | — | stHom(X, X[a]) | |
| Tate duality | A symmetric: D H^a(X, Y) ≅ H^{−1−a}(Y, X), natural, via composition into H^{−1}(X, X) and a trace (Linckelmann, arXiv:1211.5999v1 §2) | — | (Linckelmann 2013 cited) | normalisation of the trace fixed in §2 of the report |
| Transpose | Tr M = coker(P₀* → P₁*) for a **minimal** presentation P₁ → P₀ → M; (−)* = Hom_A(−, A) | — | — | |
| Syzygy | Ω M = kernel of a projective cover (it **may** have projective summands, e.g. the right simple at 2 of k(1 → 2); V-C1); in the stable category Ω is taken up to projective summands. For witnesses with Ext¹(U, A) = 0, Ω U has no projective summand | — | — | |
| Derived tensor | ⊗ᴸ; F = X ⊗ᴸ_D − for a D-bimodule X | same | — | |
| Trivial extension | D ⋉ X with (d, x)(d′, x′) = (dd′, dx′ + xd′) | same | T = C ⋉ DC | |
| Toda brackets | for X →f Y →g Z →h W with gf = 0 = hg: ⟨h, g, f⟩ ⊆ Hom(X[1], W), indeterminacy h·Hom(X[1], Z) + Hom(Y[1], W)·f[1]; in graded endomorphism rings ⟨a, b, c⟩ has degree |a|+|b|+|c|−1 | — | — | graded translation: for a, b, c of degrees p, q, r use O[−p−q−r] →c O[−p−q] →b O[−p] →a O (maps shifted); right composition with d of degree s is precomposition with d[−p−q−r−s]; no sign is introduced (V-C1) |
| findim | little left finitistic dimension: sup of pd of f.g. left modules of finite pd | same | (left) | right findim of Γ = left findim of Γ^op |
| Weights | for a ℤ-graded algebra, δ(x) = internal degree of a homogeneous stable class; twist h_H scales degree-n part by H^n; inverse-twist weight w = δ | — | twist conventions differ (see audit/11 §1) | |

## Symbols reserved

A (final algebra of a statement), Λ (triangular algebra of the AR route), Γ = End(Λ ⊕ M)^op, D (an algebra
of finite global dimension in the trivial-extension mechanism; D also the k-dual functor — **clash**: the
report writes the duality as D = Hom_k(−, k) and the base algebra of the trivial extension as **B₀** or
another letter, to be fixed in W1 with the outline), X (bimodule) vs X (the AR module s ⊗ s) — **clash**:
the AR module is written **S₂ = s ⊗ s** or **X_AR**, decided in the outline; R, e, α, H for selection data;
B for the encoding algebra; T = C ⋉ DC; s simple; τ the degree-3 generator; β₀ ∈ H^{−1}.

Clashes to resolve in the outline: D (duality vs algebra), X (bimodule vs module), T (bimodule summand in the
main preprint vs symmetric algebra in the AR preprint), F (functor vs fibre bimodule), H (selection functor
vs twist parameter H vs Tate groups H^a), C (algebra of the AR route vs the chain algebra C = A_{l+1} of the
simulation).
