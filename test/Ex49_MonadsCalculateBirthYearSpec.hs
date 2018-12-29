module Ex49_MonadsCalculateBirthYearSpec (spec) where

import Test.Hspec
import Test.QuickCheck
import Text.Read (readMaybe)

{-
    Calculate how old will someone be by the year 2020
    Use just `read` to convert String -> Int
-}

main :: IO ()
main = hspec spec

{- calculateAge :: String -> Int -}

-- when nothing - "Provided invalid year"
-- when value - "In 2020 you'll be x"
{- displayAge :: Maybe Int -> String -}

-- uses readMaybe to parse the string
-- calls yearToAge for real value
{- convertAgeFromString :: String -> Maybe Int -}

yearToAge :: Int -> Int
yearToAge year = 2020 - year

spec :: Spec
spec = do
    describe "Calculate Birth Year 01" $ do
        it "calculates age with read" $ do
            pending
            {- birthYear <- pure "1980" -}
            {- (2020 - ___ ___) `shouldBe` 40 -}
        it "calculates age with readMaybe" $ do
            pending
            -- calculateAge should use case of
            {- birthYear <- pure "1980" -}
            {- calculateAge birthYear `shouldBe` 40 -}
            {- birthYear <- pure "" -}
            {- calculateAge birthYear `shouldBe` 0 -}
        it "uses separate functions" $ do
            pending
            {- birthYear <- pure "1980" -}
            {- let maybeAge = convertAgeFromString birthYear -}
            {- displayAge maybeAge `shouldBe` "In 2020 you'll be 40" -}
            {- birthYear <- pure "" -}
            {- let maybeAge = convertAgeFromString birthYear -}
            {- displayAge maybeAge `shouldBe` "Provided invalid year" -}
        it "uses fmap, no need for convert fn" $ do
            pending
            {- birthYear <- pure "1980" -}
            {- let maybeAge = ___ yearToAge (___ ___) -}
            {- displayAge maybeAge `shouldBe` "In 2020 you'll be 40" -}
            {- birthYear <- pure "" -}
            {- let maybeAge = ___ ___ (___ ___) -}
            {- displayAge maybeAge `shouldBe` "Provided invalid year" -}
        it "works with do notation" $ do
            pending
            {- birthYear <- pure "1980" -}
            {- let maybeAge = do -}
                {- yearInteger <- ___ ___ -}
                {- return $ ___ ___ -}
            {- displayAge maybeAge `shouldBe` "In 2020 you'll be 40" -}





