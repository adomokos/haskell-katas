import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

head' :: [a] -> a
head' xs = case xs of [] -> error "No head for empty lists!"
                      (x:_) -> x

describeList :: [a] -> String
{- describeList xs = "The list is " ++ case xs of [] -> "empty." -}
                                               {- [x] -> "a singleton list." -}
                                               {- xs -> "a longer list." -}
describeList xs = "The list is " ++ what xs
    where what [] = "empty."
          what [x] = "a singleton list."
          what xs = "a longer list."

main :: IO()
main = hspec $ do
    describe "Case expressions" $ do
        it "can be used anywhere" $ do
            head' [1,3] `shouldBe` 1
        it "can be even used in expressions" $ do
            describeList [] `shouldBe` "The list is empty."
            describeList [1] `shouldBe` "The list is a singleton list."
            describeList [1,2] `shouldBe` "The list is a longer list."
