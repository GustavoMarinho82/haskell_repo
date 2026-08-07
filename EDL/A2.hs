inverte :: [a] -> [a]
inverte l = foldl (\acc x -> x : acc) [] l

main :: IO ()
main = do
    print (inverte [1, 2, 3])
    print (inverte [[1, 2], [3, 4], [5, 6]])