module Katas.Types.SequenceSpec (spec) where

import Test.Hspec
import qualified Data.Sequence as Seq
import Data.Sequence((><), (<|), (|>))
import qualified Data.Foldable as Foldable

main :: IO ()
main = hspec spec

spec :: Spec
spec =
    describe "Sequence" $ do
        it "can initialize singleton Seq" $
            pending
            {- ___ 1 `shouldBe` Seq.fromList [1] -}
        it "can append and prepend" $ do
            pending
            {- 1 ___ Seq.singleton 2 -}
                {- `shouldBe` Seq.fromList [1,2] -}
            {- Seq.singleton 1 ___ ___ -}
                {- `shouldBe` Seq.fromList [1,2] -}
        it "can combine two" $ do
            pending
            {- let left = Seq.fromList [1,3,3] -}
            {- let right = Seq.fromList [7,1] -}
            {- left ___ right -}
                {- `shouldBe` Seq.fromList [1,3,3,7,1] -}
        it "can convert a sequence to a List" $ do
            pending
            {- let list = Foldable.___ (Seq.fromList [1,2,3]) -}
            {- list `shouldBe` [1,2,3] -}
            {- let result = Foldable.___ (+) 0 (Seq.fromList [1,2,3]) -}
            {- result `shouldBe` 6 -}
