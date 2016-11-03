import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import qualified Data.Char as C
import qualified Data.List as L
import Data.Function

main :: IO()
main = hspec $ do
    describe "Char functions" $ do
        it "can use isSpace to simulate List's words function" $ do
            L.groupBy ((==) `on` C.isSpace) "hey guys it's me"
                `shouldBe` ["hey"," ","guys"," ","it's"," ","me"]
        it "can filter out spaces from the previous example" $ do
            (L.filter (not . any C.isSpace) . L.groupBy ((==) `on` C.isSpace) $ "hey guys it's me")
                `shouldBe` ["hey","guys","it's","me"]
