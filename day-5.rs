use std::fs::File;
use std::io::prelude::*;

fn main () {
    let mut file = File::open("day-5-input.txt").expect("file not found");

    let mut input = String::new();
    file.read_to_string(&mut input).expect("something went wrong reading the file");

    println!("{:?}", input.lines().count());
}
