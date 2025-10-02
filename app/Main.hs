import Day01

main :: IO ()
main = do
  inputDay1 <- readFile "inputs/day01.txt"
  print $ "Day 1 Part 1: " ++ show (day01Part1 inputDay1)
  print $ "Day 1 Part 2: " ++ show (day01Part2 inputDay1)
