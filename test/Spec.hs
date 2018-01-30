import Test.Hspec

import qualified Katas.Lists.ExtractingSpec
import qualified Katas.Lists.ComprehensionsSpec
import qualified Katas.Lists.RangesSpec
import qualified Katas.Lists.TuplesSpec
import qualified Katas.Types.IntroSpec
import qualified Katas.Flow.PatternMatchingSpec
import qualified Katas.Flow.GuardsSpec
import qualified Katas.Flow.WhereSpec
import qualified Katas.Flow.LetItBeSpec
import qualified Katas.Flow.CaseExpressionSpec
import qualified Katas.Flow.RecursionsSpec
import qualified Katas.Hofs.IntroSpec
import qualified Katas.Hofs.LambdasSpec
import qualified Katas.Hofs.FoldsSpec
import qualified Katas.Hofs.ScansSpec
import qualified Katas.Hofs.FunctionApplicationSpec
import qualified Katas.Hofs.FunctionCompositionSpec
import qualified Katas.Modules.IntroSpec
import qualified Katas.Modules.ListFunctionsSpec
import qualified Katas.Modules.CharFunctionsSpec

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
    describe "01 - Extraxting Lists" Katas.Lists.ExtractingSpec.spec
    describe "02 - List Comprehensions" Katas.Lists.ComprehensionsSpec.spec
    describe "03 - Ranges" Katas.Lists.RangesSpec.spec
    describe "04 - Tuples" Katas.Lists.TuplesSpec.spec
    describe "05 - Intro to Types" Katas.Types.IntroSpec.spec
    describe "06 - Pattern Matching" Katas.Flow.PatternMatchingSpec.spec
    describe "07 - Guards" Katas.Flow.GuardsSpec.spec
    describe "08 - Where" Katas.Flow.WhereSpec.spec
    describe "09 - Let It Be" Katas.Flow.LetItBeSpec.spec
    describe "10 - Case Expressions" Katas.Flow.CaseExpressionSpec.spec
    describe "11 - Recursions" Katas.Flow.RecursionsSpec.spec
    describe "12 - Higher Order Functions (Intro)" Katas.Hofs.IntroSpec.spec
    describe "13 - Lambdas" Katas.Hofs.LambdasSpec.spec
    describe "14 - Folds" Katas.Hofs.FoldsSpec.spec
    describe "15 - Scans" Katas.Hofs.ScansSpec.spec
    describe "16 - Function Application" Katas.Hofs.FunctionApplicationSpec.spec
    describe "17 - Function Composition" Katas.Hofs.FunctionCompositionSpec.spec
    describe "18 - Modules (Intro)" Katas.Modules.IntroSpec.spec
    describe "19 - Modules - List Functions" Katas.Modules.ListFunctionsSpec.spec
    describe "20 - Modules - Char Functions" Katas.Modules.CharFunctionsSpec.spec

