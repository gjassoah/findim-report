#!/usr/bin/env python3
"""Apply P-prose decisions to the saved P-apply source snapshot.
Claim checked: each edit matches its audited source range; no edits overlap.
Cases: 194 proposal rows, report/main.tex and fourteen section files.
Conventions: whitespace-insensitive matching; mathematical tokens unchanged
except the explicitly accepted prose expansions/deletions; no mathematical
verification or change of claim status. Run from repository root.
"""
from pathlib import Path
import json, re, textwrap

rows = json.loads(Path('scratch/P-apply-original/proposals.json').read_text())
original = {str(p): (Path('scratch/P-apply-original') / p.relative_to('report')).read_text()
            for p in [Path('report/main.tex'), *sorted(Path('report/sections').glob('*.tex'))]}
edits = {p: [] for p in original}
status = {}

def reject(i, why='Retain selection data / selection functor as instructed.'):
    status[i] = ('rejected per the list', why)

for i in [1,6,7,15,17,34,36,37,38,39,41,44,50,51,52,54,58,59,72,73,86,90,93,96]:
    reject(i)
for i in [177,189,190]:
    reject(i, 'Retain the subsection title.' if i == 177 else
           'Retain the section title.' if i == 189 else
           'Retain the explicit clause that no part was written by a human.')

def replace(i, old, new, note=''):
    file, span = rows[i-1][0].split(':')
    a, *b = span.split('–'); a = int(a); b = int(b[0]) if b else a
    source = original[file]
    pattern = r'\s+'.join(re.escape(x) for x in old.split())
    matches = [m for m in re.finditer(pattern, source)
               if a-5 <= source.count('\n', 0, m.start())+1 <= b+1]
    assert len(matches) == 1, (i, old, len(matches))
    m = matches[0]
    end = m.end()
    if not new:
        end += len(re.match(r'[ \t]*', source[end:])[0])
    edits[file].append((m.start(), end, new, i))
    status[i] = ('applied', note)

def full(i, old, note=''):
    new = re.findall(r'`([^`]*)`', rows[i-1][2])[-1 if i == 98 else 0]
    replace(i, old, new, note)

# Mixed proposals preserve every occurrence of the retained defined terms.
replace(4, 'The main construction has three layers. ', '',
        'Deleted the layer announcement; rejected replacement of selection functor.')
replace(42, r'The \emph{visible rank} of the selection data is the dimension of the subspace',
        'For the selection data, put',
        'Removed visible rank; retained selection data.')
replace(43, r'Let $(R,\Psi)$ be selection data of finite visible rank $r$.',
        r'Let $(R,\Psi)$ be selection data, and suppose that $r=\dim_{\mathbb Q}\mathcal V<\infty$.',
        'Replaced visible rank only; retained selection data.')
replace(83, 'the encoding algebra', 'the algebra',
        'Removed encoding only; rejected replacement of selection data.')

# Full-sentence and compound replacements, read against the source snapshot.
full(3, 'This article reconstructs both constructions in a common framework, with complete proofs, and isolates the mechanisms on which they rest. It is not a rewrite of the preprints: the arguments are reorganised around a small number of general statements, several of which are more general than needed, and the article adds criteria and obstructions that explain why the constructions take the form they do.')
replace(12, 'simple witnesses of this failure', 'simple modules witnessing this failure')
replace(12, 'an Auslander--Reiten counterexample', 'a counterexample to the Auslander--Reiten conjecture')
full(18, 'This section collects the general statements on which both mechanisms rest. All of them are elementary; their role is to reduce the construction of a counterexample to the construction of a single module with prescribed homological behaviour. We begin with the dimension-shifting argument that produces modules of every finite projective dimension.')
full(20, r'The following statement is the source of the explicit witnesses in the Auslander--Reiten route. Its mechanism is classical: it is the argument by which finiteness of the finitistic dimension of $A^{\op}$ implies the strong Nakayama conjecture for $A$~\cite[Section~3.2, Proposition~5]{CB19}. We record the exact projective dimensions it produces.')
full(22, r'The modules $C_n$ of \Cref{thm:strong-nakayama} have projective dimension one at the start, and the condition can be read on $C_1$ alone.')
replace(28, 'of a witness of strong Nakayama failure', r'of a module $E$ as in \Cref{thm:strong-nakayama}')
replace(28, 'cannot be witnesses by themselves', 'cannot themselves satisfy the hypothesis of that theorem')
replace(29, r'This section shows that projective dimensions of inflated $A$-modules are governed by the iterates of $\Phi$:', r'For an inflated $A$-module $N$,')
replace(31, r'Under the same hypothesis on $\Delta$, the section ends with two constraints on extinction: the classes of long iterates of modules of finite extinction time vanish in the Grothendieck group, and finite extinction times are bounded on modules of bounded dimension.', '')
replace(32, 'may be nonzero: a module of extinction time larger than $n$ has iterates that are nonzero but invisible in the Grothendieck group.', 'may be nonzero.')
replace(32, r'; this is the role of the odd double of \Cref{prop:odd-double}', r', as in \Cref{prop:odd-double}')
full(33, r'By \Cref{prop:bounded-extinction}, modules of unbounded finite extinction time have unbounded dimension. This is consistent with \Cref{prop:bounded-dimension}, which gives the same conclusion for modules of unbounded finite projective dimension over any finite-dimensional algebra.')
full(35, r'The main construction starts from an algebra $R$, possibly infinite-dimensional, and an exact endofunctor $H$ of its finite-dimensional modules whose iterates annihilate modules at arbitrarily late times. This section fixes the class of functors used, shows that a finiteness condition on Grothendieck groups bounds the times at which modules can be annihilated, and constructs the example of the main preprint~\cite[Section~2]{OAI26findim}, in which $R$ is the complex group algebra of a finitely presented group.')
replace(40, r'A module of extinction time $t$ satisfies $H^jY\neq0$ for $j<t$ and $H^jY=0$ for $j\geq t$.', '')
full(45, r'In case~\eqref{it:rank-noetherian} the argument bounds the image of $\chi$ by the finitely many component ranks, without requiring finite rank of $K_0(R)$. In the example below the visible rank is infinite because the finite-dimensional modules constructed there detect linearly independent rank functions; see \Cref{rem:selection-visible-rank}.')
replace(47, r'For instance, for $n=(s-r)\varepsilon_i-r\varepsilon_j$ we have $\lambda_{W_{ij}}(n)=(s-r)+r=s$ and $\lambda_{U_j}(n)=r$.', '')
full(49, r'By the argument of \Cref{coro:z-independent}, every group with infinitely many independent central involutions has a centre that is not finitely generated. The matrix shape of $G$ provides a finitely presented group of this kind in which an automorphism shifts the involutions, and the finite quotients $F_m$ separate any finite subfamily of them.')
replace(56, '; this description is not needed.', '.')
replace(57, r'a sign pattern of the central involutions; the algebra $R$, the idempotent $e$ and the automorphism $\alpha$ are fixed once and for all, which is what the passage to a single finite-dimensional algebra in \Cref{sec:simulation} requires', r'the values of $\chi_m$ on the central involutions; $R$, $e$ and $\alpha$ are independent of $m$, as required in \Cref{sec:simulation}')
full(66, r"It forgets the multiplication of $R$ and records only the span of the homogenised relations; the multiplication is represented by composition in the quotient category of \Cref{subsec:action}, in which $s$ and $s'$ become invertible and $x_h$ acts as $s^{-1}a_h$.")
full(67, r'No identification of $\mathcal{Q}$ with a derived category of $R$ is needed here or later, and none is claimed: the argument uses only the action $\theta$ and the evaluation functors.')
replace(68, 'The odd double', 'A summand and its odd shifts', 'Applied the modified heading.')
full(69, r'The class $[V]=0$ lives in $K_0(\mathcal{T})$, and it does not by itself say anything about classes in other categories. The cancellation of odd shifts that it reflects reappears, however,')
replace(74, r'n}), \] since endomorphisms of a direct sum compose as matrices.', 'n}).\n\\]\n')
full(76, r'The remaining steps reverse this: they lift $\mathbb{V}$ to $\mathcal{K}$ and then replace the lift by a complex of bimodules.')
full(81, r'The argument thus yields a complex of unspecified length, and the integer $l$ entering the simulation of \Cref{sec:simulation} is not determined by it.')
replace(82, r'the construction uses no coherence data beyond the homotopies $h_\rho$; this is where the absence of paths of length three in $Q$ enters', r'no homotopies beyond $h_\rho$ are required')
replace(84, r'0&\text{otherwise,} \end{cases} \] since a $B$-module is determined by its vertex spaces and arrow actions.', '0&\\text{otherwise.}\n    \\end{cases}\n  \\]')
full(87, 'This section bridges the two: a bounded complex of bimodules is simulated, up to a shift, by the square of the derived tensor functor of an ordinary bimodule over a larger algebra. Combining the three steps gives the main theorem.')
full(89, r'The simulation trades the complex $P$, of length $l$, for an ordinary bimodule over an algebra with $l+2$ copies of $B$: the chain algebra $K_l$ stores the degrees of $P$ as vertices, the bimodule $O$ stores its differential as arrows, and the derived tensor with $Y$ recovers $P[b]$ by means of the resolution of the simple module $W$. The cost is that the global dimension, and the number of simple modules, grow linearly with~$l$.')
replace(92, r'The order of the choices matters: the algebra $A$ is fixed before the modules $Y$ are chosen, and only then does $t$ vary. A separate complex $P$ for each module, or algebras depending on $t$, would not give a counterexample.', '')
replace(95, 'Every step of the construction is explicit except one.', '')
full(98, r'The encoding algebra itself is large but explicit: applying the quadraticisation of \Cref{subsec:encoding} to the chosen presentation of $\mathbb{C}G$ introduces, besides the thirty symbols for the fifteen generators of $G$ and their inverses, auxiliary generators for the relators of degree larger than two, and $B$ has $2(d+1)$ arrows for $d$ generators.')
replace(101, r'The Auslander--Reiten conjecture~\cite{AR75a} asserts that a finitely generated module $Z$ over a finite-dimensional algebra $\Lambda$ with $\operatorname{Ext}^i_\Lambda(Z,Z\oplus\Lambda)=0$ for all $i\geq1$ is projective. By \Cref{thm:ar-to-findim}, a counterexample yields an algebra of infinite little finitistic dimension.', r'By \Cref{thm:ar-to-findim}, a counterexample to the Auslander--Reiten conjecture~\cite{AR75a} yields an algebra of infinite little finitistic dimension.', 'Removed repeated definition; preserved the existing citation.')
full(103, r'This section proves the principle behind that construction, \Cref{thm:conversion}, over an arbitrary field; the preprint treats characteristic two, in which all signs below disappear. The principle reduces')
replace(109, ', and it locates the obstructions:', '. In particular,')
replace(111, 'is a single line.', 'is one-dimensional.')
replace(111, 'achieves this with', 'is obtained as')
full(113, r'This section constructs the data of \Cref{thm:conversion}, following the Auslander--Reiten preprint~\cite{OAI26ar}, and deduces a second algebra of infinite little finitistic dimension, with nine simple modules.')
full(147, r'The number of simple modules of the algebra in \Cref{coro:ar-findim}, nine, is small, in contrast with the main construction of \Cref{coro:main}, whose number $3(l+2)$ of simple modules is not determined.')
full(161, r'The following computations test the one-factor shape directly; their scripts and parameters are described in \Cref{app:computations}. The results agree with \Cref{coro:one-factor}.')
replace(164, r'Three further one-factor attempts with algebras of dimensions $6$, $12$ and $40$ fail earlier: the relevant simple modules do not have polynomial Ext algebras on one generator of degree three; their Ext profiles', r'Three further attempts to use a single cone over algebras of dimensions $6$, $12$ and $40$ fail because the relevant simple modules do not have polynomial Ext algebras on one generator of degree three; their Ext dimensions')
replace(165, 'This appendix describes the computations cited in the article. They are of two kinds.', '')
replace(169, 'The minimised attempt', 'The computation')
full(182, 'A search of Mathlib for the infrastructure needed by the other results shows that a complete formalisation of either construction would require large foundations that are not available')
full(188, r'The comparison with \Cref{sec:ar-route} shows the role of the triangular algebra there: it produces an Auslander--Reiten counterexample over a triangular algebra from stable data over a symmetric one, without requiring a module with vanishing self-extensions over the symmetric algebra itself.')
replace(192, 'The work had two parts.', '')
replace(192, r'it produced the criteria of \Cref{sec:criteria}, the obstructions of \Cref{sec:obstructions}, and the conclusion that no counterexample verifiable by hand was found.', r'it produced the criteria of \Cref{sec:criteria} and the obstructions of \Cref{sec:obstructions}, but found no counterexample verifiable by hand.')

replace(156, r'uses the second cone to create the gap between the degrees $0$ and $3$ of \Cref{prop:two-cone-profile}', r'uses a second cone, after which the only nonzero groups $W^a$ are in degrees $0$ and $3$, as in \Cref{prop:two-cone-profile}')
replace(163, r'The one-factor candidate built from the cone of $\tau$ over $T$', r'The candidate constructed over $T$ from the cone of $\tau$')

# All remaining rows are literal local substitutions (or explicit deletions).
for i, row in enumerate(rows, 1):
    if i in status:
        continue
    old = re.findall(r'`([^`]*)`', row[1])
    new = re.findall(r'`([^`]*)`', row[2])
    assert len(old) == 1 and '...' not in old[0], (i, old)
    if row[2].startswith('Delete'):
        replace(i, old[0], '')
    else:
        assert row[2].startswith('`') and new, (i, new)
        replace(i, old[0], new[0])

# Validate edits before touching manuscript files. Readiness is all-or-nothing.
for file, changes in edits.items():
    changes.sort()
    for prev, nex in zip(changes, changes[1:]):
        assert prev[1] <= nex[0], ('overlap', file, prev, nex)

# Wrap only overlong lines. Preserve comment semantics and never break words.
def wrap_lines(source):
    result = []
    for line in source.splitlines():
        line = line.rstrip()
        if len(line) <= 80:
            result.append(line); continue
        indent = re.match(r'\s*', line)[0]
        continuation = indent + '% ' if line.lstrip().startswith('%') else indent
        result.extend(textwrap.wrap(line, 80, subsequent_indent=continuation,
                                    break_long_words=False, break_on_hyphens=False))
    return '\n'.join(result) + '\n'

for file, changes in edits.items():
    source = original[file]
    previous = (Path('scratch/P-apply-pass1') / Path(file).relative_to('report')).read_text()
    assert Path(file).read_text() in (source, previous), ('source changed concurrently', file)
    for a, b, new, i in reversed(changes):
        source = source[:a] + new + source[b:]
    if file == 'report/main.tex':
        source = source.replace('% Detailed history:', '%   GPT-6 (Codex), effort unknown, approved prose edits (P-apply), 2026-10-08\n% Detailed history:', 1)
    if file.endswith('A2-verification.tex'):
        source = source.replace(r'p{0.22\textwidth}p{0.26\textwidth}', 'p{0.22\\textwidth}%\n  p{0.26\\textwidth}')
    if file.endswith('03-criteria.tex'):
        source = source.replace(r'\label{subsec:auslander-reiten}', r'\label{subsec:auslander-reiten}' + '\n\\leavevmode\\par')
    if file.endswith('06-realisation.tex'):
        source = source.replace('\n Put\n', '\nPut\n')
    # Remove whitespace-only remnants of deleted standalone paragraphs.
    source = re.sub(r'\n[ \t]+\n', '\n\n', source)
    source = re.sub(r'\n{3,}', '\n\n', source)
    source = wrap_lines(source)
    if file == 'report/main.tex':
        source = source.replace('% drafting,', '%     drafting,').replace('% review,', '%     review,').replace('% with minor edits,', '%     with minor edits,')
        start = source.index('% Research report')
        end = source.index('\\documentclass', start)
        source = source[:start] + '''% Research report on the OpenAI preprints on the finitistic dimension conjecture
% and the Auslander--Reiten conjecture (September 2026). Sources: this file
% (preamble and outline) and sections/*.tex, included with \\input.
% Build with latexmk (see latexmkrc): pdfLaTeX and biber, bibliography in
% library.bib.

''' + source[end:]
    Path(file).write_text(source)

out = ['Model: GPT-6 (Codex); effort: unknown.', '', '# P-apply: decision record', '',
       'Scope: approved prose edits only; mathematical claims retain their existing',
       'statuses. This job supplies no new mathematical verification or certification.',
       'P001–P194 follow the proposal-table order in `audit/P-prose-codex.md`.',
       'Locations below refer to that audit and the saved pre-edit source.', '',
       '| Proposal | Location | Decision | Detail |', '|---|---|---|---|']
for i, row in enumerate(rows, 1):
    decision, note = status[i]
    out.append(f'| P{i:03} | {row[0]} | {decision} | {note or "As proposed."} |')
out += ['', 'Build and preservation checks: pending.']
Path('audit/P-apply-codex.md').write_text('\n'.join(out)+'\n')
print('Applied:', sum(s[0]=='applied' for s in status.values()))
print('Rejected:', sum(s[0].startswith('rejected') for s in status.values()))
print('Text replacements:', sum(map(len, edits.values())))
