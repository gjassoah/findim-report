#!/usr/bin/env python3
"""Codex job 07.
Claim: stable Hom degrees -7..7 and <tau,beta,beta>, <beta,beta,beta>.
Cases: exact F_2(q), primitive parameters in GF(2^8), GF(2^12), GF(2^16).
Conventions: left T-modules, column maps, [1]=Omega^-1, <h,g,f>.
Run: python computations/04-toda-bracket/toda.py [exact|8|12|16].
All generated evidence and Sage state stay in this script's directory.
"""
import os
import sys
from pathlib import Path
HERE = Path(__file__).resolve().parent
os.environ['DOT_SAGE'] = str(HERE / '.sage')
sys.dont_write_bytecode = True
sys.path.insert(0, str(HERE.parent / '02-ar-finite-data'))
from importlib import import_module
from functools import lru_cache
from sage.all import (GF, PolynomialRing, VectorSpace, matrix, vector,
                      identity_matrix, block_diagonal_matrix)
old = import_module('04_trivial_extension')


class Module:
    def __init__(self, A, actions, name):
        self.A, self.K, self.act, self.name = A, A.K, actions, name
        self.dim = actions[0].nrows()


def check_map(X, Y, F):
    assert F.ncols() == X.dim and F.nrows() == Y.dim
    assert all(F*a == b*F for a,b in zip(X.act,Y.act)), (X.name,Y.name)
    return F


@lru_cache(maxsize=None)
def hom(X, Y):
    """Full Hom, with all twenty action equations, row-major coordinates."""
    K, n, m = X.K, X.dim, Y.dim
    In, Im = identity_matrix(K,n), identity_matrix(K,m)
    eq = matrix(K,0,m*n)
    for a,b in zip(X.act,Y.act):
        eq = eq.stack(Im.tensor_product(a.transpose())-b.tensor_product(In))
    return [check_map(X,Y,matrix(K,m,n,v)) for v in eq.right_kernel().basis()]


def linear_combination(basis, target, transform=lambda F:F):
    if not basis:
        assert target.is_zero()
        raise ValueError('empty basis: caller must handle zero')
    K = target.base_ring()
    mat = matrix(K,[transform(F).list() for F in basis]).transpose()
    coeff = mat.solve_right(vector(K,target.list()))
    result = sum((c*F for c,F in zip(coeff,basis)),0*basis[0])
    assert transform(result)==target
    return result


def projective(A, vertices, name):
    ids,actions = old.projective(A,vertices)
    P = Module(A,actions,name)
    P.vertices, P.ids = vertices, ids
    return P


def cover(M, degree):
    A,K = M.A,M.K
    V=VectorSpace(K,M.dim)
    R=V.subspace([c for n,a in zip(A.names,M.act) if n not in ('e','f') for c in a.columns()])
    span=R
    gens,vertices=[],[]
    for v in ('e','f'):
        for g in M.act[A.names.index(v)].columns():
            if g not in span:
                gens.append(g); vertices.append(v)
                span=V.subspace(list(span.basis())+[g])
    P=projective(A,vertices,'P'+str(degree))
    pi=matrix(K,[M.act[b]*g for ids,g in zip(P.ids,gens) for b in ids]).transpose()
    check_map(P,M,pi)
    assert pi.rank()==M.dim
    ker=pi.right_kernel()
    inc=ker.basis_matrix().transpose()
    radP=VectorSpace(K,P.dim).subspace([c for n,a in zip(A.names,P.act) if n not in ('e','f') for c in a.columns()])
    assert ker.is_subspace(radP)
    acts=[inc.solve_right(a*inc) for a in P.act]
    N=Module(A,acts,'M'+str(degree+1))
    check_map(N,P,inc)
    assert pi*inc==0 and inc.rank()+pi.rank()==P.dim
    return P,pi,N,inc


def proj_lift(P, Y, Z, pi, F):
    """Lift P -> Z through Y -> Z by idempotent-fixed generator preimages."""
    check_map(Y,Z,pi); check_map(P,Z,F)
    cols=[]; offset=0
    for v,ids in zip(P.vertices,P.ids):
        iv=P.A.names.index(v)
        target=F.column(offset+ids.index(iv))
        pre=pi.solve_right(target)
        pre=Y.act[iv]*pre
        assert pi*pre==target
        cols.extend(Y.act[b]*pre for b in ids)
        offset+=len(ids)
    G=matrix(P.K,cols).transpose()
    check_map(P,Y,G)
    assert pi*G==F
    return G


def quotient(M, relation, name):
    """Return quotient and a surjective column-coordinate quotient map."""
    K=M.K
    Q=relation.transpose().right_kernel().basis_matrix()
    assert Q.rank()==M.dim-relation.rank() and Q*relation==0
    sec=Q.solve_right(identity_matrix(K,Q.nrows()))
    N=Module(M.A,[Q*a*sec for a in M.act],name)
    check_map(M,N,Q)
    return N,Q


def stable_data(X,Y,P,pi):
    """Factor through a projective cover P -> Y; all projective factors lift."""
    H=hom(X,Y)
    factors=[pi*F for F in hom(X,P)]
    V=VectorSpace(X.K,X.dim*Y.dim)
    W=V.subspace([F.list() for F in factors])
    return H,W,int(len(H)-W.dimension())


def stable_via_injection(X,Y,P,i):
    """All projective factors extend across X -> P since T is symmetric."""
    H=hom(X,Y)
    V=VectorSpace(X.K,X.dim*Y.dim)
    W=V.subspace([(F*i).list() for F in hom(P,Y)])
    return H,W,int(len(H)-W.dimension())


def run(label,K,q):
    print('FIELD',label,'q =',q,flush=True)
    if K.is_finite():
        print('modulus',K.modulus(),'order(q)',q.multiplicative_order(),flush=True)
        assert q.multiplicative_order()==K.order()-1
    A=old.TrivialExtension(K,q)
    old.structural(A)
    s=Module(A,[matrix(K,1,1,[int(n=='f')]) for n in A.names],'s')
    M=[s]; P=[]; pi=[]; inc=[None]
    for d in range(8):
        p,c,n,i=cover(M[-1],d)
        P.append(p); pi.append(c); M.append(n); inc.append(i)
        print('cover',d,'dim(M)',M[d].dim,'vertices',p.vertices,'dim(kernel)',n.dim,flush=True)
    dimensions={}
    for a in range(-7,8):
        if a<=0:
            d=-a
            _,_,dim=stable_data(s,M[d],P[d],pi[d])
        else:
            _,_,dim=stable_via_injection(M[a],s,P[a-1],inc[a])
        dimensions[a]=dim
        assert dim==int((a>=0 and a%3==0) or (a<0 and (-a-1)%3==0)),(a,dim)
    print('stable dimensions',dimensions,flush=True)
    # beta_0(1)=F, the dual of f, inside rad(Tf)=M1.
    fids=P[0].ids[0]
    F=vector(K,[int(A.names[b]=='F') for b in fids])
    beta=[inc[1].solve_right(matrix(K,P[0].dim,1,F))]
    check_map(s,M[1],beta[0])
    bh,bfac,bd=stable_data(s,M[1],P[1],pi[1])
    assert bd==1 and vector(K,beta[0].list()) not in bfac
    lifts=[]
    for i in range(1,3):
        L=proj_lift(P[i-1],P[i],M[i],pi[i],beta[i-1]*pi[i-1])
        b=inc[i+1].solve_right(L*inc[i])
        check_map(M[i],M[i+1],b)
        lifts.append(L); beta.append(b)
    assert beta[1]*beta[0]==0
    # Choose a generator of the one-dimensional stable Hom(M3,s).
    th,tf,td=stable_via_injection(M[3],s,P[2],inc[3])
    assert td==1
    tau=next(t for t in th if vector(K,t.list()) not in tf)
    assert tau*beta[2]==0  # Hom(M2,s)=0, not only stable zero.
    print('beta0 = F; beta1 beta0 = 0; tau beta2 = 0 (literal maps)',flush=True)
    # Cone of tau: (s + P2)/(tau,inc3)M3, with C -> M2.
    total=Module(A,[block_diagonal_matrix([a,b]) for a,b in zip(s.act,P[2].act)],'s+P2')
    C,Q=quotient(total,tau.stack(inc[3]),'Cone(tau)')
    j=Q[:,0:1]
    rhs=matrix(K,M[2].dim,1).augment(pi[2])
    p=rhs*Q.solve_right(identity_matrix(K,C.dim))
    assert p*Q==rhs
    check_map(s,C,j); check_map(C,M[2],p)
    assert j.rank()==1 and p.rank()==M[2].dim and p*j==0
    HC=hom(M[1],C)
    L=linear_combination(HC,beta[1],lambda x:p*x)
    scalar=j.solve_right(L*beta[0])[0,0]
    assert j*matrix(K,1,1,[scalar])==L*beta[0]
    print('cone(tau) dimension',C.dim,'dim Hom(M1,C)',len(HC),'c =',scalar,flush=True)
    # Independent beta triple: cone of beta0 with s -> P0 given by F.
    ib=inc[1]*beta[0]
    totalb=Module(A,[block_diagonal_matrix([a,b]) for a,b in zip(M[1].act,P[0].act)],'M1+P0')
    CB,QB=quotient(totalb,beta[0].stack(ib),'Cone(beta0)')
    SigmaS,rho=quotient(P[0],ib,'Sigma(s)')
    r=linear_combination(hom(P[0],M[3]),beta[2]*beta[1],lambda x:x*inc[1])
    # (i1,1): Cone(beta0) -> P0, and (beta1,0): Cone(beta0) -> M2.
    rawu=inc[1].augment(identity_matrix(K,P[0].dim))
    rawg=beta[1].augment(matrix(K,M[2].dim,P[0].dim))
    secb=QB.solve_right(identity_matrix(K,CB.dim))
    U=rawu*secb; G=rawg*secb
    assert U*QB==rawu and G*QB==rawg
    check_map(CB,P[0],U); check_map(CB,M[2],G)
    rawp=matrix(K,SigmaS.dim,M[1].dim).augment(rho)
    pb=rawp*secb
    assert pb*QB==rawp
    V=(beta[2]*G+r*U)*pb.solve_right(identity_matrix(K,SigmaS.dim))
    assert V*pb==beta[2]*G+r*U
    check_map(SigmaS,M[3],V)
    LV=proj_lift(P[0],P[3],M[3],pi[3],V*rho)
    omegaV=inc[4].solve_right(LV*ib)
    check_map(s,M[4],omegaV)
    h4,f4,d4=stable_data(s,M[4],P[4],pi[4])
    triple_zero=vector(K,omegaV.list()) in f4
    assert d4==1
    print('beta triple: cone dimension',CB.dim,'null factor rank',r.rank(),
          'Omega(value) =',list(omegaV.column(0)),'contains zero',triple_zero,flush=True)
    print('indeterminacies: tau H^-3 + H^1 beta = 0; beta H^-3 + H^-3 beta = 0',flush=True)
    evidence={'field':str(K),'q':str(q),'dimensions':dimensions,'c':str(scalar),
              'beta_triple_contains_zero':triple_zero}
    matrices={'tau':tau,'beta0':beta[0],'beta1':beta[1],'beta2':beta[2],
              'cone_tau_Q':Q,'cone_tau_j':j,'cone_tau_p':p,'cone_tau_lift':L,
              'cone_beta_Q':QB,'beta_null_factor':r,'beta_triple_V':V,
              'beta_triple_omegaV':omegaV}
    for i in range(5):
        matrices['cover'+str(i)]=pi[i]
        matrices['inclusion'+str(i+1)]=inc[i+1]
    evidence['matrices']={n:{'shape':[int(x.nrows()),int(x.ncols())],
                              'rows':[[str(c) for c in row] for row in x.rows()]}
                          for n,x in matrices.items()}
    import json
    (HERE/(label+'.json')).write_text(json.dumps(evidence,indent=2)+'\n')
    print('RESULT (supported): c', '= 0' if scalar==0 else '!= 0',
          '; beta triple', '= {0}' if triple_zero else 'nonzero singleton',flush=True)
    hom.cache_clear()


if __name__=='__main__':
    for case in (sys.argv[1:] or ['exact','8','12','16']):
        if case=='exact':
            K=PolynomialRing(GF(2),'q').fraction_field(); q=K.gen()
        else:
            K=GF(2**int(case),name='a'); q=K.multiplicative_generator()
        run(case,K,q)
