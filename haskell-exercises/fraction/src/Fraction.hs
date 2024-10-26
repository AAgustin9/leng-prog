module Fraction (Fraction, add, sub, mul, divide, hcf) where

type Fraction = (Int, Int)

-- Implement the `add` Function

add :: Fraction -> Fraction -> Fraction
add f1 f2 = (num, deno)
      where
          (n1,d1) = f1
          (n2,d2) = f2
          deno = d1*d2
          num = (n1*d2) + (n2*d1)

-- Implement the `sub` Function

sub :: Fraction -> Fraction -> Fraction
sub f1 f2 = (num, deno)
  where
      (n1,d1) = f1
      (n2,d2) = f2
      deno = d1*d2
      num = (n1*d2) - (n2*d1)

-- Implement the `mul` Function

mul :: Fraction -> Fraction -> Fraction
mul f1 f2 = (num, deno)
  where
     (n1,d1) = f1
     (n2,d2) = f2
     num = n1*n2
     deno = d1*d2


-- Implement the `divide` Function

divide :: Fraction -> Fraction -> Fraction
divide f1 f2
  | n2 == 0 || d2 == 0 = error "No zero division allowed"
  | otherwise = (num, deno)
  where
    (n1, d1) = f1
    (n2, d2) = f2
    num = n1 * d2
    deno = d1 * n2

-- Implement the `hcf` Function

hcf :: Int -> Int -> Int
hcf a b
  | b == 0     = abs a
  | otherwise  = hcf b (a `mod` b)



    