# 📦 BoxInt Algebra & Type-Refinement Specification

Documents and verifies discrete `BoxInt` **Ring Homomorphisms** under Sandy Maguire's Homomorphic Observation framework using QuickCheck property testing.

```idris
module BoxIntAlgebraSpec

import Math.BoxInt
import Math.Interfaces
import Data.Linear
import Generators

%default total

||| Homomorphic Law 1: boxToInt is a Ring Homomorphism from (BoxInt, +, *) to (Z, +, *)
||| boxToInt(x + y) == boxToInt(x) + boxToInt(y)
||| boxToInt(x * y) == boxToInt(x) * boxToInt(y)
public export
prop_boxRingHomomorphism : BoxInt -> BoxInt -> Bool
prop_boxRingHomomorphism bx by =
  let (MkUr x) = boxToInt bx
      (MkUr y) = boxToInt by
      (MkUr addObs) = boxToInt (boxAdd bx by)
      (MkUr multObs) = boxToInt (boxMult bx by)
  in (addObs == x + y) && (multObs == x * y)

||| Algebraic Law 2: Addition Commutativity and Associativity
public export
prop_boxAddRingLaws : BoxInt -> BoxInt -> BoxInt -> Bool
prop_boxAddRingLaws x y z =
  let comm = (x + y == y + x)
      assoc = ((x + y) + z == x + (y + z))
      zeroId = (x + ZeroM == x) && (ZeroM + x == x)
  in comm && assoc && zeroId

||| Algebraic Law 3: Multiplication Commutativity, Associativity, and Distributivity
public export
prop_boxMultRingLaws : BoxInt -> BoxInt -> BoxInt -> Bool
prop_boxMultRingLaws x y z =
  let comm = (x * y == y * x)
      assoc = ((x * y) * z == x * (y * z))
      distr = (x * (y + z) == (x * y) + (x * z))
  in comm && assoc && distr

||| Algebraic Law 4: Additive Inverse (Dirac Zero Annihilation)
public export
prop_boxAdditiveInverse : BoxInt -> Bool
prop_boxAdditiveInverse x =
  (x + (-x) == ZeroM) && ((-x) + x == ZeroM)

||| Property 5: Absolute Value Metric Law
public export
prop_boxAbsMetric : Integer -> Bool
prop_boxAbsMetric x =
  let bx = intToBoxInt x
  in boxAbs bx == intToBoxInt (abs x)

||| Property 6: NonZeroBoxInt Type Refinement Filter
public export
prop_nonZeroRefinementFilter : Integer -> Bool
prop_nonZeroRefinementFilter x =
  let bx = intToBoxInt x
  in case toNonZeroBoxInt bx of
       Just _ => x /= 0
       Nothing => x == 0

||| Property 7: LEq BoxInt Channel Equality Reflexivity
public export
prop_lEqBoxIntChannel : BoxInt -> Bool
prop_lEqBoxIntChannel bx =
  let Builtin.(#) match (Builtin.(#) _ _) = lEq bx bx
  in match

||| QuickCheck suite execution for BoxInt Algebra specification
public export
auditBoxIntAlgebraProof : IO Bool
auditBoxIntAlgebraProof = do
  let r0 = qc2 prop_boxRingHomomorphism
  let r1 = qc3 prop_boxAddRingLaws
  let r2 = qc3 prop_boxMultRingLaws
  let r3 = qc prop_boxAdditiveInverse
  let r4 = qc prop_boxAbsMetric
  let r5 = qc prop_nonZeroRefinementFilter
  let r6 = qc prop_lEqBoxIntChannel
  pure (r0.pass == Just True && r1.pass == Just True && r2.pass == Just True &&
        r3.pass == Just True && r4.pass == Just True && r5.pass == Just True && r6.pass == Just True)
```
