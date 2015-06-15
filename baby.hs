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