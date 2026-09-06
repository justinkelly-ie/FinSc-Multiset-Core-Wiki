# Idris 2 Multiset-Core-Wiki

[![Idris 2 Verification](https://img.shields.io/badge/Idris_2-0.8.0-blue.svg)](https://www.idris-lang.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

Verification suite and literate documentation chapter for **Idris2-Multiset-Core**, the foundational algebraic layer of the non-linear discrete multiset science engine.

## Overview

`Idris2-Multiset-Core-Wiki` provides formal compile-time macro reflection proofs and QuickCheck property specifications for core multiset structures:

- **`Math.BoxInt`**: Wildberger's signed Box Integer arithmetic and discrete bounds.
- **`Math.Singleton.Bit`**: Type-safe binary `Bit` singletons (`Zero` and `One`) and `boolToBit` conversion functions.
- **`Math.Multiset`**: Flat non-linear integer multiset multisets and algebraic linear resource channels.
- **`Math.Singleton.Sing`**: Higher-order type-level singleton constructors.

## Verification & Build

To compile the literate verification suite and execute the test runner binary:

```bash
idris2 --build Idris2-Multiset-Core-Wiki.ipkg
./build/exec/multiset0-verify
```

## Ecosystem Architecture

This package is part of the 10-layer Idris 2 Constructivist Physical Law Ecosystem:

1. `Idris2-Multiset-Core` / `Idris2-Multiset-Core-Wiki`
2. `Idris2-Multiset-Transform` / `Idris2-Multiset-Transform-Wiki`
3. `Idris2-Multiset-Binary` / `Idris2-Multiset-Binary-Wiki`
4. `Idris2-Multiset-Ternary` / `Idris2-Multiset-Ternary-Wiki`
5. `Idris2-Geometry` / `Idris2-Geometry-Wiki`
6. `Idris2-Physics` / `Idris2-Physics-Wiki`
7. `Idris2-Hadron` / `Idris2-Hadron-Wiki`
8. `Idris2-Chemistry` / `Idris2-Chemistry-Wiki`
9. `Idris2-Biology` / `Idris2-Biology-Wiki`
10. `Idris2-Universe` / `Idris2-Universe-Wiki`
