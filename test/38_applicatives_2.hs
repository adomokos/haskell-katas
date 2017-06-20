import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import Control.Applicative

{-
    You can think of functions as boxes, that contain their
    eventual result.

    Applicative law: pure f <*> x = fmap f x
    In conclusion, applicative functors aren't just interesting,
    they're also useful, because they allow us to combine different
    computations, such as I/O computations, non-deterministic computations,
    computations that might have failed, etc. by using the applicative style.
-}

sequenceA' :: (Applicative f) => [f a] -> f [a]
{- sequenceA' [] = pure [] -}
{- sequenceA' (x:xs) = (:) <$> x <*> sequenceA' xs -}
sequenceA' = foldr (liftA2 (:)) (pure [])

main :: IO ()
main = hspec $ do
    describe "Applicative" $ do
        it "works with IO ()" $ do
            combined <- ((++) <$> return "hello" <*> return "world")
            combined `shouldBe` "helloworld"
        it "works with combination of functions" $ do
            ((+) <$> (+3) <*> (*100) $ 5)
                `shouldBe` 508
        it "works with lambdas" $ do
            ((\x y z -> [x,y,z]) <$> (+3) <*> (*2) <*> (/2) $ 5)
                `shouldBe` [8.0,10.0,2.5]
        it "works with zipList" $ do
            (getZipList $ (+) <$> ZipList [1,2,3] <*> ZipList [100,100,100])
                `shouldBe` [101,102,103]
        it "applies a function between two applicatives" $ do
            fmap (\x -> [x]) (Just 4) `shouldBe` Just [4]
            liftA2 (:) (Just 3) (Just [4]) `shouldBe` Just [3,4]
            ((:) <$> Just 3 <*> Just [4]) `shouldBe` Just [3,4]
        it "can create a sequence" $ do
            sequenceA' [Just 3, Just 2, Just 1]
                `shouldBe` Just [3,2,1]
            sequenceA' [Just 3, Nothing, Just 1]
                `shouldBe` Nothing
            sequenceA' [(+3),(+2),(+1)] 3
                `shouldBe` [6,5,4]
        it "can tell if a number satisfies all the predicates in a list" $ do
            map (\f -> f 7) [(>4),(<10),odd]
                `shouldBe` [True,True,True]
            (and $ map (\f -> f 7) [(>4),(<10),odd])
                `shouldBe` True

