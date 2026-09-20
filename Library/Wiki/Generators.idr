module Wiki.Generators

import public QuickCheck
import Math.Interfaces
import Core.BoxInt
import Math.BoxInt
import Math.Singleton.Bit
import Math.Multiset

%default total

public export
Arbitrary BoxInt where
  arbitrary = map MkBoxInt arbitrary
  coarbitrary b gen = coarbitrary (unwrapBox b) gen

public export
Arbitrary MultisetBoxInt where
  arbitrary = map intToMultisetBoxInt arbitrary
  coarbitrary b gen =
    let (MkUr n) = boxToInt b
    in coarbitrary n gen

public export
qcBit : (Bit -> Bool) -> QCRes
qcBit f =
  let prop = \n => f (natToBit n)
  in quickCheck (MkFn prop)

public export
qcBit2 : (Bit -> Bit -> Bool) -> QCRes
qcBit2 f =
  let prop = \n1, n2 => f (natToBit n1) (natToBit n2)
  in quickCheck (MkFn (\n1 => MkFn (\n2 => prop n1 n2)))

public export
qcBit3 : (Bit -> Bit -> Bit -> Bool) -> QCRes
qcBit3 f =
  let prop = \n1, n2, n3 => f (natToBit n1) (natToBit n2) (natToBit n3)
  in quickCheck (MkFn (\n1 => MkFn (\n2 => MkFn (\n3 => prop n1 n2 n3))))
