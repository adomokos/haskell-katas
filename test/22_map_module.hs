import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import qualified Data.Map as Map

phoneBook = 
    [("betty","555-2938")
    ,("bonnie","452-2928")
    ,("patsy","493-2928")
    ,("lucille","205-2928")
    ,("wendy","939-8282")
    ,("penny","853-2492")
    ]

main :: IO()
main = hspec $ do
    describe "Map module" $ do
        it "can convert a list to map" $ do
            (Map.size $ Map.fromList phoneBook) `shouldBe` 6
            Map.size Map.empty `shouldBe` 0
        it "can insert items into a map" $ do
            (length $ Map.insert 3 100 Map.empty) `shouldBe` 1
        it "can check if a Map is empty" $ do
            Map.null Map.empty `shouldBe` True
            (Map.null $ Map.fromList [(2,3),(5,5)]) `shouldBe` False

