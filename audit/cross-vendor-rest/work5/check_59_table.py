# Claim: the table of conjugating vectors n in the report's proof of Prop 5.9 has
#   lambda_S(n), lambda_S'(n) equal to the prescribed parameters (and third generator weight r+s).
# Scope: all distinct (i,j,k) in {1,2,3}, symbolic r,s.  Weights: lamU_i(n)=-n_i, lamV_i=n_i, lamW_ij=n_i-n_j.
import sympy as sp, itertools
r,s=sp.symbols('r s')
def e(i,c): v=[0,0,0]; v[i-1]=c; return v
def add(*vs): return [sum(x) for x in zip(*vs)]
lU=lambda i,n:-n[i-1]; lV=lambda i,n:n[i-1]; lW=lambda i,j,n:n[i-1]-n[j-1]
ok=True
for i,j,k in itertools.permutations([1,2,3]):
    T=[ (add(e(i,-r),e(j,-s)), [lU(i,_n:=None) if 0 else None]) ]
    cases=[
     (add(e(i,-r),e(j,-s)), lambda n:(lU(i,n),lU(j,n)), (r,s)),
     (add(e(i,r),e(j,s)), lambda n:(lV(i,n),lV(j,n)), (r,s)),
     (add(e(i,-r),e(j,s)), lambda n:(lU(i,n),lV(j,n)), (r,s)),
     (add(e(i,s-r),e(j,-r)), lambda n:(lW(i,j,n),lU(j,n)), (s,r)),
     (add(e(i,s),e(k,-r)), lambda n:(lW(i,j,n),lU(k,n)), (s,r)),
     (add(e(i,r),e(j,r-s)), lambda n:(lW(i,j,n),lV(i,n)), (s,r)),
     (add(e(i,s),e(k,r)), lambda n:(lW(i,j,n),lV(k,n)), (s,r)),
     (add(e(i,-r),e(j,-(r+s))), lambda n:(lU(i,n),lW(i,j,n),lU(j,n)), (r,s,r+s)),
     (add(e(i,r+s),e(j,r)), lambda n:(lW(i,j,n),lV(j,n),lV(i,n)), (s,r,r+s)),
    ]
    for n,f,want in cases:
        got=tuple(sp.expand(x) for x in f(n))
        if got!=tuple(sp.expand(x) for x in want): ok=False; print('FAIL',i,j,k,n,got,want)
print('table of Prop 5.9:', 'all ok' if ok else 'FAILURES')
