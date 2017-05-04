{-
    Generate 10 random characters,
    which are the same random number every time we call it,
    as it's using a static generator
 -}
import System.Random

generateRandomChars :: String
generateRandomChars =
    take 10 $ randomRs ('a','z') (mkStdGen 3) :: String

main = do
    putStrLn $ "The generated random string: " ++ generateRandomChars
