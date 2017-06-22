import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import qualified Data.Foldable as F

data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)

main :: IO ()
main = hspec $ do
    describe "Foldable" $ do
        it "Foldable foldr and Prelude Foldr are the same for lists" $ do
            foldr (*) 1 [1,2,3] `shouldBe` 6
            F.foldr (*) 1 [1,2,3] `shouldBe` 6
        it "works with Maybe" $ do
            F.foldl (+) 2 (Just 9) `shouldBe` 11
            F.foldl (||) False (Just True) `shouldBe` True
