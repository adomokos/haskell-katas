{-
    Get arguments from the command line
 -}

import System.Environment
import Data.List

main = do
    args <- getArgs
    progName <- getProgName
    putStrLn "The arguments are:"
    mapM putStrLn args
    putStr "The program name is: "
    putStrLn progName
