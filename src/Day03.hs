module Day03 where

import Parser

parseInput :: String -> [(Int, Int)]
parseInput input =
  case (parse (lines digit)) of
    Right(xs, _) ->
    Left err -> error err
