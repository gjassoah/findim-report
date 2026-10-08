#!/usr/bin/env python3
"""Codex job 08. Claim: direct stable profile W and comparison delta^0.
Cases: actual saved Candidate 1 modules over GF(2^16), cases 0 and 1.
Conventions: left modules and [1]=cosyzygy. W positive uses Hom of a
projective resolution of s; W negative uses syzygies of C tensor s.
All reported dimensions have status supported in these cases only.
"""
from candidate import *

def left_projective(T,vs):
    ids,acts=te.projective(T,vs); starts=[]; off=0
    for v,bs in zip(vs,ids): starts.append(off+bs.index(T.names.index(v))); off+=len(bs)
    return {'vertices':vs,'ids':ids,'acts':acts,'starts':starts,'dim':off}

def left_cover(T,M,name):
    K=T.K; n=M[0].nrows(); gens=[T.names.index(x) for x in 'xutZ']
    R=matrix(K,[c for a in gens for c in M[a].columns()]); guard(name+' radical',R.nrows(),R.ncols())
    rad=R.row_space().basis_matrix().transpose(); current=rad; gs=[]; vs=[]
    for v in ['e','f']:
        E=M[T.names.index(v)]; joined=current.augment(E); piv=list(joined.pivots())
        ix=[j-current.ncols() for j in piv if j>=current.ncols()]
        gs.extend(E.column(j) for j in ix); vs.extend([v]*len(ix)); current=joined.matrix_from_columns(piv)
    assert current.ncols()==n and len(gs)==n-rad.ncols()
    P=left_projective(T,vs); ep=matrix(K,[M[a]*g for ids,g in zip(P['ids'],gs) for a in ids]).transpose()
    assert ep.rank()==n and all(ep*P['acts'][a]==M[a]*ep for a in range(20))
    inc=kernel(ep,name+' kernel'); N=restrict(P['acts'],inc,name)
    emit(name,'dim',n,'top',vs,'P',P['dim'],'next',inc.ncols())
    return P,ep,inc,N

def simple_stable(T,M):
    K=T.K; n=M[0].nrows()
    eq=matrix(K,[row for a in range(20) for row in (M[a]-(identity_matrix(K,n) if a==8 else 0*M[a])).rows()])
    soc=kernel(eq,'simple socle'); factors=M[18].column_space().basis_matrix().transpose()
    assert eq*factors==0
    return soc,factors,soc.ncols()-factors.ncols()

def hom_layout(T,P,M):
    bases={v:M[T.names.index(v)].column_space().basis_matrix().transpose() for v in ['e','f']}
    spaces={v:bases[v].column_space() for v in ['e','f']}
    return bases,spaces,sum(bases[v].ncols() for v in P['vertices'])

def left_hom_differential(T,P,R,d,M):
    bases,spaces,n=hom_layout(T,P,M); _,_,m=hom_layout(T,R,M)
    guard('Hom differential',m,n); cols=[]; off=0
    for ids,v in zip(P['ids'],P['vertices']):
        # Only generator columns of the next differential are needed.
        small=d[off:off+len(ids),:].matrix_from_columns(R['starts'])
        for g in bases[v].columns():
            images=matrix(T.K,[M[a]*g for a in ids]).transpose()*small
            cols.append(vector(T.K,[x for j,w in enumerate(R['vertices']) for x in spaces[w].coordinate_vector(images.column(j))]))
        off+=len(ids)
    return matrix(T.K,cols).transpose() if cols else matrix(T.K,m,0)

def compute_W(T,Cs):
    K=T.K; W={}; soc,fac,W[0]=simple_stable(T,Cs)
    M=Cs
    for a in range(1,5):
        P,ep,inc,M=left_cover(T,M,'Cs syzygy '+str(a)); _,_,W[-a]=simple_stable(T,M)
    M=[matrix(K,1,1,[int(a==8)]) for a in range(20)]; Ps=[]; ds=[]; prev=None
    for a in range(6):
        P,ep,inc,M=left_cover(T,M,'s degree '+str(a)); Ps.append(P); ds.append(ep if a==0 else prev*ep); prev=inc
    diffs=[left_hom_differential(T,Ps[a],Ps[a+1],ds[a+1],Cs) for a in range(5)]
    for a in range(1,5):
        assert diffs[a]*diffs[a-1]==0
        W[a]=diffs[a].ncols()-diffs[a].rank()-diffs[a-1].rank()
    return W

def profile(case):
    state=load(str(HERE/f'candidate-{case}.sobj')); result=json.loads((HERE/f'case-{case}.json').read_text())
    K=state['C'][0].base_ring(); b=K.multiplicative_generator(); q=b**state['parameters']['exponents'][0]; T=te.TrivialExtension(K,q)
    cache=HERE/f'W-{case}.json'
    if cache.exists():
        saved=json.loads(cache.read_text())
        assert saved['cone_sha256']==hashlib.sha256((HERE/f'cone-{case}.sobj').read_bytes()).hexdigest()
        W={int(a):v for a,v in saved['W'].items()}
    else: W=compute_W(T,state['Cs'])
    soc,fac,V0=simple_stable(T,state['Fs']); v=state['v']; assert v in soc.column_space()
    augmented=fac.augment(matrix(K,len(v),1,v)); vrank=augmented.rank()-fac.ncols()
    delta={'domain':2,'codomain':int(V0),'rank':int(vrank),'kernel_dimension':int(2-vrank),'cokernel_dimension':int(V0-vrank),'formula':'(c,d) -> (c+d)[v]','kernel_basis':[[1,1]] if vrank else [[1,0],[0,1]]}
    # Actual quotient coordinates give a fully reproducible matrix of delta.
    current=fac; bs=[]
    for g in soc.columns():
        D=current.augment(matrix(K,len(g),1,g))
        if D.rank()>current.ncols(): bs.append(g); current=D
    coords=current.solve_right(v)[fac.ncols():]
    delta['matrix_rows']=[[str(c),str(c)] for c in coords]
    result['W']={str(a):int(W[a]) for a in range(-4,5)}; result['delta0']=delta
    result['profile_systems']=SYSTEMS; result['profile_seconds']=time.time()-START
    (HERE/f'case-{case}.json').write_text(json.dumps(result,indent=2,default=str)+'\n')
    emit('W',result['W']); emit('delta0',delta)
if __name__=='__main__': profile(int(sys.argv[1]))
