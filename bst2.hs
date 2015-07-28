data MyTree a = EmptyTree | Node a (MyTree a) (MyTree a) deriving Show

singletonTree :: a -> MyTree a
singletonTree a = Node a EmptyTree EmptyTree

treeAdd :: (Ord a) => a -> MyTree a -> MyTree a
treeAdd v EmptyTree = singletonTree v
treeAdd v (Node n left right)
    | v < n = nn (treeAdd v left) right
    | v == n = nn left right
    | v > n = nn left (treeAdd v right)
    where nn = Node n

inOrderString :: (Show a) => MyTree a -> String
inOrderString t = toString (inOrder t)

toString :: (Show a) => [a] -> String
toString [] = ""
toString (head:tail) = show head ++ " " ++ (toString tail)

inOrder :: MyTree a -> [a]
inOrder EmptyTree = []
inOrder (Node n left right) =  (inOrder left) ++ [n] ++ (inOrder right)

