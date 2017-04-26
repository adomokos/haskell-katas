{-
    1. Create a method greet that takes name
       and prints "Hello, John!"
    2. Capture the name from main and call the greet method
-}

greet :: String -> String
greet name = "Hello, " ++ name ++ "!"

main = do
    putStrLn "Hello, what's your name?"
    name <- getLine
    putStrLn (greet name)
