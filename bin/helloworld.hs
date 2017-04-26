{- main = putStrLn "hello, world" -}

{-
greet :: String -> String
greet name = "Hello, " ++ name ++ "!"

main = do
    putStrLn "Hello, what's your name?"
    name <- getLine
    putStrLn (greet name)
-}

{-
{- Using let bindings -}
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
-}

{-
{- return -}
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
-}

{-
{- return result is thrown away -}
main = do
    return ()
    return "HAHAHA"
    line <- getLine
    return "BLAH BLAH BLAH"
    return 4
    putStrLn line
-}

{-
{- return's result is captured -}
main = do
    a <- return "hell"
    b <- return "yeah!"
    putStrLn $ a ++ " " ++ b
-}

{-
{- Reads only when enter key is hit -}
main = do
    c <- getChar
    if c /= ' '
        then do
            putChar c
            main
        else return ()
-}

{-
import Control.Monad

main = do
    c <- getChar
    when (c /= ' ') $ do
        putChar c
        main
-}

{-
{- This -}
main = do
    a <- getLine
    b <- getLine
    c <- getLine
    print [a,b,c]
-}
{-
{- is the same as this: -}
main = do
    rs <- sequence [getLine, getLine, getLine]
    print rs
-}

{- forever from Control.Monad will repeat the IO action forever -}
import Control.Monad
import Data.Char

main = forever $ do
    putStr "Give me some input: "
    l <- getLine
    putStrLn $ map toUpper l
