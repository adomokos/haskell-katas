import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

data Vector a = Vector a a a deriving (Show, Eq)

vplus :: (Num t) => Vector t -> Vector t -> Vector t
(Vector i j k) `vplus` (Vector l m n) = Vector (i+l) (j+m) (k+n)

vectMult :: (Num t) => Vector t -> t -> Vector t
(Vector i j k) `vectMult` m = Vector (i*m) (j*m) (k*m)

scalarMult :: (Num t) => Vector t -> Vector t -> t
(Vector i j k) `scalarMult` (Vector l m n) = i*l + j*m + k*n


main :: IO()
main = hspec $ do
    describe "Type parameters" $ do
        it "can add two vectors together" $ do
            Vector 3 5 8 `vplus` Vector 9 2 8
                `shouldBe` Vector 12 7 16
        it "can add three vectors together" $ do
            Vector 3 5 8 `vplus` Vector 9 2 8 `vplus` Vector 0 2 3
                `shouldBe` Vector 12 9 19
        it "can multiply a vector with a scalar" $ do
            Vector 3 5 8 `vectMult` 10
                `shouldBe` Vector 30 50 80
        it "can multiply two vectors" $ do
            Vector 3 5 8 `scalarMult` Vector 2 3 4
                `shouldBe` 6+15+32
