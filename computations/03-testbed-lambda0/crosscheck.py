#!/usr/bin/env python3
"""Codex job 06.
Claim: independent ordinary Hom calculation and explicit coker(delta^0) -> Ext^1.
Cases: GF(2^16), the same three seeded triples; exact GF(2)(q,H1,H2).
Conventions: testbed.py conventions; self-extensions [[Z,B],[0,Z]].
B_1,B_2 scale the two off-diagonal bimodule actions separately.
"""
import sys
sys.dont_write_bytecode=True
from testbed import *


def equations(L,M,N):
    """Hom equations directly on matrices; impose idempotents first."""
    m=M[0].nrows(); n=N[0].nrows()
    for acts in [M,N]:
        for e in L.idems: assert acts[e].is_diagonal()
    source=[next(v for v,e in enumerate(L.idems) if M[e][j,j]) for j in range(m)]
    target=[next(v for v,e in enumerate(L.idems) if N[e][i,i]) for i in range(n)]
    unknown=[(i,j) for i in range(n) for j in range(m) if target[i]==source[j]]
    entries={}
    for c,(i,j) in enumerate(unknown):
        for g,a in enumerate(L.gens):
            for k in range(n):
                if N[a][k,i]: entries[g*n*m+k*m+j,c]=N[a][k,i]
            for k in range(m):
                if M[a][j,k]:
                    row=g*n*m+i*m+k
                    entries[row,c]=entries.get((row,c),0)+M[a][j,k]
    # Dense on occupied rows is faster than many zero rows over extension fields.
    rows=sorted({r for (r,c),v in entries.items() if v})
    ix={r:i for i,r in enumerate(rows)}
    E=matrix(L.K,len(rows),len(unknown),{(ix[r],c):v for (r,c),v in entries.items() if v})
    return E,unknown,rows


def main():
    arg=sys.argv[1] if len(sys.argv)>1 else '0'
    if arg=='exact':
        K=PolynomialRing(GF(2),['q','H1','H2']).fraction_field(); q,H1,H2=K.gens()
    else:
        K=GF(2**16,name='b'); b=K.multiplicative_generator(); rng=random.Random(6062026+int(arg)); exps=[]
        while len(exps)<3:
            n=rng.randrange(1,65535)
            if gcd(n,65535)==1 and n not in exps: exps.append(n)
        q,H1,H2=[b**n for n in exps]
    T=te.TrivialExtension(K,q); L=Triangular(T,H1,H2); Z=module(L)
    emit('Codex job 06 independent Hom/extension check, case',arg)
    regular=L.projective([0,1,2,3])['acts']
    E,unknown,rows=equations(L,Z,Z)
    R,_,_=equations(L,Z,regular)
    enddim=E.ncols()-E.rank(); reghom=R.ncols()-R.rank()
    emit('Direct intertwiner equations: End dimension',enddim,'Hom(Z,Lambda) dimension',reghom)
    B=[]
    for off in [40,60]:
        B.append([Z[a] if off<=a<off+20 else matrix(K,10,10) for a in range(80)])
    for Bs in B:
        for a in range(80):
            for b in range(80):
                assert Z[a]*Bs[b]+Bs[a]*Z[b]==sum((c*Bs[k] for k,c in L.table[a][b].items()),matrix(K,10,10))
    # Relate branch-action variations to the conversion quotient itself.
    # v_epsilon=(1+epsilon*c1,1+epsilon*c2) changes the first branch by
    # c1*(s2+soc)+c2*s2. The c2 variation differs from B2 by a coboundary:
    # the endomorphism projecting the lower Y=s2+Q onto s2.
    E_s=matrix(K,10,10); E_s[1,1]=1
    V2=[matrix(K,10,10) for _ in range(80)]; V2[48][1,0]=1
    assert all(V2[a]+B[1][a]==Z[a]*E_s+E_s*Z[a] for a in range(80))
    emit('PASS: quotient variations of v0 give B1,B2 modulo the displayed coboundary')
    vectors=[vector(K,[x for a in L.gens for x in Bs[a].list()]) for Bs in B]
    # Include rows not occupied by any coboundary, if a B has support there.
    allrows=sorted(set(rows)|{i for v in vectors for i in v.nonzero_positions()})
    rowix={r:i for i,r in enumerate(allrows)}
    C=matrix(K,len(allrows),E.ncols())
    for r,old in enumerate(rows): C[rowix[old],:]=E.row(r)
    D=matrix(K,[[v[r] for v in vectors] for r in allrows])
    r=C.rank(); r1=C.augment(D[:,0:1]).rank(); r2=C.augment(D[:,1:2]).rank(); rb=C.augment(D).rank()
    sumrank=C.augment(D[:,0:1]+D[:,1:2]).rank()
    assert r1==r2==rb==r+1 and sumrank==r
    emit('PASS: both B are extension cocycles (all 6400 products each)')
    emit('Coboundary rank',r,'; with B1',r1,'; with B2',r2,'; with both',rb,'; with B1+B2',sumrank)
    emit('SUPPORTED: (c1,c2) -> [c1 B1+c2 B2] has kernel <(1,1)> and rank 1.')
    # Inspect s directly: radical(Tf) has top consisting only of e-simples.
    ids,acts=te.projective(T,['f']); ids=ids[0]
    radids=[j for j,i in enumerate(ids) if T.names[i]!='f']
    radacts=[a.matrix_from_rows_and_columns(radids,radids) for a in acts]
    V=VectorSpace(K,len(radids))
    rad2=V.span([c for i in range(20) if i not in [0,8] for c in radacts[i].columns() if c])
    fimage=radacts[8].column_space()
    assert fimage.is_subspace(rad2)
    # Hom(s,Tf) is exactly the socle; augmentation kills it, so stable End(s)=k.
    soc=matrix(K,0,8)
    for a in range(20):
        soc=soc.stack(acts[a]-int(a==8)*identity_matrix(K,8))
    assert soc.right_kernel().dimension()==1
    assert all(v[ids.index(8)]==0 for v in soc.right_kernel().basis())
    emit('PASS: top(rad(Tf)) has f multiplicity 0, hence Ext_T^1(s,s)=0; stable End_T(s)=k.')
    result={'case':arg,'end':enddim,'hom_regular':reghom,'delta0_rank':1,'extension_span_mod_boundaries':1,'extension_kernel':'span(1,1)','Ext_T_1_s_s':0}
    (HERE/('crosscheck-'+arg+'.json')).write_text(json.dumps(result,indent=2)+'\n')
    emit('COMPLETED independent check',arg)


if __name__=='__main__': main()
