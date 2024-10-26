use std::ops;

#[derive(Debug, PartialEq, Eq)]
pub struct Fraction(pub i32, pub i32);

impl Fraction {
    
}

impl ops::Add for Fraction {
    type Output = Fraction;

    fn add(self, other: Fraction) -> Fraction {
        let Fraction(n1, d1) = self;
        let Fraction(n2, d2) = other;

        let num = n1 * d2 + n2 * d1;
        let den = d1 * d2;
        Fraction(num, den)
    }
}

/// Calculate the Highest common factor between 2 numbers
fn hcf(a: i32, b: i32) -> i32 {
    if b == 0 {
        a.abs()
    } else {
        hcf(b, a % b)
    }
}

fn simplify(n: i32, d: i32) -> Fraction {
    let h = hcf(n, d);
    Fraction(n / h, d / h)
}
