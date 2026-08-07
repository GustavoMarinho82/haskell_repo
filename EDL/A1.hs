fn_aux :: Int -> [(Int, Int)] -> [(Int, Int)]
fn_aux x [] = [(0, x)]
fn_aux x acc = (fst (head acc) + 1, 10^(fst (head acc) + 1)*x) : acc

lista_to_num :: [Int] -> Int
lista_to_num l = foldr (\x acc -> snd x + acc) 0 (foldr (fn_aux) [] l)

main :: IO ()
main = do
    print (lista_to_num [1, 2, 3])
    print (lista_to_num [0, 9, 0, 9, 0])