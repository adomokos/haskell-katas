module Ex21_ModulesMapFunctionalitySpec (spec) where

import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec spec

phoneBook =
  [("betty","555-2938")
  ,("bonnie","452-2928")
  ,("patsy","493-2928")
  ,("lucille","205-2928")
  ,("wendy","939-8282")
  ,("penny","853-2492")
  ]

-- use with foldl
-- findKey :: (Foldable t, Eq a) => a -> t (a, [Char]) -> [Char]
-- findKey key =
    -- foldl (\acc (name,number) -> if name == key then number else acc) ""

findKey :: Eq t => t -> [(t, [Char])] -> [Char]
findKey _ [] = ""
findKey key ((name,number):xs)
  | key == name = number
  | otherwise = findKey key xs

findKey' :: (Foldable t, Eq a) => a -> t (a, [Char]) -> Maybe [Char]
findKey' key =
  foldl (\acc (name,number) -> if name == key then Just number else acc) Nothing

spec :: Spec
spec = do
  describe "Map functionality" $ do
    it "can look up by keys" $ do
      -- Use this test for the happy-path
      findKey "bonnie" phoneBook `shouldBe` "452-2928"
      -- Use these tests to test edge cases
      findKey' "bonnie" phoneBook `shouldBe` Just "452-2928"
      findKey' "bonn" phoneBook `shouldBe` Nothing
