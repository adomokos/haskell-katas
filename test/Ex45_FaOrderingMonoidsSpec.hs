module Ex45_FaOrderingMonoidsSpec
  ( spec
  ) where

import Data.Monoid
import Test.Hspec

main :: IO ()
main = hspec spec

{-
    A practical example of where monoids could be useful
-}
{-
  Create a function (without monoids) where first the length is compared,
  and if they are equal, then the words are compared
-}

-- lengthCompareVerbose :: String -> String -> Ordering
-- Use the same logic, but use monoids
-- lengthCompare :: String -> String -> Ordering

-- Compare length, vowels (aeiou) and strings in this order
-- lengthVowelCompare :: String -> String -> Ordering

spec :: Spec
spec =
  describe "Monoids" $ do
    it "verbose lengthcompare" $ do
      pending
      -- lengthCompareVerbose "zen" "ants" `shouldBe` LT
      -- lengthCompareVerbose "zen" "ant" `shouldBe` GT
    it "lengthcompare" $ do
      pending
      -- lengthCompare "zen" "ants" `shouldBe` LT
      -- lengthCompare "zen" "ant" `shouldBe` GT
    it "can compare length and vowels" $ do
      pending
      -- lengthVowelCompare "zen" "anna" `shouldBe` LT
      -- lengthVowelCompare "zen" "ana" `shouldBe` LT
      -- lengthVowelCompare "zen" "ann" `shouldBe` GT
