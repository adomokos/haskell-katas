module Ex16_HofsFunctionApplicationSpec
  ( spec
  ) where

import Test.Hspec

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "Function application with $" $ do
    it "let's get rid of parens" $ do
      pending
      -- double the list of 1-6 and sum its values
      41 `shouldBe` 42
      -- sqrt of 3 + 4 + 9
      3 `shouldBe` 4
      -- double 1-5, sum of elements greater than 5
      5 `shouldBe` 24
