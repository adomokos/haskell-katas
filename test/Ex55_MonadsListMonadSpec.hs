module Ex55_MonadsListMonadSpec
  ( spec
  ) where

import Test.Hspec

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
listOfTuples :: [(Int, Char)]
listOfTuples = do
  nums <- [1, 2]
  chars <- ['a', 'b']
  [(nums, chars)]

spec :: Spec
spec =
  describe "List monad" $ do
    it "can leverage do notation" $
            -- use a lambda here
     do
      ([3, 4, 5] >>= (\x -> [x, -x])) `shouldBe` [3, -3, 4, -4, 5, -5]
      ([] >>= const ["bad", "mad", "rad"]) `shouldBe` []
      length ([1, 2, 3] >>= const []) `shouldBe` 0
    it "can create a list of tuples by chaining" $ do
      let ts = [1, 2] >>= \n -> ['a', 'b'] >>= (\x -> [(n, x)])
      let result = [(1, 'a'), (1, 'b'), (2, 'a'), (2, 'b')]
      ts `shouldBe` result
      listOfTuples `shouldBe` result
      [(n, ch) | n <- [1, 2], ch <- ['a', 'b']] `shouldBe` result
