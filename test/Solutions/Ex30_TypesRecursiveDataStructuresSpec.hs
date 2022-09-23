module Solutions.Ex30_TypesRecursiveDataStructuresSpec
  ( spec
  ) where

import Test.Hspec

main :: IO ()
main = hspec spec

-- Example 1
-- Define a list that uses Cons to add elements to the list
data List a
  = Empty
  | Cons a
         (List a)
  deriving (Show, Read, Eq, Ord)

-- Might be easier to understand it with the Record syntax
-- data List a = Empty | Cons { listHead :: a, listTail :: List a} deriving (Show, Read, Eq, Ord) 
-- Use infixr 5
infixr 5 :-:

data List' a
  = Empty'
  | a :-: (List' a)
  deriving (Show, Read, Eq, Ord)

-- Define a Tree structure with EmptyTree and Node 
data Tree a
  = EmptyTree
  | Node a
         (Tree a)
         (Tree a)
  deriving (Show, Eq, Ord)

singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree

treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node y left right)
  | x == y = Node x left right
  | x < y = Node y (treeInsert x left) right
  | otherwise = Node y left (treeInsert x right)

treeElem :: (Ord a) => a -> Tree a -> Bool
treeElem x EmptyTree = False
treeElem x (Node y left right)
  | x == y = True
  | x < y = treeElem x left
  | otherwise = treeElem x right

spec :: Spec
spec =
  describe "Recursive Data Structures" $
    -- Example 1
   do
    it "can define a List" $ do
      (5 `Cons` Empty) `shouldBe` Cons 5 Empty
      4 `Cons` (5 `Cons` Empty) `shouldBe` Cons 4 (Cons 5 Empty)
    it "can set fixity declarations with infixr 5" $ do
      5 :-: Empty' `shouldBe` (:-:) 5 Empty'
      4 :-: 5 :-: Empty' `shouldBe` (:-:) 4 ((:-:) 5 Empty')
    it "can express a binary search tree" $ do
      let nums = [8, 6, 4, 1, 7, 3, 5]
      let numsTree = foldr treeInsert EmptyTree nums
      treeElem 5 numsTree `shouldBe` True
      treeElem 2 numsTree `shouldBe` False
