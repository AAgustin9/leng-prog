module Lists (member, union, intersection, difference,
              insert, insertionSort,
              binaryToDecimal, toDecimal, toDec, decimal,
              binaryAdd, firsts, merge) where

import Data.Char(digitToInt)

member:: Int -> [Int] -> Bool
member _ []      = False
member e (x:xs)  = e == x || member e xs


union:: [Int] -> [Int] -> [Int]
union [] ys     = ys
union (x:xs) ys
  | member x ys = union xs ys
  | otherwise   = x : union xs ys

-- Remove Implementations, from, here on

intersection:: [Int] -> [Int] -> [Int]
intersection [] _ = []
intersection (x: xs) ys
    | member x ys    = x : (intersection xs ys)
    | otherwise      = intersection xs ys

difference:: [Int] -> [Int] -> [Int]
difference [] _ = []
difference (x: xs) ys
    | member x ys   = difference xs ys
    | otherwise     = x : (difference xs ys)

insert:: Int -> [Int] -> [Int]
insert a [] = [a]
insert x (y: ys)
    | x < y     = x : y: ys
    | otherwise = y: insert x ys

insertionSort :: [Int] -> [Int]
insertionSort [] = []
insertionSort (x: xs) = insert x (insertionSort xs)

binaryToDecimal :: [Int] -> Int
binaryToDecimal l = sum [bit * 2^i | (bit, i) <- zip (reverse l) [0..]]

toDecimal :: Int -> [Int] -> Int
toDecimal b l = sum [bit * b^i | (bit, i) <- zip (reverse l) [0..]]

toDec :: Int -> String -> Int
toDec base str = toDecimal base (stringToList str)

stringToList :: String -> [Int]
stringToList s = map digitToInt s

-- Same as `toDec` But use a list comprehension

decimal :: Int -> String -> Int
decimal base str  = toDecimal base (stringToList str)

firsts::[a] -> [[a]]
firsts [] = []
firsts x = [ take i x | i <- [1..length x] ]

-- Given two String that represents numbers in binary implement the 'binaryAdd' function
-- DO NOT USE a predefined '+' operation

binaryAdd::String -> String -> String
binaryAdd  = error "Implement it"

merge :: (Ord a) => [a] -> [a] -> [a]
merge [] y = y
merge x [] = x
merge (x:xs) (y:ys)
    | x < y     = x : merge xs (y:ys)
    | otherwise = y : merge (x:xs) ys
