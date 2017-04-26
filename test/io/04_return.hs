{-
    1. Create a function that reverses words
    2. Gather that as input
    3. Quit with <ENTER>
-}

reverseWords :: String -> String
reverseWords = unwords . map reverse . words

main = do
    putStrLn "Type a word or two"
    line <- getLine
    if null line
        then return ()
        else do
            putStrLn $ reverseWords line
            main
