module Katas.Monads.StatefulComputationsSpec (spec) where

import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import Control.Monad.State

type Stack = [Int]

pop :: Stack -> (Int, Stack)
pop (x:xs) = (x,xs)

push :: Int -> Stack -> ((), Stack)
push a xs = ((),a:xs)

stackManip :: Stack -> (Int, Stack)
stackManip stack = let
    ((), newStack1) = push 3 stack
    (a, newStack2) = pop newStack1
    in pop newStack2

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
pop' = state $ \(x:xs) -> (x, xs)

push' :: Int -> State Stack ()
push' a = state $ \xs -> ((),a:xs)

stackManip' :: State Stack Int
{- stackManip' = do -}
    {- push' 3 -}
    {- pop' -}
    {- pop' -}
stackManip' = return [] >> push' 3 >> pop' >> pop'


stackStuff :: State Stack ()
stackStuff = do
    a <- pop'
    if a == 5
       then push' 5
       else do
           push' 3
           push' 8

moreStack :: State Stack ()
moreStack = do
    a <- stackManip'
    if a == 100
       then stackStuff
       else return ()

main :: IO ()
main = hspec spec

spec :: Spec
spec =
    describe "Stateful Computations" $ do
        it "can operate on a stack" $
            stackManip [5,8,2,1] `shouldBe` (5,[8,2,1])
        it "can operate with State on stack" $
            runState stackManip' [5,8,2,1] `shouldBe` (5,[8,2,1])
        it "can run conditional logic with Monads"$ do
            runState stackStuff [9,0,2,1,0] `shouldBe` ((),[8,3,0,2,1,0])
            runState stackStuff [5,0,2,1,0] `shouldBe` ((),[5,0,2,1,0])
        it "can weave other functions with State" $
            runState moreStack [5,8,2,1] `shouldBe` ((),[8,2,1])
