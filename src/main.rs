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
extern crate git2;
extern crate ipnet;
extern crate serde_json;

mod auth;
mod ip4;
mod repo;
pub mod schema;
#[cfg(test)]
mod tests;

use git2::Repository;
use rocket::Rocket;
use rocket_contrib::databases::diesel as rocket_diesel;
use std::sync::Mutex;

fn rocket() -> Rocket {
    rocket::ignite()
        .mount("/ip4", routes![ip4::get, ip4::put])
        .attach(ip4::ip4_fairing())
        .attach(repo::repo_path_fairing())
}

fn main() {
    rocket().attach(auth::auth_fairing()).launch();
}
