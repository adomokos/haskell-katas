{-
    Read a non-existing file
-}
import System.Environment
import System.IO
import Control.Exception

main = toTry `catch` handler

toTry :: IO ()
toTry = do
    (fileName:_) <- getArgs
    contents <- readFile fileName
    putStrLn $ "The file has " ++ show (length (lines contents)) ++ " lines!"

handler :: IOError -> IO ()
handler e = putStrLn "Whoops, had some trouble!"
