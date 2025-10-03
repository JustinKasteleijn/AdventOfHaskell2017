import Day01Test
import Day02Test
import Day03Test
import Day04Test
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
      day03Suite = TestLabel "Day03 Tests" day03Tests
      day04Suite = TestLabel "Day04 Tests" day04Tests
      allTests = TestList [parsingSuite, day01Suite]

  runSuite "Parser" parsingSuite

  runSuite "Utilities" utilitiesSuite

  runSuite "Day01" day01Suite

  runSuite "Day02" day02Suite

  runSuite "Day03" day03Suite

  runSuite "Day04" day04Suite
