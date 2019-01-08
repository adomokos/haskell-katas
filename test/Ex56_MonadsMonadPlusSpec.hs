module Ex56_MonadsMonadPlusSpec
  ( spec
  ) where

import Control.Monad
import Test.Hspec

main :: IO ()
main = hspec spec

{-
    MonadPlus type class is for monads that can also act as monoids:

    class Monad m => MonadPlus m where
        mzero :: m a
        mplus :: m a -> m a -> m a

    instance MonadPlus [] where
        mzero = []
        mplus = (++)

    guard :: (MonadPlus m) => Bool -> m ()
    guard True = return ()
    guard False = mzero
-}
-- Use do notation just like in the examples below
sevensOnly :: [Int]
sevensOnly = do
  x <- [1 .. 50]
  guard ('7' `elem` show x)
  return x

spec :: Spec
spec =
  describe "guard" $ do
    it "can filter list of numbers with digits 7" $
      [x | x <- [1 .. 50], '7' `elem` show x] `shouldBe` [7, 17, 27, 37, 47]
    it "can put it in a minimal default context if true" $
            -- compare 5 and 2 in the examples below
     do
      (guard (5 > 2) :: Maybe ()) `shouldBe` Just ()
      (guard (1 > 2) :: Maybe ()) `shouldBe` Nothing
      (guard (5 > 2) :: [()]) `shouldBe` [()]
      (guard (1 > 2) :: [()]) `shouldBe` []
    it "can be used to filter out non-deterministic computations" $
      ([1 .. 50] >>= (\x -> guard ('7' `elem` show x) >> return x)) `shouldBe`
      [7, 17, 27, 37, 47]
    it "works in conjunction with >>" $
            -- compare 5 and 2 in the examples below
     do
      (guard (5 > 2) >> return "cool" :: [String]) `shouldBe` ["cool"]
      (guard (1 > 2) >> return "cool" :: [String]) `shouldBe` []
    it "can be expressed with do notation" $
      sevensOnly `shouldBe` [7, 17, 27, 37, 47]
