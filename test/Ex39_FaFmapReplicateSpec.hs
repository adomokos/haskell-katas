module Ex39_FaFmapReplicateSpec
  ( spec
  ) where

import Data.Either
import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec spec

spec :: Spec
spec =
  describe "fmap replicate on various types" $ do
    it "can be used over list of ints" $
      fmap (replicate 3) [1, 2, 3] `shouldBe` [[1, 1, 1], [2, 2, 2], [3, 3, 3]]
    it "can be used on Maybe values" $
      fmap (replicate 3) (Just 4) `shouldBe` Just [4, 4, 4]
    it "can fmap on Nothing" $
      (fmap (replicate 3) Nothing :: (Maybe [Int])) `shouldBe` Nothing
    it "can be used on Either" $ do
      (fmap (replicate 3) (Right "blah") :: Either String [String]) `shouldBe`
        Right ["blah", "blah", "blah"]
      (fmap (replicate 3) (Left "blah") :: Either String String) `shouldBe`
        Left "blah"
