module Trie  (Trie(..), left, right, find, decode, toList) where

import Bit

data Trie a = Leaf a | Trie a :-: Trie a deriving (Eq, Show)

left::Trie a -> Trie a
left (t1 :-: t2) = t1

right::Trie a -> Trie a
right (t1 :-: t2) = t2

find::Bits -> Trie a -> a
find = error "Define it"

decode::Bits -> Trie Char -> String
decode = error "Define it"

toList::Trie a -> [(a, Bits)]
toList = error "Define it"
