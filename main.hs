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


data NestedList a = Elem a | List [NestedList a]
p07 :: NestedList a -> [a]
p07 (Elem x) = [x]
p07 (List xs) = foldl (++) [] $ map p07 xs


p08 :: Eq a => [a] -> [a]
p08 [] = []
p08 [x] = [x]
p08 (x:y:xs) | x == y = p08 (y:xs)
             | otherwise = x : p08 (y:xs)


p09 :: Eq a => [a] -> [[a]]
p09 ys = inner ys []
  where
    inner [] group = [p05 group]
    inner [x] group = [p05 $ x:group]
    inner (x:y:xs) group | x == y = inner (y:xs) (x:group)
                         | otherwise = (p05 (x:group)) : (inner (y:xs) [])


p10 :: Eq a => [a] -> [(Integer, a)]
p10 = map (\x -> (p04 x, head x)) . p09


data RLE a = Multiple Int a | Single a deriving Show
p11 :: Eq a => [a] -> [RLE a]
p11 = map pack . p09
  where
    pack x | length x > 1 = Multiple (length x) (head x)
           | otherwise    = Single (head x)


p12 :: [RLE a] -> [a]
p12 xs = foldr (++) [] $ map unpack xs
  where
    unpack (Single x)     = [x]
    unpack (Multiple n x) = take n $ repeat x


p13 :: Eq a => [a] -> [RLE a]
p13 ys = inner ys 0
  where
    inner [] _ = []
    inner [x] n | n > 1     = [Multiple n x]
                | otherwise = [Single x]
    inner (x:y:xs) n | x == y    = inner (y:xs) (n+1)
                     | n > 0     = (Multiple (n + 1) x) : inner (y:xs) 0
                     | otherwise = (Single x) : inner (y:xs) 0


p14 :: [a] -> [a]
p14 xs = foldl (++) [] (map (\x -> [x, x]) xs)


p15 :: [a] -> Int -> [a]
p15 xs n = foldl (++) [] (map (take n . repeat) xs)


p16 :: [a] -> Int -> [a]
p16 ys y = inner ys y y
  where
    inner [] _ _ = []
    inner (x:xs) n c | c == 1 = inner xs n n
                     | otherwise = x : inner xs n (c - 1)


p17 :: [a] -> Int -> ([a], [a])
p17 ys c = inner [] ys c
  where
    inner left [] _ = (left, [])
    inner left (x:xs) n | n == 0 = (reverse left, x:xs)
                        | otherwise = inner (x:left) xs (n - 1)

main :: IO()
main = print "Hello, world"
