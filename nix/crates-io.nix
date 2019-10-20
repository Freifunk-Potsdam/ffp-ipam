{ lib, buildRustCrate, buildRustCrateHelpers }:
with buildRustCrateHelpers;
let inherit (lib.lists) fold;
    inherit (lib.attrsets) recursiveUpdate;
in
rec {

# aho-corasick-0.7.6

  crates.aho_corasick."0.7.6" = deps: { features?(features_.aho_corasick."0.7.6" deps {}) }: buildRustCrate {
    crateName = "aho-corasick";
    version = "0.7.6";
    description = "Fast multiple substring searching.";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1srdggg7iawz7rfyb79qfnz6vmzkgl6g6gabyd9ad6pbx7zzj8gz";
    libName = "aho_corasick";
    dependencies = mapFeatures features ([
      (crates."memchr"."${deps."aho_corasick"."0.7.6"."memchr"}" deps)
    ]);
    features = mkFeatures (features."aho_corasick"."0.7.6" or {});
  };
  features_.aho_corasick."0.7.6" = deps: f: updateFeatures f (rec {
    aho_corasick = fold recursiveUpdate {} [
      { "0.7.6"."std" =
        (f.aho_corasick."0.7.6"."std" or false) ||
        (f.aho_corasick."0.7.6".default or false) ||
        (aho_corasick."0.7.6"."default" or false); }
      { "0.7.6".default = (f.aho_corasick."0.7.6".default or true); }
    ];
    memchr = fold recursiveUpdate {} [
      { "${deps.aho_corasick."0.7.6".memchr}"."use_std" =
        (f.memchr."${deps.aho_corasick."0.7.6".memchr}"."use_std" or false) ||
        (aho_corasick."0.7.6"."std" or false) ||
        (f."aho_corasick"."0.7.6"."std" or false); }
      { "${deps.aho_corasick."0.7.6".memchr}".default = (f.memchr."${deps.aho_corasick."0.7.6".memchr}".default or false); }
    ];
  }) [
    (features_.memchr."${deps."aho_corasick"."0.7.6"."memchr"}" deps)
  ];


# end
# atty-0.2.13

  crates.atty."0.2.13" = deps: { features?(features_.atty."0.2.13" deps {}) }: buildRustCrate {
    crateName = "atty";
    version = "0.2.13";
    description = "A simple interface for querying atty";
    authors = [ "softprops <d.tangren@gmail.com>" ];
    sha256 = "0a1ii8h9fvvrq05bz7j135zjjz1sjz6n2invn2ngxqri0jxgmip2";
    dependencies = (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."atty"."0.2.13"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."atty"."0.2.13"."winapi"}" deps)
    ]) else []);
  };
  features_.atty."0.2.13" = deps: f: updateFeatures f (rec {
    atty."0.2.13".default = (f.atty."0.2.13".default or true);
    libc."${deps.atty."0.2.13".libc}".default = (f.libc."${deps.atty."0.2.13".libc}".default or false);
    winapi = fold recursiveUpdate {} [
      { "${deps.atty."0.2.13".winapi}"."consoleapi" = true; }
      { "${deps.atty."0.2.13".winapi}"."minwinbase" = true; }
      { "${deps.atty."0.2.13".winapi}"."minwindef" = true; }
      { "${deps.atty."0.2.13".winapi}"."processenv" = true; }
      { "${deps.atty."0.2.13".winapi}"."winbase" = true; }
      { "${deps.atty."0.2.13".winapi}".default = true; }
    ];
  }) [
    (features_.libc."${deps."atty"."0.2.13"."libc"}" deps)
    (features_.winapi."${deps."atty"."0.2.13"."winapi"}" deps)
  ];


# end
# autocfg-0.1.6

  crates.autocfg."0.1.6" = deps: { features?(features_.autocfg."0.1.6" deps {}) }: buildRustCrate {
    crateName = "autocfg";
    version = "0.1.6";
    description = "Automatic cfg for Rust compiler features";
    authors = [ "Josh Stone <cuviper@gmail.com>" ];
    sha256 = "1yzawpsmrcy3x60i59hfwwg7mfdwc74199m2lgkc4vam5ijy8mz7";
  };
  features_.autocfg."0.1.6" = deps: f: updateFeatures f (rec {
    autocfg."0.1.6".default = (f.autocfg."0.1.6".default or true);
  }) [];


# end
# base64-0.9.3

  crates.base64."0.9.3" = deps: { features?(features_.base64."0.9.3" deps {}) }: buildRustCrate {
    crateName = "base64";
    version = "0.9.3";
    description = "encodes and decodes base64 as bytes or utf8";
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
    description = "encodes and decodes base64 as bytes or utf8";
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
# bitflags-1.2.1

  crates.bitflags."1.2.1" = deps: { features?(features_.bitflags."1.2.1" deps {}) }: buildRustCrate {
    crateName = "bitflags";
    version = "1.2.1";
    description = "A macro to generate structures which behave like bitflags.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "0b77awhpn7yaqjjibm69ginfn996azx5vkzfjj39g3wbsqs7mkxg";
    build = "build.rs";
    features = mkFeatures (features."bitflags"."1.2.1" or {});
  };
  features_.bitflags."1.2.1" = deps: f: updateFeatures f (rec {
    bitflags."1.2.1".default = (f.bitflags."1.2.1".default or true);
  }) [];


# end
# byteorder-1.3.2

  crates.byteorder."1.3.2" = deps: { features?(features_.byteorder."1.3.2" deps {}) }: buildRustCrate {
    crateName = "byteorder";
    version = "1.3.2";
    description = "Library for reading/writing numbers in big-endian and little-endian.";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "099fxwc79ncpcl8dgg9hql8gznz11a3sjs7pai0mg6w8r05khvdx";
    build = "build.rs";
    features = mkFeatures (features."byteorder"."1.3.2" or {});
  };
  features_.byteorder."1.3.2" = deps: f: updateFeatures f (rec {
    byteorder = fold recursiveUpdate {} [
      { "1.3.2"."std" =
        (f.byteorder."1.3.2"."std" or false) ||
        (f.byteorder."1.3.2".default or false) ||
        (byteorder."1.3.2"."default" or false); }
      { "1.3.2".default = (f.byteorder."1.3.2".default or true); }
    ];
  }) [];


# end
# cc-1.0.46

  crates.cc."1.0.46" = deps: { features?(features_.cc."1.0.46" deps {}) }: buildRustCrate {
    crateName = "cc";
    version = "1.0.46";
    description = "A build-time dependency for Cargo build scripts to assist in invoking the native\nC compiler to compile native C code into a static archive to be linked into Rust\ncode.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    edition = "2018";
    sha256 = "1r5cp143kvbyxcwna60jxlrjq8sc78sxj912hh01g1g6kkhm7mb6";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.cc."1.0.46".jobserver or false then [ (crates.jobserver."${deps."cc"."1.0.46".jobserver}" deps) ] else [])
      ++ (if features.cc."1.0.46".num_cpus or false then [ (crates.num_cpus."${deps."cc"."1.0.46".num_cpus}" deps) ] else []));
    features = mkFeatures (features."cc"."1.0.46" or {});
  };
  features_.cc."1.0.46" = deps: f: updateFeatures f (rec {
    cc = fold recursiveUpdate {} [
      { "1.0.46"."jobserver" =
        (f.cc."1.0.46"."jobserver" or false) ||
        (f.cc."1.0.46".parallel or false) ||
        (cc."1.0.46"."parallel" or false); }
      { "1.0.46"."num_cpus" =
        (f.cc."1.0.46"."num_cpus" or false) ||
        (f.cc."1.0.46".parallel or false) ||
        (cc."1.0.46"."parallel" or false); }
      { "1.0.46".default = (f.cc."1.0.46".default or true); }
    ];
    jobserver."${deps.cc."1.0.46".jobserver}".default = true;
    num_cpus."${deps.cc."1.0.46".num_cpus}".default = true;
  }) [
    (features_.jobserver."${deps."cc"."1.0.46"."jobserver"}" deps)
    (features_.num_cpus."${deps."cc"."1.0.46"."num_cpus"}" deps)
  ];


# end
# cfg-if-0.1.10

  crates.cfg_if."0.1.10" = deps: { features?(features_.cfg_if."0.1.10" deps {}) }: buildRustCrate {
    crateName = "cfg-if";
    version = "0.1.10";
    description = "A macro to ergonomically define an item depending on a large number of #[cfg]\nparameters. Structured like an if-else chain, the first matching branch is the\nitem that gets emitted.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    edition = "2018";
    sha256 = "0x52qzpbyl2f2jqs7kkqzgfki2cpq99gpfjjigdp8pwwfqk01007";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."cfg_if"."0.1.10" or {});
  };
  features_.cfg_if."0.1.10" = deps: f: updateFeatures f (rec {
    cfg_if = fold recursiveUpdate {} [
      { "0.1.10"."compiler_builtins" =
        (f.cfg_if."0.1.10"."compiler_builtins" or false) ||
        (f.cfg_if."0.1.10".rustc-dep-of-std or false) ||
        (cfg_if."0.1.10"."rustc-dep-of-std" or false); }
      { "0.1.10"."core" =
        (f.cfg_if."0.1.10"."core" or false) ||
        (f.cfg_if."0.1.10".rustc-dep-of-std or false) ||
        (cfg_if."0.1.10"."rustc-dep-of-std" or false); }
      { "0.1.10".default = (f.cfg_if."0.1.10".default or true); }
    ];
  }) [];


# end
# cookie-0.11.1

  crates.cookie."0.11.1" = deps: { features?(features_.cookie."0.11.1" deps {}) }: buildRustCrate {
    crateName = "cookie";
    version = "0.11.1";
    description = "Crate for parsing HTTP cookie headers and managing a cookie jar. Supports signed\nand private (encrypted + signed) jars.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "Sergio Benitez <sb@sergio.bz>" ];
    sha256 = "0crs2ph9kb7kmxmr3mgy6wwdqns32sfdcjws7f8km9qvrsdx40pk";
    dependencies = mapFeatures features ([
      (crates."time"."${deps."cookie"."0.11.1"."time"}" deps)
    ]
      ++ (if features.cookie."0.11.1".base64 or false then [ (crates.base64."${deps."cookie"."0.11.1".base64}" deps) ] else [])
      ++ (if features.cookie."0.11.1".ring or false then [ (crates.ring."${deps."cookie"."0.11.1".ring}" deps) ] else [])
      ++ (if features.cookie."0.11.1".url or false then [ (crates.url."${deps."cookie"."0.11.1".url}" deps) ] else []));
    features = mkFeatures (features."cookie"."0.11.1" or {});
  };
  features_.cookie."0.11.1" = deps: f: updateFeatures f (rec {
    base64."${deps.cookie."0.11.1".base64}".default = true;
    cookie = fold recursiveUpdate {} [
      { "0.11.1"."base64" =
        (f.cookie."0.11.1"."base64" or false) ||
        (f.cookie."0.11.1".secure or false) ||
        (cookie."0.11.1"."secure" or false); }
      { "0.11.1"."ring" =
        (f.cookie."0.11.1"."ring" or false) ||
        (f.cookie."0.11.1".secure or false) ||
        (cookie."0.11.1"."secure" or false); }
      { "0.11.1"."url" =
        (f.cookie."0.11.1"."url" or false) ||
        (f.cookie."0.11.1".percent-encode or false) ||
        (cookie."0.11.1"."percent-encode" or false); }
      { "0.11.1".default = (f.cookie."0.11.1".default or true); }
    ];
    ring."${deps.cookie."0.11.1".ring}".default = true;
    time."${deps.cookie."0.11.1".time}".default = true;
    url."${deps.cookie."0.11.1".url}".default = true;
  }) [
    (features_.base64."${deps."cookie"."0.11.1"."base64"}" deps)
    (features_.ring."${deps."cookie"."0.11.1"."ring"}" deps)
    (features_.time."${deps."cookie"."0.11.1"."time"}" deps)
    (features_.url."${deps."cookie"."0.11.1"."url"}" deps)
  ];


# end
# devise-0.2.0

  crates.devise."0.2.0" = deps: { features?(features_.devise."0.2.0" deps {}) }: buildRustCrate {
    crateName = "devise";
    version = "0.2.0";
    description = "A library for devising derives and other procedural macros.";
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
    description = "A library for devising derives and other procedural macros.";
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
    description = "A library for devising derives and other procedural macros.";
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
# docopt-1.1.0

  crates.docopt."1.1.0" = deps: { features?(features_.docopt."1.1.0" deps {}) }: buildRustCrate {
    crateName = "docopt";
    version = "1.1.0";
    description = "Command line argument parsing.";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    edition = "2018";
    sha256 = "1xjvfw8398qcxwhdmak1bw2j6zn125ch24dmrmghv50vnlbb997x";
    crateBin =
      [{  name = "docopt-wordlist";  path = "src/wordlist.rs"; }];
    dependencies = mapFeatures features ([
      (crates."lazy_static"."${deps."docopt"."1.1.0"."lazy_static"}" deps)
      (crates."regex"."${deps."docopt"."1.1.0"."regex"}" deps)
      (crates."serde"."${deps."docopt"."1.1.0"."serde"}" deps)
      (crates."strsim"."${deps."docopt"."1.1.0"."strsim"}" deps)
    ]);
  };
  features_.docopt."1.1.0" = deps: f: updateFeatures f (rec {
    docopt."1.1.0".default = (f.docopt."1.1.0".default or true);
    lazy_static."${deps.docopt."1.1.0".lazy_static}".default = true;
    regex."${deps.docopt."1.1.0".regex}".default = true;
    serde = fold recursiveUpdate {} [
      { "${deps.docopt."1.1.0".serde}"."derive" = true; }
      { "${deps.docopt."1.1.0".serde}".default = true; }
    ];
    strsim."${deps.docopt."1.1.0".strsim}".default = true;
  }) [
    (features_.lazy_static."${deps."docopt"."1.1.0"."lazy_static"}" deps)
    (features_.regex."${deps."docopt"."1.1.0"."regex"}" deps)
    (features_.serde."${deps."docopt"."1.1.0"."serde"}" deps)
    (features_.strsim."${deps."docopt"."1.1.0"."strsim"}" deps)
  ];


# end
# filetime-0.2.7

  crates.filetime."0.2.7" = deps: { features?(features_.filetime."0.2.7" deps {}) }: buildRustCrate {
    crateName = "filetime";
    version = "0.2.7";
    description = "Platform-agnostic accessors of timestamps in File metadata\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    edition = "2018";
    sha256 = "10rd6xpgjmcjnlhi02g0awirwn537andfq79jgz7p0cc64gc5mny";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."filetime"."0.2.7"."cfg_if"}" deps)
    ])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."filetime"."0.2.7"."redox_syscall"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."filetime"."0.2.7"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."filetime"."0.2.7"."winapi"}" deps)
    ]) else []);
  };
  features_.filetime."0.2.7" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.filetime."0.2.7".cfg_if}".default = true;
    filetime."0.2.7".default = (f.filetime."0.2.7".default or true);
    libc."${deps.filetime."0.2.7".libc}".default = true;
    redox_syscall."${deps.filetime."0.2.7".redox_syscall}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.filetime."0.2.7".winapi}"."fileapi" = true; }
      { "${deps.filetime."0.2.7".winapi}"."minwindef" = true; }
      { "${deps.filetime."0.2.7".winapi}"."winbase" = true; }
      { "${deps.filetime."0.2.7".winapi}".default = true; }
    ];
  }) [
    (features_.cfg_if."${deps."filetime"."0.2.7"."cfg_if"}" deps)
    (features_.redox_syscall."${deps."filetime"."0.2.7"."redox_syscall"}" deps)
    (features_.libc."${deps."filetime"."0.2.7"."libc"}" deps)
    (features_.winapi."${deps."filetime"."0.2.7"."winapi"}" deps)
  ];


# end
# fsevent-0.4.0

  crates.fsevent."0.4.0" = deps: { features?(features_.fsevent."0.4.0" deps {}) }: buildRustCrate {
    crateName = "fsevent";
    version = "0.4.0";
    description = "Rust bindings to the fsevent-sys macOS API for file changes notifications";
    authors = [ "Pierre Baillet <pierre@baillet.name>" ];
    sha256 = "19wynmx2k8gmsxv6fa9kpjzb9v5k6qc2ykziw25bray645spg77v";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."fsevent"."0.4.0"."bitflags"}" deps)
      (crates."fsevent_sys"."${deps."fsevent"."0.4.0"."fsevent_sys"}" deps)
    ]);
  };
  features_.fsevent."0.4.0" = deps: f: updateFeatures f (rec {
    bitflags."${deps.fsevent."0.4.0".bitflags}".default = true;
    fsevent."0.4.0".default = (f.fsevent."0.4.0".default or true);
    fsevent_sys."${deps.fsevent."0.4.0".fsevent_sys}".default = true;
  }) [
    (features_.bitflags."${deps."fsevent"."0.4.0"."bitflags"}" deps)
    (features_.fsevent_sys."${deps."fsevent"."0.4.0"."fsevent_sys"}" deps)
  ];


# end
# fsevent-sys-2.0.1

  crates.fsevent_sys."2.0.1" = deps: { features?(features_.fsevent_sys."2.0.1" deps {}) }: buildRustCrate {
    crateName = "fsevent-sys";
    version = "2.0.1";
    description = "Rust bindings to the fsevent macOS API for file changes notifications";
    authors = [ "Pierre Baillet <pierre@baillet.name>" ];
    sha256 = "1jlnqp6iw4mmwd2f973j33k00mbfc1cv9wpdvxq1jk3bry558gbr";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."fsevent_sys"."2.0.1"."libc"}" deps)
    ]);
  };
  features_.fsevent_sys."2.0.1" = deps: f: updateFeatures f (rec {
    fsevent_sys."2.0.1".default = (f.fsevent_sys."2.0.1".default or true);
    libc."${deps.fsevent_sys."2.0.1".libc}".default = true;
  }) [
    (features_.libc."${deps."fsevent_sys"."2.0.1"."libc"}" deps)
  ];


# end
# fuchsia-zircon-0.3.3

  crates.fuchsia_zircon."0.3.3" = deps: { features?(features_.fuchsia_zircon."0.3.3" deps {}) }: buildRustCrate {
    crateName = "fuchsia-zircon";
    version = "0.3.3";
    description = "Rust bindings for the Zircon kernel";
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
    description = "Low-level Rust bindings for the Zircon kernel";
    authors = [ "Raph Levien <raph@google.com>" ];
    sha256 = "08jp1zxrm9jbrr6l26bjal4dbm8bxfy57ickdgibsqxr1n9j3hf5";
  };
  features_.fuchsia_zircon_sys."0.3.3" = deps: f: updateFeatures f (rec {
    fuchsia_zircon_sys."0.3.3".default = (f.fuchsia_zircon_sys."0.3.3".default or true);
  }) [];


# end
# getrandom-0.1.12

  crates.getrandom."0.1.12" = deps: { features?(features_.getrandom."0.1.12" deps {}) }: buildRustCrate {
    crateName = "getrandom";
    version = "0.1.12";
    description = "A small cross-platform library for retrieving random data from system source";
    authors = [ "The Rand Project Developers" ];
    edition = "2018";
    sha256 = "0n3cyf8vm82hbbj6xzgaszjn852i0jl9qxibl7im7mvn7s9yrvb6";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."getrandom"."0.1.12"."cfg_if"}" deps)
    ])
      ++ (if (kernel == "linux" || kernel == "darwin") || kernel == "redox" then mapFeatures features ([
      (crates."libc"."${deps."getrandom"."0.1.12"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "wasi" then mapFeatures features ([
      (crates."wasi"."${deps."getrandom"."0.1.12"."wasi"}" deps)
    ]) else [])
      ++ (if kernel == "wasm32-unknown-unknown" then mapFeatures features ([
]) else []);
    features = mkFeatures (features."getrandom"."0.1.12" or {});
  };
  features_.getrandom."0.1.12" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.getrandom."0.1.12".cfg_if}".default = true;
    getrandom = fold recursiveUpdate {} [
      { "0.1.12"."compiler_builtins" =
        (f.getrandom."0.1.12"."compiler_builtins" or false) ||
        (f.getrandom."0.1.12".rustc-dep-of-std or false) ||
        (getrandom."0.1.12"."rustc-dep-of-std" or false); }
      { "0.1.12"."core" =
        (f.getrandom."0.1.12"."core" or false) ||
        (f.getrandom."0.1.12".rustc-dep-of-std or false) ||
        (getrandom."0.1.12"."rustc-dep-of-std" or false); }
      { "0.1.12".default = (f.getrandom."0.1.12".default or true); }
    ];
    libc."${deps.getrandom."0.1.12".libc}".default = (f.libc."${deps.getrandom."0.1.12".libc}".default or false);
    wasi."${deps.getrandom."0.1.12".wasi}".default = true;
  }) [
    (features_.cfg_if."${deps."getrandom"."0.1.12"."cfg_if"}" deps)
    (features_.libc."${deps."getrandom"."0.1.12"."libc"}" deps)
    (features_.wasi."${deps."getrandom"."0.1.12"."wasi"}" deps)
  ];


# end
# git2-0.10.1

  crates.git2."0.10.1" = deps: { features?(features_.git2."0.10.1" deps {}) }: buildRustCrate {
    crateName = "git2";
    version = "0.10.1";
    description = "Bindings to libgit2 for interoperating with git repositories. This library is\nboth threadsafe and memory safe and allows both reading and writing git\nrepositories.\n";
    authors = [ "Josh Triplett <josh@joshtriplett.org>" "Alex Crichton <alex@alexcrichton.com>" ];
    edition = "2018";
    sha256 = "18a4n241m34vb1myyh5ysg3608qaz7x72p2cviylk4gp72vk4alq";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."git2"."0.10.1"."bitflags"}" deps)
      (crates."libc"."${deps."git2"."0.10.1"."libc"}" deps)
      (crates."libgit2_sys"."${deps."git2"."0.10.1"."libgit2_sys"}" deps)
      (crates."log"."${deps."git2"."0.10.1"."log"}" deps)
      (crates."url"."${deps."git2"."0.10.1"."url"}" deps)
    ])
      ++ (if (kernel == "linux" || kernel == "darwin") && !(kernel == "darwin") then mapFeatures features ([
    ]
      ++ (if features.git2."0.10.1".openssl-probe or false then [ (crates.openssl_probe."${deps."git2"."0.10.1".openssl_probe}" deps) ] else [])
      ++ (if features.git2."0.10.1".openssl-sys or false then [ (crates.openssl_sys."${deps."git2"."0.10.1".openssl_sys}" deps) ] else [])) else []);
    features = mkFeatures (features."git2"."0.10.1" or {});
  };
  features_.git2."0.10.1" = deps: f: updateFeatures f (rec {
    bitflags."${deps.git2."0.10.1".bitflags}".default = true;
    git2 = fold recursiveUpdate {} [
      { "0.10.1"."https" =
        (f.git2."0.10.1"."https" or false) ||
        (f.git2."0.10.1".default or false) ||
        (git2."0.10.1"."default" or false); }
      { "0.10.1"."openssl-probe" =
        (f.git2."0.10.1"."openssl-probe" or false) ||
        (f.git2."0.10.1".https or false) ||
        (git2."0.10.1"."https" or false); }
      { "0.10.1"."openssl-sys" =
        (f.git2."0.10.1"."openssl-sys" or false) ||
        (f.git2."0.10.1".https or false) ||
        (git2."0.10.1"."https" or false); }
      { "0.10.1"."ssh" =
        (f.git2."0.10.1"."ssh" or false) ||
        (f.git2."0.10.1".default or false) ||
        (git2."0.10.1"."default" or false); }
      { "0.10.1"."ssh_key_from_memory" =
        (f.git2."0.10.1"."ssh_key_from_memory" or false) ||
        (f.git2."0.10.1".default or false) ||
        (git2."0.10.1"."default" or false); }
      { "0.10.1".default = (f.git2."0.10.1".default or true); }
    ];
    libc."${deps.git2."0.10.1".libc}".default = true;
    libgit2_sys = fold recursiveUpdate {} [
      { "${deps.git2."0.10.1".libgit2_sys}"."https" =
        (f.libgit2_sys."${deps.git2."0.10.1".libgit2_sys}"."https" or false) ||
        (git2."0.10.1"."https" or false) ||
        (f."git2"."0.10.1"."https" or false); }
      { "${deps.git2."0.10.1".libgit2_sys}"."ssh" =
        (f.libgit2_sys."${deps.git2."0.10.1".libgit2_sys}"."ssh" or false) ||
        (git2."0.10.1"."ssh" or false) ||
        (f."git2"."0.10.1"."ssh" or false); }
      { "${deps.git2."0.10.1".libgit2_sys}"."ssh_key_from_memory" =
        (f.libgit2_sys."${deps.git2."0.10.1".libgit2_sys}"."ssh_key_from_memory" or false) ||
        (git2."0.10.1"."ssh_key_from_memory" or false) ||
        (f."git2"."0.10.1"."ssh_key_from_memory" or false); }
      { "${deps.git2."0.10.1".libgit2_sys}".default = true; }
    ];
    log."${deps.git2."0.10.1".log}".default = true;
    openssl_probe."${deps.git2."0.10.1".openssl_probe}".default = true;
    openssl_sys."${deps.git2."0.10.1".openssl_sys}".default = true;
    url."${deps.git2."0.10.1".url}".default = true;
  }) [
    (features_.bitflags."${deps."git2"."0.10.1"."bitflags"}" deps)
    (features_.libc."${deps."git2"."0.10.1"."libc"}" deps)
    (features_.libgit2_sys."${deps."git2"."0.10.1"."libgit2_sys"}" deps)
    (features_.log."${deps."git2"."0.10.1"."log"}" deps)
    (features_.url."${deps."git2"."0.10.1"."url"}" deps)
    (features_.openssl_probe."${deps."git2"."0.10.1"."openssl_probe"}" deps)
    (features_.openssl_sys."${deps."git2"."0.10.1"."openssl_sys"}" deps)
  ];


# end
# httparse-1.3.4

  crates.httparse."1.3.4" = deps: { features?(features_.httparse."1.3.4" deps {}) }: buildRustCrate {
    crateName = "httparse";
    version = "1.3.4";
    description = "A tiny, safe, speedy, zero-copy HTTP/1.x parser.";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "0dggj4s0cq69bn63q9nqzzay5acmwl33nrbhjjsh5xys8sk2x4jw";
    build = "build.rs";
    features = mkFeatures (features."httparse"."1.3.4" or {});
  };
  features_.httparse."1.3.4" = deps: f: updateFeatures f (rec {
    httparse = fold recursiveUpdate {} [
      { "1.3.4"."std" =
        (f.httparse."1.3.4"."std" or false) ||
        (f.httparse."1.3.4".default or false) ||
        (httparse."1.3.4"."default" or false); }
      { "1.3.4".default = (f.httparse."1.3.4".default or true); }
    ];
  }) [];


# end
# hyper-0.10.16

  crates.hyper."0.10.16" = deps: { features?(features_.hyper."0.10.16" deps {}) }: buildRustCrate {
    crateName = "hyper";
    version = "0.10.16";
    description = "A modern HTTP library.";
    authors = [ "Sean McArthur <sean.monstar@gmail.com>" "Jonathan Reem <jonathan.reem@gmail.com>" ];
    sha256 = "078jqmrjk7gdrfqjnydhyh8vb93vr4zymid84l7x67abary947x5";
    dependencies = mapFeatures features ([
      (crates."base64"."${deps."hyper"."0.10.16"."base64"}" deps)
      (crates."httparse"."${deps."hyper"."0.10.16"."httparse"}" deps)
      (crates."language_tags"."${deps."hyper"."0.10.16"."language_tags"}" deps)
      (crates."log"."${deps."hyper"."0.10.16"."log"}" deps)
      (crates."mime"."${deps."hyper"."0.10.16"."mime"}" deps)
      (crates."num_cpus"."${deps."hyper"."0.10.16"."num_cpus"}" deps)
      (crates."time"."${deps."hyper"."0.10.16"."time"}" deps)
      (crates."traitobject"."${deps."hyper"."0.10.16"."traitobject"}" deps)
      (crates."typeable"."${deps."hyper"."0.10.16"."typeable"}" deps)
      (crates."unicase"."${deps."hyper"."0.10.16"."unicase"}" deps)
      (crates."url"."${deps."hyper"."0.10.16"."url"}" deps)
    ]);
    features = mkFeatures (features."hyper"."0.10.16" or {});
  };
  features_.hyper."0.10.16" = deps: f: updateFeatures f (rec {
    base64."${deps.hyper."0.10.16".base64}".default = true;
    httparse."${deps.hyper."0.10.16".httparse}".default = true;
    hyper."0.10.16".default = (f.hyper."0.10.16".default or true);
    language_tags."${deps.hyper."0.10.16".language_tags}".default = true;
    log."${deps.hyper."0.10.16".log}".default = true;
    mime."${deps.hyper."0.10.16".mime}".default = true;
    num_cpus."${deps.hyper."0.10.16".num_cpus}".default = true;
    time."${deps.hyper."0.10.16".time}".default = true;
    traitobject."${deps.hyper."0.10.16".traitobject}".default = true;
    typeable."${deps.hyper."0.10.16".typeable}".default = true;
    unicase."${deps.hyper."0.10.16".unicase}".default = true;
    url."${deps.hyper."0.10.16".url}".default = true;
  }) [
    (features_.base64."${deps."hyper"."0.10.16"."base64"}" deps)
    (features_.httparse."${deps."hyper"."0.10.16"."httparse"}" deps)
    (features_.language_tags."${deps."hyper"."0.10.16"."language_tags"}" deps)
    (features_.log."${deps."hyper"."0.10.16"."log"}" deps)
    (features_.mime."${deps."hyper"."0.10.16"."mime"}" deps)
    (features_.num_cpus."${deps."hyper"."0.10.16"."num_cpus"}" deps)
    (features_.time."${deps."hyper"."0.10.16"."time"}" deps)
    (features_.traitobject."${deps."hyper"."0.10.16"."traitobject"}" deps)
    (features_.typeable."${deps."hyper"."0.10.16"."typeable"}" deps)
    (features_.unicase."${deps."hyper"."0.10.16"."unicase"}" deps)
    (features_.url."${deps."hyper"."0.10.16"."url"}" deps)
  ];


# end
# idna-0.1.5

  crates.idna."0.1.5" = deps: { features?(features_.idna."0.1.5" deps {}) }: buildRustCrate {
    crateName = "idna";
    version = "0.1.5";
    description = "IDNA (Internationalizing Domain Names in Applications) and Punycode.";
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
# idna-0.2.0

  crates.idna."0.2.0" = deps: { features?(features_.idna."0.2.0" deps {}) }: buildRustCrate {
    crateName = "idna";
    version = "0.2.0";
    description = "IDNA (Internationalizing Domain Names in Applications) and Punycode.";
    authors = [ "The rust-url developers" ];
    sha256 = "1mm05aq43qc5n492njnac5xn4rhiraii25xc0hwppr471jzijh8d";
    dependencies = mapFeatures features ([
      (crates."matches"."${deps."idna"."0.2.0"."matches"}" deps)
      (crates."unicode_bidi"."${deps."idna"."0.2.0"."unicode_bidi"}" deps)
      (crates."unicode_normalization"."${deps."idna"."0.2.0"."unicode_normalization"}" deps)
    ]);
  };
  features_.idna."0.2.0" = deps: f: updateFeatures f (rec {
    idna."0.2.0".default = (f.idna."0.2.0".default or true);
    matches."${deps.idna."0.2.0".matches}".default = true;
    unicode_bidi."${deps.idna."0.2.0".unicode_bidi}".default = true;
    unicode_normalization."${deps.idna."0.2.0".unicode_normalization}".default = true;
  }) [
    (features_.matches."${deps."idna"."0.2.0"."matches"}" deps)
    (features_.unicode_bidi."${deps."idna"."0.2.0"."unicode_bidi"}" deps)
    (features_.unicode_normalization."${deps."idna"."0.2.0"."unicode_normalization"}" deps)
  ];


# end
# indexmap-1.3.0

  crates.indexmap."1.3.0" = deps: { features?(features_.indexmap."1.3.0" deps {}) }: buildRustCrate {
    crateName = "indexmap";
    version = "1.3.0";
    description = "A hash table with consistent order and fast iteration.\n\nThe indexmap is a hash table where the iteration order of the key-value\npairs is independent of the hash values of the keys. It has the usual\nhash table functionality, it preserves insertion order except after\nremovals, and it allows lookup of its elements by either hash table key\nor numerical index. A corresponding hash set type is also provided.\n\nThis crate was initially published under the name ordermap, but it was renamed to\nindexmap.\n";
    authors = [ "bluss" "Josh Stone <cuviper@gmail.com>" ];
    sha256 = "1knhahhjjh3m2m8dkhshcq979f350csidqfv07wxf2ap43j5fhsq";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."indexmap"."1.3.0"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."indexmap"."1.3.0" or {});
  };
  features_.indexmap."1.3.0" = deps: f: updateFeatures f (rec {
    autocfg."${deps.indexmap."1.3.0".autocfg}".default = true;
    indexmap = fold recursiveUpdate {} [
      { "1.3.0"."serde" =
        (f.indexmap."1.3.0"."serde" or false) ||
        (f.indexmap."1.3.0".serde-1 or false) ||
        (indexmap."1.3.0"."serde-1" or false); }
      { "1.3.0".default = (f.indexmap."1.3.0".default or true); }
    ];
  }) [
    (features_.autocfg."${deps."indexmap"."1.3.0"."autocfg"}" deps)
  ];


# end
# inotify-0.6.1

  crates.inotify."0.6.1" = deps: { features?(features_.inotify."0.6.1" deps {}) }: buildRustCrate {
    crateName = "inotify";
    version = "0.6.1";
    description = "Idiomatic wrapper for inotify";
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
      { "0.6.1"."futures" =
        (f.inotify."0.6.1"."futures" or false) ||
        (f.inotify."0.6.1".stream or false) ||
        (inotify."0.6.1"."stream" or false); }
      { "0.6.1"."mio" =
        (f.inotify."0.6.1"."mio" or false) ||
        (f.inotify."0.6.1".stream or false) ||
        (inotify."0.6.1"."stream" or false); }
      { "0.6.1"."stream" =
        (f.inotify."0.6.1"."stream" or false) ||
        (f.inotify."0.6.1".default or false) ||
        (inotify."0.6.1"."default" or false); }
      { "0.6.1"."tokio-io" =
        (f.inotify."0.6.1"."tokio-io" or false) ||
        (f.inotify."0.6.1".stream or false) ||
        (inotify."0.6.1"."stream" or false); }
      { "0.6.1"."tokio-reactor" =
        (f.inotify."0.6.1"."tokio-reactor" or false) ||
        (f.inotify."0.6.1".stream or false) ||
        (inotify."0.6.1"."stream" or false); }
      { "0.6.1".default = (f.inotify."0.6.1".default or true); }
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
    description = "inotify bindings for the Rust programming language";
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
# iovec-0.1.4

  crates.iovec."0.1.4" = deps: { features?(features_.iovec."0.1.4" deps {}) }: buildRustCrate {
    crateName = "iovec";
    version = "0.1.4";
    description = "Portable buffer type for scatter/gather I/O operations\n";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "1wy7rsm8rx6y4rjy98jws1aqxdy0v5wbz9whz73p45cwpsg4prfa";
    dependencies = (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."iovec"."0.1.4"."libc"}" deps)
    ]) else []);
  };
  features_.iovec."0.1.4" = deps: f: updateFeatures f (rec {
    iovec."0.1.4".default = (f.iovec."0.1.4".default or true);
    libc."${deps.iovec."0.1.4".libc}".default = true;
  }) [
    (features_.libc."${deps."iovec"."0.1.4"."libc"}" deps)
  ];


# end
# ipnet-2.0.1

  crates.ipnet."2.0.1" = deps: { features?(features_.ipnet."2.0.1" deps {}) }: buildRustCrate {
    crateName = "ipnet";
    version = "2.0.1";
    description = "Provides types and useful methods for working with IPv4 and IPv6 network addresses, commonly called IP prefixes. The new `IpNet`, `Ipv4Net`, and `Ipv6Net` types build on the existing `IpAddr`, `Ipv4Addr`, and `Ipv6Addr` types already provided in Rust's standard library and align to their design to stay consistent. The module also provides useful traits that extend `Ipv4Addr` and `Ipv6Addr` with methods for `Add`, `Sub`, `BitAnd`, and `BitOr` operations. The module only uses stable feature so it is guaranteed to compile using the stable toolchain.";
    authors = [ "Kris Price <kris@krisprice.nz>" ];
    sha256 = "08f63i64k8wm3x4b170bh69rsabl43p6ikxz9bsknwar4z6zfqbv";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.ipnet."2.0.1".serde or false then [ (crates.serde."${deps."ipnet"."2.0.1".serde}" deps) ] else []));
    features = mkFeatures (features."ipnet"."2.0.1" or {});
  };
  features_.ipnet."2.0.1" = deps: f: updateFeatures f (rec {
    ipnet."2.0.1".default = (f.ipnet."2.0.1".default or true);
    serde = fold recursiveUpdate {} [
      { "${deps.ipnet."2.0.1".serde}"."derive" = true; }
      { "${deps.ipnet."2.0.1".serde}".default = true; }
    ];
  }) [
    (features_.serde."${deps."ipnet"."2.0.1"."serde"}" deps)
  ];


# end
# itoa-0.4.4

  crates.itoa."0.4.4" = deps: { features?(features_.itoa."0.4.4" deps {}) }: buildRustCrate {
    crateName = "itoa";
    version = "0.4.4";
    description = "Fast functions for printing integer primitives to an io::Write";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "1fqc34xzzl2spfdawxd9awhzl0fwf1y6y4i94l8bq8rfrzd90awl";
    features = mkFeatures (features."itoa"."0.4.4" or {});
  };
  features_.itoa."0.4.4" = deps: f: updateFeatures f (rec {
    itoa = fold recursiveUpdate {} [
      { "0.4.4"."std" =
        (f.itoa."0.4.4"."std" or false) ||
        (f.itoa."0.4.4".default or false) ||
        (itoa."0.4.4"."default" or false); }
      { "0.4.4".default = (f.itoa."0.4.4".default or true); }
    ];
  }) [];


# end
# jobserver-0.1.17

  crates.jobserver."0.1.17" = deps: { features?(features_.jobserver."0.1.17" deps {}) }: buildRustCrate {
    crateName = "jobserver";
    version = "0.1.17";
    description = "An implementation of the GNU make jobserver for Rust\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0qazd61l3zgnchzrr9gkvvdzdz1d6g8xrc2skac5qa0ykd1yblyx";
    dependencies = mapFeatures features ([
      (crates."log"."${deps."jobserver"."0.1.17"."log"}" deps)
    ])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."jobserver"."0.1.17"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."getrandom"."${deps."jobserver"."0.1.17"."getrandom"}" deps)
    ]) else []);
  };
  features_.jobserver."0.1.17" = deps: f: updateFeatures f (rec {
    getrandom."${deps.jobserver."0.1.17".getrandom}".default = true;
    jobserver."0.1.17".default = (f.jobserver."0.1.17".default or true);
    libc."${deps.jobserver."0.1.17".libc}".default = true;
    log."${deps.jobserver."0.1.17".log}".default = true;
  }) [
    (features_.log."${deps."jobserver"."0.1.17"."log"}" deps)
    (features_.libc."${deps."jobserver"."0.1.17"."libc"}" deps)
    (features_.getrandom."${deps."jobserver"."0.1.17"."getrandom"}" deps)
  ];


# end
# kernel32-sys-0.2.2

  crates.kernel32_sys."0.2.2" = deps: { features?(features_.kernel32_sys."0.2.2" deps {}) }: buildRustCrate {
    crateName = "kernel32-sys";
    version = "0.2.2";
    description = "Contains function definitions for the Windows API library kernel32. See winapi for types and constants.";
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
    description = "Language tags for Rust";
    authors = [ "Pyfisch <pyfisch@gmail.com>" ];
    sha256 = "1zkrdzsqzzc7509kd7nngdwrp461glm2g09kqpzaqksp82frjdvy";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."language_tags"."0.2.2" or {});
  };
  features_.language_tags."0.2.2" = deps: f: updateFeatures f (rec {
    language_tags = fold recursiveUpdate {} [
      { "0.2.2"."heapsize" =
        (f.language_tags."0.2.2"."heapsize" or false) ||
        (f.language_tags."0.2.2".heap_size or false) ||
        (language_tags."0.2.2"."heap_size" or false); }
      { "0.2.2"."heapsize_plugin" =
        (f.language_tags."0.2.2"."heapsize_plugin" or false) ||
        (f.language_tags."0.2.2".heap_size or false) ||
        (language_tags."0.2.2"."heap_size" or false); }
      { "0.2.2".default = (f.language_tags."0.2.2".default or true); }
    ];
  }) [];


# end
# lazy_static-1.4.0

  crates.lazy_static."1.4.0" = deps: { features?(features_.lazy_static."1.4.0" deps {}) }: buildRustCrate {
    crateName = "lazy_static";
    version = "1.4.0";
    description = "A macro for declaring lazily evaluated statics in Rust.";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "13h6sdghdcy7vcqsm2gasfw3qg7ssa0fl3sw7lq6pdkbk52wbyfr";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."lazy_static"."1.4.0" or {});
  };
  features_.lazy_static."1.4.0" = deps: f: updateFeatures f (rec {
    lazy_static = fold recursiveUpdate {} [
      { "1.4.0"."spin" =
        (f.lazy_static."1.4.0"."spin" or false) ||
        (f.lazy_static."1.4.0".spin_no_std or false) ||
        (lazy_static."1.4.0"."spin_no_std" or false); }
      { "1.4.0".default = (f.lazy_static."1.4.0".default or true); }
    ];
  }) [];


# end
# lazycell-1.2.1

  crates.lazycell."1.2.1" = deps: { features?(features_.lazycell."1.2.1" deps {}) }: buildRustCrate {
    crateName = "lazycell";
    version = "1.2.1";
    description = "A library providing a lazily filled Cell struct";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "Nikita Pekin <contact@nikitapek.in>" ];
    sha256 = "1m4h2q9rgxrgc7xjnws1x81lrb68jll8w3pykx1a9bhr29q2mcwm";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."lazycell"."1.2.1" or {});
  };
  features_.lazycell."1.2.1" = deps: f: updateFeatures f (rec {
    lazycell = fold recursiveUpdate {} [
      { "1.2.1"."clippy" =
        (f.lazycell."1.2.1"."clippy" or false) ||
        (f.lazycell."1.2.1".nightly-testing or false) ||
        (lazycell."1.2.1"."nightly-testing" or false); }
      { "1.2.1"."nightly" =
        (f.lazycell."1.2.1"."nightly" or false) ||
        (f.lazycell."1.2.1".nightly-testing or false) ||
        (lazycell."1.2.1"."nightly-testing" or false); }
      { "1.2.1".default = (f.lazycell."1.2.1".default or true); }
    ];
  }) [];


# end
# libc-0.2.65

  crates.libc."0.2.65" = deps: { features?(features_.libc."0.2.65" deps {}) }: buildRustCrate {
    crateName = "libc";
    version = "0.2.65";
    description = "Raw FFI bindings to platform libraries like libc.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "0nx1n3xvwj2ikw1d6v17154jx2sb9sgrv6fwbnq79c614a3mhmad";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."libc"."0.2.65" or {});
  };
  features_.libc."0.2.65" = deps: f: updateFeatures f (rec {
    libc = fold recursiveUpdate {} [
      { "0.2.65"."align" =
        (f.libc."0.2.65"."align" or false) ||
        (f.libc."0.2.65".rustc-dep-of-std or false) ||
        (libc."0.2.65"."rustc-dep-of-std" or false); }
      { "0.2.65"."rustc-std-workspace-core" =
        (f.libc."0.2.65"."rustc-std-workspace-core" or false) ||
        (f.libc."0.2.65".rustc-dep-of-std or false) ||
        (libc."0.2.65"."rustc-dep-of-std" or false); }
      { "0.2.65"."std" =
        (f.libc."0.2.65"."std" or false) ||
        (f.libc."0.2.65".default or false) ||
        (libc."0.2.65"."default" or false) ||
        (f.libc."0.2.65".use_std or false) ||
        (libc."0.2.65"."use_std" or false); }
      { "0.2.65".default = (f.libc."0.2.65".default or true); }
    ];
  }) [];


# end
# libgit2-sys-0.9.1

  crates.libgit2_sys."0.9.1" = deps: { features?(features_.libgit2_sys."0.9.1" deps {}) }: buildRustCrate {
    crateName = "libgit2-sys";
    version = "0.9.1";
    description = "Native bindings to the libgit2 library";
    authors = [ "Josh Triplett <josh@joshtriplett.org>" "Alex Crichton <alex@alexcrichton.com>" ];
    edition = "2018";
    sha256 = "08cc5k5w9h1gp411lgnz3q7n3bhl4vq6a54bbnalwqqx9i4scb6x";
    libPath = "lib.rs";
    libName = "libgit2_sys";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."libgit2_sys"."0.9.1"."libc"}" deps)
      (crates."libz_sys"."${deps."libgit2_sys"."0.9.1"."libz_sys"}" deps)
    ]
      ++ (if features.libgit2_sys."0.9.1".libssh2-sys or false then [ (crates.libssh2_sys."${deps."libgit2_sys"."0.9.1".libssh2_sys}" deps) ] else []))
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
    ]
      ++ (if features.libgit2_sys."0.9.1".openssl-sys or false then [ (crates.openssl_sys."${deps."libgit2_sys"."0.9.1".openssl_sys}" deps) ] else [])) else []);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."libgit2_sys"."0.9.1"."cc"}" deps)
      (crates."pkg_config"."${deps."libgit2_sys"."0.9.1"."pkg_config"}" deps)
    ]);
    features = mkFeatures (features."libgit2_sys"."0.9.1" or {});
  };
  features_.libgit2_sys."0.9.1" = deps: f: updateFeatures f (rec {
    cc = fold recursiveUpdate {} [
      { "${deps.libgit2_sys."0.9.1".cc}"."parallel" = true; }
      { "${deps.libgit2_sys."0.9.1".cc}".default = true; }
    ];
    libc."${deps.libgit2_sys."0.9.1".libc}".default = true;
    libgit2_sys = fold recursiveUpdate {} [
      { "0.9.1"."libssh2-sys" =
        (f.libgit2_sys."0.9.1"."libssh2-sys" or false) ||
        (f.libgit2_sys."0.9.1".ssh or false) ||
        (libgit2_sys."0.9.1"."ssh" or false); }
      { "0.9.1"."openssl-sys" =
        (f.libgit2_sys."0.9.1"."openssl-sys" or false) ||
        (f.libgit2_sys."0.9.1".https or false) ||
        (libgit2_sys."0.9.1"."https" or false); }
      { "0.9.1".default = (f.libgit2_sys."0.9.1".default or true); }
    ];
    libssh2_sys."${deps.libgit2_sys."0.9.1".libssh2_sys}".default = true;
    libz_sys."${deps.libgit2_sys."0.9.1".libz_sys}".default = true;
    openssl_sys."${deps.libgit2_sys."0.9.1".openssl_sys}".default = true;
    pkg_config."${deps.libgit2_sys."0.9.1".pkg_config}".default = true;
  }) [
    (features_.libc."${deps."libgit2_sys"."0.9.1"."libc"}" deps)
    (features_.libssh2_sys."${deps."libgit2_sys"."0.9.1"."libssh2_sys"}" deps)
    (features_.libz_sys."${deps."libgit2_sys"."0.9.1"."libz_sys"}" deps)
    (features_.cc."${deps."libgit2_sys"."0.9.1"."cc"}" deps)
    (features_.pkg_config."${deps."libgit2_sys"."0.9.1"."pkg_config"}" deps)
    (features_.openssl_sys."${deps."libgit2_sys"."0.9.1"."openssl_sys"}" deps)
  ];


# end
# libssh2-sys-0.2.13

  crates.libssh2_sys."0.2.13" = deps: { features?(features_.libssh2_sys."0.2.13" deps {}) }: buildRustCrate {
    crateName = "libssh2-sys";
    version = "0.2.13";
    description = "Native bindings to the libssh2 library";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "Wez Furlong <wez@wezfurlong.org>" ];
    sha256 = "0zvr6p6qg3a9f90cvmv94rva600v38ljj7ank9p5528ykfyygxwk";
    libPath = "lib.rs";
    libName = "libssh2_sys";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."libssh2_sys"."0.2.13"."libc"}" deps)
      (crates."libz_sys"."${deps."libssh2_sys"."0.2.13"."libz_sys"}" deps)
    ])
      ++ (if abi == "msvc" then mapFeatures features ([
]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."openssl_sys"."${deps."libssh2_sys"."0.2.13"."openssl_sys"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."libssh2_sys"."0.2.13"."cc"}" deps)
      (crates."pkg_config"."${deps."libssh2_sys"."0.2.13"."pkg_config"}" deps)
    ]);
    features = mkFeatures (features."libssh2_sys"."0.2.13" or {});
  };
  features_.libssh2_sys."0.2.13" = deps: f: updateFeatures f (rec {
    cc."${deps.libssh2_sys."0.2.13".cc}".default = true;
    libc."${deps.libssh2_sys."0.2.13".libc}".default = true;
    libssh2_sys."0.2.13".default = (f.libssh2_sys."0.2.13".default or true);
    libz_sys."${deps.libssh2_sys."0.2.13".libz_sys}".default = true;
    openssl_sys."${deps.libssh2_sys."0.2.13".openssl_sys}".default = true;
    pkg_config."${deps.libssh2_sys."0.2.13".pkg_config}".default = true;
  }) [
    (features_.libc."${deps."libssh2_sys"."0.2.13"."libc"}" deps)
    (features_.libz_sys."${deps."libssh2_sys"."0.2.13"."libz_sys"}" deps)
    (features_.cc."${deps."libssh2_sys"."0.2.13"."cc"}" deps)
    (features_.pkg_config."${deps."libssh2_sys"."0.2.13"."pkg_config"}" deps)
    (features_.openssl_sys."${deps."libssh2_sys"."0.2.13"."openssl_sys"}" deps)
  ];


# end
# libz-sys-1.0.25

  crates.libz_sys."1.0.25" = deps: { features?(features_.libz_sys."1.0.25" deps {}) }: buildRustCrate {
    crateName = "libz-sys";
    version = "1.0.25";
    description = "Bindings to the system libz library (also known as zlib).\n";
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
    description = "A lightweight logging facade for Rust\n";
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
      { "0.3.9"."use_std" =
        (f.log."0.3.9"."use_std" or false) ||
        (f.log."0.3.9".default or false) ||
        (log."0.3.9"."default" or false); }
      { "0.3.9".default = (f.log."0.3.9".default or true); }
    ];
  }) [
    (features_.log."${deps."log"."0.3.9"."log"}" deps)
  ];


# end
# log-0.4.8

  crates.log."0.4.8" = deps: { features?(features_.log."0.4.8" deps {}) }: buildRustCrate {
    crateName = "log";
    version = "0.4.8";
    description = "A lightweight logging facade for Rust\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "0wvzzzcn89dai172rrqcyz06pzldyyy0lf0w71csmn206rdpnb15";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."log"."0.4.8"."cfg_if"}" deps)
    ]);
    features = mkFeatures (features."log"."0.4.8" or {});
  };
  features_.log."0.4.8" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.log."0.4.8".cfg_if}".default = true;
    log = fold recursiveUpdate {} [
      { "0.4.8"."kv_unstable" =
        (f.log."0.4.8"."kv_unstable" or false) ||
        (f.log."0.4.8".kv_unstable_sval or false) ||
        (log."0.4.8"."kv_unstable_sval" or false); }
      { "0.4.8".default = (f.log."0.4.8".default or true); }
    ];
  }) [
    (features_.cfg_if."${deps."log"."0.4.8"."cfg_if"}" deps)
  ];


# end
# matches-0.1.8

  crates.matches."0.1.8" = deps: { features?(features_.matches."0.1.8" deps {}) }: buildRustCrate {
    crateName = "matches";
    version = "0.1.8";
    description = "A macro to evaluate, as a boolean, whether an expression matches a pattern.";
    authors = [ "Simon Sapin <simon.sapin@exyr.org>" ];
    sha256 = "03hl636fg6xggy0a26200xs74amk3k9n0908rga2szn68agyz3cv";
    libPath = "lib.rs";
  };
  features_.matches."0.1.8" = deps: f: updateFeatures f (rec {
    matches."0.1.8".default = (f.matches."0.1.8".default or true);
  }) [];


# end
# memchr-2.2.1

  crates.memchr."2.2.1" = deps: { features?(features_.memchr."2.2.1" deps {}) }: buildRustCrate {
    crateName = "memchr";
    version = "2.2.1";
    description = "Safe interface to memchr.";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" "bluss" ];
    sha256 = "1mj5z8lhz6jbapslpq8a39pwcsl1p0jmgp7wgcj7nv4pcqhya7a0";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."memchr"."2.2.1" or {});
  };
  features_.memchr."2.2.1" = deps: f: updateFeatures f (rec {
    memchr = fold recursiveUpdate {} [
      { "2.2.1"."use_std" =
        (f.memchr."2.2.1"."use_std" or false) ||
        (f.memchr."2.2.1".default or false) ||
        (memchr."2.2.1"."default" or false); }
      { "2.2.1".default = (f.memchr."2.2.1".default or true); }
    ];
  }) [];


# end
# mime-0.2.6

  crates.mime."0.2.6" = deps: { features?(features_.mime."0.2.6" deps {}) }: buildRustCrate {
    crateName = "mime";
    version = "0.2.6";
    description = "Strongly Typed Mimes";
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
      { "0.2.6"."heapsize" =
        (f.mime."0.2.6"."heapsize" or false) ||
        (f.mime."0.2.6".heap_size or false) ||
        (mime."0.2.6"."heap_size" or false); }
      { "0.2.6".default = (f.mime."0.2.6".default or true); }
    ];
  }) [
    (features_.log."${deps."mime"."0.2.6"."log"}" deps)
  ];


# end
# mio-0.6.19

  crates.mio."0.6.19" = deps: { features?(features_.mio."0.6.19" deps {}) }: buildRustCrate {
    crateName = "mio";
    version = "0.6.19";
    description = "Lightweight non-blocking IO";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0pjazzvqwkb4fgmm4b3m8i05c2gq60lvqqia0faawswgqy7rvgac";
    dependencies = mapFeatures features ([
      (crates."iovec"."${deps."mio"."0.6.19"."iovec"}" deps)
      (crates."log"."${deps."mio"."0.6.19"."log"}" deps)
      (crates."net2"."${deps."mio"."0.6.19"."net2"}" deps)
      (crates."slab"."${deps."mio"."0.6.19"."slab"}" deps)
    ])
      ++ (if kernel == "fuchsia" then mapFeatures features ([
      (crates."fuchsia_zircon"."${deps."mio"."0.6.19"."fuchsia_zircon"}" deps)
      (crates."fuchsia_zircon_sys"."${deps."mio"."0.6.19"."fuchsia_zircon_sys"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."mio"."0.6.19"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."kernel32_sys"."${deps."mio"."0.6.19"."kernel32_sys"}" deps)
      (crates."miow"."${deps."mio"."0.6.19"."miow"}" deps)
      (crates."winapi"."${deps."mio"."0.6.19"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."mio"."0.6.19" or {});
  };
  features_.mio."0.6.19" = deps: f: updateFeatures f (rec {
    fuchsia_zircon."${deps.mio."0.6.19".fuchsia_zircon}".default = true;
    fuchsia_zircon_sys."${deps.mio."0.6.19".fuchsia_zircon_sys}".default = true;
    iovec."${deps.mio."0.6.19".iovec}".default = true;
    kernel32_sys."${deps.mio."0.6.19".kernel32_sys}".default = true;
    libc."${deps.mio."0.6.19".libc}".default = true;
    log."${deps.mio."0.6.19".log}".default = true;
    mio = fold recursiveUpdate {} [
      { "0.6.19"."with-deprecated" =
        (f.mio."0.6.19"."with-deprecated" or false) ||
        (f.mio."0.6.19".default or false) ||
        (mio."0.6.19"."default" or false); }
      { "0.6.19".default = (f.mio."0.6.19".default or true); }
    ];
    miow."${deps.mio."0.6.19".miow}".default = true;
    net2."${deps.mio."0.6.19".net2}".default = true;
    slab."${deps.mio."0.6.19".slab}".default = true;
    winapi."${deps.mio."0.6.19".winapi}".default = true;
  }) [
    (features_.iovec."${deps."mio"."0.6.19"."iovec"}" deps)
    (features_.log."${deps."mio"."0.6.19"."log"}" deps)
    (features_.net2."${deps."mio"."0.6.19"."net2"}" deps)
    (features_.slab."${deps."mio"."0.6.19"."slab"}" deps)
    (features_.fuchsia_zircon."${deps."mio"."0.6.19"."fuchsia_zircon"}" deps)
    (features_.fuchsia_zircon_sys."${deps."mio"."0.6.19"."fuchsia_zircon_sys"}" deps)
    (features_.libc."${deps."mio"."0.6.19"."libc"}" deps)
    (features_.kernel32_sys."${deps."mio"."0.6.19"."kernel32_sys"}" deps)
    (features_.miow."${deps."mio"."0.6.19"."miow"}" deps)
    (features_.winapi."${deps."mio"."0.6.19"."winapi"}" deps)
  ];


# end
# mio-extras-2.0.5

  crates.mio_extras."2.0.5" = deps: { features?(features_.mio_extras."2.0.5" deps {}) }: buildRustCrate {
    crateName = "mio-extras";
    version = "2.0.5";
    description = "Extra components for use with Mio";
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
    description = "A zero overhead I/O library for Windows, focusing on IOCP and Async I/O\nabstractions.\n";
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
    description = "Extensions to the standard library's networking types as proposed in RFC 1158.\n";
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
      { "0.2.33"."duration" =
        (f.net2."0.2.33"."duration" or false) ||
        (f.net2."0.2.33".default or false) ||
        (net2."0.2.33"."default" or false); }
      { "0.2.33".default = (f.net2."0.2.33".default or true); }
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
# notify-4.0.14

  crates.notify."4.0.14" = deps: { features?(features_.notify."4.0.14" deps {}) }: buildRustCrate {
    crateName = "notify";
    version = "4.0.14";
    description = "Cross-platform filesystem notification library";
    authors = [ "Félix Saparelli <me@passcod.name>" "Jorge Israel Peña <jorge.israel.p@gmail.com>" "Michael Maurizi <michael.maurizi@gmail.com>" "Pierre Baillet <oct@zoy.org>" "Joe Wilm <joe@jwilm.com>" "Daniel Faust <hessijames@gmail.com>" "Aron Heinecke <Ox0p54r36@t-online.de>" ];
    sha256 = "1f2ax2kv5hp5vg4cyx81xar15cfcmf9izd3scdzpxprx4kpznlx8";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."notify"."4.0.14"."bitflags"}" deps)
      (crates."filetime"."${deps."notify"."4.0.14"."filetime"}" deps)
      (crates."libc"."${deps."notify"."4.0.14"."libc"}" deps)
      (crates."walkdir"."${deps."notify"."4.0.14"."walkdir"}" deps)
    ])
      ++ (if kernel == "linux" then mapFeatures features ([
      (crates."inotify"."${deps."notify"."4.0.14"."inotify"}" deps)
      (crates."mio"."${deps."notify"."4.0.14"."mio"}" deps)
      (crates."mio_extras"."${deps."notify"."4.0.14"."mio_extras"}" deps)
    ]) else [])
      ++ (if kernel == "darwin" then mapFeatures features ([
      (crates."fsevent"."${deps."notify"."4.0.14"."fsevent"}" deps)
      (crates."fsevent_sys"."${deps."notify"."4.0.14"."fsevent_sys"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."kernel32_sys"."${deps."notify"."4.0.14"."kernel32_sys"}" deps)
      (crates."winapi"."${deps."notify"."4.0.14"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."notify"."4.0.14" or {});
  };
  features_.notify."4.0.14" = deps: f: updateFeatures f (rec {
    bitflags."${deps.notify."4.0.14".bitflags}".default = true;
    filetime."${deps.notify."4.0.14".filetime}".default = true;
    fsevent."${deps.notify."4.0.14".fsevent}".default = true;
    fsevent_sys."${deps.notify."4.0.14".fsevent_sys}".default = true;
    inotify."${deps.notify."4.0.14".inotify}".default = (f.inotify."${deps.notify."4.0.14".inotify}".default or false);
    kernel32_sys."${deps.notify."4.0.14".kernel32_sys}".default = true;
    libc."${deps.notify."4.0.14".libc}".default = true;
    mio."${deps.notify."4.0.14".mio}".default = true;
    mio_extras."${deps.notify."4.0.14".mio_extras}".default = true;
    notify."4.0.14".default = (f.notify."4.0.14".default or true);
    walkdir."${deps.notify."4.0.14".walkdir}".default = true;
    winapi."${deps.notify."4.0.14".winapi}".default = true;
  }) [
    (features_.bitflags."${deps."notify"."4.0.14"."bitflags"}" deps)
    (features_.filetime."${deps."notify"."4.0.14"."filetime"}" deps)
    (features_.libc."${deps."notify"."4.0.14"."libc"}" deps)
    (features_.walkdir."${deps."notify"."4.0.14"."walkdir"}" deps)
    (features_.inotify."${deps."notify"."4.0.14"."inotify"}" deps)
    (features_.mio."${deps."notify"."4.0.14"."mio"}" deps)
    (features_.mio_extras."${deps."notify"."4.0.14"."mio_extras"}" deps)
    (features_.fsevent."${deps."notify"."4.0.14"."fsevent"}" deps)
    (features_.fsevent_sys."${deps."notify"."4.0.14"."fsevent_sys"}" deps)
    (features_.kernel32_sys."${deps."notify"."4.0.14"."kernel32_sys"}" deps)
    (features_.winapi."${deps."notify"."4.0.14"."winapi"}" deps)
  ];


# end
# num_cpus-1.10.1

  crates.num_cpus."1.10.1" = deps: { features?(features_.num_cpus."1.10.1" deps {}) }: buildRustCrate {
    crateName = "num_cpus";
    version = "1.10.1";
    description = "Get the number of CPUs on a machine.";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "1zi5s2cbnqqb0k0kdd6gqn2x97f9bssv44430h6w28awwzppyh8i";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."num_cpus"."1.10.1"."libc"}" deps)
    ]);
  };
  features_.num_cpus."1.10.1" = deps: f: updateFeatures f (rec {
    libc."${deps.num_cpus."1.10.1".libc}".default = true;
    num_cpus."1.10.1".default = (f.num_cpus."1.10.1".default or true);
  }) [
    (features_.libc."${deps."num_cpus"."1.10.1"."libc"}" deps)
  ];


# end
# openssl-probe-0.1.2

  crates.openssl_probe."0.1.2" = deps: { features?(features_.openssl_probe."0.1.2" deps {}) }: buildRustCrate {
    crateName = "openssl-probe";
    version = "0.1.2";
    description = "Tool for helping to find SSL certificate locations on the system for OpenSSL\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1a89fznx26vvaxyrxdvgf6iwai5xvs6xjvpjin68fgvrslv6n15a";
  };
  features_.openssl_probe."0.1.2" = deps: f: updateFeatures f (rec {
    openssl_probe."0.1.2".default = (f.openssl_probe."0.1.2".default or true);
  }) [];


# end
# openssl-sys-0.9.52

  crates.openssl_sys."0.9.52" = deps: { features?(features_.openssl_sys."0.9.52" deps {}) }: buildRustCrate {
    crateName = "openssl-sys";
    version = "0.9.52";
    description = "FFI bindings to OpenSSL";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "1vaa2syd87d3sfiwg9s2d46sz5gfn7pdps521n859prlf80bfwgb";
    build = "build/main.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."openssl_sys"."0.9.52"."libc"}" deps)
    ])
      ++ (if abi == "msvc" then mapFeatures features ([
]) else []);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."openssl_sys"."0.9.52"."autocfg"}" deps)
      (crates."cc"."${deps."openssl_sys"."0.9.52"."cc"}" deps)
      (crates."pkg_config"."${deps."openssl_sys"."0.9.52"."pkg_config"}" deps)
    ]);
    features = mkFeatures (features."openssl_sys"."0.9.52" or {});
  };
  features_.openssl_sys."0.9.52" = deps: f: updateFeatures f (rec {
    autocfg."${deps.openssl_sys."0.9.52".autocfg}".default = true;
    cc."${deps.openssl_sys."0.9.52".cc}".default = true;
    libc."${deps.openssl_sys."0.9.52".libc}".default = true;
    openssl_sys = fold recursiveUpdate {} [
      { "0.9.52"."openssl-src" =
        (f.openssl_sys."0.9.52"."openssl-src" or false) ||
        (f.openssl_sys."0.9.52".vendored or false) ||
        (openssl_sys."0.9.52"."vendored" or false); }
      { "0.9.52".default = (f.openssl_sys."0.9.52".default or true); }
    ];
    pkg_config."${deps.openssl_sys."0.9.52".pkg_config}".default = true;
  }) [
    (features_.libc."${deps."openssl_sys"."0.9.52"."libc"}" deps)
    (features_.autocfg."${deps."openssl_sys"."0.9.52"."autocfg"}" deps)
    (features_.cc."${deps."openssl_sys"."0.9.52"."cc"}" deps)
    (features_.pkg_config."${deps."openssl_sys"."0.9.52"."pkg_config"}" deps)
  ];


# end
# pear-0.1.2

  crates.pear."0.1.2" = deps: { features?(features_.pear."0.1.2" deps {}) }: buildRustCrate {
    crateName = "pear";
    version = "0.1.2";
    description = "A pear is a fruit.";
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
    description = "A (codegen) pear is a fruit.";
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
    description = "Percent encoding and decoding";
    authors = [ "The rust-url developers" ];
    sha256 = "04ahrp7aw4ip7fmadb0bknybmkfav0kk0gw4ps3ydq5w6hr0ib5i";
    libPath = "lib.rs";
  };
  features_.percent_encoding."1.0.1" = deps: f: updateFeatures f (rec {
    percent_encoding."1.0.1".default = (f.percent_encoding."1.0.1".default or true);
  }) [];


# end
# percent-encoding-2.1.0

  crates.percent_encoding."2.1.0" = deps: { features?(features_.percent_encoding."2.1.0" deps {}) }: buildRustCrate {
    crateName = "percent-encoding";
    version = "2.1.0";
    description = "Percent encoding and decoding";
    authors = [ "The rust-url developers" ];
    sha256 = "0i838f2nr81585ckmfymf8l1x1vdmx6n8xqvli0lgcy60yl2axy3";
    libPath = "lib.rs";
  };
  features_.percent_encoding."2.1.0" = deps: f: updateFeatures f (rec {
    percent_encoding."2.1.0".default = (f.percent_encoding."2.1.0".default or true);
  }) [];


# end
# pkg-config-0.3.16

  crates.pkg_config."0.3.16" = deps: { features?(features_.pkg_config."0.3.16" deps {}) }: buildRustCrate {
    crateName = "pkg-config";
    version = "0.3.16";
    description = "A library to run the pkg-config system tool at build time in order to be used in\nCargo build scripts.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1a2gg5a9l74brz1vzkkzfl8aihd7b4rk3vhbmiahkmpzavywza5j";
  };
  features_.pkg_config."0.3.16" = deps: f: updateFeatures f (rec {
    pkg_config."0.3.16".default = (f.pkg_config."0.3.16".default or true);
  }) [];


# end
# proc-macro2-0.4.30

  crates.proc_macro2."0.4.30" = deps: { features?(features_.proc_macro2."0.4.30" deps {}) }: buildRustCrate {
    crateName = "proc-macro2";
    version = "0.4.30";
    description = "A stable implementation of the upcoming new `proc_macro` API. Comes with an\noption, off by default, to also reimplement itself in terms of the upstream\nunstable API.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0iifv51wrm6r4r2gghw6rray3nv53zcap355bbz1nsmbhj5s09b9";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."unicode_xid"."${deps."proc_macro2"."0.4.30"."unicode_xid"}" deps)
    ]);
    features = mkFeatures (features."proc_macro2"."0.4.30" or {});
  };
  features_.proc_macro2."0.4.30" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "0.4.30"."proc-macro" =
        (f.proc_macro2."0.4.30"."proc-macro" or false) ||
        (f.proc_macro2."0.4.30".default or false) ||
        (proc_macro2."0.4.30"."default" or false); }
      { "0.4.30".default = (f.proc_macro2."0.4.30".default or true); }
    ];
    unicode_xid."${deps.proc_macro2."0.4.30".unicode_xid}".default = true;
  }) [
    (features_.unicode_xid."${deps."proc_macro2"."0.4.30"."unicode_xid"}" deps)
  ];


# end
# proc-macro2-1.0.6

  crates.proc_macro2."1.0.6" = deps: { features?(features_.proc_macro2."1.0.6" deps {}) }: buildRustCrate {
    crateName = "proc-macro2";
    version = "1.0.6";
    description = "A stable implementation of the upcoming new `proc_macro` API. Comes with an\noption, off by default, to also reimplement itself in terms of the upstream\nunstable API.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    edition = "2018";
    sha256 = "1l56ss9ip8cg6764cpi9y8dv7nsyqf2i4hb7sn29zx61n03jr81z";
    dependencies = mapFeatures features ([
      (crates."unicode_xid"."${deps."proc_macro2"."1.0.6"."unicode_xid"}" deps)
    ]);
    features = mkFeatures (features."proc_macro2"."1.0.6" or {});
  };
  features_.proc_macro2."1.0.6" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "1.0.6"."proc-macro" =
        (f.proc_macro2."1.0.6"."proc-macro" or false) ||
        (f.proc_macro2."1.0.6".default or false) ||
        (proc_macro2."1.0.6"."default" or false); }
      { "1.0.6".default = (f.proc_macro2."1.0.6".default or true); }
    ];
    unicode_xid."${deps.proc_macro2."1.0.6".unicode_xid}".default = true;
  }) [
    (features_.unicode_xid."${deps."proc_macro2"."1.0.6"."unicode_xid"}" deps)
  ];


# end
# quote-0.6.13

  crates.quote."0.6.13" = deps: { features?(features_.quote."0.6.13" deps {}) }: buildRustCrate {
    crateName = "quote";
    version = "0.6.13";
    description = "Quasi-quoting macro quote!(...)";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "1hrvsin40i4q8swrhlj9057g7nsp0lg02h8zbzmgz14av9mzv8g8";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."quote"."0.6.13"."proc_macro2"}" deps)
    ]);
    features = mkFeatures (features."quote"."0.6.13" or {});
  };
  features_.quote."0.6.13" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.quote."0.6.13".proc_macro2}"."proc-macro" =
        (f.proc_macro2."${deps.quote."0.6.13".proc_macro2}"."proc-macro" or false) ||
        (quote."0.6.13"."proc-macro" or false) ||
        (f."quote"."0.6.13"."proc-macro" or false); }
      { "${deps.quote."0.6.13".proc_macro2}".default = (f.proc_macro2."${deps.quote."0.6.13".proc_macro2}".default or false); }
    ];
    quote = fold recursiveUpdate {} [
      { "0.6.13"."proc-macro" =
        (f.quote."0.6.13"."proc-macro" or false) ||
        (f.quote."0.6.13".default or false) ||
        (quote."0.6.13"."default" or false); }
      { "0.6.13".default = (f.quote."0.6.13".default or true); }
    ];
  }) [
    (features_.proc_macro2."${deps."quote"."0.6.13"."proc_macro2"}" deps)
  ];


# end
# quote-1.0.2

  crates.quote."1.0.2" = deps: { features?(features_.quote."1.0.2" deps {}) }: buildRustCrate {
    crateName = "quote";
    version = "1.0.2";
    description = "Quasi-quoting macro quote!(...)";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    edition = "2018";
    sha256 = "0r7030w7dymarn92gjgm02hsm04fwsfs6f1l20wdqiyrm9z8rs5q";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."quote"."1.0.2"."proc_macro2"}" deps)
    ]);
    features = mkFeatures (features."quote"."1.0.2" or {});
  };
  features_.quote."1.0.2" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.quote."1.0.2".proc_macro2}"."proc-macro" =
        (f.proc_macro2."${deps.quote."1.0.2".proc_macro2}"."proc-macro" or false) ||
        (quote."1.0.2"."proc-macro" or false) ||
        (f."quote"."1.0.2"."proc-macro" or false); }
      { "${deps.quote."1.0.2".proc_macro2}".default = (f.proc_macro2."${deps.quote."1.0.2".proc_macro2}".default or false); }
    ];
    quote = fold recursiveUpdate {} [
      { "1.0.2"."proc-macro" =
        (f.quote."1.0.2"."proc-macro" or false) ||
        (f.quote."1.0.2".default or false) ||
        (quote."1.0.2"."default" or false); }
      { "1.0.2".default = (f.quote."1.0.2".default or true); }
    ];
  }) [
    (features_.proc_macro2."${deps."quote"."1.0.2"."proc_macro2"}" deps)
  ];


# end
# redox_syscall-0.1.56

  crates.redox_syscall."0.1.56" = deps: { features?(features_.redox_syscall."0.1.56" deps {}) }: buildRustCrate {
    crateName = "redox_syscall";
    version = "0.1.56";
    description = "A Rust library to access raw Redox system calls";
    authors = [ "Jeremy Soller <jackpot51@gmail.com>" ];
    sha256 = "0jcp8nd947zcy938bz09pzlmi3vyxfdzg92pjxdvvk0699vwcc26";
    libName = "syscall";
  };
  features_.redox_syscall."0.1.56" = deps: f: updateFeatures f (rec {
    redox_syscall."0.1.56".default = (f.redox_syscall."0.1.56".default or true);
  }) [];


# end
# regex-1.3.1

  crates.regex."1.3.1" = deps: { features?(features_.regex."1.3.1" deps {}) }: buildRustCrate {
    crateName = "regex";
    version = "1.3.1";
    description = "An implementation of regular expressions for Rust. This implementation uses\nfinite automata and guarantees linear time matching on all inputs.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "0508b01q7iwky5gzp1cc3lpz6al1qam8skgcvkfgxr67nikiz7jn";
    dependencies = mapFeatures features ([
      (crates."regex_syntax"."${deps."regex"."1.3.1"."regex_syntax"}" deps)
    ]
      ++ (if features.regex."1.3.1".aho-corasick or false then [ (crates.aho_corasick."${deps."regex"."1.3.1".aho_corasick}" deps) ] else [])
      ++ (if features.regex."1.3.1".memchr or false then [ (crates.memchr."${deps."regex"."1.3.1".memchr}" deps) ] else [])
      ++ (if features.regex."1.3.1".thread_local or false then [ (crates.thread_local."${deps."regex"."1.3.1".thread_local}" deps) ] else []));
    features = mkFeatures (features."regex"."1.3.1" or {});
  };
  features_.regex."1.3.1" = deps: f: updateFeatures f (rec {
    aho_corasick."${deps.regex."1.3.1".aho_corasick}".default = true;
    memchr."${deps.regex."1.3.1".memchr}".default = true;
    regex = fold recursiveUpdate {} [
      { "1.3.1"."aho-corasick" =
        (f.regex."1.3.1"."aho-corasick" or false) ||
        (f.regex."1.3.1".perf-literal or false) ||
        (regex."1.3.1"."perf-literal" or false); }
      { "1.3.1"."memchr" =
        (f.regex."1.3.1"."memchr" or false) ||
        (f.regex."1.3.1".perf-literal or false) ||
        (regex."1.3.1"."perf-literal" or false); }
      { "1.3.1"."pattern" =
        (f.regex."1.3.1"."pattern" or false) ||
        (f.regex."1.3.1".unstable or false) ||
        (regex."1.3.1"."unstable" or false); }
      { "1.3.1"."perf" =
        (f.regex."1.3.1"."perf" or false) ||
        (f.regex."1.3.1".default or false) ||
        (regex."1.3.1"."default" or false); }
      { "1.3.1"."perf-cache" =
        (f.regex."1.3.1"."perf-cache" or false) ||
        (f.regex."1.3.1".perf or false) ||
        (regex."1.3.1"."perf" or false); }
      { "1.3.1"."perf-dfa" =
        (f.regex."1.3.1"."perf-dfa" or false) ||
        (f.regex."1.3.1".perf or false) ||
        (regex."1.3.1"."perf" or false); }
      { "1.3.1"."perf-inline" =
        (f.regex."1.3.1"."perf-inline" or false) ||
        (f.regex."1.3.1".perf or false) ||
        (regex."1.3.1"."perf" or false); }
      { "1.3.1"."perf-literal" =
        (f.regex."1.3.1"."perf-literal" or false) ||
        (f.regex."1.3.1".perf or false) ||
        (regex."1.3.1"."perf" or false); }
      { "1.3.1"."std" =
        (f.regex."1.3.1"."std" or false) ||
        (f.regex."1.3.1".default or false) ||
        (regex."1.3.1"."default" or false) ||
        (f.regex."1.3.1".use_std or false) ||
        (regex."1.3.1"."use_std" or false); }
      { "1.3.1"."thread_local" =
        (f.regex."1.3.1"."thread_local" or false) ||
        (f.regex."1.3.1".perf-cache or false) ||
        (regex."1.3.1"."perf-cache" or false); }
      { "1.3.1"."unicode" =
        (f.regex."1.3.1"."unicode" or false) ||
        (f.regex."1.3.1".default or false) ||
        (regex."1.3.1"."default" or false); }
      { "1.3.1"."unicode-age" =
        (f.regex."1.3.1"."unicode-age" or false) ||
        (f.regex."1.3.1".unicode or false) ||
        (regex."1.3.1"."unicode" or false); }
      { "1.3.1"."unicode-bool" =
        (f.regex."1.3.1"."unicode-bool" or false) ||
        (f.regex."1.3.1".unicode or false) ||
        (regex."1.3.1"."unicode" or false); }
      { "1.3.1"."unicode-case" =
        (f.regex."1.3.1"."unicode-case" or false) ||
        (f.regex."1.3.1".unicode or false) ||
        (regex."1.3.1"."unicode" or false); }
      { "1.3.1"."unicode-gencat" =
        (f.regex."1.3.1"."unicode-gencat" or false) ||
        (f.regex."1.3.1".unicode or false) ||
        (regex."1.3.1"."unicode" or false); }
      { "1.3.1"."unicode-perl" =
        (f.regex."1.3.1"."unicode-perl" or false) ||
        (f.regex."1.3.1".unicode or false) ||
        (regex."1.3.1"."unicode" or false); }
      { "1.3.1"."unicode-script" =
        (f.regex."1.3.1"."unicode-script" or false) ||
        (f.regex."1.3.1".unicode or false) ||
        (regex."1.3.1"."unicode" or false); }
      { "1.3.1"."unicode-segment" =
        (f.regex."1.3.1"."unicode-segment" or false) ||
        (f.regex."1.3.1".unicode or false) ||
        (regex."1.3.1"."unicode" or false); }
      { "1.3.1".default = (f.regex."1.3.1".default or true); }
    ];
    regex_syntax = fold recursiveUpdate {} [
      { "${deps.regex."1.3.1".regex_syntax}"."unicode-age" =
        (f.regex_syntax."${deps.regex."1.3.1".regex_syntax}"."unicode-age" or false) ||
        (regex."1.3.1"."unicode-age" or false) ||
        (f."regex"."1.3.1"."unicode-age" or false); }
      { "${deps.regex."1.3.1".regex_syntax}"."unicode-bool" =
        (f.regex_syntax."${deps.regex."1.3.1".regex_syntax}"."unicode-bool" or false) ||
        (regex."1.3.1"."unicode-bool" or false) ||
        (f."regex"."1.3.1"."unicode-bool" or false); }
      { "${deps.regex."1.3.1".regex_syntax}"."unicode-case" =
        (f.regex_syntax."${deps.regex."1.3.1".regex_syntax}"."unicode-case" or false) ||
        (regex."1.3.1"."unicode-case" or false) ||
        (f."regex"."1.3.1"."unicode-case" or false); }
      { "${deps.regex."1.3.1".regex_syntax}"."unicode-gencat" =
        (f.regex_syntax."${deps.regex."1.3.1".regex_syntax}"."unicode-gencat" or false) ||
        (regex."1.3.1"."unicode-gencat" or false) ||
        (f."regex"."1.3.1"."unicode-gencat" or false); }
      { "${deps.regex."1.3.1".regex_syntax}"."unicode-perl" =
        (f.regex_syntax."${deps.regex."1.3.1".regex_syntax}"."unicode-perl" or false) ||
        (regex."1.3.1"."unicode-perl" or false) ||
        (f."regex"."1.3.1"."unicode-perl" or false); }
      { "${deps.regex."1.3.1".regex_syntax}"."unicode-script" =
        (f.regex_syntax."${deps.regex."1.3.1".regex_syntax}"."unicode-script" or false) ||
        (regex."1.3.1"."unicode-script" or false) ||
        (f."regex"."1.3.1"."unicode-script" or false); }
      { "${deps.regex."1.3.1".regex_syntax}"."unicode-segment" =
        (f.regex_syntax."${deps.regex."1.3.1".regex_syntax}"."unicode-segment" or false) ||
        (regex."1.3.1"."unicode-segment" or false) ||
        (f."regex"."1.3.1"."unicode-segment" or false); }
      { "${deps.regex."1.3.1".regex_syntax}".default = (f.regex_syntax."${deps.regex."1.3.1".regex_syntax}".default or false); }
    ];
    thread_local."${deps.regex."1.3.1".thread_local}".default = true;
  }) [
    (features_.aho_corasick."${deps."regex"."1.3.1"."aho_corasick"}" deps)
    (features_.memchr."${deps."regex"."1.3.1"."memchr"}" deps)
    (features_.regex_syntax."${deps."regex"."1.3.1"."regex_syntax"}" deps)
    (features_.thread_local."${deps."regex"."1.3.1"."thread_local"}" deps)
  ];


# end
# regex-syntax-0.6.12

  crates.regex_syntax."0.6.12" = deps: { features?(features_.regex_syntax."0.6.12" deps {}) }: buildRustCrate {
    crateName = "regex-syntax";
    version = "0.6.12";
    description = "A regular expression parser.";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1lqhddhwzpgq8zfkxhm241n7g4m3yc11fb4098dkgawbxvybr53v";
    features = mkFeatures (features."regex_syntax"."0.6.12" or {});
  };
  features_.regex_syntax."0.6.12" = deps: f: updateFeatures f (rec {
    regex_syntax = fold recursiveUpdate {} [
      { "0.6.12"."unicode" =
        (f.regex_syntax."0.6.12"."unicode" or false) ||
        (f.regex_syntax."0.6.12".default or false) ||
        (regex_syntax."0.6.12"."default" or false); }
      { "0.6.12"."unicode-age" =
        (f.regex_syntax."0.6.12"."unicode-age" or false) ||
        (f.regex_syntax."0.6.12".unicode or false) ||
        (regex_syntax."0.6.12"."unicode" or false); }
      { "0.6.12"."unicode-bool" =
        (f.regex_syntax."0.6.12"."unicode-bool" or false) ||
        (f.regex_syntax."0.6.12".unicode or false) ||
        (regex_syntax."0.6.12"."unicode" or false); }
      { "0.6.12"."unicode-case" =
        (f.regex_syntax."0.6.12"."unicode-case" or false) ||
        (f.regex_syntax."0.6.12".unicode or false) ||
        (regex_syntax."0.6.12"."unicode" or false); }
      { "0.6.12"."unicode-gencat" =
        (f.regex_syntax."0.6.12"."unicode-gencat" or false) ||
        (f.regex_syntax."0.6.12".unicode or false) ||
        (regex_syntax."0.6.12"."unicode" or false); }
      { "0.6.12"."unicode-perl" =
        (f.regex_syntax."0.6.12"."unicode-perl" or false) ||
        (f.regex_syntax."0.6.12".unicode or false) ||
        (regex_syntax."0.6.12"."unicode" or false); }
      { "0.6.12"."unicode-script" =
        (f.regex_syntax."0.6.12"."unicode-script" or false) ||
        (f.regex_syntax."0.6.12".unicode or false) ||
        (regex_syntax."0.6.12"."unicode" or false); }
      { "0.6.12"."unicode-segment" =
        (f.regex_syntax."0.6.12"."unicode-segment" or false) ||
        (f.regex_syntax."0.6.12".unicode or false) ||
        (regex_syntax."0.6.12"."unicode" or false); }
      { "0.6.12".default = (f.regex_syntax."0.6.12".default or true); }
    ];
  }) [];


# end
# ring-0.13.5

  crates.ring."0.13.5" = deps: { features?(features_.ring."0.13.5" deps {}) }: buildRustCrate {
    crateName = "ring";
    version = "0.13.5";
    description = "Safe, fast, small crypto using Rust.";
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
      { "0.13.5"."dev_urandom_fallback" =
        (f.ring."0.13.5"."dev_urandom_fallback" or false) ||
        (f.ring."0.13.5".default or false) ||
        (ring."0.13.5"."default" or false); }
      { "0.13.5"."use_heap" =
        (f.ring."0.13.5"."use_heap" or false) ||
        (f.ring."0.13.5".default or false) ||
        (ring."0.13.5"."default" or false) ||
        (f.ring."0.13.5".rsa_signing or false) ||
        (ring."0.13.5"."rsa_signing" or false); }
      { "0.13.5".default = (f.ring."0.13.5".default or true); }
    ];
    untrusted."${deps.ring."0.13.5".untrusted}".default = true;
  }) [
    (features_.untrusted."${deps."ring"."0.13.5"."untrusted"}" deps)
    (features_.cc."${deps."ring"."0.13.5"."cc"}" deps)
    (features_.lazy_static."${deps."ring"."0.13.5"."lazy_static"}" deps)
    (features_.libc."${deps."ring"."0.13.5"."libc"}" deps)
  ];


# end
# rocket-0.4.2

  crates.rocket."0.4.2" = deps: { features?(features_.rocket."0.4.2" deps {}) }: buildRustCrate {
    crateName = "rocket";
    version = "0.4.2";
    description = "Web framework for nightly with a focus on ease-of-use, expressibility, and speed.\n";
    authors = [ "Sergio Benitez <sb@sergio.bz>" ];
    sha256 = "0cdvyx4ghvr2h8d2mzfhl18xjalkcdcbyl86a3wbaggz8ii546q5";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."atty"."${deps."rocket"."0.4.2"."atty"}" deps)
      (crates."base64"."${deps."rocket"."0.4.2"."base64"}" deps)
      (crates."log"."${deps."rocket"."0.4.2"."log"}" deps)
      (crates."memchr"."${deps."rocket"."0.4.2"."memchr"}" deps)
      (crates."num_cpus"."${deps."rocket"."0.4.2"."num_cpus"}" deps)
      (crates."pear"."${deps."rocket"."0.4.2"."pear"}" deps)
      (crates."rocket_codegen"."${deps."rocket"."0.4.2"."rocket_codegen"}" deps)
      (crates."rocket_http"."${deps."rocket"."0.4.2"."rocket_http"}" deps)
      (crates."state"."${deps."rocket"."0.4.2"."state"}" deps)
      (crates."time"."${deps."rocket"."0.4.2"."time"}" deps)
      (crates."toml"."${deps."rocket"."0.4.2"."toml"}" deps)
      (crates."yansi"."${deps."rocket"."0.4.2"."yansi"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."version_check"."${deps."rocket"."0.4.2"."version_check"}" deps)
      (crates."yansi"."${deps."rocket"."0.4.2"."yansi"}" deps)
    ]);
    features = mkFeatures (features."rocket"."0.4.2" or {});
  };
  features_.rocket."0.4.2" = deps: f: updateFeatures f (rec {
    atty."${deps.rocket."0.4.2".atty}".default = true;
    base64."${deps.rocket."0.4.2".base64}".default = true;
    log."${deps.rocket."0.4.2".log}".default = true;
    memchr."${deps.rocket."0.4.2".memchr}".default = true;
    num_cpus."${deps.rocket."0.4.2".num_cpus}".default = true;
    pear."${deps.rocket."0.4.2".pear}".default = true;
    rocket = fold recursiveUpdate {} [
      { "0.4.2"."private-cookies" =
        (f.rocket."0.4.2"."private-cookies" or false) ||
        (f.rocket."0.4.2".default or false) ||
        (rocket."0.4.2"."default" or false); }
      { "0.4.2".default = (f.rocket."0.4.2".default or true); }
    ];
    rocket_codegen."${deps.rocket."0.4.2".rocket_codegen}".default = true;
    rocket_http = fold recursiveUpdate {} [
      { "${deps.rocket."0.4.2".rocket_http}"."private-cookies" =
        (f.rocket_http."${deps.rocket."0.4.2".rocket_http}"."private-cookies" or false) ||
        (rocket."0.4.2"."private-cookies" or false) ||
        (f."rocket"."0.4.2"."private-cookies" or false); }
      { "${deps.rocket."0.4.2".rocket_http}"."tls" =
        (f.rocket_http."${deps.rocket."0.4.2".rocket_http}"."tls" or false) ||
        (rocket."0.4.2"."tls" or false) ||
        (f."rocket"."0.4.2"."tls" or false); }
      { "${deps.rocket."0.4.2".rocket_http}".default = true; }
    ];
    state."${deps.rocket."0.4.2".state}".default = true;
    time."${deps.rocket."0.4.2".time}".default = true;
    toml."${deps.rocket."0.4.2".toml}".default = true;
    version_check."${deps.rocket."0.4.2".version_check}".default = true;
    yansi."${deps.rocket."0.4.2".yansi}".default = true;
  }) [
    (features_.atty."${deps."rocket"."0.4.2"."atty"}" deps)
    (features_.base64."${deps."rocket"."0.4.2"."base64"}" deps)
    (features_.log."${deps."rocket"."0.4.2"."log"}" deps)
    (features_.memchr."${deps."rocket"."0.4.2"."memchr"}" deps)
    (features_.num_cpus."${deps."rocket"."0.4.2"."num_cpus"}" deps)
    (features_.pear."${deps."rocket"."0.4.2"."pear"}" deps)
    (features_.rocket_codegen."${deps."rocket"."0.4.2"."rocket_codegen"}" deps)
    (features_.rocket_http."${deps."rocket"."0.4.2"."rocket_http"}" deps)
    (features_.state."${deps."rocket"."0.4.2"."state"}" deps)
    (features_.time."${deps."rocket"."0.4.2"."time"}" deps)
    (features_.toml."${deps."rocket"."0.4.2"."toml"}" deps)
    (features_.yansi."${deps."rocket"."0.4.2"."yansi"}" deps)
    (features_.version_check."${deps."rocket"."0.4.2"."version_check"}" deps)
    (features_.yansi."${deps."rocket"."0.4.2"."yansi"}" deps)
  ];


# end
# rocket_codegen-0.4.2

  crates.rocket_codegen."0.4.2" = deps: { features?(features_.rocket_codegen."0.4.2" deps {}) }: buildRustCrate {
    crateName = "rocket_codegen";
    version = "0.4.2";
    description = "Procedural macros for the Rocket web framework.";
    authors = [ "Sergio Benitez <sb@sergio.bz>" ];
    sha256 = "0pjbknb1qsfgw9ynkz3244rq9hlcr6bafp1xwa1ylfqkdr4a5ids";
    procMacro = true;
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."devise"."${deps."rocket_codegen"."0.4.2"."devise"}" deps)
      (crates."indexmap"."${deps."rocket_codegen"."0.4.2"."indexmap"}" deps)
      (crates."quote"."${deps."rocket_codegen"."0.4.2"."quote"}" deps)
      (crates."rocket_http"."${deps."rocket_codegen"."0.4.2"."rocket_http"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."version_check"."${deps."rocket_codegen"."0.4.2"."version_check"}" deps)
      (crates."yansi"."${deps."rocket_codegen"."0.4.2"."yansi"}" deps)
    ]);
  };
  features_.rocket_codegen."0.4.2" = deps: f: updateFeatures f (rec {
    devise."${deps.rocket_codegen."0.4.2".devise}".default = true;
    indexmap."${deps.rocket_codegen."0.4.2".indexmap}".default = true;
    quote."${deps.rocket_codegen."0.4.2".quote}".default = true;
    rocket_codegen."0.4.2".default = (f.rocket_codegen."0.4.2".default or true);
    rocket_http."${deps.rocket_codegen."0.4.2".rocket_http}".default = true;
    version_check."${deps.rocket_codegen."0.4.2".version_check}".default = true;
    yansi."${deps.rocket_codegen."0.4.2".yansi}".default = true;
  }) [
    (features_.devise."${deps."rocket_codegen"."0.4.2"."devise"}" deps)
    (features_.indexmap."${deps."rocket_codegen"."0.4.2"."indexmap"}" deps)
    (features_.quote."${deps."rocket_codegen"."0.4.2"."quote"}" deps)
    (features_.rocket_http."${deps."rocket_codegen"."0.4.2"."rocket_http"}" deps)
    (features_.version_check."${deps."rocket_codegen"."0.4.2"."version_check"}" deps)
    (features_.yansi."${deps."rocket_codegen"."0.4.2"."yansi"}" deps)
  ];


# end
# rocket_contrib-0.4.2

  crates.rocket_contrib."0.4.2" = deps: { features?(features_.rocket_contrib."0.4.2" deps {}) }: buildRustCrate {
    crateName = "rocket_contrib";
    version = "0.4.2";
    description = "Community contributed libraries for the Rocket web framework.";
    authors = [ "Sergio Benitez <sb@sergio.bz>" ];
    sha256 = "145p7xylj2kljwh5gdgl51knpnwwnxaa3whn921sx8by9yq9287x";
    dependencies = mapFeatures features ([
      (crates."log"."${deps."rocket_contrib"."0.4.2"."log"}" deps)
      (crates."rocket"."${deps."rocket_contrib"."0.4.2"."rocket"}" deps)
    ]
      ++ (if features.rocket_contrib."0.4.2".serde or false then [ (crates.serde."${deps."rocket_contrib"."0.4.2".serde}" deps) ] else [])
      ++ (if features.rocket_contrib."0.4.2".serde_json or false then [ (crates.serde_json."${deps."rocket_contrib"."0.4.2".serde_json}" deps) ] else []))
      ++ (if kernel == "debug_assertions" then mapFeatures features ([
      (crates."notify"."${deps."rocket_contrib"."0.4.2"."notify"}" deps)
    ]) else []);
    features = mkFeatures (features."rocket_contrib"."0.4.2" or {});
  };
  features_.rocket_contrib."0.4.2" = deps: f: updateFeatures f (rec {
    log."${deps.rocket_contrib."0.4.2".log}".default = true;
    notify."${deps.rocket_contrib."0.4.2".notify}".default = true;
    rocket."${deps.rocket_contrib."0.4.2".rocket}".default = (f.rocket."${deps.rocket_contrib."0.4.2".rocket}".default or false);
    rocket_contrib = fold recursiveUpdate {} [
      { "0.4.2"."databases" =
        (f.rocket_contrib."0.4.2"."databases" or false) ||
        (f.rocket_contrib."0.4.2".cypher_pool or false) ||
        (rocket_contrib."0.4.2"."cypher_pool" or false) ||
        (f.rocket_contrib."0.4.2".diesel_mysql_pool or false) ||
        (rocket_contrib."0.4.2"."diesel_mysql_pool" or false) ||
        (f.rocket_contrib."0.4.2".diesel_postgres_pool or false) ||
        (rocket_contrib."0.4.2"."diesel_postgres_pool" or false) ||
        (f.rocket_contrib."0.4.2".diesel_sqlite_pool or false) ||
        (rocket_contrib."0.4.2"."diesel_sqlite_pool" or false) ||
        (f.rocket_contrib."0.4.2".memcache_pool or false) ||
        (rocket_contrib."0.4.2"."memcache_pool" or false) ||
        (f.rocket_contrib."0.4.2".mongodb_pool or false) ||
        (rocket_contrib."0.4.2"."mongodb_pool" or false) ||
        (f.rocket_contrib."0.4.2".mysql_pool or false) ||
        (rocket_contrib."0.4.2"."mysql_pool" or false) ||
        (f.rocket_contrib."0.4.2".postgres_pool or false) ||
        (rocket_contrib."0.4.2"."postgres_pool" or false) ||
        (f.rocket_contrib."0.4.2".redis_pool or false) ||
        (rocket_contrib."0.4.2"."redis_pool" or false) ||
        (f.rocket_contrib."0.4.2".sqlite_pool or false) ||
        (rocket_contrib."0.4.2"."sqlite_pool" or false); }
      { "0.4.2"."glob" =
        (f.rocket_contrib."0.4.2"."glob" or false) ||
        (f.rocket_contrib."0.4.2".templates or false) ||
        (rocket_contrib."0.4.2"."templates" or false); }
      { "0.4.2"."handlebars" =
        (f.rocket_contrib."0.4.2"."handlebars" or false) ||
        (f.rocket_contrib."0.4.2".handlebars_templates or false) ||
        (rocket_contrib."0.4.2"."handlebars_templates" or false); }
      { "0.4.2"."json" =
        (f.rocket_contrib."0.4.2"."json" or false) ||
        (f.rocket_contrib."0.4.2".default or false) ||
        (rocket_contrib."0.4.2"."default" or false); }
      { "0.4.2"."memcache" =
        (f.rocket_contrib."0.4.2"."memcache" or false) ||
        (f.rocket_contrib."0.4.2".memcache_pool or false) ||
        (rocket_contrib."0.4.2"."memcache_pool" or false); }
      { "0.4.2"."mongodb" =
        (f.rocket_contrib."0.4.2"."mongodb" or false) ||
        (f.rocket_contrib."0.4.2".mongodb_pool or false) ||
        (rocket_contrib."0.4.2"."mongodb_pool" or false); }
      { "0.4.2"."mysql" =
        (f.rocket_contrib."0.4.2"."mysql" or false) ||
        (f.rocket_contrib."0.4.2".mysql_pool or false) ||
        (rocket_contrib."0.4.2"."mysql_pool" or false); }
      { "0.4.2"."postgres" =
        (f.rocket_contrib."0.4.2"."postgres" or false) ||
        (f.rocket_contrib."0.4.2".postgres_pool or false) ||
        (rocket_contrib."0.4.2"."postgres_pool" or false); }
      { "0.4.2"."r2d2" =
        (f.rocket_contrib."0.4.2"."r2d2" or false) ||
        (f.rocket_contrib."0.4.2".databases or false) ||
        (rocket_contrib."0.4.2"."databases" or false); }
      { "0.4.2"."r2d2-memcache" =
        (f.rocket_contrib."0.4.2"."r2d2-memcache" or false) ||
        (f.rocket_contrib."0.4.2".memcache_pool or false) ||
        (rocket_contrib."0.4.2"."memcache_pool" or false); }
      { "0.4.2"."r2d2-mongodb" =
        (f.rocket_contrib."0.4.2"."r2d2-mongodb" or false) ||
        (f.rocket_contrib."0.4.2".mongodb_pool or false) ||
        (rocket_contrib."0.4.2"."mongodb_pool" or false); }
      { "0.4.2"."r2d2_cypher" =
        (f.rocket_contrib."0.4.2"."r2d2_cypher" or false) ||
        (f.rocket_contrib."0.4.2".cypher_pool or false) ||
        (rocket_contrib."0.4.2"."cypher_pool" or false); }
      { "0.4.2"."r2d2_mysql" =
        (f.rocket_contrib."0.4.2"."r2d2_mysql" or false) ||
        (f.rocket_contrib."0.4.2".mysql_pool or false) ||
        (rocket_contrib."0.4.2"."mysql_pool" or false); }
      { "0.4.2"."r2d2_postgres" =
        (f.rocket_contrib."0.4.2"."r2d2_postgres" or false) ||
        (f.rocket_contrib."0.4.2".postgres_pool or false) ||
        (rocket_contrib."0.4.2"."postgres_pool" or false); }
      { "0.4.2"."r2d2_redis" =
        (f.rocket_contrib."0.4.2"."r2d2_redis" or false) ||
        (f.rocket_contrib."0.4.2".redis_pool or false) ||
        (rocket_contrib."0.4.2"."redis_pool" or false); }
      { "0.4.2"."r2d2_sqlite" =
        (f.rocket_contrib."0.4.2"."r2d2_sqlite" or false) ||
        (f.rocket_contrib."0.4.2".sqlite_pool or false) ||
        (rocket_contrib."0.4.2"."sqlite_pool" or false); }
      { "0.4.2"."redis" =
        (f.rocket_contrib."0.4.2"."redis" or false) ||
        (f.rocket_contrib."0.4.2".redis_pool or false) ||
        (rocket_contrib."0.4.2"."redis_pool" or false); }
      { "0.4.2"."rmp-serde" =
        (f.rocket_contrib."0.4.2"."rmp-serde" or false) ||
        (f.rocket_contrib."0.4.2".msgpack or false) ||
        (rocket_contrib."0.4.2"."msgpack" or false); }
      { "0.4.2"."rusqlite" =
        (f.rocket_contrib."0.4.2"."rusqlite" or false) ||
        (f.rocket_contrib."0.4.2".sqlite_pool or false) ||
        (rocket_contrib."0.4.2"."sqlite_pool" or false); }
      { "0.4.2"."rusted_cypher" =
        (f.rocket_contrib."0.4.2"."rusted_cypher" or false) ||
        (f.rocket_contrib."0.4.2".cypher_pool or false) ||
        (rocket_contrib."0.4.2"."cypher_pool" or false); }
      { "0.4.2"."serde" =
        (f.rocket_contrib."0.4.2"."serde" or false) ||
        (f.rocket_contrib."0.4.2".json or false) ||
        (rocket_contrib."0.4.2"."json" or false) ||
        (f.rocket_contrib."0.4.2".msgpack or false) ||
        (rocket_contrib."0.4.2"."msgpack" or false) ||
        (f.rocket_contrib."0.4.2".templates or false) ||
        (rocket_contrib."0.4.2"."templates" or false); }
      { "0.4.2"."serde_json" =
        (f.rocket_contrib."0.4.2"."serde_json" or false) ||
        (f.rocket_contrib."0.4.2".json or false) ||
        (rocket_contrib."0.4.2"."json" or false) ||
        (f.rocket_contrib."0.4.2".templates or false) ||
        (rocket_contrib."0.4.2"."templates" or false); }
      { "0.4.2"."serve" =
        (f.rocket_contrib."0.4.2"."serve" or false) ||
        (f.rocket_contrib."0.4.2".default or false) ||
        (rocket_contrib."0.4.2"."default" or false); }
      { "0.4.2"."templates" =
        (f.rocket_contrib."0.4.2"."templates" or false) ||
        (f.rocket_contrib."0.4.2".handlebars_templates or false) ||
        (rocket_contrib."0.4.2"."handlebars_templates" or false) ||
        (f.rocket_contrib."0.4.2".tera_templates or false) ||
        (rocket_contrib."0.4.2"."tera_templates" or false); }
      { "0.4.2"."tera" =
        (f.rocket_contrib."0.4.2"."tera" or false) ||
        (f.rocket_contrib."0.4.2".tera_templates or false) ||
        (rocket_contrib."0.4.2"."tera_templates" or false); }
      { "0.4.2"."time" =
        (f.rocket_contrib."0.4.2"."time" or false) ||
        (f.rocket_contrib."0.4.2".helmet or false) ||
        (rocket_contrib."0.4.2"."helmet" or false); }
      { "0.4.2".default = (f.rocket_contrib."0.4.2".default or true); }
    ];
    serde."${deps.rocket_contrib."0.4.2".serde}".default = true;
    serde_json."${deps.rocket_contrib."0.4.2".serde_json}".default = true;
  }) [
    (features_.log."${deps."rocket_contrib"."0.4.2"."log"}" deps)
    (features_.rocket."${deps."rocket_contrib"."0.4.2"."rocket"}" deps)
    (features_.serde."${deps."rocket_contrib"."0.4.2"."serde"}" deps)
    (features_.serde_json."${deps."rocket_contrib"."0.4.2"."serde_json"}" deps)
    (features_.notify."${deps."rocket_contrib"."0.4.2"."notify"}" deps)
  ];


# end
# rocket_http-0.4.2

  crates.rocket_http."0.4.2" = deps: { features?(features_.rocket_http."0.4.2" deps {}) }: buildRustCrate {
    crateName = "rocket_http";
    version = "0.4.2";
    description = "Types, traits, and parsers for HTTP requests, responses, and headers.\n";
    authors = [ "Sergio Benitez <sb@sergio.bz>" ];
    sha256 = "1pji35h0vdqypq79p1fqfzfnm0jl044a3kgn2fw35vkxj4q4w0wd";
    dependencies = mapFeatures features ([
      (crates."cookie"."${deps."rocket_http"."0.4.2"."cookie"}" deps)
      (crates."hyper"."${deps."rocket_http"."0.4.2"."hyper"}" deps)
      (crates."indexmap"."${deps."rocket_http"."0.4.2"."indexmap"}" deps)
      (crates."pear"."${deps."rocket_http"."0.4.2"."pear"}" deps)
      (crates."percent_encoding"."${deps."rocket_http"."0.4.2"."percent_encoding"}" deps)
      (crates."smallvec"."${deps."rocket_http"."0.4.2"."smallvec"}" deps)
      (crates."state"."${deps."rocket_http"."0.4.2"."state"}" deps)
      (crates."time"."${deps."rocket_http"."0.4.2"."time"}" deps)
      (crates."unicode_xid"."${deps."rocket_http"."0.4.2"."unicode_xid"}" deps)
    ]);
    features = mkFeatures (features."rocket_http"."0.4.2" or {});
  };
  features_.rocket_http."0.4.2" = deps: f: updateFeatures f (rec {
    cookie = fold recursiveUpdate {} [
      { "${deps.rocket_http."0.4.2".cookie}"."percent-encode" = true; }
      { "${deps.rocket_http."0.4.2".cookie}"."secure" =
        (f.cookie."${deps.rocket_http."0.4.2".cookie}"."secure" or false) ||
        (rocket_http."0.4.2"."private-cookies" or false) ||
        (f."rocket_http"."0.4.2"."private-cookies" or false); }
      { "${deps.rocket_http."0.4.2".cookie}".default = true; }
    ];
    hyper."${deps.rocket_http."0.4.2".hyper}".default = (f.hyper."${deps.rocket_http."0.4.2".hyper}".default or false);
    indexmap."${deps.rocket_http."0.4.2".indexmap}".default = true;
    pear."${deps.rocket_http."0.4.2".pear}".default = true;
    percent_encoding."${deps.rocket_http."0.4.2".percent_encoding}".default = true;
    rocket_http = fold recursiveUpdate {} [
      { "0.4.2"."hyper-sync-rustls" =
        (f.rocket_http."0.4.2"."hyper-sync-rustls" or false) ||
        (f.rocket_http."0.4.2".tls or false) ||
        (rocket_http."0.4.2"."tls" or false); }
      { "0.4.2"."rustls" =
        (f.rocket_http."0.4.2"."rustls" or false) ||
        (f.rocket_http."0.4.2".tls or false) ||
        (rocket_http."0.4.2"."tls" or false); }
      { "0.4.2".default = (f.rocket_http."0.4.2".default or true); }
    ];
    smallvec."${deps.rocket_http."0.4.2".smallvec}".default = true;
    state."${deps.rocket_http."0.4.2".state}".default = true;
    time."${deps.rocket_http."0.4.2".time}".default = true;
    unicode_xid."${deps.rocket_http."0.4.2".unicode_xid}".default = true;
  }) [
    (features_.cookie."${deps."rocket_http"."0.4.2"."cookie"}" deps)
    (features_.hyper."${deps."rocket_http"."0.4.2"."hyper"}" deps)
    (features_.indexmap."${deps."rocket_http"."0.4.2"."indexmap"}" deps)
    (features_.pear."${deps."rocket_http"."0.4.2"."pear"}" deps)
    (features_.percent_encoding."${deps."rocket_http"."0.4.2"."percent_encoding"}" deps)
    (features_.smallvec."${deps."rocket_http"."0.4.2"."smallvec"}" deps)
    (features_.state."${deps."rocket_http"."0.4.2"."state"}" deps)
    (features_.time."${deps."rocket_http"."0.4.2"."time"}" deps)
    (features_.unicode_xid."${deps."rocket_http"."0.4.2"."unicode_xid"}" deps)
  ];


# end
# ryu-1.0.2

  crates.ryu."1.0.2" = deps: { features?(features_.ryu."1.0.2" deps {}) }: buildRustCrate {
    crateName = "ryu";
    version = "1.0.2";
    description = "Fast floating point to string conversion";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "04pxfhps9ix078qyml7hifjdmy4bg1n047ki0wx6i1007z85wjp1";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."ryu"."1.0.2" or {});
  };
  features_.ryu."1.0.2" = deps: f: updateFeatures f (rec {
    ryu."1.0.2".default = (f.ryu."1.0.2".default or true);
  }) [];


# end
# safemem-0.3.2

  crates.safemem."0.3.2" = deps: { features?(features_.safemem."0.3.2" deps {}) }: buildRustCrate {
    crateName = "safemem";
    version = "0.3.2";
    description = "Safe wrappers for memory-accessing functions, like `std::ptr::copy()`.";
    authors = [ "Austin Bonander <austin.bonander@gmail.com>" ];
    sha256 = "1h0n07sy386gz0jb6nz170m66jkbnwyky8y11v551dxydz77a0jc";
    features = mkFeatures (features."safemem"."0.3.2" or {});
  };
  features_.safemem."0.3.2" = deps: f: updateFeatures f (rec {
    safemem = fold recursiveUpdate {} [
      { "0.3.2"."std" =
        (f.safemem."0.3.2"."std" or false) ||
        (f.safemem."0.3.2".default or false) ||
        (safemem."0.3.2"."default" or false); }
      { "0.3.2".default = (f.safemem."0.3.2".default or true); }
    ];
  }) [];


# end
# same-file-1.0.5

  crates.same_file."1.0.5" = deps: { features?(features_.same_file."1.0.5" deps {}) }: buildRustCrate {
    crateName = "same-file";
    version = "1.0.5";
    description = "A simple crate for determining whether two file paths point to the same file.\n";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "0vn7bc069wsdick0nk0n2j3wvgq2vzb5ix957c35nkhkwlszv4l5";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."winapi_util"."${deps."same_file"."1.0.5"."winapi_util"}" deps)
    ]) else []);
  };
  features_.same_file."1.0.5" = deps: f: updateFeatures f (rec {
    same_file."1.0.5".default = (f.same_file."1.0.5".default or true);
    winapi_util."${deps.same_file."1.0.5".winapi_util}".default = true;
  }) [
    (features_.winapi_util."${deps."same_file"."1.0.5"."winapi_util"}" deps)
  ];


# end
# serde-1.0.101

  crates.serde."1.0.101" = deps: { features?(features_.serde."1.0.101" deps {}) }: buildRustCrate {
    crateName = "serde";
    version = "1.0.101";
    description = "A generic serialization/deserialization framework";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "0sacv3njx99yr8gxsl80cy1h98b9vd1pv6aa8ncbnk0pys8r82vn";
    build = "build.rs";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.serde."1.0.101".serde_derive or false then [ (crates.serde_derive."${deps."serde"."1.0.101".serde_derive}" deps) ] else []));
    features = mkFeatures (features."serde"."1.0.101" or {});
  };
  features_.serde."1.0.101" = deps: f: updateFeatures f (rec {
    serde = fold recursiveUpdate {} [
      { "1.0.101"."serde_derive" =
        (f.serde."1.0.101"."serde_derive" or false) ||
        (f.serde."1.0.101".derive or false) ||
        (serde."1.0.101"."derive" or false); }
      { "1.0.101"."std" =
        (f.serde."1.0.101"."std" or false) ||
        (f.serde."1.0.101".default or false) ||
        (serde."1.0.101"."default" or false); }
      { "1.0.101".default = (f.serde."1.0.101".default or true); }
    ];
    serde_derive."${deps.serde."1.0.101".serde_derive}".default = true;
  }) [
    (features_.serde_derive."${deps."serde"."1.0.101"."serde_derive"}" deps)
  ];


# end
# serde_derive-1.0.101

  crates.serde_derive."1.0.101" = deps: { features?(features_.serde_derive."1.0.101" deps {}) }: buildRustCrate {
    crateName = "serde_derive";
    version = "1.0.101";
    description = "Macros 1.1 implementation of #[derive(Serialize, Deserialize)]";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "093x99qff1ihjmy32fp1gxp66qh0nni349j20y3w0h33wqk19dr0";
    procMacro = true;
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."serde_derive"."1.0.101"."proc_macro2"}" deps)
      (crates."quote"."${deps."serde_derive"."1.0.101"."quote"}" deps)
      (crates."syn"."${deps."serde_derive"."1.0.101"."syn"}" deps)
    ]);
    features = mkFeatures (features."serde_derive"."1.0.101" or {});
  };
  features_.serde_derive."1.0.101" = deps: f: updateFeatures f (rec {
    proc_macro2."${deps.serde_derive."1.0.101".proc_macro2}".default = true;
    quote."${deps.serde_derive."1.0.101".quote}".default = true;
    serde_derive."1.0.101".default = (f.serde_derive."1.0.101".default or true);
    syn = fold recursiveUpdate {} [
      { "${deps.serde_derive."1.0.101".syn}"."visit" = true; }
      { "${deps.serde_derive."1.0.101".syn}".default = true; }
    ];
  }) [
    (features_.proc_macro2."${deps."serde_derive"."1.0.101"."proc_macro2"}" deps)
    (features_.quote."${deps."serde_derive"."1.0.101"."quote"}" deps)
    (features_.syn."${deps."serde_derive"."1.0.101"."syn"}" deps)
  ];


# end
# serde_json-1.0.41

  crates.serde_json."1.0.41" = deps: { features?(features_.serde_json."1.0.41" deps {}) }: buildRustCrate {
    crateName = "serde_json";
    version = "1.0.41";
    description = "A JSON serialization file format";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "0j3qhfy2hj3vjlc6hi34k0zlsaj5mxnk9dy6lp8a8snj5rm9vrhd";
    dependencies = mapFeatures features ([
      (crates."itoa"."${deps."serde_json"."1.0.41"."itoa"}" deps)
      (crates."ryu"."${deps."serde_json"."1.0.41"."ryu"}" deps)
      (crates."serde"."${deps."serde_json"."1.0.41"."serde"}" deps)
    ]);
    features = mkFeatures (features."serde_json"."1.0.41" or {});
  };
  features_.serde_json."1.0.41" = deps: f: updateFeatures f (rec {
    itoa."${deps.serde_json."1.0.41".itoa}".default = true;
    ryu."${deps.serde_json."1.0.41".ryu}".default = true;
    serde."${deps.serde_json."1.0.41".serde}".default = true;
    serde_json = fold recursiveUpdate {} [
      { "1.0.41"."indexmap" =
        (f.serde_json."1.0.41"."indexmap" or false) ||
        (f.serde_json."1.0.41".preserve_order or false) ||
        (serde_json."1.0.41"."preserve_order" or false); }
      { "1.0.41".default = (f.serde_json."1.0.41".default or true); }
    ];
  }) [
    (features_.itoa."${deps."serde_json"."1.0.41"."itoa"}" deps)
    (features_.ryu."${deps."serde_json"."1.0.41"."ryu"}" deps)
    (features_.serde."${deps."serde_json"."1.0.41"."serde"}" deps)
  ];


# end
# slab-0.4.2

  crates.slab."0.4.2" = deps: { features?(features_.slab."0.4.2" deps {}) }: buildRustCrate {
    crateName = "slab";
    version = "0.4.2";
    description = "Pre-allocated storage for a uniform data type";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0h1l2z7qy6207kv0v3iigdf2xfk9yrhbwj1svlxk6wxjmdxvgdl7";
  };
  features_.slab."0.4.2" = deps: f: updateFeatures f (rec {
    slab."0.4.2".default = (f.slab."0.4.2".default or true);
  }) [];


# end
# smallvec-0.6.10

  crates.smallvec."0.6.10" = deps: { features?(features_.smallvec."0.6.10" deps {}) }: buildRustCrate {
    crateName = "smallvec";
    version = "0.6.10";
    description = "'Small vector' optimization: store up to a small number of items on the stack";
    authors = [ "Simon Sapin <simon.sapin@exyr.org>" ];
    sha256 = "01w7xd79q0bwn683gk4ryw50ad1zzxkny10f7gkbaaj1ax6f4q4h";
    libPath = "lib.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."smallvec"."0.6.10" or {});
  };
  features_.smallvec."0.6.10" = deps: f: updateFeatures f (rec {
    smallvec = fold recursiveUpdate {} [
      { "0.6.10"."std" =
        (f.smallvec."0.6.10"."std" or false) ||
        (f.smallvec."0.6.10".default or false) ||
        (smallvec."0.6.10"."default" or false); }
      { "0.6.10".default = (f.smallvec."0.6.10".default or true); }
    ];
  }) [];


# end
# state-0.4.1

  crates.state."0.4.1" = deps: { features?(features_.state."0.4.1" deps {}) }: buildRustCrate {
    crateName = "state";
    version = "0.4.1";
    description = "A library for safe and effortless global and thread-local state management.\n";
    authors = [ "Sergio Benitez <sb@sergio.bz>" ];
    sha256 = "0mkav1dcz9v0pi6rxwv0j0hhjhkzi5ssi4ld8djp0gh8lnaickk5";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."state"."0.4.1" or {});
  };
  features_.state."0.4.1" = deps: f: updateFeatures f (rec {
    state = fold recursiveUpdate {} [
      { "0.4.1"."thread_local" =
        (f.state."0.4.1"."thread_local" or false) ||
        (f.state."0.4.1".tls or false) ||
        (state."0.4.1"."tls" or false); }
      { "0.4.1".default = (f.state."0.4.1".default or true); }
    ];
  }) [];


# end
# strsim-0.9.2

  crates.strsim."0.9.2" = deps: { features?(features_.strsim."0.9.2" deps {}) }: buildRustCrate {
    crateName = "strsim";
    version = "0.9.2";
    description = "Implementations of string similarity metrics.\nIncludes Hamming, Levenshtein, OSA, Damerau-Levenshtein, Jaro, and Jaro-Winkler.\n";
    authors = [ "Danny Guo <dannyguo91@gmail.com>" ];
    sha256 = "01989y4gms34rys32yixz7axi9b47kw81c15z93gd9jik0mj17ng";
  };
  features_.strsim."0.9.2" = deps: f: updateFeatures f (rec {
    strsim."0.9.2".default = (f.strsim."0.9.2".default or true);
  }) [];


# end
# syn-0.15.44

  crates.syn."0.15.44" = deps: { features?(features_.syn."0.15.44" deps {}) }: buildRustCrate {
    crateName = "syn";
    version = "0.15.44";
    description = "Parser for Rust source code";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "09v11h141grmsnamd5j14mn8vpnfng6p60kdmsm8akz9m0qn7s1n";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."syn"."0.15.44"."proc_macro2"}" deps)
      (crates."unicode_xid"."${deps."syn"."0.15.44"."unicode_xid"}" deps)
    ]
      ++ (if features.syn."0.15.44".quote or false then [ (crates.quote."${deps."syn"."0.15.44".quote}" deps) ] else []));
    features = mkFeatures (features."syn"."0.15.44" or {});
  };
  features_.syn."0.15.44" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.syn."0.15.44".proc_macro2}"."proc-macro" =
        (f.proc_macro2."${deps.syn."0.15.44".proc_macro2}"."proc-macro" or false) ||
        (syn."0.15.44"."proc-macro" or false) ||
        (f."syn"."0.15.44"."proc-macro" or false); }
      { "${deps.syn."0.15.44".proc_macro2}".default = (f.proc_macro2."${deps.syn."0.15.44".proc_macro2}".default or false); }
    ];
    quote = fold recursiveUpdate {} [
      { "${deps.syn."0.15.44".quote}"."proc-macro" =
        (f.quote."${deps.syn."0.15.44".quote}"."proc-macro" or false) ||
        (syn."0.15.44"."proc-macro" or false) ||
        (f."syn"."0.15.44"."proc-macro" or false); }
      { "${deps.syn."0.15.44".quote}".default = (f.quote."${deps.syn."0.15.44".quote}".default or false); }
    ];
    syn = fold recursiveUpdate {} [
      { "0.15.44"."clone-impls" =
        (f.syn."0.15.44"."clone-impls" or false) ||
        (f.syn."0.15.44".default or false) ||
        (syn."0.15.44"."default" or false); }
      { "0.15.44"."derive" =
        (f.syn."0.15.44"."derive" or false) ||
        (f.syn."0.15.44".default or false) ||
        (syn."0.15.44"."default" or false); }
      { "0.15.44"."parsing" =
        (f.syn."0.15.44"."parsing" or false) ||
        (f.syn."0.15.44".default or false) ||
        (syn."0.15.44"."default" or false); }
      { "0.15.44"."printing" =
        (f.syn."0.15.44"."printing" or false) ||
        (f.syn."0.15.44".default or false) ||
        (syn."0.15.44"."default" or false); }
      { "0.15.44"."proc-macro" =
        (f.syn."0.15.44"."proc-macro" or false) ||
        (f.syn."0.15.44".default or false) ||
        (syn."0.15.44"."default" or false); }
      { "0.15.44"."quote" =
        (f.syn."0.15.44"."quote" or false) ||
        (f.syn."0.15.44".printing or false) ||
        (syn."0.15.44"."printing" or false); }
      { "0.15.44".default = (f.syn."0.15.44".default or true); }
    ];
    unicode_xid."${deps.syn."0.15.44".unicode_xid}".default = true;
  }) [
    (features_.proc_macro2."${deps."syn"."0.15.44"."proc_macro2"}" deps)
    (features_.quote."${deps."syn"."0.15.44"."quote"}" deps)
    (features_.unicode_xid."${deps."syn"."0.15.44"."unicode_xid"}" deps)
  ];


# end
# syn-1.0.5

  crates.syn."1.0.5" = deps: { features?(features_.syn."1.0.5" deps {}) }: buildRustCrate {
    crateName = "syn";
    version = "1.0.5";
    description = "Parser for Rust source code";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    edition = "2018";
    sha256 = "08qbk425r8c4q4rrpq1q9wkd3v3bji8nlfaxj8v4l7lkpjkh0xgs";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."syn"."1.0.5"."proc_macro2"}" deps)
      (crates."unicode_xid"."${deps."syn"."1.0.5"."unicode_xid"}" deps)
    ]
      ++ (if features.syn."1.0.5".quote or false then [ (crates.quote."${deps."syn"."1.0.5".quote}" deps) ] else []));
    features = mkFeatures (features."syn"."1.0.5" or {});
  };
  features_.syn."1.0.5" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.syn."1.0.5".proc_macro2}"."proc-macro" =
        (f.proc_macro2."${deps.syn."1.0.5".proc_macro2}"."proc-macro" or false) ||
        (syn."1.0.5"."proc-macro" or false) ||
        (f."syn"."1.0.5"."proc-macro" or false); }
      { "${deps.syn."1.0.5".proc_macro2}".default = (f.proc_macro2."${deps.syn."1.0.5".proc_macro2}".default or false); }
    ];
    quote = fold recursiveUpdate {} [
      { "${deps.syn."1.0.5".quote}"."proc-macro" =
        (f.quote."${deps.syn."1.0.5".quote}"."proc-macro" or false) ||
        (syn."1.0.5"."proc-macro" or false) ||
        (f."syn"."1.0.5"."proc-macro" or false); }
      { "${deps.syn."1.0.5".quote}".default = (f.quote."${deps.syn."1.0.5".quote}".default or false); }
    ];
    syn = fold recursiveUpdate {} [
      { "1.0.5"."clone-impls" =
        (f.syn."1.0.5"."clone-impls" or false) ||
        (f.syn."1.0.5".default or false) ||
        (syn."1.0.5"."default" or false); }
      { "1.0.5"."derive" =
        (f.syn."1.0.5"."derive" or false) ||
        (f.syn."1.0.5".default or false) ||
        (syn."1.0.5"."default" or false); }
      { "1.0.5"."parsing" =
        (f.syn."1.0.5"."parsing" or false) ||
        (f.syn."1.0.5".default or false) ||
        (syn."1.0.5"."default" or false); }
      { "1.0.5"."printing" =
        (f.syn."1.0.5"."printing" or false) ||
        (f.syn."1.0.5".default or false) ||
        (syn."1.0.5"."default" or false); }
      { "1.0.5"."proc-macro" =
        (f.syn."1.0.5"."proc-macro" or false) ||
        (f.syn."1.0.5".default or false) ||
        (syn."1.0.5"."default" or false); }
      { "1.0.5"."quote" =
        (f.syn."1.0.5"."quote" or false) ||
        (f.syn."1.0.5".printing or false) ||
        (syn."1.0.5"."printing" or false); }
      { "1.0.5".default = (f.syn."1.0.5".default or true); }
    ];
    unicode_xid."${deps.syn."1.0.5".unicode_xid}".default = true;
  }) [
    (features_.proc_macro2."${deps."syn"."1.0.5"."proc_macro2"}" deps)
    (features_.quote."${deps."syn"."1.0.5"."quote"}" deps)
    (features_.unicode_xid."${deps."syn"."1.0.5"."unicode_xid"}" deps)
  ];


# end
# thread_local-0.3.6

  crates.thread_local."0.3.6" = deps: { features?(features_.thread_local."0.3.6" deps {}) }: buildRustCrate {
    crateName = "thread_local";
    version = "0.3.6";
    description = "Per-object thread-local storage";
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
    description = "Utilities for working with time-related functions in Rust.\n";
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
    description = "A native Rust encoder and decoder of TOML-formatted files and streams. Provides\nimplementations of the standard Serialize/Deserialize traits for TOML data to\nfacilitate deserializing and serializing Rust structures.\n";
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
    description = "Unsafe helpers for working with raw trait objects.";
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
    description = "Exposes Typeable, for getting TypeIds at runtime.";
    authors = [ "Jonathan Reem <jonathan.reem@gmail.com>" ];
    sha256 = "0lvff10hwyy852m6r11msyv1rpgpnapn284i8dk0p0q5saqvbvnx";
  };
  features_.typeable."0.1.2" = deps: f: updateFeatures f (rec {
    typeable."0.1.2".default = (f.typeable."0.1.2".default or true);
  }) [];


# end
# unicase-1.4.2

  crates.unicase."1.4.2" = deps: { features?(features_.unicase."1.4.2" deps {}) }: buildRustCrate {
    crateName = "unicase";
    version = "1.4.2";
    description = "A case-insensitive wrapper around strings.";
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
      { "1.4.2"."heapsize" =
        (f.unicase."1.4.2"."heapsize" or false) ||
        (f.unicase."1.4.2".heap_size or false) ||
        (unicase."1.4.2"."heap_size" or false); }
      { "1.4.2"."heapsize_plugin" =
        (f.unicase."1.4.2"."heapsize_plugin" or false) ||
        (f.unicase."1.4.2".heap_size or false) ||
        (unicase."1.4.2"."heap_size" or false); }
      { "1.4.2".default = (f.unicase."1.4.2".default or true); }
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
    description = "Implementation of the Unicode Bidirectional Algorithm";
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
      { "0.3.4"."flame" =
        (f.unicode_bidi."0.3.4"."flame" or false) ||
        (f.unicode_bidi."0.3.4".flame_it or false) ||
        (unicode_bidi."0.3.4"."flame_it" or false); }
      { "0.3.4"."flamer" =
        (f.unicode_bidi."0.3.4"."flamer" or false) ||
        (f.unicode_bidi."0.3.4".flame_it or false) ||
        (unicode_bidi."0.3.4"."flame_it" or false); }
      { "0.3.4"."serde" =
        (f.unicode_bidi."0.3.4"."serde" or false) ||
        (f.unicode_bidi."0.3.4".with_serde or false) ||
        (unicode_bidi."0.3.4"."with_serde" or false); }
      { "0.3.4".default = (f.unicode_bidi."0.3.4".default or true); }
    ];
  }) [
    (features_.matches."${deps."unicode_bidi"."0.3.4"."matches"}" deps)
  ];


# end
# unicode-normalization-0.1.8

  crates.unicode_normalization."0.1.8" = deps: { features?(features_.unicode_normalization."0.1.8" deps {}) }: buildRustCrate {
    crateName = "unicode-normalization";
    version = "0.1.8";
    description = "This crate provides functions for normalization of\nUnicode strings, including Canonical and Compatible\nDecomposition and Recomposition, as described in\nUnicode Standard Annex #15.\n";
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
    description = "Determine whether characters have the XID_Start\nor XID_Continue properties according to\nUnicode Standard Annex #31.\n";
    authors = [ "erick.tryzelaar <erick.tryzelaar@gmail.com>" "kwantam <kwantam@gmail.com>" ];
    sha256 = "05wdmwlfzxhq3nhsxn6wx4q8dhxzzfb9szsz6wiw092m1rjj01zj";
    features = mkFeatures (features."unicode_xid"."0.1.0" or {});
  };
  features_.unicode_xid."0.1.0" = deps: f: updateFeatures f (rec {
    unicode_xid."0.1.0".default = (f.unicode_xid."0.1.0".default or true);
  }) [];


# end
# unicode-xid-0.2.0

  crates.unicode_xid."0.2.0" = deps: { features?(features_.unicode_xid."0.2.0" deps {}) }: buildRustCrate {
    crateName = "unicode-xid";
    version = "0.2.0";
    description = "Determine whether characters have the XID_Start\nor XID_Continue properties according to\nUnicode Standard Annex #31.\n";
    authors = [ "erick.tryzelaar <erick.tryzelaar@gmail.com>" "kwantam <kwantam@gmail.com>" ];
    sha256 = "1c85gb3p3qhbjvfyjb31m06la4f024jx319k10ig7n47dz2fk8v7";
    features = mkFeatures (features."unicode_xid"."0.2.0" or {});
  };
  features_.unicode_xid."0.2.0" = deps: f: updateFeatures f (rec {
    unicode_xid."0.2.0".default = (f.unicode_xid."0.2.0".default or true);
  }) [];


# end
# untrusted-0.6.2

  crates.untrusted."0.6.2" = deps: { features?(features_.untrusted."0.6.2" deps {}) }: buildRustCrate {
    crateName = "untrusted";
    version = "0.6.2";
    description = "Safe, fast, zero-panic, zero-crashing, zero-allocation parsing of untrusted inputs in Rust.";
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
    description = "URL library for Rust, based on the WHATWG URL Standard";
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
      { "1.7.2"."encoding" =
        (f.url."1.7.2"."encoding" or false) ||
        (f.url."1.7.2".query_encoding or false) ||
        (url."1.7.2"."query_encoding" or false); }
      { "1.7.2"."heapsize" =
        (f.url."1.7.2"."heapsize" or false) ||
        (f.url."1.7.2".heap_size or false) ||
        (url."1.7.2"."heap_size" or false); }
      { "1.7.2".default = (f.url."1.7.2".default or true); }
    ];
  }) [
    (features_.idna."${deps."url"."1.7.2"."idna"}" deps)
    (features_.matches."${deps."url"."1.7.2"."matches"}" deps)
    (features_.percent_encoding."${deps."url"."1.7.2"."percent_encoding"}" deps)
  ];


# end
# url-2.1.0

  crates.url."2.1.0" = deps: { features?(features_.url."2.1.0" deps {}) }: buildRustCrate {
    crateName = "url";
    version = "2.1.0";
    description = "URL library for Rust, based on the WHATWG URL Standard";
    authors = [ "The rust-url developers" ];
    sha256 = "0mvv28fvrrv3hc064gjgpqjvjn1j151qbi9i5bcilal6rkcd1brq";
    dependencies = mapFeatures features ([
      (crates."idna"."${deps."url"."2.1.0"."idna"}" deps)
      (crates."matches"."${deps."url"."2.1.0"."matches"}" deps)
      (crates."percent_encoding"."${deps."url"."2.1.0"."percent_encoding"}" deps)
    ]);
  };
  features_.url."2.1.0" = deps: f: updateFeatures f (rec {
    idna."${deps.url."2.1.0".idna}".default = true;
    matches."${deps.url."2.1.0".matches}".default = true;
    percent_encoding."${deps.url."2.1.0".percent_encoding}".default = true;
    url."2.1.0".default = (f.url."2.1.0".default or true);
  }) [
    (features_.idna."${deps."url"."2.1.0"."idna"}" deps)
    (features_.matches."${deps."url"."2.1.0"."matches"}" deps)
    (features_.percent_encoding."${deps."url"."2.1.0"."percent_encoding"}" deps)
  ];


# end
# vcpkg-0.2.7

  crates.vcpkg."0.2.7" = deps: { features?(features_.vcpkg."0.2.7" deps {}) }: buildRustCrate {
    crateName = "vcpkg";
    version = "0.2.7";
    description = "A library to find native dependencies in a vcpkg tree at build\ntime in order to be used in Cargo build scripts.\n";
    authors = [ "Jim McGrath <jimmc2@gmail.com>" ];
    sha256 = "1lwykbbscbdy4nhrfidgg3rk2xw9cvx5672sx1c97wm8y3vjpcd9";
  };
  features_.vcpkg."0.2.7" = deps: f: updateFeatures f (rec {
    vcpkg."0.2.7".default = (f.vcpkg."0.2.7".default or true);
  }) [];


# end
# version_check-0.1.5

  crates.version_check."0.1.5" = deps: { features?(features_.version_check."0.1.5" deps {}) }: buildRustCrate {
    crateName = "version_check";
    version = "0.1.5";
    description = "Tiny crate to check the version of the installed/running rustc.";
    authors = [ "Sergio Benitez <sb@sergio.bz>" ];
    sha256 = "1yrx9xblmwbafw2firxyqbj8f771kkzfd24n3q7xgwiqyhi0y8qd";
  };
  features_.version_check."0.1.5" = deps: f: updateFeatures f (rec {
    version_check."0.1.5".default = (f.version_check."0.1.5".default or true);
  }) [];


# end
# version_check-0.9.1

  crates.version_check."0.9.1" = deps: { features?(features_.version_check."0.9.1" deps {}) }: buildRustCrate {
    crateName = "version_check";
    version = "0.9.1";
    description = "Tiny crate to check the version of the installed/running rustc.";
    authors = [ "Sergio Benitez <sb@sergio.bz>" ];
    sha256 = "00aywbaicdi81gcxpqdz6g0l96885bz4bml5c9xfna5p01vrh4li";
  };
  features_.version_check."0.9.1" = deps: f: updateFeatures f (rec {
    version_check."0.9.1".default = (f.version_check."0.9.1".default or true);
  }) [];


# end
# walkdir-2.2.9

  crates.walkdir."2.2.9" = deps: { features?(features_.walkdir."2.2.9" deps {}) }: buildRustCrate {
    crateName = "walkdir";
    version = "2.2.9";
    description = "Recursively walk a directory.";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "04k0pqbd8p36wxr8003r644ymka5jr5kn1p8xaz9r3nylgwlwjmq";
    dependencies = mapFeatures features ([
      (crates."same_file"."${deps."walkdir"."2.2.9"."same_file"}" deps)
    ])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."walkdir"."2.2.9"."winapi"}" deps)
      (crates."winapi_util"."${deps."walkdir"."2.2.9"."winapi_util"}" deps)
    ]) else []);
  };
  features_.walkdir."2.2.9" = deps: f: updateFeatures f (rec {
    same_file."${deps.walkdir."2.2.9".same_file}".default = true;
    walkdir."2.2.9".default = (f.walkdir."2.2.9".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.walkdir."2.2.9".winapi}"."std" = true; }
      { "${deps.walkdir."2.2.9".winapi}"."winnt" = true; }
      { "${deps.walkdir."2.2.9".winapi}".default = true; }
    ];
    winapi_util."${deps.walkdir."2.2.9".winapi_util}".default = true;
  }) [
    (features_.same_file."${deps."walkdir"."2.2.9"."same_file"}" deps)
    (features_.winapi."${deps."walkdir"."2.2.9"."winapi"}" deps)
    (features_.winapi_util."${deps."walkdir"."2.2.9"."winapi_util"}" deps)
  ];


# end
# wasi-0.7.0

  crates.wasi."0.7.0" = deps: { features?(features_.wasi."0.7.0" deps {}) }: buildRustCrate {
    crateName = "wasi";
    version = "0.7.0";
    description = "Experimental WASI API bindings for Rust";
    authors = [ "The Cranelift Project Developers" ];
    edition = "2018";
    sha256 = "1lqknxy8x9mrsy0pna6xlwzypbhli73nbai9gmin5f4z1ghlng25";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."wasi"."0.7.0" or {});
  };
  features_.wasi."0.7.0" = deps: f: updateFeatures f (rec {
    wasi = fold recursiveUpdate {} [
      { "0.7.0"."alloc" =
        (f.wasi."0.7.0"."alloc" or false) ||
        (f.wasi."0.7.0".default or false) ||
        (wasi."0.7.0"."default" or false); }
      { "0.7.0"."compiler_builtins" =
        (f.wasi."0.7.0"."compiler_builtins" or false) ||
        (f.wasi."0.7.0".rustc-dep-of-std or false) ||
        (wasi."0.7.0"."rustc-dep-of-std" or false); }
      { "0.7.0"."core" =
        (f.wasi."0.7.0"."core" or false) ||
        (f.wasi."0.7.0".rustc-dep-of-std or false) ||
        (wasi."0.7.0"."rustc-dep-of-std" or false); }
      { "0.7.0"."rustc-std-workspace-alloc" =
        (f.wasi."0.7.0"."rustc-std-workspace-alloc" or false) ||
        (f.wasi."0.7.0".rustc-dep-of-std or false) ||
        (wasi."0.7.0"."rustc-dep-of-std" or false); }
      { "0.7.0".default = (f.wasi."0.7.0".default or true); }
    ];
  }) [];


# end
# winapi-0.2.8

  crates.winapi."0.2.8" = deps: { features?(features_.winapi."0.2.8" deps {}) }: buildRustCrate {
    crateName = "winapi";
    version = "0.2.8";
    description = "Types and constants for WinAPI bindings. See README for list of crates providing function bindings.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "0a45b58ywf12vb7gvj6h3j264nydynmzyqz8d8rqxsj6icqv82as";
  };
  features_.winapi."0.2.8" = deps: f: updateFeatures f (rec {
    winapi."0.2.8".default = (f.winapi."0.2.8".default or true);
  }) [];


# end
# winapi-0.3.8

  crates.winapi."0.3.8" = deps: { features?(features_.winapi."0.3.8" deps {}) }: buildRustCrate {
    crateName = "winapi";
    version = "0.3.8";
    description = "Raw FFI bindings for all of Windows API.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "084ialbgww1vxry341fmkg5crgpvab3w52ahx1wa54yqjgym0vxs";
    build = "build.rs";
    dependencies = (if kernel == "i686-pc-windows-gnu" then mapFeatures features ([
      (crates."winapi_i686_pc_windows_gnu"."${deps."winapi"."0.3.8"."winapi_i686_pc_windows_gnu"}" deps)
    ]) else [])
      ++ (if kernel == "x86_64-pc-windows-gnu" then mapFeatures features ([
      (crates."winapi_x86_64_pc_windows_gnu"."${deps."winapi"."0.3.8"."winapi_x86_64_pc_windows_gnu"}" deps)
    ]) else []);
    features = mkFeatures (features."winapi"."0.3.8" or {});
  };
  features_.winapi."0.3.8" = deps: f: updateFeatures f (rec {
    winapi = fold recursiveUpdate {} [
      { "0.3.8"."impl-debug" =
        (f.winapi."0.3.8"."impl-debug" or false) ||
        (f.winapi."0.3.8".debug or false) ||
        (winapi."0.3.8"."debug" or false); }
      { "0.3.8".default = (f.winapi."0.3.8".default or true); }
    ];
    winapi_i686_pc_windows_gnu."${deps.winapi."0.3.8".winapi_i686_pc_windows_gnu}".default = true;
    winapi_x86_64_pc_windows_gnu."${deps.winapi."0.3.8".winapi_x86_64_pc_windows_gnu}".default = true;
  }) [
    (features_.winapi_i686_pc_windows_gnu."${deps."winapi"."0.3.8"."winapi_i686_pc_windows_gnu"}" deps)
    (features_.winapi_x86_64_pc_windows_gnu."${deps."winapi"."0.3.8"."winapi_x86_64_pc_windows_gnu"}" deps)
  ];


# end
# winapi-build-0.1.1

  crates.winapi_build."0.1.1" = deps: { features?(features_.winapi_build."0.1.1" deps {}) }: buildRustCrate {
    crateName = "winapi-build";
    version = "0.1.1";
    description = "Common code for build.rs in WinAPI -sys crates.";
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
    description = "Import libraries for the i686-pc-windows-gnu target. Please don't use this crate directly, depend on winapi instead.";
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
    description = "A dumping ground for high level safe wrappers over winapi.";
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
    description = "Import libraries for the x86_64-pc-windows-gnu target. Please don't use this crate directly, depend on winapi instead.";
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
    description = "Contains function definitions for the Windows API library ws2_32. See winapi for types and constants.";
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
    description = "A dead simple ANSI terminal color painting library.";
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
    description = "A dead simple ANSI terminal color painting library.";
    authors = [ "Sergio Benitez <sb@sergio.bz>" ];
    sha256 = "1c2k520yvv900mndxqjfl25bkhzkpdzy5bc4yc9n7h2ls25l0f0r";
  };
  features_.yansi."0.5.0" = deps: f: updateFeatures f (rec {
    yansi."0.5.0".default = (f.yansi."0.5.0".default or true);
  }) [];


# end
}
