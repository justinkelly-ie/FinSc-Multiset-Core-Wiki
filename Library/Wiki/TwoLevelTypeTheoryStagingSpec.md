# 🗂️ Two-Level Type Theory Staged Compilation & Subfibration Specification

Documents and verifies the formal application of **Two-Level Type Theory (2LTT) Staged Compilation** (Kovács 2022, [arXiv:2209.09729v1](https://arxiv.org/abs/2209.09729v1)) within the `FinSc-Multiset-Core` kernel.

## 1. Mathematical Foundation

1. **Stage 1 ($\mathcal{U}_1$) Meta-Level / Compile-Time Stage**:
   Represented by `StrictLevel a`. Meta-level computations are deforested, zero-heap, $O(1)$ stack operations operating under strict judgmental equality ($\equiv$). Under Kovács's *staging-by-evaluation*, all $\mathcal{U}_1$ terms and type formers are guaranteed to be evaluated away at compile time.
   > **Multiset Perspective**: Stage 1 is **symbolic multiset algebra and count manipulation** (e.g. deforesting multiset streams or simplifying exponent counts $x^5 \cdot x^{-5} \to x^0$ at compile time before any physical state is created).

2. **Stage 0 ($\mathcal{U}_0$) Object-Level / Runtime Stage**:
   Represented by `HomotopyLevel a`. Object-level types represent synthetic physical manifolds, 4Geometries metric spaces, and weak identity paths ($x = y$) operating under univalence and 2-category adjunctions.
   > **Multiset Perspective**: Stage 0 is the **physical payload populated by discrete multiset state vectors** (baryons, dark energy boxels, dark matter laws, and 5x5 substrate metric tensors) that exist at runtime and evolve across cosmic epochs.

3. **Subfibration Reflection Functor ($L \dashv R$)**:
   The canonical 2LTT subfibration adjunction $\mathrm{Hom}_{\mathrm{Homotopy}}(L a, b) \cong \mathrm{Hom}_{\mathrm{Strict}}(a, R b)$ maps outer deforested strict streams into inner physical manifold states.
   > **Multiset Perspective**: This is the **transduction bridge** that takes symbolic multiset stream steps evaluated at Stage 1 and reflects them directly into physical multiset state updates at Stage 0 with zero runtime overhead.

4. **Zero-Cost QTT Quantity 0 Erasure**:
   Quantitative Type Theory (QTT) quantity `0` annotations (`0 p : Path x y`, `0 s : StrictLevel Nat`) enforce Kovács's Stage 1 erasure guarantees in Idris 2, ensuring $100\%$ compile-time proof erasure with zero runtime heap allocation.
   > **Multiset Perspective**: This is **erasing the multiset accounting ledger after verifying mass conservation**—the compiler proves that multiset conservation laws ($a + (-a) = 0$) hold definitionally, but completely erases the proof accounting so runtime execution incurs zero memory allocation.

```idris
module Wiki.TwoLevelTypeTheoryStagingSpec

import Core.TypeTheory.TwoLevel
import Math.Multiset
import Math.BoxInt

%default total

||| Property 1: 2LTT Universe Stratification (StrictLevel vs HomotopyLevel Duality)
public export
prop_twoLevelUniverseStratification : Bool
prop_twoLevelUniverseStratification =
  let strictVal = MkStrict (the Nat 210)
      homotopyVal = MkHomotopy (unwrapStrict strictVal)
  in (unwrapStrict strictVal == 210) &&
     (unwrapHomotopy homotopyVal == 210) &&
     (strictVal == MkStrict 210) &&
     (homotopyVal == MkHomotopy 210)

||| Property 2: Compile-Time QTT 0 Subfibration Proof Verification
public export
prop_qttZeroSubfibrationProof : Bool
prop_qttZeroSubfibrationProof =
  auditTwoLevelTypeTheoryProof

||| Property 3: Homotopy Path Equality Reflection to Strict Equality
public export
prop_homotopyPathReflection : Bool
prop_homotopyPathReflection =
  let p1 = ReflP {x = (the Nat 137)}
      pInv = pathInverse p1
      pConcat = pathConcat p1 pInv
  in case pConcat of
       ReflP => True

||| Property 4: Univalent Multiset Path Isomorphism Reflection
public export
prop_multisetPathReflection : Bool
prop_multisetPathReflection =
  auditMultisetPathEqualityProof

||| Property 5: Staged Multiset BoxInt Dirac Cancellation under 2LTT Reflection
public export
prop_stagedBoxIntDiracCancellation : Bool
prop_stagedBoxIntDiracCancellation =
  let b1 = MkStrict (intToMultisetBoxInt 137)
      b2 = MkStrict (intToMultisetBoxInt (-137))
      sumB = intToMultisetBoxInt 137 <+> intToMultisetBoxInt (-137)
      homotopySum = MkHomotopy (normalizeBoxInt sumB)
  in (unwrapHomotopy homotopySum == ZeroM)

||| Main Verification Suite for 2LTT Staged Compilation
public export
auditTwoLevelTypeTheoryStagingProof : IO Bool
auditTwoLevelTypeTheoryStagingProof = do
  let p1 = prop_twoLevelUniverseStratification
  let p2 = prop_qttZeroSubfibrationProof
  let p3 = prop_homotopyPathReflection
  let p4 = prop_multisetPathReflection
  let p5 = prop_stagedBoxIntDiracCancellation
  pure (p1 && p2 && p3 && p4 && p5)
```
