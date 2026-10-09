# Claim: Prop 5.14 -- the matrices pi(T_l)=D_l, pi(U_i(r))=1+t^r E_{1,i+1}, pi(V_i(r))=1+t^r E_{i+1,5},
#   pi(W_ij(r))=1+t^r E_{i+1,j+1} satisfy all relations (5.7),(5.8) of Definition 5.6 in GL5(F2[t^{+-1}]),
#   hence in GL5(S_m) for every m; and pi([U_i(a),V_i(b)]) = 1+t^{a+b}E15.
# Conventions: [x,y]=x y x^-1 y^-1; indices i,j in {1,2,3}; matrices act on columns, 1-based units.
# Method: the parameter t^r is replaced by an independent commuting symbol (a for r, b for s), so each
#   check is exact for ALL integers r,s (entries are monomials).  (5.7) checked as D_l X(a) D_l^-1 = X(a*t^lam).
#   Identities are verified over Z[t^{+-1},a,b]; only U^2=1 needs reduction mod 2.
import sympy as sp, itertools
t,a,b=sp.symbols('t a b')
I5=sp.eye(5)
def E(p,q):
    M=sp.zeros(5); M[p-1,q-1]=1; return M
U=lambda i,x: I5+x*E(1,i+1)
V=lambda i,x: I5+x*E(i+1,5)
W=lambda i,j,x: I5+x*E(i+1,j+1)
def D(l):
    M=sp.eye(5); M[l,l]=t; return M
inv=lambda M: sp.simplify(M.inv())
def comm(X,Y): return sp.simplify(X*Y*inv(X)*inv(Y))
def eq(X,Y,mod2=False):
    Dm=sp.expand(X-Y)
    if mod2: Dm=Dm.applyfunc(lambda e: sp.Poly(sp.expand(e*t**10*a**4*b**4),t,a,b,modulus=2).as_expr())
    return Dm==sp.zeros(5)
I=[1,2,3]; ok=True; n=0
def chk(c,name):
    global ok,n; n+=1
    if not c: ok=False; print('FAIL',name)
# T commute
for l,m in itertools.product(I,I): chk(eq(D(l)*D(m),D(m)*D(l)),'TT')
# (5.7)
for l in I:
    for i in I:
        d=1 if i==l else 0
        chk(eq(sp.simplify(D(l)*U(i,a)*inv(D(l))),U(i,a*t**(-d))),'TU')
        chk(eq(sp.simplify(D(l)*V(i,a)*inv(D(l))),V(i,a*t**d)),'TV')
        for j in I:
            if j==i: continue
            e=(1 if i==l else 0)-(1 if j==l else 0)
            chk(eq(sp.simplify(D(l)*W(i,j,a)*inv(D(l))),W(i,j,a*t**e)),'TW')
# (5.8)
for i in I:
    chk(eq(U(i,a)*U(i,a),I5,mod2=True),'U^2')
    for j in I:
        if j==i: continue
        chk(eq(comm(U(i,a),U(j,b)),I5),'UU'); chk(eq(comm(V(i,a),V(j,b)),I5),'VV')
        chk(eq(comm(U(i,a),V(j,b)),I5),'UV')
        for h in I:
            if h!=i: chk(eq(comm(W(i,j,b),U(h,a)),I5),'WU')
            if h!=j: chk(eq(comm(W(i,j,b),V(h,a)),I5),'WV')
        chk(eq(comm(U(i,a),W(i,j,b)),U(j,a*b)),'UW')
        chk(eq(comm(W(i,j,b),V(j,a)),V(i,a*b)),'WV2')
    chk(eq(comm(U(i,a),V(i,b)),I5+a*b*E(1,5)),'z')
print('checks',n,'all ok' if ok else 'FAILURES')
# Z_m: 1+xE15 additive in x; check for m=1..6 that the 2^m products of pi(z_0..z_{m-1}) are distinct
for m in range(1,7):
    s=set()
    for bits in itertools.product([0,1],repeat=m):
        x=tuple(bits)  # coefficient vector of sum t^N in basis 1..t^{m-1}
        s.add(x)
    # products: (1+xE)(1+yE)=1+(x+y)E since E15^2=0
    assert (E(1,5)*E(1,5))==sp.zeros(5)
print('E15^2=0 ok; Z_m=(S_m,+)=(Z/2)^m via basis 1..t^{m-1}')
