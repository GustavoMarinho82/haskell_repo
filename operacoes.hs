soma x y = x + y

subtracao x y = x - y

multiplicacao x y = x * y

divisao x y = x / y

ou x y = if (x == True) 
    then True 
    else y

e x y = if (x == False) 
    then False 
    else y

ou_exclusivo :: Bool -> Bool -> Bool
ou_exclusivo x y = x /= y

-- Concatena listas (inclui strings)
concatenar :: [a] -> [a] -> [a]
concatenar x y = x ++ y

-- Mais otimizado que ++, ja que insere no inicio da lista encadeada
concatenar_inicio :: a -> [a] -> [a]
concatenar_inicio x y = x : y