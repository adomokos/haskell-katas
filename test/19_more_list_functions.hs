import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import qualified Data.List as L

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
