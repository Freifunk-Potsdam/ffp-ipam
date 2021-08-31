#[macro_use]
extern crate rocket;
extern crate rocket_sync_db_pools;
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
use rocket::config::Config;
use rocket::{Build, Rocket};

const USAGE: &str = "
Usage: ffp-ipam [options] [--token TOKEN...] [--ip4-range IPRANGE...] <state-dir>
       ffp-ipam --help

Options:
    -h --help                     Show this message.
    -t, --token TOKEN             Authentication Tokens.
    --ip4-range IPRANGE           Allowed IPv4 ranges supplied in CIDR notation, e.g. 192.168.0.0/24.
    --listen IP                   IPv4 address to listen on, e.g. 0.0.0.0. [default: 127.0.0.1]
    --port PORT                   TCP Port to listen on, e.g. 80. [default: 8000]
";

#[derive(Deserialize)]
struct CliArgs {
    flag_token: Vec<auth::Token>,
    flag_ip4_range: ip4::Ip4Ranges,
    flag_listen: String,
    flag_port: u16,
    arg_state_dir: repo::RepoPath,
}

#[launch]
fn rocket() -> Rocket<Build> {
    // parse the CLI args...
    let args: CliArgs = Docopt::new(USAGE)
        .and_then(|d| d.deserialize())
        .unwrap_or_else(|e| e.exit());
    // ...build a Rocket Config with its args...
    let rocket_config = Config::figment()
        .merge(("port", args.flag_port))
        .merge(("address", args.flag_listen));
    // ...and then launch the Rocket with parts of the CLI args attached
    rocket::custom(rocket_config)
        .mount("/ip4", routes![ip4::get, ip4::put])
        .attach(auth::auth_fairing(args.flag_token))
        .attach(ip4::ip4_fairing(args.flag_ip4_range))
        .attach(repo::repo_path_fairing(args.arg_state_dir))
}
