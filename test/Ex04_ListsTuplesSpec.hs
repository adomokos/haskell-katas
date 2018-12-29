module Ex04_ListsTuplesSpec (spec) where

import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
    describe "tuples" $ do
        it "can select tuple's first value" $ do
            pending
            0 `shouldBe` 1
        it "can select tuple's second value" $ do
            pending
            True `shouldBe` False
        it "zip can produce tuple pairs" $ do
            pending
            [(0,1)] `shouldBe` [(1,4),(2,5),(3,6)]
            [(1,"two")] `shouldBe` [(1,"one"),(2,"two"),(3,"three")]
            [(1,"orange")] `shouldBe` [(1,"apple"),(2,"orange"),(3,"cherry")]
        it "can calculate right triangle that has the perimeter of 24" $ do
            pending
            let triangles = []
            triangles `shouldBe` [(6,8,10)]
