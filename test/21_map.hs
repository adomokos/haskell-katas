import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

phoneBook = 
    [("betty","555-2938")
    ,("bonnie","452-2928")
    ,("patsy","493-2928")
    ,("lucille","205-2928")
    ,("wendy","939-8282")
    ,("penny","853-2492")
    ]

{- findKey :: (Eq k) => k -> [(k,v)] -> v -}
{- findKey key xs = snd . head . filter (\(k,v) -> key == k) $ xs -}
{- findKey :: (Eq k) => k -> [(k,v)] -> Maybe v -}
{- findKey key [] = Nothing -}
{- findKey key ((k,v):xs) = if key == k -}
                            {- then Just v -}
                            {- else findKey key xs -}

findKey :: (Eq k) => k -> [(k,v)] -> Maybe v
findKey key = foldr (\(k,v) acc -> if key == k then Just v else acc) Nothing

main :: IO()
main = hspec $ do
    describe "Map functions" $ do
        it "can look up by keys" $ do
            {- findKey "bonnie" phoneBook `shouldBe` "452-2928" -}
            findKey "bonnie" phoneBook `shouldBe` Just "452-2928"
            findKey "bonn" phoneBook `shouldBe` Nothing
