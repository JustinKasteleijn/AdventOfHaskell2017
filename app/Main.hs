import Day01
import Day02
import Day03
import Day04

main :: IO ()
main = do
  inputDay1 <- readFile "inputs/day01.txt"
  print $ "Day 1 Part 1: " ++ show (day01Part1 inputDay1)
  print $ "Day 1 Part 2: " ++ show (day01Part2 inputDay1)

  inputDay2 <- readFile "inputs/day02.txt"
  print $ "Day 2 Part 1: " ++ show (day02Part1 inputDay2)
  print $ "Day 2 Part 2: " ++ show (day02Part2 inputDay2)

  inputDay3 <- readFile "inputs/day03.txt"
  print $ "Day 3 Part 1: " ++ show (day03Part1 inputDay3)
  print $ "Day 3 Part 2: " ++ show (day03Part2 inputDay3)

  inputDay4 <- readFile "inputs/day04.txt"
  print $ "Day 4 Part 1: " ++ show (day04Part1 inputDay4)
  print $ "Day 4 Part 2: " ++ show (day04Part2 inputDay4)
