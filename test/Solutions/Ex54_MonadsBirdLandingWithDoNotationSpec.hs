module Solutions.Ex54_MonadsBirdLandingWithDoNotationSpec
  ( spec
  ) where

import Test.Hspec

type Birds = Int

type Pole = (Birds, Birds)

landLeft1 :: Birds -> Pole -> Pole
landLeft1 n (left, right) = (left + n, right)

landRight1 :: Birds -> Pole -> Pole
landRight1 n (left, right) = (left, right + n)

x -: f = f x

-- Improved logic with checks
landLeft :: Birds -> Pole -> Maybe Pole
landLeft n (left, right)
  | abs ((left + n) - right) < 4 = Just (left + n, right)
  | otherwise = Nothing

landRight :: Birds -> Pole -> Maybe Pole
landRight n (left, right)
  | abs (left - (right + n)) < 4 = Just (left, right + n)
  | otherwise = Nothing

banana :: Pole -> Maybe Pole
banana _ = Nothing

{-
   Starts from (0,0)
   2 lands left
   2 lands right
   1 lands left
-}
routine :: Maybe Pole
routine = do
  let start = (0, 0)
  first <- landLeft 2 start
  second <- landRight 2 first
  landLeft 1 second

{-
   Starts from (0,0)
   2 lands left
   Nothing
   2 lands right
   1 lands left
-}
routineWithFall :: Maybe Pole
routineWithFall = do
  let start = (0, 0)
  first <- landLeft 2 start
  Nothing
  second <- landRight 2 first
  landLeft 1 second

-- pattern match with <- for the first character of "hello"
justH :: Maybe Char
justH = do
  (x:xs) <- pure "hello"
  return x

-- same as above, but use Maybe empty string as input
wopwop :: Maybe Char
wopwop = do
  (x:xs) <- Just ""
  return x

spec :: Spec
spec =
  describe "Bird Landing" $ do
    it "can leverage do notation" $ routine `shouldBe` Just (3, 2)
    it "will fall when Nothing is used" $ routineWithFall `shouldBe` Nothing
    it "can use pattern match at binding" $ justH `shouldBe` Just 'h'
    it "returns Nothing when pattern matching fails" $ wopwop `shouldBe` Nothing
