import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

main :: IO ()
main = hspec $ do
    describe "tuples" $ do
        it "can select it's first value" $ do
            fst (1, 'a') `shouldBe` 1
        it "can select it's second value" $ do
            snd ('a', False) `shouldBe` False
        it "zip can produce tuple pairs" $ do
            zip [1,2,3] [4,5,6] `shouldBe` [(1,4),(2,5),(3,6)]
