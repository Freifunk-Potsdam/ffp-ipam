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
extern crate ipnetwork;

mod auth;
pub mod schema;

use auth::Token;
use rocket_contrib::json::{Json, JsonValue};
use self::diesel::prelude::*;
use schema::ip4s;
use schema::ip4s::dsl::*;
use diesel::pg::PgConnection;
use rocket_contrib::databases::diesel as rocket_diesel;
use ipnetwork::IpNetwork;

#[database("pg_db")]
struct DbConn(rocket_diesel::PgConnection);


#[derive(Queryable, AsChangeset, Serialize, Deserialize, Debug)]
pub struct Ip4 {
    pub ip: IpNetwork,
    pub node_name: String,
    pub location: String,
    pub contact: String,
}

#[get("/")]
fn get(_t: Token, conn: DbConn) -> JsonValue {
    let res = ip4s.load::<Ip4>(&conn.0).unwrap();
    println!("{:?}", res);
    // json!({"name": "value"})
    JsonValue(serde_json::to_value(&res).unwrap())
    // JsonValue(res)
}

fn main() {
    rocket::ignite()
        .mount("/ip4", routes![get])
        .attach(DbConn::fairing())
        .attach(auth::auth_fairing())
        .launch();
}
