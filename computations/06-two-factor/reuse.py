#!/usr/bin/env python3
"""Codex job 10. Reuse the read-only one-factor exact arithmetic code.
Claim: preserve mathematical operations while choosing sparse products.
Cases: the GF(2^16) job-10 specialisation. Conventions: column matrices.
All caches and outputs belong to this job; imported sources are not edited.
"""
import ast
import os
import sys
import types
from pathlib import Path

HERE = Path(__file__).resolve().parent
OLD = HERE.parent / '05-candidate1'
os.environ['DOT_SAGE'] = str(HERE / 'sage-state')
os.environ['XDG_CACHE_HOME'] = str(HERE / 'cache')
sys.dont_write_bytecode = True

def product(a, b):
    if hasattr(a, 'nrows') and hasattr(b, 'nrows'):
        return a.sparse_matrix() * b.sparse_matrix()
    return a * b

def join(a, b, method):
    return getattr(a.dense_matrix(), method)(b.dense_matrix())

class Adapt(ast.NodeTransformer):
    def visit_Call(self, node):
        self.generic_visit(node)
        if (isinstance(node.func, ast.Attribute)
            and node.func.attr in ['augment', 'stack']
            and len(node.args) == 1 and not node.keywords):
            return ast.copy_location(ast.Call(
                func=ast.Name(id='_join', ctx=ast.Load()),
                args=[node.func.value, node.args[0], ast.Constant(node.func.attr)],
                keywords=[]), node)
        return node

    def visit_BinOp(self, node):
        self.generic_visit(node)
        if isinstance(node.op, ast.Mult):
            return ast.copy_location(ast.Call(
                func=ast.Name(id='_product', ctx=ast.Load()),
                args=[node.left, node.right], keywords=[]), node)
        return node

def load_old(name):
    source = OLD / (name + '.py')
    tree = Adapt().visit(ast.parse(source.read_text(), filename=str(source)))
    ast.fix_missing_locations(tree)
    m = types.ModuleType(name)
    # Redirect the old code's HERE and DOT_SAGE before it executes.
    m.__file__ = str(HERE / (name + '.py'))
    m._product, m._join = product, join
    sys.modules[name] = m
    exec(compile(tree, str(source), 'exec'), m.__dict__)
    if name == 'candidate':
        m.LIMIT = 2000000
    return m

c = load_old('candidate')
profile = load_old('profile')

def cover_on_top(self, M, label):
    """Same projective-cover construction, select generators in M/rad(M).
    The radical basis is in reduced column echelon form. This replaces
    repeated elimination of [rad(M), E_v M] by small top-space eliminations.
    Surjectivity, all action identities, and the kernel are checked anew.
    """
    K=self.K; n=M[0].nrows()
    c.emit(label,'radical',n)
    RR=c.matrix(K,[col for a in self.ag for col in M[a].columns()])
    c.guard(label+' radical equations',RR.nrows(),RR.ncols())
    rad=RR.row_space().basis_matrix().transpose()
    piv=list(rad.transpose().pivots()); free=[i for i in range(n) if i not in piv]
    Q=c.identity_matrix(K,n).matrix_from_rows(free)
    if piv: Q-=product(rad.matrix_from_rows(free),c.identity_matrix(K,n).matrix_from_rows(piv))
    assert product(Q,rad)==0
    gs=[]; vs=[]; topcols=[]
    for v,(l,r) in enumerate(self.verts):
        E=product(M[self.T.names.index(l)],M[20+self.T.names.index(r)])
        top=product(Q,E); selected=list(top.pivots())
        gs.extend(E.column(j) for j in selected)
        topcols.extend(top.column(j) for j in selected)
        vs.extend([v]*len(selected))
    assert len(gs)==len(free) and c.matrix(K,topcols).rank()==len(free)
    P=self.projective(vs)
    ep=c.matrix(K,[M[a]*(M[20+b]*g) for v,g in zip(vs,gs) for a,b in self.ids[v]]).transpose()
    assert ep.rank()==n
    assert all(product(ep,P['acts'][a])==product(M[a],ep) for a in range(40))
    inc=c.kernel(ep,label+' cover kernel')
    syz=c.restrict(P['acts'],inc,label)
    c.emit(label,'dim',n,'top',[vs.count(v) for v in range(4)],'P',P['dim'],'kernel',inc.ncols())
    return P,ep,inc,syz

c.Bimodules.cover=cover_on_top
