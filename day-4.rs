use std::fs::File;
use std::io::prelude::*;
use std::collections::HashSet;
use std::iter::FromIterator;

fn is_valid (pass_phrase: &str) -> bool {
    let mut used_words = HashSet::new();
    for word in pass_phrase.split_whitespace() {
        let sorted_word = sort_word(&word);
        if used_words.contains(&sorted_word) {
            return false;
        }
        used_words.insert(sorted_word);
    }
    return true;
}

fn sort_word (word: &str) -> String {
    let s_slice: &str = &word[..];

    let mut chars: Vec<char> = s_slice.chars().collect();
    chars.sort_by(|a, b| b.cmp(a));

    return String::from_iter(chars);
}

fn main () {
    let mut file = File::open("day-4-input.txt").expect("file not found");

    let mut input = String::new();
    file.read_to_string(&mut input).expect("something went wrong reading the file");

    println!("{:?}", input.lines().filter(|&l| is_valid(l)).count());
}
