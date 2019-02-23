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
extern crate ipnetwork;
extern crate serde_json;

mod auth;
pub mod schema;

use self::diesel::prelude::*;
use auth::Token;
use diesel::pg::PgConnection;
use ipnetwork::IpNetwork;
use rocket_contrib::databases::diesel as rocket_diesel;
use rocket_contrib::json::{Json, JsonValue};
use schema::ip4s;
use schema::ip4s::dsl::*;
use std::collections::HashMap;

#[database("pg_db")]
struct DbConn(rocket_diesel::PgConnection);

#[derive(Queryable, AsChangeset, Insertable, Serialize, Deserialize, Debug)]
pub struct Ip4 {
    pub ip: IpNetwork,
    pub node_name: String,
    pub location: String,
    pub contact: String,
}

#[derive(Serialize, Deserialize, Debug)]
pub struct Ip4Val {
    pub node_name: String,
    pub location: String,
    pub contact: String,
}

#[get("/")]
fn get(_t: Token, conn: DbConn) -> JsonValue {
    let res = ip4s.load::<Ip4>(&conn.0).unwrap();
    // Make the primary key 'ip' the key of a JSON dict
    let res_folded = res.iter().fold(HashMap::new(), |mut acc, x| {
        acc.insert(
            x.ip,
            Ip4Val {
                node_name: x.node_name.clone(),
                location: x.location.clone(),
                contact: x.contact.clone(),
            },
        );
        acc
    });
    JsonValue(serde_json::to_value(&res_folded).unwrap())
}

#[post("/register", format = "json", data = "<msg>")]
fn put(_t: Token, conn: DbConn, msg: Json<Ip4>) -> Option<JsonValue> {
    diesel::insert_into(ip4s)
        .values(msg.into_inner())
        .execute(&conn.0)
        .unwrap();
    Some(json!({"status": "success"}))
}

fn main() {
    rocket::ignite()
        .mount("/ip4", routes![get, put])
        .attach(DbConn::fairing())
        .attach(auth::auth_fairing())
        .launch();
}
