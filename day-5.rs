use std::fs::File;
use std::io::prelude::*;

fn main () {
    let mut file = File::open("day-5-input.txt").expect("file not found");

    let mut input = String::new();
    file.read_to_string(&mut input).expect("something went wrong reading the file");

//    println!("{:?}", run( &mut [0, 3, 0, 1, -3] ));
    println!("{:?}", run(&mut input.lines().map(|x| x.parse().unwrap()).collect::<Vec<i32>>()) );
}

fn run (jumps: &mut [i32]) -> i32 {
    let mut pc: i32 = 0;
    let mut num_steps: i32 = 0;
    let num_jumps: i32 = (jumps.iter().count()) as i32;
    while pc >=0 && pc < num_jumps {
        let jump_index: usize = pc as usize;
        pc = pc + jumps[jump_index];
        jumps[jump_index] += 1;
        num_steps += 1;
    }
    return num_steps;
}
