module Day02Test where

import Day02
import Parser
import Test.HUnit

day02Tests :: Test
day02Tests =
  TestList
    [ testParseForward,
      testParseForwardFail,
      testParseDown,
      testParseDownFail,
      testParseUp,
      testParseUpFail
    ]

input :: String
input = "forward 5\ndown 5\nforward 8\nup 3\ndown 8\nforward 2"

testParseForward :: Test
testParseForward =
  TestCase $
    assertEqual
      "Day 2 Test Parsing Forward"
      (parse parseForward "forward 2")
      (Right (Forward 2, ""))

testParseForwardFail :: Test
testParseForwardFail =
  TestCase $
    assertEqual
      "Day 2 Test Parsing Forward Fail"
      (parse parseForward "forard 2")
      (Left "Expected 'w', but got 'a'")

testParseDown :: Test
testParseDown =
  TestCase $
    assertEqual
      "Day 2 Test Parsing Down"
      (parse parseDown "down 4")
      (Right (Down 4, ""))

testParseDownFail :: Test
testParseDownFail =
  TestCase $
    assertEqual
      "Day 2 Test Parsing Down Fail"
      (parse parseDown "dow 2")
      (Left "Expected 'n', but got ' '")

testParseUp :: Test
testParseUp =
  TestCase $
    assertEqual
      "Day 2 Test Parsing Up"
      (parse parseUp "up 10")
      (Right (Up 10, ""))

testParseUpFail :: Test
testParseUpFail =
  TestCase $
    assertEqual
      "Day 2 Test Parsing Up Fail"
      (parse parseUp "pu 2")
      (Left "Expected 'u', but got 'p'")
