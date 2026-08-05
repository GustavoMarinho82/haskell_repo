{- Eh possivel fazer todas essas funcoes com 
:, ++, head, tail, map, filter e fold -}

lista = [10, 11, 12, 13, 14, 15]

tamanho = length lista
vazio = null lista
contrario = reverse lista

primeiros_tres = take 3 lista   -- Retorna a lista com somente seus x primeiros elementos
resto = drop 3 lista            -- Remove os x primeiros elementos da lista e retorna ela

maior = maximum lista
menor = minimum lista

somatorio = sum lista
produtorio = product lista

tem_na_lista = 14 `elem` lista   -- Diz se ha um elemento igual a x na lista

lista_inf1 = cycle [1, 2]       -- [1, 2, 1, 2, 1, ...]
lista_inf2 = repeat [10]        -- [10, 10, 10, ...]
lista_nao_inf = replicate 5 1   -- [1, 1, 1, 1, 1]

list_comp1 = [x*2 | x <- [1..10]]
-- [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]

list_comp2 = [x*2 | x <- [1..10], x*2 > 6]
-- [8, 10, 12, 14, 16, 18, 20]

list_comp3 = [x | x <- [21..49], x `mod` 7 == 0]
-- [21, 28, 35, 42, 49]