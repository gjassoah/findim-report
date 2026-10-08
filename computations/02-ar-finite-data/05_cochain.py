#!/usr/bin/env python3
"""Claim: item 5, complete cochain table, cocycle, twisted boundary and evaluation.
Cases: all 18^4 words, all 18^2 boundary pairs, and the displayed 3-cycle.
Conventions: relative normalized bars, characteristic 2, stars switch C and DC;
exact F_2(q), boundary over F_2(q,H), then primitive q,H in F_(2^16).
Author: Codex job 04.
"""
import sys
sys.dont_write_bytecode=True
import re
from pathlib import Path
from itertools import product
from importlib import import_module
base=import_module('01_algebra')
extension=import_module('04_trivial_extension')
from sage.all import GF, PolynomialRing

SOURCE=Path(__file__).resolve().parents[2]/'.cache/ar-src/09-cochain.tex'


def read_entries():
    source=SOURCE.read_text()
    table=source.split(r'\begin{tabular}',1)[1].split(r'\end{tabular}',1)[0]
    entries=[]
    for coefficient,words in re.findall(r'\$(q(?:\^\d+)?|1)\$\s*&\s*\\texttt\{([^}]+)\}',table):
        power=0 if coefficient=='1' else (1 if coefficient=='q' else int(coefficient[2:]))
        entries.extend((word,power) for word in words.split())
    assert all(len(w)==4 for w,p in entries)
    assert len(entries)==179,('entry count',len(entries))
    assert len({w[:3] for w,p in entries})==179, 'three-letter inputs are not distinct'
    return entries


def add_scaled(target,source,scalar):
    for v,c in source.items():
        value=target.get(v,0)+scalar*c
        if value:
            target[v]=value
        else:
            target.pop(v,None)


def setup(K,q,entries):
    A=extension.TrivialExtension(K,q)
    mu=[[{v:ab[v] for v in ab.nonzero_positions()} for ab in row] for row in A.table]
    p={tuple(A.names.index(n) for n in word[:3]): {A.names.index(word[3]):q**power}
       for word,power in entries}
    rad=[i for i,n in enumerate(A.names) if n not in 'ef']
    return A,mu,p,rad


def fail(message,A,word,value):
    print('FAIL:',message,'on',''.join(A.names[i] for i in word),
          'residual =',{A.names[i]:c for i,c in value.items()},flush=True)
    raise AssertionError(message)


def cocycle(K,q,entries):
    A,mu,p,rad=setup(K,q,entries)
    for (a,b,c),outputs in p.items():
        assert all(i in rad for i in (a,b,c))
        assert A.corners[a][1]==A.corners[b][0] and A.corners[b][1]==A.corners[c][0]
        for v in outputs:
            assert A.corners[v]==(A.corners[a][0],A.corners[c][1])
            assert sum(i>=10 for i in (a,b,c))==1+int(v>=10)
    print('PASS: 179 entries, distinct inputs, endpoints and weight -1',flush=True)
    composable=0
    for a,b,c,d in product(rad,repeat=4):
        composable+=int(all(A.corners[i][1]==A.corners[j][0] for i,j in [(a,b),(b,c),(c,d)]))
        total={}
        for x,v in p.get((b,c,d),{}).items():
            add_scaled(total,mu[a][x],v)
        for x,v in mu[a][b].items():
            add_scaled(total,p.get((x,c,d),{}),v)
        for x,v in mu[b][c].items():
            add_scaled(total,p.get((a,x,d),{}),v)
        for x,v in mu[c][d].items():
            add_scaled(total,p.get((a,b,x),{}),v)
        for x,v in p.get((a,b,c),{}).items():
            add_scaled(total,mu[x][d],v)
        if total:
            fail('Hochschild cocycle',A,(a,b,c,d),total)
    assert composable==15250,('composable four-word count',composable)
    print('PASS: all 104976 radical four-words; composable count =',composable,flush=True)


def boundary(K,q,H,entries):
    A,mu,p,rad=setup(K,q,entries)
    chosen=set('uvtEXYZUV')
    gamma=[q if name in chosen else K(0) for name in A.names]
    for a,b in product(rad,repeat=2):
        lhs={}
        pieces=[{},{}]
        for w in rad:
            for x,c in p.get((a,b,w),{}).items():
                term=mu[x][(w+10)%20]
                add_scaled(lhs,term,c*H**int(w>=10))
                add_scaled(pieces[int(w>=10)],term,c)
        rhs={v:(H*gamma[b]+H*gamma[v]+H**(1-int(b>=10))*gamma[a])*c
             for v,c in mu[a][b].items()}
        rhs={v:c for v,c in rhs.items() if c}
        residual=dict(lhs)
        add_scaled(residual,rhs,K(1))
        if residual:
            fail('twisted boundary',A,(a,b),residual)
        # Also compare the source's separate constant and linear recurrences.
        for epsilon in [0,1]:
            expected={v:(int(b>=10)*gamma[a] if epsilon==0 else
                          gamma[b]+gamma[v]+(1-int(b>=10))*gamma[a])*c
                      for v,c in mu[a][b].items()}
            expected={v:c for v,c in expected.items() if c}
            if pieces[epsilon]!=expected:
                residual=dict(pieces[epsilon])
                add_scaled(residual,expected,K(1))
                fail('boundary coefficient '+str(epsilon),A,(a,b),residual)
    print('PASS: all 324 twisted boundary pairs, both coefficient identities',flush=True)


def evaluation(K,q,entries):
    A,mu,p,rad=setup(K,q,entries)
    ix=lambda s: tuple(A.names.index(n) for n in s)
    cycle={ix('txJ'):q**2,ix('tyJ'):K(1)}
    differential={}
    value={}
    for (a,b,c),coefficient in cycle.items():
        assert A.corners[a][0]=='f' and A.corners[c][1]=='f'
        for v,k in mu[a][b].items():
            add_scaled(differential,{(v,c):k},coefficient)
        for v,k in mu[b][c].items():
            add_scaled(differential,{(a,v):k},coefficient)
        add_scaled(value,p.get((a,b,c),{}),coefficient)
    assert not differential,('not a cycle',differential)
    assert value=={A.names.index('f'):q**3} and q**3!=0
    assert p.get(ix('txJ'),{})=={} and p[ix('tyJ')]=={A.names.index('f'):q**3}
    print('PASS: d(q^2[t|x|J]+[t|y|J])=0; p evaluates to q^3*f != 0')


if __name__=='__main__':
    entries=read_entries()
    K=PolynomialRing(GF(2),'q').fraction_field()
    q=K.gen()
    print('FIELD: exact F_2(q)',flush=True)
    cocycle(K,q,entries)
    L=PolynomialRing(GF(2),['q','H']).fraction_field()
    q,H=L.gens()
    print('FIELD: exact F_2(q,H)',flush=True)
    boundary(L,q,H,entries)
    evaluation(K,K.gen(),entries)
    F=GF(2**16,name='a')
    q=F.multiplicative_generator()
    H=q**7
    assert q.multiplicative_order()==H.multiplicative_order()==65535
    print('FIELD:',F,'; modulus =',F.modulus())
    print('q =',q,'; H = q^7 =',H,'; both orders = 65535',flush=True)
    cocycle(F,q,entries)
    boundary(F,q,H,entries)
    evaluation(F,q,entries)
    print('ITEM 5 PASS (supported by exhaustive exact identities and specialisation)')
