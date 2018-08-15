module Katas.Monads.LoggingWithWriterSpec (spec) where

import Test.Hspec
import Test.QuickCheck
import Control.Monad.Writer
import Data.Monoid

main :: IO ()
main = hspec spec

-- Greatest common deviser
{- gcd' :: Int -> Int -> Int -}

{- gcdWithLog :: Int -> Int -> Writer [String] Int -}

{- newtype DiffList a = DiffList { getDiffList :: [a] -> [a] } -}

{- toDiffList :: [a] -> DiffList a -}

{- fromDiffList :: DiffList a -> [a] -}

{- instance Monoid (DiffList a) where -}

{- gcdWithDiffList :: Int -> Int -> Writer (DiffList String) Int -}

spec :: Spec
spec = do
    describe "Logging with Writer" $ do
        it "can find the greatest common devisor" $ do
            pending
            {- gcd' 8 3 `shouldBe` 1 -}
        it "can decorate the gcd function with logging" $ do
            pending
            {- (fst $ runWriter $ gcdWithLog 8 3) `shouldBe` 1 -}
            {- (snd $ runWriter $ gcdWithLog 8 3) -}
                {- `shouldBe` ["8 mod 3 = 2","3 mod 2 = 1","2 mod 1 = 0","Finished with 1"] -}
        it "can efficiently append to difference list" $ do
            pending
            {- (fromDiffList (toDiffList [1,2,3,4] `mappend` toDiffList [1,2,3])) -}
                {- `shouldBe` [1,2,3,4,1,2,3] -}
        it "can log with DiffList String" $ do
            pending
            {- (fromDiffList . snd . runWriter $ gcdWithDiffList 8 3) -}
                {- `shouldBe` ["8 mod 3 = 2","3 mod 2 = 1","2 mod 1 = 0","Finished with 1"] -}

{-
    To run it in the RePL:
    ghci> mapM_ putStrLn . fromDiffList . snd . runWriter $ gcdWithDiffList 110 34
-}
