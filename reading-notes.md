2015-05-28 1948

Apparently, the function definition doubleMe does not work on the REPL. this has been solved: page 16: Remember, if you’re trying to define this function inside GHCi, you have to include a
let before the function name. However, if you’re defining this function inside a script
and then loading that script into GHCi, you don’t have to mess around with let.

There is autocomplete on the REPL, hit TAB

Page 7: the apostrophe indicates a strict version of a function (i.e., one that is not lazy) or a slightly modified function or a variable with a similar name. [Could it also be used for the first derivative?]

Page 7: definition / name: when a function does not take any parameter

@: how to save the commands in the repl to a file?

Page 8: after using let, this variable is not found on the repl (?)

Examples:

Page 8:
```
*Main> 'a ':" small"
<interactive>:54:5: parse error on input `:'

; fails because 'a ' is not a character. the error is not very descriptive, though

*Main> "a"++" small"
"a small"
```

Page 9:
```
*Main> [1,2,3] !! (-1)
*** Exception: Prelude.(!!): negative index
```

Page 38:
```
*Main> 1:1:1:[]
[1,1,1]
*Main> 1:1:1:[] > 1:1:[]
True
*Main> 1:1:1:[] == 1:1:[]
False
```

Page 14:
```
Prelude> take (head [4,2]) [1..]
[1,2,3,4]
Prelude> take (head [4,2]) [1,pi..]
[1.0,3.141592653589793,5.283185307179586,7.424777960769379]
Prelude> take (head [4,2]) [0,pi..]
[0.0,3.141592653589793,6.283185307179586,9.42477796076938]
```

Page 16:
```
[2,4,6,8,10,12]
Prelude> [x<=12|x<-[x*2|x<-[1..10]]
<interactive>:16:27:
    parse error (possibly incorrect indentation or mismatched brackets)
Prelude> [x<=12|x<-[x*2|x<-[1..10]]]
[True,True,True,True,True,True,False,False,False,False]
Prelude> [x|x<-[x*2|x<-[1..10]]]
[2,4,6,8,10,12,14,16,18,20]
```

Destructuring is possible

Operator !! is for accessing arrays. Example
```
*Main> [1,2,3] !! 1
2
```

Belonging to a list (java: contains): eleme
```
4 `elem` [1, 2, 3, 4]
True

1 `elem` [0]
False

elem 1 [0]
False
```

page 14:
```
*Main> take 20 [1,2..]
[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
```

Page 19:
Applying list comprehensions to solve equations:

```
*Main> [ (a,b,c) | a <- [1..24], b <- [1..24], c <- [1..24], (a ^ 2) + (b ^ 2) - (c ^ 2) ==0, a + b + c == 24, a <= 10, b <= 10]
[(6,8,10),(8,6,10)]
```

this gives two solutions but are equivalent.

in the book is expressed as:
```
*Main> [ (a,b,c) | c <- [1..10] , b <- [1..c] , a <- [1..b] , a^2 + b^2 == c^2, a+b+c == 24]
[(6,8,10)]
```

To only return one solution, do:

```
*Main> [ (a,b,c) | c <- [1..10] , b <- [1..10] , a <- [1..10] , a^2 + b^2 == c^2, a+b+c == 24, a <= b, b <= c]
[(6,8,10)]
*Main>
```

! Java does not have type inference?

finding the type of an expression:
```
*Main> let x = 5
*Main> x == 4
False
*Main> :t x == 4
x == 4 :: Bool
*Main> :t True
True :: Bool
*Main> :t 4==5
4==5 :: Bool
*Main>
```

NOTE: "::" reads as "has type of" (page 20)

:t for functions:

```
*Main> :t doubleMe
doubleMe :: Num a => a -> a
```

```
*Main> :t head
head :: [a] -> a
```

a is not a type, because it is lowercase (types are uppercase). it is a type variable. (java: generic)

read is used for parsing from a string.

```
*Main> read "2" * 2
4
```

note: 

```
*Main> read "1"
*** Exception: Prelude.read: no parse
```

because it doesn't know what type this is.

```
*Main> read "1" :: Int
1
```

! how to find operators that match the given numbers?

```
 [x | x <- [LT .. GT], 1 (x) 2]
```

 does not work

Page 26:

```
 *Main> :t (^)
(^) :: (Num a, Integral b) => a -> b -> a
*Main> :t (*)
(*) :: Num a => a -> a -> a
```


Page 26:
```
*Main> (length [1,2]) + 1.1

<interactive>:106:18:
    No instance for (Fractional Int) arising from the literal `1.1'
    In the second argument of `(+)', namely `1.1'
    In the expression: (length [1, 2]) + 1.1
    In an equation for `it': it = (length [1, 2]) + 1.1
*Main> fromIntegral (length [1,2]) + 1.1
3.1
```


2015-06-09-1847

list comprehensions allow for pattern matching:

```
*Main> [a+b | (a,b) <- [(1,2), (3,4)] ]
[3,7]
```

(this is similar to an example in page 29)

```
*Main> [a+b | (a,b) <- [(1,2), (3,4), (5,6)] ]
[3,7,11]
```

List comprehensions allow for infinite lists:

the first twenty natural numbers:

```
*Main> (take 20 [x | x <- [1..]])
[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
```

the first 20 multiples of two:

```
*Main> (take 20 [x | x <- [0..], x `mod` 2 == 0])
[0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38]
```

the first twenty multiples of two and three:

```
*Main> (take 20 [x | x <- [0..], x `mod` 2 == 0, x `mod` 3 == 0])
[0,6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96,102,108,114]
```

the first part can be used as a 'map':

```
*Main> (take 20 [x `mod` 2 == 0 | x <- [0..]])
[True,False,True,False,True,False,True,False,True,False,True,False,True,False,True,False,True,False,True,False]
```

The list comprehensions can be chained (this has already been seen):

```
*Main> (take 20 [x|x<-[x `mod` 2 == 0 | x <- [0..]], x == True])
[True,True,True,True,True,True,True,True,True,True,True,True,True,True,True,True,True,True,True,True]
```

Note: in this case, as the list is infinite, there will always be 20 True, given, that we are filtering x == True and taking 20.

```
*Main> let allNaturals = [0..]
*Main> (take 20 allNaturals )
[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]

*Main> let numberAndItsEvenness = [(x, x `mod` 2 ==0)|x<-allNaturals]
*Main> (take 20 numberAndItsEvenness )
[(0,True),(1,False),(2,True),(3,False),(4,True),(5,False),(6,True),(7,False),(8,True),(9,False),(10,True),(11,False),(12,True),(13,False),(14,True),(15,False),(16,True),(17,False),(18,True),(19,False)]


*Main> let evenNumbers = [x| (a,b) <- numberAndItsEvenness , b == True]
*Main> (take 20 evenNumbers )
[GT,GT,GT,GT,GT,GT,GT,GT,GT,GT,GT,GT,GT,GT,GT,GT,GT,GT,GT,GT]
```

??: what is x, then?

```
*Main> x
GT
```

Failed try to store the list and its components at the same time:

```
*Main> let evenNumbers = [x| x=(a,b) <- numberAndItsEvenness , b == True]

<interactive>:135:24: parse error on input `='
*Main> let evenNumbers = [x| let x = (a,b), x <- numberAndItsEvenness , b == True]

<interactive>:136:32: Not in scope: `a'

<interactive>:136:34: Not in scope: `b'

<interactive>:136:66: Not in scope: `b'
*Main> let evenNumbers = [x| x <- numberAndItsEvenness , (a,b) = x b == True]

<interactive>:137:57: parse error on input `='
*Main> let evenNumbers = [x| x <- numberAndItsEvenness , (a,b) = x, b == True]

<interactive>:138:57: parse error on input `='
*Main> let evenNumbers = [x| x <- numberAndItsEvenness , (a,b) = x, b == True]
```

This can be solved with "patterns" (explained in page 30)

```
*Main> let numberAndItsEvenness = [(0, True), (1,False), (2, True)]
*Main> let evenNumbers = [x| x@(a, b) <- numberAndItsEvenness, b == True]
*Main> evenNumbers
[(0,True),(2,True)]
```

Documentation on list comprehensions: https://wiki.haskell.org/List_comprehension

This has the downside of destructuring the tuple to later assemble it again:

```
*Main> let evenNumbers = [(a,b)| (a, b) <- numberAndItsEvenness, b == True]
*Main> take 20 evenNumbers
[(0,True),(2,True),(4,True),(6,True),(8,True),(10,True),(12,True),(14,True),(16,True),(18,True),(20,True),(22,True),(24,True),(26,True),(28,True),(30,True),(32,True),(34,True),(36,True),(38,True)]
```

But can be used to filter and only get the result:

```
*Main> let evenNumbers = [a| (a, b) <- numberAndItsEvenness, b == True]
*Main> take 20 evenNumbers
[0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38]
```

but is the same as:

```
*Main> let evenNumbers = [x| x<-[0,2..]]
*Main> take 20 evenNumbers
[0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38]
```

(because it can be simplified)

or, without intermediate steps: 

```
*Main> let evenNumbers = [x| x<-[0..], x `mod` 2 == 0]
*Main> take 20 evenNumbers
[0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38]
```

Generating some primes:

```
*Main> let coprimesWith2 = 2:[x|x<-allPossiblePrimes, x `mod` 2 /= 0]
*Main> take 20 coprimesWith2
[2,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35,37,39]

*Main> let coprimesWith2And3 = 3:[x|x<-coprimesWith2, x `mod` 3 /= 0]
*Main> take 20 coprimesWith2And3
[3,2,5,7,11,13,17,19,23,25,29,31,35,37,41,43,47,49,53,55]
```

Note that the list is no longer sorted

? Is it possible using only list comprehensions to generate prime numbers? (even if this way of calculating them is inefficient)

Page 27: pattern matching

```
*Main> :l baby.hs
[1 of 1] Compiling Main             ( baby.hs, interpreted )
Ok, modules loaded: Main.
*Main> nonExhaustivePatternMatching 5
"five"
*Main> nonExhaustivePatternMatching 6
"*** Exception: baby.hs:(22,1)-(26,39): Non-exhaustive patterns in function nonExhaustivePatternMatching
```

Page 29: a runtime error can be produced with the keyword / operator (?) ``error``:

```
head' :: [a] -> a
head' [] = error "Can't call head on an empty list, dummy!"
head' (x:_) = x
```

Page 30: a list with only one element is called a ``a singleton list``

Page 30: apparently, there is no problem defining the recursion as the last part of the function or not:

```
length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs

length'' :: (Num b) => [a] -> b
length'' [] = 0
length'' (_:xs) = length'' xs + 1

*Main> :l baby.hs
[1 of 1] Compiling Main             ( baby.hs, interpreted )
Ok, modules loaded: Main.
*Main> let st = "qwertyuiopasdfghjklñ."
*Main> (length st == length' st) && (length'' st == length st)
True
```

Page 31: guards. similar to an if-then-else.

evaluates boolean expressions, and enters only on the first one.

Page 35: defining variables in the local scope:

```
Prelude> [let square x = x * x in (square 5, square 3, square 2)]
[(25,9,4)]
```

Therefore, they're not available outside the local scope:

```
Prelude> let square x = x * x in (square 5, square 3, square 2)
(25,9,4)
Prelude> square

<interactive>:223:1: Not in scope: `square'
```

Page 45:

```
compareWithHundred :: (Num a, Ord a) => a -> Ordering
compareWithHundred x = compare 100 x

compareWithHundred :: (Num a, Ord a) => a -> Ordering
compareWithHundred = compare 100
```

are equivalent. See 

```
compareWithHundred x = compare 100 x
```

as an equation. As x is on both sides, it can be removed

Page 48: map
Page 49: filter

Page 54: Lambda

Note: it cannot be written directly to the GHCi:

```
Prelude> (\a b -> a + b)

<interactive>:234:1:
    No instance for (Show (a0 -> a0 -> a0))
      arising from a use of `print'
    In a stmt of an interactive GHCi command: print it

it has to be assigned to a variable:

Prelude> let sum = (\a b -> a + b)
Prelude> sum 1 2
3
```


Page 55: why sometimes foldr and others foldl?

for example, for implementing ``map``, access to the right-most element (last) of a list is expensive. Doing it to the left-most (first) is cheap:

Wrong implementation (defect in order):

-- the collection is not expressed
*Main> let map_left f = foldl (\acc current -> [(f current)]++acc) []
*Main> map_left succ [1,2]
[3,2]

Wrong implementation (expensive):

-- the collection is not expressed

```
*Main> let map_left f = foldl (\acc current -> acc++[(f current)]) []
*Main> [1]++[2]
[1,2]
*Main> map_left succ [1,2]
[2,3]
*Main> map_left succ (map_left succ [1,2])
[3,4]
```

Wrong (typo in syntax "::" vs ":"):

```
*Main> let map_right f = foldr (\current acc -> (f current)::acc) []

<interactive>:271:43:
    Couldn't match expected type `a -> acc' with actual type `t'
      because type variable `acc' would escape its scope
    This (rigid, skolem) type variable is bound by
      an expression type signature: acc
      at <interactive>:271:42-57
    Relevant bindings include
      current :: a (bound at <interactive>:271:27)
      f :: t (bound at <interactive>:271:15)
      map_right :: t -> [a] -> [t1] (bound at <interactive>:271:5)
    In the expression: (f current) :: acc
    In the first argument of `foldr', namely
      `(\ current acc -> (f current) :: acc)'
    In the expression: foldr (\ current acc -> (f current) :: acc) []
```

After fixing the syntax error: 

```
*Main> let map_right f = foldr (\current acc -> (f current):acc) []
*Main> map_right succ [1,2]
[2,3]
```

to see the time difference, activate this in the REPL:

```
*Main> :set +s
*Main> map_left succ (take 10000 [1..])
[...]
(5.48 secs, 2.081.744.552 bytes)
```

After 5 executions, the results are: average = 5,89s, stdev = 0,54s. values=6,08;6,75;5,43;5,71;5,48;5,89;

```
*Main> map_right succ (take 10000 [1..])
(2.20 secs,    19.293.144 bytes)
```

After 5 executions, the results are: average = 2,17s, stdev = 0,33s. values=2,37;1,79;2,09;1,98;2,62;2,17;


Page 55: 

One big difference is that right folds
work on infinite lists, whereas left ones don't!

Page 56: implementing core functions using foldr1, foldr, foldl1, foldl:

```
*Main> let head' = foldr1 (\x _ -> x)
(0.02 secs, 0 bytes)
*Main> head' (take 1000000 [1..])
1
(0.00 secs, 0 bytes)
*Main> head (take 1000000 [1..])
1
(0.00 secs, 0 bytes)
```

Conclusion, even though the book says that is better to implement head using pattern matching, in terms of performance, it is apparently the same. Also, the measuring is too high for these amounts

Page 56: scanr1

```
*Main> scanr1 (+) [1,2,3]
[6,5,3]
```

Page 56: scanl1

```
*Main> scanl1 (+) [1,2,3]
[1,3,6]
```

This can be seen as the list of f([x 0..k]), where k=0..n:

```
*Main> foldl1 (+) [1]
1
*Main> foldl1 (+) [1,2]
3
*Main> foldl1 (+) [1,2,3]
6
```

-- warning: the first [1,2,3] are the elements to take, not the values
```
*Main> [foldl1 (+) x| size <- [1,2,3], let x =(take size [1,2,3])]
[1,3,6]
```

More generic, without derived attributes (such as ``length xs``):

```
*Main> let xs = [1,2,3]
*Main> [foldl1 (+) x| size <- [1..(length xs)], let x = (take size xs)]
[1,3,6]
```

Note: filter does not work on infinite lists, prefer takeWhile

Page 61: Import

``Import`` in a script

``:m + Data.List`` in the GHCI

Haven't read

```
*Main> ["7."++ show x|x<-[3..6]]
["7.3","7.4","7.5","7.6"]
```

finish reading at record syntax, page 88


How to create methods for a record:

```
firstName :: Person -> String
firstName (Person firstname _ _ _ _ _) = firstname
lastName :: Person -> String
lastName (Person _ lastname _ _ _ _) = lastname
age :: Person -> Int
age (Person _ _ age _ _ _) = age
```

Note: The equivalent for this in clojure: you create a record (either a record itself or a map) and create functions to manipulate said data. 

How to define a record:

````
data Person = Person { firstName :: String
					 , lastName :: String
					 , age :: Int
					 , height :: Float
					 , phoneNumber :: String
					 , flavor :: String
					 } deriving (Show)
````

Page 90 - Type parameters:

```
*Main> :t Nothing
Nothing :: Maybe a
```

Destructuring in the record (fragment, page 92):

```
tellCar (Car {company = c, model = m, year = y})
```

Note: So don't put type constraints into data declarations even if it seems to make sense, because you'll
have to put them into the function type declarations either way. (page 93). Idiomatic Haskell.

Defining an enum:

````
*Main> data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday |Sunday deriving (Eq, Ord, Show, Read, Bounded, Enum)
*Main> minBound :: Day
Monday
````

Getting the range of values:

````
*Main> [minBound :: Day .. maxBound::Day]
[Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday]
````

this is equivalent to this:

````
*Main> [minBound..maxBound] :: [Day]
[Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday]
````

if you don't specify the type, it returns this:

````
*Main> [minBound..maxBound]
[()]
````

This will output all Int, from the minimum to the maximum (warning: this might take a while)

````
*Main> [minBound..maxBound] :: [Int]
[-2147483648,-2147483647,-2147483646,-2147483645,-2147483644,-2147483643,-2147483642,-2147483641,-2147483640,-2147483639,-2147483638,-2147483637,-2147483636,-2147483635,-2147483634,-2147483633,-2147483632,-2147483631,-2147483630,-2147483629,-2147483628,-2147483627,-2147483626,-2147483625,-2147483624,-2147483623,-2147483622,-2147483621,-2147483620,-2147483619,-2147483618,-2Interrupted.
````

2015-06-20 1151

````
*Main> [minBound..minBound] :: [Day]
[Monday]

*Main> minBound :: Day
Monday

*Main> [minBound..minBound] :: Day

<interactive>:7:1:
    Couldn't match expected type `Day' with actual type `[t0]'
    In the expression: [minBound .. minBound] :: Day
    In an equation for `it': it = [minBound .. minBound] :: Day
````

finding its position:

````
*Main> (minBound :: Day) `Data.List.elemIndex` ([minBound..maxBound] :: [Day])
Just 0
*Main> (maxBound :: Day) `Data.List.elemIndex` ([minBound..maxBound] :: [Day])
Just 6
````

(Source for this function is http://stackoverflow.com/questions/1496980/finding-index-of-element-in-a-list-in-haskell, also page 72)

Page 98: Data clump can be done using type synonyms

Page 102: fixity declarations

Page 103: insight on pattern matching:


>Because pattern matching works (only) on constructors, we can match for stuff like that, normal prefix constructors or stuff like 8 or 'a', which are basically constructors for the numeric and character types, respectively.

Page 104: insight on pointers:

> Haskell doesn't really have a concept of pointer, just values

Page 109:

Getting info from a type:

````
*Main> :info Day
data Day
  = Monday
  | Tuesday
  | Wednesday
  | Thursday
  | Friday
  | Saturday
  | Sunday
        -- Defined at baby.hs:44:1
instance Bounded Day -- Defined at baby.hs:44:112
instance Enum Day -- Defined at baby.hs:44:121
instance Eq Day -- Defined at baby.hs:44:91
instance Ord Day -- Defined at baby.hs:44:95
instance Read Day -- Defined at baby.hs:44:106
instance Show Day -- Defined at baby.hs:44:100
````

Page 115:

````
:k for kind
:t for type
````

Page 160:

Definitions for errors (in a ``catch``). These are predicates acting on IOError:

````
isAlreadyExistsError
isDoesNotExistError
isAlreadyInUseError
isFullError
isEOFError
isIllegalOperation
isPermissionError
isUserError
````

end reading session at page 176 (book page)
