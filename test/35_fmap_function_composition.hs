{-
    instance Functor ((->) r) where
        fmap = (.)
-}

import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

main :: IO ()
main = hspec $ do
    describe "fmap can be considered to be function composition" $ do
        it "works with 2 arguments" $ do
            ((*3) . (+100) $ 1) `shouldBe` 303
            (fmap (*3) (+100) 1) `shouldBe` 303
            ((*3) `fmap` (+100) $ 1) `shouldBe` 303
            (fmap (show . (*3)) (*100) 1) `shouldBe` "300"
