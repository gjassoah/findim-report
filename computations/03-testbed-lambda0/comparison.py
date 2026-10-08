#!/usr/bin/env python3
"""Codex job 06.
Claim: compute delta^a directly on Ext_T(s,s), independently of Lambda Ext ranks.
Cases: seeded GF(2^16) cases 0,1,2; a=0..6, including twist eigenvalues.
Conventions: right twist T_h gives left action h^-1; left projectives and columns.
Chain lifts, not a claimed Yoneda presentation, determine the scalar action.
"""
import sys
sys.dont_write_bytecode=True
from testbed import *


def tcover(T,acts):
    K=T.K; V=VectorSpace(K,acts[0].nrows())
    rad=V.span([c for a in range(20) if a not in [0,8] for c in acts[a].columns() if c])
    span=rad; gens=[]; vertices=[]
    for v,i in [('e',0),('f',8)]:
        for c in acts[i].columns():
            if c not in span:
                gens.append(c); vertices.append(v); span=V.span(list(span.basis())+[c])
    ids,P=te.projective(T,vertices)
    ep=matrix(K,[acts[a]*g for bs,g in zip(ids,gens) for a in bs]).transpose()
    assert ep.rank()==V.dimension()
    assert all(ep*P[a]==acts[a]*ep for a in range(20))
    starts=[]; off=0
    for bs,v in zip(ids,vertices): starts.append(off+bs.index(T.names.index(v))); off+=len(bs)
    ker=ep.right_kernel(); inc=ker.basis_matrix().transpose(); piv=ker.basis_matrix().pivots()
    assert inc.matrix_from_rows(starts).is_zero()
    new=[]
    for a in range(20):
        im=P[a]*inc; coords=im.matrix_from_rows(piv); assert inc*coords==im; new.append(coords)
    return {'ids':ids,'acts':P,'vertices':vertices,'starts':starts,'dim':off},ep,inc,new


def main():
    arg=int(sys.argv[1]) if len(sys.argv)>1 else 0
    K=GF(2**16,name='b'); b=K.multiplicative_generator(); rng=random.Random(6062026+arg); exps=[]
    while len(exps)<3:
        n=rng.randrange(1,65535)
        if gcd(n,65535)==1 and n not in exps: exps.append(n)
    q,H1,H2=[b**n for n in exps]; T=te.TrivialExtension(K,q)
    acts=[matrix(K,1,1,[int(i==8)]) for i in range(20)]
    Ps=[]; ds=[]; inc=None
    for a in range(7):
        P,ep,newinc,acts=tcover(T,acts); Ps.append(P); ds.append(ep if a==0 else inc*ep); inc=newinc
        if a: assert ds[a-1]*ds[a]==0
    scalars=[]
    for H in [H1,H2]:
        prev=identity_matrix(K,1); out=[]
        for a,P in enumerate(Ps):
            G=[H**(-int(i>=10))*M for i,M in enumerate(P['acts'])]
            images=[]
            for v,start in zip(P['vertices'],P['starts']):
                vertex=T.names.index(v)
                allowed=[i for i in range(P['dim']) if G[vertex][i,i]==1]
                rhs=prev*ds[a].column(start)
                sol=ds[a].matrix_from_columns(allowed).solve_right(rhs)
                y=vector(K,P['dim'])
                for i,c in zip(allowed,sol): y[i]=c
                images.append(y)
            lift=matrix(K,[G[i]*y for bs,y in zip(P['ids'],images) for i in bs]).transpose()
            assert ds[a]*lift==prev*ds[a]
            assert all(lift*P['acts'][i]==G[i]*lift for i in range(20))
            fstarts=[j for v,j in zip(P['vertices'],P['starts']) if v=='f']
            induced=lift.matrix_from_rows_and_columns(fstarts,fstarts)
            out.append(induced); prev=lift
        scalars.append(out)
    results=[]
    for a,P in enumerate(Ps):
        # Minimality makes Hom(P,s) differentials zero, so these matrices already act on Ext.
        d=P['vertices'].count('f'); I=identity_matrix(K,d)
        D=scalars[0][a].augment(I).stack(scalars[1][a].augment(I))
        row={'a':a,'H_dimension':d,'delta_rank':int(D.rank()),'delta_kernel':int(2*d-D.rank()),'delta_cokernel':int(2*d-D.rank()),'twist_eigenvalues':[str(scalars[k][a]) for k in range(2)]}
        if d:
            row['equals_H_inverse_power']=[scalars[k][a]==H**(-(a//3))*I for k,H in enumerate([H1,H2])]
        results.append(row); emit(row)
    (HERE/('comparison-'+str(arg)+'.json')).write_text(json.dumps(results,indent=2)+'\n')
    emit('COMPLETED direct comparison-map check, case',arg)


if __name__=='__main__': main()
