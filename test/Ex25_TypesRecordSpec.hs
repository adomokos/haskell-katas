module Ex25_TypesRecordSpec
  ( spec
  ) where

import Test.Hspec

main :: IO ()
main = hspec spec

{- Create a Person record, find the fields in the specs -}
{- Implement the introduce function -}
{- introduce :: Person -> String -}
{-
  Create the factory function - makePerson
  Use the following fields:
  "John" "Smith" 28 5.2 "332-748-9291"
-}

-- makePerson :: Person

spec :: Spec
spec =
  describe "Records" $ do
    it "can access fields, as those are functions" $ do
      pending
      -- let person = Person "Jane" "Boo" 22 5.8 "N/A" "almond"
      -- lastName person `shouldBe` "Boo"
    it "fields do not have to be in order when used with field names" $ do
      pending
      -- firstName makePerson `shouldBe` "John"
      -- age makePerson `shouldBe` 28
    it "can introduce a Person with destructuring" $ do
      pending
      -- introduce makePerson `shouldBe` "Hello, John Smith!"
