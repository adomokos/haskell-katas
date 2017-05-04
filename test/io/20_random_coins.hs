{-
    Simulate 3 random coin toss
-}
import System.Random

threeCoins :: StdGen -> (Bool, Bool, Bool)
threeCoins gen =
    let (firstCoin, newGen) = random gen
        (secondCoin, newGen') = random newGen
        (thirdCoin, newGen'') = random newGen'
    in (firstCoin, secondCoin, thirdCoin)

main = do
    let (a,b,c) = threeCoins (mkStdGen 943)
        response = "First coin: " ++ show a ++
                   " second coin: " ++ show b ++
                   " third coin: " ++ show c
    putStrLn response
