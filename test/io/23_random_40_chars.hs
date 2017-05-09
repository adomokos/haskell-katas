{-
    Generate random 40 chars as 2 sets of 20s
-}
import System.Random
import Data.List

main = do
    gen <- getStdGen
    putStrLn $ take 20 (randomRs ('a','z') gen)
    gen' <- newStdGen
    putStrLn $ take 20 (randomRs ('a','z') gen')

{- Another way to solve it -}
{- main = do -}
    {- gen <- getStdGen -}
    {- let randomChars = randomRs ('a', 'z') gen -}
        {- (first20, rest) = splitAt 20 randomChars -}
        {- (second20, _) = splitAt 20 rest -}
    {- putStrLn first20 -}
    {- putStrLn second20 -}
