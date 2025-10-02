import Parser

main :: IO ()
main = do
  print $ parse (sat (== 'H')) "Hello Cabal"
