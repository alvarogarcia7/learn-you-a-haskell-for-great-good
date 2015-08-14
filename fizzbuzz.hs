-- taken from https://twitter.com/edofic/status/618420499576655872

fizzbuzz n = take n $ zipWith ($) (cycle [s,s,f,s,b,f,s,s,f,b,s,f,s,s,fb]) [1..] where
  s=show
  f=const"fizz"
  b=const"buzz"
  fb=const"fizzbuzz"