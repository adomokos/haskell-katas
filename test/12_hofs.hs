import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

compareWithHundred :: (Num a, Ord a) => a -> Ordering
compareWithHundred = compare 100

divideByTen :: (Fractional a) => a -> a
divideByTen = (/10)

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z'])

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

map' :: (a -> b) -> [a] -> [b]
map' f [] = []
map' f (x:xs) = f x : map' f xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' p [] = []
filter' p (x:xs)
    | p x = x : filter' p xs
    | otherwise = filter' p xs

chain :: Integral a => a -> [a]
chain 1 = [1]
chain x
    | even x = x : chain (x `div` 2)
    | odd x = x : chain (x * 3 + 1)

main :: IO()
main = hspec $ do
    describe "Higher Order Functions" $ do
        it "can copare it with 100" $ do
            compareWithHundred 100 `shouldBe` EQ
        it "can divide by 10 with partial function" $ do
            divideByTen 200 `shouldBe` 20.0
        it "can tell if upper-case letter" $ do
            isUpperAlphanum 'b' `shouldBe` False
            isUpperAlphanum 'B' `shouldBe` True
        it "can apply a function twice" $ do
            applyTwice (+3) 10 `shouldBe` 16
            applyTwice (++ " HAHA") "HEY" `shouldBe` "HEY HAHA HAHA"
        it "can zip with a function" $ do
            zipWith' (+) [1,2,3] [4,5,6] `shouldBe` [5,7,9]
            zipWith' (*) [1,2,3] [4,5,6] `shouldBe` [4,10,18]
            zipWith' max [1,2,3] [2,1,3] `shouldBe` [2,2,3]
        it "can map over a list of values" $ do
            map' (+3) [] `shouldBe` []
            map' (+3) [1,2,3,4] `shouldBe` [4,5,6,7]
            map' ((*2).(+3)) [1,2,3,4] `shouldBe` [8,10,12,14]
            [x+3 | x <- [1,2,3,4]] `shouldBe` [4,5,6,7]
            map' fst [(1,2),(3,4),(5,6)] `shouldBe` [1,3,5]
        it "can filter items from a list" $ do
            filter' (>3) [] `shouldBe` []
            filter' (>3) [1..5] `shouldBe` [4,5]
            filter' (==3) [1..5] `shouldBe` [3]
        it "can calculate the Collatz sequenses" $ do
            {- if it's even, divide by two -}
            {- it it's odd, multiply by 3 and add 1 to it -}
            chain 1 `shouldBe` [1]
            chain 10 `shouldBe` [10,5,16,8,4,2,1]
        it "can count long chains with lambda" $ do
            let numLongChains = length (filter (\xs -> length xs > 15) (map chain [1..100]))
            numLongChains `shouldBe` 66

