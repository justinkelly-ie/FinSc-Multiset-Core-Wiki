# 🗂️ Multiset Monoid Algebra & Observable Specification

Documents and verifies zero-annihilation normalization, `multiplicityAll` observables, and **Commutative Monoid Homomorphisms** using QuickCheck property testing.

```idris
module MultisetAlgebraSpec

import Math.Multiset
import Generators

%default total

||| Homomorphic Law 1: multiplicityAll is a Monoid Homomorphism
||| multiplicityAll(scaleMultiset s m) == abs(s) * multiplicityAll(m)
public export
prop_multiplicityHomomorphism : Integer -> Integer -> Bool
prop_multiplicityHomomorphism s v =
  let m = AddM "a" v ZeroM
      scaled = scaleMultiset s m
  in multiplicityAll scaled == abs s * multiplicityAll m

||| Algebraic Law 2: Additive Commutativity (m1 + m2 == m2 + m1)
public export
prop_multisetAddCommutative : Integer -> Integer -> Bool
prop_multisetAddCommutative v1 v2 =
  let m1 = AddM "a" v1 ZeroM
      m2 = AddM "b" v2 ZeroM
  in addMultiset m1 m2 == addMultiset m2 m1

||| Algebraic Law 3: Additive Associativity ((m1 + m2) + m3 == m1 + (m2 + m3))
public export
prop_multisetAddAssociative : Integer -> Integer -> Integer -> Bool
prop_multisetAddAssociative v1 v2 v3 =
  let m1 = AddM "a" v1 ZeroM
      m2 = AddM "b" v2 ZeroM
      m3 = AddM "c" v3 ZeroM
  in addMultiset (addMultiset m1 m2) m3 == addMultiset m1 (addMultiset m2 m3)

||| Algebraic Law 4: Additive Identity (m + 0 == m)
public export
prop_multisetAddIdentity : Integer -> Bool
prop_multisetAddIdentity v =
  let m = AddM "a" v ZeroM
  in (addMultiset m ZeroM == m) && (addMultiset ZeroM m == m)

||| Property 5: Annihilate Multiset Zero Normalization (Dirac Elimination)
public export
prop_annihilateZeroNormalization : Integer -> Bool
prop_annihilateZeroNormalization val =
  let m = AddM "a" val (AddM "a" (-val) ZeroM)
      filtered = annihilateMultiset m
  in filtered == ZeroM

||| Property 6: Multiplicity Observable Metric Sum
public export
prop_multiplicityObservable : Integer -> Integer -> Bool
prop_multiplicityObservable v1 v2 =
  let m = AddM "x" v1 (AddM "y" v2 ZeroM)
  in multiplicityAll m == abs v1 + abs v2

||| Property 7: Subtraction and Negation Equivalences
public export
prop_subMultisetEquivalence : Integer -> Integer -> Bool
prop_subMultisetEquivalence v1 v2 =
  let m1 = AddM "a" v1 ZeroM
      m2 = AddM "a" v2 ZeroM
      diff = subMultiset m1 m2
  in diff == AddM "a" (v1 - v2) ZeroM

||| QuickCheck suite execution for Multiset Algebra specification
public export
auditMultisetAlgebraProof : IO Bool
auditMultisetAlgebraProof = do
  let r0 = qc2 prop_multiplicityHomomorphism
  let r1 = qc2 prop_multisetAddCommutative
  let r2 = qc3 prop_multisetAddAssociative
  let r3 = qc prop_multisetAddIdentity
  let r4 = qc prop_annihilateZeroNormalization
  let r5 = qc2 prop_multiplicityObservable
  let r7 = qc2 prop_subMultisetEquivalence
  pure (r0.pass == Just True && r1.pass == Just True && r2.pass == Just True && r3.pass == Just True &&
        r4.pass == Just True && r5.pass == Just True && r7.pass == Just True)
```
