module Solutions.Ex60_MonadsIntroToWriteMonadSpec
  ( spec
  ) where

import Control.Monad
import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as B8
import Data.Monoid
import Test.Hspec

main :: IO ()
main = hspec spec

isBigGang :: Int -> (Bool, String)
isBigGang x = (x > 9, "Compared gang size to 9.")

applyLog :: (a, String) -> (a -> (b, String)) -> (b, String)
applyLog (x, msg) f =
  let (outcome, log) = f x
   in (outcome, msg ++ log)

applyLog' :: (a, [c]) -> (a -> (b, [c])) -> (b, [c])
applyLog' (x, msg) f =
  let (outcome, log) = f x
   in (outcome, msg ++ log)

applyLog'' :: (Monoid m) => (a, m) -> (a -> (b, m)) -> (b, m)
applyLog'' (x, msg) f =
  let (outcome, log) = f x
   in (outcome, msg `mappend` log)

type Food = String

type Price = Sum Int

{-
    A function that adds drinks to food items.
    This is the menu:
    beans -> milk is 25
    jerky -> whiskey is 99
    _ -> beer is 30
-}
addDrink :: Food -> (Food, Price)
addDrink "beans" = ("milk", Sum 25)
addDrink "jerky" = ("whiskey", Sum 99)
addDrink _ = ("beer", Sum 30)

spec :: Spec
spec =
  describe "Writer Monad" $ do
    it "can tell a size of a gang" $
            -- Create the isBigGang function
     do
      isBigGang 3 `shouldBe` (False, "Compared gang size to 9.")
      isBigGang 30 `shouldBe` (True, "Compared gang size to 9.")
    it "can apply log by appending them" $
            -- Create the applyLog function, that appends log messages
     do
      ((3, "Smallish gang.") `applyLog` isBigGang) `shouldBe`
        (False, "Smallish gang.Compared gang size to 9.")
      ((30, "A freaking platoon.") `applyLog` isBigGang) `shouldBe`
        (True, "A freaking platoon.Compared gang size to 9.")
    it "can use a lambda" $
            -- Use a lambda to apply more messages
     do
      (("Tobin", "Got outlaw name.") `applyLog`
       (\x -> (length x, "Applied length."))) `shouldBe`
        (5, "Got outlaw name.Applied length.")
      (("Bathcat", "Got outlaw name.") `applyLog`
       (\x -> (length x, "Applied length."))) `shouldBe`
        (7, "Got outlaw name.Applied length.")
    it "can mappend two bytestrings" $
            -- combine two lists
     do
      [1, 2, 3] `mappend` [4, 5, 6] `shouldBe` [1 .. 6]
      B8.unpack
        (B.pack [99, 104, 105] `mappend` B.pack [104, 117, 97, 104, 117, 97]) `shouldBe`
        "chihuahua"
    it "can use the new version of applyLog' with the old logic" $
      ((3, "Smallish gang.") `applyLog'` isBigGang) `shouldBe`
      (False, "Smallish gang.Compared gang size to 9.")
    it "can `mappend` two Sum values to get their sum" $
      Sum 3 `mappend` Sum 9 `shouldBe` Sum {getSum = 12}
    it "adds an accompanying drink to a food" $ do
      (("beans", Sum 10) `applyLog''` addDrink) `shouldBe`
        ("milk", Sum {getSum = 35})
      (("jerky", Sum 25) `applyLog''` addDrink) `shouldBe`
        ("whiskey", Sum {getSum = 124})
      (("dogmeat", Sum 5) `applyLog''` addDrink) `shouldBe`
        ("beer", Sum {getSum = 35})
    it "can chain the applyLog logic" $
      (("dogmeat", Sum 5) `applyLog''` addDrink `applyLog''` addDrink) `shouldBe`
      ("beer", Sum {getSum = 65})
