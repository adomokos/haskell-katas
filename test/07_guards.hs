import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

bmiTell :: (Ord a, Fractional a) => a -> String
bmiTell bmi
    | bmi <= 18.5 = "You're underweight, you emo, you!"
    | bmi <= 25.0 = "You're supposedly normal."
    | bmi <= 30.0 = "You're fat! Lose some weight!"
    | otherwise   = "You're a whale, congratulations!"

max' :: (Ord a) => a -> a -> a
max' a b
    | a < b = b
    | otherwise = a

compare' :: (Ord a) => a -> a -> Ordering
compare' a b
    | a < b = LT
    | a == b = EQ
    | otherwise = GT

main :: IO()
main = hspec $ do
    describe "Guards, Guards!" $ do
        it "can be considered as a conditional, but easier to read" $ do
            bmiTell 15.2 `shouldBe` "You're underweight, you emo, you!"
            bmiTell 23 `shouldBe` "You're supposedly normal."
            bmiTell 27 `shouldBe` "You're fat! Lose some weight!"
            bmiTell 31.4 `shouldBe` "You're a whale, congratulations!"
        it "can calculate max from two values" $ do
            max' 1 3 `shouldBe` 3
        it "can compare two values" $ do
            compare' 2 2 `shouldBe` EQ
            2 `compare'` 3 `shouldBe` LT
