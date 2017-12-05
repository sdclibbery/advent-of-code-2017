input = 265149
--input = 23

--17  16  15  14  13
--18   5   4   3  12
--19   6   1   2  11
--20   7   8   9  10
--21  22  23---> ...

--0 0
--rullddrrruuullllddddrrrrruuuuulllllldddddd...
--r1 u1 l2 d2 r3 u3 l4 d4 r5 u5 l6 d6...

main = print
    $ show
    $ manhattanDistance
    $ coords input

data Move = R | U | L | D deriving (Show, Read, Enum)

manhattanDistance (x,y) = (abs x) + (abs y)

counts = concatMap (replicate 2) [1..]
countedActions = zip counts $ cycle [R,U,L,D]
actions = concatMap (\x -> replicate (fst x) (snd x)) countedActions
coords n = foldr move (0,0) $ take (n-1) actions

move R (x,y) = (x+1, y)
move U (x,y) = (x, y+1)
move L (x,y) = (x-1, y)
move D (x,y) = (x, y-1)
