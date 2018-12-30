module Ex50_MonadsCalculateAgeFromDatesSpec
  ( spec
  ) where

-- From: http://www.snoyman.com/blog/2017/01/functors-applicatives-and-monads
-- 6. Using the short-hand <$>
import Test.Hspec
import Test.QuickCheck
import Text.Read (readMaybe)

main :: IO ()
main = hspec spec

displayAge :: Maybe Int -> String
displayAge maybeAge =
  case maybeAge of
    Nothing -> "Provided invalid year"
    Just age -> "In that year you'll be " ++ show age

yearDiff :: Int -> Int -> Int
yearDiff futureYear birthYear = futureYear - birthYear

-- use only case statements
withReadMaybes :: String -> String -> Maybe Int
withReadMaybes birth future =
  case readMaybe birth of
    Nothing -> Nothing
    Just birth ->
      case readMaybe future of
        Nothing -> Nothing
        Just future -> Just (future - birth)

spec :: Spec
spec =
  describe "Calculate age from two dates" $ do
    it "calculates age with readMaybes" $ do
      birthYearString <- pure "1980"
      futureYearString <- pure "2021"
      let maybeAge = withReadMaybes birthYearString futureYearString
      displayAge maybeAge `shouldBe` "In that year you'll be 41"
    it "calculates age with do notation" $ do
      birthYearString <- pure "1980"
      futureYearString <- pure "2021"
      let maybeAge = do
            birthYear <- readMaybe birthYearString
            futureYear <- readMaybe futureYearString
            return $ yearDiff futureYear birthYear
      displayAge maybeAge `shouldBe` "In that year you'll be 41"
    it "calculates age with fmap" $ do
      birthYearString <- pure "1980"
      futureYearString <- pure "2021"
      let maybeAge = do
            yearToAge <- fmap yearDiff (readMaybe futureYearString)
            birthYear <- readMaybe birthYearString
            return $ yearToAge birthYear
      displayAge maybeAge `shouldBe` "In that year you'll be 41"
    it "calculates age with two fmaps" $ do
      birthYearString <- pure "1980"
      futureYearString <- pure "2021"
      let maybeAge = do
            yearToAge <- fmap yearDiff (readMaybe futureYearString)
            fmap yearToAge (readMaybe birthYearString)
      displayAge maybeAge `shouldBe` "In that year you'll be 41"
    it "calculates age with functor" $ do
      birthYearString <- pure "1980"
      futureYearString <- pure "2021"
      let maybeAge =
            fmap yearDiff (readMaybe futureYearString) <*>
            readMaybe birthYearString
      displayAge maybeAge `shouldBe` "In that year you'll be 41"
    it "calculates age with functors and applicative" $ do
      birthYearString <- pure "1980"
      futureYearString <- pure "2021"
      let maybeAge =
            yearDiff <$> readMaybe futureYearString <*>
            readMaybe birthYearString
      displayAge maybeAge `shouldBe` "In that year you'll be 41"
    it "can autocorrect the calculation" $ do
      birthYearString <- pure "2021"
      futureYearString <- pure "1980"
      let maybeAge = do
            futureYear <- readMaybe futureYearString
            birthYear <- readMaybe birthYearString
                    {- check if the futureYear is less than birthyear, autocorrect -}
            return $
              if futureYear < birthYear
                then yearDiff birthYear futureYear
                else yearDiff futureYear birthYear
      displayAge maybeAge `shouldBe` "In that year you'll be 41"
