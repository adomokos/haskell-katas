import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import Data.Monoid

main :: IO ()
main = hspec $ do
    describe "Maybe Monoids" $ do
        it "works with Maybe values" $ do
            Nothing `mappend` Just "andy" `shouldBe` Just "andy"
            Just LT `mappend` Nothing `shouldBe` Just LT
            Just (Sum 3) `mappend` Just (Sum 4)
                `shouldBe` Just (Sum {getSum = 7})
        it "can use First if the type is not instance of Monoids" $ do
            (getFirst $ First (Just 'a') `mappend` First (Just 'b'))
                `shouldBe` Just 'a'
            (getFirst $ First Nothing `mappend` First (Just 'b'))
                `shouldBe` Just 'b'
            (getFirst $ First (Just 'a') `mappend` First Nothing)
                `shouldBe` Just 'a'
        it "can use First to find the first Just value" $ do
            (getFirst . mconcat . map First $ [Nothing, Just 9, Just 10])
                `shouldBe` Just 9
            ((getFirst . mconcat . map First $ [Nothing, Nothing]) :: Maybe Int)
                `shouldBe` Nothing
        it "can use Last to find the last Just value" $ do
            (getLast . mconcat . map Last $ [Nothing, Just 9, Just 10])
                `shouldBe` Just 10

