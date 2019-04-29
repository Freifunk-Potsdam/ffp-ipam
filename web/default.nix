{ nixpkgs ? <nixpkgs>
, config ? {}
}:

with (import nixpkgs config);

let
  pandoc-index = stdenv.mkDerivation {
    name = "pandoc-index";
    src = ./markdown;
    buildInputs = with pkgs; [ pandoc ];
    installPhase = ''
      mkdir -p $out
      pandoc -o $out/index.html index.md
    '';
  };
  mkDerivation =
    { srcs ? ./elm-srcs.nix
    , src
    , name
    , srcdir ? "./src"
    , targets ? []
    , versionsDat ? ./versions.dat
    }:
    stdenv.mkDerivation {
      inherit name src;

      buildInputs = [ elmPackages.elm ];

      buildPhase = pkgs.elmPackages.fetchElmDeps {
        elmPackages = import srcs;
        inherit versionsDat;
      };

      installPhase = let
        elmfile = module: "${srcdir}/${builtins.replaceStrings ["."] ["/"] module}.elm";
      in ''
        mkdir -p $out/share/doc
        ${lib.concatStrings (map (module: ''
          echo "compiling ${elmfile module}"
          elm make ${elmfile module} --output $out/${module}.html --docs $out/share/doc/${module}.json
        '') targets)}
      '';
    };
  elm-app = mkDerivation {
    name = "ffp-ipam-web-0.1.0";
    srcs = ./elm-srcs.nix;
    src = ./.;
    targets = ["register"];
    srcdir = "./src";
  };
in pkgs.runCommand "ffp-ipam-web" {} ''
  mkdir -p $out/register
  cd $out
  ln -s ${lib.escapeShellArg pandoc-index}/index.html index.html
  cd $out/register
  ln -s ${lib.escapeShellArg elm-app}/register.html index.html
''

