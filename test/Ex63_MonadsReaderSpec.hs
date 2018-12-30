module Ex63_MonadsReaderSpec
  ( spec
  ) where

import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec spec

    {- a = ___ -}
    {- b = ___ -}
    {- in a+b -}
    {- a <- ___ -}
    {- b <- ___ -}
    {- return (a+b) -}

{-
    instance Monad ((->) r) where
        return x = \_ -> x
        h >>= f = \w -> f (h w) w
-}

-- addStuffSimple :: Int -> Int
-- times 2 and plus 10
-- addStuffSimple x = let
-- addStuff :: Int -> Int
-- same here, times 2 and plus 10
-- addStuff = do

spec :: Spec
spec =
  describe "Reader" $ do
    it "functions are applicative functors" $ do
      pending
      -- times 5 and plus 3
      -- let f = ___
      -- let g = ___
      -- (fmap f g) 8 `shouldBe` 55
      -- times 2 and plus 10
      -- let f = (+) <$> ___ <*> ___
      -- f 3 `shouldBe` 19
    it "can add numbers together" $ do
      pending
      -- addStuffSimple 3 `shouldBe` 19
    it "can use functions as monadic values" $ do
      pending
      -- addStuff 3 `shouldBe` 19
