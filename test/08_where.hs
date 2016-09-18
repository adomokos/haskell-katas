import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

bmiTell :: (Ord a, Fractional a) => a -> a -> String
bmiTell weight height
    | bmi <= skinny = "You're underweight, you emo, you!"
    | bmi <= normal = "You're supposedly normal."
    | bmi <= fat = "You're fat! Lose some weight!"
    | otherwise   = "You're a whale, congratulations!"
    where bmi = weight / height ^ 2
          (skinny, normal, fat) = (18.5, 25.0, 30.0)
          {- skinny = 18.5 -}
          {- normal = 25.0 -}
          {- fat = 30.0 -}

initials :: String -> String -> String
initials "" "" = ""
initials (f:firstname) (l:lastname) = [f,l]

calcBmis :: Fractional t => [(t, t)] -> [t]
calcBmis xs = [bmi w h | (w, h) <- xs]
    where bmi weight height = weight / height ^ 2

main :: IO()
main = hspec $ do
    describe "where - to DRY up logic" $ do
        it "can calculate BMI from values" $ do
            bmiTell 85 1.90 `shouldBe` "You're supposedly normal."
        it "can extract initials from a string" $ do
            initials "" "" `shouldBe` ""
            initials "Attila" "Domokos" `shouldBe` "AD"
        it "can be used in list comprehensions" $ do
            calcBmis [(85, 1.90)] `shouldBe` [23.545706371191137]
