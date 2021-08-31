use crate::auth::Token;
use crate::repo;
use crate::repo::RepoPath;
use ipnet::Ipv4Net;
use rocket::get;
use rocket::http::{ContentType, Status};
use rocket::request::Request;
use rocket::response;
use rocket::response::{Responder, Response};
use rocket::serde::json::{json, Json, Value};
use rocket::State;
use std::collections::BTreeMap;
use std::fs::File;
use std::path::Path;

pub type Ip4 = Ipv4Net;

#[derive(Serialize, Deserialize, Debug)]
pub struct Ip4Data {
    pub node_name: String,
    pub location: String,
    pub contact: String,
}

#[get("/", format = "json")]
pub fn get(_t: Token, repo_path: &State<RepoPath>) -> Value {
    // TODO: I'm not sure wether this is impossible to conflict with a /register request
    // maybe the file can be read, while /register is writing to it?
    let path = repo_path.inner().0.to_path_buf().join("ip4.json");
    let mut json_file = match File::open(&path) {
        Ok(o) => o,
        // if there is no file, return an empty object
        Err(_) => {
            return json!({});
        }
    };
    let mut json_str = String::new();
    use std::io::Read;
    json_file.read_to_string(&mut json_str).unwrap();

    Value::String(serde_json::from_str(&json_str).unwrap())
}

#[derive(Debug)]
pub struct ApiResponse {
    json: Value,
    status: Status,
}

impl<'r> Responder<'r, 'static> for ApiResponse {
    fn respond_to(self, req: &'r Request) -> response::Result<'static> {
        Response::build_from(self.json.respond_to(&req).unwrap())
            .status(self.status)
            .header(ContentType::JSON)
            .ok()
    }
}

/// Struct that is only used when someone wants to register an IPv4
#[derive(Serialize, Deserialize, Debug)]
pub struct Ip4Request {
    pub ip4: String,
    pub node_name: String,
    pub location: String,
    pub contact: String,
}

pub type Ip4Dict = BTreeMap<Ip4, Ip4Data>;

#[post("/register", format = "application/json", data = "<msg>")]
pub fn put(
    _t: Token,
    repo_path: &State<RepoPath>,
    ip4_ranges: &State<Ip4Ranges>,
    msg: Json<Ip4Request>,
) -> ApiResponse {
    use git2::{Commit, Index, Signature, Tree};

    let ip4_request: Ip4Request = msg.into_inner();
    let repo_path = repo_path.inner().0.to_path_buf();
    println!("{:?}", ip4_request);
    let ip4: Ipv4Net = match ip4_request.ip4.parse::<Ipv4Net>() {
        Err(_) => {
            return ApiResponse {
                json: json!({
                    "error":
                        format!(
                            "Malformed IPv4 Address {}. Please supply of the form 'x.x.x.x/32' ",
                            &ip4_request.ip4
                        )
                }),
                status: Status::UnprocessableEntity,
            };
        }
        Ok(i) => i,
    };
    if !ip4_ranges.contain(&ip4) {
        return ApiResponse {
            json: json!({
                "error":
                    format!(
                        "IPv4 address is in unsupported range. Please choose one in {:?}.",
                        ip4_ranges
                    )
            }),
            status: Status::UnprocessableEntity,
        };
    }

    println!("Writing to file ip4.json...");
    let mut ip4_dict: Ip4Dict = {
        if let Ok(json_file) = File::open(&repo_path.join("ip4.json")) {
            serde_json::from_reader(&json_file).unwrap()
        } else {
            BTreeMap::new()
        }
    };

    if ip4_dict.contains_key(&ip4) {
        return ApiResponse {
            json: json!({"error": "IP address already taken. Please choose a different one."}),
            status: Status::UnprocessableEntity,
        };
    }
    ip4_dict.insert(
        ip4,
        Ip4Data {
            node_name: ip4_request.node_name,
            location: ip4_request.location,
            contact: ip4_request.contact,
        },
    );

    // Now we need the lock and should not return without freeing the lock!
    repo::aquire_lock(&repo_path).unwrap();
    {
        let json_file: File = File::create(&repo_path.join("ip4.json")).unwrap();
        println!("Writing to {:?}.", &json_file);
        serde_json::to_writer_pretty(json_file, &ip4_dict).unwrap();
    }
    println!("Trying to commit...");
    let repo = repo::get_repo(repo_path.clone())
        .unwrap_or_else(|_| panic!("get_repo() failed with path {:?}", repo_path));

    let tree_id = {
        let mut index: Index = repo.index().unwrap();
        let path = Path::new("ip4.json");
        index.add_path(&path).unwrap();
        index.write().unwrap();
        index.write_tree().unwrap()
    };
    println!("tree_id is {}", &tree_id);

    let tree: Tree = repo.find_tree(tree_id).unwrap();

    let sig = Signature::now("John Doe", "john.doe@john.doe").unwrap();
    let head_commit: Commit;
    let parents: Vec<&Commit> = if let Ok(head_ref) = repo.head() {
        let head_oid = head_ref.target().unwrap();
        head_commit = repo.find_commit(head_oid).unwrap();
        println!("Head commit is {:?}", &head_commit);
        vec![&head_commit]
    } else {
        // in this case, we are creating the first commit so there are no parents
        Vec::new()
    };
    repo.commit(Some("HEAD"), &sig, &sig, "My message", &tree, &parents)
        .unwrap();
    repo::free_lock(&repo_path).unwrap();

    ApiResponse {
        json: json!({"status": "Success"}),
        status: Status::Ok,
    }
}

#[derive(Debug, Deserialize)]
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
pub fn ip4_fairing(ip4_ranges: Ip4Ranges) -> AdHoc {
    AdHoc::on_ignite("IPv4 range", |rocket| async {
        println!("Using the IPv4 ranges {:?}", ip4_ranges);
        rocket.manage(ip4_ranges)
    })
}
