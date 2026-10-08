#!/usr/bin/env python3
"""Codex job 08. Claim: ordinary Ext for the actual triangular module Z.
Cases: saved Candidate 1 over GF(2^16), cases 0 and 1, degrees 1..3.
Conventions: left triangular modules, column maps; covers are selected from
radical quotients. Full Hom differentials use projective generator values.
Status: supported computations only. No expected Ext dimension asserted.
"""
from profile import *

class Lambda:
    def __init__(self,T,F):
        self.T,self.F,self.K=T,F,T.K; self.n=F[0].nrows(); self.dim=40+self.n
        self.idems=[0,8,20,28]
        # Echelon kernels/quotients preserve the diagonal corner idempotents.
        assert all(F[a].is_diagonal() for a in [0,8,20,28])
        self.fc=[('e' if F[0][j,j] else 'f','e' if F[20][j,j] else 'f') for j in range(self.n)]
        self.ids=[[a for a in range(20) if T.corners[a][1]==v]+[40+j for j,c in enumerate(self.fc) if c[1]==v] for v in ['e','f']]
        self.ids += [[20+a for a in range(20) if T.corners[a][1]==v] for v in ['e','f']]
        self.gens=list(self.idems)+[off+T.names.index(x) for off in [0,20] for x in 'xutZ']
        # A basis modulo the bimodule radical generates every off-diagonal letter.
        rad=matrix(self.K,[c for a in [T.names.index(x)+off for off in [0,20] for x in 'xutZ'] for c in F[a].columns()]).row_space().basis_matrix().transpose()
        joined=rad.augment(identity_matrix(self.K,self.n)); piv=list(joined.pivots())
        self.gens += [40+j-rad.ncols() for j in piv if j>=rad.ncols()]
        self.radgens=[a for a in self.gens if a not in self.idems]
        self.tids=[[a for a in range(20) if T.corners[a][1]==v] for v in ['e','f']]
        self.findices=[[j for j,c in enumerate(self.fc) if c[1]==v] for v in ['e','f']]
        self.tactions=[te.projective(T,[v])[1] for v in ['e','f']]
        emit('Lambda','dimension',self.dim,'projective dimensions',[len(x) for x in self.ids],'generators',len(self.gens))
    def indec_action(self,v,a):
        K=self.K; ids=self.ids[v]; n=len(ids); out=matrix(K,n,n)
        if v>=2:
            if 20<=a<40: return self.tactions[v-2][a-20]
            return out
        nt=len(self.tids[v]); fis=self.findices[v]
        if a<20: out[:nt,:nt]=self.tactions[v][a]
        elif a<40: out[nt:,nt:]=self.F[a-20].matrix_from_rows_and_columns(fis,fis)
        else:
            # f sends a top basis letter t to f*t.
            out[nt:,:nt]=matrix(K,[vector(K,[self.F[20+t][j,a-40] for j in fis]) for t in self.tids[v]]).transpose()
        return out.sparse_matrix()
    def projective(self,vs): return Projective(self,vs)

class Module:
    def __init__(self,L,n,action): self.L,self.n,self.action=L,n,action; self.cache={}
    def act(self,a):
        if a not in self.cache: self.cache[a]=self.action(a)
        return self.cache[a]
    def apply(self,a,g): return self.act(a)*g

class Projective(Module):
    def __init__(self,L,vs):
        self.vertices=vs; self.ids=[L.ids[v] for v in vs]; self.starts=[]; n=0
        for v,ids in zip(vs,self.ids): self.starts.append(n+ids.index(L.idems[v])); n+=len(ids)
        super().__init__(L,n,lambda a:block_diagonal_matrix([L.indec_action(v,a) for v in vs],sparse=True))
    def apply(self,a,g):
        # Non-generator actions need not be cached on large projectives.
        if a in self.cache: return self.cache[a]*g
        blocks=[]; off=0
        for v,ids in zip(self.vertices,self.ids):
            part=g[off:off+len(ids),:] if hasattr(g,'ncols') else g[off:off+len(ids)]
            blocks.append(self.L.indec_action(v,a)*part)
            off+=len(ids)
        if hasattr(g,'ncols'): return matrix(self.L.K,[r for b in blocks for r in b.rows()])
        return vector(self.L.K,[x for b in blocks for x in b])


def make_Z(L,state):
    K=L.K; Fs=state['Fs']; n=Fs[0].nrows(); v=state['v']; T=L.T
    tfids,tf=te.projective(T,['f']); soc=vector(K,[int(T.names[a]=='F') for a in tfids[0]])
    acts=[block_diagonal_matrix([Fs[a],tf[a]],sparse=False) for a in range(20)]
    rel=matrix(K,n+8,1,list(v)+list(soc)); Y,Q,S=quotient(acts,rel,'Y')
    nz=1+Y[0].nrows(); structure=Q[:,:n]*state['FQ']
    assert structure.rank()==n
    def action(a):
        M=matrix(K,nz,nz)
        if a<20: M[0,0]=int(a==8)
        elif a<40: M[1:,1:]=Y[a-20]
        else: M[1:,0]=structure.column(a-40)
        return M
    Z=Module(L,nz,action)
    # Check the bimodule relations on all off-diagonal basis vectors at once.
    for a in range(20):
        assert Y[a]*structure==structure*L.F[a]
        assert structure*L.F[20+a]==int(a==8)*structure
    emit('Z dimension',nz,'Y',nz-1,'all off-diagonal module relations PASS')
    return Z

def cover(L,M,label):
    K=L.K; n=M.n
    R=matrix(K,[c for a in L.radgens for c in M.act(a).columns()]); guard(label+' radical',R.nrows(),R.ncols())
    rad=R.row_space().basis_matrix().transpose(); cur=rad; gs=[]; vs=[]
    for v,a in enumerate(L.idems):
        E=M.act(a); joined=cur.augment(E); piv=list(joined.pivots())
        selected=[j-cur.ncols() for j in piv if j>=cur.ncols()]
        gs.extend(E.column(j) for j in selected); vs.extend([v]*len(selected)); cur=joined.matrix_from_columns(piv)
    assert cur.ncols()==n and len(gs)==n-rad.ncols()
    P=L.projective(vs); ep=matrix(K,[M.apply(a,g) for ids,g in zip(P.ids,gs) for a in ids]).transpose()
    assert ep.rank()==n
    assert all(ep*P.act(a)==M.act(a)*ep for a in L.gens)
    inc=kernel(ep,label+' kernel'); piv,inv=section_columns(inc)
    assert inc.matrix_from_rows(P.starts).is_zero()
    def action(a):
        C=P.apply(a,inc); D=inv*C.matrix_from_rows(piv); assert inc*D==C
        return D
    N=Module(L,inc.ncols(),action)
    # Verify invariance on a generating set now, not only lazily later.
    for a in L.gens: N.act(a)
    emit(label,'syzygy',n,'Betti',[vs.count(v) for v in range(4)],'P',P.n,'next',N.n)
    return P,ep,inc,N

def layout(L,P,M):
    bs=[M.act(a).column_space().basis_matrix().transpose() for a in L.idems]
    pivinv=[section_columns(b) for b in bs]
    return bs,pivinv,sum(bs[v].ncols() for v in P.vertices)

def differential(L,P,R,d,M):
    bs,coords,n=layout(L,P,M); _,_,m=layout(L,R,M)
    guard('ordinary Hom differential',m,n)
    blocks=[]; off=0
    for v,ids in zip(P.vertices,P.ids):
        width=bs[v].ncols(); sub=[]
        for w,start in zip(R.vertices,R.starts):
            coefficients=d.column(start)[off:off+len(ids)]
            value=matrix(L.K,M.n,width)
            for j in coefficients.nonzero_positions(): value+=coefficients[j]*M.apply(ids[j],bs[v])
            piv,inv=coords[w]; sub.append(inv*value.matrix_from_rows(piv))
        block=matrix(L.K,[r for a in sub for r in a.rows()]) if m else matrix(L.K,0,width)
        if block.ncols()!=width: block=matrix(L.K,m,width)
        blocks.append(block); off+=len(ids)
    out=matrix(L.K,m,0)
    for a in blocks: out=out.augment(a)
    assert out.dimensions()==(m,n)
    return out

def run(case):
    state=load(str(HERE/f'candidate-{case}.sobj')); result=json.loads((HERE/f'case-{case}.json').read_text())
    K=state['F'][0].base_ring(); b=K.multiplicative_generator(); q=b**state['parameters']['exponents'][0]; T=te.TrivialExtension(K,q); L=Lambda(T,state['F']); Z=make_Z(L,state)
    def record():
        result['ext_systems']=SYSTEMS; result['ext_seconds']=time.time()-START
        (HERE/f'case-{case}.json').write_text(json.dumps(result,indent=2,default=str)+'\n')
    try:
        side=[]
        for label,acts in [('left',state['F'][:20]),('dual right',[a.transpose() for a in state['F'][20:]])]:
            fp,fe,fi,fn=left_cover(T,acts,'F '+label)
            assert fi.ncols()==0
            side.append({'side':label,'dimension':fp['dim'],'top':fp['vertices']})
        result['F_side_projective']=side; record()
        Ps=[]; ds=[]; inclusions=[]; prev=None; M=Z; result['Lambda_resolution']=[]
        evidence={'projective_vertices':[],'differentials':ds,'inclusions':inclusions}
        for a in range(5):
            P,ep,inc,M=cover(L,M,'Lambda degree '+str(a)); Ps.append(P); ds.append(ep if a==0 else prev*ep); prev=inc
            inclusions.append(inc); evidence['projective_vertices'].append(P.vertices)
            if a: assert ds[a-1]*ds[a]==0
            result['Lambda_resolution'].append({'degree':a,'syzygy':ep.nrows(),'projective':P.n,'next_syzygy':M.n,'betti':[P.vertices.count(v) for v in range(4)]}); record()
        for name,target in [('self',Z),('regular',L.projective([0,1,2,3]))]:
            diffs=[]; rows=[]
            for a in range(4):
                d=differential(L,Ps[a],Ps[a+1],ds[a+1],target); rank=d.rank()
                if a: assert d*diffs[-1]==0
                rows.append({'degree':a,'cochains':d.ncols(),'out_rank':rank,'in_rank':diffs[-1].rank() if a else 0,'Ext':d.ncols()-rank-(diffs[-1].rank() if a else 0)})
                diffs.append(d); emit(name,rows[-1])
            result[name]=rows; evidence[name+'_Hom_differentials']=diffs
            save(evidence,str(HERE/f'ext-matrices-{case}.sobj')); record()
        result['status']='completed through degree 3'; record()
    except BoundStop as err:
        result['status']='stopped at requested bound'; result['bound']=err.args[0]; emit('BOUND STOP',err.args[0]); record()
if __name__=='__main__': run(int(sys.argv[1]))
