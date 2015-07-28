data MyTree a = EmptyTree | Node a (MyTree a) (MyTree a) deriving Show

singletonTree :: a -> MyTree a
singletonTree a = Node a EmptyTree EmptyTree

treeAdd :: (Ord a) => MyTree a -> a -> MyTree a
treeAdd EmptyTree v = singletonTree v
treeAdd (Node n left right) v
    | v < n = Node n (treeAdd left v) right
    | v == n = Node n left right
    | v > n = Node n left (treeAdd right v)
