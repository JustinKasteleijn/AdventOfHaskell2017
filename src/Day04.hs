module Day04 where

import Control.Applicative (Alternative (..))
import Parser
import Utilities

type BingoCard = [[(Int, Bool)]]

type BingoNumbers = [Int]

bingo :: BingoCard -> Bool
bingo card = undefined

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
