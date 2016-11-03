import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import qualified Data.List as L
import Data.Function

search :: (Eq a) => [a] -> [a] -> Bool
search needle haystack =
    let nlen = length needle
    in foldl (\acc x -> if take nlen x == needle then True else acc) False (L.tails haystack)

main :: IO()
main = hspec $ do
    describe "More List functions" $ do
        it "iterates over a number making an infinite list" $ do
            (take 5 $ iterate (*2) 1) `shouldBe` [1,2,4,8,16]
            (take 3 $ iterate (++ "haha") "haha")
                `shouldBe` ["haha", "hahahaha", "hahahahahaha"]
        it "can take when the stock exceeded 1000" $ do
            let stocks = [(994.4,2008,9,1),(995.2,2008,9,2),(999.2,2008,9,3),(1001.4,2008,9,4),(998.3,2008,9,5)]
            let findFirstAbove1000 xs = head (dropWhile (\(val,y,m,d) -> val < 1000) xs)
            findFirstAbove1000 stocks `shouldBe` (1001.4,2008,9,4)
        it "can count the number of same items in a list" $ do
            let list = [1,1,1,1,2,2,2,2,3,3,2,2,2,5,6,7,7]
            let countItemsIn = map (\l@(x:xs) -> (x,length l)) . L.group . L.sort
            countItemsIn list `shouldBe` [(1,4),(2,7),(3,2),(5,1),(6,1),(7,2)]
        it "can exhaust a list with inits and tails" $ do
            L.inits "woot" `shouldBe` ["","w","wo","woo","woot"]
            L.tails "woot" `shouldBe` ["woot", "oot", "ot", "t", ""]
        it "can use foldl with tails to search for item in a list" $ do
            search "cat" "im a cat burglar" `shouldBe` True
        it "can tell if a string starts with another one" $ do
            "hey" `L.isPrefixOf` "hey there!" `shouldBe` True
            "hey" `L.isPrefixOf` "oh, hey there!" `shouldBe` False
        it "can tell if a string ends with another one" $ do
            "there!" `L.isSuffixOf` "oh, hey there!" `shouldBe` True
            "there!" `L.isSuffixOf` "oh, hey there" `shouldBe` False
        it "can partition lists based ona predicate" $ do
            L.partition (>3) [1,3,5,6,3,2,1,0,3,7]
                `shouldBe` ([5,6,7],[1,3,3,2,1,0,3])
        it "finds the first match in a list" $ do
            L.find (>4) [1,2,3,4,5,6] `shouldBe` Just 5
            L.find (>7) [1,2,3,4,5,6] `shouldBe` Nothing
        it "finds the index of an element in a list" $ do
            L.elemIndex 4 [1,2,3,4,5,6] `shouldBe` Just 3
            L.elemIndex 10 [1,2,3,4,5,6] `shouldBe` Nothing
        it "finds the index of a predicate" $ do
            L.findIndex (==4) [5,3,2,1,6,4] `shouldBe` Just 5
        it "can zip more than 2 lists" $ do
            L.zipWith3 (\x y z -> x + y + z) [1,2,3] [4,5,2,2] [2,2,3]
                `shouldBe` [7,9,8]
        it "creates a string array by line breaks" $ do
            L.lines "first line\nsecond line\nthird line"
                `shouldBe` ["first line","second line", "third line"]
        it "creates a string from a string array" $ do
            L.unlines ["first line","second line","third line"]
                `shouldBe` "first line\nsecond line\nthird line\n"
        it "breaks a string apart into words" $ do
            L.words "hey   these are the  words"
                `shouldBe` ["hey","these","are","the","words"]
        it "can compact a list" $ do
            L.nub [1,2,3,4,1,2,3,4,1,2,3,4] `shouldBe` [1,2,3,4]
        it "combines two lists, removing duplicates" $ do
            L.union [1..7] [5..10] `shouldBe` [1,2,3,4,5,6,7,8,9,10]
        it "finds the same items in two lists" $ do
            L.intersect [1..7] [5..10] `shouldBe` [5,6,7]
        it "can sort a list of lists by their lengths" $ do
            let xs = [[5,4,5,4,4],[1,2,3],[3,5,4,3],[],[2],[2,2]]
            L.sortBy (compare `on` length) xs
                `shouldBe` [[],[2],[2,2],[1,2,3],[3,5,4,3],[5,4,5,4,4]]
