data MyTree a = EmptyTree | Node a (MyTree a) (MyTree a) deriving Show

singleton :: x -> MyTree
singleton x = MyTree x EmptyTree EmptyTree