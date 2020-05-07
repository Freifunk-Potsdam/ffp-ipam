{
  edition = 201909;

  description = "Freifunk Potsdam IP Address Management";

  inputs = {
    naersk = {
      url = "github:nmattia/naersk";
      flake = false;
    };
    nixpkgs-mozilla = {
      url = "github:mozilla/nixpkgs-mozilla";
      flake = false;
    };
    nixpkgs.flake = false;
  };

  outputs =
    { self
    , nixpkgs
    , nixpkgs-mozilla
    , naersk
    }: rec {

      packages.x86_64-linux.ffp-ipam = (import ./default.nix {
        inherit nixpkgs nixpkgs-mozilla naersk;
      }).ffp-ipam;

      defaultPackage.x86_64-linux = packages.x86_64-linux.ffp-ipam;

    };

}
