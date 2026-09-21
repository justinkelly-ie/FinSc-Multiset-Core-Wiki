# FinSc-Multiset-Core-Wiki

[![Idris 2 Verification](https://img.shields.io/badge/Idris_2-0.8.0-blue.svg)](https://www.idris-lang.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

**Literate Verification Suite & Specification Manual for Layer 1 (`FinSc-Multiset-Core`)**

`FinSc-Multiset-Core-Wiki` provides formal compile-time macro reflection proofs, QuickCheck property test suites, and literate Markdown specifications for **Layer 1** of the non-linear discrete multiset physical law ecosystem.

---

## 📚 Specification Chapters & Verification Modules

### 1. `Library/Wiki/BoxIntAlgebraSpec.md`
- **Algebra & Homomorphisms:** Formal proof specifications for signed `BoxInt` arithmetic (`Pos`/`Neg` Dirac cancellation), monomorphic integer operations (`addBox`, `subBox`, `multBox`, `absBox`), and zero-defect integer bounds.
- **Verification:** QuickCheck property tests validating associativity, identity, and monomorphic reduction invariants.

### 2. `Library/Wiki/MultisetAlgebraSpec.md`
- **Algebra & Homomorphisms:** Free commutative monoid law specifications over `Box token` multisets (`unionBox`, `scaleBox`, `diffBox`, `canonicalizeBox`).
- **Verification:** QuickCheck property tests for multiset union associativity, identity (`Nil`), commutativity, and scalar distribution.

### 3. `Library/Wiki/ScaleTransformSpec.md`
- **Algebra & Homomorphisms:** Scale transformation interface specifications (`ScaleTransform`, `InvertibleScaleTransform`) and scale pipeline composition (`composeScaleTransform`).
- **Verification:** Proof witnesses for scale-invariant token transformations and bidirectional inversion dualities.

### 4. `Library/Wiki/BitGateChannelSpec.md`
- **Algebra & Homomorphisms:** Binary `Bit` singleton gate channels (`Zero`, `One`) and `boolToBit` conversion specifications.
- **Verification:** Property tests verifying gate channel sound mapping and binary logic conservation.

### 5. `Library/Wiki/LinearResourceChannelSpec.md`
- **Algebra & Homomorphisms:** QTT linear multiset resource channels (`LMultiset`, `LConsumable`, `LComonoid`).
- **Verification:** Compile-time proof witnesses guaranteeing strict linear resource consumption without illegal cloning or deletion.

### 6. `Library/Wiki/DependentMultisetSpec.md`
- **Algebra & Homomorphisms:** Dependent multiset invariants and type-indexed multiset specifications (`DepMultiset`).
- **Verification:** Invariant preservation proofs across dependent multiset transformations.

### 7. `Library/Wiki/TwoLevelTypeTheoryStagingSpec.md` & 2LTT Multiset Type Matrix
- **Algebra & Homomorphisms:** Formal application of Two-Level Type Theory (2LTT) Staged Compilation ([Kovács 2022](https://arxiv.org/abs/2209.09729v1)) to discrete multiset types (`Boxel`, `Vexel`, `Maxel`, `SpreadStream`).
- **Verification:** Proof suites for Stage 1 compile-time deforestation (`StrictLevel`), Stage 0 runtime physical payload (`HomotopyLevel`), QTT quantity `0` erasure, and product/additive cancellation laws.

#### 🗂️ 2LTT Multiset Type Staging Matrix

| Multiset Type | Specification Module | 2LTT Staging Transfer ($\mathcal{U}_1 \to \mathcal{U}_0$) | Dominant Cancellation Law |
| :--- | :--- | :--- | :--- |
| **1D Boxel / BoxInt** | `Wiki.BoxelStagingSpec` | `StrictLevel (BoxInt)` $\to$ `HomotopyLevel (BoxInt)` mass capacity budget ($210$ closure). | **Additive Dirac Cancellation**: $+137 \oplus -137 = 0$. |
| **1D Vexel / Unixel** | `Wiki.VexelStagingSpec` | `StrictLevel Vexel` $\to$ `HomotopyLevel Vexel` color charge payload ($R=[1], G=[2], B=[3]$). | **Zero-Pruning Passbands**: Duplicate merging and zero-weight entry elimination. |
| **2D Maxel Matrix** | `Wiki.MaxelStagingSpec` | `StrictLevel Maxel` $\to$ `HomotopyLevel Maxel` covalent bond field & 5x5 metric tensor. | **Product Tensor Cancellation**: $[1, 2] \times [3, 4] \to 0$; Grassmann wedge nilpotency $v \wedge v \to 0$. |
| **SpreadStream** | `Wiki.SpreadStreamStagingSpec` | `StrictLevel GohMultiset` $\to$ `HomotopyLevel GohMultiset` 4Geometries sector classification. | **Zero-Heap Stream Deforestation**: Gauss totient sum identity $\sum_{d \vert 6} \phi(d) = 6$ via `Skip`/`Yield`. |

### 8. `Library/Wiki/Main.idr`
- **Verification Runner:** Literate Idris 2 test runner executing compile-time `%macro` reflection proofs and QuickCheck property test suites for Layer 1.

---

## 🚀 Verification & Build

To compile the literate verification suite and execute the test runner binary:

```bash
idris2 --build FinSc-Multiset-Core-Wiki.ipkg
./build/exec/multiset-core-wiki
```

---

## 🏗️ 10-Layer Ecosystem Architecture

1. **`FinSc-Multiset-Core` / `FinSc-Multiset-Core-Wiki`** (Layer 1: Flat Primitives & Box Monoids)
2. **`FinSc-Multiset-Transform` / `FinSc-Multiset-Transform-Wiki`** (Layer 2: Fields & Scale Functors)
3. **`FinSc-Multiset-Binary` / `FinSc-Multiset-Binary-Wiki`** (Layer 2b: Boolean Field Engines)
4. **`FinSc-Multiset-Ternary` / `FinSc-Multiset-Ternary-Wiki`** (Layer 2c: Balanced Ternary Sifting)
5. **`FinSc-Geometry` / `FinSc-Geometry-Wiki`** (Layer 3: Emergent Metric Geometry)
6. **`FinSc-Physics` / `FinSc-Physics-Wiki`** (Layer 3b/6: Physical Conservation Laws)
7. **`FinSc-Hadron` / `FinSc-Hadron-Wiki`** (Layer 4b: Standard Model Confinement)
8. **`FinSc-Chemistry` / `FinSc-Chemistry-Wiki`** (Layer 5b: Molecular Kinetics)
9. **`FinSc-Biology` / `FinSc-Biology-Wiki`** (Layer 6: Biological Hierarchies & Active Inference)
10. **`FinSc-Universe` / `FinSc-Universe-Wiki`** (Layer 10: Cosmic Motive & Master Audit)
