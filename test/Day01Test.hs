module Day01Test where

import Day01 (day01Part1, day01Part2, parseInputDay1)
import Test.HUnit

day01Tests :: Test
day01Tests =
  TestList
    [ testParsing,
      testPart1,
      testPart2
    ]

input :: String
input = "199\n200\n208\n210\n200\n207\n240\n269\n260\n263"

testParsing :: Test
testParsing =
  TestCase $
    assertEqual
      "Day 1 Parsing"
      (parseInputDay1 input)
      [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]

testPart1 :: Test
testPart1 =
  TestCase $
    assertEqual
      "Day 1 Part 1"
      (day01Part1 input)
      7

testPart2 :: Test
testPart2 =
  TestCase $
    assertEqual
      "Day 1 Part 2"
      (day01Part2 input)
      5
