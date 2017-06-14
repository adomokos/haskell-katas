{-
    IO is a Functor
    instance Functor IO where
        fmap f action = do
            result <- action
            return (f result)
-}

{- main = do -}
    {- putStrLn "Write something:" -}
    {- line <- fmap reverse getLine -}
    {- putStrLn $ "You said " ++ line ++ " backwards!" -}
    {- putStrLn $ "Yes, you really said " ++ line ++ " backwards!" -}
