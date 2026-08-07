mapf :: (a -> b) -> [a] -> [b]
mapf f l = foldr (\x acc -> (f x) : acc) [] l

filterf :: (a -> Bool) -> [a] -> [a]
filterf f l = foldr (\x acc -> if (f x) then x : acc else acc) [] l

lista = [1..10]

main :: IO()
main = do
    print (map (\x -> x*2) lista)
    print (mapf (\x -> x*2) lista)
    print (filter (\x -> x `mod` 2 == 0) lista)
    print (filterf (\x -> x `mod` 2 == 0) lista)