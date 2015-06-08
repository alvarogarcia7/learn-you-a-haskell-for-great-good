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

*Main> 'a ':" small"
<interactive>:54:5: parse error on input `:'

; fails because 'a ' is not a character. the error is not very descriptive, though

*Main> "a"++" small"
"a small"

Page 9:
*Main> [1,2,3] !! (-1)
*** Exception: Prelude.(!!): negative index

Page 38:
*Main> 1:1:1:[]
[1,1,1]
*Main> 1:1:1:[] > 1:1:[]
True
*Main> 1:1:1:[] == 1:1:[]
False

Page 14:

Prelude> take (head [4,2]) [1..]
[1,2,3,4]
Prelude> take (head [4,2]) [1,pi..]
[1.0,3.141592653589793,5.283185307179586,7.424777960769379]
Prelude> take (head [4,2]) [0,pi..]
[0.0,3.141592653589793,6.283185307179586,9.42477796076938]

Page 16:
[2,4,6,8,10,12]
Prelude> [x<=12|x<-[x*2|x<-[1..10]]
<interactive>:16:27:
    parse error (possibly incorrect indentation or mismatched brackets)
Prelude> [x<=12|x<-[x*2|x<-[1..10]]]
[True,True,True,True,True,True,False,False,False,False]
Prelude> [x|x<-[x*2|x<-[1..10]]]
[2,4,6,8,10,12,14,16,18,20]

Destructuring is possible

Operator !! is for accessing arrays. Example

*Main> [1,2,3] !! 1
2

Belonging to a list (java: contains): eleme

4 `elem` [1, 2, 3, 4]
True

1 `elem` [0]
False

elem 1 [0]
False

page 14:
*Main> take 20 [1,2..]
[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
*Main>

Page 19:
Applying list comprehensions to solve equations:

*Main> [ (a,b,c) | a <- [1..24], b <- [1..24], c <- [1..24], (a ^ 2) + (b ^ 2) - (c ^ 2) ==0, a + b + c == 24, a <= 10, b <= 10]
[(6,8,10),(8,6,10)]

this gives two solutions but are equivalent.

in the book is expressed as:

*Main> [ (a,b,c) | c <- [1..10] , b <- [1..c] , a <- [1..b] , a^2 + b^2 == c^2, a+b+c == 24]
[(6,8,10)]

To only return one solution, do:

*Main> [ (a,b,c) | c <- [1..10] , b <- [1..10] , a <- [1..10] , a^2 + b^2 == c^2, a+b+c == 24, a <= b, b <= c]
[(6,8,10)]
*Main>