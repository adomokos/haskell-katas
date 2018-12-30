module Ex63_MonadsReaderSpec
  ( spec
  ) where

import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec spec

{-
    instance Monad ((->) r) where
        return x = \_ -> x
        h >>= f = \w -> f (h w) w
-}
addStuffSimple :: Int -> Int
-- times 2 and plus 10
addStuffSimple x =
  let a = (* 2) x
      b = (+ 10) x
   in (a + b)

addStuff :: Int -> Int
-- same here, times 2 and plus 10
addStuff = do
  a <- (* 2)
  b <- (+ 10)
  return (a + b)

spec :: Spec
spec =
  describe "Reader" $ do
    it "functions are applicative functors" $
            -- times 5 and plus 3
     do
      let f = (* 5)
      let g = (+ 3)
      fmap f g 8 `shouldBe` 55
            -- times 2 and plus 10
      let f = (+) <$> (* 2) <*> (+ 10)
      f 3 `shouldBe` 19
    it "can add numbers together" $ addStuffSimple 3 `shouldBe` 19
    it "can use functions as monadic values" $ addStuff 3 `shouldBe` 19
