module Ex24_TypesMakingTypesSpec (spec) where

import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec spec

-- Shape type should have Circle (3 args) and Rectangle (4 args) data constructors
data Shape = Circle Float Float Float | Rectangle Float Float Float Float deriving (Show, Eq)

-- Create the Point type, with a Point data constructor that uses 2 args
-- Use the Point for Circle and Rectangle
data Point = Point Float Float deriving (Show, Eq)
data Shape' = Circle' Point Float | Rectangle' Point Point deriving (Show, Eq)

surface :: Shape -> Float
surface (Circle x y r) = r^2 * pi
surface (Rectangle a b c d) = (c-a) * (d-b)

surface' :: Shape' -> Float
surface' (Circle' _ r) = r^2 * pi
surface' (Rectangle' (Point a b) (Point c d)) = (c-a) * (d-b)

nudge :: Shape' -> Float -> Float -> Shape'
nudge (Circle' (Point x y) r) m n = (Circle' (Point (x+m) (y+n)) r)
nudge (Rectangle' (Point a b) (Point c d)) x y =
  (Rectangle' (Point (a+x) (b+y)) (Point (c+x) (d+y)))

baseCircle :: Float -> Shape'
baseCircle r = (Circle' (Point 0 0) r)

baseRectangle :: Float -> Float -> Shape'
baseRectangle x y = (Rectangle' (Point 0 0) (Point x y))

spec :: Spec
spec = do
  describe "Custom Types" $ do
    it "can calculate surface for two types" $ do
      (surface $ Circle 10 20 10) `shouldBe` 314.15927
      (surface $ Rectangle 0 0 100 100)
        `shouldBe` 10000.0
      (surface $ Rectangle (-10) 0 100 100)
        `shouldBe` 11000.0
      (surface $ Rectangle 0 0 (-100) (-100))
        `shouldBe` 10000.0
    it "can print out the Shape by adding Show" $ do
      Circle 10 20 5 `shouldBe` Circle 10.0 20.0 5.0
    it "can use Value constructors as functions" $ do
      -- Use map function here
      map (Circle 10 20) [4,5]
        `shouldBe` [Circle 10.0 20.0 4.0, Circle 10.0 20.0 5.0]
    it "can calculate surface for two types with Points" $ do
      (surface' $ Circle' (Point 10 20) 10) `shouldBe` 314.15927
      (surface' $ Rectangle' (Point 0 0) (Point 100 100))
        `shouldBe` 10000.0
    it "can nudge a Shape, still holding its dimension" $ do
      (nudge (Circle' (Point 0 0) 3) 2 4)
        `shouldBe` Circle' (Point 2.0 4.0) 3.0
      (nudge (Rectangle' (Point 0 0) (Point 4 4)) 2 4)
        `shouldBe` Rectangle' (Point 2.0 4.0) (Point 6.0 8.0)
    it "can nudge a Shape starting with base shapes" $ do
      (nudge (baseCircle 3) 2 4)
        `shouldBe` Circle' (Point 2.0 4.0) 3.0
      (nudge (baseRectangle 4 4)) 2 4
        `shouldBe` Rectangle' (Point 2.0 4.0) (Point 6.0 8.0)
