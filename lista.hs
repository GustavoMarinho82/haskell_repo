nao_vetor = [1, 2, 3, 4, 5]      -- Nao eh um vetor, eh uma lista encadeada

lista1 = 0 : [1, 2, 3]           -- Insere no inicio da lista encadeada O(1)
lista2 = [-2, -1, 0] ++ [1, 2]   -- O(N)
removido = nao_vetor !! 4        -- Remove o elemento da posicao 4 e retorna ele

cabeca = head nao_vetor          -- retorna o primeiro elemento
cauda = tail nao_vetor           -- retorna a lista sem a cabeca (primeiro elemento)

main :: IO()
main = do 
    putStrLn ("nao_vetor -> " ++ show nao_vetor)
    putStrLn ("lista1 -> " ++ show lista1)
    putStrLn ("lista2 -> " ++ show lista2)
    putStrLn ("removido -> " ++ show removido)
    putStrLn ("head -> " ++ show cabeca)
    putStrLn ("tail -> " ++ show cauda)