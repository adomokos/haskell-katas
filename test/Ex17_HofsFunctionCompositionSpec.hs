module Ex17_HofsFunctionCompositionSpec (spec) where

import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec spec

addSquareSum :: Int
addSquareSum =
  let oddSquares = filter odd $ map (^2) [1..]
      belowLimit = takeWhile (<10000) oddSquares
  in sum belowLimit

spec :: Spec
spec = do
  describe "Function composition" $ do
    it "can take the absolute value and negate that" $ do
      {- use function composition-}
      {- take the abs value of items and negate them -}
      map (negate . abs) [1,2,-3,4,5]
          `shouldBe` [-1,-2,-3,-4,-5]
    it "can compose a new function from 3 other functions" $ do
      {- get the tail of the arrays, sum them and negate it -}
      map (negate . sum . tail) [[1..5],[3..6],[1..7]]
          `shouldBe` [-14,-15,-27]
    it "can calculate the sum of all odd squares <10000" $ do
      (sum . takeWhile (<10000) . filter odd . map (^2) $ [1..]) `shouldBe` 166650
      {- A more readable version -}
      addSquareSum `shouldBe` 166650
