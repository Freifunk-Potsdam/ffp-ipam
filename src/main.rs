#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use]
extern crate rocket;
#[macro_use]
extern crate rocket_contrib;
extern crate serde;
#[macro_use]
extern crate serde_derive;
extern crate docopt;
extern crate git2;
extern crate ipnet;
extern crate serde_json;

mod auth;
mod ip4;
mod repo;
#[cfg(test)]
mod tests;

use docopt::Docopt;
use git2::Repository;
use rocket::config::{Config, Environment, Value};
use rocket::Rocket;
use std::collections::HashMap;
use std::path::PathBuf;
use std::sync::Mutex;

const USAGE: &'static str = "
Usage: ffp-ipam [--token TOKEN...] [--ip4-range IPRANGE...] <state-dir>
       ffp-ipam --help

Options:
    -h --help                     Show this message.
    -t, --token TOKEN             Authentication Tokens.
    --ip4-range IPRANGE           Allowed IPv4 ranges supplied in CIDR notation, e.g. 192.168.0.0/24.
";

#[derive(Deserialize)]
struct CliArgs {
    flag_token: Vec<auth::Token>,
    flag_ip4_range: ip4::Ip4Ranges,
    arg_state_dir: repo::RepoPath,
}

fn rocket_config() -> Config {
    Config::build(Environment::Production)
        .address("127.0.0.1")
        .port(8000)
        .finalize()
        .unwrap()
}

fn main() {
    // parse the CLI args...
    let args: CliArgs = Docopt::new(USAGE)
        .and_then(|d| d.deserialize())
        .unwrap_or_else(|e| e.exit());
    // ...and build a Rocket with parts of the CLI args attached
    rocket::custom(rocket_config())
        .mount("/ip4", routes![ip4::get, ip4::put])
        .attach(auth::auth_fairing(args.flag_token))
        .attach(ip4::ip4_fairing(args.flag_ip4_range))
        .attach(repo::repo_path_fairing(args.arg_state_dir))
        .launch();
}
