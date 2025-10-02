module Day01 (part1, part2, parseInput) where

import Parser

parseInput :: String -> [Int]
parseInput input =
  case parse (sepBy nat newline1) input of
    Right (xs, _) -> xs
    Left err -> error err

part1 :: String -> Int
part1 = undefined

part2 :: String -> Int
part2 = undefined
