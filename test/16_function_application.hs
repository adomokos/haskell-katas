import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

main :: IO()
main = hspec $ do
    describe "Function application with $" $ do
        it "let's get rid of parens" $ do
            (sum $ map (* 2) [1..6]) `shouldBe` 42
            (sqrt $ 3 + 4 + 9) `shouldBe` 4
            (sum $ filter (>5) $ map (*2) [1..5]) `shouldBe` 24
