module Ex05_TypesIntroSpec (spec) where

import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec spec

{- Create the `removeNonUppercase` function with proper type -}
removeNonUppercase :: String -> String
removeNonUppercase xs = [x | x <- xs, x `elem` ['A'..'Z']]

{- Create the addThree function with proper type info -}
addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

spec :: Spec
spec = do
  describe "Functions have types" $
    it "can use a function with type" $ do
      removeNonUppercase "HelloWORLD" `shouldBe` "HWORLD"
      addThree 1 2 3 `shouldBe` 6
  describe "Type classes" $ do
    it "can order strings" $ do
      "Abrakadabra" == "Zebra" `shouldBe` False
      {- use the words "Abrakadabra"  "Zebra" -}
      compare "Abrakadabra" "Zebra" `shouldBe` LT
      5 >= 3 `shouldBe` True
      5 `compare` 3 `shouldBe` GT
    it "can show anything" $ do
      show 3 `shouldBe` "3"
      show True `shouldBe` "True"
    it "can read strings into values" $ do
      read "True" || False `shouldBe` True
      read "8.2" + 3.8 `shouldBe` 12
      (read "[1,2,3,4]" :: [Int]) `shouldBe` [1,2,3,4]
      (read "(3, 'a')" :: (Int, Char)) `shouldBe` (3, 'a')
    it "can provide ranges, next items for Enum types" $ do
      ['a'..'e'] `shouldBe` "abcde"
      [LT .. GT] `shouldBe` [LT,EQ,GT]
      [3..5] `shouldBe` [3,4,5]
      {- succ to get the next -}
      succ 'B' `shouldBe` 'C'
  describe "Num is a numeric typeclass" $
    it "can act like numbers" $
      {- use the type -}
      (20 :: Int) `shouldBe` 20
  describe "fromIntegral is there historical reasons" $
    it "can add Int and Floating point numbers" $
      {- from... function -}
      fromIntegral (length [1,2,3,4]) + 3.2 `shouldBe` 7.2
