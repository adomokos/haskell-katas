module Ex06_FlowPatternMatchingSpec (spec) where

import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec spec

factorial :: Int -> Int
factorial 0 = 1
factorial x = x * factorial (x-1)

charName :: Char -> String
charName 'a' = "Albert"

addVectors :: (Num a) => (a,a) -> (a,a) -> (a,a)
addVectors (a,b) (c,d) = (a+c,b+d)

first :: (a, b, c) -> a
first (x, _, _) = x

second :: (a, b, c) -> b
second (_, y, _) = y

third :: (a, b, c) -> c
third (_, _, z) = z

head' :: [a] -> a
head' (x:_) = x

tell :: (Show a) => [a] -> String
tell [] = "This list is empty"
tell (x:[]) = "This list has one element: " ++ show x
tell (x:y:[]) = "This list has two elements: " ++ show x ++ " and " ++ show y
tell _ = "This list is too long"

length' :: [a] -> Int
length' [] = 0
length' (_:xs) = 1 + length' xs

sum' :: [Int] -> Int
sum' [] = 0
sum' (x:xs) = x + sum' xs

firstLetter :: String -> String
firstLetter "" = "Empty string, whoops!"
firstLetter l@(x:_) = "The first letter of " ++ l ++ " is " ++ [x]

spec :: Spec
spec =
  describe "Pattern matching" $ do
    it "can be used in factorial calc" $
      factorial 5 `shouldBe` 120
    it "can fail when no default case" $
      charName 'a' `shouldBe` "Albert"
      {- evaluate (charName 'd') `shouldThrow` anyErrorCall -}
    it "can be used on tuples" $
      addVectors (1,2)(3,4) `shouldBe` (4,6)
    it "can be used on triples" $ do
      first (1,2,3) `shouldBe` 1
      second (1,2,3) `shouldBe` 2
      third (1,2,3) `shouldBe` 3
    it "can pattern list comprehensions" $ do
      let xs = [(1,3),(4,3),(2,4),(5,3),(5,6),(3,1)]
      [a+b | (a,b) <- xs] `shouldBe` [4,7,6,8,11,4]
    it "can be used for the head function" $ do
      head' [2,3,4] `shouldBe` 2
      head' "Hello" `shouldBe` 'H'
    it "can safely process a list" $ do
      {- tell [] `shouldBe` "This list is empty" -}
      tell [1] `shouldBe` "This list has one element: 1"
      tell [1,2] `shouldBe` "This list has two elements: 1 and 2"
      tell [1,2,3] `shouldBe` "This list is too long"
    it "can count elements in list with recursion" $ do
      length' [] `shouldBe` 0
      length' [1,2,3] `shouldBe` 3
    it "can reduce add a list" $ do
      sum' [] `shouldBe` 0
      sum' [1,2,3] `shouldBe` 6
    it "can hold the original item with pattern" $ do
      firstLetter "" `shouldBe` "Empty string, whoops!"
      firstLetter "Dracula" `shouldBe` "The first letter of Dracula is D"
