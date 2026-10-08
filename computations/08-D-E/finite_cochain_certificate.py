#!/usr/bin/env python3
"""Claim: universal finite algebra/cocycle/boundary identities for D-E 8.5.
Cases: all basis triples in T, all 18^4 radical quadruples, all 18^2
radical pairs; q is indeterminate over F2, not a numerical sample.
Conventions: left modules; product ab, corners (left,right); uppercase
letter is k-dual of lowercase; relative normalized Hochschild cochains;
characteristic two removes signs; H coefficient checked in degrees 0,1.
Fresh implementation from definitions/table, without importing earlier code.
"""
from itertools import product
from pathlib import Path
import json

names = tuple("efxyzuvtjn" + "EFXYZUVTJN")
index = {a:i for i,a in enumerate(names)}
low = names[:10]
rad = tuple(i for i,a in enumerate(names) if a not in "ef")
eps = tuple(int(a.isupper()) for a in names)
corners_low = dict(e="ee", f="ff", x="ee", y="ee", z="ee",
                   u="ef", v="ef", t="fe", j="fe", n="ff")
corners = {a:corners_low[a] for a in low}
corners.update({a.upper():corners_low[a][::-1] for a in low})
star = {i:index[a.swapcase()] for i,a in enumerate(names)}

# Polynomial in F2[q] is an integer bitset: bit d is the coefficient of q^d.
def pmul(a,b):
    r=0
    while b:
        if b&1:r^=a
        a<<=1;b>>=1
    return r

def add_into(v,i,c):
    v[i]=v.get(i,0)^c
    if not v[i]:del v[i]

def plus(*vs):
    z={}
    for v in vs:
        for i,c in v.items(): add_into(z,i,c)
    return z

mu={}
def setprod(a,b,items):
    mu[index[a],index[b]]={index[c]:v for c,v in items.items()}

for a in low:
    left,right=corners[a]
    setprod(left,a,{a:1})
    setprod(a,right,{a:1})

for a,b,terms in (
    ("x","y",{"z":2}), ("y","x",{"z":1}),
    ("x","u",{"v":1}), ("y","u",{"v":1}),
    ("t","x",{"j":1}), ("t","y",{"j":4}),
    ("u","t",{"y":1,"x":2}), ("v","t",{"z":2}),
    ("u","j",{"z":1}), ("t","u",{"n":3}),
    ("n","t",{"j":2}), ("u","n",{"v":1}),
):setprod(a,b,terms)

# Derive C actions on DC from (a phi)(c)=phi(ca), (phi a)(c)=phi(ac).
for a,b,c in product(range(10),repeat=3):
    for key,value in (
        ((a,b+10,c+10),mu.get((c,a),{}).get(b,0)),
        ((b+10,a,c+10),mu.get((a,c),{}).get(b,0)),
    ):
        if value:
            i,j,k=key
            add_into(mu.setdefault((i,j),{}),k,value)

def mul(v,w):
    z={}
    for a,ca in v.items():
        for b,cb in w.items():
            for c,cc in mu.get((a,b),{}).items():
                add_into(z,c,pmul(pmul(ca,cb),cc))
    return z

basis=[{i:1} for i in range(20)]
table = {
 2: """EuNT EyZX FNtU JtXZ NtEU NtXV XzJT ZxEY tEun tXuf
tXvn tXzj tuFn tuNf tvNn uFNT vNNT vtJu xEyz zJtx""",
 1: """EuUE EuVX EvVE ExXE EyYE EzZE FNnF FVvF FVxU FtTF
FtYU Ftun Ftxj JFtX JNtZ JUyX JVyZ JjEE JjTT JjXX
NFtU NNtV NUyU NVyV NjJN NjZV NnNN NnVV Ntuf Ntvn
Ntzj TtEE TtXX UuFF UuUU UvNF UvVU UxXU Uyun Uyxj
UzZU VvNN VvVV VxEU VxXV Vyuf Vyvn Vyzj VzZV XxEE
XxXX YuFT YuUY YvNT YvVY YxXY YyEE YyJJ YyTT YyXX
YyYY YyZZ YzZY ZxXZ ZzEE ZzJJ ZzTT ZzXX jJFF jJUU
jJjj jJnn jYyj jZvn jZzj nNFF nNUU ntTn tJjt tTNN
tTVV tTtt tYyt tZzt tzJn uFVX uFty uNFT uNUY uNte
uUyy uVye ujJu vNUE vNVX vNty vVyy vtTv xEuv xJFT
xJUY xJjx xJte xTtx xXuu xXvv xXyy xXzz xYyx xZye
xZzx xuFv xuNu xvNv yxJu yzJv zJNT zJVY zYyz zZuu
zZvv zZyy zZzz""",
 3:"""EyJT JtEY tEyj tyJf""",
 0:"""JNjX JVzX NNjU NVzU NjYU Njun Njxj Ntxt TNtX TVyX
Vyxt VzYU Vzun Vzxj YuNJ YuVZ jYun juNn jxJn txTn
uNNJ uNVZ uNjy uVzy xJNJ xJVZ xTNT xTVY yxTv zYuv
zuNv zxJv"""
}
p={}
entries=0
for degree,words in table.items():
    for word in words.split():
        a,b,c,v=word
        key=tuple(index[x] for x in (a,b,c))
        assert key not in p, ("repeated input",word)
        p[key]={index[v]:1<<degree}
        assert all(x in rad for x in key)
        assert corners[a][1]==corners[b][0] and corners[b][1]==corners[c][0]
        assert corners[v]==corners[a][0]+corners[c][1]
        assert eps[index[a]]+eps[index[b]]+eps[index[c]]-eps[index[v]]==1
        entries+=1
assert entries==179

def peval(v,w,z):
    out={}
    for a,ca in v.items():
        for b,cb in w.items():
            for c,cc in z.items():
                for d,cd in p.get((a,b,c),{}).items():
                    add_into(out,d,pmul(pmul(pmul(ca,cb),cc),cd))
    return out

# Algebra check is useful to catch a dual-action or multiplication transcription error.
for a,b,c in product(range(20),repeat=3):
    assert mul(mul(basis[a],basis[b]),basis[c])==mul(basis[a],mul(basis[b],basis[c])),("assoc",a,b,c)

composable=0
for a,b,c,d in product(rad,repeat=4):
    ab=mu.get((a,b),{}); bc=mu.get((b,c),{}); cd=mu.get((c,d),{})
    defect=plus(
        mul(basis[a],p.get((b,c,d),{})),
        peval(ab,basis[c],basis[d]),
        peval(basis[a],bc,basis[d]),
        peval(basis[a],basis[b],cd),
        mul(p.get((a,b,c),{}),basis[d])
    )
    assert not defect,("Hochschild",tuple(names[i] for i in (a,b,c,d)),defect)
    word=[names[i] for i in (a,b,c,d)]
    composable+=int(all(corners[word[t]][1]==corners[word[t+1]][0] for t in range(3)))
assert composable==15250

gamma={index[a]:2 for a in "uvtEXYZUV"}
for a,b in product(rad,repeat=2):
    lhs=[{},{}]
    for w in rad:
        term=mul(p.get((a,b,w),{}),basis[star[w]])
        lhs[eps[w]]=plus(lhs[eps[w]],term)
    rhs=[{},{}]
    for v,coeff in mu.get((a,b),{}).items():
        # Coefficients of H^0, H^1 in
        # a z_H(b)+z_H(ab)+z_H(a) h_H^{-1}(b).
        add_into(rhs[0],v,pmul(eps[b]*gamma.get(a,0),coeff))
        c=gamma.get(b,0)^gamma.get(v,0)^((1-eps[b])*gamma.get(a,0))
        add_into(rhs[1],v,pmul(c,coeff))
    assert lhs==rhs,("boundary",names[a],names[b],lhs,rhs)

# The explicit two-sided-simple bar cycle and its p evaluation.
def bar_d3(word):
    a,b,c=(index[x] for x in word)
    out={}
    for x,cx in mu.get((a,b),{}).items(): add_into(out,(x,c),cx)
    for x,cx in mu.get((b,c),{}).items(): add_into(out,(a,x),cx)
    return out
cycle_defect={}
for word,scalar in (("txJ",4),("tyJ",1)):
    for pair,c in bar_d3(word).items(): add_into(cycle_defect,pair,pmul(scalar,c))
assert not cycle_defect
value=plus({v:pmul(4,c) for v,c in p.get(tuple(index[a] for a in "txJ"),{}).items()},
           p.get(tuple(index[a] for a in "tyJ"),{}))
assert value=={index["f"]:8}

# Twisted Casimir multiplication and radical endpoint identity, coefficientwise in H.
total=[{},{}]; endpoint={r:[{},{}] for r in "ef"}
for w in range(20):
    prod=mu.get((w,star[w]),{})
    total[eps[w]]=plus(total[eps[w]],prod)
    if w in rad:
        r=corners[names[w]][0]
        endpoint[r][eps[w]]=plus(endpoint[r][eps[w]],prod)
assert total==[{},{}]
assert endpoint=={"e":[{index["E"]:1},{}],"f":[{index["F"]:1},{}]}

result={
 "coefficient_ring":"F2[q], exact bitset polynomials; H checked coefficientwise",
 "T_basis":''.join(names),
 "associativity_basis_triples":20**3,
 "cochain_nonzero_distinct_inputs":entries,
 "cochain_endpoint_and_weight_minus_one":"all 179 nonzero entries",
 "Hochschild_radical_quadruples":len(rad)**4,
 "Hochschild_composable_quadruples":composable,
 "boundary_radical_pairs":len(rad)**2,
 "boundary_H_coefficients":[0,1],
 "cycle":"q^2[t|x|J]+[t|y|J]",
 "cycle_p_value":"q^3 f",
 "Casimir_multiplication_H_coefficients":[0,1],
 "radical_endpoint_Casimir":"sum_{left(w)=r} h(w) w* = r*, r=e,f",
 "outcome":"all enumerated polynomial identities hold",
 "scope_exclusion":"Does not alone certify any all-degree Ext, homotopy, or stable-category claim."
}
print(json.dumps(result,indent=2))
