2015-05-28 1948

Apparently, the function definition doubleMe does not work on the REPL

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