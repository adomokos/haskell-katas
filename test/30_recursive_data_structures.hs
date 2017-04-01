import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

{- Example 1 -}
{- data List a = Empty | Cons a (List a) deriving (Show, Read, Eq, Ord) -}
infixr 5 :-:
data List a = Empty | a :-: (List a) deriving (Show, Read, Eq, Ord)

data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)

singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree

treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node a left right)
    | x == a = Node x left right
    | x < a = Node a (treeInsert x left) right
    | x > a = Node a left (treeInsert x right)

treeElem :: (Ord a) => a -> Tree a -> Bool
treeElem _ EmptyTree = False
treeElem x (Node a left right)
    | x == a = True
    | x < a = treeElem x left
    | x > a = treeElem x right

main :: IO()
main = hspec $ do
    describe "Recursive Data Structures" $ do
        {- Example 1 -}
        {- it "can define a List" $ do -}
            {- (5 `Cons` Empty) `shouldBe` Cons 5 Empty -}
            {- 4 `Cons` (5 `Cons` Empty) -}
                {- `shouldBe` Cons 4 (Cons 5 Empty) -}
        it "can set fixity declarations with infixr 5" $ do
            5 :-: Empty `shouldBe` ((:-:) 5 Empty)
            4 :-: 5 :-: Empty `shouldBe` ((:-:) 4 ((:-:) 5 Empty))
        it "can express a binary search tree" $ do
            let nums = [8,6,4,1,7,3,5]
            let numsTree = foldr treeInsert EmptyTree nums
            treeElem 5 numsTree `shouldBe` True
            treeElem 2 numsTree `shouldBe` False
