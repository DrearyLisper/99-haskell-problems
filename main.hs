module Main where

p01 :: [a] -> a
p01 [] = error "List cannot be empty"
p01 [x] = x
p01 (_:xs) = p01 xs


p02 :: [a] -> a
p02 [] = error "List cannot be empty"
p02 [_] = error "List is too small"
p02 [x, _] = x
p02 (_:xs) = p02 xs


p03 :: [a] -> Integer -> a
p03 [] _ = error "List cannot be empty"
p03 (x:_) 1 = x
p03 (_:xs) n = p03 xs (n-1)


p04 :: [a] -> Integer
p04 [] = 0
p04 (_:xs) = 1 + p04 xs

p05 :: [a] -> [a]
p05 = inner []
  where
    inner r [] = r
    inner r (x:xs) = inner (x:r) xs

p06 :: Eq a => [a] -> Bool
p06 xs = xs == p05 xs

main :: IO()
main = print "Hello, world"
