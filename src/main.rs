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
use diesel::result::{DatabaseErrorKind, Error};
use ipnetwork::IpNetwork;
use rocket::http::{ContentType, Status};
use rocket::request::Request;
use rocket::response;
use rocket::response::{Responder, Response};
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

#[get("/")]
fn get(_t: Token, conn: DbConn) -> JsonValue {
    let res = ip4s.load::<Ip4>(&conn.0).unwrap();
    // Make the primary key 'ip' the key of a JSON dict
    let res_folded = res.iter().fold(HashMap::new(), |mut acc, x| {
        acc.insert(x.ip, {
            let mut res = HashMap::new();
            res.insert("node_name", x.node_name.clone());
            res.insert("location", x.location.clone());
            res.insert("contact", x.contact.clone());
            res
        });
        acc
    });
    JsonValue(serde_json::to_value(&res_folded).unwrap())
}

#[derive(Debug)]
struct ApiResponse {
    json: JsonValue,
    status: Status,
}

impl<'r> Responder<'r> for ApiResponse {
    fn respond_to(self, req: &Request) -> response::Result<'r> {
        Response::build_from(self.json.respond_to(&req).unwrap())
            .status(self.status)
            .header(ContentType::JSON)
            .ok()
    }
}

#[post("/register", format = "application/json", data = "<msg>")]
fn put(_t: Token, conn: DbConn, msg: Json<Ip4>) -> ApiResponse {
    let ip4: Ip4 = msg.into_inner();
    println!("{:?}", ip4);
    match ip4 {
        ip4 => match diesel::insert_into(ip4s).values(ip4).execute(&conn.0) {
            Ok(_) => ApiResponse {
                json: json!({"status": "success"}),
                status: Status::Ok,
            },
            Err(Error::DatabaseError(DatabaseErrorKind::UniqueViolation, _)) => ApiResponse {
                json: json!({"error": "IP address already taken. Please choose a different one."}),
                status: Status::UnprocessableEntity,
            },
            Err(err) => ApiResponse {
                json: json!({
                    "error": json!({
                        "error": format!("Halp! An unhandled DB error happened: {:?}", err)
                    })
                }),
                status: Status::InternalServerError,
            },
        },
    }
}

fn main() {
    rocket::ignite()
        .mount("/ip4", routes![get, put])
        .attach(DbConn::fairing())
        .attach(auth::auth_fairing())
        .launch();
}
