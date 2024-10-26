module Shape where

data Point = Point { x::Double, y:: Double} deriving (Eq, Show)

data Circle    = Circle    Point Double deriving (Eq, Show)
data Rectangle = Rectangle Point Point deriving (Eq, Show)


-- A point from a tuple Pair
point::(Double, Double) -> Point
point (a, b) = Point {x = a, y = b}

-- The origin
origin::Point
origin = Point {x = 0, y = 0}

-- Rectangle from a Tuple where (x0 y0) == origin
rectangle::(Double, Double) -> Rectangle
rectangle (a, b) = Rectangle Point{x=0, y=0} Point{x=a, y=b}

base::Rectangle -> Double
base (Rectangle p1 p2) = (x p2) - (x p1)

height::Rectangle -> Double
height (Rectangle p1 p2) = (y p2) - (y p1)

-- Circle from radius
circle::Double -> Circle
circle rad = Circle Point{x=0, y=0} rad

-- Clase Shift

class Shift a where
   shift::a -> (Double, Double) -> a

instance Shift Point where
   shift p (c, d) = Point { x = (x p) + c, y = (y p) + d }

instance Shift Rectangle where
   shift (Rectangle p1 p2) (a, b) = Rectangle Point{x= (x p1)+a, y=(y p1)+b } Point{x=(x p2)+a , y=(y p2)+b }

instance Shift Circle where
   shift (Circle p rad) (a, b) = Circle Point{x= (x p)+a, y= (y p)+b} rad

-- Define the Surface class
class Surface a where
    surface::a -> Double

instance Surface Rectangle where
    surface (Rectangle p1 p2) = ((x p2) - (x p1)) * ((y p2) - (y p1))

instance Surface Circle where
    surface (Circle _ rad) = 3.141592653589793 * rad * rad
