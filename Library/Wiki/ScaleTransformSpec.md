# 📐 ScaleTransform Functorial Specification

Documents and verifies the open `ScaleTransform` typeclass identity and functorial composition laws using QuickCheck property testing.

```idris
module ScaleTransformSpec

import Core.ScaleTransform
import Math.BoxInt
import Generators

%default total

||| Property 1: Identity ScaleTransform Law (Random BoxInt)
public export
prop_scaleTransformIdentity : BoxInt -> Bool
prop_scaleTransformIdentity x =
  scaleTransform x == x

||| Property 2: Functorial ScaleTransform Composition Law (Random BoxInt)
public export
prop_scaleTransformComposition : BoxInt -> Bool
prop_scaleTransformComposition x =
  composeScaleTransform {b = BoxInt} x == x

||| Property 3: Invertible ScaleTransform Reflexivity (Random BoxInt)
public export
prop_invertibleScaleTransformIdentity : BoxInt -> Bool
prop_invertibleScaleTransformIdentity x =
  invertScaleTransform (scaleTransform {domainB = BoxInt} x) == x

||| Property 4: Invertible ScaleTransform Composition Law (Random BoxInt)
public export
prop_invertibleScaleTransformComposition : BoxInt -> Bool
prop_invertibleScaleTransformComposition x =
  composeInvertibleScaleTransform {b = BoxInt} x == x

||| Property 5: ScaleTransform Additive Monoid Homomorphism: T(x + y) == T(x) + T(y)
public export
prop_scaleTransformAdditiveHomomorphism : BoxInt -> BoxInt -> Bool
prop_scaleTransformAdditiveHomomorphism x y =
  let lhs = scaleTransform (boxAdd x y)
      rhs = boxAdd (scaleTransform x) (scaleTransform y)
  in lhs == rhs

||| Property 6: ScaleTransform Scalar Linearity: T(s * x) == s * T(x)
public export
prop_scaleTransformScalarLinearity : BoxInt -> BoxInt -> Bool
prop_scaleTransformScalarLinearity s x =
  let lhs = scaleTransform (boxMult s x)
      rhs = boxMult s (scaleTransform x)
  in lhs == rhs

||| Property 7: InvertibleScaleTransform Galois Inversion Roundtrip: T^-1(T(x)) == x
public export
prop_invertibleScaleTransformGaloisInversion : BoxInt -> Bool
prop_invertibleScaleTransformGaloisInversion x =
  let f_star = scaleTransform {domainB = BoxInt} x
      f_upper = invertScaleTransform f_star
  in f_upper == x

||| QuickCheck suite execution for ScaleTransform specification
public export
auditScaleTransformProof : IO Bool
auditScaleTransformProof = do
  let r1 = qc prop_scaleTransformIdentity
  let r2 = qc prop_scaleTransformComposition
  let r3 = qc prop_invertibleScaleTransformIdentity
  let r4 = qc prop_invertibleScaleTransformComposition
  let r5 = qc2 prop_scaleTransformAdditiveHomomorphism
  let r6 = qc2 prop_scaleTransformScalarLinearity
  let r7 = qc prop_invertibleScaleTransformGaloisInversion
  pure (r1.pass == Just True && r2.pass == Just True && r3.pass == Just True &&
        r4.pass == Just True && r5.pass == Just True && r6.pass == Just True && r7.pass == Just True)

```
