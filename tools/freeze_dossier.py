#!/usr/bin/env python3
"""Make a status-free frozen copy of a dossier note for a fresh-context verification job.

Removes status words and verdicts (AI-proved, AI-verified, supported, plausible, 'no error found', ...)
and pointers to audits, so that the verifier sees statements and proofs without other agents' confidence.
Usage: tools/freeze_dossier.py SOURCE.md DEST.md
"""
import re, sys
src, dst = sys.argv[1:3]
s = open(src).read()
s = re.sub(r'(?im)^.*\b(status|verdict)\b.*:\s*\**(AI-proved|AI-verified|supported|plausible|open|refuted)\**.*$\n?', '', s)
s = re.sub(r'\((?:[^()]*\b(?:AI-proved|AI-verified|formally proved|formally verified in Lean)\b[^()]*)\)', '', s)
s = re.sub(r'\b(AI-proved|AI-verified|formally proved|formally verified in Lean)\b', '[status omitted]', s)
s = re.sub(r'(?i)no (mathematical )?error (was )?found', '[verdict omitted]', s)
s = re.sub(r'`audit/[^`]*`', '[audit omitted]', s)
open(dst, 'w').write(s)
print(dst, 'remaining status mentions:', len(re.findall(r'status omitted|verdict omitted', s)))
