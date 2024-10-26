pub fn collatz(mut n: u64) -> Option<u64> {
    if n == 0 {
        return None;
    }
    if n == 1 {
        return Some(0);
    }
    if n % 2 == 0 {
        return Some(1 + collatz(n / 2).unwrap());
    } else {
        return Some(1 + collatz(3 * n + 1).unwrap());
    }
}
