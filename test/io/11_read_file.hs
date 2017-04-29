{-
    Reads a file and points out its content
-}
import System.IO

main = do
    handle <- openFile "test/io/girlfriend.txt" ReadMode
    contents <- hGetContents handle
    putStr contents
    hClose handle
