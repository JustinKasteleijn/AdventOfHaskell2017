module Day02 where

import Control.Applicative (Alternative (..))
import Parser

data Command
  = Forward Int
  | Down Int
  | Up Int
  deriving (Show, Eq)

type Position = (Int, Int)

parseCommands :: String -> [Command]
parseCommands input =
  case parse (sepBy1 parseCommand newline) input of
    Right (xs, _) -> xs
    Left err -> error err

calculatePos :: [Command] -> Position
calculatePos = foldr depth' (0, 0)
  where
    depth' :: Command -> Position -> Position
    depth' (Forward n) (x, y) = (x + n, y)
    depth' (Down n) (x, y) = (x, y + n)
    depth' (Up n) (x, y) = (x, y - n)

day02Part1 :: String -> Int
day02Part1 =
  uncurry (*)
    . calculatePos
    . parseCommands
  where
    multiplyTuple :: (Int, Int) -> Int
    multiplyTuple (x, y) = x * y

parseCommand :: Parser Command
parseCommand =
  parseForward
    <|> parseDown
    <|> parseUp

parseForward :: Parser Command
parseForward =
  Forward
    <$> (string "forward " *> nat)

parseDown :: Parser Command
parseDown =
  Down
    <$> (string "down " *> nat)

parseUp :: Parser Command
parseUp =
  Up
    <$> (string "up " *> nat)
