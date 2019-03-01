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
#[cfg(test)]
mod tests;
mod ip4;


use rocket::Rocket;
use rocket_contrib::databases::diesel as rocket_diesel;

#[database("sqlite_database")]
pub struct DbConn(rocket_diesel::SqliteConnection);

fn rocket() -> Rocket {
    rocket::ignite()
        .mount("/ip4", routes![ip4::get, ip4::put])
        .attach(DbConn::fairing())
}

fn main() {
    rocket().attach(auth::auth_fairing()).launch();
}
