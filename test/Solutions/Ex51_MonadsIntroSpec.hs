module Solutions.Ex51_MonadsIntroSpec
  ( spec
  ) where

import Test.Hspec

main :: IO ()
main = hspec spec

{-
   Monads are just beefed up applicative functors, much like
   applicative functors are only beefed up functors.

   (>>=) :: (Monad m) => m a -> (a -> m b) -> m b
   pronounced - bind

   Takes a monadic value, and a function that takes a normal value
   and returns a monadic value and manages to apply that function to
   the monadic value.
-}

-- Let's not use >>=, create an applyMaybe fn
applyMaybe :: Maybe a -> (a -> Maybe b) -> Maybe b
applyMaybe Nothing _ = Nothing
applyMaybe (Just x) f = f x

spec :: Spec
spec =
  describe "Monads" $ do
    it "can wrap a normal value into a Just value" $
            -- Use a lambda here
     do
      (\x -> Just (x + 1)) 1 `shouldBe` Just 2
      (\x -> Just (x + 1)) 100 `shouldBe` Just 101
    it "can use applyMaybe function to Maybe values" $ do
      (Just 3 `applyMaybe` \x -> Just (x + 1)) `shouldBe` Just 4
      (Just "smile" `applyMaybe` \x -> Just (x ++ " :)")) `shouldBe`
        Just "smile :)"
      (Nothing `applyMaybe` \x -> Just (x + 1)) `shouldBe` Nothing
      (Nothing `applyMaybe` \x -> Just (x ++ " :)")) `shouldBe` Nothing
    it "checks if value is >2" $ do
      (Just 3 `applyMaybe` \x ->
         if x > 2
           then Just x
           else Nothing) `shouldBe`
        Just 3
      (Nothing `applyMaybe` \x ->
         if x > 2
           then Just x
           else Nothing) `shouldBe`
        Nothing
    it "works like our applyMaybe fn" $ do
      let value = return "WHAT" :: Maybe String
      value `shouldBe` Just "WHAT"
            -- Use a lambda here
      (Just 9 >>= \x -> Just (10 * x)) `shouldBe` Just 90
      (Nothing >>= \x -> Just (10 * x)) `shouldBe` Nothing
