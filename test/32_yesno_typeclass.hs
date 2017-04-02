import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

{-
    Simulate the JavaScript behavior,
    where if (0) or if ("") if ("WHAT") works.
-}

class YesNo a where
    yesno :: a -> Bool

{- Define some instances -}
instance YesNo Int where
    yesno 0 = False
    yesno _ = True

instance YesNo [a] where
    yesno [] = False
    yesno _  = True

instance YesNo Bool where
    yesno = id

instance YesNo (Maybe a) where
    yesno (Just _) = True
    yesno Nothing = False

data TrafficLight = Red | Yellow | Green deriving (Eq)

instance YesNo TrafficLight where
    yesno Red = False
    yesno _ = True

yesnoIf :: (YesNo y) => y -> a -> a -> a
yesnoIf yesnoVal yesResult noResult
    | yesno yesnoVal = yesResult
    | otherwise = noResult

main :: IO()
main = hspec $ do
    describe "Yes/No typeclass" $ do
        it "works with Bool fields" $ do
            yesno False `shouldBe` False
        it "works with Ints" $ do
            yesno (0 :: Int) `shouldBe` False
            yesno (1 :: Int) `shouldBe` True
        it "works with Lists" $ do
            yesno [] `shouldBe` False
            yesno [3,4] `shouldBe` True
        it "works the type TrafficLight" $ do
            yesno Red `shouldBe` False
            yesno Green `shouldBe` True
        it "can do a conditional with yesno" $ do
            yesnoIf Red "true" "false" `shouldBe` "false"
            yesnoIf [] 1 2 `shouldBe` 2
            yesnoIf (Just 500) "YEAH!" "NO" `shouldBe` "YEAH!"
