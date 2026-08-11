lista_to_num :: [Int] -> Int
lista_to_num l = snd (foldr (\x (i, y) -> (i + 1, x * 10^i + y)) (0,0) l)

main :: IO ()
main = do
    print (lista_to_num [1, 2, 3])
    print (lista_to_num [0, 9, 0, 9, 0])