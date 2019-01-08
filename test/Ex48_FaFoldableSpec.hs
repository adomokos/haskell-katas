module Ex48_FaFoldableSpec
  ( spec
  ) where

import qualified Data.Foldable as F
import Data.Monoid
import Test.Hspec

main :: IO ()
main = hspec spec

-- Define a tree Data Type
data Tree a
  = Empty
  | Node a
         (Tree a)
         (Tree a)
  deriving (Show, Read, Eq)

-- Add implementation for F.Foldable with F.foldMap to Tree
instance F.Foldable Tree where
  foldMap f Empty = mempty
  foldMap f (Node x l r) = F.foldMap f l `mappend` f x `mappend` F.foldMap f r

-- Create an sample tree sructure
testTree =
  Node
    5
    (Node 3 (Node 1 Empty Empty) (Node 6 Empty Empty))
    (Node 9 (Node 8 Empty Empty) (Node 10 Empty Empty))

spec :: Spec
spec =
  describe "Foldable" $ do
    it "Foldable foldr and Prelude Foldr are the same for lists" $
            {- foldr (*) 1 [1,2,3] `shouldBe` 6 -}
     do
      product [1, 2, 3] `shouldBe` 6
      F.foldr (*) 1 [1, 2, 3] `shouldBe` 6
    it "works with Maybe" $ do
      F.foldl (+) 2 (Just 9) `shouldBe` 11
      F.foldl (||) False (Just True) `shouldBe` True
    it "can fold a tree with Foldable implementation" $ do
      F.foldl (+) 0 testTree `shouldBe` 42 -- sum
            {- F.foldl (*) 1 testTree `shouldBe` 64800 -- product -}
      product testTree `shouldBe` 64800 -- product
    it "can tell if the tree contains a single value" $
            {- Use Any to tell if 3 is in the tree or not -}
      getAny (F.foldMap (\x -> Any $ x == 3) testTree) `shouldBe` True
    it "applies the function to all elements in the Tree" $
            {- Use Any to tell if any item is >15 in the Tree -}
      getAny (F.foldMap (\x -> Any $ x > 15) testTree) `shouldBe` False
    it "can turn the Tree into a list" $
      F.foldMap (: []) testTree `shouldBe` [1, 3, 6, 5, 8, 9, 10]
