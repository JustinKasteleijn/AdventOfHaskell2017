import Day01Test
import ParserTest
import Test.HUnit

main :: IO ()
main = do
  let parsingSuite = TestLabel "Parsing Tests" parserTests
      day01Suite = TestLabel "Day01 Tests" day01Tests
      allTests = TestList [parsingSuite, day01Suite]

  print "Running Parser Tests:"
  counts <- runTestTT parsingSuite
  print counts

  print "Running Day01 Tests:"
  counts <- runTestTT day01Suite
  print counts
