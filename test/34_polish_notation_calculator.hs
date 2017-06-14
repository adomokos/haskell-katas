import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

foldingFunction :: (Num a, Read a) => [a] -> String -> [a]
foldingFunction (x:y:xs) "+" = (x+y):xs
foldingFunction (x:y:xs) "-" = (y-x):xs
foldingFunction (x:y:xs) "*" = (x*y):xs
foldingFunction xs numberString = (read numberString) : xs

solveRPN :: (Num a, Read a) => String -> a
solveRPN = head . foldl foldingFunction [] . words
    {- where   foldingFunction (x:y:ys) "*" = (x * y):ys -}
            {- foldingFunction (x:y:ys) "+" = (x + y):ys -}
            {- foldingFunction (x:y:ys) "-" = (y - x):ys -}
            {- foldingFunction xs numberString = read numberString:xs -}

main :: IO()
main = hspec $ do
    describe "reverse polish notation" $ do
        {- it "uses a foldingFunction" $ do -}
            {- foldl foldingFunction [] ["1","2","+"] `shouldBe` [3] -}
            {- foldl foldingFunction [] ["2","3","*"] `shouldBe` [6] -}
        it "calculates simple addition" $ do
            solveRPN "1 2 +" `shouldBe` 3
        it "calculates simple multiplication" $ do
            solveRPN "2 3 *" `shouldBe` 6
        it "calculates more complex expressions" $ do
            solveRPN "10 4 3 + 2 * -" `shouldBe` (-4)
