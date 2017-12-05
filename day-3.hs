input = 265149

data Move = R | U | L | D deriving (Show, Read, Enum)

main = print
    $ show
    $ manhattanDistance
    $ coords input
  where
    coords n = foldr move (0,0) $ take (n-1) actions
      where
        counts = concatMap (replicate 2) [1..] -- 1,1,2,2,3,3,4,4...
        countedActions = zip counts $ cycle [R,U,L,D] -- r1,u1,l2,d2,r3,u3,l4...
        actions = concatMap (\x -> replicate (fst x) (snd x)) countedActions -- rullddrrruuullllddddrrrrr...
    manhattanDistance (x,y) = (abs x) + (abs y)

move R (x,y) = (x+1, y)
move U (x,y) = (x, y+1)
move L (x,y) = (x-1, y)
move D (x,y) = (x, y-1)
