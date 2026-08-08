divida :: [(Int,Int)] -> Int
divida l = foldl (\acc (emp, juros) -> round (fromIntegral (acc + emp) * (1.0 + (fromIntegral juros / 100.0)))) 0 l

main :: IO()
main = print (divida [(10,10), (9,20), (-10,0)])