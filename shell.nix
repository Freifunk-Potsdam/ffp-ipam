with import <nixpkgs> {};
pkgs.mkShell {
  buildInputs = [
      rustup
      pkgconfig
      openssl
    ];
}
