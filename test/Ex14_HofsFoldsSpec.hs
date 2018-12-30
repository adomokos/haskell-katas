module Ex14_HofsFoldsSpec (spec) where

import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec spec

sum' :: (Num a) => [a] -> a
sum' = foldl1 (+)

elem' :: (Eq a) => a -> [a] -> Bool
elem' y ys = foldl (\acc x -> if x == y then True else acc) False ys

map' :: (a -> b) -> [a] -> [b]
map' f = foldr (\x acc -> f x : acc) []

maximum' :: (Ord a) => [a] -> a
maximum' = foldl1 (\x acc -> if x > acc then x else acc)

reverse' :: [a] -> [a]
reverse' = foldl (\acc x -> x : acc) []

product' :: (Num a) => [a] -> a
product' = foldl1 (\acc l -> l * acc)

filter' :: (Eq a) => (a -> Bool) -> [a] -> [a]
filter' f = foldr (\x acc -> if f x then x : acc else acc) []

head' :: [a] -> a
head' = foldr1 (\x _ -> x)

last' :: [a] -> a
last' = foldl1 (\_ x -> x)

spec :: Spec
spec = do
  describe "Folds" $ do
    it "can sum up a list with foldl" $ do
      sum' [1,2,3,4] `shouldBe` 10
    it "can check if an item is in a list" $ do
      elem' 3 [1,2,3,4] `shouldBe` True
      elem' 5 [1,2,3,4] `shouldBe` False
    it "can map over values with foldr" $ do
      map' (*2) [1,2,3] `shouldBe` [2,4,6]
    it "can find the maximum in a list" $ do
      maximum' [1,2,3] `shouldBe` 3
    it "can reverse a list with foldl" $ do
      reverse' [1,3,5] `shouldBe` [5,3,1]
    it "can calculate a product of a list" $ do
      product' [2,2,3] `shouldBe` 12
    it "can filter a list with foldr" $ do
      filter' (<3) [1,2,3,5] `shouldBe` [1,2]
    it "can pick the head of the list" $ do
      head' [5,4,3] `shouldBe` 5
    it "can pick the last item of the list" $ do
      last' [5,4,3] `shouldBe` 3
