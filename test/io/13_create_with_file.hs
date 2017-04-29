{-
    withFile' :: FilePath -> (Handle -> IO a) -> IO a
-}
import System.IO

withFile' :: FilePath -> IOMode -> (Handle -> IO a) -> IO a
withFile' path mode f = do
    handle <- openFile path mode
    result <- f handle
    hClose handle
    return result

main = do
    withFile' "test/io/girlfriend.txt" ReadMode (\handle -> do
        contents <- hGetContents handle
        putStr contents)
