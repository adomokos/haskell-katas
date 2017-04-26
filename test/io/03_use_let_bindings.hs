
{-
    Using let bindings
    Capture firstName and lastName
    Make them upper cased and print them with this text:
    "hey JOHN SMITH, how are you?"
-}

import Data.Char

main = do
    putStrLn "What's your first name?"
    firstName <- getLine
    putStrLn "What's your last name?"
    lastName <- getLine
    let bigFirstName = map toUpper firstName
        bigLastName = map toUpper lastName
    putStrLn $ "hey " ++ bigFirstName ++ " " ++
                bigLastName ++ ", how are you?"
