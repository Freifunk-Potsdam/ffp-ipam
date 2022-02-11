{
  description = "Freifunk Potsdam IP Address Management";

  inputs.nixpkgs.url = "github:NixOS/Nixpkgs/nixos-unstable";

  outputs =
    { self
    , nixpkgs
    }:
    let
      forAllSystems = f: nixpkgs.lib.genAttrs
        [ "x86_64-linux" "i686-linux" "aarch64-linux" ]
        (system: f system);
      nixpkgsFor = forAllSystems (system:
        import nixpkgs { inherit system; }
      );
    in
    rec {

      defaultPackage = forAllSystems (system:
        let
          pkgs = nixpkgsFor.${system};
          crates = import ./Cargo.nix { inherit pkgs; };
        in
        crates.workspaceMembers.ffp-ipam.build
      );

      devShell = forAllSystems (
        system:
        let
          pkgs = nixpkgsFor.${system};
        in
        pkgs.mkShell {
          buildInputs = with pkgs; [
            cargo
            rustc
            clippy
            crate2nix
            pkgconfig
            openssl
            pandoc
          ];
        }
      );

    };

}
