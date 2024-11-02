fn main() {
    let mut x = 5;
    {
        x = 44;
        println!("x is {}", x);
    }
    println!("x is {}", x);
}