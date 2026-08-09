{- A pontuacao de um numero eh definida pela soma dos algarismo que compoem o 
numero, cada um tem um valor arbitrario definido na funcao pontuacaoAlgarismo -}

import Data.List (sortBy)
import Data.Function (on)

pontuacaoAlgarismo :: Char -> Int
pontuacaoAlgarismo '8' = 5
pontuacaoAlgarismo '5' = 4
pontuacaoAlgarismo '0' = 3
pontuacaoAlgarismo '2' = 2
pontuacaoAlgarismo '4' = 1
pontuacaoAlgarismo '6' = -1
pontuacaoAlgarismo '9' = -2
pontuacaoAlgarismo '7' = -3
pontuacaoAlgarismo '1' = -4
pontuacaoAlgarismo '3' = -5
pontuacaoAlgarismo '-' = -1  -- numeros negativos sao mais feios

obterBeleza :: Int -> Int
obterBeleza num = sum (map pontuacaoAlgarismo (show num))

main :: IO ()
main = do
    let lista = [0, 1, 22, 50, 88, 240, -317, 505, 777, -868, 1337, -2026, 9401, 37173]
    
    print ("Lista original: " ++ show lista)
    print ("Ordenada pela beleza (decrescente): " ++ show (sortBy (flip compare `on` obterBeleza) lista))

{- Output:
"Lista original: [0,1,22,50,88,240,-317,505,777,-868,1337,-2026,9401,37173]"
"Ordenada pela beleza (decrescente): [505,88,-868,50,240,-2026,22,0,9401,1,777,-317,1337,37173]"
-}