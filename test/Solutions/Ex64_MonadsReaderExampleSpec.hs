module Solutions.Ex64_MonadsReaderExampleSpec
  ( spec
  ) where

import Test.Hspec

-- https://blog.ssanj.net/posts/2014-09-23-A-Simple-Reader-Monad-Example.html
import Control.Monad.Reader

main :: IO ()
main = hspec spec

-- get the env from the Reader
-- return the env and " This is Tom."
tom :: Reader String String
tom = do
  env <- ask -- gives you the environment which in this case is a String
  return (env ++ " This is Tom.")

-- same here, get the env from Reader
-- return the env and " This is Jerry."
jerry :: Reader String String
jerry = do
  env <- ask
  return (env ++ " This is Jerry.")

-- call tom and jerry, return their result separate with "\n"
tomAndJerry :: Reader String String
tomAndJerry = do
  t <- tom
  j <- jerry
  return (t ++ "\n" ++ j)

-- entry function, call it with "Who is this?"
runJerryRun :: String
runJerryRun = runReader tomAndJerry "Who is this?"

spec :: Spec
spec =
  describe "Monad Reader" $
  it "can decuple function from global info" $ do
    let result = "Who is this? This is Tom.\nWho is this? This is Jerry."
    runJerryRun `shouldBe` result
