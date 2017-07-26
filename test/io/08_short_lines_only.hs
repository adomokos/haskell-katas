{-
    Print only those lines where the length is < 10
-}

main = do
    contents <- getContents
    putStr (shortLinesOnly contents)

{- shortLinesOnly :: String -> String -}
