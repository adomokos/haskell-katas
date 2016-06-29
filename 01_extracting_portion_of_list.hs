import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

main :: IO ()
main = hspec $ do
    describe "Extracting portion of list" $
        it "takes elements from a list" $
            ___ ['a'..'z'] `shouldBe` "abcdefg"
            ___ [1..10] `shouldBe` [1,2,3]
            ___ [] `shouldBe` []
            ___ (enumFrom 10) `shouldBe` [10,11,12,13,14]
        it "can drop elements from a list" $
            ___ [1..10] `shouldBe` [6,7,8,9,10]
            ___ ['a'..'g'] `shouldBe` "defg"
            ___ (enumFromTo 10 20) `shouldBe` [16,18,20]
            ___ [] `shouldBe` []
        it "can split a collection" $
            ___ [1..10] `shouldBe` ([1,2,3,4,5],[6,7,8,9,10])
            ___ [] `shouldBe` ([],[])
        it "can take while" $
            ___ [1..10] `shouldBe` [1,2]
            ___ (enumFromTo 5 15) `shouldBe` [5,6,7]
            ___ "abracadabra" `shouldBe` "a"
        it "can drop while" $
            ___ [1..10] `shouldBe` [5,6,7,8,9,10]
            ___ "abracadabra" `shouldBe` "bracadabra"
