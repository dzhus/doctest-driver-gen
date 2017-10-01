module Test.DocTest.Gen where
 import Prelude
 import Data.List (unlines, words)

 ddgen :: [String] -> IO ()
 ddgen (src : inp : out : opts) = ddgen_output src inp out opts
 ddgen _ = putStrLn ddgen_usage

 ddgen_output :: String -> String -> String -> [String] -> IO ()
 ddgen_output _ _ out opts = writeFile out $ ddgen_file opts

 ddgen_file :: [String] -> String
 ddgen_file opts = unlines [
  "import Test.DocTest",
  "",
  "main :: IO ()",
  "main = doctest " ++ show (opts >>= words)]

 ddgen_usage :: String
 ddgen_usage = undefined