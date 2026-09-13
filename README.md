# Idris2-Multiset-Core-Wiki

[![Idris 2 Verification](https://img.shields.io/badge/Idris_2-0.8.0-blue.svg)](https://www.idris-lang.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

**Literate Verification Suite & Specification Manual for Layer 1 (`Idris2-Multiset-Core`)**

`Idris2-Multiset-Core-Wiki` provides formal compile-time macro reflection proofs, QuickCheck property test suites, and literate Markdown specifications for **Layer 1** of the non-linear discrete multiset physical law ecosystem.

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

### 7. `Library/Wiki/Main.idr`
- **Verification Runner:** Literate Idris 2 test runner executing compile-time `%macro` reflection proofs and QuickCheck property test suites for Layer 1.

---

## 🚀 Verification & Build

To compile the literate verification suite and execute the test runner binary:

```bash
idris2 --build Idris2-Multiset-Core-Wiki.ipkg
./build/exec/multiset-core-wiki
```

---

## 🏗️ 10-Layer Ecosystem Architecture

1. **`Idris2-Multiset-Core` / `Idris2-Multiset-Core-Wiki`** (Layer 1: Flat Primitives & Box Monoids)
2. **`Idris2-Multiset-Transform` / `Idris2-Multiset-Transform-Wiki`** (Layer 2: Fields & Scale Functors)
3. **`Idris2-Multiset-Binary` / `Idris2-Multiset-Binary-Wiki`** (Layer 2b: Boolean Field Engines)
4. **`Idris2-Multiset-Ternary` / `Idris2-Multiset-Ternary-Wiki`** (Layer 2c: Balanced Ternary Sifting)
5. **`Idris2-Geometry` / `Idris2-Geometry-Wiki`** (Layer 3: Emergent Metric Geometry)
6. **`Idris2-Physics` / `Idris2-Physics-Wiki`** (Layer 3b/6: Physical Conservation Laws)
7. **`Idris2-Hadron` / `Idris2-Hadron-Wiki`** (Layer 4b: Standard Model Confinement)
8. **`Idris2-Chemistry` / `Idris2-Chemistry-Wiki`** (Layer 5b: Molecular Kinetics)
9. **`Idris2-Biology` / `Idris2-Biology-Wiki`** (Layer 6: Biological Hierarchies & Active Inference)
10. **`Idris2-Universe` / `Idris2-Universe-Wiki`** (Layer 10: Cosmic Motive & Master Audit)
