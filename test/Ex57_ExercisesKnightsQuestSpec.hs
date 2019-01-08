module Ex57_ExercisesKnightsQuestSpec
  ( spec
  ) where

import Control.Exception (evaluate)
import Control.Monad
import Test.Hspec

main :: IO ()
main = hspec spec

type KnightPos = (Int, Int)

{-
    These are all the different moves a knight can make on a chess board
    [(c+2,r-1),(c+2,r+1),(c-2,r-1),(c-2,r+1)
    ,(c+1,r-2),(c+1,r+2),(c-1,r-2),(c-1,r+2)]
-}

moveKnight :: KnightPos -> [KnightPos]
moveKnight (c, r) = do
  (c', r') <-
    [ (c + 2, r - 1)
    , (c + 2, r + 1)
    , (c - 2, r - 1)
    , (c - 2, r + 1)
    , (c + 1, r - 2)
    , (c + 1, r + 2)
    , (c - 1, r - 2)
    , (c - 1, r + 2)
    ]
  guard (c' `elem` [1 .. 8] && r' `elem` [1 .. 8])
  return (c', r')

in3 :: KnightPos -> [KnightPos]
in3 pos = pure pos >>= moveKnight >>= moveKnight >>= moveKnight

canReachIn3 :: KnightPos -> KnightPos -> Bool
canReachIn3 start end = end `elem` in3 start

spec :: Spec
spec =
  describe "Knight's Quest" $ do
    it "can tell where the knight can move to" $ do
      moveKnight (6, 2) `shouldBe`
        [(8, 1), (8, 3), (4, 1), (4, 3), (7, 4), (5, 4)]
      moveKnight (8, 1) `shouldBe` [(6, 2), (7, 3)]
    it "checks if a position can be reached in 3 steps" $ do
      ((6, 2) `canReachIn3` (6, 1)) `shouldBe` True
      ((6, 2) `canReachIn3` (7, 3)) `shouldBe` False
