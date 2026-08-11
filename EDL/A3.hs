indices :: [a] -> [(Int,a)]
indices l = foldr fn_aux [] l where
    fn_aux x [] = [(length l - 1, x)]
    fn_aux x acc@((i, _) : _) = (i - 1, x) : acc

main :: IO ()
main = print (indices [10, 20, 30])