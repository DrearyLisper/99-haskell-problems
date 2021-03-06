module Main where

import System.Random
import Data.Array

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


p18 :: [a] -> Int -> Int -> [a]
p18 ys from to = drop' from . take' to $ ys
  where
    drop' :: Int -> [a] -> [a]
    drop' 1 xs = xs
    drop' _ [] = error "Empty list"
    drop' n (_:xs) = drop' (n-1) xs

    take' :: Int -> [a] -> [a]
    take' n xs = takeInner' n xs []
    takeInner' :: Int -> [a] -> [a] -> [a]
    takeInner' 0 _ zs = reverse $ zs
    takeInner' _ [] _ = error "Empty list"
    takeInner' n (x:xs) zs = takeInner' (n-1) xs (x:zs)


p19 :: [a] -> Int -> [a]
p19 xs n = r ++ l
  where
    (l, r) = p17 xs ((n + length xs) `mod` length xs)


p20 :: Int -> [a] -> (a, [a])
p20 n xs = inner n [] xs
  where
    inner 1 ys (z:zs) = (z, (reverse ys) ++ zs)
    inner _ _ [] = error "Out of bounds"
    inner c ys (z:zs) = inner (c-1) (z:ys) zs


p21 :: a -> [a] -> Int -> [a]
p21 j zs i = inner j [] zs i
  where
    inner :: a -> [a] -> [a] -> Int -> [a]
    inner e xs (y:ys) 1 = (reverse xs) ++ e : y : ys
    inner e xs [] _ = reverse (e:xs)
    inner e xs (y:ys) n = inner e (y:xs) ys (n-1)


p22 :: Int -> Int -> [Int]
p22 l r = [l..r]

p23 :: [a] -> Int -> IO [a]
p23 items n = do
    g <- newStdGen
    a <- shuffle (array (0, (length items) - 1) $ zip [0..] items) 0 (length items) g
    return $ take n $ elems $ a
      where
        swap :: Array Int e -> Int -> Int -> Array Int e
        swap a i j = a // [(i, jVal), (j, iVal)]
          where
            iVal = a ! i
            jVal = a ! j

        shuffle :: RandomGen g => Array Int e -> Int -> Int -> g -> IO (Array Int e)
        shuffle a l r g | l == r = return a
                        | otherwise = do
          (swapIndex, newG) <- return $ (randomR (l, r - 1) g)
          newA <- shuffle (swap a l swapIndex) (l+1) r newG
          return newA




main :: IO()
main = print "Hello, world"
