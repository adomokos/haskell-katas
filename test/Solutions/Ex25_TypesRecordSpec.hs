module Solutions.Ex25_TypesRecordSpec
  ( spec
  ) where

import Test.Hspec

main :: IO ()
main = hspec spec

-- Create a Person record, find the fields in the specs
data Person = Person
  { firstName :: String
  , lastName :: String
  , age :: Int
  , height :: Float
  , phone :: String
  , flavor :: String
  }

-- Implement the introduce function
introduce :: Person -> String
introduce person =
  "Hello, " ++ firstName person ++ " " ++ lastName person ++ "!"

{-
  Create the factory function - makePerson
  Use the following fields:
  "John" "Smith" 28 5.2 "332-748-9291"
-}
makePerson :: Person
makePerson = Person "John" "Smith" 28 5.2 "332-748-9291" "vanilla"

spec :: Spec
spec = do
  describe "Records" $ do
    it "can access fields, as those are functions" $ do
      let person = Person "Jane" "Boo" 22 5.8 "N/A" "almond"
      lastName person `shouldBe` "Boo"
    it "fields do not have to be in order when used with field names" $ do
      firstName makePerson `shouldBe` "John"
      age makePerson `shouldBe` 28
    it "can introduce a Person with destructuring" $ do
      introduce makePerson `shouldBe` "Hello, John Smith!"
