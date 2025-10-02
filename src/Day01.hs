module Day01 (day01Part1, day01Part2, parseInputDay1) where

import Parser
import Utilities

parseInputDay1 :: String -> [Int]
parseInputDay1 input =
  case parse (sepBy nat newline1) input of
    Right (xs, _) -> xs
    Left err -> error err

isChronological :: (Ord a) => (a, a) -> Bool
isChronological (x, y) = x < y

pair' :: [a] -> (a, a)
pair' [x, y] = (x, y)
pair' _ = error "List must contain at least two items"

day01Part1 :: String -> Int
day01Part1 input =
  length $
    filter isChronological (map pair' (windows 2 (parseInputDay1 input)))

day01Part2 :: String -> Int
day01Part2 input =
  length $
    filter isChronological $
      map pair' (windows 2 $ map sum (windows 3 (parseInputDay1 input)))
