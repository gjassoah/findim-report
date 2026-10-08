#!/usr/bin/env python3
"""Replay the read and inspected job-07 explicit Toda witness script.
Claim/scope: its finite linearity, syzygy, and nullhomotopy identities over
F_2(q), and q primitive in GF(2^8), GF(2^12), GF(2^16). Supplementary only:
the all-degree two-cone proof in cones.md does not use a Toda bracket.
Conventions: original script's left modules, columns, [1]=Omega^-1.
The original source is executed unchanged, except __file__ is relocated so
its Sage cache and all runtime writes stay in this new directory.
"""
from pathlib import Path
import sys
sys.dont_write_bytecode=True
HERE=Path(__file__).resolve().parent
SOURCE=HERE.parent/'04-toda-bracket'/'witness.py'
namespace={'__file__':str(HERE/'bracket_witness_virtual.py'),'__name__':'__main__'}
exec(compile(SOURCE.read_text(),str(SOURCE),'exec'),namespace)
