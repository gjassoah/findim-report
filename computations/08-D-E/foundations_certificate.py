#!/usr/bin/env python3
"""Finite certificate for dossier D-E 8.2--8.3.
Claim/scope: the displayed ten-dimensional C multiplication table is associative
on all 10^3 basis triples over F_2[q]; its grading and nonzero radical fourth
product hold. The induced trivial extension T=C+DC is associative on all 20^3
basis triples; the starred trace pairing and positive grading hold.
Conventions: left-idempotent first, characteristic two. Coefficients are EXACT
polynomials F_2[q], encoded by bits; no specialization of q. Nothing here checks
an infinite resolution, Ext in all degrees, or any cochain table.
Independent implementation from the task's table, before reading old scripts.
"""
from itertools import product

names = ['e','f','x','y','z','u','v','t','j','n']
corner = [('e','e'),('f','f'),('e','e'),('e','e'),('e','e'),
          ('e','f'),('e','f'),('f','e'),('f','e'),('f','f')]
deg = [0,0,2,2,4,1,3,1,3,2]
N=len(names)

def p_mul(a,b):
    result=0
    while b:
        if b&1: result ^= a
        a <<= 1
        b >>= 1
    return result

def add_into(out,k,c):
    value=out.get(k,0)^c
    if value: out[k]=value
    elif k in out: del out[k]

C=[[{} for _ in names] for _ in names]
for i in range(N):
    for j in range(N):
        if names[i] in ('e','f') and names[i]==corner[j][0]: C[i][j]={j:1}
        elif names[j] in ('e','f') and names[j]==corner[i][1]: C[i][j]={i:1}
entries = {'xy':{'z':2}, 'yx':{'z':1}, 'xu':{'v':1}, 'yu':{'v':1},
 'tx':{'j':1}, 'ty':{'j':4}, 'ut':{'y':1,'x':2}, 'vt':{'z':2},
 'uj':{'z':1}, 'tu':{'n':3}, 'nt':{'j':2}, 'un':{'v':1}}
for ab, v in entries.items():
    C[names.index(ab[0])][names.index(ab[1])] = {names.index(c):r for c,r in v.items()}

def mul(a,b,table):
    out={}
    for i,x in a.items():
        for j,y in b.items():
            for k,z in table[i][j].items(): add_into(out,k,p_mul(p_mul(x,y),z))
    return out

def basis(i): return {i:1}

def check_assoc(table):
    n=len(table)
    for a,b,c in product(range(n),repeat=3):
        assert mul(table[a][b],basis(c),table)==mul(basis(a),table[b][c],table),(a,b,c)
    return n**3

def check_grading(table,degrees):
    for a,b in product(range(len(table)),repeat=2):
        assert all(degrees[c]==degrees[a]+degrees[b] for c in table[a][b])

print('Coefficient ring: F_2[q], exact polynomial arithmetic (no specialization).')
print('C associativity basis triples:',check_assoc(C))
check_grading(C,deg)
print('C grading: all 100 products homogeneous; positive degrees 1 through 4.')
u,t=names.index('u'),names.index('t')
utut=mul(mul(mul(basis(u),basis(t),C),basis(u),C),basis(t),C)
assert utut=={names.index('z'):6}
print('C fourth radical product: utut=(q+q^2)z, nonzero in F_2[q].')
compat=[]
for a,b,c in product(range(2,N),repeat=3):
    if corner[a][1]==corner[b][0] and corner[b][1]==corner[c][0] and deg[a]+deg[b]+deg[c]<=4:
        compat.append(''.join(names[x] for x in [a,b,c]))
print('Compatible positive basis triples of total degree <=4:', ', '.join(compat))
T=[[{} for _ in range(2*N)] for _ in range(2*N)]
for a,b in product(range(N),repeat=2):
    T[a][b]=dict(C[a][b])
    for c in range(N):
        if b in C[c][a]: T[a][N+b][N+c]=C[c][a][b]
        if a in C[b][c]: T[N+a][b][N+c]=C[b][c][a]
print('T associativity basis triples:',check_assoc(T))
Tdeg=deg+[5-d for d in deg]
check_grading(T,Tdeg)
print('T grading: all 400 products homogeneous; positive degrees 1 through 5.')
def trace(vec): return vec.get(N,0)^vec.get(N+1,0)
for a,b in product(range(2*N),repeat=2):
    assert trace(T[a][b]) == (1 if b==(a+N)%(2*N) else 0)
print('T trace pairing: all 400 entries are the starred permutation matrix.')
print('PASS: finite polynomial identities only; no all-degree claim is certified by this script.')
