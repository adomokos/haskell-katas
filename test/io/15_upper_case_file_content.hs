{-
    Read the file content, make it upper-cased, write it out.
-}

import System.IO
import Data.Char

main = do
    contents <- readFile "test/io/girlfriend.txt"
    writeFile "test/io/girlfriendcaps.txt" (map toUpper contents)
