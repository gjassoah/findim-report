/-
Copyright (c) 2026 The findim counterexample formalisation contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The findim counterexample formalisation contributors
-/
import FindimCounterexample.Stage4bRankObstruction

/-!
# The numerical extinction bound

The second identity of `eq:rank-shift` is an equality between the natural
dimension cast to ℚ and evaluation on an endomorphism orbit. Together with
persistence of zero under a successor, it bounds every finite extinction time
by the dimension of the ambient rational vector space.

Status: AI-proved. Acceptance evidence is kept in the accompanying verification
repository. The actual dimensions, rank functions and selection functor are
not constructed here.
-/

namespace FindimCounterexample.RankObstruction

universe v w

variable {V : Type v} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]
variable {ι : Type w}

/-- The abstract numerical form of Proposition 5.4: if a dimension sequence
ever vanishes, it vanishes at every time at least `finrank ℚ V`.

The evaluation equality represents the second identity of `eq:rank-shift`.
Persistence represents dimension-zero detection and the selection functor's
preservation of zero. No cyclicity or separating-family hypothesis is needed. -/
theorem extinction_bound (T : Module.End ℚ V) (v : V)
    (φ : ι → Module.Dual ℚ V) (d : ι → ℕ → ℕ)
    (heval : ∀ Y t, (d Y t : ℚ) = φ Y ((T ^ t) v))
    (hstep : ∀ Y t, d Y t = 0 → d Y (t + 1) = 0)
    (Y : ι) (hY : ∃ t₀ : ℕ, d Y t₀ = 0)
    (t : ℕ) (ht : Module.finrank ℚ V ≤ t) : d Y t = 0 := by
  obtain ⟨t₀, ht₀⟩ := hY
  have htail : ∀ n, t₀ ≤ n → d Y n = 0 := by
    intro n hn
    induction n, hn using Nat.le_induction with
    | base => exact ht₀
    | succ n _ ih => exact hstep Y n ih
  have hφ : ∃ n₀ : ℕ, ∀ n, n₀ ≤ n → φ Y ((T ^ n) v) = 0 := by
    refine ⟨t₀, fun n hn => ?_⟩
    rw [← heval Y n, htail n hn, Nat.cast_zero]
  have hz := apply_pow_eq_zero_of_eventually T v (φ Y) hφ t ht
  rw [← heval Y t] at hz
  exact_mod_cast hz

end FindimCounterexample.RankObstruction
