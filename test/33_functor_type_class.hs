import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

{-
    Functor typeclass is for things that can be mapped over.
    This is how it's implemented:
    class Functor f where
        fmap :: (a -> b) -> f a -> f b
    f here is a type constructor
    Remember `Maybe Int` is a concrete type, `Maybe a` is type constructor.
    It takes a function from one type to the other, and a functor applied
    with one type, and functor applied with another type.

    Good old map is a functor: (a -> b) -> [a] -> [b]
    instance Functor [] where
        fmap = map
    [] is a type constructor

    Types that can act like a box can be functors

    Maybe is a functor as well:
    instance Functor Maybe where
        fmap f (Just x) = Just (f x)
        fmap f Nothing = Nothing

    Functor wants a type constructor that takes one type and not
    a concrete type.
    Only type constructors with one params can be used in functors.
-}

main :: IO()
main = hspec $ do
    describe "Functor typeclass" $ do
        it "map is a functor" $ do
            fmap (*2) [1..3] `shouldBe` [2,4,6]
            map (*2) [1..3] `shouldBe` [2,4,6]
            fmap (*3) [] `shouldBe` []
        it "works with Maybe, as it's a functor" $ do
            fmap (++ " HEY GUYS") (Just "Something serious.")
                `shouldBe` Just "Something serious. HEY GUYS"
            fmap (++ " HEY GUYS") Nothing `shouldBe` Nothing
            fmap (*2) (Just 200) `shouldBe` Just 400
            fmap (*3) Nothing `shouldBe` Nothing
