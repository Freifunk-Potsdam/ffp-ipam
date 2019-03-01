// extern crate parking_lot;

use auth;
use auth::Token;
use rocket::http::{ContentType, Status, Header};
use rocket::local::Client;

#[cfg(test)]
fn testing_client() -> Client {
    let testing_rocket = super::rocket()
        .attach(auth::auth_fairing_for_testing(vec![Token(
        "123".to_string(),
    )]));
    Client::new(testing_rocket).expect("Rocket client")
}

#[test]
fn test_insertion() {
    let client = testing_client();
    let mut resp = client.post("/ip4/register")
        .header(ContentType::JSON)
        .header(Header::new("x-api-key", "123"))
        .body(r#"{"ip": "13.37.1.7", "node_name": "mycoolnodename", "location": "here", "contact": "112"}"#)
        .dispatch();

    println!("{:?}", &resp.body_string().unwrap());
    assert_eq!(resp.status(), Status::Ok);
}
