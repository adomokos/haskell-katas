import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

data Day = Monday | Tuesday | Wednesday
    | Thursday | Friday | Saturday | Sunday
        deriving (Eq, Ord, Show, Read, Bounded, Enum)

main :: IO()
main = hspec $ do
    describe "Derived Instances" $ do
        it "can compare two Bool fields" $ do
            True `compare` False `shouldBe` GT
            True > False `shouldBe` True
            True < False `shouldBe` False
        it "can compare Maybe values" $ do
            Nothing < Just 100 `shouldBe` True
            Nothing > Just (-49999) `shouldBe` False
            Just 3 `compare` Just 2 `shouldBe` GT
        it "can be part of Enum typeclass as all value constructors are nullary" $ do
            {- Enums have predecessors and successors -}
            show Wednesday `shouldBe` "Wednesday"
            read "Saturday" `shouldBe` Saturday
        it "can be compared as it's part of Eq and Ord type classes" $ do
            Saturday == Sunday `shouldBe` False
            Monday == Monday `shouldBe` True
            Monday < Wednesday `shouldBe` True
            Monday `compare` Tuesday `shouldBe` LT
        it "is also part of Bounded, can get lowest and highest value" $ do
            (minBound :: Day) `shouldBe` Monday
            (maxBound :: Day) `shouldBe` Sunday
        it "is an instance of Enum, can get predecessor and successors" $ do
            succ Monday `shouldBe` Tuesday
            pred Saturday `shouldBe` Friday
            evaluate (pred Monday) `shouldThrow` anyErrorCall

