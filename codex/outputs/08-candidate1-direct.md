Model: GPT-6 (Codex); effort: unknown.

Both parameter choices over \(\mathbf F_{2^{16}}\) support the prediction:

- \(\dim F=352,\quad \dim\Lambda_1=392,\quad \dim Z=16\).
- Self-Ext dimensions in degrees \(1,2,3\): **\((1,0,0)\)**.
- Regular-target Ext dimensions: **\((0,0,0)\)**.
- \(W^{-4},\ldots,W^4\) have dimensions \((0,0,0,0,1,1,0,0,0)\).
- \(\delta^0=\begin{pmatrix}1&1\\0&0\end{pmatrix}\), with kernel \(k(1,1)\) and cokernel \(k\).

Candidate 1 fails self-orthogonality in both samples. Stopped at degree 3; largest guarded solve: 768 unknowns.

[Report](audit/08-candidate1-codex.md) · [Code, matrices and reproduction instructions](computations/05-candidate1/README.md)