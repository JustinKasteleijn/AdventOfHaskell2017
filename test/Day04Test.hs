module Day04Test where

import Day04
import Parser
import Test.HUnit

day04Tests :: Test
day04Tests =
  TestList
    [ testParseInput
    ]

testParseInput :: Test
testParseInput =
  TestCase $
    assertEqual
      "Day 4 Test Parsing"
      (parseInput input)
      ((expectedNumbers, expectedCards))

input :: String
input =
  "7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1\n\
  \\n\
  \22 13 17 11 0\n\
  \ 8  2 23  4 24\n\
  \21  9 14 16  7\n\
  \ 6 10  3 18  5\n\
  \ 1 12 20 15 19\n\
  \\n\
  \ 3 15  0  2 22\n\
  \ 9 18 13 17  5\n\
  \19  8  7 25 23\n\
  \20 11 10 24  4\n\
  \14 21 16 12  6\n\
  \\n\
  \14 21 17 24  4\n\
  \10 16 15  9 19\n\
  \18  8 23 26 20\n\
  \22 11 13  6  5\n\
  \ 2  0 12  3  7"

expectedNumbers :: [Int]
expectedNumbers = [7, 4, 9, 5, 11, 17, 23, 2, 0, 14, 21, 24, 10, 16, 13, 6, 15, 25, 12, 22, 18, 20, 8, 19, 3, 26, 1]

expectedCards :: [[[(Int, Bool)]]]
expectedCards =
  [ [ [(22, False), (13, False), (17, False), (11, False), (0, False)],
      [(8, False), (2, False), (23, False), (4, False), (24, False)],
      [(21, False), (9, False), (14, False), (16, False), (7, False)],
      [(6, False), (10, False), (3, False), (18, False), (5, False)],
      [(1, False), (12, False), (20, False), (15, False), (19, False)]
    ],
    [ [(3, False), (15, False), (0, False), (2, False), (22, False)],
      [(9, False), (18, False), (13, False), (17, False), (5, False)],
      [(19, False), (8, False), (7, False), (25, False), (23, False)],
      [(20, False), (11, False), (10, False), (24, False), (4, False)],
      [(14, False), (21, False), (16, False), (12, False), (6, False)]
    ],
    [ [(14, False), (21, False), (17, False), (24, False), (4, False)],
      [(10, False), (16, False), (15, False), (9, False), (19, False)],
      [(18, False), (8, False), (23, False), (26, False), (20, False)],
      [(22, False), (11, False), (13, False), (6, False), (5, False)],
      [(2, False), (0, False), (12, False), (3, False), (7, False)]
    ]
  ]
