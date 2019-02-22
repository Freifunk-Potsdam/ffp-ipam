#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use]
extern crate rocket;

use rocket::fairing::AdHoc;
use rocket::http::Status;
use rocket::request::{self, FromRequest, Request};
use rocket::Outcome;
use rocket::State;
use std::fs::File;
use std::io::{BufRead, BufReader};

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
        let tokens = request.guard::<State<Vec<Token>>>().unwrap().inner();
        match keys.len() {
            0 => Outcome::Failure((Status::BadRequest, ApiKeyError::Missing)),
            1 => {
                for t in tokens {
                    if ct_compare(&t.0, keys[0]) {
                        return Outcome::Success(Token(keys[0].to_string()));
                    }
                }
                Outcome::Failure((Status::BadRequest, ApiKeyError::Invalid))
            }
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

    a.bytes()
        .zip(b.bytes())
        .fold(0, |acc, (a, b)| acc | (a ^ b))
        == 0
}

fn main() {
    rocket::ignite()
        .mount("/", routes![index])
        .attach(AdHoc::on_attach("Tokens", |rocket| {
            let tokens_config: Vec<rocket::config::Value> =
                rocket.config().get_slice("tokens").unwrap().clone();
            let mut tokens: Vec<Token> = Vec::new();
            for t in tokens_config {
                println!("{}", t);
                tokens.push(Token(t.as_str().unwrap().to_string()));
            }

            Ok(rocket.manage(tokens))
        }))
        .launch();
}
