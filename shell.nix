with import <nixpkgs> {};
pkgs.mkShell {
  buildInputs = [
      rustup
      carnix
      pkgconfig
      openssl
      pandoc
      elmPackages.elm
      elmPackages.elm-format
      elm2nix
    ];
}
