import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

main :: IO ()
main = hspec $ do
    describe "Extracting portion of list" $ do
        it "takes elements from a list" $ do
            take 7 ['a'..'z'] `shouldBe` "abcdefg"
            {- [1..10] `shouldBe` [1,2,3] -}
            {- (enumFrom 10) `shouldBe` [10,11,12,13,14] -}
        {- it "can drop elements from a list" $ do -}
            {- [1..10] `shouldBe` [6,7,8,9,10] -}
            {- ['a'..'g'] `shouldBe` "defg" -}
            {- (enumFromTo 10 20) `shouldBe` [16,17,18,19,20] -}
        {- it "can split a collection" $ do -}
            {- [1..10] `shouldBe` ([1,2,3,4,5],[6,7,8,9,10]) -}
        {- it "can take while" $ do -}
            {- [1..10] `shouldBe` [1,2] -}
            {- (enumFromTo 5 15) `shouldBe` [5,6,7] -}
            {- "abracadabra" `shouldBe` "a" -}
        {- it "can drop while" $ do -}
            {- [1..10] `shouldBe` [5,6,7,8,9,10] -}
            {- "abracadabra" `shouldBe` "bracadabra" -}
