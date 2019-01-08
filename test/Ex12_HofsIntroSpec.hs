module Ex12_HofsIntroSpec
  ( spec
  ) where

import Test.Hspec

main :: IO ()
main = hspec spec

compareWithHundred :: Int -> Ordering
compareWithHundred = compare 100

divideByTen :: Float -> Float
divideByTen = (/ 10)

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A' .. 'Z'])

applyTwice :: (b -> b) -> b -> b
applyTwice f = f . f

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs

filter' :: (Eq a) => (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' f (x:xs) = [x | f x] ++ filter' f xs

chain :: Integral a => a -> [a]
chain 1 = [1]
chain x
  | even x = x : chain (x `div` 2)
  | otherwise = x : chain (x * 3 + 1)

spec :: Spec
spec =
  describe "Higher Order Functions" $ do
    it "can copare it with 100" $ compareWithHundred 100 `shouldBe` EQ
    it "can divide by 10 with partial function" $
      divideByTen 200 `shouldBe` 20.0
    it "can tell if upper-case letter" $ do
      isUpperAlphanum 'b' `shouldBe` False
      isUpperAlphanum 'B' `shouldBe` True
    it "can apply a function twice" $ do
      applyTwice (+ 3) 10 `shouldBe` 16
      applyTwice (++ " HAHA") "HEY" `shouldBe` "HEY HAHA HAHA"
    it "can zip with a function" $ do
      zipWith' (+) [1, 2, 3] [4, 5, 6] `shouldBe` [5, 7, 9]
      zipWith' (*) [1, 2, 3] [4, 5, 6] `shouldBe` [4, 10, 18]
      zipWith' max [1, 2, 3] [2, 1, 3] `shouldBe` [2, 2, 3]
    it "can map over a list of values" $ do
      map' (+ 3) [] `shouldBe` []
      map' (+ 3) [1, 2, 3, 4] `shouldBe` [4, 5, 6, 7]
      map' ((* 2) . (+ 3)) [1, 2, 3, 4] `shouldBe` [8, 10, 12, 14]
      [x + 3 | x <- [1, 2, 3, 4]] `shouldBe` [4, 5, 6, 7]
      map' fst [(1, 2), (3, 4), (5, 6)] `shouldBe` [1, 3, 5]
    it "can filter items from a list" $ do
      filter' (> 3) [] `shouldBe` []
      filter' (> 3) [1 .. 5] `shouldBe` [4, 5]
      filter' (== 3) [1 .. 5] `shouldBe` [3]
    it "can calculate the Collatz sequenses" $
      {- if it's even, divide by two -}
      {- it it's odd, multiply by 3 and add 1 to it -}
      chain 1 `shouldBe` [1]
      {- chain 10 `shouldBe` [10,5,16,8,4,2,1] -}
