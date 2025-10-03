module Utilities where

import Data.List (isPrefixOf)

windows :: Int -> [a] -> [[a]]
windows n xs
  | length xs < n = []
  | otherwise = take n xs : windows n (tail xs)

binaryToInt :: String -> Int
binaryToInt = foldl (\acc c -> acc * 2 + if c == '1' then 1 else 0) 0

splitOn :: (Eq a) => [a] -> [a] -> [[a]]
splitOn delim [] = [[]]
splitOn delim xs
  | delim `isPrefixOf` xs = [] : splitOn delim (drop (length delim) xs)
  | otherwise =
      let (y : ys) = xs
          (z : zs) = splitOn delim ys
       in (y : z) : zs
