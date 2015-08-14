-- taken from https://twitter.com/edofic/status/618420499576655872

fizzbuzz n = take n $ zipWith ($) (cycle [s,s,f,s,b,f,s,s,f,b,s,f,s,s,fb]) [1..] where
  s=show
  f=const"fizz"
  b=const"buzz"
  fb=const"fizzbuzz"

binaryValues = cycle [1,2]
-- generates list with [1,2,1,2,...]
-- use it as: take 10 binaryValues

-- generates an infinite list of repeated elements, removing each second value
-- [1,1,3,3,5,5,...]
repeatedNumbers = zipWith ($) (cycle [id,(\x -> x - 1)]) [1..]

-- shorter way of generating repeatedNumbers, using the partial function add
repeatedNumbers' = zipWith ($) (cycle [id,(-1 +)]) [1..]

-- an infinite list where one is positive, one is negative
posNeg =  zipWith ($) (cycle [id,negate]) [1..]

-- equivalent to posNeg
posNeg' = zipWith (\x -> ((x)) ) (cycle [id,negate]) [1..]

-- an infinite list where this pattern repeats: positve, negative, positive
posNegPos =  zipWith ($) (cycle [id,negate,id]) [1..]
