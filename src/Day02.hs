module Day02 where

import Control.Applicative (Alternative (..))
import Parser

data Command
  = Forward Int
  | Down Int
  | Up Int
  deriving (Show, Eq)

parseCommands :: String -> [Command]
parseCommands input =
  case parse (some parseCommand) input of
    Right (xs, _) -> xs
    Left err -> error err

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
