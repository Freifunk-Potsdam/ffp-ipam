use crypto::util::fixed_time_eq;
use rocket::fairing::AdHoc;
use rocket::http::Status;
use rocket::outcome::Outcome;
use rocket::request::{self, FromRequest, Request};
use rocket::State;

#[derive(Debug, Deserialize)]
pub struct Token(pub String);

#[derive(Debug)]
pub enum ApiKeyError {
    BadCount,
    Missing,
    Invalid,
}

#[rocket::async_trait]
impl<'r> FromRequest<'r> for Token {
    type Error = ApiKeyError;

    async fn from_request(request: &'r Request<'_>) -> request::Outcome<Self, Self::Error> {
        let keys: Vec<_> = request.headers().get("x-api-key").collect();
        let tokens = request.guard::<&State<Vec<Token>>>().await.unwrap().inner();
        match keys.len() {
            0 => Outcome::Failure((Status::BadRequest, ApiKeyError::Missing)),
            1 => {
                for t in tokens {
                    if fixed_time_eq(&t.0.as_bytes(), keys[0].as_bytes()) {
                        return Outcome::Success(Token(keys[0].to_string()));
                    }
                }
                Outcome::Failure((Status::Forbidden, ApiKeyError::Invalid))
            }
            _ => Outcome::Failure((Status::BadRequest, ApiKeyError::BadCount)),
        }
    }
}

pub fn auth_fairing(tokens: Vec<Token>) -> AdHoc {
    AdHoc::on_ignite("Tokens", |rocket| async {
        println!("Using the authentication tokens {:?}", tokens);
        rocket.manage(tokens)
    })
}
