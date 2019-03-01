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

#[post("/register", format = "application/json", data = "<msg>")]
pub fn put(_t: Token, conn: DbConn, msg: Json<Ip4>) -> ApiResponse {
    let ip4: Ip4 = msg.into_inner();
    println!("{:?}", ip4);
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
