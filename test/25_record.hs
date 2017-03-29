import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int
                     , height :: Float
                     , phoneNumber :: String
                     , flavor :: String
                     } deriving (Show)

main :: IO()
main = hspec $ do
    describe "Records" $ do
        it "can access fields, as those are functions" $ do
            let person = Person "Jane" "Boo" 22 5.8 "N/A" "almond"
            lastName person `shouldBe` "Boo"
        it "fields do not have to be in order when used with field names" $ do
            let person = Person { firstName = "John"
                                , lastName = "Smith"
                                , height = 5.2
                                , age = 28
                                , phoneNumber = "332-748-9291"
                                , flavor = "salty" }
            firstName person `shouldBe` "John"
            age person `shouldBe` 28
