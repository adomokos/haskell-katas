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

introduce :: Person -> String
{- introduce (Person firstName lastName age height phoneNumber flavor) = -}
    {- "Hello, " ++ firstName ++ " " ++ lastName ++ "!" -}
introduce person = 
    "Hello, " ++ firstName person ++ " " ++ lastName person ++ "!"

makePerson :: Person
makePerson = Person { firstName = "John"
                    , lastName = "Smith"
                    , height = 5.2
                    , age = 28
                    , phoneNumber = "332-748-9291"
                    , flavor = "salty" }

main :: IO()
main = hspec $ do
    describe "Records" $ do
        it "can access fields, as those are functions" $ do
            let person = Person "Jane" "Boo" 22 5.8 "N/A" "almond"
            lastName person `shouldBe` "Boo"
        it "fields do not have to be in order when used with field names" $ do
            firstName makePerson `shouldBe` "John"
            age makePerson `shouldBe` 28
        it "can introduce a Person with destructuring" $ do
            introduce makePerson `shouldBe` "Hello, John Smith!"
