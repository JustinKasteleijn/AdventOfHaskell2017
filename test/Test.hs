import Day01Test
import Day02Test
import ParserTest
import Test.HUnit
import UtilitiesTest

runSuite :: String -> Test -> IO ()
runSuite testname suite = do
  print $ "Running " ++ testname ++ " Tests:"
  counts <- runTestTT suite
  print counts

main :: IO ()
main = do
  let parsingSuite = TestLabel "Parsing Tests" parserTests
      utilitiesSuite = TestLabel "Utilities Test" utilitiesTests
      day01Suite = TestLabel "Day01 Tests" day01Tests
      day02Suite = TestLabel "Day02 Tests" day02Tests
      allTests = TestList [parsingSuite, day01Suite]

  runSuite "Parser" parsingSuite

  runSuite "Utilities" utilitiesSuite

  runSuite "Day01" day01Suite

  runSuite "Day02" day02Suite
