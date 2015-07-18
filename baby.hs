-- comments are "double dash (--)"
-- source: https://wiki.haskell.org/Commenting

doubleMe x = x + x
doubleUs x y = doubleMe x + doubleMe y
doubleSmallNumber x = if x > 100
                       then x
		       else x * 2

doubleSmallNumber' x = (if x > 100 then x else x * 2) + 1

-- example from 4.1, page 27
sayMe :: (Integral a) => a -> String
sayMe 1 = "One!"
sayMe 2 = "Two!"
sayMe 3 = "Three!"
sayMe 4 = "Four!"
sayMe 5 = "Five!"
sayMe x = "Not between 1 and 5"

nonExhaustivePatternMatching :: (Integral number) => number -> String
nonExhaustivePatternMatching 1 = "one"
nonExhaustivePatternMatching 2 = "two"
nonExhaustivePatternMatching 3 = "three"
nonExhaustivePatternMatching 4 = "four"
nonExhaustivePatternMatching 5 = "five"
-- there is no generic catcher after five

length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs

length'' :: (Num b) => [a] -> b
length'' [] = 0
length'' (_:xs) = length'' xs + 1

-- page 54

sum' :: (Num a) => [a] -> a
sum' xs = foldl (\acc x -> acc + x) 0 xs

-- enum, page 97

data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday deriving (Eq, Ord, Show, Read, Bounded, Enum)

-- BST, page 104..

data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)
--instance Show (Tree a) where
--show EmptyTree = "[]"
--show x = "__"

singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree
treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node a left right)
    | x == a = Node x left right
    | x < a = Node a (treeInsert x left) right
    | x > a = Node a left (treeInsert x right)

treeElem :: (Ord a) => a -> Tree a -> Bool
treeElem x EmptyTree = False
treeElem x (Node a left right)
    | x == a = True
    | x < a = treeElem x left
    | x > a = treeElem x right