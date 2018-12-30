module Ex32_TypesYesNoTypeClassSpec
  ( spec
  ) where

import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec spec

{-
    Simulate the JavaScript behavior,
    where if (0) or if ("") if ("WHAT") works.
-}
{- Define a YesNo type class
   that returns boolean value based on type -}
class YesNo a where
  yesno :: a -> Bool

-- For Bool
instance YesNo Bool where
  yesno False = False
  yesno True = True

-- Define some instances
-- For Int
instance YesNo Int where
  yesno 0 = False
  yesno _ = True

-- For Lists
instance YesNo [a] where
  yesno [] = False
  yesno _ = True

-- For Maybe
instance YesNo (Maybe a) where
  yesno Nothing = False
  yesno _ = True

data TrafficLight
  = Red
  | Yellow
  | Green
  deriving (Eq)

instance YesNo TrafficLight where
  yesno Green = True
  yesno _ = False

-- Create derivied instance of YesNo for TrafficLight
yesnoIf :: (YesNo y) => y -> a -> a -> a
yesnoIf condition trueValue falseValue =
  if yesno condition
    then trueValue
    else falseValue

spec :: Spec
spec =
  describe "Yes/No typeclass" $ do
    it "works with Bool fields" $ yesno False `shouldBe` False
    it "works with Ints" $ do
      yesno (0 :: Int) `shouldBe` False
      yesno (1 :: Int) `shouldBe` True
    it "works with Lists" $ do
      yesno [] `shouldBe` False
      yesno [3, 4] `shouldBe` True
    it "works the type TrafficLight" $ do
      yesno Red `shouldBe` False
      yesno Green `shouldBe` True
    it "can do a conditional with yesno" $ do
      yesnoIf Red "true" "false" `shouldBe` "false"
      yesnoIf [] 1 2 `shouldBe` 2
      yesnoIf (Just 500) "YEAH!" "NO" `shouldBe` "YEAH!"
