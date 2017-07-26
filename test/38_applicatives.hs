import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

{-
    functor definition
    class (Functor f) => Applicative f where
        pure :: a -> f a
        (<*>) :: f (a -> b) -> f a -> f b

    Applicative instance implementation for Maybe
    instance Applicative Maybe where
        pure = Just
        Nothing <*> _ = Nothing
        (Just f) <*> something = fmap f something

    (<$>) :: (Functor f) => (a -> b) -> f a -> f b
    f <$> x = fmap f x
-}

main :: IO ()
main = hspec $ do
    describe "Applicative" $ do
        it "applies function inside the Just" $ do
            pending
            {- (fmap (___)) (fmap (_) (Just 3)) -}
                {- `shouldBe` (Just _) -}
            {- __ <$> ___ <*> (Just 3) `shouldBe` (Just 6) -}
        it "applies function in list" $ do
            pending
            {- let a = fmap __ ____ -}
            {- fmap (\f -> f 9) a `shouldBe` [9,18,27,36] -}
        it "works with Maybe" $ do
            pending
            {- ___ ___<*> Just 9 -}
                {- `shouldBe` Just 12 -}
            {- pure (__) <*> Just __ -}
                {- `shouldBe` Just 13 -}
            {- Just (++"hahah") <*> ___ -}
                {- `shouldBe` Nothing -}
            {- ___ <*> Just "woot" -}
                {- `shouldBe` (Nothing :: Maybe String) -}
        it "operates on several functors with a single function" $ do
            pending
            {- pure (__) <*> Just __ <*> Just 5 -}
                {- `shouldBe` Just 8 -}
            {- pure (+) <*> Just __ <*> ___ -}
                {- `shouldBe` (Nothing :: Maybe Int) -}
        it "can use <$> as fmap with an infix operator" $ do
            pending
            {- (__) <$> Just ___  <*> Just "volta" -}
                {- `shouldBe` Just "johntravolta" -}
            {- (__) "johntra" "" `shouldBe` "johntravolta" -}
        it "works with a list of functions" $ do
            pending
            {- [] <*> [1,2,3] -}
                {- `shouldBe` [0,0,0,101,102,103,1,4,9] -}
            {- [(_),(_)] <*> [1,2] <*> [3,4] -}
                {- `shouldBe` [4,5,5,6,3,4,6,8] -}
        it "can be used as a replacement for list comprehensions" $ do
            pending
            {- example...
            [x*y | x <- [2,5,10], y <- [8,10,11]]
                `shouldBe` [16,20,22,40,50,55,80,100,110] -}
            {- (__) <$> [___] <*> [___] -}
                {- `shouldBe` [16,20,22,40,50,55,80,100,110] -}
            -- Keep only the values that are greater than 50 of the product
            {- (filter (___) $ (_) <$> [2,5,10] <*> [8,10,11]) -}
                {- `shouldBe` [55,80,100,110] -}
