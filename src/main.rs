#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use]
extern crate rocket;
#[macro_use]
extern crate rocket_contrib;

mod auth;

use auth::Token;
use rocket_contrib::json::{Json, JsonValue};

#[get("/")]
fn get(_t: Token) -> JsonValue {
    json!({"name": "value"})
}

fn main() {
    rocket::ignite()
        .mount("/ip4", routes![get])
        .attach(auth::auth_fairing())
        .launch();
}
