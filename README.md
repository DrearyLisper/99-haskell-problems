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

Transform a list, possibly holding lists as elements into a `flat' list by replacing each list with its elements (recursively).

``` haskell
*Main> p07 (Elem 5)
[5]
*Main> p07 (List [Elem 1, List [Elem 2, List [Elem 3, Elem 4], Elem 5]])
[1,2,3,4,5]
*Main> p07 (List [])
[]
```

## Problem 08

(**) Eliminate consecutive duplicates of list elements.

If a list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed.

``` haskell
*Main> p08 "aaaabccaadeeee"
"abcade"
```

## Problem 09

(**) Pack consecutive duplicates of list elements into sublists. If a list contains repeated elements they should be placed in separate sublists.

``` haskell
*Main> p09 ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e']
["aaaa","b","cc","aa","d","eeee"]
```

## Problem 10

(*) Run-length encoding of a list. Use the result of problem P09 to implement the so-called run-length encoding data compression method. Consecutive duplicates of elements are encoded as lists (N E) where N is the number of duplicates of the element E.

``` haskell
*Main> p10 "aaaabccaadeeee"
[(4,'a'),(1,'b'),(2,'c'),(2,'a'),(1,'d'),(4,'e')]
```

## Problem 11

(*) Modified run-length encoding.

Modify the result of problem 10 in such a way that if an element has no duplicates it is simply copied into the result list. Only elements with duplicates are transferred as (N E) lists.

``` haskell
*Main> p11 "aaaabccaadeeee"
[Multiple 4 'a',Single 'b',Multiple 2 'c',Multiple 2 'a',Single 'd',Multiple 4 'e']
```

## Problem 12

(**) Decode a run-length encoded list.

Given a run-length code list generated as specified in problem 11. Construct its uncompressed version.

``` haskell
*Main> p12 [Multiple 4 'a',Single 'b',Multiple 2 'c', Multiple 2 'a',Single 'd',Multiple 4 'e']
"aaaabccaadeeee"
```

## Problem 13

(**) Run-length encoding of a list (direct solution).

Implement the so-called run-length encoding data compression method directly. I.e. don't explicitly create the sublists containing the duplicates, as in problem 9, but only count them. As in problem P11, simplify the result list by replacing the singleton lists (1 X) by X.

``` haskell
*Main> p13 "aaaabccaadeeee"
[Multiple 4 'a',Single 'b',Multiple 2 'c',Multiple 2 'a',Single 'd',Multiple 3 'e']
```

## Problem 14

(*) Duplicate the elements of a list.

``` haskell
*Main> p14 [1, 2, 3]
[1,1,2,2,3,3]
```

## Problem 15

(**) Replicate the elements of a list a given number of times.

``` haskell
*Main> p15 "abc" 3
"aaabbbccc"
```

## Problem 16

(**) Drop every N'th element from a list.

``` haskell
*Main> p16 "abcdefghik" 3
"abdeghk"
```

## Problem 17

(*) Split a list into two parts; the length of the first part is given.

``` haskell
*Main> p17 "abcdefghik" 3
("abc","defghik")
```
