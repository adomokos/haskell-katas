{-
    Reads a file with `readFile`
-}
import System.IO

main = do
    contents <- readFile "test/io/girlfriend.txt"
    putStr contents
