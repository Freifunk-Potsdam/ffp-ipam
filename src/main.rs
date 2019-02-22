#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use]
extern crate rocket;

use std::fs::File;
use std::io::{BufReader, BufRead};
use rocket::request::{self, Request, FromRequest};
use rocket::http::Status;
use rocket::Outcome;
use rocket::State;


struct Token(String);

#[derive(Debug)]
enum ApiKeyError {
    BadCount,
    Missing,
    Invalid,
}

impl<'a, 'r> FromRequest<'a, 'r> for Token {
    type Error = ApiKeyError;

    fn from_request(request: &'a Request<'r>) -> request::Outcome<Self, Self::Error> {
        let keys: Vec<_> = request.headers().get("x-api-key").collect();
        // let tokens = request.guard::<State<Vec<Token>>>().unwrap();
        let tokens = vec!["04345eb554c25cc5d7e02fb5e605ccf7af185e92e4237617abd3f43569abf5ae"];
        match keys.len() {
            0 => Outcome::Failure((Status::BadRequest, ApiKeyError::Missing)),
            1 => {
                for t in tokens {
                    if ct_compare(&t, keys[0]) {
                        return Outcome::Success(Token(keys[0].to_string()))
                    }
                }
                Outcome::Failure((Status::BadRequest, ApiKeyError::Invalid))
            },
            _ => Outcome::Failure((Status::BadRequest, ApiKeyError::BadCount)),
        }
    }
}

#[get("/")]
fn index(_t: Token) -> &'static str {
    "Hello, world!"
}

// constant time comparison
fn ct_compare(a: &str, b: &str) -> bool {
    if a.len() != b.len() {
        return false;
    }

    a.bytes().zip(b.bytes())
        .fold(0, |acc, (a, b)| acc | (a ^ b) ) == 0
}

fn main() {
    let tokens: Vec<String> = {
        let mut res = Vec::new();
        let bf = BufReader::new(File::open("tokens").unwrap());
        for line in bf.lines() {
            res.push(line.unwrap());
        }
        println!("Tokens in use: {:?}", res);
        res
    };

    rocket::ignite().mount("/", routes![index]).manage(tokens).launch();
}
