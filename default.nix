{ nixpkgs-mozilla ? builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz
, nixpkgs ? <nixpkgs>
, naersk
}:
let
  pkgs = import nixpkgs { 
    localSystem.system = "x86_64-linux"; 
    overlays = [ (import nixpkgs-mozilla) ];
  };
  naerskP = import naersk {
    inherit (pkgs) lib runCommand symlinkJoin stdenv writeText jq rsync darwin remarshal cargo zstd fetchurl;
    rustc = (
      pkgs.rustChannelOf {
        date = "2019-10-20";
        channel = "nightly";
        sha256 = "0n7i18b0kbz2x2zs3aaxhzrl7d92k2sn3rbfzy0ybsmys2r20n5d";
      }
    ).rust;
  };
in
  naerskP.buildPackage {
    src = ./.;
    buildInputs = with pkgs; [
      pkgconfig
      openssl
    ];
    doCheck = false;
  }

