module Ex27_TypesDerivedInstancesSpec
  ( spec
  ) where

import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec spec

{-
   Create a Person record with 3 fields
   * firstName
   * lastName
   * age
-}
data Person = Person
  { firstName :: String
  , lastName :: String
  , age :: Int
  } deriving (Show, Eq, Read)

{- mikeD Michael Diamond 43 -}
mikeD :: Person
mikeD = Person "Michael" "Diamond" 43

{- adRock Adam Horovitz 41 -}
adRock :: Person
adRock = Person "Adam" "Horovitz" 41

{- mca Adam Yauch 44 -}
mca :: Person
mca = Person "Adam" "Yauch" 44

spec :: Spec
spec = do
  describe "Person" $ do
    it "can compare two fields" $ do
      mca == adRock `shouldBe` False
      mikeD == adRock `shouldBe` False
      mikeD /= adRock `shouldBe` True
      mikeD == mikeD `shouldBe` True
      mikeD ==
        Person {firstName = "Michael", lastName = "Diamond", age = 43} `shouldBe`
        True
    it "will work with `elem` as Person is in Eq" $ do
      let beastieBoys = [mca, adRock, mikeD]
      (mikeD `elem` beastieBoys) `shouldBe` True
    it "is is now an instance of Show" $ do
      "mikeD is: " ++
        show mikeD `shouldBe`
        "mikeD is: Person {firstName = \"Michael\", lastName = \"Diamond\", age = 43}"
    it "is is now an instance of Read" $ do
      (firstName $
       (read "Person {firstName=\"Michael\",lastName=\"Diamond\",age=43}" :: Person)) `shouldBe`
        "Michael"
    it "can infer the type, no type annotation is needed" $ do
      read "Person {firstName=\"Michael\",lastName=\"Diamond\",age=43}" ==
        mikeD `shouldBe` True
