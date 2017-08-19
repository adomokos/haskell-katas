import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import Data.Monoid

main :: IO ()
main = hspec $ do
    describe "Maybe Monoids" $ do
        it "works with Maybe values" $ do
            pending
            {- ___ ___ Just "andy" `shouldBe` Just "andy" -}
            {- Just LT <> ___ `shouldBe` Just LT -}
            {- ___ ___ <> Just (Sum ___) -}
                {- `shouldBe` Just (Sum 7) -}
        it "can use First if the type is not instance of Monoids" $ do
            pending
            {- (___ $ First (___ ___) <> First (Just 'b')) -}
                {- `shouldBe` Just 'a' -}
            {- (___ $ ___ ___ <> First (Just 'b')) -}
                {- `shouldBe` Just 'b' -}
            {- (___ $ First (___ ___) <> First Nothing) -}
                {- `shouldBe` Just 'a' -}
        it "can use First to find the first Just value" $ do
            pending
            {- (___ . ___ . ___ ___ $ [Nothing, Just 9, Just 10]) -}
                {- `shouldBe` Just 9 -}
            {- ((___ . ___ . ___ ___ $ [Nothing, Nothing]) :: Maybe Int) -}
                {- `shouldBe` Nothing -}
        it "can use Last to find the last Just value" $ do
            pending
            {- (___ . ___ . ___ ___ $ [Nothing, Just 9, Just 10, Nothing]) -}
                {- `shouldBe` Just 10 -}

