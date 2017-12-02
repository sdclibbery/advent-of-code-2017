
main = do
        input <- readFile "day-2-input.txt"
        print $ process input

process = show . sum . map range . map parse . map words . lines

parse :: [String] -> [Int]
parse = map read

range xs = (maximum xs) - (minimum xs)
