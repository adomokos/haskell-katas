import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [c | c <- st, c `elem` ['A'..'Z']]

addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

main :: IO ()
main = hspec $ do
    describe "Functions have types" $ do
        it "can use a function with type" $ do
            removeNonUppercase "HelloWORLD" `shouldBe` "HWORLD"
            addThree 1 2 3 `shouldBe` 6
    describe "Type classes" $ do
        it "can order strings" $ do
            "Abrakadabra" < "Zebra" `shouldBe` True
            "Abrakadabra" `compare` "Zebra" `shouldBe` LT
            5 >= 2 `shouldBe` True
            5 `compare` 3 `shouldBe` GT
        it "can show anything" $ do
            show 3 `shouldBe` "3"
            show True `shouldBe` "True"
        it "can read strings into values" $ do
            read "True" || False `shouldBe` True
            read "8.2" + 3.8 `shouldBe` 12
            (read "[1,2,3,4]" :: [Int]) `shouldBe` [1,2,3,4]
            (read "(3, 'a')" :: (Int, Char)) `shouldBe` (3, 'a')


