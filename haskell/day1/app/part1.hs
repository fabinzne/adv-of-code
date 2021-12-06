module Main where

measure :: Int -> Int -> [Int] -> Int
measure acc _ []       = acc
measure acc x (y : ys) = if y <= x
                            then measure acc y ys 
                            else measure (acc + 1) y ys

main :: IO ()
main = do
  txt <- readFile "input.txt"
  let nums = read <$> lines txt
  let n    = measure 0 (head nums) nums
  print n
