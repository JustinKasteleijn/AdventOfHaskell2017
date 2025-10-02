import Parser
import Test.HUnit

-- Test the item parser
testItem :: Test
testItem =
  TestCase $
    assertEqual
      "item parser"
      (parse item "abc")
      (Right ('a', "bc"))

testItemFail :: Test
testItemFail =
  TestCase $
    assertEqual
      "item parser fail"
      (parse item "")
      (Left "Unexpected end of input")

-- Test the char parser
testChar :: Test
testChar =
  TestCase $
    assertEqual
      "char parser"
      (parse (char 'a') "abc")
      (Right ('a', "bc"))

testCharFail :: Test
testCharFail =
  TestCase $
    assertEqual
      "char parser fail"
      (parse (char 'a') "b")
      (Left $ "Expected '" ++ "a" ++ "', but got '" ++ "b" ++ "'")

-- Test the digit parser
testDigit :: Test
testDigit =
  TestCase $
    assertEqual
      "digit parser"
      (parse digit "123")
      (Right ('1', "23"))

testDigitFail :: Test
testDigitFail =
  TestCase $
    assertEqual
      "digit parser fail"
      (parse digit "a")
      (Left $ 'a' : " does not match predicate")

main :: IO ()
main = do
  _ <- runTestTT $ TestList [testItem, testItemFail, testChar, testCharFail, testDigit, testDigitFail]
  return ()
