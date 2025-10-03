module Day03 where

import Data.List (transpose)
import Parser

day03Part1 :: String -> Int
day03Part1 input =
  let bin = map (\(x, y) -> if x > y then '0' else '1') (parseInput input)
   in (binaryToInt bin) * (binaryToInt (flipBin bin))
  where
    binaryToInt :: String -> Int
    binaryToInt = foldl (\acc c -> acc * 2 + if c == '1' then 1 else 0) 0

    flipBin :: String -> String
    flipBin = map (\c -> if c == '0' then '1' else '0')

parseInput :: String -> [(Int, Int)]
parseInput input = map (countRow') (parse' input)
  where
    countRow' :: String -> (Int, Int)
    countRow' = foldr count' (0, 0)
      where
        count' :: Char -> (Int, Int) -> (Int, Int)
        count' '0' (x, y) = (x + 1, y)
        count' '1' (x, y) = (x, y + 1)
        count' _ (x, y) = error "Binary number with digit other than 1 or 2"

    parse' :: String -> [String]
    parse' input =
      case parse (lines1 digits1) ((unlines . transpose . lines) input) of
        Right (xs, _) -> xs
        Left err -> error err
