
main = do
        input <- readFile "day-2-input.txt"
        print $ process input

process = show . sum . map exactQuotient . map parse . map words . lines

parse :: [String] -> [Int]
parse = map read

exactQuotient :: [Int] -> Int
exactQuotient = head . map fst . filter ((== 0) . snd) . map (uncurry quotRem) . filter (uncurry (/=)) . combinations

combinations :: [Int] -> [(Int, Int)]
combinations xs = [ (x,y) | x<-xs, y<-xs ]
