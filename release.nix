{ moz_overlay ? builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz
, nixpkgs ? <nixpkgs> 
}:
let
  moz_nixpkgs = import "${nixpkgs}" { overlays = [ (import "${moz_overlay}") ]; };
  crates = (import ./Cargo.nix {
    inherit (moz_nixpkgs) lib buildPlatform buildRustCrateHelpers fetchgit;
    buildRustCrate = moz_nixpkgs.buildRustCrate.override {
      # rustc = nixpkgs.latest.rustChannels.nightly.rust;
      rustc = (moz_nixpkgs.rustChannelOf { date = "2019-10-20"; channel = "nightly"; }).rust;
    };
    cratesIO = import ./nix/crates-io.nix { 
      inherit (moz_nixpkgs) lib buildRustCrate buildRustCrateHelpers;
    };
  });
in {
  ffp-ipam = crates.ffp_ipam {};
  ffp-ipam-web = import ./web { inherit nixpkgs; };
}
