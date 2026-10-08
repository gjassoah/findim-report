#!/usr/bin/env python3
"""Codex job 08. Claim: realise the cosyzygy, twists, fibre and evaluation.
Cases: saved GF(2^16) cone cases 0 and 1 from candidate.py.
Conventions: same column bimodules as candidate.py; dual swaps sides.
All claimed dimensions have status supported for these cases only.
"""
from candidate import *

def dual(M): return [a.transpose() for a in M[20:]+M[:20]]
def dual_projective(B,P):
    vs=[B.verts.index((r,l)) for l,r in [B.verts[v] for v in P['vertices']]]
    D=B.projective(vs); entries={}; off=0
    for old,new in zip(P['vertices'],vs):
        ix={p:j for j,p in enumerate(B.ids[old])}
        for j,(a,b) in enumerate(B.ids[new]): entries[off+ix[((b+10)%20,(a+10)%20)],off+j]=1
        off+=len(B.ids[old])
    S=matrix(B.K,off,off,entries)
    assert S*S.transpose()==identity_matrix(B.K,off)
    assert all(S*D['acts'][a]==dual(P['acts'])[a]*S for a in range(40))
    return D,S

def projective_lift(B,P,Y,Z,pi,f,label):
    guard(label,pi.nrows(),pi.ncols()); cols=[]
    Y=[a.sparse_matrix() for a in Y]
    # One solve per projective generator; no flattened global system.
    for v,start in zip(P['vertices'],P['starts']):
        l,r=B.verts[v]; g=pi.solve_right(f.column(start))
        g=Y[B.T.names.index(l)]*Y[20+B.T.names.index(r)]*g
        assert pi*g==f.column(start)
        cols.extend(Y[a]*(Y[20+b]*g) for a,b in B.ids[v])
    out=matrix(B.K,cols).transpose()
    assert pi*out==f
    assert all(out*P['acts'][a]==Y[a]*out for a in range(40))
    return out

def cosyzygy(B,C,data):
    partial=HERE/f'N-raw-{B.case}.sobj'
    if partial.exists():
        N,Q,sec,I,j=load(str(partial)); emit('reusing checked N quotient')
    else:
        Dp,ep,_,_=B.cover(dual(C),'dual cone cover')
        I,S=dual_projective(B,Dp)
        j=S.transpose()*ep.transpose()
        assert all(j*C[a]==I['acts'][a]*j for a in range(40))
        N,Q,sec=quotient(I['acts'],j,'cosyzygy N')
        save((N,Q,sec,I,j),str(partial))
    P1=data['Ps'][1]; P2=data['Ps'][2]
    # C -> Omega2, then the fixed inclusion Omega2 -> P1.
    omega2ep=data['ds'][2].matrix_from_rows(list(data['inc'][1].transpose().pivots()))
    assert data['inc'][1]*omega2ep==data['ds'][2]
    ctop=matrix(B.K,omega2ep.nrows(),20).augment(omega2ep)*data['section']
    assert ctop*data['quotient']==matrix(B.K,omega2ep.nrows(),20).augment(omega2ep)
    f=data['inc'][1]*ctop
    DP1,S1=dual_projective(B,P1)
    L=projective_lift(B,DP1,dual(I['acts']),dual(C),j.transpose(),f.transpose()*S1,'dual extension to injective')
    E=S1*L.transpose()
    assert E*j==f
    omega1ep=data['ds'][1].matrix_from_rows(list(data['inc'][0].transpose().pivots()))
    assert data['inc'][0]*omega1ep==data['ds'][1]
    p=omega1ep*E*sec
    assert p*Q==omega1ep*E
    Om1=restrict(data['Ps'][0]['acts'],data['inc'][0],'Omega1')
    assert all(p*N[a]==Om1[a]*p for a in range(40))
    emit('N dimension',N[0].nrows(),'injective dimension',I['dim'],'top projection rank',p.rank())
    return N,p,Om1,{'I':I,'injection':j,'Q':Q,'section':sec,'extension':E}

def twist_map_equations(B,M,H):
    n=M[0].nrows()
    return matrix(B.K,0,n).stack(M[0]-M[20]).stack(M[8]-M[28]).stack(
        matrix(B.K,[row for a in B.gens for row in ((H if a>=10 else 1)*M[a]-M[20+a]).rows()]))

def map_from_unit(B,M,u): return matrix(B.K,[M[a]*u for a in range(20)]).transpose()
def beta(B,data,H):
    P0=data['Ps'][0]; xi=vector(B.K,P0['dim']); off=0
    for v in P0['vertices']:
        ids=B.ids[v]; ix={p:i for i,p in enumerate(ids)}
        for w in range(20):
            p=(w,(w+10)%20)
            if p in ix: xi[off+ix[p]]+=H if w>=10 else 1
        off+=len(ids)
    assert data['ds'][0]*xi==0
    return data['inc'][0].solve_right(xi)

def lift_twist(B,N,p,Om1,data,H):
    eq=twist_map_equations(B,N,H); b=beta(B,data,H)
    # Prescribe beta exactly when possible. Otherwise allow a projective
    # factor through P1 -> Omega1, which is precisely stable equality.
    A=eq.stack(p); rhs=vector(B.K,[0]*eq.nrows()+list(b))
    guard('twist lift with exact top',A.nrows(),A.ncols())
    try:
        u=A.solve_right(rhs); assert A*u==rhs
        mode='exact top'; correction=None
    except ValueError:
        P1=data['Ps'][1]; eqP=twist_map_equations(B,P1['acts'],H)
        pe=data['ds'][1].matrix_from_rows(list(data['inc'][0].transpose().pivots()))
        A=block_diagonal_matrix([eq,eqP]).stack(p.augment(pe))
        rhs=vector(B.K,[0]*(eq.nrows()+eqP.nrows())+list(b))
        guard('twist lift with stable top',A.nrows(),A.ncols())
        sol=A.solve_right(rhs); assert A*sol==rhs
        u=sol[:N[0].nrows()]; correction=sol[N[0].nrows():]; mode='stable top'
    g=map_from_unit(B,N,u/H)
    U=B.regular(H)
    assert all(g*U[a]==N[a]*g for a in range(40))
    emit('twist lift',mode,'map rank',g.rank())
    return g,{'mode':mode,'correction':correction}

def evaluate_s(B,M):
    # Balanced tensor with the f-character, in the fixed underlying vector space.
    n=M[0].nrows(); rel=matrix(B.K,n,0)
    for a in range(20):
        if a!=8: rel=rel.augment(M[20+a])
    guard('tensor evaluation relations',rel.ncols(),rel.nrows())
    ev,Q,S=quotient(M[:20],rel,'tensor s')
    return ev,Q,S

def finish(case):
    state=load(str(HERE/f'cone-{case}.sobj')); result=json.loads((HERE/f'case-{case}.json').read_text())
    params=state['parameters']; K=state['C'][0].base_ring(); b=K.multiplicative_generator(); q,H1,H2=[b**e for e in params['exponents']]
    T=te.TrivialExtension(K,q); B=Bimodules(T); B.case=case; C,data=state['C'],state['data']
    def record():
        result['finish_systems']=SYSTEMS; result['finish_seconds']=time.time()-START
        (HERE/f'case-{case}.json').write_text(json.dumps(result,indent=2,default=str)+'\n')
    try:
        checkpoint=HERE/f'cosyzygy-{case}.sobj'
        if checkpoint.exists():
            N,p,Om1,nd=load(str(checkpoint)); emit('reusing checked cosyzygy checkpoint')
        else:
            N,p,Om1,nd=cosyzygy(B,C,data); save((N,p,Om1,nd),str(checkpoint))
        result['dim_N']=N[0].nrows(); record()
        gs=[]
        for H in [H1,H2]:
            g,info=lift_twist(B,N,p,Om1,data,H); gs.append(g)
        P,ep,_,_=B.cover(N,'P(N)')
        total=[block_diagonal_matrix([B.regular(H1)[a],B.regular(H2)[a],P['acts'][a]]) for a in range(40)]
        onto=gs[0].augment(gs[1]).augment(ep); inc=kernel(onto,'fibre F')
        F=restrict(total,inc,'F'); result['dim_F']=F[0].nrows(); result['dim_Lambda']=40+F[0].nrows(); record()
        emit('F dimension',result['dim_F'],'Lambda dimension',result['dim_Lambda'])
        Cs,CQ,CS=evaluate_s(B,C); Fs,FQ,FS=evaluate_s(B,F); Ns,NQ,NS=evaluate_s(B,N)
        result['dim_Cs']=Cs[0].nrows(); result['dim_Fs']=Fs[0].nrows(); result['dim_Z']=Fs[0].nrows()+8
        # Choose an actual diagonal stable lift. First impose literal projections
        # onto the simples; the kernel-to-U maps induce scalar rows after tensor.
        rhos=[]
        for i in range(2): rhos.append(inc[20*i+8:20*i+9,:]*FS)
        rows=matrix(K,[row for a in range(20) for row in (Fs[a]-(identity_matrix(K,Fs[0].nrows()) if a==8 else 0*Fs[a])).rows()])
        A=rows.stack(rhos[0]).stack(rhos[1]); rhs=vector(K,[0]*rows.nrows()+[1,1])
        guard('diagonal lift v',A.nrows(),A.ncols()); v=A.solve_right(rhs)
        assert rhos[0]*v==rhos[1]*v==vector(K,[1])
        result['status']='F and diagonal module data constructed; Ext pending'; record()
        save({'F':F,'Finc':inc,'N':N,'Nprojection':p,'g':gs,'C':C,'Cs':Cs,'Fs':Fs,'FQ':FQ,'FS':FS,'v':v,'rhos':rhos,'parameters':params},str(HERE/f'candidate-{case}.sobj'))
        emit('saved Candidate 1','Cs',result['dim_Cs'],'Fs',result['dim_Fs'],'Z',result['dim_Z'])
    except BoundStop as err:
        result['status']='stopped at requested bound'; result['bound']=err.args[0]; emit('BOUND STOP',err.args[0])
    finally: record()
if __name__=='__main__': finish(int(sys.argv[1]))
