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
impl<'a, 'r> FromRequest<'a, 'r> for Token {
    type Error = ApiKeyError;

    async fn from_request(request: &'a Request<'r>) -> request::Outcome<Self, Self::Error> {
        let keys: Vec<_> = request.headers().get("x-api-key").collect();
        let tokens = request.guard::<State<Vec<Token>>>().await.unwrap().inner();
        match keys.len() {
            0 => Outcome::Failure((Status::BadRequest, ApiKeyError::Missing)),
            1 => {
                for t in tokens {
                    if ct_compare(&t.0, keys[0]) {
                        return Outcome::Success(Token(keys[0].to_string()));
                    }
                }
                Outcome::Failure((Status::Forbidden, ApiKeyError::Invalid))
            }
            _ => Outcome::Failure((Status::BadRequest, ApiKeyError::BadCount)),
        }
    }
}

// constant time comparison
fn ct_compare(a: &str, b: &str) -> bool {
    if a.len() != b.len() {
        return false;
    }

    a.bytes()
        .zip(b.bytes())
        .fold(0, |acc, (a, b)| acc | (a ^ b))
        == 0
}

pub fn auth_fairing(tokens: Vec<Token>) -> AdHoc {
    AdHoc::on_attach("Tokens", |rocket| async {
        println!("Using the authentication tokens {:?}", tokens);
        Ok(rocket.manage(tokens))
    })
}

