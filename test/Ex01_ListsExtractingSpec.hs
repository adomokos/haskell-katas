module Ex01_ListsExtractingSpec
  ( spec
  ) where

import Test.Hspec

main :: IO ()
main = hspec spec

spec :: Spec
spec =
  describe "Extracting Portion of List" $ do
    it "finds the first element in a list" $ head [1, 2, 3, 4, 5] `shouldBe` 1
    it "finds the tail part of a list" $
      tail [1, 2, 3, 4, 5] `shouldBe` [2, 3, 4, 5]
    it "finds the last element in a list" $ last [1, 2, 3, 4, 5] `shouldBe` 5
    it "extracts the elements except the last one from a list" $
      init [1, 2, 3, 4, 5] `shouldBe` [1, 2, 3, 4]
    it "takes elements from a list" $ do
      take 7 ['a' .. 'z'] `shouldBe` "abcdefg"
      take 3 [1 .. 5] `shouldBe` [1, 2, 3]
      take 5 (enumFromTo 10 100) `shouldBe` [10, 11, 12, 13, 14]
      take 5 (enumFrom 10) `shouldBe` [10, 11, 12, 13, 14]
    it "can drop elements from a list" $ do
      drop 5 [1 .. 10] `shouldBe` [6, 7, 8, 9, 10]
      drop 3 ['a' .. 'g'] `shouldBe` "defg"
      drop 6 (enumFromTo 10 20) `shouldBe` [16, 17, 18, 19, 20]
    it "can split a collection" $
      splitAt 5 [1 .. 10] `shouldBe` ([1, 2, 3, 4, 5], [6, 7, 8, 9, 10])
    it "can take with a while" $ do
      takeWhile (< 3) [1 .. 10] `shouldBe` [1, 2]
      takeWhile (<= 7) (enumFromTo 5 15) `shouldBe` [5, 6, 7]
      takeWhile (== 'a') "abracadabra" `shouldBe` "a"
    it "can drop while" $ do
      dropWhile (< 5) [1 .. 10] `shouldBe` [5, 6, 7, 8, 9, 10]
      dropWhile (== 'a') "abracadabra" `shouldBe` "bracadabra"
