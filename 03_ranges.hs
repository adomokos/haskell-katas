import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

main :: IO ()
main = hspec $ do
    describe "ranges" $ do
        it "can express ranges" $ do
            length [1..10] `shouldBe` 10
        it "can set steps" $ do
            length [2,4..20] `shouldBe` 10
    describe "cycle" $ do
        it "can cycle through numbers" $ do
            take 5 (cycle [1,2,3]) `shouldBe` [1,2,3,1,2]
    describe "repeat" $ do
        it "can repeat numbers" $ do
            take 5 (repeat 3) `shouldBe` [3,3,3,3,3]
