#!/usr/bin/env python3
"""Check preservation and build requirements for job P-apply.
Claim: approved prose changes preserve protected source and LaTeX structure.
Cases: report/main.tex and fourteen section files, against the private snapshot.
Conventions: whitespace ignored for formulas and citation locators; the two
approved display punctuation changes are allowed; no mathematical certification.
Output: computations/P-apply-check.out (redirect stdout when running).
"""
from pathlib import Path
from collections import Counter
import hashlib, json, re

files = [Path('report/main.tex'), *sorted(Path('report/sections').glob('*.tex'))]
normalize = lambda s: re.sub(r'\s+', '', s)
report = {'files': len(files), 'source_sha256': {}, 'protected_terms': {},
          'display_punctuation_changes': [], 'added_reference_targets': {},
          'removed_reference_targets': {}}

def commands(s, name):
    return re.findall(r'\\' + name + r'\{([^}]+)\}', s)

def displays(s):
    return [normalize(x[0] or x[1]) for x in re.findall(
        r'\\\[(.*?)\\\]|\\begin\{(?:equation\*?|align\*?|gather\*?)\}'
        r'(.*?)\\end\{(?:equation\*?|align\*?|gather\*?)\}', s, re.S)]

def references(s):
    s = re.sub(r'%[^\n]*\n', '', s)
    return Counter(key for ref in commands(s, r'(?:[Cc]ref|eqref|ref)')
                   for key in ref.split(','))

all_labels = set()
for p in files:
    old = (Path('scratch/P-apply-original') / p.relative_to('report')).read_text()
    new = p.read_text()
    assert all(len(line) <= 80 for line in new.splitlines()), p
    assert commands(old, 'label') == commands(new, 'label'), p
    all_labels.update(commands(new, 'label'))
    for term in ['selection data', 'selection functor']:
        count = lambda s: len(re.findall(term, re.sub(r'\s+', ' ', s), re.I))
        assert count(old) == count(new), (p, term)
        report['protected_terms'].setdefault(term, 0)
        report['protected_terms'][term] += count(new)
    citations = lambda s: Counter(normalize(x) for x in re.findall(
        r'\\cite(?:\[[^\]]*\])*\{[^}]+\}', s))
    assert citations(old) == citations(new), p
    a, b = displays(old), displays(new)
    assert len(a) == len(b), p
    for n, (before, after) in enumerate(zip(a, b), 1):
        if before != after:
            assert p.name == '06-realisation.tex' and n in (19, 33), (p, n)
            assert before.replace(',', '.') == after.replace(',', '.'), (p,n)
            report['display_punctuation_changes'].append(f'{p}:display-{n}')
    if p.name == '05-selection.tex':
        pattern = (r'\\begin\{definition\}\s*\\label\{def:selection-data\}'
                   r'.*?\\end\{definition\}')
        assert re.search(pattern, old, re.S)[0] == re.search(pattern, new, re.S)[0]
    if p.name == 'A4-ai-declaration.tex':
        assert new.splitlines()[0] == old.splitlines()[0]
        assert 'no part of it was written by a human' in new
    if p.name == 'A2-verification.tex':
        assert r'\subsection*{Proof notes and fresh-context verification}' in new
    report['source_sha256'][str(p)] = hashlib.sha256(p.read_bytes()).hexdigest()
    added = references(new) - references(old)
    removed = references(old) - references(new)
    if added:
        report['added_reference_targets'][str(p)] = dict(added)
    if removed:
        report['removed_reference_targets'][str(p)] = dict(removed)
for p in files:
    assert set(references(p.read_text())) <= all_labels, p

# All renamed families have disappeared from rendered prose; labels, references,
# and literal script paths are excluded from this terminology check.
for p in files:
    s = re.sub(r'\\(?:label|[Cc]ref|eqref|ref|input|texttt)\{[^}]*\}', '', p.read_text())
    s = re.sub(r'\s+', ' ', s)
    for pattern in [r'Auslander--Reiten (?:counterexamples?|route|preprint|construction)',
                    r'selection (?:diagram|group)', r'visible rank', r'odd double',
                    r'encoding algebra', r'conversion (?:principle|theorem|construction)',
                    r'two-cone bimodule', r'one-factor', r'two-factor',
                    r'test bed', r'\bprofiles?\b', r'\bcells?\b']:
        assert not re.search(pattern, s, re.I), (p, pattern)

counts = []
for logfile in ['scratch/P-apply-baseline.log', 'scratch/P-apply-build/main.log']:
    log = Path(logfile).read_text()
    assert not re.search(r'^!|undefined|LaTeX Error|Emergency stop', log, re.M), logfile
    count = Counter(re.findall(r'Overfull \\hbox \(([^)]+)\)', log))
    counts.append(count)
    report[logfile] = {'overfull_boxes': dict(count),
                      'sha256': hashlib.sha256(Path(logfile).read_bytes()).hexdigest()}
assert counts[0] == counts[1], counts
assert 'All targets' in Path('scratch/P-apply-final-build.txt').read_text()
report['result'] = 'PASS: source preservation, terminology, line width, references, build warnings'
print(json.dumps(report, indent=2))
