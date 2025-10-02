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

-- Test the digit parser
testDigit :: Test
testDigit =
  TestCase $
    assertEqual
      "digit parser"
      (parse digit "123")
      (Right ('1', "23"))

main :: IO ()
main = do
  _ <- runTestTT $ TestList [testItem, testItemFail, testChar, testDigit]
  return ()
