module Main where

measure :: Int -> Int -> [Int] -> Int
measure acc _ []       = acc
measure acc x (y : ys) = if y <= x
                            then measure acc y ys 
                            else measure (acc + 1) y ys

group :: [Int] -> [Int]
group xs = zipWith3 (\a b c -> a+b+c) xs (tail xs) (tail $ tail xs)

main :: IO ()
main = do
  txt <- readFile "input.txt"
  let nums = read <$> lines txt
  let groups = group nums
  let n    = measure 0 (head groups) groups
  print n
