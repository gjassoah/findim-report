#!/usr/bin/env python3
"""Codex job 10. Actual two-cone evaluation and stable Hom profile at X.
Claim: compute W^a, -4 <= a <= 7, from a complete resolution, without
assuming the polynomial Ext ring or the asserted two-cone profile.
Case: the newly rebuilt one-factor.sobj over GF(2^16).
Conventions: left modules, column maps; tensor differential has no signs
in characteristic two. Coker(K_1 -> K_0) represents the stable two-cone.
"""
from reuse import *
from sage.all import matrix, identity_matrix, block_diagonal_matrix, load, save
import json
import copy

def kron(a,b):
    return a.sparse_matrix().tensor_product(b.sparse_matrix())

def evaluate(M):
    K=M[0].base_ring()
    rel=matrix(K,[v for a in range(20) if a!=8 for v in M[20+a].columns()]).transpose()
    c.guard('one-factor evaluation',rel.ncols(),rel.nrows())
    return c.quotient(M[:20],rel,'one-factor evaluation')

def complex_tensor(L,d,maxdegree):
    K=L[-2][0].base_ring()
    dims={i:acts[0].nrows() for i,acts in L.items()}
    cells={n:[(i,n-i) for i in sorted(L) if n-i in L] for n in range(-4,maxdegree+1)}
    offsets={}; totals={}
    for n,cs in cells.items():
        off=0; offsets[n]={}
        for i,j in cs:
            offsets[n][i,j]=off; off+=dims[i]*dims[j]
        totals[n]=off
    ds={}
    for n in range(-3,maxdegree+1):
        c.guard('evaluated tensor differential '+str(n),totals[n-1],totals[n])
        entries={}
        for i,j in cells[n]:
            co=offsets[n][i,j]
            for ij,D in ([((i-1,j),kron(d[i],identity_matrix(K,dims[j],sparse=True)))] if i>-2 else []) + ([((i,j-1),kron(identity_matrix(K,dims[i],sparse=True),d[j]))] if j>-2 else []):
                ro=offsets[n-1][ij]
                for (r,s),x in D.dict().items():
                    entries[ro+r,co+s]=entries.get((ro+r,co+s),K(0))+x
        ds[n]=matrix(K,totals[n-1],totals[n],entries,sparse=True)
        if n>-3: assert product(ds[n-1],ds[n])==0
    acts=[]
    for side in range(2):
        for a in range(20):
            blocks=[kron(L[i][a],identity_matrix(K,dims[j],sparse=True)) if side==0
                    else kron(identity_matrix(K,dims[i],sparse=True),L[j][a]) for i,j in cells[0]]
            acts.append(block_diagonal_matrix(blocks,sparse=True))
    return totals,ds,acts

def simple_resolution(T,degree):
    K=T.K; M=[matrix(K,1,1,[int(a==8)]) for a in range(20)]
    Ps=[]; ds=[]; prev=None
    for n in range(degree+1):
        P,ep,inc,M=profile.left_cover(T,M,'simple degree '+str(n))
        Ps.append(P); ds.append(ep if n==0 else product(prev,ep)); prev=inc
        if n>1: assert product(ds[n-1],ds[n])==0
    return Ps,ds

def tensor_resolution(Ps,ds,degree):
    K=ds[0].base_ring(); R={}; dd={}
    for n in range(degree+1):
        cells=[(i,n-i) for i in range(n+1)]
        off=0; starts=[]; vertices=[]; ids=[]; offsets={}
        # Retain tensor order; projective summands need not be contiguous.
        components=[]
        for i,j in cells:
            offsets[i,j]=off
            P,Q=Ps[i],Ps[j]
            po=0
            for pv,pi,pg in zip(P['vertices'],P['ids'],P['starts']):
                qo=0
                for qv,qi,qg in zip(Q['vertices'],Q['ids'],Q['starts']):
                    vertices.append((pv,qv)); starts.append(off+pg*Q['dim']+qg)
                    ids.append([(a,b) for a in pi for b in qi])
                    components.append([off+(po+r)*Q['dim']+qo+s for r in range(len(pi)) for s in range(len(qi))])
                    qo+=len(qi)
                po+=len(pi)
            off+=P['dim']*Q['dim']
        R[n]=dict(dim=off,vertices=vertices,starts=starts,ids=ids,components=components,offsets=offsets)
        if n==0:
            dd[0]=kron(ds[0],ds[0]); continue
        entries={}
        for i,j in cells:
            co=offsets[i,j]
            terms=[]
            if i: terms.append(((i-1,j),kron(ds[i],identity_matrix(K,Ps[j]['dim'],sparse=True))))
            if j: terms.append(((i,j-1),kron(identity_matrix(K,Ps[i]['dim'],sparse=True),ds[j])))
            for ij,D in terms:
                ro=R[n-1]['offsets'][ij]
                for (r,s),x in D.dict().items(): entries[ro+r,co+s]=entries.get((ro+r,co+s),K(0))+x
        dd[n]=matrix(K,R[n-1]['dim'],off,entries,sparse=True)
        assert product(dd[n-1],dd[n])==0
    return R,dd

def dual_identification(T,P):
    # D(e_v T) ~= T e_v via the symmetric trace; return the left-projective
    # layout and S: left coordinates -> dual(right coordinates).
    L=profile.left_projective(T,P['vertices']); entries={}; off=0
    for ri,li in zip(P['ids'],L['ids']):
        for j,a in enumerate(li): entries[off+ri.index((a+10)%20),off+j]=1
        off+=len(ri)
    return L,matrix(T.K,off,off,entries,sparse=True)

def hom_differential(P,Q,d,M,bases,spaces,action_cache):
    K=M[0].base_ring(); n=sum(bases[v].ncols() for v in P['vertices']); m=sum(bases[v].ncols() for v in Q['vertices'])
    c.guard('two-factor Hom differential',m,n)
    cols=[]
    for ids,rows,v in zip(P['ids'],P['components'],P['vertices']):
        small=d.matrix_from_rows(rows).matrix_from_columns(Q['starts'])
        for images in action_cache[v]:
            images=product(images,small)
            cols.append([images[r,j] for j,w in enumerate(Q['vertices']) for r in spaces[w]])
    return matrix(K,cols).transpose() if cols else matrix(K,m,0)

def run():
    st=load(str(HERE/'one-factor.sobj'))
    C,data=st['C'],st['data']; K=C[0].base_ring()
    q=K.multiplicative_generator()**st['parameters']['exponents'][0]
    T=c.te.TrivialExtension(K,q)
    if '--resume' in sys.argv:
        saved=load(str(HERE/'evaluated.sobj'))
        result=json.loads((HERE/'evaluated.json').read_text())
        result['parameters']=saved['parameters']
        c.SYSTEMS.extend(result['systems'])
        return profile_stage(T,saved['M'],result)
    Cs,CQ,CS=evaluate(C)
    P1,Q1,S1=evaluate(data['Ps'][1]['acts'])
    P0,Q0,S0=evaluate(data['Ps'][0]['acts'])
    top=join(matrix(K,data['Ps'][1]['dim'],20),data['ds'][2],'augment')
    f=product(product(Q1,product(top,data['section'])),CS)
    dd=product(product(Q0,data['ds'][1]),S1)
    assert product(f,CQ)==product(Q1,product(top,data['section']))
    assert product(dd,Q1)==product(Q0,data['ds'][1])
    L={-2:P0,-1:P1}; d={-1:dd}
    M=Cs; prev=None
    for n in range(5):
        P,ep,inc,M=profile.left_cover(T,M,'evaluated cone degree '+str(n))
        L[n]=P['acts']; d[n]=product(f,ep) if n==0 else product(prev,ep); prev=inc
        assert product(d[n-1],d[n])==0
    totals,ds,acts=complex_tensor(L,d,2)
    ranks={n:int(D.rank()) for n,D in ds.items()}
    H={n:totals[n]-ranks.get(n,0)-ranks[n+1] for n in range(-4,2)}
    assert H=={-4:1,-3:0,-2:2,-1:0,0:1,1:0},H
    c.emit('evaluated tensor terms',totals,'homology',H)
    c.guard('evaluated coker(K1 -> K0)',ds[1].nrows(),ds[1].ncols())
    M,Q,S=c.quotient(acts,ds[1],'evaluated two-cone')
    result=dict(job='Codex job 10',parameters=st['parameters'],status='evaluated cone built',one_factor_terms={str(n):v[0].nrows() for n,v in L.items()},
        tensor_terms=totals,differential_ranks=ranks,homology=H,dim_coneX=M[0].nrows(),W={})
    def record():
        result['systems']=c.SYSTEMS
        (HERE/'evaluated.json').write_text(json.dumps(result,indent=2)+'\n')
    record()
    save(dict(M=M,Q=Q,S=S,ds=ds,parameters=st['parameters']),str(HERE/'evaluated.sobj'))
    return profile_stage(T,M,result)

def profile_stage(T,M,result):
    K=T.K
    def record():
        result['systems']=c.SYSTEMS
        (HERE/'evaluated.json').write_text(json.dumps(result,indent=2)+'\n')
    left,ld=simple_resolution(T,8)
    R,D=tensor_resolution(left,ld,8)
    op=copy.copy(T); op.corners=[(r,l) for l,r in T.corners]; op.table=[[T.table[j][i] for j in range(20)] for i in range(20)]
    right,rd=simple_resolution(op,4)
    duals=[]; conversions=[]
    for P in right:
        LP,Sd=dual_identification(T,P); duals.append(LP); conversions.append(Sd)
        for a in range(20): assert product(Sd,LP['acts'][a])==product(P['acts'][a].transpose(),Sd)
    RR,RD=tensor_resolution(right,rd,4)
    LR,_=tensor_resolution(duals,[c.matrix(K,1,duals[0]['dim'])]+[c.matrix(K,duals[n-1]['dim'],duals[n]['dim']) for n in range(1,5)],4)
    SS={n:block_diagonal_matrix([kron(conversions[i],conversions[n-i]) for i in range(n+1)],sparse=True) for n in range(5)}
    for n in range(5): R[-n-1]=LR[n]
    D[0]=product(product(SS[0].transpose(),RD[0].transpose()),D[0])
    for n in range(1,5): D[-n]=product(product(SS[n].transpose(),RD[n].transpose()),SS[n-1])
    for n in range(-3,9): assert product(D[n-1],D[n])==0
    bases={}; spaces={}
    for v in [('e','e'),('e','f'),('f','e'),('f','f')]:
        E=product(M[T.names.index(v[0])],M[20+T.names.index(v[1])])
        bases[v]=E.column_space().basis_matrix().transpose()
        spaces[v]=list(bases[v].transpose().pivots())
        assert bases[v].matrix_from_rows(spaces[v])==identity_matrix(K,len(spaces[v]))
    action_cache={}
    for v in bases:
        ids=[(a,b) for a in range(20) if T.corners[a][1]==v[0]
             for b in range(20) if T.corners[b][1]==v[1]]
        action_cache[v]=[matrix(K,[M[a]*(M[20+b]*g) for a,b in ids]).transpose()
                         for g in bases[v].columns()]
    hd={}; hr={}
    for a in range(-5,8):
        hd[a]=hom_differential(R[a],R[a+1],D[a+1],M,bases,spaces,action_cache)
        hr[a]=int(hd[a].rank())
        if a>-5: assert product(hd[a],hd[a-1])==0
        if a>=-4:
            result['W'][str(a)]=int(hd[a].ncols()-hr[a]-hr[a-1])
            c.emit('W',a,result['W'][str(a)],'cochains',hd[a].ncols(),'ranks',hr[a-1],hr[a])
            record()
    result['hom_cochains']={str(a):dict(dim=hd[a].ncols(),out_rank=hr[a]) for a in hd}
    result['status']='stable profile completed by complete-resolution Hom matrices'
    save(dict(hom=hd,complete_differentials=D,parameters=result['parameters']),str(HERE/'profile-matrices.sobj'))
    record(); c.emit(result)

if __name__=='__main__': run()
