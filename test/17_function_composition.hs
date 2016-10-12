import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

addSquareSum :: Integer
addSquareSum =
    let oddSquares = filter odd $ map (^2) [1..]
        belowLimit = takeWhile(<10000) oddSquares
    in sum belowLimit

main :: IO()
main = hspec $ do
    describe "Function composition" $ do
        it "can take the absolute value and negate that" $ do
            (map (\x -> negate (abs x)) [1,2,-3,4,5])
                `shouldBe` [-1,-2,-3,-4,-5]
        it "can compose negate and abs into a new function" $ do
            (map (negate . abs) [1,2,-3,-4,5])
                `shouldBe` [-1,-2,-3,-4,-5]
        it "can compose a new function from 3 other functions" $ do
            (map (negate . sum . tail) [[1..5],[3..6],[1..7]])
                `shouldBe` [-14,-15,-27]
        it "can calculate the sum of all add squares <10000" $ do
            (sum . takeWhile (<10000) . filter odd . map (^2) $ [1..])
                `shouldBe` 166650
            {- A more readable version -}
            addSquareSum `shouldBe` 166650

