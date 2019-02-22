#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use]
extern crate rocket;
#[macro_use]
extern crate rocket_contrib;
#[macro_use]
extern crate diesel;
extern crate serde;
#[macro_use]
extern crate serde_derive;
extern crate serde_json;

mod auth;
pub mod schema;

use auth::Token;
use rocket_contrib::json::{Json, JsonValue};
use self::diesel::prelude::*;
use schema::ip4s;
use schema::ip4s::dsl::*;
use diesel::pg::PgConnection;

#[derive(Queryable, AsChangeset, Serialize, Deserialize)]
pub struct Ip4 {
    pub id: std::net::Ipv4Addr,
    pub node_name: String,
    pub location: String,
    pub contact: String,
}

#[get("/")]
fn get(_t: Token) -> JsonValue {
    // let res = ip4s.load::<Ip4>(
    json!({"name": "value"})
}

fn main() {
    rocket::ignite()
        .mount("/ip4", routes![get])
        .attach(auth::auth_fairing())
        .launch();
}
