{ moz_overlay ? import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz)
, nixpkgs ? import <nixpkgs> { overlays = [ moz_overlay ]; }
}:
let
  crates = (import ./Cargo.nix {
    inherit (nixpkgs) lib buildPlatform buildRustCrateHelpers fetchgit;
    buildRustCrate = nixpkgs.buildRustCrate.override {
      # rustc = nixpkgs.latest.rustChannels.nightly.rust;
      rustc = (nixpkgs.rustChannelOf { date = "2019-03-15"; channel = "nightly"; }).rust;
    };
    cratesIO = import ./nix/crates-io.nix { 
      inherit (nixpkgs) lib buildRustCrate buildRustCrateHelpers;
    };
  });
in {
  ffp-ipam = crates.ffp_ipam;
}
