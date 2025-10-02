module Utilities where

windows :: Int -> [a] -> [[a]]
windows n xs
  | length xs < n = []
  | otherwise = take n xs : windows n (tail xs)
