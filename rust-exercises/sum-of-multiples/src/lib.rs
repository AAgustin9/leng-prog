pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    // for i from 0 to limit, for ii in factor if i % ii == 0 ?: result = result + i
    let mut result = 0;
    for i in 0..limit {
        for ii in factors {
            if *ii != 0 && i % ii == 0 {
                result += i;
                break
            }
        }
    }
    result
}
