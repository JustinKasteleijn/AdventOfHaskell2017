module Day03 where

import Data.List (partition, transpose)
import Parser
import Utilities

day03Part1 :: String -> Int
day03Part1 input =
  let bin = map (\(x, y) -> if x > y then '0' else '1') (parseInput input)
   in binaryToInt bin * binaryToInt (flipBin bin)
  where
    flipBin :: String -> String
    flipBin = map (\c -> if c == '0' then '1' else '0')

parseInput :: String -> [(Int, Int)]
parseInput input = map countRow' (parse' input)
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

day03Part2 :: String -> Int
day03Part2 input =
  let rows = lines input
      oxygen = filterRating mostCommonBit 0 rows
      co2 = filterRating leastCommonBit 0 rows
   in binaryToInt oxygen * binaryToInt co2

filterRating :: ([String] -> Int -> Char) -> Int -> [String] -> String
filterRating _ _ [x] = x
filterRating bitFunc pos xs =
  let keepBit = bitFunc xs pos
      xs' = filter (\s -> s !! pos == keepBit) xs
   in filterRating bitFunc (pos + 1) xs'

mostCommonBit :: [String] -> Int -> Char
mostCommonBit xs pos =
  let (zeros, ones) = partition (\s -> s !! pos == '0') xs
   in if length ones >= length zeros then '1' else '0'

leastCommonBit :: [String] -> Int -> Char
leastCommonBit xs pos =
  let (zeros, ones) = partition (\s -> s !! pos == '0') xs
   in if length zeros <= length ones then '0' else '1'
