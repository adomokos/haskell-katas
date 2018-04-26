module Katas.Monads.StatefulComputationsSpec (spec) where

import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import Control.Monad.State

type Stack = [Int]

pop :: Stack -> (Int, Stack)
pop (x:xs) = undefined

push :: Int -> Stack -> ((), Stack)
push a xs = undefined

stackManip :: Stack -> (Int, Stack)
stackManip stack = undefined

{-
    Managing the state by ourselves is tedious.
    Woudln't it be nice to express this, where the state
    is managed for us?

    stackManip = do
        push 3
        a <- pop
        pop

    Enter the State monad:
    newType State s a = state { runState :: s -> (a, s) }

    instance Monad (State s) where
        return x = state $ \s -> (x,s)
        (State h) >>= f = state $ \s -> let (a, newState) = h s
                                            (State g) = f a
                                        in g newState
-}

pop' :: State Stack Int
pop' = undefined

push' :: Int -> State Stack ()
push' _ = undefined

stackManip' :: State Stack Int
{- stackManip' = do -}
    {- push' 3 -}
    {- pop' -}
    {- pop' -}
stackManip' = undefined


stackStuff :: State Stack ()
stackStuff = undefined

moreStack :: State Stack ()
moreStack = undefined

main :: IO ()
main = hspec spec

spec :: Spec
spec =
    describe "Stateful Computations" $ do
        it "can operate on a stack" $
            pending
            {- stackManip [5,8,2,1] `shouldBe` (5,[8,2,1]) -}
        it "can operate with State on stack" $
            pending
            {- runState stackManip' [5,8,2,1] `shouldBe` (5,[8,2,1]) -}
        it "can run conditional logic with Monads"$ do
            pending
            {- runState stackStuff [9,0,2,1,0] `shouldBe` ((),[8,3,0,2,1,0]) -}
            {- runState stackStuff [5,0,2,1,0] `shouldBe` ((),[5,0,2,1,0]) -}
        it "can weave other functions with State" $
            pending
            {- runState moreStack [5,8,2,1] `shouldBe` ((),[8,2,1]) -}
