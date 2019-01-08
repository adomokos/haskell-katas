module Ex19_ModulesListFunctionsSpec
  ( spec
  ) where

import Data.Function
import qualified Data.List as L
import Test.Hspec

main :: IO ()
main = hspec spec
    {- let nlen = length needle -}
    {- in foldl (\acc x -> if take nlen x == needle then True else acc) False (L.tails haystack) -}

{- search :: (Eq a) => [a] -> [a] -> Bool -}
{- search needle haystack = -}
spec :: Spec
spec = do
  describe "More List functions" $ do
    it "can iterate as an infinite list" $ do
      (take 10 $ iterate (* 2) 1) `shouldBe`
        [1, 2, 4, 8, 16, 32, 64, 128, 256, 512]
      (take 3 $ iterate (++ "haha") "haha") `shouldBe`
        ["haha", "hahahaha", "hahahahahaha"]
    it "can split a list at the position specified" $ do
      splitAt 3 "hey man" `shouldBe` ("hey", " man")
      splitAt 8 "hey man" `shouldBe` ("hey man", "")
      splitAt 0 "hey man" `shouldBe` ("", "hey man")
    it "can exhaust a list with inits and tails" $
      -- hint: use `inits` and `tails`
     do
      L.inits "woot" `shouldBe` ["", "w", "wo", "woo", "woot"]
      L.tails "woot" `shouldBe` ["woot", "oot", "ot", "t", ""]
    it "can tell if a string starts with another one" $
      -- hint: use `isPrefixOf`
     do
      L.isPrefixOf "hey" "hey there!" `shouldBe` True
      L.isPrefixOf "hey" "oh, hey there!" `shouldBe` False
    it "can tell if a string ends with another one" $
      -- hint: use `isSuffixOf`
     do
      L.isSuffixOf "there!" "oh, hey there!" `shouldBe` True
      L.isSuffixOf "there!" "oh, hey there" `shouldBe` False
    it "can partition lists based on a predicate" $
      -- hint: use `partition` at 3
     do
      L.partition (> 3) [1, 3, 5, 6, 3, 2, 1, 0, 3, 7] `shouldBe`
        ([5, 6, 7], [1, 3, 3, 2, 1, 0, 3])
    it "finds the first match in a list" $ do
      L.find (> 4) [1, 2, 3, 4, 5, 6] `shouldBe` Just 5
      L.find (> 7) [1, 2, 3, 4, 5, 6] `shouldBe` Nothing
    it "finds the index of an element in a list" $
      -- hint: use `elemIndex`
     do
      L.elemIndex 4 [1, 2, 3, 4, 5, 6] `shouldBe` Just 3
      L.elemIndex 10 [1, 2, 3, 4, 5, 6] `shouldBe` Nothing
    it "finds the index of a predicate" $
      -- hint: use `findIndex`
     do L.findIndex (== 4) [5, 3, 2, 1, 6, 4] `shouldBe` Just 5
    it "can zip more than 2 lists" $
      -- hint: use `zipWith3`
     do
      L.zipWith3 (\x y z -> x + y + z) [1, 2, 3] [4, 5, 2, 2] [2, 2, 3] `shouldBe`
        [7, 9, 8]
    it "creates a string array by line breaks" $
      -- hint: use `lines`
     do
      lines "first line\nsecond line\nthird line" `shouldBe`
        ["first line", "second line", "third line"]
    it "creates a string from a string array" $
      -- hint: use `unlines`
     do
      unlines ["first line", "second line", "third line"] `shouldBe`
        "first line\nsecond line\nthird line\n"
    it "breaks a string apart into words" $
      -- hint: use `words`
     do
      words "hey   these are the  words" `shouldBe`
        ["hey", "these", "are", "the", "words"]
    it "can compact a list" $
      -- hint: use `nub`
     do L.nub [1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4] `shouldBe` [1, 2, 3, 4]
    it "combines two lists, removing duplicates" $
      -- hint: use `union`
     do L.union [1 .. 7] [5 .. 10] `shouldBe` [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    it "finds the same items in two lists" $
      -- hint: use `intersect`
     do L.intersect [1 .. 7] [5 .. 10] `shouldBe` [5, 6, 7]
    it "can sort a list of lists by their lengths" $
      -- hint: use `sortBy` and two functions with `on`
     do
      let xs = [[5, 4, 5, 4, 4], [1, 2, 3], [3, 5, 4, 3], [], [2], [2, 2]]
      L.sortBy (compare `on` length) xs `shouldBe`
        [[], [2], [2, 2], [1, 2, 3], [3, 5, 4, 3], [5, 4, 5, 4, 4]]
