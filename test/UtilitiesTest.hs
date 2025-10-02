module UtilitiesTest where

import Test.HUnit
import Utilities

utilitiesTests :: Test
utilitiesTests =
  TestList
    [ testWindows2,
      testWindows3,
      testWindowsEmptyList,
      testWindowsSizeTooBig
    ]

testWindows2 :: Test
testWindows2 =
  TestCase $
    assertEqual
      "windows 2d test"
      (windows 2 [1, 2, 3, 4])
      [[1, 2], [2, 3], [3, 4]]

testWindows3 :: Test
testWindows3 =
  TestCase $
    assertEqual
      "windows 2d test"
      (windows 3 [1, 2, 3, 4])
      [[1, 2, 3], [2, 3, 4]]

testWindowsSizeTooBig :: Test
testWindowsSizeTooBig =
  TestCase $
    assertEqual
      "windows size too big test"
      (windows 3 [1, 2])
      []

testWindowsEmptyList :: Test
testWindowsEmptyList =
  TestCase $
    assertEqual
      "Test Windows Empty List"
      (windows 2 "")
      []
