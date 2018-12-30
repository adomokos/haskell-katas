module Ex45_FaOrderingMonoidsSpec
  ( spec
  ) where

import Data.Monoid
import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec spec

{-
    A practical example of where monoids could be useful
-}
{-
  Create a function (without monoids) where first the length is compared,
  and if they are equal, then the words are compared
-}
lengthCompareVerbose :: String -> String -> Ordering
lengthCompareVerbose x y =
  let a = length x `compare` length y
      b = x `compare` y
   in if a == EQ
        then b
        else a

-- Use the same logic, but use monoids
lengthCompare :: String -> String -> Ordering
lengthCompare x y = (length x `compare` length y) `mappend` (x `compare` y)

-- Compare length, vowels (aeiou) and strings in this order
lengthVowelCompare :: String -> String -> Ordering
lengthVowelCompare x y =
  (length x `compare` length y) `mappend` (vowels x `compare` vowels y) `mappend`
  (x `compare` y)
  where
    vowels = length . filter (`elem` "aeiou")

spec :: Spec
spec =
  describe "Monoids" $ do
    it "verbose lengthcompare" $ do
      lengthCompareVerbose "zen" "ants" `shouldBe` LT
      lengthCompareVerbose "zen" "ant" `shouldBe` GT
    it "lengthcompare" $ do
      lengthCompare "zen" "ants" `shouldBe` LT
      lengthCompare "zen" "ant" `shouldBe` GT
    it "can compare length and vowels" $ do
      lengthVowelCompare "zen" "anna" `shouldBe` LT
      lengthVowelCompare "zen" "ana" `shouldBe` LT
      lengthVowelCompare "zen" "ann" `shouldBe` GT
