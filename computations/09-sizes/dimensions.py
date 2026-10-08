"""Dimension of the bimodule C_1 and of the algebra Lambda of report Remark rem:ar-sizes.

Claim: dim C_1 = 1 623 889 344 and dim Lambda = 1600 + 159999^5 * dim C_1 (about 1.703e35).
Method: C_1 = coker(K^{-2} -> K^{-1}) is the image of K^{-1} -> K^0, since K is exact in negative degrees;
as K vanishes above degree 4, dim C_1 = sum_{j=0}^{4} (-1)^j (dim K^j - dim H^j(K)), with
H^0 = E, H^2 = E^2, H^4 = E (dim E = 400) and H^1 = H^3 = 0 (report Section 9.5).
K = L (x)_k L with L^j = B^{j-2} + B^j, B^{-n} = T (x)_I r^{(x)_I n} (x)_I T the relative bar resolution.
Corner dimensions of T = C x| DC (rows: left idempotent e, f; columns: right idempotent):
T: [[8,4],[4,4]], radical r: [[7,4],[4,3]] (report Section 9.1-9.2).
Exact integer arithmetic. Author: Claude Opus 5.5, 2026-10-08.
"""

def matmul(a, b):
    return [[sum(a[i][k] * b[k][j] for k in range(2)) for j in range(2)] for i in range(2)]

T = [[8, 4], [4, 4]]
R = [[7, 4], [4, 3]]

def bar_dim(n):
    m = T
    for _ in range(n):
        m = matmul(m, R)
    m = matmul(m, T)
    return sum(sum(row) for row in m)

def B(j):
    return bar_dim(-j) if j <= 0 else 0

def L(j):
    return B(j - 2) + B(j)

def K(j):
    return sum(L(a) * L(j - a) for a in range(j - 2, 3))

H = {0: 400, 2: 800, 4: 400}
dim_C1 = sum((-1) ** j * (K(j) - H.get(j, 0)) for j in range(0, 5))
dim_E, dim_Ee = 400, 400 ** 2
dim_Y = (dim_Ee - 1) ** 4 * dim_C1          # four cosyzygies Sigma
dim_F = 2 * dim_E + (dim_Ee - 1) * dim_Y    # fibre of E_{H1} + E_{H2} + free cover -> Y
dim_Lambda = 2 * dim_E + dim_F
print("dim T, dim B^0, B^-1, B^-2:", sum(map(sum, T)), B(0), B(-1), B(-2))
print("dim K^j, j=0..4:", [K(j) for j in range(5)])
print("dim C_1 =", dim_C1)
print("dim F =", dim_F)
print("dim Lambda =", dim_Lambda, "(%.4e)" % dim_Lambda)
assert dim_C1 == 1623889344
