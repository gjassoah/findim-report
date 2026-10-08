Model: unknown; effort: unknown.

# Appendix A1 supporting review

Read-only review of scripts, saved outputs and the rerun inventory. No experiments were rerun and no manuscript edits were made by this supporting reviewer. Mathematical experiments retain status **supported** in their recorded cases. The three proposals below are factual corrections, submitted for root adjudication.

## A1-P1: rerun coverage

The inventory records 45 command invocations, R00–R44, with no mathematical output discrepancy; it does not record a fresh run of every experiment. Three full finite-field Lambda0 runs were not repeated, two Lambda1 `finish` stages used cached cosyzygies, and two stages of the minimised two-factor attempt resumed from saved cones. The existing count of five incorrectly combines the three unrepeated Lambda0 runs with two cached Lambda1 runs, omitting the two resumed two-factor stages.

Evidence: `report/notes/appendix-A-inventory.md:760–778,800,809,815,821–824,835–842`; `computations/03-testbed-lambda0/result-{0,1,2}.json` records original elapsed times 693.85, 1081.47 and 1056.34 seconds. Cache and resume semantics are documented in `computations/05-candidate1/README.md` and `computations/06-two-factor/README.md` and implemented in their `finish.py`, `one_factor.py` and `evaluated.py`.

```diff
--- a/report/sections/A1-computations.tex
+++ b/report/sections/A1-computations.tex
@@ -13,4 +13,6 @@
-in \Cref{app:ai-declaration}. Every script was rerun before the release of the
-article with Python~3.14 and SageMath~10.10; all runs completed and reproduced
-the saved mathematical output, except that five experiments of more than ten
-minutes were rerun only from saved intermediate results. The finite fields
+in \Cref{app:ai-declaration}. The rerun inventory records 45 commands run
+before the release with Python~3.14 and SageMath~10.10; their mathematical
+output agreed with the saved results. Three finite-field runs for $\Lambda_0$
+were not repeated; two stages for $\Lambda_1$ and two stages of the minimised
+two-factor attempt were rerun from saved intermediate results. The finite
+fields
```

## A1-P2: where parameter exponents are recorded

Seeded scripts generate their exponents and save the numeric values in JSON outputs; those numeric values are not literally recorded in the scripts. See `computations/03-testbed-lambda0/testbed.py:224–233`, `computations/05-candidate1/candidate.py:204–210` and their result/case JSON files. Fixed exponents in other scripts and all inspected GF(2^16) modulus records agree with the appendix.

```diff
--- a/report/sections/A1-computations.tex
+++ b/report/sections/A1-computations.tex
@@ -19 +19 @@
-generator, with exponents recorded in the scripts.
+generator, with exponents recorded in the saved outputs.
```

## A1-P3: the minimised complex is not exact

`computations/06-two-factor/sizes.py:30–37` computes the term dimensions and sets homology dimensions 400, 800 and 400 in homological degrees -4, -2 and 0, then uses `ranks[n+1]=K[n]-ranks[n]-H[n]`. Thus the complex is not exact. Exactness in degree 1 only identifies the high cokernel with the image used in the size estimate (`sizes.py:48–49`). The values 784704, 1377984, 3591168 and the bound 2000000 agree with `sizes.json`; the bimodule matrices were not formed.

```diff
--- a/report/sections/A1-computations.tex
+++ b/report/sections/A1-computations.tex
@@ -101,2 +101,3 @@
-used minimal bimodule resolutions of the cones and determined, from the ranks
-of an exact complex, cokernels of dimensions $784\,704$ and $1\,377\,984$; it
+used minimal bimodule resolutions of the cones and determined, from the term
+and homology dimensions of the complex, cokernels of dimensions $784\,704$ and
+$1\,377\,984$; it
```

## Grammar finding already communicated

At original lines 117–118, “the cokernel of $\delta^0$, which has rank one with kernel ...” leaves “which” with competing antecedents. The intended map has rank one and kernel spanned by (1,1), as recorded by `comparison-0.json` and the crosscheck outputs. Minimal correction: “the cokernel of $\delta^0$; this map has rank one and kernel spanned by $(1,1)$.” Root handles application.

## Other inspected claims

- Lambda0: three finite-field cases through degree 6 and the exact case through degree 2 agree with `result-*.json`; the finite self-Ext lists are `[5,1,0,0,0,0,0]` and the exact list `[5,1,0]`.
- Lambda1: both `case-*.json` records give cone dimension 312, fibre dimension 352, cone profile for -4 through 4 supported only in degrees 0 and 1, and ordinary Ext calculations in degrees 1, 2 and 3.
- Two-factor profile: `evaluated.json` records degrees -4 through 7, with only degrees 0 and 3 nonzero, each of dimension one.
- Further constructions: `profiles.py:270–316` and `profiles.out` agree with dimensions 6, 12 and 40, direct calculations through degree 12 for the first two, and the direct degree-0/1 calculation plus tensor convolution through degree 12 for the third. The rejection at degree 4 or degree 1 is visible in the saved lists.
- Toda computations: `witness.py` and `witness.out` cover F2(q) and GF(2^n) for n=8,12,16; the defining systems and zero indeterminacy are checked there.
- Final finite checks: the D-A/B/C/D sources and outputs match the stated scope; the selection quotient tests cover m=1,...,10.

Root handles polynomial certificates, source-table equality and independent exact recomputation of the bar dimensions. No additional error was found in the experiment claims above.
