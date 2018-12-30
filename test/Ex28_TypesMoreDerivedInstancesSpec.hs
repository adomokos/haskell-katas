module Ex28_TypesMoreDerivedInstancesSpec
  ( spec
  ) where

import Control.Exception (evaluate)
import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec spec

-- Day is an enumeration of each day in the week
data Day
  = Monday
  | Tuesday
  | Wednesday
  | Thursday
  | Friday
  | Saturday
  | Sunday
  deriving (Eq, Show, Read, Ord, Bounded, Enum)

spec :: Spec
spec = do
  describe "Derived Instances" $ do
    it "can compare two Bool fields" $
      -- Comparing True to False should be greater
     do
      compare True False `shouldBe` GT
      True > False `shouldBe` True
      True < False `shouldBe` False
    it "can compare Maybe values" $ do
      Just 90 < Just 100 `shouldBe` True
      Nothing > Just (-49999) `shouldBe` False
      Just 3 `compare` Just 2 `shouldBe` GT
    it "can be part of Enum typeclass as all value constructors are nullary" $ do
      show Wednesday `shouldBe` "Wednesday"
      read "Saturday" `shouldBe` Saturday
    it "can be compared as it's part of Eq and Ord type classes" $ do
      Monday == Sunday `shouldBe` False
      Monday == Monday `shouldBe` True
      Tuesday < Wednesday `shouldBe` True
      compare Monday Tuesday `shouldBe` LT
    it "is also part of Bounded, can get lowest and highest value" $ do
      (minBound :: Day) `shouldBe` Monday
      (maxBound :: Day) `shouldBe` Sunday
    it "is an instance of Enum, can get predecessor and successors" $
      -- Enums have predecessors and successors
     do
      succ Monday `shouldBe` Tuesday
      pred Saturday `shouldBe` Friday
      -- Calling predecessor for Monday will throw an error
      evaluate (pred Monday) `shouldThrow` anyErrorCall
