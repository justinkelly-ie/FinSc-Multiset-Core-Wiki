
module Main

import Math.Multiset
import Generators
import MultisetPassbandSpec
import QuickCheck

%default total

main : IO ()
main = do
  putStrLn $ "r1: " ++ show (quickCheck prop_annihilatePassband)
  putStrLn $ "r2: " ++ show (quickCheck (MkFn (\v1 => MkFn (\v2 => prop_multiplicityObservable v1 v2))))
  putStrLn $ "r3: " ++ show (quickCheck (MkFn (\s => MkFn (\v => prop_scaleMultisetHomomorphism s v))))
  putStrLn $ "r4: " ++ show (quickCheck (MkFn (\v1 => MkFn (\v2 => prop_subMultisetEquivalence v1 v2))))
