use std::fs::File;
use std::io::prelude::*;
use std::collections::HashSet;

fn is_valid (pass_phrase: &str) -> bool {
    let mut used_words = HashSet::new();
    for word in pass_phrase.split_whitespace() {
        if used_words.contains(word) {
            return false;
        }
        used_words.insert(word);
    }
    return true;
}

fn main () {
    let mut file = File::open("day-4-input.txt").expect("file not found");

    let mut input = String::new();
    file.read_to_string(&mut input).expect("something went wrong reading the file");

    println!("{:?}", input.lines().filter(|&l| is_valid(l)).count());
}
