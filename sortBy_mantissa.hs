import Data.List (sortBy)
import Data.Function (on)

obterMantissa :: Int -> Integer
obterMantissa x = fst (decodeFloat (fromIntegral x :: Double))

main :: IO ()
main = do
    let lista = [7, 1024, 3, 10, 42, 1, 100]

    print ("Lista original: " ++ show lista)
    print ("Ordenada pela mantissa: " ++ show (sortBy (compare `on` obterMantissa) lista))
    
{-- Output:
"Lista original: [7,1024,3,10,42,1,100]"
"Ordenada pela mantissa: [1024,1,10,42,3,100,7]"
--}