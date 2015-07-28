data MyTree a = EmptyTree | Node a (MyTree a) (MyTree a) deriving Show

singletonTree :: a -> MyTree a
singletonTree a = Node a EmptyTree EmptyTree

treeAdd :: (Ord a) => MyTree a -> a -> MyTree a
treeAdd EmptyTree v = singletonTree v
treeAdd (Node n left right) v
    | v < n = nn (treeAdd left v) right
    | v == n = nn left right
    | v > n = nn left (treeAdd right v)
    where nn = Node n

inOrderString :: (Show a) => MyTree a -> String
inOrderString EmptyTree = ""
inOrderString (Node n left right) = (inOrderString left) ++ show n ++ " " ++ (inOrderString right)

