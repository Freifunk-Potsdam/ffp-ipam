use git2::Repository;
use rocket::fairing::AdHoc;
use std::fs::OpenOptions;
use std::path::{Path, PathBuf};
use std::str::FromStr;

#[derive(Debug, Deserialize)]
pub struct RepoPath(pub PathBuf);

/// fairing to put the path to the git repo inside a request.
pub fn repo_path_fairing(path: RepoPath) -> AdHoc {
    AdHoc::on_attach("Git repository", |rocket| {
        println!("Using the repo path {:?}", path);
        Ok(rocket.manage(path))
    })
}

/// Get a git repo handle from a path.
pub fn get_repo(path: PathBuf) -> Result<Repository, String> {
    if let Ok(repo) = Repository::open(&path) {
        Ok(repo)
    } else if let Ok(repo) = Repository::init(&path) {
        Ok(repo)
    } else {
        Err(format!(
            "Repo at {} could neither be openend nor initialized.",
            &path.display()
        ))
    }
}

/// Aquire lock on repo. This should be atomic and creates a file ./lock in the repo.
pub fn aquire_lock(path: &Path) -> Result<(), String> {
    let path = {
        let mut p = path.join("lock");
        p
    };
    match OpenOptions::new().write(true).create_new(true).open(&path) {
        Ok(_) => Ok(()),
        Err(_) => Err("Could not aquire lock.".to_string()),
    }
}

/// Free the lock on the repo. Due to https://doc.rust-lang.org/std/fs/fn.remove_file.html there is no guarantee, that the lockfile is removed immediately, but imho this is not necessary, as long as it does not take ages..
pub fn free_lock(path: &Path) -> Result<(), String> {
    let path = {
        let mut p = path.join("lock");
        p
    };
    match std::fs::remove_file(path) {
        Ok(_) => Ok(()),
        Err(_) => Err("Failed to free lock!".to_string()),
    }
}
