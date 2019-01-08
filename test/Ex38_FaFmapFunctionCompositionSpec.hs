module Ex38_FaFmapFunctionCompositionSpec
  ( spec
  ) where

{-
    instance Functor ((->) r) where
        fmap = (.)
-}
import Test.Hspec

main :: IO ()
main = hspec spec

spec :: Spec
spec =
  describe "fmap can be considered to be function composition" $
  it "works with 2 arguments" $ do
    ((* 3) . (+ 100) $ 1) `shouldBe` 303
    fmap (* 3) (+ 100) 1 `shouldBe` 303
    ((* 3) `fmap` (+ 100) $ 1) `shouldBe` 303
    fmap (show . (* 3)) (* 100) 1 `shouldBe` "300"
