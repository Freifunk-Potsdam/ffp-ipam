{ lib, buildRustCrate, buildRustCrateHelpers }:
with buildRustCrateHelpers;
let inherit (lib.lists) fold;
    inherit (lib.attrsets) recursiveUpdate;
in
rec {

# aho-corasick-0.6.10

  crates.aho_corasick."0.6.10" = deps: { features?(features_.aho_corasick."0.6.10" deps {}) }: buildRustCrate {
    crateName = "aho-corasick";
    version = "0.6.10";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "0bhasxfpmfmz1460chwsx59vdld05axvmk1nbp3sd48xav3d108p";
    libName = "aho_corasick";
    crateBin =
      [{  name = "aho-corasick-dot";  path = "src/main.rs"; }];
    dependencies = mapFeatures features ([
      (crates."memchr"."${deps."aho_corasick"."0.6.10"."memchr"}" deps)
    ]);
  };
  features_.aho_corasick."0.6.10" = deps: f: updateFeatures f (rec {
    aho_corasick."0.6.10".default = (f.aho_corasick."0.6.10".default or true);
    memchr."${deps.aho_corasick."0.6.10".memchr}".default = true;
  }) [
    (features_.memchr."${deps."aho_corasick"."0.6.10"."memchr"}" deps)
  ];


# end
# base64-0.9.3

  crates.base64."0.9.3" = deps: { features?(features_.base64."0.9.3" deps {}) }: buildRustCrate {
    crateName = "base64";
    version = "0.9.3";
    authors = [ "Alice Maz <alice@alicemaz.com>" "Marshall Pierce <marshall@mpierce.org>" ];
    sha256 = "11hhz8ln4zbpn2h2gm9fbbb9j254wrd4fpmddlyah2rrnqsmmqkd";
    dependencies = mapFeatures features ([
      (crates."byteorder"."${deps."base64"."0.9.3"."byteorder"}" deps)
      (crates."safemem"."${deps."base64"."0.9.3"."safemem"}" deps)
    ]);
  };
  features_.base64."0.9.3" = deps: f: updateFeatures f (rec {
    base64."0.9.3".default = (f.base64."0.9.3".default or true);
    byteorder."${deps.base64."0.9.3".byteorder}".default = true;
    safemem."${deps.base64."0.9.3".safemem}".default = true;
  }) [
    (features_.byteorder."${deps."base64"."0.9.3"."byteorder"}" deps)
    (features_.safemem."${deps."base64"."0.9.3"."safemem"}" deps)
  ];


# end
# base64-0.10.1

  crates.base64."0.10.1" = deps: { features?(features_.base64."0.10.1" deps {}) }: buildRustCrate {
    crateName = "base64";
    version = "0.10.1";
    authors = [ "Alice Maz <alice@alicemaz.com>" "Marshall Pierce <marshall@mpierce.org>" ];
    sha256 = "1zz3jq619hahla1f70ra38818b5n8cp4iilij81i90jq6z7hlfhg";
    dependencies = mapFeatures features ([
      (crates."byteorder"."${deps."base64"."0.10.1"."byteorder"}" deps)
    ]);
  };
  features_.base64."0.10.1" = deps: f: updateFeatures f (rec {
    base64."0.10.1".default = (f.base64."0.10.1".default or true);
    byteorder."${deps.base64."0.10.1".byteorder}".default = true;
  }) [
    (features_.byteorder."${deps."base64"."0.10.1"."byteorder"}" deps)
  ];


# end
# bitflags-0.7.0

  crates.bitflags."0.7.0" = deps: { features?(features_.bitflags."0.7.0" deps {}) }: buildRustCrate {
    crateName = "bitflags";
    version = "0.7.0";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1hr72xg5slm0z4pxs2hiy4wcyx3jva70h58b7mid8l0a4c8f7gn5";
  };
  features_.bitflags."0.7.0" = deps: f: updateFeatures f (rec {
    bitflags."0.7.0".default = (f.bitflags."0.7.0".default or true);
  }) [];


# end
# bitflags-1.0.4

  crates.bitflags."1.0.4" = deps: { features?(features_.bitflags."1.0.4" deps {}) }: buildRustCrate {
    crateName = "bitflags";
    version = "1.0.4";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1g1wmz2001qmfrd37dnd5qiss5njrw26aywmg6yhkmkbyrhjxb08";
    features = mkFeatures (features."bitflags"."1.0.4" or {});
  };
  features_.bitflags."1.0.4" = deps: f: updateFeatures f (rec {
    bitflags."1.0.4".default = (f.bitflags."1.0.4".default or true);
  }) [];


# end
# byteorder-1.3.1

  crates.byteorder."1.3.1" = deps: { features?(features_.byteorder."1.3.1" deps {}) }: buildRustCrate {
    crateName = "byteorder";
    version = "1.3.1";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1dd46l7fvmxfq90kh6ip1ghsxzzcdybac8f0mh2jivsdv9vy8k4w";
    build = "build.rs";
    features = mkFeatures (features."byteorder"."1.3.1" or {});
  };
  features_.byteorder."1.3.1" = deps: f: updateFeatures f (rec {
    byteorder = fold recursiveUpdate {} [
      { "1.3.1".default = (f.byteorder."1.3.1".default or true); }
      { "1.3.1".std =
        (f.byteorder."1.3.1".std or false) ||
        (f.byteorder."1.3.1".default or false) ||
        (byteorder."1.3.1"."default" or false); }
    ];
  }) [];


# end
# cc-1.0.31

  crates.cc."1.0.31" = deps: { features?(features_.cc."1.0.31" deps {}) }: buildRustCrate {
    crateName = "cc";
    version = "1.0.31";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1a576gp1gp69v8kprwgk8ryxs3sc9v9g06cd3ggxm9jrzrcc4x5n";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."cc"."1.0.31" or {});
  };
  features_.cc."1.0.31" = deps: f: updateFeatures f (rec {
    cc = fold recursiveUpdate {} [
      { "1.0.31".default = (f.cc."1.0.31".default or true); }
      { "1.0.31".rayon =
        (f.cc."1.0.31".rayon or false) ||
        (f.cc."1.0.31".parallel or false) ||
        (cc."1.0.31"."parallel" or false); }
    ];
  }) [];


# end
# cfg-if-0.1.7

  crates.cfg_if."0.1.7" = deps: { features?(features_.cfg_if."0.1.7" deps {}) }: buildRustCrate {
    crateName = "cfg-if";
    version = "0.1.7";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "13gvcx1dxjq4mpmpj26hpg3yc97qffkx2zi58ykr1dwr8q2biiig";
  };
  features_.cfg_if."0.1.7" = deps: f: updateFeatures f (rec {
    cfg_if."0.1.7".default = (f.cfg_if."0.1.7".default or true);
  }) [];


# end
# cookie-0.11.0

  crates.cookie."0.11.0" = deps: { features?(features_.cookie."0.11.0" deps {}) }: buildRustCrate {
    crateName = "cookie";
    version = "0.11.0";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "Sergio Benitez <sb@sergio.bz>" ];
    sha256 = "0a2mwk3fzm16nsmlpmh4jxkb42p8yvxkwx6a4r5cpa14na98ix16";
    dependencies = mapFeatures features ([
      (crates."time"."${deps."cookie"."0.11.0"."time"}" deps)
    ]
      ++ (if features.cookie."0.11.0".base64 or false then [ (crates.base64."${deps."cookie"."0.11.0".base64}" deps) ] else [])
      ++ (if features.cookie."0.11.0".ring or false then [ (crates.ring."${deps."cookie"."0.11.0".ring}" deps) ] else [])
      ++ (if features.cookie."0.11.0".url or false then [ (crates.url."${deps."cookie"."0.11.0".url}" deps) ] else []));
    features = mkFeatures (features."cookie"."0.11.0" or {});
  };
  features_.cookie."0.11.0" = deps: f: updateFeatures f (rec {
    base64."${deps.cookie."0.11.0".base64}".default = true;
    cookie = fold recursiveUpdate {} [
      { "0.11.0".base64 =
        (f.cookie."0.11.0".base64 or false) ||
        (f.cookie."0.11.0".secure or false) ||
        (cookie."0.11.0"."secure" or false); }
      { "0.11.0".default = (f.cookie."0.11.0".default or true); }
      { "0.11.0".ring =
        (f.cookie."0.11.0".ring or false) ||
        (f.cookie."0.11.0".secure or false) ||
        (cookie."0.11.0"."secure" or false); }
      { "0.11.0".url =
        (f.cookie."0.11.0".url or false) ||
        (f.cookie."0.11.0".percent-encode or false) ||
        (cookie."0.11.0"."percent-encode" or false); }
    ];
    ring."${deps.cookie."0.11.0".ring}".default = true;
    time."${deps.cookie."0.11.0".time}".default = true;
    url."${deps.cookie."0.11.0".url}".default = true;
  }) [
    (features_.base64."${deps."cookie"."0.11.0"."base64"}" deps)
    (features_.ring."${deps."cookie"."0.11.0"."ring"}" deps)
    (features_.time."${deps."cookie"."0.11.0"."time"}" deps)
    (features_.url."${deps."cookie"."0.11.0"."url"}" deps)
  ];


# end
# curl-sys-0.4.17

  crates.curl_sys."0.4.17" = deps: { features?(features_.curl_sys."0.4.17" deps {}) }: buildRustCrate {
    crateName = "curl-sys";
    version = "0.4.17";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1b7jx9rwhhcggdw5hpq4knx9h3jlp558shlfzmifcm8car982y75";
    libPath = "lib.rs";
    libName = "curl_sys";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."curl_sys"."0.4.17"."libc"}" deps)
      (crates."libz_sys"."${deps."curl_sys"."0.4.17"."libz_sys"}" deps)
    ])
      ++ (if (kernel == "linux" || kernel == "darwin") && !(kernel == "darwin") then mapFeatures features ([
    ]
      ++ (if features.curl_sys."0.4.17".openssl-sys or false then [ (crates.openssl_sys."${deps."curl_sys"."0.4.17".openssl_sys}" deps) ] else [])) else [])
      ++ (if abi == "msvc" then mapFeatures features ([
]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."curl_sys"."0.4.17"."winapi"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."curl_sys"."0.4.17"."cc"}" deps)
      (crates."pkg_config"."${deps."curl_sys"."0.4.17"."pkg_config"}" deps)
    ]);
    features = mkFeatures (features."curl_sys"."0.4.17" or {});
  };
  features_.curl_sys."0.4.17" = deps: f: updateFeatures f (rec {
    cc."${deps.curl_sys."0.4.17".cc}".default = true;
    curl_sys = fold recursiveUpdate {} [
      { "0.4.17".default = (f.curl_sys."0.4.17".default or true); }
      { "0.4.17".libnghttp2-sys =
        (f.curl_sys."0.4.17".libnghttp2-sys or false) ||
        (f.curl_sys."0.4.17".http2 or false) ||
        (curl_sys."0.4.17"."http2" or false); }
      { "0.4.17".openssl-sys =
        (f.curl_sys."0.4.17".openssl-sys or false) ||
        (f.curl_sys."0.4.17".ssl or false) ||
        (curl_sys."0.4.17"."ssl" or false); }
      { "0.4.17".ssl =
        (f.curl_sys."0.4.17".ssl or false) ||
        (f.curl_sys."0.4.17".default or false) ||
        (curl_sys."0.4.17"."default" or false); }
    ];
    libc."${deps.curl_sys."0.4.17".libc}".default = true;
    libz_sys."${deps.curl_sys."0.4.17".libz_sys}".default = true;
    openssl_sys."${deps.curl_sys."0.4.17".openssl_sys}".default = true;
    pkg_config."${deps.curl_sys."0.4.17".pkg_config}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.curl_sys."0.4.17".winapi}"."winsock2" = true; }
      { "${deps.curl_sys."0.4.17".winapi}"."ws2def" = true; }
      { "${deps.curl_sys."0.4.17".winapi}".default = true; }
    ];
  }) [
    (features_.libc."${deps."curl_sys"."0.4.17"."libc"}" deps)
    (features_.libz_sys."${deps."curl_sys"."0.4.17"."libz_sys"}" deps)
    (features_.cc."${deps."curl_sys"."0.4.17"."cc"}" deps)
    (features_.pkg_config."${deps."curl_sys"."0.4.17"."pkg_config"}" deps)
    (features_.openssl_sys."${deps."curl_sys"."0.4.17"."openssl_sys"}" deps)
    (features_.winapi."${deps."curl_sys"."0.4.17"."winapi"}" deps)
  ];


# end
# devise-0.2.0

  crates.devise."0.2.0" = deps: { features?(features_.devise."0.2.0" deps {}) }: buildRustCrate {
    crateName = "devise";
    version = "0.2.0";
    authors = [ "Sergio Benitez <sb@sergio.bz>" ];
    sha256 = "084p6nasq2xq0clnr0phjmzlpdsf7h641cpfd2j638a1s1nnpzzx";
    dependencies = mapFeatures features ([
      (crates."devise_codegen"."${deps."devise"."0.2.0"."devise_codegen"}" deps)
      (crates."devise_core"."${deps."devise"."0.2.0"."devise_core"}" deps)
    ]);
  };
  features_.devise."0.2.0" = deps: f: updateFeatures f (rec {
    devise."0.2.0".default = (f.devise."0.2.0".default or true);
    devise_codegen."${deps.devise."0.2.0".devise_codegen}".default = true;
    devise_core."${deps.devise."0.2.0".devise_core}".default = true;
  }) [
    (features_.devise_codegen."${deps."devise"."0.2.0"."devise_codegen"}" deps)
    (features_.devise_core."${deps."devise"."0.2.0"."devise_core"}" deps)
  ];


# end
# devise_codegen-0.2.0

  crates.devise_codegen."0.2.0" = deps: { features?(features_.devise_codegen."0.2.0" deps {}) }: buildRustCrate {
    crateName = "devise_codegen";
    version = "0.2.0";
    authors = [ "Sergio Benitez <sb@sergio.bz>" ];
    sha256 = "0v3arplj8jh84133q342licj4ff4v5w8bgs92wb9pr7shspzdpf2";
    procMacro = true;
    dependencies = mapFeatures features ([
      (crates."devise_core"."${deps."devise_codegen"."0.2.0"."devise_core"}" deps)
      (crates."quote"."${deps."devise_codegen"."0.2.0"."quote"}" deps)
    ]);
  };
  features_.devise_codegen."0.2.0" = deps: f: updateFeatures f (rec {
    devise_codegen."0.2.0".default = (f.devise_codegen."0.2.0".default or true);
    devise_core."${deps.devise_codegen."0.2.0".devise_core}".default = true;
    quote."${deps.devise_codegen."0.2.0".quote}".default = true;
  }) [
    (features_.devise_core."${deps."devise_codegen"."0.2.0"."devise_core"}" deps)
    (features_.quote."${deps."devise_codegen"."0.2.0"."quote"}" deps)
  ];


# end
# devise_core-0.2.0

  crates.devise_core."0.2.0" = deps: { features?(features_.devise_core."0.2.0" deps {}) }: buildRustCrate {
    crateName = "devise_core";
    version = "0.2.0";
    authors = [ "Sergio Benitez <sb@sergio.bz>" ];
    sha256 = "1awv356fn6cb2s7f2x8x91swa67v71yfkw1b5hm85ci76mdc38rf";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."devise_core"."0.2.0"."bitflags"}" deps)
      (crates."proc_macro2"."${deps."devise_core"."0.2.0"."proc_macro2"}" deps)
      (crates."quote"."${deps."devise_core"."0.2.0"."quote"}" deps)
      (crates."syn"."${deps."devise_core"."0.2.0"."syn"}" deps)
    ]);
  };
  features_.devise_core."0.2.0" = deps: f: updateFeatures f (rec {
    bitflags."${deps.devise_core."0.2.0".bitflags}".default = true;
    devise_core."0.2.0".default = (f.devise_core."0.2.0".default or true);
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.devise_core."0.2.0".proc_macro2}"."nightly" = true; }
      { "${deps.devise_core."0.2.0".proc_macro2}".default = true; }
    ];
    quote."${deps.devise_core."0.2.0".quote}".default = true;
    syn = fold recursiveUpdate {} [
      { "${deps.devise_core."0.2.0".syn}"."extra-traits" = true; }
      { "${deps.devise_core."0.2.0".syn}"."full" = true; }
      { "${deps.devise_core."0.2.0".syn}".default = true; }
    ];
  }) [
    (features_.bitflags."${deps."devise_core"."0.2.0"."bitflags"}" deps)
    (features_.proc_macro2."${deps."devise_core"."0.2.0"."proc_macro2"}" deps)
    (features_.quote."${deps."devise_core"."0.2.0"."quote"}" deps)
    (features_.syn."${deps."devise_core"."0.2.0"."syn"}" deps)
  ];


# end
# docopt-1.0.2

  crates.docopt."1.0.2" = deps: { features?(features_.docopt."1.0.2" deps {}) }: buildRustCrate {
    crateName = "docopt";
    version = "1.0.2";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1iix1ck1pkmgajz606vylbackgymsqnbxp280v8nj6kvb6ydfgnz";
    crateBin =
      [{  name = "docopt-wordlist";  path = "src/wordlist.rs"; }];
    dependencies = mapFeatures features ([
      (crates."lazy_static"."${deps."docopt"."1.0.2"."lazy_static"}" deps)
      (crates."regex"."${deps."docopt"."1.0.2"."regex"}" deps)
      (crates."serde"."${deps."docopt"."1.0.2"."serde"}" deps)
      (crates."serde_derive"."${deps."docopt"."1.0.2"."serde_derive"}" deps)
      (crates."strsim"."${deps."docopt"."1.0.2"."strsim"}" deps)
    ]);
  };
  features_.docopt."1.0.2" = deps: f: updateFeatures f (rec {
    docopt."1.0.2".default = (f.docopt."1.0.2".default or true);
    lazy_static."${deps.docopt."1.0.2".lazy_static}".default = true;
    regex."${deps.docopt."1.0.2".regex}".default = true;
    serde."${deps.docopt."1.0.2".serde}".default = true;
    serde_derive."${deps.docopt."1.0.2".serde_derive}".default = true;
    strsim."${deps.docopt."1.0.2".strsim}".default = true;
  }) [
    (features_.lazy_static."${deps."docopt"."1.0.2"."lazy_static"}" deps)
    (features_.regex."${deps."docopt"."1.0.2"."regex"}" deps)
    (features_.serde."${deps."docopt"."1.0.2"."serde"}" deps)
    (features_.serde_derive."${deps."docopt"."1.0.2"."serde_derive"}" deps)
    (features_.strsim."${deps."docopt"."1.0.2"."strsim"}" deps)
  ];


# end
# filetime-0.2.4

  crates.filetime."0.2.4" = deps: { features?(features_.filetime."0.2.4" deps {}) }: buildRustCrate {
    crateName = "filetime";
    version = "0.2.4";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1lsc0qjihr8y56rlzdcldzr0nbljm8qqi691msgwhy6wrkawwx5d";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."filetime"."0.2.4"."cfg_if"}" deps)
    ])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."filetime"."0.2.4"."redox_syscall"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."filetime"."0.2.4"."libc"}" deps)
    ]) else []);
  };
  features_.filetime."0.2.4" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.filetime."0.2.4".cfg_if}".default = true;
    filetime."0.2.4".default = (f.filetime."0.2.4".default or true);
    libc."${deps.filetime."0.2.4".libc}".default = true;
    redox_syscall."${deps.filetime."0.2.4".redox_syscall}".default = true;
  }) [
    (features_.cfg_if."${deps."filetime"."0.2.4"."cfg_if"}" deps)
    (features_.redox_syscall."${deps."filetime"."0.2.4"."redox_syscall"}" deps)
    (features_.libc."${deps."filetime"."0.2.4"."libc"}" deps)
  ];


# end
# fsevent-0.2.17

  crates.fsevent."0.2.17" = deps: { features?(features_.fsevent."0.2.17" deps {}) }: buildRustCrate {
    crateName = "fsevent";
    version = "0.2.17";
    authors = [ "Pierre Baillet <pierre@baillet.name>" ];
    sha256 = "0wgn3qyyl7dacxpg3ddbc2hliyjk79pjpck968y03x8mf90hqcyw";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."fsevent"."0.2.17"."bitflags"}" deps)
      (crates."fsevent_sys"."${deps."fsevent"."0.2.17"."fsevent_sys"}" deps)
      (crates."libc"."${deps."fsevent"."0.2.17"."libc"}" deps)
    ]);
  };
  features_.fsevent."0.2.17" = deps: f: updateFeatures f (rec {
    bitflags."${deps.fsevent."0.2.17".bitflags}".default = true;
    fsevent."0.2.17".default = (f.fsevent."0.2.17".default or true);
    fsevent_sys."${deps.fsevent."0.2.17".fsevent_sys}".default = true;
    libc."${deps.fsevent."0.2.17".libc}".default = true;
  }) [
    (features_.bitflags."${deps."fsevent"."0.2.17"."bitflags"}" deps)
    (features_.fsevent_sys."${deps."fsevent"."0.2.17"."fsevent_sys"}" deps)
    (features_.libc."${deps."fsevent"."0.2.17"."libc"}" deps)
  ];


# end
# fsevent-sys-0.1.6

  crates.fsevent_sys."0.1.6" = deps: { features?(features_.fsevent_sys."0.1.6" deps {}) }: buildRustCrate {
    crateName = "fsevent-sys";
    version = "0.1.6";
    authors = [ "Pierre Baillet <pierre@baillet.name>" ];
    sha256 = "0zydr8qppn25qlgxgdblwx6qgdvj6f12xp7jjhz72z8wlsgqkm08";
    libPath = "lib.rs";
    libName = "fsevent_sys";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."fsevent_sys"."0.1.6"."libc"}" deps)
    ]);
  };
  features_.fsevent_sys."0.1.6" = deps: f: updateFeatures f (rec {
    fsevent_sys."0.1.6".default = (f.fsevent_sys."0.1.6".default or true);
    libc."${deps.fsevent_sys."0.1.6".libc}".default = true;
  }) [
    (features_.libc."${deps."fsevent_sys"."0.1.6"."libc"}" deps)
  ];


# end
# fuchsia-zircon-0.3.3

  crates.fuchsia_zircon."0.3.3" = deps: { features?(features_.fuchsia_zircon."0.3.3" deps {}) }: buildRustCrate {
    crateName = "fuchsia-zircon";
    version = "0.3.3";
    authors = [ "Raph Levien <raph@google.com>" ];
    sha256 = "0jrf4shb1699r4la8z358vri8318w4mdi6qzfqy30p2ymjlca4gk";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."fuchsia_zircon"."0.3.3"."bitflags"}" deps)
      (crates."fuchsia_zircon_sys"."${deps."fuchsia_zircon"."0.3.3"."fuchsia_zircon_sys"}" deps)
    ]);
  };
  features_.fuchsia_zircon."0.3.3" = deps: f: updateFeatures f (rec {
    bitflags."${deps.fuchsia_zircon."0.3.3".bitflags}".default = true;
    fuchsia_zircon."0.3.3".default = (f.fuchsia_zircon."0.3.3".default or true);
    fuchsia_zircon_sys."${deps.fuchsia_zircon."0.3.3".fuchsia_zircon_sys}".default = true;
  }) [
    (features_.bitflags."${deps."fuchsia_zircon"."0.3.3"."bitflags"}" deps)
    (features_.fuchsia_zircon_sys."${deps."fuchsia_zircon"."0.3.3"."fuchsia_zircon_sys"}" deps)
  ];


# end
# fuchsia-zircon-sys-0.3.3

  crates.fuchsia_zircon_sys."0.3.3" = deps: { features?(features_.fuchsia_zircon_sys."0.3.3" deps {}) }: buildRustCrate {
    crateName = "fuchsia-zircon-sys";
    version = "0.3.3";
    authors = [ "Raph Levien <raph@google.com>" ];
    sha256 = "08jp1zxrm9jbrr6l26bjal4dbm8bxfy57ickdgibsqxr1n9j3hf5";
  };
  features_.fuchsia_zircon_sys."0.3.3" = deps: f: updateFeatures f (rec {
    fuchsia_zircon_sys."0.3.3".default = (f.fuchsia_zircon_sys."0.3.3".default or true);
  }) [];


# end
# git2-0.8.0

  crates.git2."0.8.0" = deps: { features?(features_.git2."0.8.0" deps {}) }: buildRustCrate {
    crateName = "git2";
    version = "0.8.0";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0nkzglhq7lrdzv23jakygv6h5kks2mdr7xh73chnr7bqdc36mi43";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."git2"."0.8.0"."bitflags"}" deps)
      (crates."libc"."${deps."git2"."0.8.0"."libc"}" deps)
      (crates."libgit2_sys"."${deps."git2"."0.8.0"."libgit2_sys"}" deps)
      (crates."log"."${deps."git2"."0.8.0"."log"}" deps)
      (crates."url"."${deps."git2"."0.8.0"."url"}" deps)
    ])
      ++ (if (kernel == "linux" || kernel == "darwin") && !(kernel == "darwin") then mapFeatures features ([
    ]
      ++ (if features.git2."0.8.0".openssl-probe or false then [ (crates.openssl_probe."${deps."git2"."0.8.0".openssl_probe}" deps) ] else [])
      ++ (if features.git2."0.8.0".openssl-sys or false then [ (crates.openssl_sys."${deps."git2"."0.8.0".openssl_sys}" deps) ] else [])) else []);
    features = mkFeatures (features."git2"."0.8.0" or {});
  };
  features_.git2."0.8.0" = deps: f: updateFeatures f (rec {
    bitflags."${deps.git2."0.8.0".bitflags}".default = true;
    git2 = fold recursiveUpdate {} [
      { "0.8.0".curl =
        (f.git2."0.8.0".curl or false) ||
        (f.git2."0.8.0".default or false) ||
        (git2."0.8.0"."default" or false); }
      { "0.8.0".default = (f.git2."0.8.0".default or true); }
      { "0.8.0".https =
        (f.git2."0.8.0".https or false) ||
        (f.git2."0.8.0".default or false) ||
        (git2."0.8.0"."default" or false); }
      { "0.8.0".openssl-probe =
        (f.git2."0.8.0".openssl-probe or false) ||
        (f.git2."0.8.0".https or false) ||
        (git2."0.8.0"."https" or false); }
      { "0.8.0".openssl-sys =
        (f.git2."0.8.0".openssl-sys or false) ||
        (f.git2."0.8.0".https or false) ||
        (git2."0.8.0"."https" or false); }
      { "0.8.0".ssh =
        (f.git2."0.8.0".ssh or false) ||
        (f.git2."0.8.0".default or false) ||
        (git2."0.8.0"."default" or false); }
      { "0.8.0".ssh_key_from_memory =
        (f.git2."0.8.0".ssh_key_from_memory or false) ||
        (f.git2."0.8.0".default or false) ||
        (git2."0.8.0"."default" or false); }
    ];
    libc."${deps.git2."0.8.0".libc}".default = true;
    libgit2_sys = fold recursiveUpdate {} [
      { "${deps.git2."0.8.0".libgit2_sys}"."curl" =
        (f.libgit2_sys."${deps.git2."0.8.0".libgit2_sys}"."curl" or false) ||
        (git2."0.8.0"."curl" or false) ||
        (f."git2"."0.8.0"."curl" or false); }
      { "${deps.git2."0.8.0".libgit2_sys}"."https" =
        (f.libgit2_sys."${deps.git2."0.8.0".libgit2_sys}"."https" or false) ||
        (git2."0.8.0"."https" or false) ||
        (f."git2"."0.8.0"."https" or false); }
      { "${deps.git2."0.8.0".libgit2_sys}"."ssh" =
        (f.libgit2_sys."${deps.git2."0.8.0".libgit2_sys}"."ssh" or false) ||
        (git2."0.8.0"."ssh" or false) ||
        (f."git2"."0.8.0"."ssh" or false); }
      { "${deps.git2."0.8.0".libgit2_sys}"."ssh_key_from_memory" =
        (f.libgit2_sys."${deps.git2."0.8.0".libgit2_sys}"."ssh_key_from_memory" or false) ||
        (git2."0.8.0"."ssh_key_from_memory" or false) ||
        (f."git2"."0.8.0"."ssh_key_from_memory" or false); }
      { "${deps.git2."0.8.0".libgit2_sys}".default = true; }
    ];
    log."${deps.git2."0.8.0".log}".default = true;
    openssl_probe."${deps.git2."0.8.0".openssl_probe}".default = true;
    openssl_sys."${deps.git2."0.8.0".openssl_sys}".default = true;
    url."${deps.git2."0.8.0".url}".default = true;
  }) [
    (features_.bitflags."${deps."git2"."0.8.0"."bitflags"}" deps)
    (features_.libc."${deps."git2"."0.8.0"."libc"}" deps)
    (features_.libgit2_sys."${deps."git2"."0.8.0"."libgit2_sys"}" deps)
    (features_.log."${deps."git2"."0.8.0"."log"}" deps)
    (features_.url."${deps."git2"."0.8.0"."url"}" deps)
    (features_.openssl_probe."${deps."git2"."0.8.0"."openssl_probe"}" deps)
    (features_.openssl_sys."${deps."git2"."0.8.0"."openssl_sys"}" deps)
  ];


# end
# httparse-1.3.3

  crates.httparse."1.3.3" = deps: { features?(features_.httparse."1.3.3" deps {}) }: buildRustCrate {
    crateName = "httparse";
    version = "1.3.3";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "1jymxy4bl0mzgp2dx0pzqzbr72sw5jmr5sjqiry4xr88z4z9qlyx";
    build = "build.rs";
    features = mkFeatures (features."httparse"."1.3.3" or {});
  };
  features_.httparse."1.3.3" = deps: f: updateFeatures f (rec {
    httparse = fold recursiveUpdate {} [
      { "1.3.3".default = (f.httparse."1.3.3".default or true); }
      { "1.3.3".std =
        (f.httparse."1.3.3".std or false) ||
        (f.httparse."1.3.3".default or false) ||
        (httparse."1.3.3"."default" or false); }
    ];
  }) [];


# end
# hyper-0.10.15

  crates.hyper."0.10.15" = deps: { features?(features_.hyper."0.10.15" deps {}) }: buildRustCrate {
    crateName = "hyper";
    version = "0.10.15";
    authors = [ "Sean McArthur <sean.monstar@gmail.com>" "Jonathan Reem <jonathan.reem@gmail.com>" ];
    sha256 = "14bf31dwwfvza3kfc4mmk4q0v7iq5ys3hiz7islij1x9g4c53s9p";
    dependencies = mapFeatures features ([
      (crates."base64"."${deps."hyper"."0.10.15"."base64"}" deps)
      (crates."httparse"."${deps."hyper"."0.10.15"."httparse"}" deps)
      (crates."language_tags"."${deps."hyper"."0.10.15"."language_tags"}" deps)
      (crates."log"."${deps."hyper"."0.10.15"."log"}" deps)
      (crates."mime"."${deps."hyper"."0.10.15"."mime"}" deps)
      (crates."num_cpus"."${deps."hyper"."0.10.15"."num_cpus"}" deps)
      (crates."time"."${deps."hyper"."0.10.15"."time"}" deps)
      (crates."traitobject"."${deps."hyper"."0.10.15"."traitobject"}" deps)
      (crates."typeable"."${deps."hyper"."0.10.15"."typeable"}" deps)
      (crates."unicase"."${deps."hyper"."0.10.15"."unicase"}" deps)
      (crates."url"."${deps."hyper"."0.10.15"."url"}" deps)
    ]);
    features = mkFeatures (features."hyper"."0.10.15" or {});
  };
  features_.hyper."0.10.15" = deps: f: updateFeatures f (rec {
    base64."${deps.hyper."0.10.15".base64}".default = true;
    httparse."${deps.hyper."0.10.15".httparse}".default = true;
    hyper."0.10.15".default = (f.hyper."0.10.15".default or true);
    language_tags."${deps.hyper."0.10.15".language_tags}".default = true;
    log."${deps.hyper."0.10.15".log}".default = true;
    mime."${deps.hyper."0.10.15".mime}".default = true;
    num_cpus."${deps.hyper."0.10.15".num_cpus}".default = true;
    time."${deps.hyper."0.10.15".time}".default = true;
    traitobject."${deps.hyper."0.10.15".traitobject}".default = true;
    typeable."${deps.hyper."0.10.15".typeable}".default = true;
    unicase."${deps.hyper."0.10.15".unicase}".default = true;
    url."${deps.hyper."0.10.15".url}".default = true;
  }) [
    (features_.base64."${deps."hyper"."0.10.15"."base64"}" deps)
    (features_.httparse."${deps."hyper"."0.10.15"."httparse"}" deps)
    (features_.language_tags."${deps."hyper"."0.10.15"."language_tags"}" deps)
    (features_.log."${deps."hyper"."0.10.15"."log"}" deps)
    (features_.mime."${deps."hyper"."0.10.15"."mime"}" deps)
    (features_.num_cpus."${deps."hyper"."0.10.15"."num_cpus"}" deps)
    (features_.time."${deps."hyper"."0.10.15"."time"}" deps)
    (features_.traitobject."${deps."hyper"."0.10.15"."traitobject"}" deps)
    (features_.typeable."${deps."hyper"."0.10.15"."typeable"}" deps)
    (features_.unicase."${deps."hyper"."0.10.15"."unicase"}" deps)
    (features_.url."${deps."hyper"."0.10.15"."url"}" deps)
  ];


# end
# idna-0.1.5

  crates.idna."0.1.5" = deps: { features?(features_.idna."0.1.5" deps {}) }: buildRustCrate {
    crateName = "idna";
    version = "0.1.5";
    authors = [ "The rust-url developers" ];
    sha256 = "1gwgl19rz5vzi67rrhamczhxy050f5ynx4ybabfapyalv7z1qmjy";
    dependencies = mapFeatures features ([
      (crates."matches"."${deps."idna"."0.1.5"."matches"}" deps)
      (crates."unicode_bidi"."${deps."idna"."0.1.5"."unicode_bidi"}" deps)
      (crates."unicode_normalization"."${deps."idna"."0.1.5"."unicode_normalization"}" deps)
    ]);
  };
  features_.idna."0.1.5" = deps: f: updateFeatures f (rec {
    idna."0.1.5".default = (f.idna."0.1.5".default or true);
    matches."${deps.idna."0.1.5".matches}".default = true;
    unicode_bidi."${deps.idna."0.1.5".unicode_bidi}".default = true;
    unicode_normalization."${deps.idna."0.1.5".unicode_normalization}".default = true;
  }) [
    (features_.matches."${deps."idna"."0.1.5"."matches"}" deps)
    (features_.unicode_bidi."${deps."idna"."0.1.5"."unicode_bidi"}" deps)
    (features_.unicode_normalization."${deps."idna"."0.1.5"."unicode_normalization"}" deps)
  ];


# end
# indexmap-1.0.2

  crates.indexmap."1.0.2" = deps: { features?(features_.indexmap."1.0.2" deps {}) }: buildRustCrate {
    crateName = "indexmap";
    version = "1.0.2";
    authors = [ "bluss" "Josh Stone <cuviper@gmail.com>" ];
    sha256 = "18a0cn5xy3a7wswxg5lwfg3j4sh5blk28ykw0ysgr486djd353gf";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."indexmap"."1.0.2" or {});
  };
  features_.indexmap."1.0.2" = deps: f: updateFeatures f (rec {
    indexmap = fold recursiveUpdate {} [
      { "1.0.2".default = (f.indexmap."1.0.2".default or true); }
      { "1.0.2".serde =
        (f.indexmap."1.0.2".serde or false) ||
        (f.indexmap."1.0.2".serde-1 or false) ||
        (indexmap."1.0.2"."serde-1" or false); }
    ];
  }) [];


# end
# inotify-0.6.1

  crates.inotify."0.6.1" = deps: { features?(features_.inotify."0.6.1" deps {}) }: buildRustCrate {
    crateName = "inotify";
    version = "0.6.1";
    authors = [ "Hanno Braun <mail@hannobraun.de>" "Félix Saparelli <me@passcod.name>" "Cristian Kubis <cristian.kubis@tsunix.de>" "Frank Denis <github@pureftpd.org>" ];
    sha256 = "11p9dkxbrkv95dj13rza066ly36i51hn1li229wy69gxvprsqs23";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."inotify"."0.6.1"."bitflags"}" deps)
      (crates."inotify_sys"."${deps."inotify"."0.6.1"."inotify_sys"}" deps)
      (crates."libc"."${deps."inotify"."0.6.1"."libc"}" deps)
    ]);
    features = mkFeatures (features."inotify"."0.6.1" or {});
  };
  features_.inotify."0.6.1" = deps: f: updateFeatures f (rec {
    bitflags."${deps.inotify."0.6.1".bitflags}".default = true;
    inotify = fold recursiveUpdate {} [
      { "0.6.1".default = (f.inotify."0.6.1".default or true); }
      { "0.6.1".futures =
        (f.inotify."0.6.1".futures or false) ||
        (f.inotify."0.6.1".stream or false) ||
        (inotify."0.6.1"."stream" or false); }
      { "0.6.1".mio =
        (f.inotify."0.6.1".mio or false) ||
        (f.inotify."0.6.1".stream or false) ||
        (inotify."0.6.1"."stream" or false); }
      { "0.6.1".stream =
        (f.inotify."0.6.1".stream or false) ||
        (f.inotify."0.6.1".default or false) ||
        (inotify."0.6.1"."default" or false); }
      { "0.6.1".tokio-io =
        (f.inotify."0.6.1".tokio-io or false) ||
        (f.inotify."0.6.1".stream or false) ||
        (inotify."0.6.1"."stream" or false); }
      { "0.6.1".tokio-reactor =
        (f.inotify."0.6.1".tokio-reactor or false) ||
        (f.inotify."0.6.1".stream or false) ||
        (inotify."0.6.1"."stream" or false); }
    ];
    inotify_sys."${deps.inotify."0.6.1".inotify_sys}".default = true;
    libc."${deps.inotify."0.6.1".libc}".default = true;
  }) [
    (features_.bitflags."${deps."inotify"."0.6.1"."bitflags"}" deps)
    (features_.inotify_sys."${deps."inotify"."0.6.1"."inotify_sys"}" deps)
    (features_.libc."${deps."inotify"."0.6.1"."libc"}" deps)
  ];


# end
# inotify-sys-0.1.3

  crates.inotify_sys."0.1.3" = deps: { features?(features_.inotify_sys."0.1.3" deps {}) }: buildRustCrate {
    crateName = "inotify-sys";
    version = "0.1.3";
    authors = [ "Hanno Braun <hb@hannobraun.de>" ];
    sha256 = "110bbc9vprrj3cmp5g5v1adfh3wlnlbxqllwfksrlcdv1k3dnv8n";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."inotify_sys"."0.1.3"."libc"}" deps)
    ]);
  };
  features_.inotify_sys."0.1.3" = deps: f: updateFeatures f (rec {
    inotify_sys."0.1.3".default = (f.inotify_sys."0.1.3".default or true);
    libc."${deps.inotify_sys."0.1.3".libc}".default = true;
  }) [
    (features_.libc."${deps."inotify_sys"."0.1.3"."libc"}" deps)
  ];


# end
# iovec-0.1.2

  crates.iovec."0.1.2" = deps: { features?(features_.iovec."0.1.2" deps {}) }: buildRustCrate {
    crateName = "iovec";
    version = "0.1.2";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0vjymmb7wj4v4kza5jjn48fcdb85j3k37y7msjl3ifz0p9yiyp2r";
    dependencies = (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."iovec"."0.1.2"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."iovec"."0.1.2"."winapi"}" deps)
    ]) else []);
  };
  features_.iovec."0.1.2" = deps: f: updateFeatures f (rec {
    iovec."0.1.2".default = (f.iovec."0.1.2".default or true);
    libc."${deps.iovec."0.1.2".libc}".default = true;
    winapi."${deps.iovec."0.1.2".winapi}".default = true;
  }) [
    (features_.libc."${deps."iovec"."0.1.2"."libc"}" deps)
    (features_.winapi."${deps."iovec"."0.1.2"."winapi"}" deps)
  ];


# end
# ipnet-2.0.0

  crates.ipnet."2.0.0" = deps: { features?(features_.ipnet."2.0.0" deps {}) }: buildRustCrate {
    crateName = "ipnet";
    version = "2.0.0";
    authors = [ "Kris Price <kris@krisprice.nz>" ];
    sha256 = "0x2qnpxg90y12p9gk4yb8m44ds9nnwfhcl1ga3x9hl9474jjb450";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.ipnet."2.0.0".serde or false then [ (crates.serde."${deps."ipnet"."2.0.0".serde}" deps) ] else []));
    features = mkFeatures (features."ipnet"."2.0.0" or {});
  };
  features_.ipnet."2.0.0" = deps: f: updateFeatures f (rec {
    ipnet."2.0.0".default = (f.ipnet."2.0.0".default or true);
    serde = fold recursiveUpdate {} [
      { "${deps.ipnet."2.0.0".serde}"."derive" = true; }
      { "${deps.ipnet."2.0.0".serde}".default = true; }
    ];
  }) [
    (features_.serde."${deps."ipnet"."2.0.0"."serde"}" deps)
  ];


# end
# isatty-0.1.9

  crates.isatty."0.1.9" = deps: { features?(features_.isatty."0.1.9" deps {}) }: buildRustCrate {
    crateName = "isatty";
    version = "0.1.9";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "18hpy97y67jmvmdz4rg6z5ypgrn6fcjhl81plapyp1idq0vhcwrz";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."isatty"."0.1.9"."cfg_if"}" deps)
    ])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."isatty"."0.1.9"."redox_syscall"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."isatty"."0.1.9"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."isatty"."0.1.9"."winapi"}" deps)
    ]) else []);
  };
  features_.isatty."0.1.9" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.isatty."0.1.9".cfg_if}".default = true;
    isatty."0.1.9".default = (f.isatty."0.1.9".default or true);
    libc."${deps.isatty."0.1.9".libc}".default = true;
    redox_syscall."${deps.isatty."0.1.9".redox_syscall}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.isatty."0.1.9".winapi}"."consoleapi" = true; }
      { "${deps.isatty."0.1.9".winapi}"."fileapi" = true; }
      { "${deps.isatty."0.1.9".winapi}"."minwinbase" = true; }
      { "${deps.isatty."0.1.9".winapi}"."minwindef" = true; }
      { "${deps.isatty."0.1.9".winapi}"."processenv" = true; }
      { "${deps.isatty."0.1.9".winapi}"."winbase" = true; }
      { "${deps.isatty."0.1.9".winapi}"."winnt" = true; }
      { "${deps.isatty."0.1.9".winapi}".default = true; }
    ];
  }) [
    (features_.cfg_if."${deps."isatty"."0.1.9"."cfg_if"}" deps)
    (features_.redox_syscall."${deps."isatty"."0.1.9"."redox_syscall"}" deps)
    (features_.libc."${deps."isatty"."0.1.9"."libc"}" deps)
    (features_.winapi."${deps."isatty"."0.1.9"."winapi"}" deps)
  ];


# end
# itoa-0.4.3

  crates.itoa."0.4.3" = deps: { features?(features_.itoa."0.4.3" deps {}) }: buildRustCrate {
    crateName = "itoa";
    version = "0.4.3";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "0zadimmdgvili3gdwxqg7ljv3r4wcdg1kkdfp9nl15vnm23vrhy1";
    features = mkFeatures (features."itoa"."0.4.3" or {});
  };
  features_.itoa."0.4.3" = deps: f: updateFeatures f (rec {
    itoa = fold recursiveUpdate {} [
      { "0.4.3".default = (f.itoa."0.4.3".default or true); }
      { "0.4.3".std =
        (f.itoa."0.4.3".std or false) ||
        (f.itoa."0.4.3".default or false) ||
        (itoa."0.4.3"."default" or false); }
    ];
  }) [];


# end
# kernel32-sys-0.2.2

  crates.kernel32_sys."0.2.2" = deps: { features?(features_.kernel32_sys."0.2.2" deps {}) }: buildRustCrate {
    crateName = "kernel32-sys";
    version = "0.2.2";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1lrw1hbinyvr6cp28g60z97w32w8vsk6pahk64pmrv2fmby8srfj";
    libName = "kernel32";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."winapi"."${deps."kernel32_sys"."0.2.2"."winapi"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."winapi_build"."${deps."kernel32_sys"."0.2.2"."winapi_build"}" deps)
    ]);
  };
  features_.kernel32_sys."0.2.2" = deps: f: updateFeatures f (rec {
    kernel32_sys."0.2.2".default = (f.kernel32_sys."0.2.2".default or true);
    winapi."${deps.kernel32_sys."0.2.2".winapi}".default = true;
    winapi_build."${deps.kernel32_sys."0.2.2".winapi_build}".default = true;
  }) [
    (features_.winapi."${deps."kernel32_sys"."0.2.2"."winapi"}" deps)
    (features_.winapi_build."${deps."kernel32_sys"."0.2.2"."winapi_build"}" deps)
  ];


# end
# language-tags-0.2.2

  crates.language_tags."0.2.2" = deps: { features?(features_.language_tags."0.2.2" deps {}) }: buildRustCrate {
    crateName = "language-tags";
    version = "0.2.2";
    authors = [ "Pyfisch <pyfisch@gmail.com>" ];
    sha256 = "1zkrdzsqzzc7509kd7nngdwrp461glm2g09kqpzaqksp82frjdvy";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."language_tags"."0.2.2" or {});
  };
  features_.language_tags."0.2.2" = deps: f: updateFeatures f (rec {
    language_tags = fold recursiveUpdate {} [
      { "0.2.2".default = (f.language_tags."0.2.2".default or true); }
      { "0.2.2".heapsize =
        (f.language_tags."0.2.2".heapsize or false) ||
        (f.language_tags."0.2.2".heap_size or false) ||
        (language_tags."0.2.2"."heap_size" or false); }
      { "0.2.2".heapsize_plugin =
        (f.language_tags."0.2.2".heapsize_plugin or false) ||
        (f.language_tags."0.2.2".heap_size or false) ||
        (language_tags."0.2.2"."heap_size" or false); }
    ];
  }) [];


# end
# lazy_static-1.3.0

  crates.lazy_static."1.3.0" = deps: { features?(features_.lazy_static."1.3.0" deps {}) }: buildRustCrate {
    crateName = "lazy_static";
    version = "1.3.0";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "1vv47va18ydk7dx5paz88g3jy1d3lwbx6qpxkbj8gyfv770i4b1y";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."lazy_static"."1.3.0" or {});
  };
  features_.lazy_static."1.3.0" = deps: f: updateFeatures f (rec {
    lazy_static = fold recursiveUpdate {} [
      { "1.3.0".default = (f.lazy_static."1.3.0".default or true); }
      { "1.3.0".spin =
        (f.lazy_static."1.3.0".spin or false) ||
        (f.lazy_static."1.3.0".spin_no_std or false) ||
        (lazy_static."1.3.0"."spin_no_std" or false); }
    ];
  }) [];


# end
# lazycell-1.2.1

  crates.lazycell."1.2.1" = deps: { features?(features_.lazycell."1.2.1" deps {}) }: buildRustCrate {
    crateName = "lazycell";
    version = "1.2.1";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "Nikita Pekin <contact@nikitapek.in>" ];
    sha256 = "1m4h2q9rgxrgc7xjnws1x81lrb68jll8w3pykx1a9bhr29q2mcwm";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."lazycell"."1.2.1" or {});
  };
  features_.lazycell."1.2.1" = deps: f: updateFeatures f (rec {
    lazycell = fold recursiveUpdate {} [
      { "1.2.1".clippy =
        (f.lazycell."1.2.1".clippy or false) ||
        (f.lazycell."1.2.1".nightly-testing or false) ||
        (lazycell."1.2.1"."nightly-testing" or false); }
      { "1.2.1".default = (f.lazycell."1.2.1".default or true); }
      { "1.2.1".nightly =
        (f.lazycell."1.2.1".nightly or false) ||
        (f.lazycell."1.2.1".nightly-testing or false) ||
        (lazycell."1.2.1"."nightly-testing" or false); }
    ];
  }) [];


# end
# libc-0.2.50

  crates.libc."0.2.50" = deps: { features?(features_.libc."0.2.50" deps {}) }: buildRustCrate {
    crateName = "libc";
    version = "0.2.50";
    authors = [ "The Rust Project Developers" ];
    sha256 = "14y4zm0xp2xbj3l1kxqf2wpl58xb7hglxdbfx5dcxjlchbvk5dzs";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."libc"."0.2.50" or {});
  };
  features_.libc."0.2.50" = deps: f: updateFeatures f (rec {
    libc = fold recursiveUpdate {} [
      { "0.2.50".align =
        (f.libc."0.2.50".align or false) ||
        (f.libc."0.2.50".rustc-dep-of-std or false) ||
        (libc."0.2.50"."rustc-dep-of-std" or false); }
      { "0.2.50".default = (f.libc."0.2.50".default or true); }
      { "0.2.50".rustc-std-workspace-core =
        (f.libc."0.2.50".rustc-std-workspace-core or false) ||
        (f.libc."0.2.50".rustc-dep-of-std or false) ||
        (libc."0.2.50"."rustc-dep-of-std" or false); }
      { "0.2.50".use_std =
        (f.libc."0.2.50".use_std or false) ||
        (f.libc."0.2.50".default or false) ||
        (libc."0.2.50"."default" or false); }
    ];
  }) [];


# end
# libgit2-sys-0.7.11

  crates.libgit2_sys."0.7.11" = deps: { features?(features_.libgit2_sys."0.7.11" deps {}) }: buildRustCrate {
    crateName = "libgit2-sys";
    version = "0.7.11";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "12wyfl7xl7lpz65s17j5rf9xfkn461792f67jqsz0ign3daaac9h";
    libPath = "lib.rs";
    libName = "libgit2_sys";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."libgit2_sys"."0.7.11"."libc"}" deps)
      (crates."libz_sys"."${deps."libgit2_sys"."0.7.11"."libz_sys"}" deps)
    ]
      ++ (if features.libgit2_sys."0.7.11".curl-sys or false then [ (crates.curl_sys."${deps."libgit2_sys"."0.7.11".curl_sys}" deps) ] else [])
      ++ (if features.libgit2_sys."0.7.11".libssh2-sys or false then [ (crates.libssh2_sys."${deps."libgit2_sys"."0.7.11".libssh2_sys}" deps) ] else []))
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
    ]
      ++ (if features.libgit2_sys."0.7.11".openssl-sys or false then [ (crates.openssl_sys."${deps."libgit2_sys"."0.7.11".openssl_sys}" deps) ] else [])) else []);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."libgit2_sys"."0.7.11"."cc"}" deps)
      (crates."pkg_config"."${deps."libgit2_sys"."0.7.11"."pkg_config"}" deps)
    ]);
    features = mkFeatures (features."libgit2_sys"."0.7.11" or {});
  };
  features_.libgit2_sys."0.7.11" = deps: f: updateFeatures f (rec {
    cc."${deps.libgit2_sys."0.7.11".cc}".default = true;
    curl_sys."${deps.libgit2_sys."0.7.11".curl_sys}".default = true;
    libc."${deps.libgit2_sys."0.7.11".libc}".default = true;
    libgit2_sys = fold recursiveUpdate {} [
      { "0.7.11".curl-sys =
        (f.libgit2_sys."0.7.11".curl-sys or false) ||
        (f.libgit2_sys."0.7.11".curl or false) ||
        (libgit2_sys."0.7.11"."curl" or false); }
      { "0.7.11".default = (f.libgit2_sys."0.7.11".default or true); }
      { "0.7.11".libssh2-sys =
        (f.libgit2_sys."0.7.11".libssh2-sys or false) ||
        (f.libgit2_sys."0.7.11".ssh or false) ||
        (libgit2_sys."0.7.11"."ssh" or false); }
      { "0.7.11".openssl-sys =
        (f.libgit2_sys."0.7.11".openssl-sys or false) ||
        (f.libgit2_sys."0.7.11".https or false) ||
        (libgit2_sys."0.7.11"."https" or false); }
    ];
    libssh2_sys."${deps.libgit2_sys."0.7.11".libssh2_sys}".default = true;
    libz_sys."${deps.libgit2_sys."0.7.11".libz_sys}".default = true;
    openssl_sys."${deps.libgit2_sys."0.7.11".openssl_sys}".default = true;
    pkg_config."${deps.libgit2_sys."0.7.11".pkg_config}".default = true;
  }) [
    (features_.curl_sys."${deps."libgit2_sys"."0.7.11"."curl_sys"}" deps)
    (features_.libc."${deps."libgit2_sys"."0.7.11"."libc"}" deps)
    (features_.libssh2_sys."${deps."libgit2_sys"."0.7.11"."libssh2_sys"}" deps)
    (features_.libz_sys."${deps."libgit2_sys"."0.7.11"."libz_sys"}" deps)
    (features_.cc."${deps."libgit2_sys"."0.7.11"."cc"}" deps)
    (features_.pkg_config."${deps."libgit2_sys"."0.7.11"."pkg_config"}" deps)
    (features_.openssl_sys."${deps."libgit2_sys"."0.7.11"."openssl_sys"}" deps)
  ];


# end
# libssh2-sys-0.2.11

  crates.libssh2_sys."0.2.11" = deps: { features?(features_.libssh2_sys."0.2.11" deps {}) }: buildRustCrate {
    crateName = "libssh2-sys";
    version = "0.2.11";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1mjily9qjjjf31pzvlxyqnp1midjc77s6sd303j46d14igna7nhi";
    libPath = "lib.rs";
    libName = "libssh2_sys";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."libssh2_sys"."0.2.11"."libc"}" deps)
      (crates."libz_sys"."${deps."libssh2_sys"."0.2.11"."libz_sys"}" deps)
    ])
      ++ (if abi == "msvc" then mapFeatures features ([
]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."openssl_sys"."${deps."libssh2_sys"."0.2.11"."openssl_sys"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."libssh2_sys"."0.2.11"."cc"}" deps)
      (crates."pkg_config"."${deps."libssh2_sys"."0.2.11"."pkg_config"}" deps)
    ]);
  };
  features_.libssh2_sys."0.2.11" = deps: f: updateFeatures f (rec {
    cc."${deps.libssh2_sys."0.2.11".cc}".default = true;
    libc."${deps.libssh2_sys."0.2.11".libc}".default = true;
    libssh2_sys."0.2.11".default = (f.libssh2_sys."0.2.11".default or true);
    libz_sys."${deps.libssh2_sys."0.2.11".libz_sys}".default = true;
    openssl_sys."${deps.libssh2_sys."0.2.11".openssl_sys}".default = true;
    pkg_config."${deps.libssh2_sys."0.2.11".pkg_config}".default = true;
  }) [
    (features_.libc."${deps."libssh2_sys"."0.2.11"."libc"}" deps)
    (features_.libz_sys."${deps."libssh2_sys"."0.2.11"."libz_sys"}" deps)
    (features_.cc."${deps."libssh2_sys"."0.2.11"."cc"}" deps)
    (features_.pkg_config."${deps."libssh2_sys"."0.2.11"."pkg_config"}" deps)
    (features_.openssl_sys."${deps."libssh2_sys"."0.2.11"."openssl_sys"}" deps)
  ];


# end
# libz-sys-1.0.25

  crates.libz_sys."1.0.25" = deps: { features?(features_.libz_sys."1.0.25" deps {}) }: buildRustCrate {
    crateName = "libz-sys";
    version = "1.0.25";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "195jzg8mgjbvmkbpx1rzkzrqm0g2fdivk79v44c9lzl64r3f9fym";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."libz_sys"."1.0.25"."libc"}" deps)
    ])
      ++ (if abi == "msvc" then mapFeatures features ([
]) else []);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."libz_sys"."1.0.25"."cc"}" deps)
      (crates."pkg_config"."${deps."libz_sys"."1.0.25"."pkg_config"}" deps)
    ]);
    features = mkFeatures (features."libz_sys"."1.0.25" or {});
  };
  features_.libz_sys."1.0.25" = deps: f: updateFeatures f (rec {
    cc."${deps.libz_sys."1.0.25".cc}".default = true;
    libc."${deps.libz_sys."1.0.25".libc}".default = true;
    libz_sys."1.0.25".default = (f.libz_sys."1.0.25".default or true);
    pkg_config."${deps.libz_sys."1.0.25".pkg_config}".default = true;
  }) [
    (features_.libc."${deps."libz_sys"."1.0.25"."libc"}" deps)
    (features_.cc."${deps."libz_sys"."1.0.25"."cc"}" deps)
    (features_.pkg_config."${deps."libz_sys"."1.0.25"."pkg_config"}" deps)
  ];


# end
# log-0.3.9

  crates.log."0.3.9" = deps: { features?(features_.log."0.3.9" deps {}) }: buildRustCrate {
    crateName = "log";
    version = "0.3.9";
    authors = [ "The Rust Project Developers" ];
    sha256 = "19i9pwp7lhaqgzangcpw00kc3zsgcqcx84crv07xgz3v7d3kvfa2";
    dependencies = mapFeatures features ([
      (crates."log"."${deps."log"."0.3.9"."log"}" deps)
    ]);
    features = mkFeatures (features."log"."0.3.9" or {});
  };
  features_.log."0.3.9" = deps: f: updateFeatures f (rec {
    log = fold recursiveUpdate {} [
      { "${deps.log."0.3.9".log}"."max_level_debug" =
        (f.log."${deps.log."0.3.9".log}"."max_level_debug" or false) ||
        (log."0.3.9"."max_level_debug" or false) ||
        (f."log"."0.3.9"."max_level_debug" or false); }
      { "${deps.log."0.3.9".log}"."max_level_error" =
        (f.log."${deps.log."0.3.9".log}"."max_level_error" or false) ||
        (log."0.3.9"."max_level_error" or false) ||
        (f."log"."0.3.9"."max_level_error" or false); }
      { "${deps.log."0.3.9".log}"."max_level_info" =
        (f.log."${deps.log."0.3.9".log}"."max_level_info" or false) ||
        (log."0.3.9"."max_level_info" or false) ||
        (f."log"."0.3.9"."max_level_info" or false); }
      { "${deps.log."0.3.9".log}"."max_level_off" =
        (f.log."${deps.log."0.3.9".log}"."max_level_off" or false) ||
        (log."0.3.9"."max_level_off" or false) ||
        (f."log"."0.3.9"."max_level_off" or false); }
      { "${deps.log."0.3.9".log}"."max_level_trace" =
        (f.log."${deps.log."0.3.9".log}"."max_level_trace" or false) ||
        (log."0.3.9"."max_level_trace" or false) ||
        (f."log"."0.3.9"."max_level_trace" or false); }
      { "${deps.log."0.3.9".log}"."max_level_warn" =
        (f.log."${deps.log."0.3.9".log}"."max_level_warn" or false) ||
        (log."0.3.9"."max_level_warn" or false) ||
        (f."log"."0.3.9"."max_level_warn" or false); }
      { "${deps.log."0.3.9".log}"."release_max_level_debug" =
        (f.log."${deps.log."0.3.9".log}"."release_max_level_debug" or false) ||
        (log."0.3.9"."release_max_level_debug" or false) ||
        (f."log"."0.3.9"."release_max_level_debug" or false); }
      { "${deps.log."0.3.9".log}"."release_max_level_error" =
        (f.log."${deps.log."0.3.9".log}"."release_max_level_error" or false) ||
        (log."0.3.9"."release_max_level_error" or false) ||
        (f."log"."0.3.9"."release_max_level_error" or false); }
      { "${deps.log."0.3.9".log}"."release_max_level_info" =
        (f.log."${deps.log."0.3.9".log}"."release_max_level_info" or false) ||
        (log."0.3.9"."release_max_level_info" or false) ||
        (f."log"."0.3.9"."release_max_level_info" or false); }
      { "${deps.log."0.3.9".log}"."release_max_level_off" =
        (f.log."${deps.log."0.3.9".log}"."release_max_level_off" or false) ||
        (log."0.3.9"."release_max_level_off" or false) ||
        (f."log"."0.3.9"."release_max_level_off" or false); }
      { "${deps.log."0.3.9".log}"."release_max_level_trace" =
        (f.log."${deps.log."0.3.9".log}"."release_max_level_trace" or false) ||
        (log."0.3.9"."release_max_level_trace" or false) ||
        (f."log"."0.3.9"."release_max_level_trace" or false); }
      { "${deps.log."0.3.9".log}"."release_max_level_warn" =
        (f.log."${deps.log."0.3.9".log}"."release_max_level_warn" or false) ||
        (log."0.3.9"."release_max_level_warn" or false) ||
        (f."log"."0.3.9"."release_max_level_warn" or false); }
      { "${deps.log."0.3.9".log}"."std" =
        (f.log."${deps.log."0.3.9".log}"."std" or false) ||
        (log."0.3.9"."use_std" or false) ||
        (f."log"."0.3.9"."use_std" or false); }
      { "${deps.log."0.3.9".log}".default = true; }
      { "0.3.9".default = (f.log."0.3.9".default or true); }
      { "0.3.9".use_std =
        (f.log."0.3.9".use_std or false) ||
        (f.log."0.3.9".default or false) ||
        (log."0.3.9"."default" or false); }
    ];
  }) [
    (features_.log."${deps."log"."0.3.9"."log"}" deps)
  ];


# end
# log-0.4.6

  crates.log."0.4.6" = deps: { features?(features_.log."0.4.6" deps {}) }: buildRustCrate {
    crateName = "log";
    version = "0.4.6";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1nd8dl9mvc9vd6fks5d4gsxaz990xi6rzlb8ymllshmwi153vngr";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."log"."0.4.6"."cfg_if"}" deps)
    ]);
    features = mkFeatures (features."log"."0.4.6" or {});
  };
  features_.log."0.4.6" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.log."0.4.6".cfg_if}".default = true;
    log."0.4.6".default = (f.log."0.4.6".default or true);
  }) [
    (features_.cfg_if."${deps."log"."0.4.6"."cfg_if"}" deps)
  ];


# end
# matches-0.1.8

  crates.matches."0.1.8" = deps: { features?(features_.matches."0.1.8" deps {}) }: buildRustCrate {
    crateName = "matches";
    version = "0.1.8";
    authors = [ "Simon Sapin <simon.sapin@exyr.org>" ];
    sha256 = "03hl636fg6xggy0a26200xs74amk3k9n0908rga2szn68agyz3cv";
    libPath = "lib.rs";
  };
  features_.matches."0.1.8" = deps: f: updateFeatures f (rec {
    matches."0.1.8".default = (f.matches."0.1.8".default or true);
  }) [];


# end
# memchr-2.2.0

  crates.memchr."2.2.0" = deps: { features?(features_.memchr."2.2.0" deps {}) }: buildRustCrate {
    crateName = "memchr";
    version = "2.2.0";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" "bluss" ];
    sha256 = "11vwg8iig9jyjxq3n1cq15g29ikzw5l7ar87md54k1aisjs0997p";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."memchr"."2.2.0" or {});
  };
  features_.memchr."2.2.0" = deps: f: updateFeatures f (rec {
    memchr = fold recursiveUpdate {} [
      { "2.2.0".default = (f.memchr."2.2.0".default or true); }
      { "2.2.0".use_std =
        (f.memchr."2.2.0".use_std or false) ||
        (f.memchr."2.2.0".default or false) ||
        (memchr."2.2.0"."default" or false); }
    ];
  }) [];


# end
# mime-0.2.6

  crates.mime."0.2.6" = deps: { features?(features_.mime."0.2.6" deps {}) }: buildRustCrate {
    crateName = "mime";
    version = "0.2.6";
    authors = [ "Sean McArthur <sean.monstar@gmail.com>" ];
    sha256 = "1skwwa0j3kqd8rm9387zgabjhp07zj99q71nzlhba4lrz9r911b3";
    dependencies = mapFeatures features ([
      (crates."log"."${deps."mime"."0.2.6"."log"}" deps)
    ]);
    features = mkFeatures (features."mime"."0.2.6" or {});
  };
  features_.mime."0.2.6" = deps: f: updateFeatures f (rec {
    log."${deps.mime."0.2.6".log}".default = true;
    mime = fold recursiveUpdate {} [
      { "0.2.6".default = (f.mime."0.2.6".default or true); }
      { "0.2.6".heapsize =
        (f.mime."0.2.6".heapsize or false) ||
        (f.mime."0.2.6".heap_size or false) ||
        (mime."0.2.6"."heap_size" or false); }
    ];
  }) [
    (features_.log."${deps."mime"."0.2.6"."log"}" deps)
  ];


# end
# mio-0.6.16

  crates.mio."0.6.16" = deps: { features?(features_.mio."0.6.16" deps {}) }: buildRustCrate {
    crateName = "mio";
    version = "0.6.16";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "14vyrlmf0w984pi7ad9qvmlfj6vrb0wn6i8ik9j87w5za2r3rban";
    dependencies = mapFeatures features ([
      (crates."iovec"."${deps."mio"."0.6.16"."iovec"}" deps)
      (crates."lazycell"."${deps."mio"."0.6.16"."lazycell"}" deps)
      (crates."log"."${deps."mio"."0.6.16"."log"}" deps)
      (crates."net2"."${deps."mio"."0.6.16"."net2"}" deps)
      (crates."slab"."${deps."mio"."0.6.16"."slab"}" deps)
    ])
      ++ (if kernel == "fuchsia" then mapFeatures features ([
      (crates."fuchsia_zircon"."${deps."mio"."0.6.16"."fuchsia_zircon"}" deps)
      (crates."fuchsia_zircon_sys"."${deps."mio"."0.6.16"."fuchsia_zircon_sys"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."mio"."0.6.16"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."kernel32_sys"."${deps."mio"."0.6.16"."kernel32_sys"}" deps)
      (crates."miow"."${deps."mio"."0.6.16"."miow"}" deps)
      (crates."winapi"."${deps."mio"."0.6.16"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."mio"."0.6.16" or {});
  };
  features_.mio."0.6.16" = deps: f: updateFeatures f (rec {
    fuchsia_zircon."${deps.mio."0.6.16".fuchsia_zircon}".default = true;
    fuchsia_zircon_sys."${deps.mio."0.6.16".fuchsia_zircon_sys}".default = true;
    iovec."${deps.mio."0.6.16".iovec}".default = true;
    kernel32_sys."${deps.mio."0.6.16".kernel32_sys}".default = true;
    lazycell."${deps.mio."0.6.16".lazycell}".default = true;
    libc."${deps.mio."0.6.16".libc}".default = true;
    log."${deps.mio."0.6.16".log}".default = true;
    mio = fold recursiveUpdate {} [
      { "0.6.16".default = (f.mio."0.6.16".default or true); }
      { "0.6.16".with-deprecated =
        (f.mio."0.6.16".with-deprecated or false) ||
        (f.mio."0.6.16".default or false) ||
        (mio."0.6.16"."default" or false); }
    ];
    miow."${deps.mio."0.6.16".miow}".default = true;
    net2."${deps.mio."0.6.16".net2}".default = true;
    slab."${deps.mio."0.6.16".slab}".default = true;
    winapi."${deps.mio."0.6.16".winapi}".default = true;
  }) [
    (features_.iovec."${deps."mio"."0.6.16"."iovec"}" deps)
    (features_.lazycell."${deps."mio"."0.6.16"."lazycell"}" deps)
    (features_.log."${deps."mio"."0.6.16"."log"}" deps)
    (features_.net2."${deps."mio"."0.6.16"."net2"}" deps)
    (features_.slab."${deps."mio"."0.6.16"."slab"}" deps)
    (features_.fuchsia_zircon."${deps."mio"."0.6.16"."fuchsia_zircon"}" deps)
    (features_.fuchsia_zircon_sys."${deps."mio"."0.6.16"."fuchsia_zircon_sys"}" deps)
    (features_.libc."${deps."mio"."0.6.16"."libc"}" deps)
    (features_.kernel32_sys."${deps."mio"."0.6.16"."kernel32_sys"}" deps)
    (features_.miow."${deps."mio"."0.6.16"."miow"}" deps)
    (features_.winapi."${deps."mio"."0.6.16"."winapi"}" deps)
  ];


# end
# mio-extras-2.0.5

  crates.mio_extras."2.0.5" = deps: { features?(features_.mio_extras."2.0.5" deps {}) }: buildRustCrate {
    crateName = "mio-extras";
    version = "2.0.5";
    authors = [ "Carl Lerche <me@carllerche.com>" "David Hotham" ];
    sha256 = "0h3f488fbqgiigs4zhff75db6afj8hndf7dfw7gw22fg286hfhwq";
    dependencies = mapFeatures features ([
      (crates."lazycell"."${deps."mio_extras"."2.0.5"."lazycell"}" deps)
      (crates."log"."${deps."mio_extras"."2.0.5"."log"}" deps)
      (crates."mio"."${deps."mio_extras"."2.0.5"."mio"}" deps)
      (crates."slab"."${deps."mio_extras"."2.0.5"."slab"}" deps)
    ]);
  };
  features_.mio_extras."2.0.5" = deps: f: updateFeatures f (rec {
    lazycell."${deps.mio_extras."2.0.5".lazycell}".default = true;
    log."${deps.mio_extras."2.0.5".log}".default = true;
    mio."${deps.mio_extras."2.0.5".mio}".default = true;
    mio_extras."2.0.5".default = (f.mio_extras."2.0.5".default or true);
    slab."${deps.mio_extras."2.0.5".slab}".default = true;
  }) [
    (features_.lazycell."${deps."mio_extras"."2.0.5"."lazycell"}" deps)
    (features_.log."${deps."mio_extras"."2.0.5"."log"}" deps)
    (features_.mio."${deps."mio_extras"."2.0.5"."mio"}" deps)
    (features_.slab."${deps."mio_extras"."2.0.5"."slab"}" deps)
  ];


# end
# miow-0.2.1

  crates.miow."0.2.1" = deps: { features?(features_.miow."0.2.1" deps {}) }: buildRustCrate {
    crateName = "miow";
    version = "0.2.1";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "14f8zkc6ix7mkyis1vsqnim8m29b6l55abkba3p2yz7j1ibcvrl0";
    dependencies = mapFeatures features ([
      (crates."kernel32_sys"."${deps."miow"."0.2.1"."kernel32_sys"}" deps)
      (crates."net2"."${deps."miow"."0.2.1"."net2"}" deps)
      (crates."winapi"."${deps."miow"."0.2.1"."winapi"}" deps)
      (crates."ws2_32_sys"."${deps."miow"."0.2.1"."ws2_32_sys"}" deps)
    ]);
  };
  features_.miow."0.2.1" = deps: f: updateFeatures f (rec {
    kernel32_sys."${deps.miow."0.2.1".kernel32_sys}".default = true;
    miow."0.2.1".default = (f.miow."0.2.1".default or true);
    net2."${deps.miow."0.2.1".net2}".default = (f.net2."${deps.miow."0.2.1".net2}".default or false);
    winapi."${deps.miow."0.2.1".winapi}".default = true;
    ws2_32_sys."${deps.miow."0.2.1".ws2_32_sys}".default = true;
  }) [
    (features_.kernel32_sys."${deps."miow"."0.2.1"."kernel32_sys"}" deps)
    (features_.net2."${deps."miow"."0.2.1"."net2"}" deps)
    (features_.winapi."${deps."miow"."0.2.1"."winapi"}" deps)
    (features_.ws2_32_sys."${deps."miow"."0.2.1"."ws2_32_sys"}" deps)
  ];


# end
# net2-0.2.33

  crates.net2."0.2.33" = deps: { features?(features_.net2."0.2.33" deps {}) }: buildRustCrate {
    crateName = "net2";
    version = "0.2.33";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1qnmajafgybj5wyxz9iffa8x5wgbwd2znfklmhqj7vl6lw1m65mq";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."net2"."0.2.33"."cfg_if"}" deps)
    ])
      ++ (if kernel == "redox" || (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."net2"."0.2.33"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."net2"."0.2.33"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."net2"."0.2.33" or {});
  };
  features_.net2."0.2.33" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.net2."0.2.33".cfg_if}".default = true;
    libc."${deps.net2."0.2.33".libc}".default = true;
    net2 = fold recursiveUpdate {} [
      { "0.2.33".default = (f.net2."0.2.33".default or true); }
      { "0.2.33".duration =
        (f.net2."0.2.33".duration or false) ||
        (f.net2."0.2.33".default or false) ||
        (net2."0.2.33"."default" or false); }
    ];
    winapi = fold recursiveUpdate {} [
      { "${deps.net2."0.2.33".winapi}"."handleapi" = true; }
      { "${deps.net2."0.2.33".winapi}"."winsock2" = true; }
      { "${deps.net2."0.2.33".winapi}"."ws2def" = true; }
      { "${deps.net2."0.2.33".winapi}"."ws2ipdef" = true; }
      { "${deps.net2."0.2.33".winapi}"."ws2tcpip" = true; }
      { "${deps.net2."0.2.33".winapi}".default = true; }
    ];
  }) [
    (features_.cfg_if."${deps."net2"."0.2.33"."cfg_if"}" deps)
    (features_.libc."${deps."net2"."0.2.33"."libc"}" deps)
    (features_.winapi."${deps."net2"."0.2.33"."winapi"}" deps)
  ];


# end
# notify-4.0.10

  crates.notify."4.0.10" = deps: { features?(features_.notify."4.0.10" deps {}) }: buildRustCrate {
    crateName = "notify";
    version = "4.0.10";
    authors = [ "Félix Saparelli <me@passcod.name>" "Jorge Israel Peña <jorge.israel.p@gmail.com>" "Michael Maurizi <michael.maurizi@gmail.com>" "Pierre Baillet <oct@zoy.org>" "Joe Wilm <joe@jwilm.com>" "Daniel Faust <hessijames@gmail.com>" ];
    sha256 = "0vaaxcfhjnf2jkax20vi7fj0swqwq1rxpln2rgdnf085zs2498ci";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."notify"."4.0.10"."bitflags"}" deps)
      (crates."filetime"."${deps."notify"."4.0.10"."filetime"}" deps)
      (crates."libc"."${deps."notify"."4.0.10"."libc"}" deps)
      (crates."walkdir"."${deps."notify"."4.0.10"."walkdir"}" deps)
    ])
      ++ (if kernel == "linux" then mapFeatures features ([
      (crates."inotify"."${deps."notify"."4.0.10"."inotify"}" deps)
      (crates."mio"."${deps."notify"."4.0.10"."mio"}" deps)
      (crates."mio_extras"."${deps."notify"."4.0.10"."mio_extras"}" deps)
    ]) else [])
      ++ (if kernel == "darwin" then mapFeatures features ([
      (crates."fsevent"."${deps."notify"."4.0.10"."fsevent"}" deps)
      (crates."fsevent_sys"."${deps."notify"."4.0.10"."fsevent_sys"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."kernel32_sys"."${deps."notify"."4.0.10"."kernel32_sys"}" deps)
      (crates."winapi"."${deps."notify"."4.0.10"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."notify"."4.0.10" or {});
  };
  features_.notify."4.0.10" = deps: f: updateFeatures f (rec {
    bitflags."${deps.notify."4.0.10".bitflags}".default = true;
    filetime."${deps.notify."4.0.10".filetime}".default = true;
    fsevent."${deps.notify."4.0.10".fsevent}".default = true;
    fsevent_sys."${deps.notify."4.0.10".fsevent_sys}".default = true;
    inotify."${deps.notify."4.0.10".inotify}".default = (f.inotify."${deps.notify."4.0.10".inotify}".default or false);
    kernel32_sys."${deps.notify."4.0.10".kernel32_sys}".default = true;
    libc."${deps.notify."4.0.10".libc}".default = true;
    mio."${deps.notify."4.0.10".mio}".default = true;
    mio_extras."${deps.notify."4.0.10".mio_extras}".default = true;
    notify."4.0.10".default = (f.notify."4.0.10".default or true);
    walkdir."${deps.notify."4.0.10".walkdir}".default = true;
    winapi."${deps.notify."4.0.10".winapi}".default = true;
  }) [
    (features_.bitflags."${deps."notify"."4.0.10"."bitflags"}" deps)
    (features_.filetime."${deps."notify"."4.0.10"."filetime"}" deps)
    (features_.libc."${deps."notify"."4.0.10"."libc"}" deps)
    (features_.walkdir."${deps."notify"."4.0.10"."walkdir"}" deps)
    (features_.inotify."${deps."notify"."4.0.10"."inotify"}" deps)
    (features_.mio."${deps."notify"."4.0.10"."mio"}" deps)
    (features_.mio_extras."${deps."notify"."4.0.10"."mio_extras"}" deps)
    (features_.fsevent."${deps."notify"."4.0.10"."fsevent"}" deps)
    (features_.fsevent_sys."${deps."notify"."4.0.10"."fsevent_sys"}" deps)
    (features_.kernel32_sys."${deps."notify"."4.0.10"."kernel32_sys"}" deps)
    (features_.winapi."${deps."notify"."4.0.10"."winapi"}" deps)
  ];


# end
# num_cpus-1.10.0

  crates.num_cpus."1.10.0" = deps: { features?(features_.num_cpus."1.10.0" deps {}) }: buildRustCrate {
    crateName = "num_cpus";
    version = "1.10.0";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "1411jyxy1wd8d59mv7cf6ynkvvar92czmwhb9l2c1brdkxbbiqn7";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."num_cpus"."1.10.0"."libc"}" deps)
    ]);
  };
  features_.num_cpus."1.10.0" = deps: f: updateFeatures f (rec {
    libc."${deps.num_cpus."1.10.0".libc}".default = true;
    num_cpus."1.10.0".default = (f.num_cpus."1.10.0".default or true);
  }) [
    (features_.libc."${deps."num_cpus"."1.10.0"."libc"}" deps)
  ];


# end
# openssl-probe-0.1.2

  crates.openssl_probe."0.1.2" = deps: { features?(features_.openssl_probe."0.1.2" deps {}) }: buildRustCrate {
    crateName = "openssl-probe";
    version = "0.1.2";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1a89fznx26vvaxyrxdvgf6iwai5xvs6xjvpjin68fgvrslv6n15a";
  };
  features_.openssl_probe."0.1.2" = deps: f: updateFeatures f (rec {
    openssl_probe."0.1.2".default = (f.openssl_probe."0.1.2".default or true);
  }) [];


# end
# openssl-sys-0.9.42

  crates.openssl_sys."0.9.42" = deps: { features?(features_.openssl_sys."0.9.42" deps {}) }: buildRustCrate {
    crateName = "openssl-sys";
    version = "0.9.42";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "1s2bkfkpqfyis5b0q5piki64r7dywqpk49g6b6dsgzmbnzyhn78v";
    build = "build/main.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."openssl_sys"."0.9.42"."libc"}" deps)
    ])
      ++ (if abi == "msvc" then mapFeatures features ([
]) else []);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."openssl_sys"."0.9.42"."cc"}" deps)
      (crates."pkg_config"."${deps."openssl_sys"."0.9.42"."pkg_config"}" deps)
      (crates."rustc_version"."${deps."openssl_sys"."0.9.42"."rustc_version"}" deps)
    ]);
    features = mkFeatures (features."openssl_sys"."0.9.42" or {});
  };
  features_.openssl_sys."0.9.42" = deps: f: updateFeatures f (rec {
    cc."${deps.openssl_sys."0.9.42".cc}".default = true;
    libc."${deps.openssl_sys."0.9.42".libc}".default = true;
    openssl_sys = fold recursiveUpdate {} [
      { "0.9.42".default = (f.openssl_sys."0.9.42".default or true); }
      { "0.9.42".openssl-src =
        (f.openssl_sys."0.9.42".openssl-src or false) ||
        (f.openssl_sys."0.9.42".vendored or false) ||
        (openssl_sys."0.9.42"."vendored" or false); }
    ];
    pkg_config."${deps.openssl_sys."0.9.42".pkg_config}".default = true;
    rustc_version."${deps.openssl_sys."0.9.42".rustc_version}".default = true;
  }) [
    (features_.libc."${deps."openssl_sys"."0.9.42"."libc"}" deps)
    (features_.cc."${deps."openssl_sys"."0.9.42"."cc"}" deps)
    (features_.pkg_config."${deps."openssl_sys"."0.9.42"."pkg_config"}" deps)
    (features_.rustc_version."${deps."openssl_sys"."0.9.42"."rustc_version"}" deps)
  ];


# end
# pear-0.1.2

  crates.pear."0.1.2" = deps: { features?(features_.pear."0.1.2" deps {}) }: buildRustCrate {
    crateName = "pear";
    version = "0.1.2";
    authors = [ "Sergio Benitez <sb@sergio.bz>" ];
    sha256 = "1r84y8r2fwdzj3iff1w6irw0a5lbk2ndjcs1h1n9l8gs7aszdk04";
    dependencies = mapFeatures features ([
      (crates."pear_codegen"."${deps."pear"."0.1.2"."pear_codegen"}" deps)
    ]);
  };
  features_.pear."0.1.2" = deps: f: updateFeatures f (rec {
    pear."0.1.2".default = (f.pear."0.1.2".default or true);
    pear_codegen."${deps.pear."0.1.2".pear_codegen}".default = true;
  }) [
    (features_.pear_codegen."${deps."pear"."0.1.2"."pear_codegen"}" deps)
  ];


# end
# pear_codegen-0.1.2

  crates.pear_codegen."0.1.2" = deps: { features?(features_.pear_codegen."0.1.2" deps {}) }: buildRustCrate {
    crateName = "pear_codegen";
    version = "0.1.2";
    authors = [ "Sergio Benitez <sb@sergio.bz>" ];
    sha256 = "0asd1j1aj9vcmsrwj7kljmcicwrwxbrvn6xvmdck9b063m5cqhlz";
    procMacro = true;
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."pear_codegen"."0.1.2"."proc_macro2"}" deps)
      (crates."quote"."${deps."pear_codegen"."0.1.2"."quote"}" deps)
      (crates."syn"."${deps."pear_codegen"."0.1.2"."syn"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."version_check"."${deps."pear_codegen"."0.1.2"."version_check"}" deps)
      (crates."yansi"."${deps."pear_codegen"."0.1.2"."yansi"}" deps)
    ]);
  };
  features_.pear_codegen."0.1.2" = deps: f: updateFeatures f (rec {
    pear_codegen."0.1.2".default = (f.pear_codegen."0.1.2".default or true);
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.pear_codegen."0.1.2".proc_macro2}"."nightly" = true; }
      { "${deps.pear_codegen."0.1.2".proc_macro2}".default = true; }
    ];
    quote."${deps.pear_codegen."0.1.2".quote}".default = true;
    syn = fold recursiveUpdate {} [
      { "${deps.pear_codegen."0.1.2".syn}"."extra-traits" = true; }
      { "${deps.pear_codegen."0.1.2".syn}"."full" = true; }
      { "${deps.pear_codegen."0.1.2".syn}"."visit-mut" = true; }
      { "${deps.pear_codegen."0.1.2".syn}".default = true; }
    ];
    version_check."${deps.pear_codegen."0.1.2".version_check}".default = true;
    yansi."${deps.pear_codegen."0.1.2".yansi}".default = true;
  }) [
    (features_.proc_macro2."${deps."pear_codegen"."0.1.2"."proc_macro2"}" deps)
    (features_.quote."${deps."pear_codegen"."0.1.2"."quote"}" deps)
    (features_.syn."${deps."pear_codegen"."0.1.2"."syn"}" deps)
    (features_.version_check."${deps."pear_codegen"."0.1.2"."version_check"}" deps)
    (features_.yansi."${deps."pear_codegen"."0.1.2"."yansi"}" deps)
  ];


# end
# percent-encoding-1.0.1

  crates.percent_encoding."1.0.1" = deps: { features?(features_.percent_encoding."1.0.1" deps {}) }: buildRustCrate {
    crateName = "percent-encoding";
    version = "1.0.1";
    authors = [ "The rust-url developers" ];
    sha256 = "04ahrp7aw4ip7fmadb0bknybmkfav0kk0gw4ps3ydq5w6hr0ib5i";
    libPath = "lib.rs";
  };
  features_.percent_encoding."1.0.1" = deps: f: updateFeatures f (rec {
    percent_encoding."1.0.1".default = (f.percent_encoding."1.0.1".default or true);
  }) [];


# end
# pkg-config-0.3.14

  crates.pkg_config."0.3.14" = deps: { features?(features_.pkg_config."0.3.14" deps {}) }: buildRustCrate {
    crateName = "pkg-config";
    version = "0.3.14";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0207fsarrm412j0dh87lfcas72n8mxar7q3mgflsbsrqnb140sv6";
  };
  features_.pkg_config."0.3.14" = deps: f: updateFeatures f (rec {
    pkg_config."0.3.14".default = (f.pkg_config."0.3.14".default or true);
  }) [];


# end
# proc-macro2-0.4.27

  crates.proc_macro2."0.4.27" = deps: { features?(features_.proc_macro2."0.4.27" deps {}) }: buildRustCrate {
    crateName = "proc-macro2";
    version = "0.4.27";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1cp4c40p3hwn2sz72ssqa62gp5n8w4gbamdqvvadzp5l7gxnq95i";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."unicode_xid"."${deps."proc_macro2"."0.4.27"."unicode_xid"}" deps)
    ]);
    features = mkFeatures (features."proc_macro2"."0.4.27" or {});
  };
  features_.proc_macro2."0.4.27" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "0.4.27".default = (f.proc_macro2."0.4.27".default or true); }
      { "0.4.27".proc-macro =
        (f.proc_macro2."0.4.27".proc-macro or false) ||
        (f.proc_macro2."0.4.27".default or false) ||
        (proc_macro2."0.4.27"."default" or false); }
    ];
    unicode_xid."${deps.proc_macro2."0.4.27".unicode_xid}".default = true;
  }) [
    (features_.unicode_xid."${deps."proc_macro2"."0.4.27"."unicode_xid"}" deps)
  ];


# end
# quote-0.6.11

  crates.quote."0.6.11" = deps: { features?(features_.quote."0.6.11" deps {}) }: buildRustCrate {
    crateName = "quote";
    version = "0.6.11";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "0agska77z58cypcq4knayzwx7r7n6m756z1cz9cp2z4sv0b846ga";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."quote"."0.6.11"."proc_macro2"}" deps)
    ]);
    features = mkFeatures (features."quote"."0.6.11" or {});
  };
  features_.quote."0.6.11" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.quote."0.6.11".proc_macro2}"."proc-macro" =
        (f.proc_macro2."${deps.quote."0.6.11".proc_macro2}"."proc-macro" or false) ||
        (quote."0.6.11"."proc-macro" or false) ||
        (f."quote"."0.6.11"."proc-macro" or false); }
      { "${deps.quote."0.6.11".proc_macro2}".default = (f.proc_macro2."${deps.quote."0.6.11".proc_macro2}".default or false); }
    ];
    quote = fold recursiveUpdate {} [
      { "0.6.11".default = (f.quote."0.6.11".default or true); }
      { "0.6.11".proc-macro =
        (f.quote."0.6.11".proc-macro or false) ||
        (f.quote."0.6.11".default or false) ||
        (quote."0.6.11"."default" or false); }
    ];
  }) [
    (features_.proc_macro2."${deps."quote"."0.6.11"."proc_macro2"}" deps)
  ];


# end
# redox_syscall-0.1.51

  crates.redox_syscall."0.1.51" = deps: { features?(features_.redox_syscall."0.1.51" deps {}) }: buildRustCrate {
    crateName = "redox_syscall";
    version = "0.1.51";
    authors = [ "Jeremy Soller <jackpot51@gmail.com>" ];
    sha256 = "1a61cv7yydx64vpyvzr0z0hwzdvy4gcvcnfc6k70zpkngj5sz3ip";
    libName = "syscall";
  };
  features_.redox_syscall."0.1.51" = deps: f: updateFeatures f (rec {
    redox_syscall."0.1.51".default = (f.redox_syscall."0.1.51".default or true);
  }) [];


# end
# regex-1.1.2

  crates.regex."1.1.2" = deps: { features?(features_.regex."1.1.2" deps {}) }: buildRustCrate {
    crateName = "regex";
    version = "1.1.2";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1c9nb031z1vw5l6lzfkfra2mah9hb2s1wgq9f1lmgcbkiiprj9xd";
    dependencies = mapFeatures features ([
      (crates."aho_corasick"."${deps."regex"."1.1.2"."aho_corasick"}" deps)
      (crates."memchr"."${deps."regex"."1.1.2"."memchr"}" deps)
      (crates."regex_syntax"."${deps."regex"."1.1.2"."regex_syntax"}" deps)
      (crates."thread_local"."${deps."regex"."1.1.2"."thread_local"}" deps)
      (crates."utf8_ranges"."${deps."regex"."1.1.2"."utf8_ranges"}" deps)
    ]);
    features = mkFeatures (features."regex"."1.1.2" or {});
  };
  features_.regex."1.1.2" = deps: f: updateFeatures f (rec {
    aho_corasick."${deps.regex."1.1.2".aho_corasick}".default = true;
    memchr."${deps.regex."1.1.2".memchr}".default = true;
    regex = fold recursiveUpdate {} [
      { "1.1.2".default = (f.regex."1.1.2".default or true); }
      { "1.1.2".pattern =
        (f.regex."1.1.2".pattern or false) ||
        (f.regex."1.1.2".unstable or false) ||
        (regex."1.1.2"."unstable" or false); }
      { "1.1.2".use_std =
        (f.regex."1.1.2".use_std or false) ||
        (f.regex."1.1.2".default or false) ||
        (regex."1.1.2"."default" or false); }
    ];
    regex_syntax."${deps.regex."1.1.2".regex_syntax}".default = true;
    thread_local."${deps.regex."1.1.2".thread_local}".default = true;
    utf8_ranges."${deps.regex."1.1.2".utf8_ranges}".default = true;
  }) [
    (features_.aho_corasick."${deps."regex"."1.1.2"."aho_corasick"}" deps)
    (features_.memchr."${deps."regex"."1.1.2"."memchr"}" deps)
    (features_.regex_syntax."${deps."regex"."1.1.2"."regex_syntax"}" deps)
    (features_.thread_local."${deps."regex"."1.1.2"."thread_local"}" deps)
    (features_.utf8_ranges."${deps."regex"."1.1.2"."utf8_ranges"}" deps)
  ];


# end
# regex-syntax-0.6.5

  crates.regex_syntax."0.6.5" = deps: { features?(features_.regex_syntax."0.6.5" deps {}) }: buildRustCrate {
    crateName = "regex-syntax";
    version = "0.6.5";
    authors = [ "The Rust Project Developers" ];
    sha256 = "0aaaba1fan2qfyc31wzdmgmbmyirc27zgcbz41ba5wm1lb2d8kli";
    dependencies = mapFeatures features ([
      (crates."ucd_util"."${deps."regex_syntax"."0.6.5"."ucd_util"}" deps)
    ]);
  };
  features_.regex_syntax."0.6.5" = deps: f: updateFeatures f (rec {
    regex_syntax."0.6.5".default = (f.regex_syntax."0.6.5".default or true);
    ucd_util."${deps.regex_syntax."0.6.5".ucd_util}".default = true;
  }) [
    (features_.ucd_util."${deps."regex_syntax"."0.6.5"."ucd_util"}" deps)
  ];


# end
# ring-0.13.5

  crates.ring."0.13.5" = deps: { features?(features_.ring."0.13.5" deps {}) }: buildRustCrate {
    crateName = "ring";
    version = "0.13.5";
    authors = [ "Brian Smith <brian@briansmith.org>" ];
    sha256 = "0b071zwzwhgmj0xyr7wqc55f4nppgjikfh53nb9m799l096s86j4";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."untrusted"."${deps."ring"."0.13.5"."untrusted"}" deps)
    ])
      ++ (if kernel == "redox" || (kernel == "linux" || kernel == "darwin") && !(kernel == "darwin" || kernel == "ios") then mapFeatures features ([
      (crates."lazy_static"."${deps."ring"."0.13.5"."lazy_static"}" deps)
    ]) else [])
      ++ (if kernel == "linux" then mapFeatures features ([
      (crates."libc"."${deps."ring"."0.13.5"."libc"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."ring"."0.13.5"."cc"}" deps)
    ]);
    features = mkFeatures (features."ring"."0.13.5" or {});
  };
  features_.ring."0.13.5" = deps: f: updateFeatures f (rec {
    cc."${deps.ring."0.13.5".cc}".default = true;
    lazy_static."${deps.ring."0.13.5".lazy_static}".default = true;
    libc."${deps.ring."0.13.5".libc}".default = true;
    ring = fold recursiveUpdate {} [
      { "0.13.5".default = (f.ring."0.13.5".default or true); }
      { "0.13.5".dev_urandom_fallback =
        (f.ring."0.13.5".dev_urandom_fallback or false) ||
        (f.ring."0.13.5".default or false) ||
        (ring."0.13.5"."default" or false); }
      { "0.13.5".use_heap =
        (f.ring."0.13.5".use_heap or false) ||
        (f.ring."0.13.5".default or false) ||
        (ring."0.13.5"."default" or false) ||
        (f.ring."0.13.5".rsa_signing or false) ||
        (ring."0.13.5"."rsa_signing" or false); }
    ];
    untrusted."${deps.ring."0.13.5".untrusted}".default = true;
  }) [
    (features_.untrusted."${deps."ring"."0.13.5"."untrusted"}" deps)
    (features_.cc."${deps."ring"."0.13.5"."cc"}" deps)
    (features_.lazy_static."${deps."ring"."0.13.5"."lazy_static"}" deps)
    (features_.libc."${deps."ring"."0.13.5"."libc"}" deps)
  ];


# end
# rocket-0.4.0

  crates.rocket."0.4.0" = deps: { features?(features_.rocket."0.4.0" deps {}) }: buildRustCrate {
    crateName = "rocket";
    version = "0.4.0";
    authors = [ "Sergio Benitez <sb@sergio.bz>" ];
    sha256 = "1sh3rvzsr9jzxrwrbrvj690gn7z1ri8h028p432fzb13pzn4qdlr";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."base64"."${deps."rocket"."0.4.0"."base64"}" deps)
      (crates."isatty"."${deps."rocket"."0.4.0"."isatty"}" deps)
      (crates."log"."${deps."rocket"."0.4.0"."log"}" deps)
      (crates."memchr"."${deps."rocket"."0.4.0"."memchr"}" deps)
      (crates."num_cpus"."${deps."rocket"."0.4.0"."num_cpus"}" deps)
      (crates."pear"."${deps."rocket"."0.4.0"."pear"}" deps)
      (crates."rocket_codegen"."${deps."rocket"."0.4.0"."rocket_codegen"}" deps)
      (crates."rocket_http"."${deps."rocket"."0.4.0"."rocket_http"}" deps)
      (crates."state"."${deps."rocket"."0.4.0"."state"}" deps)
      (crates."time"."${deps."rocket"."0.4.0"."time"}" deps)
      (crates."toml"."${deps."rocket"."0.4.0"."toml"}" deps)
      (crates."yansi"."${deps."rocket"."0.4.0"."yansi"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."version_check"."${deps."rocket"."0.4.0"."version_check"}" deps)
      (crates."yansi"."${deps."rocket"."0.4.0"."yansi"}" deps)
    ]);
    features = mkFeatures (features."rocket"."0.4.0" or {});
  };
  features_.rocket."0.4.0" = deps: f: updateFeatures f (rec {
    base64."${deps.rocket."0.4.0".base64}".default = true;
    isatty."${deps.rocket."0.4.0".isatty}".default = true;
    log."${deps.rocket."0.4.0".log}".default = true;
    memchr."${deps.rocket."0.4.0".memchr}".default = true;
    num_cpus."${deps.rocket."0.4.0".num_cpus}".default = true;
    pear."${deps.rocket."0.4.0".pear}".default = true;
    rocket = fold recursiveUpdate {} [
      { "0.4.0".default = (f.rocket."0.4.0".default or true); }
      { "0.4.0".private-cookies =
        (f.rocket."0.4.0".private-cookies or false) ||
        (f.rocket."0.4.0".default or false) ||
        (rocket."0.4.0"."default" or false); }
    ];
    rocket_codegen."${deps.rocket."0.4.0".rocket_codegen}".default = true;
    rocket_http = fold recursiveUpdate {} [
      { "${deps.rocket."0.4.0".rocket_http}"."private-cookies" =
        (f.rocket_http."${deps.rocket."0.4.0".rocket_http}"."private-cookies" or false) ||
        (rocket."0.4.0"."private-cookies" or false) ||
        (f."rocket"."0.4.0"."private-cookies" or false); }
      { "${deps.rocket."0.4.0".rocket_http}"."tls" =
        (f.rocket_http."${deps.rocket."0.4.0".rocket_http}"."tls" or false) ||
        (rocket."0.4.0"."tls" or false) ||
        (f."rocket"."0.4.0"."tls" or false); }
      { "${deps.rocket."0.4.0".rocket_http}".default = true; }
    ];
    state."${deps.rocket."0.4.0".state}".default = true;
    time."${deps.rocket."0.4.0".time}".default = true;
    toml."${deps.rocket."0.4.0".toml}".default = true;
    version_check."${deps.rocket."0.4.0".version_check}".default = true;
    yansi."${deps.rocket."0.4.0".yansi}".default = true;
  }) [
    (features_.base64."${deps."rocket"."0.4.0"."base64"}" deps)
    (features_.isatty."${deps."rocket"."0.4.0"."isatty"}" deps)
    (features_.log."${deps."rocket"."0.4.0"."log"}" deps)
    (features_.memchr."${deps."rocket"."0.4.0"."memchr"}" deps)
    (features_.num_cpus."${deps."rocket"."0.4.0"."num_cpus"}" deps)
    (features_.pear."${deps."rocket"."0.4.0"."pear"}" deps)
    (features_.rocket_codegen."${deps."rocket"."0.4.0"."rocket_codegen"}" deps)
    (features_.rocket_http."${deps."rocket"."0.4.0"."rocket_http"}" deps)
    (features_.state."${deps."rocket"."0.4.0"."state"}" deps)
    (features_.time."${deps."rocket"."0.4.0"."time"}" deps)
    (features_.toml."${deps."rocket"."0.4.0"."toml"}" deps)
    (features_.yansi."${deps."rocket"."0.4.0"."yansi"}" deps)
    (features_.version_check."${deps."rocket"."0.4.0"."version_check"}" deps)
    (features_.yansi."${deps."rocket"."0.4.0"."yansi"}" deps)
  ];


# end
# rocket_codegen-0.4.0

  crates.rocket_codegen."0.4.0" = deps: { features?(features_.rocket_codegen."0.4.0" deps {}) }: buildRustCrate {
    crateName = "rocket_codegen";
    version = "0.4.0";
    authors = [ "Sergio Benitez <sb@sergio.bz>" ];
    sha256 = "1xix9phpl0dmk6r07skh29i1ws83npx84mrjna5wvcqp580n52rk";
    procMacro = true;
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."devise"."${deps."rocket_codegen"."0.4.0"."devise"}" deps)
      (crates."indexmap"."${deps."rocket_codegen"."0.4.0"."indexmap"}" deps)
      (crates."quote"."${deps."rocket_codegen"."0.4.0"."quote"}" deps)
      (crates."rocket_http"."${deps."rocket_codegen"."0.4.0"."rocket_http"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."version_check"."${deps."rocket_codegen"."0.4.0"."version_check"}" deps)
      (crates."yansi"."${deps."rocket_codegen"."0.4.0"."yansi"}" deps)
    ]);
  };
  features_.rocket_codegen."0.4.0" = deps: f: updateFeatures f (rec {
    devise."${deps.rocket_codegen."0.4.0".devise}".default = true;
    indexmap."${deps.rocket_codegen."0.4.0".indexmap}".default = true;
    quote."${deps.rocket_codegen."0.4.0".quote}".default = true;
    rocket_codegen."0.4.0".default = (f.rocket_codegen."0.4.0".default or true);
    rocket_http."${deps.rocket_codegen."0.4.0".rocket_http}".default = true;
    version_check."${deps.rocket_codegen."0.4.0".version_check}".default = true;
    yansi."${deps.rocket_codegen."0.4.0".yansi}".default = true;
  }) [
    (features_.devise."${deps."rocket_codegen"."0.4.0"."devise"}" deps)
    (features_.indexmap."${deps."rocket_codegen"."0.4.0"."indexmap"}" deps)
    (features_.quote."${deps."rocket_codegen"."0.4.0"."quote"}" deps)
    (features_.rocket_http."${deps."rocket_codegen"."0.4.0"."rocket_http"}" deps)
    (features_.version_check."${deps."rocket_codegen"."0.4.0"."version_check"}" deps)
    (features_.yansi."${deps."rocket_codegen"."0.4.0"."yansi"}" deps)
  ];


# end
# rocket_contrib-0.4.0

  crates.rocket_contrib."0.4.0" = deps: { features?(features_.rocket_contrib."0.4.0" deps {}) }: buildRustCrate {
    crateName = "rocket_contrib";
    version = "0.4.0";
    authors = [ "Sergio Benitez <sb@sergio.bz>" ];
    sha256 = "0fs09fmyl5p1r1ws4vy64rxldgjlpjfy830hcgpnq0xs10ps4mpi";
    dependencies = mapFeatures features ([
      (crates."log"."${deps."rocket_contrib"."0.4.0"."log"}" deps)
      (crates."rocket"."${deps."rocket_contrib"."0.4.0"."rocket"}" deps)
    ]
      ++ (if features.rocket_contrib."0.4.0".serde or false then [ (crates.serde."${deps."rocket_contrib"."0.4.0".serde}" deps) ] else [])
      ++ (if features.rocket_contrib."0.4.0".serde_json or false then [ (crates.serde_json."${deps."rocket_contrib"."0.4.0".serde_json}" deps) ] else []))
      ++ (if kernel == "debug_assertions" then mapFeatures features ([
      (crates."notify"."${deps."rocket_contrib"."0.4.0"."notify"}" deps)
    ]) else []);
    features = mkFeatures (features."rocket_contrib"."0.4.0" or {});
  };
  features_.rocket_contrib."0.4.0" = deps: f: updateFeatures f (rec {
    log."${deps.rocket_contrib."0.4.0".log}".default = true;
    notify."${deps.rocket_contrib."0.4.0".notify}".default = true;
    rocket."${deps.rocket_contrib."0.4.0".rocket}".default = true;
    rocket_contrib = fold recursiveUpdate {} [
      { "0.4.0".databases =
        (f.rocket_contrib."0.4.0".databases or false) ||
        (f.rocket_contrib."0.4.0".cypher_pool or false) ||
        (rocket_contrib."0.4.0"."cypher_pool" or false) ||
        (f.rocket_contrib."0.4.0".diesel_mysql_pool or false) ||
        (rocket_contrib."0.4.0"."diesel_mysql_pool" or false) ||
        (f.rocket_contrib."0.4.0".diesel_postgres_pool or false) ||
        (rocket_contrib."0.4.0"."diesel_postgres_pool" or false) ||
        (f.rocket_contrib."0.4.0".diesel_sqlite_pool or false) ||
        (rocket_contrib."0.4.0"."diesel_sqlite_pool" or false) ||
        (f.rocket_contrib."0.4.0".mongodb_pool or false) ||
        (rocket_contrib."0.4.0"."mongodb_pool" or false) ||
        (f.rocket_contrib."0.4.0".mysql_pool or false) ||
        (rocket_contrib."0.4.0"."mysql_pool" or false) ||
        (f.rocket_contrib."0.4.0".postgres_pool or false) ||
        (rocket_contrib."0.4.0"."postgres_pool" or false) ||
        (f.rocket_contrib."0.4.0".redis_pool or false) ||
        (rocket_contrib."0.4.0"."redis_pool" or false) ||
        (f.rocket_contrib."0.4.0".sqlite_pool or false) ||
        (rocket_contrib."0.4.0"."sqlite_pool" or false); }
      { "0.4.0".default = (f.rocket_contrib."0.4.0".default or true); }
      { "0.4.0".glob =
        (f.rocket_contrib."0.4.0".glob or false) ||
        (f.rocket_contrib."0.4.0".templates or false) ||
        (rocket_contrib."0.4.0"."templates" or false); }
      { "0.4.0".handlebars =
        (f.rocket_contrib."0.4.0".handlebars or false) ||
        (f.rocket_contrib."0.4.0".handlebars_templates or false) ||
        (rocket_contrib."0.4.0"."handlebars_templates" or false); }
      { "0.4.0".json =
        (f.rocket_contrib."0.4.0".json or false) ||
        (f.rocket_contrib."0.4.0".default or false) ||
        (rocket_contrib."0.4.0"."default" or false); }
      { "0.4.0".mongodb =
        (f.rocket_contrib."0.4.0".mongodb or false) ||
        (f.rocket_contrib."0.4.0".mongodb_pool or false) ||
        (rocket_contrib."0.4.0"."mongodb_pool" or false); }
      { "0.4.0".mysql =
        (f.rocket_contrib."0.4.0".mysql or false) ||
        (f.rocket_contrib."0.4.0".mysql_pool or false) ||
        (rocket_contrib."0.4.0"."mysql_pool" or false); }
      { "0.4.0".postgres =
        (f.rocket_contrib."0.4.0".postgres or false) ||
        (f.rocket_contrib."0.4.0".postgres_pool or false) ||
        (rocket_contrib."0.4.0"."postgres_pool" or false); }
      { "0.4.0".r2d2 =
        (f.rocket_contrib."0.4.0".r2d2 or false) ||
        (f.rocket_contrib."0.4.0".databases or false) ||
        (rocket_contrib."0.4.0"."databases" or false); }
      { "0.4.0".r2d2-mongodb =
        (f.rocket_contrib."0.4.0".r2d2-mongodb or false) ||
        (f.rocket_contrib."0.4.0".mongodb_pool or false) ||
        (rocket_contrib."0.4.0"."mongodb_pool" or false); }
      { "0.4.0".r2d2_cypher =
        (f.rocket_contrib."0.4.0".r2d2_cypher or false) ||
        (f.rocket_contrib."0.4.0".cypher_pool or false) ||
        (rocket_contrib."0.4.0"."cypher_pool" or false); }
      { "0.4.0".r2d2_mysql =
        (f.rocket_contrib."0.4.0".r2d2_mysql or false) ||
        (f.rocket_contrib."0.4.0".mysql_pool or false) ||
        (rocket_contrib."0.4.0"."mysql_pool" or false); }
      { "0.4.0".r2d2_postgres =
        (f.rocket_contrib."0.4.0".r2d2_postgres or false) ||
        (f.rocket_contrib."0.4.0".postgres_pool or false) ||
        (rocket_contrib."0.4.0"."postgres_pool" or false); }
      { "0.4.0".r2d2_redis =
        (f.rocket_contrib."0.4.0".r2d2_redis or false) ||
        (f.rocket_contrib."0.4.0".redis_pool or false) ||
        (rocket_contrib."0.4.0"."redis_pool" or false); }
      { "0.4.0".r2d2_sqlite =
        (f.rocket_contrib."0.4.0".r2d2_sqlite or false) ||
        (f.rocket_contrib."0.4.0".sqlite_pool or false) ||
        (rocket_contrib."0.4.0"."sqlite_pool" or false); }
      { "0.4.0".redis =
        (f.rocket_contrib."0.4.0".redis or false) ||
        (f.rocket_contrib."0.4.0".redis_pool or false) ||
        (rocket_contrib."0.4.0"."redis_pool" or false); }
      { "0.4.0".rmp-serde =
        (f.rocket_contrib."0.4.0".rmp-serde or false) ||
        (f.rocket_contrib."0.4.0".msgpack or false) ||
        (rocket_contrib."0.4.0"."msgpack" or false); }
      { "0.4.0".rusqlite =
        (f.rocket_contrib."0.4.0".rusqlite or false) ||
        (f.rocket_contrib."0.4.0".sqlite_pool or false) ||
        (rocket_contrib."0.4.0"."sqlite_pool" or false); }
      { "0.4.0".rusted_cypher =
        (f.rocket_contrib."0.4.0".rusted_cypher or false) ||
        (f.rocket_contrib."0.4.0".cypher_pool or false) ||
        (rocket_contrib."0.4.0"."cypher_pool" or false); }
      { "0.4.0".serde =
        (f.rocket_contrib."0.4.0".serde or false) ||
        (f.rocket_contrib."0.4.0".json or false) ||
        (rocket_contrib."0.4.0"."json" or false) ||
        (f.rocket_contrib."0.4.0".msgpack or false) ||
        (rocket_contrib."0.4.0"."msgpack" or false) ||
        (f.rocket_contrib."0.4.0".templates or false) ||
        (rocket_contrib."0.4.0"."templates" or false); }
      { "0.4.0".serde_json =
        (f.rocket_contrib."0.4.0".serde_json or false) ||
        (f.rocket_contrib."0.4.0".json or false) ||
        (rocket_contrib."0.4.0"."json" or false) ||
        (f.rocket_contrib."0.4.0".templates or false) ||
        (rocket_contrib."0.4.0"."templates" or false); }
      { "0.4.0".serve =
        (f.rocket_contrib."0.4.0".serve or false) ||
        (f.rocket_contrib."0.4.0".default or false) ||
        (rocket_contrib."0.4.0"."default" or false); }
      { "0.4.0".templates =
        (f.rocket_contrib."0.4.0".templates or false) ||
        (f.rocket_contrib."0.4.0".handlebars_templates or false) ||
        (rocket_contrib."0.4.0"."handlebars_templates" or false) ||
        (f.rocket_contrib."0.4.0".tera_templates or false) ||
        (rocket_contrib."0.4.0"."tera_templates" or false); }
      { "0.4.0".tera =
        (f.rocket_contrib."0.4.0".tera or false) ||
        (f.rocket_contrib."0.4.0".tera_templates or false) ||
        (rocket_contrib."0.4.0"."tera_templates" or false); }
      { "0.4.0".time =
        (f.rocket_contrib."0.4.0".time or false) ||
        (f.rocket_contrib."0.4.0".helmet or false) ||
        (rocket_contrib."0.4.0"."helmet" or false); }
    ];
    serde."${deps.rocket_contrib."0.4.0".serde}".default = true;
    serde_json."${deps.rocket_contrib."0.4.0".serde_json}".default = true;
  }) [
    (features_.log."${deps."rocket_contrib"."0.4.0"."log"}" deps)
    (features_.rocket."${deps."rocket_contrib"."0.4.0"."rocket"}" deps)
    (features_.serde."${deps."rocket_contrib"."0.4.0"."serde"}" deps)
    (features_.serde_json."${deps."rocket_contrib"."0.4.0"."serde_json"}" deps)
    (features_.notify."${deps."rocket_contrib"."0.4.0"."notify"}" deps)
  ];


# end
# rocket_http-0.4.0

  crates.rocket_http."0.4.0" = deps: { features?(features_.rocket_http."0.4.0" deps {}) }: buildRustCrate {
    crateName = "rocket_http";
    version = "0.4.0";
    authors = [ "Sergio Benitez <sb@sergio.bz>" ];
    sha256 = "0pncxzph2snnpryn6hk8xlha0z0aprfd862yxpm4jbn5hkhkng2x";
    dependencies = mapFeatures features ([
      (crates."cookie"."${deps."rocket_http"."0.4.0"."cookie"}" deps)
      (crates."hyper"."${deps."rocket_http"."0.4.0"."hyper"}" deps)
      (crates."indexmap"."${deps."rocket_http"."0.4.0"."indexmap"}" deps)
      (crates."pear"."${deps."rocket_http"."0.4.0"."pear"}" deps)
      (crates."percent_encoding"."${deps."rocket_http"."0.4.0"."percent_encoding"}" deps)
      (crates."smallvec"."${deps."rocket_http"."0.4.0"."smallvec"}" deps)
      (crates."state"."${deps."rocket_http"."0.4.0"."state"}" deps)
      (crates."time"."${deps."rocket_http"."0.4.0"."time"}" deps)
      (crates."unicode_xid"."${deps."rocket_http"."0.4.0"."unicode_xid"}" deps)
    ]);
    features = mkFeatures (features."rocket_http"."0.4.0" or {});
  };
  features_.rocket_http."0.4.0" = deps: f: updateFeatures f (rec {
    cookie = fold recursiveUpdate {} [
      { "${deps.rocket_http."0.4.0".cookie}"."percent-encode" = true; }
      { "${deps.rocket_http."0.4.0".cookie}"."secure" =
        (f.cookie."${deps.rocket_http."0.4.0".cookie}"."secure" or false) ||
        (rocket_http."0.4.0"."private-cookies" or false) ||
        (f."rocket_http"."0.4.0"."private-cookies" or false); }
      { "${deps.rocket_http."0.4.0".cookie}".default = true; }
    ];
    hyper."${deps.rocket_http."0.4.0".hyper}".default = (f.hyper."${deps.rocket_http."0.4.0".hyper}".default or false);
    indexmap."${deps.rocket_http."0.4.0".indexmap}".default = true;
    pear."${deps.rocket_http."0.4.0".pear}".default = true;
    percent_encoding."${deps.rocket_http."0.4.0".percent_encoding}".default = true;
    rocket_http = fold recursiveUpdate {} [
      { "0.4.0".default = (f.rocket_http."0.4.0".default or true); }
      { "0.4.0".hyper-sync-rustls =
        (f.rocket_http."0.4.0".hyper-sync-rustls or false) ||
        (f.rocket_http."0.4.0".tls or false) ||
        (rocket_http."0.4.0"."tls" or false); }
      { "0.4.0".rustls =
        (f.rocket_http."0.4.0".rustls or false) ||
        (f.rocket_http."0.4.0".tls or false) ||
        (rocket_http."0.4.0"."tls" or false); }
    ];
    smallvec."${deps.rocket_http."0.4.0".smallvec}".default = true;
    state."${deps.rocket_http."0.4.0".state}".default = true;
    time."${deps.rocket_http."0.4.0".time}".default = true;
    unicode_xid."${deps.rocket_http."0.4.0".unicode_xid}".default = true;
  }) [
    (features_.cookie."${deps."rocket_http"."0.4.0"."cookie"}" deps)
    (features_.hyper."${deps."rocket_http"."0.4.0"."hyper"}" deps)
    (features_.indexmap."${deps."rocket_http"."0.4.0"."indexmap"}" deps)
    (features_.pear."${deps."rocket_http"."0.4.0"."pear"}" deps)
    (features_.percent_encoding."${deps."rocket_http"."0.4.0"."percent_encoding"}" deps)
    (features_.smallvec."${deps."rocket_http"."0.4.0"."smallvec"}" deps)
    (features_.state."${deps."rocket_http"."0.4.0"."state"}" deps)
    (features_.time."${deps."rocket_http"."0.4.0"."time"}" deps)
    (features_.unicode_xid."${deps."rocket_http"."0.4.0"."unicode_xid"}" deps)
  ];


# end
# rustc_version-0.2.3

  crates.rustc_version."0.2.3" = deps: { features?(features_.rustc_version."0.2.3" deps {}) }: buildRustCrate {
    crateName = "rustc_version";
    version = "0.2.3";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "0rgwzbgs3i9fqjm1p4ra3n7frafmpwl29c8lw85kv1rxn7n2zaa7";
    dependencies = mapFeatures features ([
      (crates."semver"."${deps."rustc_version"."0.2.3"."semver"}" deps)
    ]);
  };
  features_.rustc_version."0.2.3" = deps: f: updateFeatures f (rec {
    rustc_version."0.2.3".default = (f.rustc_version."0.2.3".default or true);
    semver."${deps.rustc_version."0.2.3".semver}".default = true;
  }) [
    (features_.semver."${deps."rustc_version"."0.2.3"."semver"}" deps)
  ];


# end
# ryu-0.2.7

  crates.ryu."0.2.7" = deps: { features?(features_.ryu."0.2.7" deps {}) }: buildRustCrate {
    crateName = "ryu";
    version = "0.2.7";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "0m8szf1m87wfqkwh1f9zp9bn2mb0m9nav028xxnd0hlig90b44bd";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."ryu"."0.2.7" or {});
  };
  features_.ryu."0.2.7" = deps: f: updateFeatures f (rec {
    ryu."0.2.7".default = (f.ryu."0.2.7".default or true);
  }) [];


# end
# safemem-0.3.0

  crates.safemem."0.3.0" = deps: { features?(features_.safemem."0.3.0" deps {}) }: buildRustCrate {
    crateName = "safemem";
    version = "0.3.0";
    authors = [ "Austin Bonander <austin.bonander@gmail.com>" ];
    sha256 = "0pr39b468d05f6m7m4alsngmj5p7an8df21apsxbi57k0lmwrr18";
    features = mkFeatures (features."safemem"."0.3.0" or {});
  };
  features_.safemem."0.3.0" = deps: f: updateFeatures f (rec {
    safemem = fold recursiveUpdate {} [
      { "0.3.0".default = (f.safemem."0.3.0".default or true); }
      { "0.3.0".std =
        (f.safemem."0.3.0".std or false) ||
        (f.safemem."0.3.0".default or false) ||
        (safemem."0.3.0"."default" or false); }
    ];
  }) [];


# end
# same-file-1.0.4

  crates.same_file."1.0.4" = deps: { features?(features_.same_file."1.0.4" deps {}) }: buildRustCrate {
    crateName = "same-file";
    version = "1.0.4";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1zs244ssl381cqlnh2g42g3i60qip4z72i26z44d6kas3y3gy77q";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."winapi_util"."${deps."same_file"."1.0.4"."winapi_util"}" deps)
    ]) else []);
  };
  features_.same_file."1.0.4" = deps: f: updateFeatures f (rec {
    same_file."1.0.4".default = (f.same_file."1.0.4".default or true);
    winapi_util."${deps.same_file."1.0.4".winapi_util}".default = true;
  }) [
    (features_.winapi_util."${deps."same_file"."1.0.4"."winapi_util"}" deps)
  ];


# end
# semver-0.9.0

  crates.semver."0.9.0" = deps: { features?(features_.semver."0.9.0" deps {}) }: buildRustCrate {
    crateName = "semver";
    version = "0.9.0";
    authors = [ "Steve Klabnik <steve@steveklabnik.com>" "The Rust Project Developers" ];
    sha256 = "0azak2lb2wc36s3x15az886kck7rpnksrw14lalm157rg9sc9z63";
    dependencies = mapFeatures features ([
      (crates."semver_parser"."${deps."semver"."0.9.0"."semver_parser"}" deps)
    ]);
    features = mkFeatures (features."semver"."0.9.0" or {});
  };
  features_.semver."0.9.0" = deps: f: updateFeatures f (rec {
    semver = fold recursiveUpdate {} [
      { "0.9.0".default = (f.semver."0.9.0".default or true); }
      { "0.9.0".serde =
        (f.semver."0.9.0".serde or false) ||
        (f.semver."0.9.0".ci or false) ||
        (semver."0.9.0"."ci" or false); }
    ];
    semver_parser."${deps.semver."0.9.0".semver_parser}".default = true;
  }) [
    (features_.semver_parser."${deps."semver"."0.9.0"."semver_parser"}" deps)
  ];


# end
# semver-parser-0.7.0

  crates.semver_parser."0.7.0" = deps: { features?(features_.semver_parser."0.7.0" deps {}) }: buildRustCrate {
    crateName = "semver-parser";
    version = "0.7.0";
    authors = [ "Steve Klabnik <steve@steveklabnik.com>" ];
    sha256 = "1da66c8413yakx0y15k8c055yna5lyb6fr0fw9318kdwkrk5k12h";
  };
  features_.semver_parser."0.7.0" = deps: f: updateFeatures f (rec {
    semver_parser."0.7.0".default = (f.semver_parser."0.7.0".default or true);
  }) [];


# end
# serde-1.0.89

  crates.serde."1.0.89" = deps: { features?(features_.serde."1.0.89" deps {}) }: buildRustCrate {
    crateName = "serde";
    version = "1.0.89";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "14pidc6skkm92vhp431wi1aam5vv5g6rmsimik38wzb0qy72c71g";
    build = "build.rs";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.serde."1.0.89".serde_derive or false then [ (crates.serde_derive."${deps."serde"."1.0.89".serde_derive}" deps) ] else []));
    features = mkFeatures (features."serde"."1.0.89" or {});
  };
  features_.serde."1.0.89" = deps: f: updateFeatures f (rec {
    serde = fold recursiveUpdate {} [
      { "1.0.89".default = (f.serde."1.0.89".default or true); }
      { "1.0.89".serde_derive =
        (f.serde."1.0.89".serde_derive or false) ||
        (f.serde."1.0.89".derive or false) ||
        (serde."1.0.89"."derive" or false); }
      { "1.0.89".std =
        (f.serde."1.0.89".std or false) ||
        (f.serde."1.0.89".default or false) ||
        (serde."1.0.89"."default" or false); }
      { "1.0.89".unstable =
        (f.serde."1.0.89".unstable or false) ||
        (f.serde."1.0.89".alloc or false) ||
        (serde."1.0.89"."alloc" or false); }
    ];
    serde_derive."${deps.serde."1.0.89".serde_derive}".default = true;
  }) [
    (features_.serde_derive."${deps."serde"."1.0.89"."serde_derive"}" deps)
  ];


# end
# serde_derive-1.0.89

  crates.serde_derive."1.0.89" = deps: { features?(features_.serde_derive."1.0.89" deps {}) }: buildRustCrate {
    crateName = "serde_derive";
    version = "1.0.89";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "0wxbxq9sccrd939pfnrgfzykkwl9gag2yf7vxhg2c2p9kx36d3wm";
    procMacro = true;
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."serde_derive"."1.0.89"."proc_macro2"}" deps)
      (crates."quote"."${deps."serde_derive"."1.0.89"."quote"}" deps)
      (crates."syn"."${deps."serde_derive"."1.0.89"."syn"}" deps)
    ]);
    features = mkFeatures (features."serde_derive"."1.0.89" or {});
  };
  features_.serde_derive."1.0.89" = deps: f: updateFeatures f (rec {
    proc_macro2."${deps.serde_derive."1.0.89".proc_macro2}".default = true;
    quote."${deps.serde_derive."1.0.89".quote}".default = true;
    serde_derive."1.0.89".default = (f.serde_derive."1.0.89".default or true);
    syn = fold recursiveUpdate {} [
      { "${deps.serde_derive."1.0.89".syn}"."visit" = true; }
      { "${deps.serde_derive."1.0.89".syn}".default = true; }
    ];
  }) [
    (features_.proc_macro2."${deps."serde_derive"."1.0.89"."proc_macro2"}" deps)
    (features_.quote."${deps."serde_derive"."1.0.89"."quote"}" deps)
    (features_.syn."${deps."serde_derive"."1.0.89"."syn"}" deps)
  ];


# end
# serde_json-1.0.39

  crates.serde_json."1.0.39" = deps: { features?(features_.serde_json."1.0.39" deps {}) }: buildRustCrate {
    crateName = "serde_json";
    version = "1.0.39";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "07ydv06hn8x0yl0rc94l2wl9r2xz1fqd97n1s6j3bgdc6gw406a8";
    dependencies = mapFeatures features ([
      (crates."itoa"."${deps."serde_json"."1.0.39"."itoa"}" deps)
      (crates."ryu"."${deps."serde_json"."1.0.39"."ryu"}" deps)
      (crates."serde"."${deps."serde_json"."1.0.39"."serde"}" deps)
    ]);
    features = mkFeatures (features."serde_json"."1.0.39" or {});
  };
  features_.serde_json."1.0.39" = deps: f: updateFeatures f (rec {
    itoa."${deps.serde_json."1.0.39".itoa}".default = true;
    ryu."${deps.serde_json."1.0.39".ryu}".default = true;
    serde."${deps.serde_json."1.0.39".serde}".default = true;
    serde_json = fold recursiveUpdate {} [
      { "1.0.39".default = (f.serde_json."1.0.39".default or true); }
      { "1.0.39".indexmap =
        (f.serde_json."1.0.39".indexmap or false) ||
        (f.serde_json."1.0.39".preserve_order or false) ||
        (serde_json."1.0.39"."preserve_order" or false); }
    ];
  }) [
    (features_.itoa."${deps."serde_json"."1.0.39"."itoa"}" deps)
    (features_.ryu."${deps."serde_json"."1.0.39"."ryu"}" deps)
    (features_.serde."${deps."serde_json"."1.0.39"."serde"}" deps)
  ];


# end
# slab-0.4.2

  crates.slab."0.4.2" = deps: { features?(features_.slab."0.4.2" deps {}) }: buildRustCrate {
    crateName = "slab";
    version = "0.4.2";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0h1l2z7qy6207kv0v3iigdf2xfk9yrhbwj1svlxk6wxjmdxvgdl7";
  };
  features_.slab."0.4.2" = deps: f: updateFeatures f (rec {
    slab."0.4.2".default = (f.slab."0.4.2".default or true);
  }) [];


# end
# smallvec-0.6.9

  crates.smallvec."0.6.9" = deps: { features?(features_.smallvec."0.6.9" deps {}) }: buildRustCrate {
    crateName = "smallvec";
    version = "0.6.9";
    authors = [ "Simon Sapin <simon.sapin@exyr.org>" ];
    sha256 = "0p96l51a2pq5y0vn48nhbm6qslbc6k8h28cxm0pmzkqmj7xynz6w";
    libPath = "lib.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."smallvec"."0.6.9" or {});
  };
  features_.smallvec."0.6.9" = deps: f: updateFeatures f (rec {
    smallvec = fold recursiveUpdate {} [
      { "0.6.9".default = (f.smallvec."0.6.9".default or true); }
      { "0.6.9".std =
        (f.smallvec."0.6.9".std or false) ||
        (f.smallvec."0.6.9".default or false) ||
        (smallvec."0.6.9"."default" or false); }
    ];
  }) [];


# end
# state-0.4.1

  crates.state."0.4.1" = deps: { features?(features_.state."0.4.1" deps {}) }: buildRustCrate {
    crateName = "state";
    version = "0.4.1";
    authors = [ "Sergio Benitez <sb@sergio.bz>" ];
    sha256 = "0mkav1dcz9v0pi6rxwv0j0hhjhkzi5ssi4ld8djp0gh8lnaickk5";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."state"."0.4.1" or {});
  };
  features_.state."0.4.1" = deps: f: updateFeatures f (rec {
    state = fold recursiveUpdate {} [
      { "0.4.1".default = (f.state."0.4.1".default or true); }
      { "0.4.1".thread_local =
        (f.state."0.4.1".thread_local or false) ||
        (f.state."0.4.1".tls or false) ||
        (state."0.4.1"."tls" or false); }
    ];
  }) [];


# end
# strsim-0.7.0

  crates.strsim."0.7.0" = deps: { features?(features_.strsim."0.7.0" deps {}) }: buildRustCrate {
    crateName = "strsim";
    version = "0.7.0";
    authors = [ "Danny Guo <dannyguo91@gmail.com>" ];
    sha256 = "0fy0k5f2705z73mb3x9459bpcvrx4ky8jpr4zikcbiwan4bnm0iv";
  };
  features_.strsim."0.7.0" = deps: f: updateFeatures f (rec {
    strsim."0.7.0".default = (f.strsim."0.7.0".default or true);
  }) [];


# end
# syn-0.15.29

  crates.syn."0.15.29" = deps: { features?(features_.syn."0.15.29" deps {}) }: buildRustCrate {
    crateName = "syn";
    version = "0.15.29";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "0wrd6awgc6f1iwfn2v9fvwyd2yddgxdjv9s106kvwg1ljbw3fajw";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."syn"."0.15.29"."proc_macro2"}" deps)
      (crates."unicode_xid"."${deps."syn"."0.15.29"."unicode_xid"}" deps)
    ]
      ++ (if features.syn."0.15.29".quote or false then [ (crates.quote."${deps."syn"."0.15.29".quote}" deps) ] else []));
    features = mkFeatures (features."syn"."0.15.29" or {});
  };
  features_.syn."0.15.29" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.syn."0.15.29".proc_macro2}"."proc-macro" =
        (f.proc_macro2."${deps.syn."0.15.29".proc_macro2}"."proc-macro" or false) ||
        (syn."0.15.29"."proc-macro" or false) ||
        (f."syn"."0.15.29"."proc-macro" or false); }
      { "${deps.syn."0.15.29".proc_macro2}".default = (f.proc_macro2."${deps.syn."0.15.29".proc_macro2}".default or false); }
    ];
    quote = fold recursiveUpdate {} [
      { "${deps.syn."0.15.29".quote}"."proc-macro" =
        (f.quote."${deps.syn."0.15.29".quote}"."proc-macro" or false) ||
        (syn."0.15.29"."proc-macro" or false) ||
        (f."syn"."0.15.29"."proc-macro" or false); }
      { "${deps.syn."0.15.29".quote}".default = (f.quote."${deps.syn."0.15.29".quote}".default or false); }
    ];
    syn = fold recursiveUpdate {} [
      { "0.15.29".clone-impls =
        (f.syn."0.15.29".clone-impls or false) ||
        (f.syn."0.15.29".default or false) ||
        (syn."0.15.29"."default" or false); }
      { "0.15.29".default = (f.syn."0.15.29".default or true); }
      { "0.15.29".derive =
        (f.syn."0.15.29".derive or false) ||
        (f.syn."0.15.29".default or false) ||
        (syn."0.15.29"."default" or false); }
      { "0.15.29".parsing =
        (f.syn."0.15.29".parsing or false) ||
        (f.syn."0.15.29".default or false) ||
        (syn."0.15.29"."default" or false); }
      { "0.15.29".printing =
        (f.syn."0.15.29".printing or false) ||
        (f.syn."0.15.29".default or false) ||
        (syn."0.15.29"."default" or false); }
      { "0.15.29".proc-macro =
        (f.syn."0.15.29".proc-macro or false) ||
        (f.syn."0.15.29".default or false) ||
        (syn."0.15.29"."default" or false); }
      { "0.15.29".quote =
        (f.syn."0.15.29".quote or false) ||
        (f.syn."0.15.29".printing or false) ||
        (syn."0.15.29"."printing" or false); }
    ];
    unicode_xid."${deps.syn."0.15.29".unicode_xid}".default = true;
  }) [
    (features_.proc_macro2."${deps."syn"."0.15.29"."proc_macro2"}" deps)
    (features_.quote."${deps."syn"."0.15.29"."quote"}" deps)
    (features_.unicode_xid."${deps."syn"."0.15.29"."unicode_xid"}" deps)
  ];


# end
# thread_local-0.3.6

  crates.thread_local."0.3.6" = deps: { features?(features_.thread_local."0.3.6" deps {}) }: buildRustCrate {
    crateName = "thread_local";
    version = "0.3.6";
    authors = [ "Amanieu d'Antras <amanieu@gmail.com>" ];
    sha256 = "02rksdwjmz2pw9bmgbb4c0bgkbq5z6nvg510sq1s6y2j1gam0c7i";
    dependencies = mapFeatures features ([
      (crates."lazy_static"."${deps."thread_local"."0.3.6"."lazy_static"}" deps)
    ]);
  };
  features_.thread_local."0.3.6" = deps: f: updateFeatures f (rec {
    lazy_static."${deps.thread_local."0.3.6".lazy_static}".default = true;
    thread_local."0.3.6".default = (f.thread_local."0.3.6".default or true);
  }) [
    (features_.lazy_static."${deps."thread_local"."0.3.6"."lazy_static"}" deps)
  ];


# end
# time-0.1.42

  crates.time."0.1.42" = deps: { features?(features_.time."0.1.42" deps {}) }: buildRustCrate {
    crateName = "time";
    version = "0.1.42";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1ny809kmdjwd4b478ipc33dz7q6nq7rxk766x8cnrg6zygcksmmx";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."time"."0.1.42"."libc"}" deps)
    ])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."time"."0.1.42"."redox_syscall"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."time"."0.1.42"."winapi"}" deps)
    ]) else []);
  };
  features_.time."0.1.42" = deps: f: updateFeatures f (rec {
    libc."${deps.time."0.1.42".libc}".default = true;
    redox_syscall."${deps.time."0.1.42".redox_syscall}".default = true;
    time."0.1.42".default = (f.time."0.1.42".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.time."0.1.42".winapi}"."minwinbase" = true; }
      { "${deps.time."0.1.42".winapi}"."minwindef" = true; }
      { "${deps.time."0.1.42".winapi}"."ntdef" = true; }
      { "${deps.time."0.1.42".winapi}"."profileapi" = true; }
      { "${deps.time."0.1.42".winapi}"."std" = true; }
      { "${deps.time."0.1.42".winapi}"."sysinfoapi" = true; }
      { "${deps.time."0.1.42".winapi}"."timezoneapi" = true; }
      { "${deps.time."0.1.42".winapi}".default = true; }
    ];
  }) [
    (features_.libc."${deps."time"."0.1.42"."libc"}" deps)
    (features_.redox_syscall."${deps."time"."0.1.42"."redox_syscall"}" deps)
    (features_.winapi."${deps."time"."0.1.42"."winapi"}" deps)
  ];


# end
# toml-0.4.10

  crates.toml."0.4.10" = deps: { features?(features_.toml."0.4.10" deps {}) }: buildRustCrate {
    crateName = "toml";
    version = "0.4.10";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0fs4kxl86w3kmgwcgcv23nk79zagayz1spg281r83w0ywf88d6f1";
    dependencies = mapFeatures features ([
      (crates."serde"."${deps."toml"."0.4.10"."serde"}" deps)
    ]);
  };
  features_.toml."0.4.10" = deps: f: updateFeatures f (rec {
    serde."${deps.toml."0.4.10".serde}".default = true;
    toml."0.4.10".default = (f.toml."0.4.10".default or true);
  }) [
    (features_.serde."${deps."toml"."0.4.10"."serde"}" deps)
  ];


# end
# traitobject-0.1.0

  crates.traitobject."0.1.0" = deps: { features?(features_.traitobject."0.1.0" deps {}) }: buildRustCrate {
    crateName = "traitobject";
    version = "0.1.0";
    authors = [ "Jonathan Reem <jonathan.reem@gmail.com>" ];
    sha256 = "10hi8pl361l539g4kg74mcrhn7grmwlar4jl528ddn2z2jvb7lw3";
  };
  features_.traitobject."0.1.0" = deps: f: updateFeatures f (rec {
    traitobject."0.1.0".default = (f.traitobject."0.1.0".default or true);
  }) [];


# end
# typeable-0.1.2

  crates.typeable."0.1.2" = deps: { features?(features_.typeable."0.1.2" deps {}) }: buildRustCrate {
    crateName = "typeable";
    version = "0.1.2";
    authors = [ "Jonathan Reem <jonathan.reem@gmail.com>" ];
    sha256 = "0lvff10hwyy852m6r11msyv1rpgpnapn284i8dk0p0q5saqvbvnx";
  };
  features_.typeable."0.1.2" = deps: f: updateFeatures f (rec {
    typeable."0.1.2".default = (f.typeable."0.1.2".default or true);
  }) [];


# end
# ucd-util-0.1.3

  crates.ucd_util."0.1.3" = deps: { features?(features_.ucd_util."0.1.3" deps {}) }: buildRustCrate {
    crateName = "ucd-util";
    version = "0.1.3";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1n1qi3jywq5syq90z9qd8qzbn58pcjgv1sx4sdmipm4jf9zanz15";
  };
  features_.ucd_util."0.1.3" = deps: f: updateFeatures f (rec {
    ucd_util."0.1.3".default = (f.ucd_util."0.1.3".default or true);
  }) [];


# end
# unicase-1.4.2

  crates.unicase."1.4.2" = deps: { features?(features_.unicase."1.4.2" deps {}) }: buildRustCrate {
    crateName = "unicase";
    version = "1.4.2";
    authors = [ "Sean McArthur <sean.monstar@gmail.com>" ];
    sha256 = "0rbnhw2mnhcwrij3vczp0sl8zdfmvf2dlh8hly81kj7132kfj0mf";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);

    buildDependencies = mapFeatures features ([
      (crates."version_check"."${deps."unicase"."1.4.2"."version_check"}" deps)
    ]);
    features = mkFeatures (features."unicase"."1.4.2" or {});
  };
  features_.unicase."1.4.2" = deps: f: updateFeatures f (rec {
    unicase = fold recursiveUpdate {} [
      { "1.4.2".default = (f.unicase."1.4.2".default or true); }
      { "1.4.2".heapsize =
        (f.unicase."1.4.2".heapsize or false) ||
        (f.unicase."1.4.2".heap_size or false) ||
        (unicase."1.4.2"."heap_size" or false); }
      { "1.4.2".heapsize_plugin =
        (f.unicase."1.4.2".heapsize_plugin or false) ||
        (f.unicase."1.4.2".heap_size or false) ||
        (unicase."1.4.2"."heap_size" or false); }
    ];
    version_check."${deps.unicase."1.4.2".version_check}".default = true;
  }) [
    (features_.version_check."${deps."unicase"."1.4.2"."version_check"}" deps)
  ];


# end
# unicode-bidi-0.3.4

  crates.unicode_bidi."0.3.4" = deps: { features?(features_.unicode_bidi."0.3.4" deps {}) }: buildRustCrate {
    crateName = "unicode-bidi";
    version = "0.3.4";
    authors = [ "The Servo Project Developers" ];
    sha256 = "0lcd6jasrf8p9p0q20qyf10c6xhvw40m2c4rr105hbk6zy26nj1q";
    libName = "unicode_bidi";
    dependencies = mapFeatures features ([
      (crates."matches"."${deps."unicode_bidi"."0.3.4"."matches"}" deps)
    ]);
    features = mkFeatures (features."unicode_bidi"."0.3.4" or {});
  };
  features_.unicode_bidi."0.3.4" = deps: f: updateFeatures f (rec {
    matches."${deps.unicode_bidi."0.3.4".matches}".default = true;
    unicode_bidi = fold recursiveUpdate {} [
      { "0.3.4".default = (f.unicode_bidi."0.3.4".default or true); }
      { "0.3.4".flame =
        (f.unicode_bidi."0.3.4".flame or false) ||
        (f.unicode_bidi."0.3.4".flame_it or false) ||
        (unicode_bidi."0.3.4"."flame_it" or false); }
      { "0.3.4".flamer =
        (f.unicode_bidi."0.3.4".flamer or false) ||
        (f.unicode_bidi."0.3.4".flame_it or false) ||
        (unicode_bidi."0.3.4"."flame_it" or false); }
      { "0.3.4".serde =
        (f.unicode_bidi."0.3.4".serde or false) ||
        (f.unicode_bidi."0.3.4".with_serde or false) ||
        (unicode_bidi."0.3.4"."with_serde" or false); }
    ];
  }) [
    (features_.matches."${deps."unicode_bidi"."0.3.4"."matches"}" deps)
  ];


# end
# unicode-normalization-0.1.8

  crates.unicode_normalization."0.1.8" = deps: { features?(features_.unicode_normalization."0.1.8" deps {}) }: buildRustCrate {
    crateName = "unicode-normalization";
    version = "0.1.8";
    authors = [ "kwantam <kwantam@gmail.com>" ];
    sha256 = "1pb26i2xd5zz0icabyqahikpca0iwj2jd4145pczc4bb7p641dsz";
    dependencies = mapFeatures features ([
      (crates."smallvec"."${deps."unicode_normalization"."0.1.8"."smallvec"}" deps)
    ]);
  };
  features_.unicode_normalization."0.1.8" = deps: f: updateFeatures f (rec {
    smallvec."${deps.unicode_normalization."0.1.8".smallvec}".default = true;
    unicode_normalization."0.1.8".default = (f.unicode_normalization."0.1.8".default or true);
  }) [
    (features_.smallvec."${deps."unicode_normalization"."0.1.8"."smallvec"}" deps)
  ];


# end
# unicode-xid-0.1.0

  crates.unicode_xid."0.1.0" = deps: { features?(features_.unicode_xid."0.1.0" deps {}) }: buildRustCrate {
    crateName = "unicode-xid";
    version = "0.1.0";
    authors = [ "erick.tryzelaar <erick.tryzelaar@gmail.com>" "kwantam <kwantam@gmail.com>" ];
    sha256 = "05wdmwlfzxhq3nhsxn6wx4q8dhxzzfb9szsz6wiw092m1rjj01zj";
    features = mkFeatures (features."unicode_xid"."0.1.0" or {});
  };
  features_.unicode_xid."0.1.0" = deps: f: updateFeatures f (rec {
    unicode_xid."0.1.0".default = (f.unicode_xid."0.1.0".default or true);
  }) [];


# end
# untrusted-0.6.2

  crates.untrusted."0.6.2" = deps: { features?(features_.untrusted."0.6.2" deps {}) }: buildRustCrate {
    crateName = "untrusted";
    version = "0.6.2";
    authors = [ "Brian Smith <brian@briansmith.org>" ];
    sha256 = "189ir1h2xgb290bhjchwczr9ygia1f3ipsydf6pwnnb95lb8fihg";
    libPath = "src/untrusted.rs";
  };
  features_.untrusted."0.6.2" = deps: f: updateFeatures f (rec {
    untrusted."0.6.2".default = (f.untrusted."0.6.2".default or true);
  }) [];


# end
# url-1.7.2

  crates.url."1.7.2" = deps: { features?(features_.url."1.7.2" deps {}) }: buildRustCrate {
    crateName = "url";
    version = "1.7.2";
    authors = [ "The rust-url developers" ];
    sha256 = "0qzrjzd9r1niv7037x4cgnv98fs1vj0k18lpxx890ipc47x5gc09";
    dependencies = mapFeatures features ([
      (crates."idna"."${deps."url"."1.7.2"."idna"}" deps)
      (crates."matches"."${deps."url"."1.7.2"."matches"}" deps)
      (crates."percent_encoding"."${deps."url"."1.7.2"."percent_encoding"}" deps)
    ]);
    features = mkFeatures (features."url"."1.7.2" or {});
  };
  features_.url."1.7.2" = deps: f: updateFeatures f (rec {
    idna."${deps.url."1.7.2".idna}".default = true;
    matches."${deps.url."1.7.2".matches}".default = true;
    percent_encoding."${deps.url."1.7.2".percent_encoding}".default = true;
    url = fold recursiveUpdate {} [
      { "1.7.2".default = (f.url."1.7.2".default or true); }
      { "1.7.2".encoding =
        (f.url."1.7.2".encoding or false) ||
        (f.url."1.7.2".query_encoding or false) ||
        (url."1.7.2"."query_encoding" or false); }
      { "1.7.2".heapsize =
        (f.url."1.7.2".heapsize or false) ||
        (f.url."1.7.2".heap_size or false) ||
        (url."1.7.2"."heap_size" or false); }
    ];
  }) [
    (features_.idna."${deps."url"."1.7.2"."idna"}" deps)
    (features_.matches."${deps."url"."1.7.2"."matches"}" deps)
    (features_.percent_encoding."${deps."url"."1.7.2"."percent_encoding"}" deps)
  ];


# end
# utf8-ranges-1.0.2

  crates.utf8_ranges."1.0.2" = deps: { features?(features_.utf8_ranges."1.0.2" deps {}) }: buildRustCrate {
    crateName = "utf8-ranges";
    version = "1.0.2";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1my02laqsgnd8ib4dvjgd4rilprqjad6pb9jj9vi67csi5qs2281";
  };
  features_.utf8_ranges."1.0.2" = deps: f: updateFeatures f (rec {
    utf8_ranges."1.0.2".default = (f.utf8_ranges."1.0.2".default or true);
  }) [];


# end
# vcpkg-0.2.6

  crates.vcpkg."0.2.6" = deps: { features?(features_.vcpkg."0.2.6" deps {}) }: buildRustCrate {
    crateName = "vcpkg";
    version = "0.2.6";
    authors = [ "Jim McGrath <jimmc2@gmail.com>" ];
    sha256 = "1ig6jqpzzl1z9vk4qywgpfr4hfbd8ny8frqsgm3r449wkc4n1i5x";
  };
  features_.vcpkg."0.2.6" = deps: f: updateFeatures f (rec {
    vcpkg."0.2.6".default = (f.vcpkg."0.2.6".default or true);
  }) [];


# end
# version_check-0.1.5

  crates.version_check."0.1.5" = deps: { features?(features_.version_check."0.1.5" deps {}) }: buildRustCrate {
    crateName = "version_check";
    version = "0.1.5";
    authors = [ "Sergio Benitez <sb@sergio.bz>" ];
    sha256 = "1yrx9xblmwbafw2firxyqbj8f771kkzfd24n3q7xgwiqyhi0y8qd";
  };
  features_.version_check."0.1.5" = deps: f: updateFeatures f (rec {
    version_check."0.1.5".default = (f.version_check."0.1.5".default or true);
  }) [];


# end
# walkdir-2.2.7

  crates.walkdir."2.2.7" = deps: { features?(features_.walkdir."2.2.7" deps {}) }: buildRustCrate {
    crateName = "walkdir";
    version = "2.2.7";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "0wq3v28916kkla29yyi0g0xfc16apwx24py68049kriz3gjlig03";
    dependencies = mapFeatures features ([
      (crates."same_file"."${deps."walkdir"."2.2.7"."same_file"}" deps)
    ])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."walkdir"."2.2.7"."winapi"}" deps)
      (crates."winapi_util"."${deps."walkdir"."2.2.7"."winapi_util"}" deps)
    ]) else []);
  };
  features_.walkdir."2.2.7" = deps: f: updateFeatures f (rec {
    same_file."${deps.walkdir."2.2.7".same_file}".default = true;
    walkdir."2.2.7".default = (f.walkdir."2.2.7".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.walkdir."2.2.7".winapi}"."std" = true; }
      { "${deps.walkdir."2.2.7".winapi}"."winnt" = true; }
      { "${deps.walkdir."2.2.7".winapi}".default = true; }
    ];
    winapi_util."${deps.walkdir."2.2.7".winapi_util}".default = true;
  }) [
    (features_.same_file."${deps."walkdir"."2.2.7"."same_file"}" deps)
    (features_.winapi."${deps."walkdir"."2.2.7"."winapi"}" deps)
    (features_.winapi_util."${deps."walkdir"."2.2.7"."winapi_util"}" deps)
  ];


# end
# winapi-0.2.8

  crates.winapi."0.2.8" = deps: { features?(features_.winapi."0.2.8" deps {}) }: buildRustCrate {
    crateName = "winapi";
    version = "0.2.8";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "0a45b58ywf12vb7gvj6h3j264nydynmzyqz8d8rqxsj6icqv82as";
  };
  features_.winapi."0.2.8" = deps: f: updateFeatures f (rec {
    winapi."0.2.8".default = (f.winapi."0.2.8".default or true);
  }) [];


# end
# winapi-0.3.6

  crates.winapi."0.3.6" = deps: { features?(features_.winapi."0.3.6" deps {}) }: buildRustCrate {
    crateName = "winapi";
    version = "0.3.6";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1d9jfp4cjd82sr1q4dgdlrkvm33zhhav9d7ihr0nivqbncr059m4";
    build = "build.rs";
    dependencies = (if kernel == "i686-pc-windows-gnu" then mapFeatures features ([
      (crates."winapi_i686_pc_windows_gnu"."${deps."winapi"."0.3.6"."winapi_i686_pc_windows_gnu"}" deps)
    ]) else [])
      ++ (if kernel == "x86_64-pc-windows-gnu" then mapFeatures features ([
      (crates."winapi_x86_64_pc_windows_gnu"."${deps."winapi"."0.3.6"."winapi_x86_64_pc_windows_gnu"}" deps)
    ]) else []);
    features = mkFeatures (features."winapi"."0.3.6" or {});
  };
  features_.winapi."0.3.6" = deps: f: updateFeatures f (rec {
    winapi."0.3.6".default = (f.winapi."0.3.6".default or true);
    winapi_i686_pc_windows_gnu."${deps.winapi."0.3.6".winapi_i686_pc_windows_gnu}".default = true;
    winapi_x86_64_pc_windows_gnu."${deps.winapi."0.3.6".winapi_x86_64_pc_windows_gnu}".default = true;
  }) [
    (features_.winapi_i686_pc_windows_gnu."${deps."winapi"."0.3.6"."winapi_i686_pc_windows_gnu"}" deps)
    (features_.winapi_x86_64_pc_windows_gnu."${deps."winapi"."0.3.6"."winapi_x86_64_pc_windows_gnu"}" deps)
  ];


# end
# winapi-build-0.1.1

  crates.winapi_build."0.1.1" = deps: { features?(features_.winapi_build."0.1.1" deps {}) }: buildRustCrate {
    crateName = "winapi-build";
    version = "0.1.1";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1lxlpi87rkhxcwp2ykf1ldw3p108hwm24nywf3jfrvmff4rjhqga";
    libName = "build";
  };
  features_.winapi_build."0.1.1" = deps: f: updateFeatures f (rec {
    winapi_build."0.1.1".default = (f.winapi_build."0.1.1".default or true);
  }) [];


# end
# winapi-i686-pc-windows-gnu-0.4.0

  crates.winapi_i686_pc_windows_gnu."0.4.0" = deps: { features?(features_.winapi_i686_pc_windows_gnu."0.4.0" deps {}) }: buildRustCrate {
    crateName = "winapi-i686-pc-windows-gnu";
    version = "0.4.0";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "05ihkij18r4gamjpxj4gra24514can762imjzlmak5wlzidplzrp";
    build = "build.rs";
  };
  features_.winapi_i686_pc_windows_gnu."0.4.0" = deps: f: updateFeatures f (rec {
    winapi_i686_pc_windows_gnu."0.4.0".default = (f.winapi_i686_pc_windows_gnu."0.4.0".default or true);
  }) [];


# end
# winapi-util-0.1.2

  crates.winapi_util."0.1.2" = deps: { features?(features_.winapi_util."0.1.2" deps {}) }: buildRustCrate {
    crateName = "winapi-util";
    version = "0.1.2";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "07jj7rg7nndd7bqhjin1xphbv8kb5clvhzpqpxkvm3wl84r3mj1h";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."winapi_util"."0.1.2"."winapi"}" deps)
    ]) else []);
  };
  features_.winapi_util."0.1.2" = deps: f: updateFeatures f (rec {
    winapi = fold recursiveUpdate {} [
      { "${deps.winapi_util."0.1.2".winapi}"."consoleapi" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."errhandlingapi" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."fileapi" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."minwindef" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."processenv" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."std" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."winbase" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."wincon" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."winerror" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."winnt" = true; }
      { "${deps.winapi_util."0.1.2".winapi}".default = true; }
    ];
    winapi_util."0.1.2".default = (f.winapi_util."0.1.2".default or true);
  }) [
    (features_.winapi."${deps."winapi_util"."0.1.2"."winapi"}" deps)
  ];


# end
# winapi-x86_64-pc-windows-gnu-0.4.0

  crates.winapi_x86_64_pc_windows_gnu."0.4.0" = deps: { features?(features_.winapi_x86_64_pc_windows_gnu."0.4.0" deps {}) }: buildRustCrate {
    crateName = "winapi-x86_64-pc-windows-gnu";
    version = "0.4.0";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "0n1ylmlsb8yg1v583i4xy0qmqg42275flvbc51hdqjjfjcl9vlbj";
    build = "build.rs";
  };
  features_.winapi_x86_64_pc_windows_gnu."0.4.0" = deps: f: updateFeatures f (rec {
    winapi_x86_64_pc_windows_gnu."0.4.0".default = (f.winapi_x86_64_pc_windows_gnu."0.4.0".default or true);
  }) [];


# end
# ws2_32-sys-0.2.1

  crates.ws2_32_sys."0.2.1" = deps: { features?(features_.ws2_32_sys."0.2.1" deps {}) }: buildRustCrate {
    crateName = "ws2_32-sys";
    version = "0.2.1";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1zpy9d9wk11sj17fczfngcj28w4xxjs3b4n036yzpy38dxp4f7kc";
    libName = "ws2_32";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."winapi"."${deps."ws2_32_sys"."0.2.1"."winapi"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."winapi_build"."${deps."ws2_32_sys"."0.2.1"."winapi_build"}" deps)
    ]);
  };
  features_.ws2_32_sys."0.2.1" = deps: f: updateFeatures f (rec {
    winapi."${deps.ws2_32_sys."0.2.1".winapi}".default = true;
    winapi_build."${deps.ws2_32_sys."0.2.1".winapi_build}".default = true;
    ws2_32_sys."0.2.1".default = (f.ws2_32_sys."0.2.1".default or true);
  }) [
    (features_.winapi."${deps."ws2_32_sys"."0.2.1"."winapi"}" deps)
    (features_.winapi_build."${deps."ws2_32_sys"."0.2.1"."winapi_build"}" deps)
  ];


# end
# yansi-0.4.0

  crates.yansi."0.4.0" = deps: { features?(features_.yansi."0.4.0" deps {}) }: buildRustCrate {
    crateName = "yansi";
    version = "0.4.0";
    authors = [ "Sergio Benitez <sb@sergio.bz>" ];
    sha256 = "0ridss6y18lmw3s1mqzfhivhmq7kcip22nbva3gy6wlsjxpdn9l7";
  };
  features_.yansi."0.4.0" = deps: f: updateFeatures f (rec {
    yansi."0.4.0".default = (f.yansi."0.4.0".default or true);
  }) [];


# end
# yansi-0.5.0

  crates.yansi."0.5.0" = deps: { features?(features_.yansi."0.5.0" deps {}) }: buildRustCrate {
    crateName = "yansi";
    version = "0.5.0";
    authors = [ "Sergio Benitez <sb@sergio.bz>" ];
    sha256 = "1c2k520yvv900mndxqjfl25bkhzkpdzy5bc4yc9n7h2ls25l0f0r";
  };
  features_.yansi."0.5.0" = deps: f: updateFeatures f (rec {
    yansi."0.5.0".default = (f.yansi."0.5.0".default or true);
  }) [];


# end
}
