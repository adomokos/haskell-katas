module Ex09_FlowLetItBeSpec
  ( spec
  ) where

import Test.Hspec

main :: IO ()
main = hspec spec

cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
  let sideArea = 2 * r * pi * h
      topArea = r ^ 2 * pi
   in sideArea + 2 * topArea

cylinder' :: (RealFloat a) => a -> a -> a
cylinder' r h = sideArea + 2 * topArea
  where
    sideArea = 2 * r * pi * h
    topArea = r ^ 2 * pi

calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi | (x, y) <- xs, let bmi = x / y ^ 2, bmi >= 25.0]

spec :: Spec
spec =
  describe "Let bindings are almost like where" $ do
    it "can calculate cylinder surface area" $ do
      cylinder 1 2 `shouldBe` 18.84955592153876
      cylinder' 1 2 `shouldBe` 18.84955592153876
    it "is an expression in itself" $ do
      let result =
            [ let square x = x ^ 2
               in (square 5, square 3, square 2)
            ]
      result `shouldBe` [(25, 9, 4)]
    it "can be used in list comprehensions" $ calcBmis [(80, 1.9)] `shouldBe` []
