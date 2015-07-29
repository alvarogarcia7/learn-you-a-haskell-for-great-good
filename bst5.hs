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

fromList :: (Ord v) => [v] -> T v
fromList (head:tail) = foldr add (t head) (reverse tail)

; how to use it
; > t 1
; > add 2 $ t 1
; > inOrder $ add 2 $ t1
