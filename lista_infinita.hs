{- Por causa do lazy evaluation, criar listas infinitas eh 
possivel sem travar o programa na declaracao da lista -}

l = [1, 2, 3, 4, 5] ++ l

eh_quatro :: [Int] -> [Bool]
eh_quatro lista = map (\x -> x == 4) lista

-- foldr pode retornar se usado numa lista infinita, mas o foldl sempre ira travar

main :: IO()
main = do
    print (foldr (\x acc -> x || acc) False (eh_quatro l))
--  print (foldl (\acc x -> acc || x) False (eh_quatro l))   -- Descomente por sua conta e risco