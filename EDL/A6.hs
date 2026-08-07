divida :: [(Int,Int)] -> Int
divida l = foldl (\acc x -> round (fromIntegral (acc + fst x) * (1.0 + (fromIntegral (snd x) / 100.0)))) 0 l

main :: IO()
main = print (divida [(10,10), (9,20), (-10,0)])