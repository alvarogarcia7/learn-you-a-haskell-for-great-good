data MyTree a = EmptyTree | Node a (MyTree a) (MyTree a) deriving Show

singletonTree :: a -> MyTree a
singletonTree a = Node a EmptyTree EmptyTree

treeAdd :: (Ord a) => MyTree a -> a -> MyTree a
treeAdd EmptyTree v = singletonTree v
treeAdd (Node v left right) a
    | a < v = Node v (treeAdd left a) right
    | a == v = Node v left right
    | a > v = Node v left (treeAdd right a)
