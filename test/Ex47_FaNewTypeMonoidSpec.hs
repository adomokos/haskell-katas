{-# LANGUAGE GeneralizedNewtypeDeriving #-}
module Ex47_FaNewTypeMonoidSpec (spec) where

import Test.Hspec
import Data.Monoid

main :: IO ()
main = hspec spec

newtype AInt = A { unA :: Int } deriving (Show, Eq, Num)

-- monoid under addition

newtype MInt = M { unM :: Int } deriving (Show, Eq, Num)

-- monoid under addition

spec :: Spec
spec =
    describe "New Type Monoids" $ do
        it "can be used to create distinct types" $ do
            pending
            {- unM (2 `mappend` 5 :: MInt) -}
                {- `shouldBe` 10 -}
            {- unA (2 `mappend` 5 :: AInt) -}
                {- `shouldBe` 7 -}
