import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import Data.Monoid

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
        it "lengthcompare" $ do
            lengthCompare "zen" "ants" `shouldBe` LT
            lengthCompare "zen" "ant" `shouldBe` GT
        it "can compare length and vowels" $ do
            lengthVowelCompare "zen" "anna" `shouldBe` LT
            lengthVowelCompare "zen" "ana" `shouldBe` LT
            lengthVowelCompare "zen" "ann" `shouldBe` GT
