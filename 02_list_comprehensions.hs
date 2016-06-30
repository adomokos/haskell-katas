import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

main :: IO ()
main = hspec $ do
    describe "List Comprehensions" $ do
        it "squares numbers" $ do
            [1..5] `shouldBe` [1,4,9,16,25]
