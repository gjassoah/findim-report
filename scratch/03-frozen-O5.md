## O.5 From an Auslander–Reiten counterexample to infinite findim, with one more simple module

**Proposition O.5.** Let Λ be finite-dimensional and M a f.g. nonprojective left Λ-module with
Ext^i_Λ(M, M ⊕ Λ) = 0 for all i ≥ 1. Put G = Λ ⊕ M, Γ = End_Λ(G)^op and F = Hom_Λ(G, −), so that F(X) is
a left Γ-module and F restricts to an equivalence add G ≃ proj Γ with F(G) = Γ. Let π : P → M be a
projective cover and S = coker(F π). Then S ≠ 0 and Ext^i_Γ(S, Γ) = 0 for all i ≥ 0. Consequently (O.4
applied to Γ^op) the algebra End_Λ(Λ ⊕ M) has infinite left little finitistic dimension, with witnesses
Tr Ω^{n−1} S (transposes over Γ), and its number of simple modules is the number of isomorphism classes of
indecomposable summands of Λ ⊕ M.

*Proof.* (a) Resolution. Put K₀ = ker π and choose inductively right add G-approximations g_j : G_j → K_j
with K_{j+1} = ker g_j; they are surjective because Λ ∈ add G. This gives an exact sequence
⋯ → G₁ → G₀ → P → M → 0 with all terms in add G. Applying F: F is left exact, F(K_j) = ker F(g_{j−1})
(resp. ker Fπ for j = 0) and F(G_j) → F(K_j) is surjective by the approximation property. Hence
⋯ → F G₁ → F G₀ → F P → F M → S → 0 is a projective resolution of S.
(b) S ≠ 0: if Fπ were surjective, id_M (on the summand M of G) would lift through π, so π would split and
M would be projective.
(c) Ext into Γ. For Y ∈ add G, Hom_Γ(FY, Γ) = Hom_Γ(FY, FG) ≅ Hom_Λ(Y, G) naturally (Yoneda on add G). So
Ext^i_Γ(S, Γ) is the cohomology in degree i of 0 → Hom_Λ(M, G) → Hom_Λ(P, G) → Hom_Λ(G₀, G) → ⋯ (with
Hom_Λ(M, G) in degree 0).
(d) This complex is exact. The modules P, G_j lie in add G and Ext^{≥1}_Λ(G, G) = 0 (the hypothesis, since
Ext^{≥1}(Λ, −) = 0); so the resolution ⋯ → G₀ → P → M computes Ext^*_Λ(M, G) after applying Hom(−, G). By
hypothesis Ext^{≥1}_Λ(M, G) = 0, so the complex Hom(P, G) → Hom(G₀, G) → ⋯ has cohomology Hom_Λ(M, G) in
degree 0 and none elsewhere; including the term Hom_Λ(M, G) (which maps injectively, π being surjective)
gives an exact complex. ∎ 

*Application* . There Λ has eight simple modules and
Z = (X, Y, ι) is built from the one-dimensional simple X = s ⊗ s; if Z is indecomposable, End_Λ(Λ ⊕ Z) is a
finite-dimensional algebra over 𝔽₂(q, H₁, H₂) with **nine** simple modules and infinite little finitistic
dimension. It is far more explicit than the algebra of the main preprint (dimension 2·400 + dim F + …, all
data finite), but not small. Note that it avoids the symmetric-algebra transfer of the Tachikawa companion.

