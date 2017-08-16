import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import Data.Monoid


lengthCompareVerbose :: String -> String -> Ordering
lengthCompareVerbose x y = let a = length x `compare` length y
                               b = x `compare` y
                           in if a == EQ then b else a

lengthCompare :: String -> String -> Ordering
lengthCompare x y = (length x `compare` length y) `mappend`
                    (x `compare` y)

lengthVowelCompare :: String -> String -> Ordering
lengthVowelCompare x y = (length x `compare` length y) `mappend`
                         (vowels x `compare` vowels y) `mappend`
                         (x `compare` y)
    where vowels = length . filter (`elem` "aeiou")

main :: IO ()
main = hspec $ do
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
