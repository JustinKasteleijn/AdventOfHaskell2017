module Day03Test where

import Day03
import Parser
import Test.HUnit

day03Tests :: Test
day03Tests =
  TestList
    [ testParse,
      testPart1
    ]

input :: String
input = "00100\n11110\n10110\n10111\n10101\n01111\n00111\n11100\n10000\n11001\n00010\n01010"

testPart1 :: Test
testPart1 =
  TestCase $
    assertEqual
      "Day 3 Part 1 Test"
      (day03Part1 input)
      198

testParse :: Test
testParse =
  TestCase $
    assertEqual
      "Day 3 Test Parsing"
      (parseInput input)
      [(5, 7), (7, 5), (4, 8), (5, 7), (7, 5)]
