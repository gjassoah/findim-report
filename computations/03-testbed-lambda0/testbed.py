#!/usr/bin/env python3
"""Codex job 06.
Claim: dimensions of Hom, Ext, stable End and minimal syzygies for Lambda_0.
Cases: three seeded primitive triples in GF(2^16), degrees 0..6; optional
exact GF(2)(q,H1,H2), low degrees. No expected Ext value is assumed.
Conventions: left modules, column matrices, right twist u.a=u*h_H(a), char 2.
Reuses the READ job 04 C and trivial-extension constructors; rechecks them.
Run: python3 testbed.py --case 0 --degree 6 (cases 0,1,2 or exact).
"""
import os
import sys
from pathlib import Path
HERE = Path(__file__).resolve().parent
os.environ.setdefault('DOT_SAGE', str(HERE / 'sage-state'))
sys.dont_write_bytecode = True
sys.path.insert(0, str(HERE.parent / '02-ar-finite-data'))
from importlib import import_module
base = import_module('01_algebra')
te = import_module('04_trivial_extension')
from sage.all import (GF, PolynomialRing, VectorSpace, matrix, vector,
                      block_diagonal_matrix, identity_matrix, gcd)
import argparse
import random
import time
import json
import hashlib


def emit(*a):
    print(*a, flush=True)


class Triangular:
    def __init__(self, T, H1, H2):
        self.K, self.T, self.dim = T.K, T, 80
        self.idems = [0, 8, 20, 28]
        self.vertices = ['upper e', 'upper f', 'lower e', 'lower f']
        self.corners = ([(l, r) for l, r in T.corners] +
                        [('b'+l, 'b'+r) for l, r in T.corners] +
                        [('b'+l, r) for l, r in T.corners] * 2)
        self.vnames = ['e','f','be','bf']
        self.table = [[{} for j in range(80)] for i in range(80)]
        for a in range(20):
            for b in range(20):
                cs = {c:T.table[a][b][c] for c in T.table[a][b].nonzero_positions()}
                for off in [0,20]:
                    self.table[off+a][off+b] = {off+c:v for c,v in cs.items()}
                for off,H in [(40,H1),(60,H2)]:
                    self.table[20+a][off+b] = {off+c:v for c,v in cs.items()}
                    self.table[off+a][b] = {off+c:v*(H if b>=10 else 1) for c,v in cs.items()}
        self.rad = [i for i in range(80) if i not in self.idems]
        self.ids = [[i for i,(_,r) in enumerate(self.corners) if r==v] for v in self.vnames]
        # All diagonal letters plus the two off-diagonal units generate Lambda.
        self.gens = list(range(40)) + [40,48,60,68]
        self.indecs = [self.action(ids) for ids in self.ids]

    def action(self, ids):
        ix={b:i for i,b in enumerate(ids)}
        return [matrix(self.K,len(ids),len(ids),
                       {(ix[c],j):v for j,b in enumerate(ids)
                        for c,v in self.table[a][b].items()}, sparse=True) for a in range(80)]

    def projective(self, vertices):
        ids=[self.ids[v] for v in vertices]
        acts=[block_diagonal_matrix([self.indecs[v][a] for v in vertices])
              for a in range(80)]
        starts=[]
        off=0
        for v,bs in zip(vertices,ids):
            starts.append(off+bs.index(self.idems[v]))
            off+=len(bs)
        return {'vertices':vertices,'ids':ids,'acts':acts,'starts':starts,'dim':off}

    def audit(self):
        # Exhaustive associators on the actual 80-dimensional table.
        for a in range(80):
            for b in range(80):
                for c in range(80):
                    l={}; r={}
                    for k,x in self.table[a][b].items():
                        for j,y in self.table[k][c].items(): l[j]=l.get(j,0)+x*y
                    for k,x in self.table[b][c].items():
                        for j,y in self.table[a][k].items(): r[j]=r.get(j,0)+x*y
                    assert {j:x for j,x in l.items() if x}=={j:x for j,x in r.items() if x},(a,b,c)
        assert [len(x) for x in self.ids]==[36,24,12,8]
        for a in range(80):
            for b in range(80):
                for c in self.table[a][b]:
                    if a in self.rad or b in self.rad: assert c in self.rad
        # Nilpotence by supports is sufficient: no cancellation assumption used.
        support=set(self.rad); dims=[]
        for power in range(1,13):
            dims.append(len(support))
            if not support: break
            support={c for a in self.rad for b in support for c in self.table[a][b]}
        assert not support
        for v,acts in enumerate(self.indecs):
            assert sum((acts[i] for i in self.idems),matrix(self.K,len(self.ids[v]),len(self.ids[v])))==identity_matrix(self.K,len(self.ids[v]))
        emit('PASS: 512000 Lambda associators; projective dimensions [36,24,12,8]; radical support powers',dims)


def module(L):
    K,T=L.K,L.T
    qids,Q=te.projective(T,['f'])
    ids=qids[0]; d=len(ids)
    assert d==8
    soc=vector(K,d,{ids.index(T.names.index('F')):1})
    assert all(Q[a]*soc==(soc if a==8 else 0*soc) for a in range(20))
    assert matrix(K,[Q[a]*soc for a in range(20) if a not in [0,8]]).is_zero()
    # quotient k^2 + Q by (1,1,soc); eliminate first coordinate.
    proj=matrix(K,1+d,2+d)
    proj[0,0]=proj[0,1]=1
    for j in range(d):
        proj[1+j,0]=soc[j]; proj[1+j,2+j]=1
    sect=matrix(K,2+d,1+d)
    sect[1,0]=1
    for j in range(d): sect[2+j,1+j]=1
    assert proj*sect==identity_matrix(K,1+d)
    relation=vector(K,[1,1]+list(soc))
    assert proj.right_kernel()==VectorSpace(K,2+d).span([relation])
    acts=[]
    for a in range(80):
        M=matrix(K,2+d,2+d)
        if a<20: M[0,0]=int(a==8)
        elif a<40:
            b=a-20
            raw=block_diagonal_matrix([matrix(K,1,1,[int(b==8)])]*2+[Q[b]])
            assert raw*relation==int(b==8)*relation
            M[1:,1:]=proj*raw*sect
        else:
            off=0 if a<60 else 1
            b=(a-40)%20
            if b==8: M[1:,0]=proj.column(off)
        acts.append(M)
    for a in range(80):
        for b in range(80):
            assert acts[a]*acts[b]==sum((v*acts[c] for c,v in L.table[a][b].items()),matrix(K,10,10)),('module',a,b)
    assert sum((acts[i] for i in L.idems),matrix(K,10,10))==identity_matrix(K,10)
    emit('PASS: Q=Tf dimension 8; i(s)=<dual f>; Y dimension 9; Z dimension 10; all 6400 module identities')
    return acts


def cover(L, acts):
    K=L.K; m=acts[0].nrows(); V=VectorSpace(K,m)
    radical=V.span([c for a in L.rad for c in acts[a].columns() if c])
    span=radical; generators=[]; vertices=[]
    for v,i in enumerate(L.idems):
        for g in acts[i].columns():
            if g not in span:
                generators.append(g); vertices.append(v)
                span=V.span(list(span.basis())+[g])
    assert span.dimension()==m
    P=L.projective(vertices)
    ep=matrix(K,[acts[b]*g for bs,g in zip(P['ids'],generators) for b in bs]).transpose()
    assert ep.rank()==m
    assert all(ep*P['acts'][a]==acts[a]*ep for a in L.gens)
    ker=ep.right_kernel(); inc=ker.basis_matrix().transpose()
    assert ep*inc==0 and inc.rank()==P['dim']-m
    # rad(P) has precisely the non-generator basis coordinates: rad(L)
    # is the span of all algebra letters except the four idempotents.
    assert inc.matrix_from_rows(P['starts']).is_zero()
    # Kernel basis is echelon: solve via its pivot rows, with full residual check.
    piv=ker.basis_matrix().pivots()
    new=[]
    for a in range(80):
        image=P['acts'][a]*inc
        coords=image.matrix_from_rows(piv)
        assert inc*coords==image
        new.append(coords)
    return P,ep,inc,new


def hom_layout(L,P,N):
    spaces=[N[i].column_space() for i in L.idems]
    basis=[s.basis_matrix().transpose() for s in spaces]
    dims=[spaces[v].dimension() for v in P['vertices']]
    return spaces,basis,dims,sum(dims)


def hom_matrix(L,P,N,values):
    """Unique P -> N from a list of generator images (full target vectors)."""
    return matrix(L.K,[N[b]*g for ids,g in zip(P['ids'],values) for b in ids]).transpose()


def hom_differential(L,P,R,d,N):
    """Hom(P,N) -> Hom(R,N) by precomposition with d:R -> P."""
    sp,bs,dims,total=hom_layout(L,P,N)
    _,_,rdims,rtotal=hom_layout(L,R,N)
    cols=[]
    for j,v in enumerate(P['vertices']):
        for g in bs[v].columns():
            vals=[vector(L.K,N[0].nrows()) for _ in P['vertices']]; vals[j]=g
            comp=hom_matrix(L,P,N,vals)*d
            col=[]
            for w,start in zip(R['vertices'],R['starts']): col.extend(sp[w].coordinate_vector(comp.column(start)))
            cols.append(vector(L.K,col))
    return matrix(L.K,cols).transpose() if cols else matrix(L.K,rtotal,0)


def realise_hom(L,P,N,coordinates):
    sp,bs,dims,total=hom_layout(L,P,N)
    vals=[]; off=0
    for v,d in zip(P['vertices'],dims):
        vals.append(bs[v]*coordinates[off:off+d]); off+=d
    return hom_matrix(L,P,N,vals)


def cohomology(L,Ps,ds,N,degree):
    diffs=[hom_differential(L,Ps[a],Ps[a+1],ds[a+1],N) for a in range(degree+1)]
    result=[]
    for a,D in enumerate(diffs):
        if a: assert D*diffs[a-1]==0
        incoming=diffs[a-1].rank() if a else 0
        result.append({'a':a,'cochains':D.ncols(),'out_rank':D.rank(),'in_rank':incoming,'ext':D.ncols()-D.rank()-incoming})
    return result,diffs


def main():
    ap=argparse.ArgumentParser(); ap.add_argument('--case',default='0'); ap.add_argument('--degree',type=int,default=6)
    args=ap.parse_args(); start=time.time()
    if args.case=='exact':
        K=PolynomialRing(GF(2),['q','H1','H2']).fraction_field(); q,H1,H2=K.gens(); params={'field':str(K)}
    else:
        K=GF(2**16,name='b'); b=K.multiplicative_generator()
        rng=random.Random(6062026+int(args.case))
        exps=[]
        while len(exps)<3:
            n=rng.randrange(1,65535)
            if gcd(n,65535)==1 and n not in exps: exps.append(n)
        q,H1,H2=[b**n for n in exps]
        assert all(x.multiplicative_order()==65535 for x in [q,H1,H2])
        assert all(H1**m!=H2**m for m in range(1,101))
        params={'field':str(K),'modulus':str(K.modulus()),'primitive':str(b),'seed':6062026+int(args.case),'exponents':exps,'orders':[65535]*3,'ratio_order':int((H1/H2).multiplicative_order())}
    emit('Codex job 06; supported finite computation; parameters:',params)
    base.audit(K,q)
    T=te.TrivialExtension(K,q); te.structural(T)
    for H in [H1,H2]:
        for a in range(20):
            for b in range(20):
                assert all(c*(H if j>=10 else 1)==c*H**(int(a>=10)+int(b>=10)) for j,c in enumerate(T.table[a][b]) if c)
    emit('PASS: both scaling maps are automorphisms (all basis products, nonzero scale)')
    L=Triangular(T,H1,H2); L.audit(); Z=module(L)
    Ps=[]; ds=[]; syz=[]; Betti=[]; current=Z; inc=None
    for a in range(args.degree+2):
        syz.append(current[0].nrows())
        P,ep,ninc,current=cover(L,current)
        Ps.append(P); ds.append(ep if a==0 else inc*ep)
        if a: assert ds[a-1]*ds[a]==0
        inc=ninc
        betti=[P['vertices'].count(v) for v in range(4)]; Betti.append(betti)
        emit('degree',a,'syzygy',syz[-1],'Betti',betti,'Pdim',P['dim'],'next syzygy',inc.ncols(),'elapsed',round(time.time()-start,2))
    regular=L.projective([0,1,2,3])['acts']
    zz,zzdiff=cohomology(L,Ps,ds,Z,args.degree)
    za,zadiff=cohomology(L,Ps,ds,regular,args.degree)
    # Every map through a projective factors through the projective cover P0 -> Z:
    # lift the second leg into P0. Thus image Hom(Z,P0) -> End(Z) suffices.
    homzp=hom_differential(L,Ps[0],Ps[1],ds[1],Ps[0]['acts'])
    factors=[]
    for coords in homzp.right_kernel().basis():
        f=realise_hom(L,Ps[0],Ps[0]['acts'],coords)
        assert f*ds[1]==0
        factors.append(vector(L.K,(ds[0]*f).list()))
    factor_rank=matrix(L.K,factors).rank() if factors else 0
    stable=zz[0]['ext']-factor_rank
    emit('SELF EXT:',zz); emit('REGULAR EXT:',za)
    emit('stable End:',stable,'ordinary End:',zz[0]['ext'],'projective-factor subspace:',factor_rank)
    result={'parameters':params,'degree':args.degree,'syzygies':syz+[inc.ncols()],'betti':Betti,'projective_dimensions':[P['dim'] for P in Ps],'self':zz,'regular':za,'stable_end':stable,'projective_factor_dimension':factor_rank,'hom_Z_P0':homzp.right_kernel().dimension(),'elapsed_seconds':time.time()-start}
    # Delta^0 on stable Hom(s,s) = k is the explicitly evaluated diagonal map.
    delta=matrix(K,[[1,1],[1,1]])
    result['delta0']={'rank':int(delta.rank()),'kernel':int(delta.right_kernel().dimension()),'cokernel':int(2-delta.rank())}
    result['source_sha256']={str(p.relative_to(HERE.parents[1])):hashlib.sha256(p.read_bytes()).hexdigest() for p in [Path(__file__),HERE.parent/'02-ar-finite-data/01_algebra.py',HERE.parent/'02-ar-finite-data/04_trivial_extension.py',HERE.parents[1]/'.cache/ar-src/02-conversion.tex',HERE.parents[1]/'.cache/ar-src/03-algebra.tex']}
    (HERE/('result-'+args.case+'.json')).write_text(json.dumps(result,indent=2,default=str)+'\n')
    emit('COMPLETED',args.case,'elapsed',round(time.time()-start,2),'seconds; no expected Ext dimension used as assertion')


if __name__=='__main__': main()
