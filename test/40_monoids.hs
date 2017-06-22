import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import Data.Monoid

{-
    Look at this typeclass:
    class Monoid m where
        mempty :: m
        mappend :: m -> m -> m
        mconcat :: [m] -> m
        mconcat = foldr mappend mempty

        And for lists:
        instance Monoid [a] where
            mempty = []
            mappend = (++)

    "*" and ++ are true for monoid laws as they are associative:
    * The function takes two parameters
    * The parameters and the returned value have the same type
    * There exists such a vlue that does not change other values
      when used with the binary function.

    For product and sum Data.Monoid exposes Product and Sum
-}

main :: IO ()
main = hspec $ do
    describe "Monoids" $ do
        it "defines mappend and mempty" $ do
            [1,2,3] `mappend` [4,5,6]
                `shouldBe` [1,2,3,4,5,6]
            ("one" `mappend` "two") `mappend` "tree"
                `shouldBe` "onetwotree"
            "one" `mappend` ("two" `mappend` "tree")
                `shouldBe` "onetwotree"
            "one" `mappend` "two" `mappend` "tree"
                `shouldBe` "onetwotree"
            "pang" `mappend` mempty `shouldBe` "pang"
            mconcat [[1,2],[3,6],[9]]
                `shouldBe` [1,2,3,6,9]
            (mempty :: [Int]) `shouldBe` []
        it "defines Product and Sum newtypes" $ do
            (getProduct $ Product 3 `mappend` Product 9)
                `shouldBe` 27
            (getProduct $ Product 3 `mappend` mempty)
                `shouldBe` 3
            (getProduct . mconcat . map Product $ [3,4,2])
                `shouldBe` 24
