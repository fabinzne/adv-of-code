{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
{-# OPTIONS_GHC -Wno-overlapping-patterns #-}
module Main where
import Control.Applicative
import Data.List.Split

arrayToTuple :: [String] -> [(String, Int)]
arrayToTuple = map (toTuple.splitOn " ") where
  toTuple :: [String] -> (String, Int)
  toTuple [a, b] = (a, read b :: Int)
  toTuple _ = undefined
 
mapIntoMoves :: [(String, Int)] -> (Int, Int) -> (Int, Int)
mapIntoMoves [] res = res  
mapIntoMoves ((a, b):xs) (x, y) = case a of
  "up"      -> mapIntoMoves xs (x, y - b)
  "down"    -> mapIntoMoves xs (x, y + b)
  "forward" -> mapIntoMoves xs (x + b, y)


main :: IO ()
main = do
  txt <- readFile "input.txt"
  let steps = lines txt
  let splitedSteps = arrayToTuple steps
  let (x, y) = mapIntoMoves splitedSteps (0, 0)
  let result = x * y 
  print result