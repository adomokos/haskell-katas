import Test.Hspec

import qualified Katas.Lists.ExtractingSpec
import qualified Katas.Lists.ComprehensionsSpec
import qualified Katas.Lists.RangesSpec
import qualified Katas.Lists.TuplesSpec
import qualified Katas.Types.IntroSpec
import qualified Katas.Types.MakingTypesSpec
import qualified Katas.Types.RecordSpec
import qualified Katas.Types.TypeParametersSpec
import qualified Katas.Types.DerivedInstancesSpec
import qualified Katas.Types.MoreDerivedInstancesSpec
import qualified Katas.Types.AliasingSpec
import qualified Katas.Types.RecursiveDataStructuresSpec
import qualified Katas.Types.MoreTypeClassesSpec
import qualified Katas.Types.YesNoTypeClassSpec
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
import qualified Katas.Modules.MapFunctionalitySpec
import qualified Katas.Modules.MapFunctionsSpec
import qualified Katas.Modules.SetFunctionsSpec
import qualified Katas.Fam.FunctorTypeClassSpec
import qualified Katas.Fam.FmapFunctionCompositionSpec
import qualified Katas.Fam.FmapReplicateSpec
import qualified Katas.Fam.FunctorLawsSpec
import qualified Katas.Fam.ApplicativesSpec
import qualified Katas.Fam.MoreApplicativesSpec
import qualified Katas.Fam.NewTypeSpec
import qualified Katas.Fam.MonoidsSpec
import qualified Katas.Fam.OrderingMonoidsSpec
import qualified Katas.Fam.MaybeMonoidsSpec
import qualified Katas.Fam.FoldableSpec
import qualified Katas.Exercises.RPNCalculatorSpec
import qualified Katas.Exercises.LondonToHeathrowSpec

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
    describe "21 - Modules - Map Functionality" Katas.Modules.MapFunctionalitySpec.spec
    describe "22 - Modules - Map Functions" Katas.Modules.MapFunctionsSpec.spec
    describe "23 - Modules - Set Functions" Katas.Modules.SetFunctionsSpec.spec
    describe "24 - Types - Making Types" Katas.Types.MakingTypesSpec.spec
    describe "25 - Types - Records" Katas.Types.RecordSpec.spec
    describe "26 - Types - Type Parameters" Katas.Types.TypeParametersSpec.spec
    describe "27 - Types - Derived Instances" Katas.Types.DerivedInstancesSpec.spec
    describe "28 - Types - More Derived Instances" Katas.Types.MoreDerivedInstancesSpec.spec
    describe "29 - Types - Aliasing" Katas.Types.AliasingSpec.spec
    describe "30 - Types - Recursive Data Structures" Katas.Types.RecursiveDataStructuresSpec.spec
    describe "31 - Types - More Type Classes" Katas.Types.MoreTypeClassesSpec.spec
    describe "32 - Types - YesNo Type Class" Katas.Types.YesNoTypeClassSpec.spec
    describe "33 - FAM - Functor Type Class" Katas.Fam.FunctorTypeClassSpec.spec
    describe "34 - Exercises - London to Heathrow" Katas.Exercises.LondonToHeathrowSpec.spec
    describe "35 - Exercises - Reverse Polish Notation Calculator" Katas.Exercises.RPNCalculatorSpec.spec
    describe "36 - FAM - Fmap Function Composition" Katas.Fam.FmapFunctionCompositionSpec.spec
    describe "37 - FAM - Fmap Replicate" Katas.Fam.FmapReplicateSpec.spec
    describe "38 - FAM - Functor Laws" Katas.Fam.FunctorLawsSpec.spec
    describe "39 - FAM - Applicatives" Katas.Fam.ApplicativesSpec.spec
    describe "40 - FAM - More Applicatives" Katas.Fam.MoreApplicativesSpec.spec
    describe "41 - FAM - New Type for fmap" Katas.Fam.NewTypeSpec.spec
    describe "42 - FAM - Monoids" Katas.Fam.MonoidsSpec.spec
    describe "43 - FAM - Ordering Monoids" Katas.Fam.OrderingMonoidsSpec.spec
    describe "44 - FAM - Maybe Monoids" Katas.Fam.MaybeMonoidsSpec.spec
    describe "45 - FAM - Foldable" Katas.Fam.FoldableSpec.spec

