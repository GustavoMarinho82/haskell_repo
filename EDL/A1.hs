indices :: Int -> [(Int, Int)] -> [(Int, Int)]
indices x [] = [(0, x)]
indices x acc = (fst (head acc) + 1, x) : acc

lista_to_num :: [Int] -> Int
lista_to_num l = foldr (\(i, x) acc -> (x * 10^i) + acc) 0 (foldr (indices) [] l)

main :: IO ()
main = do
    print (lista_to_num [1, 2, 3])
    print (lista_to_num [0, 9, 0, 9, 0])