module Day04 where

import Data.List (find, partition, transpose)
import Parser
import Utilities

type BingoCard = [[(Int, Bool)]]

type BingoNumbers = [Int]

day04Part1 :: String -> Int
day04Part1 input =
  let (n, cards) = parseInput input
   in play n cards

day04Part2 :: String -> Int
day04Part2 input =
  let (numbers, cards) = parseInput input
   in playLast numbers cards

markNumber :: Int -> BingoCard -> BingoCard
markNumber n = map (map (\(x, b) -> if x == n then (x, True) else (x, b)))

score :: Int -> BingoCard -> Int
score n card = n * sum [x | (x, marked) <- concat card, not marked]

playLast :: BingoNumbers -> [BingoCard] -> Int
playLast [] _ = error "No numbers left"
playLast (n : ns) cards =
  let markedCards = map (markNumber n) cards
      (winners, losers) = partition bingo markedCards
   in case (winners, losers) of
        -- No boards left? shouldn't happen
        (_, []) -> score n (head winners)
        -- Some winners, but still boards left: keep playing with losers
        _ -> playLast ns losers

play :: BingoNumbers -> [BingoCard] -> Int
play [] _ = error "No numbers left"
play (n : ns) cards =
  let markedCards = map (markNumber n) cards
   in case find bingo markedCards of
        Just winner -> score n winner
        Nothing -> play ns markedCards

bingo :: BingoCard -> Bool
bingo card =
  let rows = (map (map snd) card)
   in any markedRow rows || any markedRow (transpose rows)
  where
    markedRow :: [Bool] -> Bool
    markedRow = all id

parseBingoNumbers :: Parser BingoNumbers
parseBingoNumbers = sepBy nat (char ',') <* newline1

parseBingoCard :: Parser BingoCard
parseBingoCard = sepBy1 parseRow (spaces0 *> newline1)
  where
    parseRow :: Parser [(Int, Bool)]
    parseRow = sepBy1 parseCell spaces1

    parseCell :: Parser (Int, Bool)
    parseCell = do
      n <- spaces0 *> nat
      return (n, False)

parseInput :: String -> (BingoNumbers, [BingoCard])
parseInput input =
  let (numbers, rest1) = unpackParser parseBingoNumbers input

      cards =
        map
          (fst . (unpackParser parseBingoCard))
          (splitOn "\n\n" rest1)
   in (numbers, cards)
  where
    unpackParser :: Parser a -> String -> (a, String)
    unpackParser px input' = case parse px input' of
      Right x -> x
      Left err -> error err
