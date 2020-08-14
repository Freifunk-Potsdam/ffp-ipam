{
  description = "Freifunk Potsdam IP Address Management";

  inputs = {
    naersk.url = "github:nmattia/naersk";
    nixpkgs-mozilla = {
      url = "github:mozilla/nixpkgs-mozilla";
      flake = false;
    };
  };

  outputs =
    { self
    , nixpkgs
    , nixpkgs-mozilla
    , naersk
    }: let
      forAllSystems = f: nixpkgs.lib.genAttrs
        [ "x86_64-linux" "i686-linux" "aarch64-linux" ] (system: f system);
      nixpkgsFor = forAllSystems (
        system:
          import nixpkgs {
            inherit system;
            overlays = [ (import nixpkgs-mozilla) ];
          }
      );
    in
      rec {

        defaultPackage = forAllSystems (
          system: let
            pkgs = nixpkgsFor.${system};
            naerskP = pkgs.callPackage naersk {
              rustc = (
                pkgs.rustChannelOf {
                  date = "2020-02-11";
                  channel = "nightly";
                  sha256 = "1f7sdzgv1cwnv2nv8299b2s7lq1pjcxa4kzm499ccl8ca6ynfdbx";
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
        );

        devShell = forAllSystems (
          system:
            let
              pkgs = nixpkgsFor.${system};
            in
              pkgs.mkShell {
                buildInputs = with pkgs; [
                  rustup
                  pkgconfig
                  openssl
                  pandoc
                ];
              }
        );

      };

}
