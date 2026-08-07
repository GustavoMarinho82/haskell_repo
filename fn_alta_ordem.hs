lista = [1..10]

mapa = map (\x -> x*2) lista

filtro = filter (\x -> x `mod` 2 == 0) lista

lista2 = [1, 2, 3]

fold_direita = foldr (\x acc -> x - acc) 0 lista2
-- [1, 2, 3, 0] -> [1, 2, 3 (3-0)] -> [1, -1 (2-3)] -> 2 (1+1)

fold_esquerda = foldl (\acc x -> acc - x) 0 lista2
-- [0, 1, 2, 3] -> [-1 (0-1), 2, 3] -> [-3 (-1-2), 3] -> -6 (-3-3)

main :: IO()
main = do
    putStrLn ("lista -> " ++ show lista)
    putStrLn ("map -> " ++ show mapa)
    putStrLn ("filter -> " ++ show filtro)
    putStrLn ("lista2 -> " ++ show lista2)
    putStrLn ("foldr -> " ++ show fold_direita)
    putStrLn ("foldl -> " ++ show fold_esquerda)