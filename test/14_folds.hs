import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

sum' :: (Num a) => [a] -> a
{- sum' xs = foldl (\acc x -> x + acc) 0 xs -}
{- sum' = foldl (+) 0 -}
sum' = foldl1 (+)

elem' :: (Eq a) => a -> [a] -> Bool
elem' y ys = foldl (\acc x -> if x == y then True else acc) False ys

map' :: (a -> b) ->[a] -> [b]
{- map' f xs = foldr (\x acc -> f x : acc) [] xs -}
map' f xs = foldl (\acc x -> acc ++ [f x]) [] xs

main :: IO()
main = hspec $ do
    describe "Folds" $ do
        it "can sum up a list with foldl" $ do
            sum' [1,2,3,4] `shouldBe` 10
        it "can check if an item is in a list" $ do
            elem' 3 [1,2,3,4] `shouldBe` True
            elem' 5 [1,2,3,4] `shouldBe` False
        it "can map over values with foldr" $ do
            map' (*2) [1,2,3] `shouldBe` [2,4,6]
