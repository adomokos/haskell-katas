{-
    withFile :: FilePath -> (Handle -> IO a) -> IO a
-}
import System.IO

main = do
    withFile "test/io/girlfriend.txt" ReadMode (\handle -> do
        contents <- hGetContents handle
        putStr contents)
