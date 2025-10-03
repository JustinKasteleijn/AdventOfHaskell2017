module Day02Test where

import Day02
import Parser
import Test.HUnit

day02Tests :: Test
day02Tests =
  TestList
    [ testParseForward,
      testParseForwardFail
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
      "Day 2 Test Parsing Forward"
      (parse parseForward "forard 2")
      (Left "Expected 'w', but got 'a'")
