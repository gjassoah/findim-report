Model: GPT-6 (Codex); effort: unknown.

# Job 11: weight argument audit

Scope: the claim in `scratch/11-frozen-weight-argument.md`, checked against
the permitted algebra and Toda code and local AR source. No files in
`notes/`, `escalations/`, or `log/`, and no `LEDGER.md`, were opened.
This is an AI mathematical audit, not human certification. All four items
are completed below; the report was written incrementally.

## Findings recorded during the check

1. The frozen proof mixes two functors. Restriction along `h_H` means
   `a * m = h_H(a)m`. The right-twisted tensor functor in
   `.cache/ar-src/07-branches.tex`, Lemma `branch:twist`, is explicitly
   restriction along `h_H^{-1}`. Thus the cited normalisation of the
   weight of tau cannot be transferred to restriction along `h_H`
   without reversing signs. The direct calculation in section 3 gives
   weight sum -1 for restriction and +1 for the inverse twist; both
   force the Candidate's scalar bracket to vanish.

2. Choosing a scalar H with H^N != 1 from N != 0 requires a hypothesis
   on the field, or an argument using the actual integer grading.
   Over F_q, characters on k-points only distinguish weights modulo
   q-1. The printed proof has a gap for an arbitrary field. This does
   not refute the integer-graded statement, repaired in section 1.

3. Homogeneity alone does not give the claimed universal obstruction.
   Section 4 supplies homogeneous classes of degrees 3 and -1 over
   the six-dimensional algebra T(k A2), with zero indeterminacy and
   bracket {id}. Their weight sum is zero. This refutes the broad
   reading of the scope sentence, not the conditional weight lemma.

## 1. Autoequivalence and the meaning of weight

Verdict: error found in the functor/normalisation identification; the
autoequivalence itself has no error found. Status of the following
corrected assertions: AI-proved.

Write `(c,f)(d,g)=(cd,cg+fd)`. The map `h_H(c,f)=(c,Hf)`
preserves this product and has inverse `h_(H^-1)`. Restriction `F_H`
has action `a * m=h_H(a)m`; it is exact, with exact inverse `F_(H^-1)`,
and preserves projectives. The form `t(c,f)=f(1)` on T is symmetric
and nondegenerate: its pairing is `f(d)+g(c)`. Thus T is symmetric,
projectives are injective, and its finite module category is Frobenius.
Applying F_H to a projective embedding and its cokernel gives the
suspension comparison; applying it to the short exact sequences defining
triangles preserves those triangles. This supplies the triangle structure,
rather than a freely chosen identification with suspension.

Since DC annihilates s, F_H(s)=s literally. Use the identity identification.
If `eta_a:F_H(s[a])->F_H(s)[a]` is the iterated suspension comparison,
the action on a stable map f is

    rho_H(f) = u_H[a] eta_a F_H(f) u_H^-1.

For the canonical `u_H=id`, these actions satisfy the group law. When
End_T(s)=k, replacing u_H by any scalar multiple cancels between the two
ends, in every degree. For a general simple over an arbitrary field,
End_T(s) can be a noncommutative division algebra. Arbitrary choices then
conjugate the displayed action and need not satisfy a group law unless
they are coherent. The frozen phrase "fix such isomorphisms" should use
the canonical identity; the Candidate has End_T(s)=k, so it is unaffected.

Give C degree 0, DC degree 1 and s degree 0. Choose graded projective
resolutions and graded projective embeddings, all structure maps of
internal degree 0. On a graded module the canonical comparison is

    j_H:F_H(M)->M,   m_d |-> H^(-d)m_d.

Indeed, `j_H(h_H(a)m)=a j_H(m)` for homogeneous a,m. A homogeneous
map of internal degree delta transforms by `H^(-delta)`. This also
holds on stable maps: maps factoring through projectives form a graded
subspace (decompose the two maps through a graded free module into
homogeneous components). Thus restriction weight is `w=-delta`.
For `T_(h_H) tensor_T -`, the balanced isomorphism
`a tensor m |-> h_H^-1(a)m` identifies the functor with F_(H^-1).
Its weight is `w=delta`. This explains the sign error without changing
which sums of weights vanish.

Integer weights mean the actual grading, or equivalently characters of
the algebraic torus, not eigenvalues for only the k-points of that torus.
Over F_q, the latter interpretation cannot distinguish w from w+q-1.
The scalar-selection proof is valid over an infinite field. Over any
field, repair it by choosing homogeneous representatives and homogeneous
nullhomotopies: if a homogeneous product is a boundary, projection of
any nullhomotopy to its required internal degree is a nullhomotopy.
The resulting bracket representative has the sum of the three weights.
With zero indeterminacy this is the sole value; if its target has only
weight 0 and its weight is nonzero, it vanishes. This repairs the
arbitrary-field statement when "weight" means the integer grading.

## 2. Toda naturality, signs and indeterminacy

Verdict: no error found for the specified triangle autoequivalence;
equality must be weakened to inclusion for a general triangle functor.
Status: AI-proved, by the defining triangle construction below.

For maps `X -f-> Y -g-> Z -h-> W`, with gf=hg=0, choose a triangle
`Y -g-> Z -i-> C -q-> Sigma Y`. Choose `a:Sigma X->C` with
`qa=Sigma f` and `b:C->W` with `bi=h`. Their composites ba give
one convention for the bracket in Hom(Sigma X,W). Applying a triangle
functor, including its suspension comparison, carries each such diagram
to a defining diagram. This gives inclusion of bracket sets. Applying a
triangle quasi-inverse gives the reverse inclusion for an equivalence.

Changing a adds `i v`; changing b adds `t q`. Hence the indeterminacy is

    h Hom(Sigma X,Z) + Hom(Sigma Y,W) Sigma f.

The cross term vanishes because qi=0. For the shifted endomorphisms in
the frozen claim this is

    I = tau H^(2r-1) + H^(p+r-1) beta.

Multiplying h,g,f by nonzero scalars multiplies the bracket by their
product, as follows by rescaling the triangle maps and its two lifts.
The same rescaling transports the indeterminacy. Therefore, when I=0,
the singleton transforms with weight `w(tau)+2w(beta)`.

Changing conventions for shifted triangles can insert Koszul signs in
the defining formula, but the same convention on both sides of the
functoriality identity gives the same signs. In characteristic 2 they
are all +1. The integer 2 multiplying w(beta) does NOT become 0:
`H^w H^w=H^(2w)`, also in characteristic 2. With nonzero indeterminacy
one cannot conclude the whole bracket is {0} by this singleton argument.

## 3. Candidate: direct weights from the code

Verdict: the asserted weight of tau is wrong for the named restriction
functor, but the Candidate obstruction survives. Status: AI-proved for
the explicit representatives; the numerical check is recorded below.

In `computations/04-toda-bracket/witness.py`, lines 51-54 and 61-69,
the first projectives are Tf, Te, Te; the maps are projection to f,
right multiplication by u, and right multiplication by x+y. All have
internal degree 0. Thus the displayed syzygies inherit the ordinary
DC-degree with no generator shifts. Uppercase letters are dual basis
elements and have degree 1. Lines 70-92 give

    beta_0:s->M1,      1 |-> F,
    tau:M3->s,        V |-> 1, all other displayed generators |-> 0.

Consequently delta(beta_0)=1 and delta(tau)=-1. The weights are

| Functor | w(tau) | w(beta_0) | w(tau)+2w(beta_0) |
|---|---:|---:|---:|
| Restriction along h_H | 1 | -1 | -1 |
| Right-twisted tensor, or restriction along h_H^-1 | -1 | 1 | 1 |

Both representatives are nonzero stably. For beta_0, maps s->Te vanish:
the socle of Te is D(top(eT)), the simple at e, whereas s is at f, so no map
through the cover Te->M1 can yield beta_0. For tau, Hom(Te,s)=0,
so no map factoring through a projective extends nontrivially from
M3 inside Te. Projective injectivity makes these tests sufficient.

The same code gives `beta_1(v)=v_u E`, `beta_2(v)=v_x E`, and checks
`beta_1 beta_0=0` and `tau beta_2=0` literally. Its indeterminacy
test uses M1=Tu, giving Hom(M1,s)=0, and
`fM3=<j,U,V>`, on which left multiplication by u is injective,
giving Hom(s,M3)=0. Hence H^1=H^-3=0 and
`I=tau H^-3+H^1 beta_0=0`. Since p+2r-1=0 and
H^0=k id_s has weight 0, the unique bracket is zero. In the
preprint's inverse-twist convention the actual weight sum is +1,
not just an unspecified odd integer.

## 4. Scope and counterexamples

Verdict: error found if "every one-factor design ... in which the relevant
classes are homogeneous" asserts a no-go from homogeneity alone. The
conditional claim with ALL its displayed hypotheses survives the repairs
in section 1. Status of the counterexamples and calculations below:
AI-proved, with the finite path calculation also tested below. A successful
finitistic-dimension construction is not asserted by these examples.

There is a one-factor counterexample with exactly p=3, r=-1, scalar target,
homogeneous inputs and zero indeterminacy: its weight sum is zero. Work in
characteristic 2. Let C be the path algebra of `1 -a-> 2`. Its trivial
extension is the six-dimensional algebra with the two-cycle
`1 -a-> 2 -b-> 1` and relations `aba=bab=0`. Products are right to left.
Indeed b identifies with the dual of a, ba with the dual of e1 and ab
with the dual of e2. Thus deg(a)=0 and deg(b)=1 for DC-degree.

For the simple s at vertex 1, take the complete, four-periodic resolution
with P_i of vertices `1,2,2,1` for i=0,1,2,3 modulo 4. Its differential
`P_i -> P_(i-1)` is right multiplication by

    d_1=a, d_2=ab, d_3=b, d_4=ba, repeated in both directions.

Exactness follows directly: the kernel of right multiplication by an
arrow is the one-dimensional radical-square part of its source; the
kernel of right multiplication by a length-two path is the radical of
its source. These are the respective next images. The cokernel of d_1
is s. The algebra is symmetric, so this is a complete resolution.
Applying Hom(-,s) gives zero differentials; hence

    H^n = k if n = 0 or 3 modulo 4, and H^n = 0 otherwise.

Write v for the degree-4 chain isomorphism with every component the
identity. Write f for the degree-3 chain map whose components
`f_i:P_(i+3)->P_i` are, as right multipliers,

    f_i = (e1, b, e2, a),  i=0,1,2,3 modulo 4.

Let t have degree 5 and components `(0,e2,0,e1)`. Direct multiplication
in the six-element path basis gives, with the endomorphism differential,

    d f = 0,    d t = f^2,    f t + t f = v^2.

Here the identity symbols in the last expression have degree 8, not 0.
The identities can be checked in all four residues; code below records
that check. Thus `<f,f,f>={v^2}`: its degree is 8 and its
indeterminacy is `f H^5 + H^5 f=0`. The class v^2 is nonzero because
it induces the identity on the simple top. This already exhibits a
nonzero bracket in a nonzero-weight target.

Now take tau=f and beta=f v^-1. Then p=3, r=-1,
`tau beta=0=beta^2`, and the two nullhomotopies are `t v^-1`
and `t v^-2`. Their bracket representative is

    f t v^-2 + t f v^-2 = id.

Since H^-3=H^1=0, this is the singleton `<tau,beta,beta>={id_s}`.
Assign degrees to projective generators so that the differentials have
internal degree 0. The degrees at i=0,...,4 are `0,0,1,2,3`, and
increase by 3 each period. Consequently f has internal degree -2,
v has internal degree -3, and beta has internal degree 1. The weights
for restriction along h_H are `2,3,-1`, respectively; those for the
preprint's inverse twist are `-2,-3,1`. In both conventions
`w(tau)+2w(beta)=0`. This is NOT a counterexample to the displayed
conditional theorem: it refutes the extension from that theorem to
homogeneity alone, even with a scalar target and zero indeterminacy.
The degree-three class here has even weight and has square zero; it
is not the AR class that generates a polynomial positive Ext algebra.

Homogeneity is not automatic either. Take C=k[x]/(x^2); then
`T(C)=k[x,y]/(x^2,y^2)` by identifying y with the functional dual to x
and xy with the functional dual to 1. The radical modulo its square
has basis x,y of degrees 0,1. A minimal first projective cover of its
radical has generators in those degrees, so H^1 has independent dual
classes u,z of restriction weights 0,1. The class u+z is not homogeneous
in the integer grading. This example only refutes automatic homogeneity;
no assertion that (u+z)^2=0 is needed or made. In the actual AR Candidate,
H^-1 is one-dimensional and beta_0 is explicitly homogeneous, so this
particular issue does not affect it. Weight decomposition of H^n does
not imply every vector in H^n is homogeneous.

For a power tau^m, the weight test becomes
`m w(tau)+2w(beta)`, and must be recomputed. In the AR scalar-target
case, `3m+2r-1=0` forces m odd, so the parity argument still excludes
cancellation for homogeneous beta. Even powers cannot give degree 0
with integral r. Negative powers of the AR tau are not available:
invertibility would identify H^0 with H^-3, whereas the latter vanishes.
Powers are therefore not an escape from the scalar obstruction in this
specific Candidate. The six-dimensional example above instead has a
different, degree-4 invertible class v and an even-weight tau.

The last explanation about why the AR source uses a tensor square
remains heuristic. Neither the weight lemma nor these counterexamples
classify all one-factor constructions.

## Reproducible checks

To respect the instruction to modify only this report, the test script and
its output are embedded here, rather than saved as additional files in
`computations/`. It uses only the Python standard library and writes no
files. Run the `python` block below with `python -B`.

Claim/cases/conventions: check the Candidate's displayed syzygies, maps,
and scaling eigenvalues over GF(16), q the root of X^4+X+1, all 15 nonzero
H; independently check the six-dimensional counterexample over GF(2).
All maps are left-module maps written as right multipliers or columns;
products are right to left. Finite cases have status supported; the
symbolic arguments above have status AI-proved.

```python
# Job 11: finite exact checks; no filesystem writes or third-party imports.
# GF(16) = GF(2)[q]/(q^4+q+1), q=2 in binary polynomial encoding.
def km(a, b):
    z = 0
    while b:
        if b & 1:
            z ^= a
        b >>= 1
        a <<= 1
        if a & 16:
            a ^= 19
    return z

def kp(a, n):
    z = 1
    for _ in range(n):
        z = km(z, a)
    return z

def add(a, b):
    return tuple(x ^ y for x, y in zip(a, b))

def scale(c, a):
    return tuple(km(c, x) for x in a)

names = list('exyzuvtjfn')
N = names + [n.upper() for n in names]
idx = {n: i for i, n in enumerate(N)}
B = [tuple(int(i == j) for i in range(20)) for j in range(20)]
z = (0,) * 20
b = lambda n: B[idx[n]]
q = 2
corners = ['ee'] * 4 + ['ef'] * 2 + ['fe'] * 2 + ['ff'] * 2
prod = {}
for n, (l, r) in zip(names, corners):
    prod[l, n] = {n: 1}
    prod[n, r] = {n: 1}
for a, c, out in [
    ('x', 'y', {'z': q}), ('y', 'x', {'z': 1}),
    ('x', 'u', {'v': 1}), ('y', 'u', {'v': 1}),
    ('t', 'x', {'j': 1}), ('t', 'y', {'j': km(q, q)}),
    ('u', 't', {'y': 1, 'x': q}), ('v', 't', {'z': q}),
    ('u', 'j', {'z': 1}), ('t', 'u', {'n': 1 ^ q}),
    ('n', 't', {'j': q}), ('u', 'n', {'v': 1})]:
    prod[a, c] = out
triples = [(idx[a], idx[c], idx[n], v)
           for (a, c), out in prod.items() for n, v in out.items()]

def mul(a, c):
    out = [0] * 20
    for i, j, k, v in triples:
        out[k] ^= km(v, km(a[i], c[j]))
        out[10+i] ^= km(v, km(a[j], c[10+k]))
        out[10+j] ^= km(v, km(a[10+k], c[i]))
    return tuple(out)

def rank(vs):
    piv = {}
    for v in vs:
        v = tuple(v)
        for i in sorted(piv):
            v = add(v, scale(v[i], piv[i]))
        if any(v):
            i = next(i for i, x in enumerate(v) if x)
            piv[i] = scale(kp(v[i], 14), v)
    return len(piv)

def inspan(v, vs):
    return rank(vs + [v]) == rank(vs)

Pe = [v for v in B if mul(v, b('e')) == v]
Pf = [v for v in B if mul(v, b('f')) == v]
M1 = [b(n) for n in ['u', 'v', 'n', 'T', 'J', 'F', 'N']]
M2 = [add(b('x'), b('y')), b('z'), b('j'), b('E'),
      add(b('X'), scale(q, b('Y')))]
M3 = [add(b('x'), scale(q, b('y'))), b('z'), b('j'), b('E'),
      add(b('X'), b('Y')), b('U'), b('V')]
assert (len(Pe), len(Pf)) == (12, 8)
assert [rank(M) for M in (M1, M2, M3)] == [7, 5, 7]
image1 = [mul(v, b('u')) for v in Pe]
image2 = [mul(v, add(b('x'), b('y'))) for v in Pe]
assert rank(image1) == 7 and all(inspan(v, M1) for v in image1)
assert rank(image2) == 5 and all(inspan(v, M2) for v in image2)
assert all(mul(v, b('u')) == z for v in M2)
assert all(mul(v, add(b('x'), b('y'))) == z for v in M3)
assert all(v[idx['f']] == 0 for v in M1)
for M in (M1, M2, M3):
    assert all(inspan(mul(a, v), M) for a in B for v in M)
beta1 = lambda v: scale(v[idx['u']], b('E'))
beta2 = lambda v: scale(v[idx['x']], b('E'))
tau = lambda v: v[idx['V']]
assert beta1(b('F')) == z
assert all(tau(beta2(v)) == 0 for v in M2)
for a in B:
    assert mul(a, b('F')) == scale(a[idx['f']], b('F'))
    assert all(beta1(mul(a, v)) == mul(a, beta1(v)) for v in M1)
    assert all(beta2(mul(a, v)) == mul(a, beta2(v)) for v in M2)
    assert all(tau(mul(a, v)) == km(a[idx['f']], tau(v)) for v in M3)
assert rank([mul(b('u'), b(n)) for n in ['j', 'U', 'V']]) == 3
assert all(inspan(mul(b('f'), v), [b(n) for n in ['j','U','V']])
           for v in M3)
for H in range(1, 16):
    def h(v):
        return v[:10] + tuple(km(H, c) for c in v[10:])
    def j(v):
        return v[:10] + tuple(km(kp(H, 14), c) for c in v[10:])
    assert all(h(mul(a, c)) == mul(h(a), h(c)) for a in B for c in B)
    assert j(b('F')) == scale(kp(H, 14), b('F'))
    assert all(tau(h(v)) == km(H, tau(v)) for v in M3)
print('Candidate GF(16): syzygies/maps PASS; all 15 H: tau H, beta H^-1')

# Independent six-dimensional path algebra. A path is (start, length).
# There is a unique alternating path with each start and length 0,1,2.
def end(p):
    return p[0] ^ (p[1] % 2)

def pm(p, r):
    if p is None or r is None or end(r) != p[0] or p[1]+r[1] >= 3:
        return None
    return (r[0], p[1]+r[1])

def plus(*ps):
    out = set()
    for p in ps:
        if p is not None:
            out.symmetric_difference_update({p})
    return out

e1, e2, a, bb, ab, ba = (0,0), (1,0), (0,1), (1,1), (1,2), (0,2)
D = [ba, a, ab, bb]
F = [e1, bb, e2, a]
T = [None, e2, None, e1]
verts = [0, 1, 1, 0]
d = lambda i: D[i % 4]
f = lambda i: F[i % 4]
t = lambda i: T[i % 4]
for i in range(4):
    assert pm(f(i), d(i)) == pm(d(i+3), f(i-1))
    square = pm(f(i+3), f(i))
    assert plus(pm(t(i+1), d(i+1)), pm(d(i+6), t(i))) == plus(square)
    value = plus(pm(t(i+3), f(i)), pm(f(i+5), t(i)))
    assert value == {(verts[i], 0)}
print('T(k A2), characteristic 2: all four residues df=0, dt=f^2, ft+tf=v^2 PASS')
print('Hence <f,f v^-1,f v^-1>={id}; weights (restriction) 2,-1, sum 0')
```

Executed output (exit code 0):

```text
Candidate GF(16): syzygies/maps PASS; all 15 H: tau H, beta H^-1
T(k A2), characteristic 2: all four residues df=0, dt=f^2, ft+tf=v^2 PASS
Hence <f,f v^-1,f v^-1>={id}; weights (restriction) 2,-1, sum 0
```

Input SHA-256:

```text
1c7ca79dfd062d9e80ae33a8384edf2569603864746f3ee60e1801db4bace2bf  scratch/11-frozen-weight-argument.md
618bb230bc28927b392857f51a2aa142730146b432603b6b41d9647c9e48bc14  computations/04-toda-bracket/witness.py
9ccdcde3589f65ae0a27a25936205a9f9dcf8bcdd2ce2f4514a6bc31a5ed8352  computations/04-toda-bracket/toda.py
```

The existing Sage scripts were read but not executed, since they configure
or write additional state/output files. The embedded computation instead
reconstructs the relevant finite multiplication and uses no dependencies.
No full AR resolution or general one-factor classification was computed.
No outside literature was used; the arguments above are supplied directly.
Only this report was written by this job. Unrelated job-10 outputs appeared
in Git status during the run and were not opened or modified.
