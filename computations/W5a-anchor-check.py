"""Claim: the isolated anchor repair preserves labels/pages and resolves named PDF links.
Cases: identical complete manuscript snapshots, with/without explicit theHequation.
Conventions: TeX aux group parsing, PDF named destinations, 40-dpi grey page images.
"""
from pathlib import Path
from collections import Counter
from pypdf import PdfReader
import subprocess

repo=Path(__file__).resolve().parent.parent
root=repo/"scratch/W5a-anchors"

def groups(s):
    out=[]; depth=0; start=None
    for i,c in enumerate(s):
        if c=='{':
            if depth==0:start=i+1
            depth+=1
        elif c=='}':
            depth-=1
            if depth==0:out.append(s[start:i])
    return out

def labels(p):
    result={}
    for line in p.read_text().splitlines():
        if not line.startswith('\\newlabel{'):continue
        key, value=groups(line)
        if key.endswith('@cref'):continue
        result[key]=groups(value)
    return result

before=labels(root/'baseline/main-nofix.aux')
after=labels(root/'build/main.aux')
print('labels_before',len(before),'labels_after',len(after))
print('changed_printed_number_or_page', [k for k in before if before[k][:2]!=after[k][:2]])
print('changed_label_keys',sorted(set(before)^set(after)))
for key in ['thm:tate-duality','thm:MY','eq:conversion-sequence']:
    if key in before:print('anchor',key,before[key][3],'=>',after[key][3])

r=PdfReader(root/'build/main.pdf')
dests=r.named_destinations
missing=[]; linkcount=0
for page_num,page in enumerate(r.pages,1):
    for ann in page.get('/Annots',[]):
        obj=ann.get_object()
        if obj.get('/Subtype')!='/Link':continue
        a=obj.get('/A',{})
        dest=a.get('/D') if a.get('/S')=='/GoTo' else obj.get('/Dest')
        if isinstance(dest,str):
            linkcount+=1
            if dest not in dests:missing.append((page_num,dest))
print('pdf_pages',len(r.pages),'named_destinations',len(dests),'internal_named_links',linkcount)
print('missing_named_link_targets',missing)
print('invalid_destination_pages',[key for key,d in dests.items() if r.get_destination_page_number(d) is None])
print('labels_missing_pdf_destination',[k for k,v in after.items() if len(v)>3 and v[3] not in dests])
mismatches=[(k,v[1],r.get_destination_page_number(dests[v[3]])+1) for k,v in after.items() if len(v)>3 and v[3] in dests and v[1].isdigit() and int(v[1])!=r.get_destination_page_number(dests[v[3]])+1]
print('label_target_page_mismatches',mismatches)
old_reader=PdfReader(root/'baseline/main-nofix.pdf')
old_dests=old_reader.named_destinations
print('baseline_pages_for_mismatched_labels',[(k,old_reader.get_destination_page_number(old_dests[before[k][3]])+1) for k,_,_ in mismatches])
for which,log in [('baseline','baseline/main-nofix.log'),('corrected','build/main.log')]:
    content=(root/log).read_text()
    print(which+'_duplicate_warnings',content.count('destination with the same identifier'))
print('text_identical',(root/'compare-before/main.txt').read_bytes()==(root/'compare-after/main.txt').read_bytes())
images=sorted((root/'compare-before').glob('page-*.pgm'))
print('page_images_compared',len(images))
print('different_page_images',[p.name for p in images if p.read_bytes()!=(root/'compare-after'/p.name).read_bytes()])

repo=root.parent.parent
tracked=subprocess.check_output(['git','ls-files','-z','--','build'],cwd=repo).decode().split('\0')
tracked=[p for p in tracked if p]
matches=[]
for p in tracked:
    actual=subprocess.check_output(['git','hash-object','--',p],cwd=repo).decode().strip()
    expected=subprocess.check_output(['git','rev-parse','HEAD:'+p],cwd=repo).decode().strip()
    matches.append(actual==expected)
print('original_build_inputs_present_and_matching_HEAD',sum(matches),'of',len(tracked))
