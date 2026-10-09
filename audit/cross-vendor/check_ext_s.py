# Sanity check (not needed for the proof in A9.md): minimal projective resolution of the simple T-module s
# (at f) over T, field GF(2)(q) exact; prints multiplicities of Te and Tf in P_n for n <= NMAX.
# dim Ext^n_T(s,s) = multiplicity of Tf in P_n, dim Ext^n_T(s,s_e) = multiplicity of Te.
import os, sys
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from talg import *
from sage.all import matrix, vector, block_matrix, identity_matrix

NMAX = int(sys.argv[1]) if len(sys.argv) > 1 else 7
# left regular representation: L[b] is the matrix of left multiplication by basis vector b on T (column convention)
Lmat = {b: matrix(K, DIM, DIM, lambda i, j: MT[idx[b]][j][i]) for b in Tb}
Te_basis = [i for i, b in enumerate(Tb) if Tcorner(b)[1] == 'e']   # T e = span of basis vectors with right corner e
Tf_basis = [i for i, b in enumerate(Tb) if Tcorner(b)[1] == 'f']
radidx = [idx[b] for b in rad_basis]

# A submodule M of a free module F = T e^{a} + T f^{b} is stored as a matrix whose columns span M inside
# the ambient space of F (coordinates: blocks of size 20 for each summand, restricted to the corner).
class Free:
    def __init__(self, idems):
        self.idems = idems   # list of 'e'/'f'
        self.blocks = [Te_basis if i == 'e' else Tf_basis for i in idems]
        self.dim = sum(len(bl) for bl in self.blocks)

    def act(self, b):
        # matrix of left multiplication by basis vector b on F
        mats = []
        for bl in self.blocks:
            mats.append(Lmat[b].matrix_from_rows_and_columns(bl, bl))
        from sage.all import block_diagonal_matrix
        return block_diagonal_matrix(mats) if mats else matrix(K, 0, 0)


def submodule_top(F, M):
    """M: matrix with columns spanning a submodule of F. Return list of (idempotent, vector) generating M minimally."""
    # rad M = sum over radical basis b of b*M
    radvecs = [F.act(b) * M for b in rad_basis]
    RM = block_matrix([radvecs], subdivide=False) if radvecs else matrix(K, F.dim, 0)
    gens = []
    for idem in ('e', 'f'):
        E = F.act(idem)
        EM = E * M
        # choose vectors of e M not in rad M + chosen
        cur = RM
        colsp = cur.column_space()
        for c in EM.columns():
            if c not in colsp:
                gens.append((idem, c))
                cur = cur.augment(matrix(K, F.dim, 1, list(c)))
                colsp = cur.column_space()
    return gens


def cover_map(F, gens):
    """Free module P = sum T idem, map P -> F sending generator to vector; return (P, matrix)."""
    P = Free([g[0] for g in gens])
    cols = []
    for (idem, vec), bl in zip(gens, P.blocks):
        for i in bl:
            cols.append(F.act(Tb[i]) * vec)
    return P, matrix(K, cols).transpose()


# s = T f / rad(T f): start with Omega s = rad(T f) inside F0 = T f
F0 = Free(['f'])
# rad(Tf) = span of radical basis vectors in Tf
M = matrix(K, [[1 if F0.blocks[0][r] == idx[b] else 0 for r in range(F0.dim)] for b in rad_basis if Tcorner(b)[1] == 'f']).transpose()
print('P_0 = Tf')
F = F0
for n in range(1, NMAX + 1):
    gens = submodule_top(F, M)
    ne = sum(1 for g in gens if g[0] == 'e'); nf = len(gens) - ne
    print('P_%d = Te^%d + Tf^%d' % (n, ne, nf), flush=True)
    P, phi = cover_map(F, gens)
    Kmat = phi.right_kernel_matrix().transpose()   # columns span kernel = next syzygy inside P
    F, M = P, Kmat
