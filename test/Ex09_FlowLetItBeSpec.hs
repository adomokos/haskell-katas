module Ex09_FlowLetItBeSpec
  ( spec
  ) where

import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec spec
    {- ... -}
    {- ... -}
    {- in sideArea + 2 * topArea -}
    {- where ... -}
          {- ... -}

-- cylinder :: (RealFloat a) => a -> a -> a
-- cylinder r h =
-- cylinder' :: (RealFloat a) => a -> a -> a
-- cylinder' r h = sideArea + 2 * topArea
-- calcBmis :: (RealFloat a) => [(a,a)] -> [a]

spec :: Spec
spec =
  describe "Let bindings are almost like where" $ do
    it "can calculate cylinder surface area" $ do
      pending
      -- cylinder 1 2 `shouldBe` 18.84955592153876
      -- cylinder' 1 2 `shouldBe` 18.84955592153876
    it "is an expression in itself" $ do
      pending
      -- let result = [... in (square 5,square 3,square 2)]
      -- result `shouldBe` [(25,9,4)]
    it "can be used in list comprehensions" $ do
      pending
      -- calcBmis [(80,1.9)] `shouldBe` []
