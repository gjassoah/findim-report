# Comparator toolchain: pinned versions (round 2, 2026-10-09)

Pins collected by Claude Sonnet 5.5 for a Comparator run of OpenAI's challenges (openai/math `fd4aeeb2`, Lean
4.34.1, Mathlib `d13f23b7`). Comparator was not run (Gustavo's decision); local packaging drafts made from these
pins were deleted unbuilt.

| Tool | Pin | SHA-256 |
|---|---|---|
| Lean 4.34.1 | release asset `lean-4.34.1-linux.tar.zst` (tag v4.34.1 = `5045d0056413266e57c625dcd7c365b10e377c52`) | `47bf4bbd78f70c2e9670598ab7124d92b6efb7330ff33e5fbb4030f6fd72e4e4` (from the GitHub release API, not recomputed) |
| lean4export | `076e8e57707e813375e8f9da8bf989799ace9680` (tag v4.34.0) | `6841a09bbb920432388c6f260e3c43db3b9f73589b20658e0341c3b65104eb29` (source archive) |
| comparator | `d03acab154d269c06e60e4de7e4cc85deebff94b` (tag v4.34.0) | `9ccc1491fbf61fbbd45b40488a84e4700439c664de62b0e5a3cf146b28df458b` (source archive) |
| landrun | `811cfff51ceaf3d9843708aa6d22e9b84ccac8b4` (main, version 0.1.18) | `5c5f16a55e3ee87eb89bb909410d877501914a8d7ff9b96674e3c12af83ada71` (source archive) |

Licences: Lean, lean4export and comparator Apache-2.0; landrun MIT.

How the pins were chosen: neither lean4export nor comparator has a tag v4.34.1; both have v4.34.0 and then
v4.35.0 release candidates, and comparator's main branch needs Lean 4.35.0-rc4. Comparator v4.34.0 pins lean4export
to exactly `076e8e57…` in its manifest, so the two form a matched pair. Comparator's README asks for landrun from its
main branch; its tip was pinned.

Not verified: compatibility of the v4.34.0 tools with a Lean 4.34.1 project; whether comparator builds without
network access; the landrun sandbox (Comparator's README recommends running it inside `systemd-run` with
`RestrictAddressFamilies=~AF_UNIX` because of a landrun escape fixed only in recent Linux kernels).
