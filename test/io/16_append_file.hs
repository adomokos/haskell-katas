{-
    Appends a line to the file we already have.
-}

import System.IO

main = do
    todoItem <- getLine
    appendFile "test/io/todo.txt" (todoItem ++ "\n")
