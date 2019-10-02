module Solutions.Ex43_FaNewTypeSpec
  ( spec
  ) where

import Test.Hspec

main :: IO ()
main = hspec spec

{-
    This would work:
    data ZipList a = ZipList { getZipList :: [a] }

    But this is better:
    newtype ZipList a = ZipList { getZipList :: [a] }
    * faster (no boxing/unboxing)
    * it can have only one value constructor

    Making a tuple to be an instance of a Functor is not possible.
    We can newtype the tuple in a way that the second type
    parameter represents the type of the first component of the tuple.
-}
newtype CharList a = CharList
  { getCharList :: String
  } deriving (Show, Eq)

newtype Pair b a = Pair
  { getPair :: (a, b)
  }

instance Functor (Pair c) where
  fmap f (Pair (x, y)) = Pair (f x, y)

spec :: Spec
spec =
  describe "newtype" $ do
    it "can print values" $ do
      let charList = CharList "this will be shown!"
      show charList `shouldBe`
        "CharList {getCharList = \"this will be shown!\"}"
    it "can equate values" $ do
      CharList "benny" == CharList "benny" `shouldBe` True
      CharList "benny" == CharList "oisters" `shouldBe` False
    it "works with the newtype Pair" $ do
      getPair (fmap (* 100) (Pair (2, 3))) `shouldBe` (200, 3)
      getPair (fmap reverse (Pair ("london calling", 3))) `shouldBe`
        ("gnillac nodnol", 3)
