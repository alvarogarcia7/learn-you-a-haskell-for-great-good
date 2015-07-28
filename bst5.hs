data T g = Nil | N (T g) g (T g) deriving Show

t :: a -> T a
t n = N Nil n Nil

add::(Ord v) => v -> T v -> T v
add v Nil = t v
add v (N l n r)
   | v < n = N (add v l) n r
   | v == n = N l n r
   | v > n = N l n (add v r)

inOrder :: T v -> [v]
inOrder Nil = []
inOrder (N l n r) = (inOrder l) ++ [n] ++ (inOrder r)