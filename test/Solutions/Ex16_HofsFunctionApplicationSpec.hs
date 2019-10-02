module Solutions.Ex16_HofsFunctionApplicationSpec
  ( spec
  ) where

import Test.Hspec

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "Function application with $" $ do
    it "let's get rid of parens" $
      {- double the list of 1-6 and sum its values -}
     do
      (sum $ map (* 2) [1 .. 6]) `shouldBe` 42
      {- sqrt of 3 + 4 + 9 -}
      (sqrt $ foldl1 (+) [3, 4, 9]) `shouldBe` 4
      {- double 1-5, sum of elements greater than 5 -}
      (sum $ filter (> 5) $ map (* 2) [1 .. 5]) `shouldBe` 24
