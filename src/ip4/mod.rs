use auth::Token;
use diesel::result::{DatabaseErrorKind, Error};
use rocket::http::{ContentType, Status};
use rocket::request::Request;
use rocket::response;
use rocket::response::{Responder, Response};
use rocket_contrib::json::{Json, JsonValue};
use schema::ip4s;
use schema::ip4s::dsl::*;
use std::collections::HashMap;
use diesel::RunQueryDsl;
use DbConn;
use ipnet::Ipv4Net;

#[derive(Queryable, Insertable, Serialize, Deserialize, Debug)]
pub struct Ip4 {
    pub ip: String,
    pub node_name: String,
    pub location: String,
    pub contact: String,
}

#[get("/")]
pub fn get(_t: Token, conn: DbConn) -> JsonValue {
    let res = ip4s.load::<Ip4>(&conn.0).unwrap();
    // Make the primary key 'ip' the key of a JSON dict
    let res_folded = res.iter().fold(HashMap::new(), |mut acc, x| {
        acc.insert(&x.ip, {
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
pub struct ApiResponse {
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

use rocket::State;
#[post("/register", format = "application/json", data = "<msg>")]
pub fn put(_t: Token, conn: DbConn, ip4_ranges: State<Ip4Ranges>, msg: Json<Ip4>) -> ApiResponse {
    let ip4: Ip4 = msg.into_inner();
    println!("{:?}", ip4);
    let ip4_parsed: Ipv4Net = match ip4.ip.parse::<Ipv4Net>() {
        Err(e) => {
            return ApiResponse {
                json: json!({"error": format!("Malformed IPv4 Address {}. Please supply of the form 'x.x.x.x/32' ", &ip4.ip)}),
                status: Status::UnprocessableEntity,
            };
        },
        Ok(i) => i,
        };
    if !ip4_ranges.contain(&ip4_parsed) {
        return ApiResponse {
            json: json!({"error": format!("IPv4 address is in unsupported range. Please choose one in {:?}.", ip4_ranges)}),
            status: Status::UnprocessableEntity,
        };
    }

    match ip4 {
        ip4 => match diesel::insert_into(ip4s).values(ip4).execute(&conn.0) {
            Ok(_) => ApiResponse {
                json: json!({"status": "Success"}),
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

#[derive(Debug)]
pub struct Ip4Ranges(Vec<Ipv4Net>);

impl Ip4Ranges {
    fn contain(&self, ip4: &Ipv4Net) -> bool {
        for range in &self.0 {
           if range.contains(ip4) {
               return true;
           }
        }
        // No network contains the IP
        false
    }
}

use rocket::fairing::AdHoc;
pub fn ip4_fairing() -> AdHoc {
    AdHoc::on_attach("IPv4 range", |rocket| {
        let ip4_ranges: Vec<rocket::config::Value> =
            rocket.config().get_slice("ip4_ranges").unwrap().clone();
        let ip4_ranges: Ip4Ranges = {
            let mut res: Ip4Ranges = Ip4Ranges(Vec::new());
            for ip4_str in ip4_ranges {
                println!("{}", ip4_str);
                let ip4: Ipv4Net = match ip4_str.as_str().unwrap().parse() {
                    Ok(ip4) => ip4,
                    Err(_e) => panic!("Please supply valid IPv4 ranges of the form '192.168.0.0/24, 10.0.0.0/16'"),
                };
                res.0.push(ip4);
            }
            res
        };

        Ok(rocket.manage(ip4_ranges))
    })
}

