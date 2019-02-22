#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use]
extern crate rocket;

mod auth;

use auth::Token;

#[get("/")]
fn index(_t: Token) -> &'static str {
    "Hello, world!"
}

fn main() {
    rocket::ignite()
        .mount("/", routes![index])
        .attach(auth::auth_fairing())
        .launch();
}
