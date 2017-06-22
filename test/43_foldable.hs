import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import Data.Monoid
import qualified Data.Foldable as F

data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)

instance F.Foldable Tree where
    foldMap f Empty = mempty
    foldMap f (Node x l r) = F.foldMap f l `mappend`
                             f x `mappend`
                             F.foldMap f r

testTree = Node 5
            (Node 3
                (Node 1 Empty Empty)
                (Node 6 Empty Empty)
            )
            (Node 9
                (Node 8 Empty Empty)
                (Node 10 Empty Empty)
            )

main :: IO ()
main = hspec $ do
    describe "Foldable" $ do
        it "Foldable foldr and Prelude Foldr are the same for lists" $ do
            foldr (*) 1 [1,2,3] `shouldBe` 6
            F.foldr (*) 1 [1,2,3] `shouldBe` 6
        it "works with Maybe" $ do
            F.foldl (+) 2 (Just 9) `shouldBe` 11
            F.foldl (||) False (Just True) `shouldBe` True
        it "can fold a tree with Foldable implementation" $ do
            F.foldl (+) 0 testTree `shouldBe` 42
            F.foldl (*) 1 testTree `shouldBe` 64800
        it "can tell if the tree contains a single value" $ do
            (getAny $ F.foldMap (\x -> Any $ x == 3) testTree)
                `shouldBe` True
        it "applies the function to all elements in the Tree" $ do
            (getAny $ F.foldMap (\x -> Any $ x > 15) testTree)
                `shouldBe` False
        it "can turn the Tree into a list" $ do
            F.foldMap (\x -> [x]) testTree `shouldBe` [1,3,6,5,8,9,10]
