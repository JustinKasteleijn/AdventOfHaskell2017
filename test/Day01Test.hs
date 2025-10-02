module Day01Test where

import Day01 (parseInput, part1, part2)
import Test.HUnit

day01Tests :: Test
day01Tests =
  TestList
    [ testParsing
    ]

input :: String
input = "199\n200\n208\n210\n200\n207\n240\n269\n260\n263"

testParsing :: Test
testParsing =
  TestCase $
    assertEqual
      "Day 1 Parsing"
      (parseInput input)
      [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]

testPart1 :: Test
testPart1 =
  TestCase $
    assertEqual
      "Day 1 Part 1"
      (part1 input)
      7
