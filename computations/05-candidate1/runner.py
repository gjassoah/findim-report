#!/usr/bin/env python3
"""Codex job 08. Exact execution adapter for the saved computation sources.
Claim: avoid GF(2^16) Newton-John multiplication table overhead, not change
arithmetic. Cases: candidate, finish, profile, ext, two cases each.
Conventions: replace binary multiplication by identical multiplication with
explicit classical/sparse matrix dispatch; vectors and scalars unchanged.
Run: python3 runner.py STAGE CASE. The AST transform preserves other code.
"""
import ast, sys, types
from pathlib import Path
HERE=Path(__file__).resolve().parent
sys.dont_write_bytecode=True

def job08_product(a,b):
    if hasattr(a,'nrows') and hasattr(b,'nrows'):
        return a.sparse_matrix()*b.sparse_matrix()
    return a*b

def job08_join(a,b,method):
    return getattr(a.dense_matrix(),method)(b.dense_matrix())

class Products(ast.NodeTransformer):
    def visit_Call(self,node):
        self.generic_visit(node)
        if isinstance(node.func,ast.Attribute) and node.func.attr in ['augment','stack'] and len(node.args)==1 and not node.keywords:
            return ast.copy_location(ast.Call(func=ast.Name(id='job08_join',ctx=ast.Load()),args=[node.func.value,node.args[0],ast.Constant(node.func.attr)],keywords=[]),node)
        return node
    def visit_BinOp(self,node):
        self.generic_visit(node)
        if isinstance(node.op,ast.Mult):
            return ast.copy_location(ast.Call(func=ast.Name(id='job08_product',ctx=ast.Load()),args=[node.left,node.right],keywords=[]),node)
        return node

def execute(name,main=False):
    path=HERE/(name+'.py'); tree=Products().visit(ast.parse(path.read_text(),filename=str(path))); ast.fix_missing_locations(tree)
    m=types.ModuleType('__main__' if main else name); m.__file__=str(path); m.job08_product=job08_product; m.job08_join=job08_join
    if not main: sys.modules[name]=m
    exec(compile(tree,str(path),'exec'),m.__dict__)

if __name__=='__main__':
    stage,case=sys.argv[1:]; assert stage in ['candidate','finish','profile','cone_profile','normalisation','ext']
    sys.argv=[str(HERE/(stage+'.py')),case]
    if stage!='candidate': execute('candidate')
    if stage in ['ext','cone_profile']: execute('profile')
    execute(stage,True)
