import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

{- data Shape = Circle Float Float Float | Rectangle Float Float Float Float -}
    {- deriving (Show) -}

{- surface :: Shape -> Float -}
{- surface (Circle _ _ r) = pi * r ^ 2 -}
{- surface (Rectangle x1 y1 x2 y2) = (abs $ x2 - x1) * (abs $ y2 - y1) -}

data Point = Point Float Float deriving (Show)
data Shape = Circle Point Float | Rectangle Point Point deriving (Show)

surface :: Shape -> Float
surface (Circle _ r) = pi * r ^ 2
surface (Rectangle (Point x1 y1) (Point x2 y2)) =
    (abs $ x2 - x1) * (abs $ y2 - y1)

nudge :: Shape -> Float -> Float -> Shape
nudge (Circle (Point x y) r) a b =
    Circle (Point (x+a) (y+b)) r
nudge (Rectangle (Point x1 y1) (Point x2 y2)) a b =
    Rectangle (Point (x1+a) (y1+b)) (Point (x2+a) (y2+b))

baseCircle :: Float -> Shape
baseCircle r = Circle (Point 0 0) r

baseRectangle :: Float -> Float -> Shape
baseRectangle width height =
    Rectangle (Point 0 0) (Point width height)

main :: IO()
main = hspec $ do
    describe "Custom Types" $ do
        {- it "can calculate surface for two types" $ do -}
            {- (surface $ Circle 10 20 10) `shouldBe` 314.15927 -}
            {- (surface $ Rectangle 0 0 100 100) -}
                {- `shouldBe` 10000.0 -}
        {- it "can print out the Shape by adding Show" $ do -}
            {- (show $ Circle 10 20 5) `shouldBe` "Circle 10.0 20.0 5.0" -}
        {- it "can use Value constructors as functions" $ do -}
            {- (map show $ map (Circle 10 20) [4,5]) -}
                {- `shouldBe` ["Circle 10.0 20.0 4.0", "Circle 10.0 20.0 5.0"] -}
        it "can calculate surface for two types with Points" $ do
            (surface $ Circle (Point 10 20) 10) `shouldBe` 314.15927
            (surface $ Rectangle (Point 0 0) (Point 100 100))
                `shouldBe` 10000.0
        it "can nudge a Shape, still holding its dimension" $ do
           (show $ (nudge (Circle (Point 0 0) 3) 2 4))
                `shouldBe` "Circle (Point 2.0 4.0) 3.0"
           (show $ (nudge (Rectangle (Point 0 0) (Point 4 4)) 2 4))
                `shouldBe` "Rectangle (Point 2.0 4.0) (Point 6.0 8.0)"
        it "can nudge a Shape starting with base shapes" $ do
           (show $ (nudge (baseCircle 3) 2 4))
                `shouldBe` "Circle (Point 2.0 4.0) 3.0"
           (show $ (nudge (baseRectangle 4 4)) 2 4)
                `shouldBe` "Rectangle (Point 2.0 4.0) (Point 6.0 8.0)"
