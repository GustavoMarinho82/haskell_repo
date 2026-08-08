{--
  Primeiro eh criado uma lista temporaria de (Bool, Int) que será manipulada pelo foldr, onde se o Bool eh False a tupla esta 
apenas armazenando um elemento solto da lista, caso seja True, significa que a tupla ja esta armazenando a media de dois elementos.
  Depois eh feito um map pra deixar somente as medias calculadas, removendo os Bool e transformando em [Int] 
  Considera que a lista possui um numero par de elemtentos 
--}

fn_aux :: Int -> [(Bool, Int)] -> [(Bool, Int)]
fn_aux x [] = [(False, x)]                                                                      -- Caso base
fn_aux x ((True, med) : resto) = (False, x) : (True, med) : resto     -- Caso a media entre os dois anteriores ja esteja calculada
fn_aux x ((False, num) : resto) = (True, (x + num) `div` 2) : resto  -- Caso o primeiro da lista seja um numero solto

med_bim:: [Int] -> [Int]
med_bim l = map (\(_, med) -> med) (foldr fn_aux [] l)

main :: IO ()
main = print (med_bim [20, 20, 30, 20, 10, 0])