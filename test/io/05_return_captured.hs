{-
    1. Return "hell" and "yeah!" into 2 vars
    2. Print it
-}
main = do
    a <- return "hell"
    b <- return "yeah!"
    putStrLn $ a ++ " " ++ b
-}
