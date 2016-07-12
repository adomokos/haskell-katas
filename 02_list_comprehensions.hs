import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

main :: IO ()
main = hspec $ do
    describe "List Comprehensions" $ do
        it "squares numbers" $ do
            [x^2 | x <- [1..5]] `shouldBe` [1,4,9,16,25]
        it "can use predicates" $ do
            [x^2 | x <- [1..10], rem x 2 == 0] `shouldBe` [4,16,36,64,100]
        it "can exhaust the lists" $ do
            [x^y | x <- [1..5], y <- [2,3]] `shouldBe` [1,1,4,8,9,27,16,64,25,125]
        it "can exhaust the lists and take predicate" $ do
            [x^y | x <- [1..5], y <- [2,3], x^y < 50] `shouldBe` [1,1,4,8,9,27,16,25]
        it "can create tuples from lists" $ do
            [(x, y) | x <- [1,2,3], y <- [6, 7]] `shouldBe` [(1,6),(1,7),(2,6),(2,7),(3,6),(3,7)]
            [(x, y) | x <- [1,2,3], y <- ['a', 'b']] `shouldBe` [(1,'a'),(1,'b'),(2,'a'),(2,'b'),(3,'a'),(3,'b')]
