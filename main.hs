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


main :: IO()
main = print "Hello, world"
