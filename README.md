# Solving 99 Haskell Problems 

Use ```:l main.hs``` in ghci to load all functions that solve problems.

## Problem 01
(*) Find the last element of a list.

``` haskell
*Main> p01 [1, 2, 3]
3
```

## Problem 02
(*) Find the last but one element of a list.

``` haskell
*Main> p02 [1, 2, 3, 4]
3
```

## Problem 03
(*) Find the K'th element of a list. The first element in the list is number 1.

``` haskell
*Main> p03 [1, 2, 3] 2
2
*Main> p03 "haskell" 5
'e'
```

## Problem 04
(*) Find the number of elements of a list.

``` haskell
*Main> p04 [123, 456, 789]
3
*Main> p04 "Hello, world!"
13
```

## Problem 05
(*) Reverse a list.

``` haskell
*Main> p05 "A man, a plan, a canal, panama!"
"!amanap ,lanac a ,nalp a ,nam A"
*Main> p05 [1,2,3,4]
[4,3,2,1]
```

## Problem 06
(*) Find out whether a list is a palindrome. A palindrome can be read forward or backward; e.g. (x a m a x).

``` haskell
*Main> p06 [1,2,3]
False
*Main> p06 "madamimadam"
True
*Main> p06 [1,2,4,8,16,8,4,2,1]
True
```

## Problem 07
(**) Flatten a nested list structure.

``` haskell
*Main> p07 (Elem 5)
[5]
*Main> p07 (List [Elem 1, List [Elem 2, List [Elem 3, Elem 4], Elem 5]])
[1,2,3,4,5]
*Main> p07 (List [])
[]
```

