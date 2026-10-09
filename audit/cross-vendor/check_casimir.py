# Claim checked: the multiplication image of the twisted Casimir, sum_b b * h_lam^{-1}(b^vee) over the 20 basis
# vectors b of T (b^vee = trace dual), vanishes in GF(2)(q,lam). Used only as a remark in A9.md, Prop 9.14(c).
import os, sys
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from talg import *
def trdual(w):
    return w.upper() if w in Cb else w.lower()
def hinv(v):
    w = vector(K, v)
    for i in range(10, 20):
        w[i] = w[i] / lam
    return w
s = zero()
for b in Tb:
    s += mul(bv(b), hinv(bv(trdual(b))))
print('sum_b b h^{-1}(b^vee) =', s)
s1 = zero()
for b in Tb:
    s1 += mul(bv(b), bv(trdual(b)))
print('untwisted Higman element sum_b b b^vee =', s1)
