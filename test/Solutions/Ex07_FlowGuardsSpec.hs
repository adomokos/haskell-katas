module Solutions.Ex07_FlowGuardsSpec
  ( spec
  ) where

import Test.Hspec

main :: IO ()
main = hspec spec

{- BMI boundaries are 18.5, 25, 30 -}
bmiTell :: (Ord a, Fractional a) => a -> String
bmiTell x
  | x < 18.5 = "You're underweight, you emo, you!"
  | x < 25 = "You're supposedly normal."
  | x < 30 = "You're fat! Lose some weight!"
  | otherwise = "You're a whale, congratulations!"

max' :: (Ord a) => a -> a -> a
max' x y
  | x < y = y
  | otherwise = x

compare' :: (Ord a) => a -> a -> Ordering
compare' x y
  | x < y = LT
  | x == y = EQ
  | otherwise = GT

spec :: Spec
spec =
  describe "guards, guards!" $ do
    it "can be considered as a conditional, but easier to read" $ do
      bmiTell 15.2 `shouldBe` "You're underweight, you emo, you!"
      bmiTell 23 `shouldBe` "You're supposedly normal."
      bmiTell 27 `shouldBe` "You're fat! Lose some weight!"
      bmiTell 31.4 `shouldBe` "You're a whale, congratulations!"
    it "can calculate max from two values" $ max' 1 3 `shouldBe` 3
    it "can compare two values" $ do
      compare' 2 2 `shouldBe` EQ
      2 `compare'` 3 `shouldBe` LT
