module Ex26_TypesTypeParametersSpec
  ( spec
  ) where

import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec spec

{-
    Create a Vector type constractor,
    Data constructor should take in 3 arguments
    Type could be displayed and eq
-}
data Vector a =
  Vector a
         a
         a
  deriving (Show, Eq)

vplus :: (Num t) => Vector t -> Vector t -> Vector t
vplus (Vector a b c) (Vector d e f) = Vector (a + d) (b + e) (c + f)

vectMult :: (Num t) => Vector t -> t -> Vector t
vectMult (Vector a b c) x = Vector (a * x) (b * x) (c * x)

scalarMult :: (Num t) => Vector t -> Vector t -> t
scalarMult (Vector a b c) (Vector d e f) = a * d + b * e + c * f

spec :: Spec
spec = do
  describe "Type parameters" $ do
    it "can add two vectors together" $ do
      Vector 3 5 8 `vplus` Vector 9 2 8 `shouldBe` Vector 12 7 16
    it "can add three vectors together" $ do
      Vector 3 5 8 `vplus` Vector 9 2 8 `vplus` Vector 0 2 3 `shouldBe`
        Vector 12 9 19
    it "can multiply a vector with a scalar" $ do
      Vector 3 5 8 `vectMult` 10 `shouldBe` Vector 30 50 80
    it "can multiply two vectors" $ do
      Vector 3 5 8 `scalarMult` Vector 2 3 4 `shouldBe` 6 + 15 + 32
