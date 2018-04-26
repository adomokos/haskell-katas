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
import qualified Katas.Types.SequenceSpec
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
import qualified Katas.Fa.FunctorTypeClassSpec
import qualified Katas.Fa.FmapFunctionCompositionSpec
import qualified Katas.Fa.FmapReplicateSpec
import qualified Katas.Fa.FunctorLawsSpec
import qualified Katas.Fa.ApplicativesSpec
import qualified Katas.Fa.MoreApplicativesSpec
import qualified Katas.Fa.NewTypeSpec
import qualified Katas.Fa.MonoidsSpec
import qualified Katas.Fa.OrderingMonoidsSpec
import qualified Katas.Fa.MaybeMonoidsSpec
import qualified Katas.Fa.NewTypeMonoidSpec
import qualified Katas.Fa.FoldableSpec
import qualified Katas.Monads.CalculateBirthYearSpec
import qualified Katas.Monads.CalculateAgeFromDatesSpec
import qualified Katas.Monads.IntroSpec
import qualified Katas.Monads.BirdLandingSpec
import qualified Katas.Monads.DoNotationSpec
import qualified Katas.Monads.BirdLandingWithDoNotationSpec
import qualified Katas.Monads.ListMonadSpec
import qualified Katas.Monads.MonadPlusSpec
import qualified Katas.Monads.MonadLawsSpec
import qualified Katas.Monads.IntroToWriteMonadSpec
import qualified Katas.Monads.WriterTypeSpec
import qualified Katas.Monads.LoggingWithWriterSpec
import qualified Katas.Monads.ReaderSpec
import qualified Katas.Monads.ReaderExampleSpec
import qualified Katas.Monads.StatefulComputationsSpec
import qualified Katas.Exercises.RPNCalculatorSpec
import qualified Katas.Exercises.LondonToHeathrowSpec
import qualified Katas.Exercises.KnightsQuestSpec
import qualified Katas.Exercises.PhoneNumberCleanerSpec
import qualified Katas.Exercises.BalancedBinaryTreeSpec

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
    describe "01 - Extracting Lists" Katas.Lists.ExtractingSpec.spec
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
    describe "33 - Types - Sequences" Katas.Types.SequenceSpec.spec
    describe "34 - FA - Functor Type Class" Katas.Fa.FunctorTypeClassSpec.spec
    describe "35 - Exercises - London to Heathrow" Katas.Exercises.LondonToHeathrowSpec.spec
    describe "36 - Exercises - Reverse Polish Notation Calculator" Katas.Exercises.RPNCalculatorSpec.spec
    describe "37 - Exercises - Phone Number Cleaner" Katas.Exercises.PhoneNumberCleanerSpec.spec
    describe "38 - FA - Fmap Function Composition" Katas.Fa.FmapFunctionCompositionSpec.spec
    describe "39 - FA - Fmap Replicate" Katas.Fa.FmapReplicateSpec.spec
    describe "40 - FA - Functor Laws" Katas.Fa.FunctorLawsSpec.spec
    describe "41 - FA - Applicatives" Katas.Fa.ApplicativesSpec.spec
    describe "42 - FA - More Applicatives" Katas.Fa.MoreApplicativesSpec.spec
    describe "43 - FA - New Type for fmap" Katas.Fa.NewTypeSpec.spec
    describe "44 - FA - Monoids" Katas.Fa.MonoidsSpec.spec
    describe "45 - FA - Ordering Monoids" Katas.Fa.OrderingMonoidsSpec.spec
    describe "46 - FA - Maybe Monoids" Katas.Fa.MaybeMonoidsSpec.spec
    describe "47 - FA - NewType Monoids" Katas.Fa.NewTypeMonoidSpec.spec
    describe "48 - FA - Foldable" Katas.Fa.FoldableSpec.spec
    describe "49 - Monads - Calculate Birth Year for 2020" Katas.Monads.CalculateBirthYearSpec.spec
    describe "50 - Monads - Calculate Age from Dates" Katas.Monads.CalculateAgeFromDatesSpec.spec
    describe "51 - Monads - Intro" Katas.Monads.IntroSpec.spec
    describe "52 - Monads - Bird Landing" Katas.Monads.BirdLandingSpec.spec
    describe "53 - Monads - Do Notation" Katas.Monads.DoNotationSpec.spec
    describe "54 - Monads - Bird Landing with Do Notation" Katas.Monads.BirdLandingWithDoNotationSpec.spec
    describe "55 - Monads - List Monads" Katas.Monads.ListMonadSpec.spec
    describe "56 - Monads - Monad Plus" Katas.Monads.MonadPlusSpec.spec
    describe "57 - Monads - Knight's Quest" Katas.Exercises.KnightsQuestSpec.spec
    describe "58 - Monads - Laws" Katas.Monads.MonadLawsSpec.spec
    describe "59 - Monads - Intro to Write Monad" Katas.Monads.IntroToWriteMonadSpec.spec
    describe "60 - Monads - Writer Type" Katas.Monads.WriterTypeSpec.spec
    describe "61 - Monads - Logging with Writer" Katas.Monads.LoggingWithWriterSpec.spec
    describe "62 - Monads - Reader" Katas.Monads.ReaderSpec.spec
    describe "63 - Monads - Reader Example" Katas.Monads.ReaderExampleSpec.spec
    describe "64 - Monads - Stateful Computations" Katas.Monads.StatefulComputationsSpec.spec
    describe "65 - Exercices - Balanced Binary Tree Check" Katas.Exercises.BalancedBinaryTreeSpec.spec
