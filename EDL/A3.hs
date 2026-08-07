indices :: [a] -> [(Int,a)]
indices l = foldr (\x acc -> (length l - length acc - 1, x) : acc) [] l

main :: IO ()
main = print (indices [10, 20, 30])