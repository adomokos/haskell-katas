module Solutions.Ex02_ListsComprehensionsSpec
  ( spec
  ) where

import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec spec

spec :: Spec
spec =
  describe "List Comprehensions" $ do
    it "squares numbers from 1-5" $
      [x ^ 2 | x <- [1 .. 5]] `shouldBe` [1, 4, 9, 16, 25]
    it "squares numbers from 1-5 and filters for even" $
      [x ^ 2 | x <- [1 .. 5], even (x ^ 2)] `shouldBe` [4, 16]
    it "can raise the numbers from 1-5 to the power of 2 and 3" $
      [x ^ y | x <- [1 .. 5], y <- [2, 3]] `shouldBe`
      [1, 1, 4, 8, 9, 27, 16, 64, 25, 125]
    it "can filter the previous list to numbers below 50" $
      [x ^ y | x <- [1 .. 5], y <- [2, 3], (< 50) (x ^ y)] `shouldBe`
      [1, 1, 4, 8, 9, 27, 16, 25]
    it "can create tuples from lists" $
      [(x, y) | x <- [1 .. 3], y <- "ab"] `shouldBe`
      [(1, 'a'), (1, 'b'), (2, 'a'), (2, 'b'), (3, 'a'), (3, 'b')]
    it "can filter for upper-case letters from \"Apple Brick Cat\"" $
      [x | x <- "Apple Brick Cat", x `elem` ['A' .. 'Z']] `shouldBe` "ABC"
    it "can be generalized into a function" $ do
      let f xs = [x | x <- xs, x `elem` ['A' .. 'Z']]
      f "Apple Brick Cat" `shouldBe` "ABC"
