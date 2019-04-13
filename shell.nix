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
    ];
}
