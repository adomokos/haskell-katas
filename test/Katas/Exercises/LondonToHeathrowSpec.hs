module Katas.Exercises.LondonToHeathrowSpec (spec) where

import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)


-- roadStep :: (Path, Path) -> Section -> (Path, Path)

-- optimalPath :: RoadSystem -> Path

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
    describe "London - to - Heathrow" $ do
        it "calculates the road path" $ do
            pending
            {- roadStep ([],[]) (head heathrowToLondon) `shouldBe` -}
                {- ([(C,30),(B,10)],[(B,10)]) -}
        it "calculates the best path" $ do
            pending
            {- optimalPath heathrowToLondon `shouldBe` -}
                {- [(B,10),(C,30),(A,5),(C,20),(B,2),(B,8),(C,0)] -}
