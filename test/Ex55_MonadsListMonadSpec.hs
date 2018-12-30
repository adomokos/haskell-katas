module Ex55_MonadsListMonadSpec
  ( spec
  ) where

import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec spec

{-
    This is what Monad instance for lists looks like:

    instance Monad [] where
        return x = [x]
        xs >>= f = concat (map f xs)
        fail _ = []
-}

-- Use the do notation for chars and ints
-- listOfTuples :: [(Int, Char)]

spec :: Spec
spec =
  describe "List monad" $ do
    it "can leverage do notation" $ do
      pending
      -- use a lambda here
      -- ([3,4,5] >>= ___)
          -- `shouldBe` [3,-3,4,-4,5,-5]
      -- (___ >>= \x -> ["bad","mad","rad"])
          -- `shouldBe` []
      -- length ([1,2,3] >>= \x -> ___)
          -- `shouldBe` 0
    it "can create a list of tuples by chaining" $ do
      pending
      -- let ts = [1,2] >>= \n -> ['a','b'] >>= ___
      -- let result = [(1,'a'),(1,'b'),(2,'a'),(2,'b')]
      -- ts `shouldBe` result
      -- listOfTuples `shouldBe` result
      -- [___ | n <- ___, ch <- ___]
          -- `shouldBe` result
