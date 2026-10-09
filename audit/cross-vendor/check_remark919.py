# Claim checked (Remark 9.19, report p.43): dim C_1 = 1 623 889 344 and dim Lambda ~ 1.7e35,
# from dimensions of the terms of K = L (x) L and its cohomology (E in degrees 0,4; E^2 in degree 2).
# Corner dimensions of r = rad T: e r e = 7, e r f = 4, f r e = 4, f r f = 3; dim Te = eT = 12, Tf = fT = 8.
import numpy as np
Mr = np.array([[7,4],[4,3]], dtype=object)
col = np.array([12,8], dtype=object)   # dim T e_i
row = np.array([12,8], dtype=object)   # dim e_j T
def dimB(n):   # dim B^{-n} = T (x)_I r^{(x)n} (x)_I T
    if n < 0: return 0
    P = np.identity(2, dtype=object)
    for _ in range(n): P = P.dot(Mr)
    return int(col.dot(P).dot(row))
def dimL(j): return dimB(-(j-2)) + dimB(-j) if True else 0
def dimBdeg(j): return dimB(-j) if j <= 0 else 0
def dimLj(j): return dimBdeg(j-2) + dimBdeg(j)
def dimK(j): return sum(dimLj(a)*dimLj(j-a) for a in range(j-2-60, 3) if j-a <= 2)
K = {j: dimK(j) for j in range(-1, 5)}
print('dim B^0, B^-1, B^-2:', dimB(0), dimB(1), dimB(2))
print('dim K^j:', K)
H = {0: 400, 1: 0, 2: 800, 3: 0, 4: 400}
im = {4: 0}
for j in range(4, -1, -1):
    ker = K[j] - im[j]
    im[j-1] = ker - H[j]
print('dim C_1 = dim im d^{-1} =', im[-1])
Y = 159999**4 * im[-1]
F = 800 + 159999 * Y
print('dim F =', F, ' dim Lambda = %.3e' % (800 + F))
