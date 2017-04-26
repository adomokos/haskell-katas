{-
    forever from Control.Monad will repeat the IO action forever
    1. Read in line
    2. Make it upper cased
-}
import Control.Monad
import Data.Char

main = forever $ do
    putStr "Give me some input: "
    l <- getLine
    putStrLn $ map toUpper l
