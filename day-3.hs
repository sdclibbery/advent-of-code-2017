input = 265149

data Move = R | U | L | D deriving (Show, Read, Enum)

main = print
    $ show
    $ manhattanDistance
    $ coords input
  where
    manhattanDistance (x,y) = (abs x) + (abs y)
    counts = concatMap (replicate 2) [1..]
    countedActions = zip counts $ cycle [R,U,L,D]
    actions = concatMap (\x -> replicate (fst x) (snd x)) countedActions
    coords n = foldr move (0,0) $ take (n-1) actions

move R (x,y) = (x+1, y)
move U (x,y) = (x, y+1)
move L (x,y) = (x-1, y)
move D (x,y) = (x, y-1)
