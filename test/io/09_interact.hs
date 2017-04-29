{-
    Getting string from the input, transforming it with a function
    and then outputting is so common, that `interact` was added.
    interact :: (String -> String) -> IO ()
-}

main = interact shortLinesOnly

shortLinesOnly :: String -> String
shortLinesOnly input =
    let allLines = lines input
        shortLines = filter (\line -> length line < 10) allLines
        result = unlines shortLines
    in result

{-
    It can be further simplified:
    main = interact $ unlines . filter ((<10) . length). lines
-}
