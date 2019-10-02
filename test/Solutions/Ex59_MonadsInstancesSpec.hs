{-# LANGUAGE InstanceSigs #-}
module Solutions.Ex59_MonadsInstancesSpec (spec) where

import Test.Hspec

main :: IO ()
main = hspec spec

-- Add the Functor, Applicative and Monad instances
-- for MyMaybe custom data type

data MyMaybe a = MyNothing | MyJust a
    deriving (Show, Eq)

instance Functor MyMaybe where
    fmap :: (a -> b) -> MyMaybe a -> MyMaybe b
    fmap _ MyNothing = MyNothing
    fmap f (MyJust x) = MyJust (f x)

instance Applicative MyMaybe where
    pure x = MyJust x
    (<*>) _ MyNothing = MyNothing
    (<*>) MyNothing _ = MyNothing
    (MyJust x) <*> (MyJust y) = MyJust $ x y

instance Monad MyMaybe where
    return = pure
    (>>=) MyNothing _ = MyNothing
    (>>=) (MyJust x) f = f x

spec :: Spec
spec = do
    describe "Monad Examples" $ do
        it "works for Functor" $ do
            fmap (+2) MyNothing `shouldBe` MyNothing
            fmap (+2) (MyJust 3) `shouldBe` MyJust 5
        it "works for Applicative" $ do
            pure 2 `shouldBe` MyJust 2
            (+) <$> MyJust 2 <*> MyJust 5
                `shouldBe` MyJust 7
            MyJust (+2) <*> MyJust 5
                `shouldBe` MyJust 7
        it "works for Monad" $ do
            return 2 `shouldBe` MyJust 2
            ((MyJust 10) >>= (\x -> (MyJust (x - 2))))
                `shouldBe` MyJust 8
            (MyNothing >>= (\x -> (MyJust (x - 2))))
                `shouldBe` MyNothing
            ((MyJust 10) >>= \_ -> (MyNothing :: MyMaybe Int))
                `shouldBe` MyNothing
