data T a = Nil | N (T a) a (T a) deriving Show

t :: a -> T a
t x = N Nil x Nil

add :: (Ord a) => a -> T a -> T a
add v Nil = t v
add v (N l n r) 
    | n < v = N l n (add v r)
    | n == v = N l n r
    | n > v = N (add v l) n r

inOrder :: (Ord a) => T a -> [a]
inOrder Nil = []
inOrder (N l n r) = (inOrder l) ++ [n] ++ (inOrder r) 