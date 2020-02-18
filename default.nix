{ nixpkgs-mozilla ? builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz
, nixpkgs ? <nixpkgs>
, naersk
}:
let
  pkgs = import nixpkgs { 
    localSystem.system = "x86_64-linux"; 
    overlays = [ (import nixpkgs-mozilla) ];
  };
  naerskP = pkgs.callPackage naersk {
    rustc = (
      pkgs.rustChannelOf {
        date = "2020-02-11";
        channel = "nightly";
        sha256 = "sha256:1f7sdzgv1cwnv2nv8299b2s7lq1pjcxa4kzm499ccl8ca6ynfdbx";
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

