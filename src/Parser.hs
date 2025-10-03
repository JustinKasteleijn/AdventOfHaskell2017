module Parser where

import Control.Applicative (Alternative (..))
import Control.Monad (void)
import Data.Char (isAlpha, isAlphaNum, isDigit)

newtype Parser a = Parser {parse :: String -> Either String (a, String)}

-- Instances
instance Functor Parser where
  -- fmap :: (a -> b) -> Parser a -> Parser b
  fmap f px =
    Parser $ \input -> do
      (x, rest) <- parse px input
      Right (f x, rest)

instance Applicative Parser where
  -- pure :: a -> Parser a
  pure x =
    Parser $ \input -> Right (x, input)

  -- (<*>) :: Parser (a -> b) -> Parser a -> Parser b
  pf <*> px =
    Parser $ \input -> do
      (f, rest) <- parse pf input
      (x, rest') <- parse px rest
      Right (f x, rest')

instance Monad Parser where
  -- (>>=) :: Parser a -> (a -> Parser b) -> Parser b
  px >>= f =
    Parser $ \input -> do
      (x, rest) <- parse px input
      parse (f x) rest

instance MonadFail Parser where
  -- fail :: String -> Parser a
  fail msg = Parser $ \_ -> Left msg

instance Alternative Parser where
  -- empty :: Parser a
  empty = Parser $ \_ -> Left ""

  -- (<|>) :: Parser a -> Parser a -> Parser a
  px <|> py =
    Parser $ \input ->
      case parse px input of
        Right t -> Right t
        Left msg -> case parse py input of
          Right t -> Right t
          Left msg' -> Left (msg ++ " or " ++ msg')

-- Parser Functions
item :: Parser Char
item = Parser $ \input -> case input of
  (x : xs) -> Right (x, xs)
  [] -> Left "Unexpected end of input"

char :: Char -> Parser Char
char c =
  Parser $ \input -> do
    (x, rest) <- parse item input
    if x == c
      then Right (x, rest)
      else Left $ "Expected '" ++ [c] ++ "', but got '" ++ [x] ++ "'"

sat :: (Char -> Bool) -> Parser Char
sat pred =
  Parser $ \input -> do
    (x, rest) <- parse item input
    if pred x
      then Right (x, rest)
      else Left $ x : " does not match predicate"

digit :: Parser Char
digit = sat isDigit

digits1 :: Parser String
digits1 = some digit

digits0 :: Parser String
digits0 = many digit

space :: Parser ()
space = void $ sat (== ' ')

spaces0 :: Parser ()
spaces0 = void $ many space

spaces1 :: Parser ()
spaces1 = void $ some space

newline :: Parser ()
newline = void $ sat (== '\n') <|> sat (== '\r')

newline0 :: Parser ()
newline0 = void $ many newline

newline1 :: Parser ()
newline1 = void $ some newline

alpha :: Parser Char
alpha = sat isAlpha

alpha0 :: Parser String
alpha0 = many alpha

alpha1 :: Parser String
alpha1 = some alpha

alphaNum :: Parser Char
alphaNum = sat isAlphaNum

alphaNum0 :: Parser String
alphaNum0 = many alphaNum

alphaNum1 :: Parser String
alphaNum1 = some alphaNum

string :: String -> Parser String
string = mapM char

nat :: Parser Int
nat = read <$> digits1

int :: Parser Int
int = nat <|> char '-' *> (negate <$> nat)

sepBy1 :: Parser a -> Parser b -> Parser [a]
sepBy1 px psep =
  (:)
    <$> px
    <*> many (psep *> px)

sepBy :: Parser a -> Parser b -> Parser [a]
sepBy px psep = sepBy1 px psep <|> pure []

lines1 :: Parser a -> Parser [a]
lines1 px = sepBy1 px newline
