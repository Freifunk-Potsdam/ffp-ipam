# Generated by carnix 0.9.8: carnix generate-nix --src ../
{ lib, buildPlatform, buildRustCrate, buildRustCrateHelpers, cratesIO, fetchgit }:
with buildRustCrateHelpers;
let inherit (lib.lists) fold;
    inherit (lib.attrsets) recursiveUpdate;
in
rec {
  crates = cratesIO // rec {
# ffp-ipam-0.1.0

    crates.ffp_ipam."0.1.0" = deps: { features?(features_.ffp_ipam."0.1.0" deps {}) }: buildRustCrate {
      crateName = "ffp-ipam";
      version = "0.1.0";
      authors = [ "Justin Humm <justin.humm@posteo.de>" ];
      src = exclude [ ".git" "target" ] ./.;
      dependencies = mapFeatures features ([
        (cratesIO.crates."docopt"."${deps."ffp_ipam"."0.1.0"."docopt"}" deps)
        (cratesIO.crates."git2"."${deps."ffp_ipam"."0.1.0"."git2"}" deps)
        (cratesIO.crates."ipnet"."${deps."ffp_ipam"."0.1.0"."ipnet"}" deps)
        (cratesIO.crates."rocket"."${deps."ffp_ipam"."0.1.0"."rocket"}" deps)
        (cratesIO.crates."rocket_contrib"."${deps."ffp_ipam"."0.1.0"."rocket_contrib"}" deps)
        (cratesIO.crates."serde"."${deps."ffp_ipam"."0.1.0"."serde"}" deps)
        (cratesIO.crates."serde_derive"."${deps."ffp_ipam"."0.1.0"."serde_derive"}" deps)
        (cratesIO.crates."serde_json"."${deps."ffp_ipam"."0.1.0"."serde_json"}" deps)
      ]);
    };
    features_.ffp_ipam."0.1.0" = deps: f: updateFeatures f (rec {
      docopt."${deps.ffp_ipam."0.1.0".docopt}".default = true;
      ffp_ipam."0.1.0".default = (f.ffp_ipam."0.1.0".default or true);
      git2."${deps.ffp_ipam."0.1.0".git2}".default = true;
      ipnet = fold recursiveUpdate {} [
        { "${deps.ffp_ipam."0.1.0".ipnet}"."serde" = true; }
        { "${deps.ffp_ipam."0.1.0".ipnet}".default = true; }
      ];
      rocket."${deps.ffp_ipam."0.1.0".rocket}".default = true;
      rocket_contrib = fold recursiveUpdate {} [
        { "${deps.ffp_ipam."0.1.0".rocket_contrib}"."json" = true; }
        { "${deps.ffp_ipam."0.1.0".rocket_contrib}".default = (f.rocket_contrib."${deps.ffp_ipam."0.1.0".rocket_contrib}".default or false); }
      ];
      serde = fold recursiveUpdate {} [
        { "${deps.ffp_ipam."0.1.0".serde}"."derive" = true; }
        { "${deps.ffp_ipam."0.1.0".serde}".default = true; }
      ];
      serde_derive."${deps.ffp_ipam."0.1.0".serde_derive}".default = true;
      serde_json."${deps.ffp_ipam."0.1.0".serde_json}".default = true;
    }) [
      (cratesIO.features_.docopt."${deps."ffp_ipam"."0.1.0"."docopt"}" deps)
      (cratesIO.features_.git2."${deps."ffp_ipam"."0.1.0"."git2"}" deps)
      (cratesIO.features_.ipnet."${deps."ffp_ipam"."0.1.0"."ipnet"}" deps)
      (cratesIO.features_.rocket."${deps."ffp_ipam"."0.1.0"."rocket"}" deps)
      (cratesIO.features_.rocket_contrib."${deps."ffp_ipam"."0.1.0"."rocket_contrib"}" deps)
      (cratesIO.features_.serde."${deps."ffp_ipam"."0.1.0"."serde"}" deps)
      (cratesIO.features_.serde_derive."${deps."ffp_ipam"."0.1.0"."serde_derive"}" deps)
      (cratesIO.features_.serde_json."${deps."ffp_ipam"."0.1.0"."serde_json"}" deps)
    ];


# end

  };

  ffp_ipam = crates.crates.ffp_ipam."0.1.0" deps;
  __all = [ (ffp_ipam {}) ];
  deps.aho_corasick."0.6.10" = {
    memchr = "2.2.0";
  };
  deps.base64."0.9.3" = {
    byteorder = "1.3.1";
    safemem = "0.3.0";
  };
  deps.base64."0.10.1" = {
    byteorder = "1.3.1";
  };
  deps.bitflags."0.7.0" = {};
  deps.bitflags."1.0.4" = {};
  deps.byteorder."1.3.1" = {};
  deps.cc."1.0.31" = {};
  deps.cfg_if."0.1.7" = {};
  deps.cookie."0.11.0" = {
    base64 = "0.9.3";
    ring = "0.13.5";
    time = "0.1.42";
    url = "1.7.2";
  };
  deps.curl_sys."0.4.17" = {
    libc = "0.2.50";
    libz_sys = "1.0.25";
    cc = "1.0.31";
    pkg_config = "0.3.14";
    openssl_sys = "0.9.42";
    winapi = "0.3.6";
  };
  deps.devise."0.2.0" = {
    devise_codegen = "0.2.0";
    devise_core = "0.2.0";
  };
  deps.devise_codegen."0.2.0" = {
    devise_core = "0.2.0";
    quote = "0.6.11";
  };
  deps.devise_core."0.2.0" = {
    bitflags = "1.0.4";
    proc_macro2 = "0.4.27";
    quote = "0.6.11";
    syn = "0.15.29";
  };
  deps.docopt."1.0.2" = {
    lazy_static = "1.3.0";
    regex = "1.1.2";
    serde = "1.0.89";
    serde_derive = "1.0.89";
    strsim = "0.7.0";
  };
  deps.ffp_ipam."0.1.0" = {
    docopt = "1.0.2";
    git2 = "0.8.0";
    ipnet = "2.0.0";
    rocket = "0.4.0";
    rocket_contrib = "0.4.0";
    serde = "1.0.89";
    serde_derive = "1.0.89";
    serde_json = "1.0.39";
  };
  deps.filetime."0.2.4" = {
    cfg_if = "0.1.7";
    redox_syscall = "0.1.51";
    libc = "0.2.50";
  };
  deps.fsevent."0.2.17" = {
    bitflags = "0.7.0";
    fsevent_sys = "0.1.6";
    libc = "0.2.50";
  };
  deps.fsevent_sys."0.1.6" = {
    libc = "0.2.50";
  };
  deps.fuchsia_zircon."0.3.3" = {
    bitflags = "1.0.4";
    fuchsia_zircon_sys = "0.3.3";
  };
  deps.fuchsia_zircon_sys."0.3.3" = {};
  deps.git2."0.8.0" = {
    bitflags = "1.0.4";
    libc = "0.2.50";
    libgit2_sys = "0.7.11";
    log = "0.4.6";
    url = "1.7.2";
    openssl_probe = "0.1.2";
    openssl_sys = "0.9.42";
  };
  deps.httparse."1.3.3" = {};
  deps.hyper."0.10.15" = {
    base64 = "0.9.3";
    httparse = "1.3.3";
    language_tags = "0.2.2";
    log = "0.3.9";
    mime = "0.2.6";
    num_cpus = "1.10.0";
    time = "0.1.42";
    traitobject = "0.1.0";
    typeable = "0.1.2";
    unicase = "1.4.2";
    url = "1.7.2";
  };
  deps.idna."0.1.5" = {
    matches = "0.1.8";
    unicode_bidi = "0.3.4";
    unicode_normalization = "0.1.8";
  };
  deps.indexmap."1.0.2" = {};
  deps.inotify."0.6.1" = {
    bitflags = "1.0.4";
    inotify_sys = "0.1.3";
    libc = "0.2.50";
  };
  deps.inotify_sys."0.1.3" = {
    libc = "0.2.50";
  };
  deps.iovec."0.1.2" = {
    libc = "0.2.50";
    winapi = "0.2.8";
  };
  deps.ipnet."2.0.0" = {
    serde = "1.0.89";
  };
  deps.isatty."0.1.9" = {
    cfg_if = "0.1.7";
    redox_syscall = "0.1.51";
    libc = "0.2.50";
    winapi = "0.3.6";
  };
  deps.itoa."0.4.3" = {};
  deps.kernel32_sys."0.2.2" = {
    winapi = "0.2.8";
    winapi_build = "0.1.1";
  };
  deps.language_tags."0.2.2" = {};
  deps.lazy_static."1.3.0" = {};
  deps.lazycell."1.2.1" = {};
  deps.libc."0.2.50" = {};
  deps.libgit2_sys."0.7.11" = {
    curl_sys = "0.4.17";
    libc = "0.2.50";
    libssh2_sys = "0.2.11";
    libz_sys = "1.0.25";
    cc = "1.0.31";
    pkg_config = "0.3.14";
    openssl_sys = "0.9.42";
  };
  deps.libssh2_sys."0.2.11" = {
    libc = "0.2.50";
    libz_sys = "1.0.25";
    cc = "1.0.31";
    pkg_config = "0.3.14";
    openssl_sys = "0.9.42";
  };
  deps.libz_sys."1.0.25" = {
    libc = "0.2.50";
    cc = "1.0.31";
    pkg_config = "0.3.14";
  };
  deps.log."0.3.9" = {
    log = "0.4.6";
  };
  deps.log."0.4.6" = {
    cfg_if = "0.1.7";
  };
  deps.matches."0.1.8" = {};
  deps.memchr."2.2.0" = {};
  deps.mime."0.2.6" = {
    log = "0.3.9";
  };
  deps.mio."0.6.16" = {
    iovec = "0.1.2";
    lazycell = "1.2.1";
    log = "0.4.6";
    net2 = "0.2.33";
    slab = "0.4.2";
    fuchsia_zircon = "0.3.3";
    fuchsia_zircon_sys = "0.3.3";
    libc = "0.2.50";
    kernel32_sys = "0.2.2";
    miow = "0.2.1";
    winapi = "0.2.8";
  };
  deps.mio_extras."2.0.5" = {
    lazycell = "1.2.1";
    log = "0.4.6";
    mio = "0.6.16";
    slab = "0.4.2";
  };
  deps.miow."0.2.1" = {
    kernel32_sys = "0.2.2";
    net2 = "0.2.33";
    winapi = "0.2.8";
    ws2_32_sys = "0.2.1";
  };
  deps.net2."0.2.33" = {
    cfg_if = "0.1.7";
    libc = "0.2.50";
    winapi = "0.3.6";
  };
  deps.notify."4.0.10" = {
    bitflags = "1.0.4";
    filetime = "0.2.4";
    libc = "0.2.50";
    walkdir = "2.2.7";
    inotify = "0.6.1";
    mio = "0.6.16";
    mio_extras = "2.0.5";
    fsevent = "0.2.17";
    fsevent_sys = "0.1.6";
    kernel32_sys = "0.2.2";
    winapi = "0.3.6";
  };
  deps.num_cpus."1.10.0" = {
    libc = "0.2.50";
  };
  deps.openssl_probe."0.1.2" = {};
  deps.openssl_sys."0.9.42" = {
    libc = "0.2.50";
    cc = "1.0.31";
    pkg_config = "0.3.14";
    rustc_version = "0.2.3";
  };
  deps.pear."0.1.2" = {
    pear_codegen = "0.1.2";
  };
  deps.pear_codegen."0.1.2" = {
    proc_macro2 = "0.4.27";
    quote = "0.6.11";
    syn = "0.15.29";
    version_check = "0.1.5";
    yansi = "0.4.0";
  };
  deps.percent_encoding."1.0.1" = {};
  deps.pkg_config."0.3.14" = {};
  deps.proc_macro2."0.4.27" = {
    unicode_xid = "0.1.0";
  };
  deps.quote."0.6.11" = {
    proc_macro2 = "0.4.27";
  };
  deps.redox_syscall."0.1.51" = {};
  deps.regex."1.1.2" = {
    aho_corasick = "0.6.10";
    memchr = "2.2.0";
    regex_syntax = "0.6.5";
    thread_local = "0.3.6";
    utf8_ranges = "1.0.2";
  };
  deps.regex_syntax."0.6.5" = {
    ucd_util = "0.1.3";
  };
  deps.ring."0.13.5" = {
    untrusted = "0.6.2";
    cc = "1.0.31";
    lazy_static = "1.3.0";
    libc = "0.2.50";
  };
  deps.rocket."0.4.0" = {
    base64 = "0.10.1";
    isatty = "0.1.9";
    log = "0.4.6";
    memchr = "2.2.0";
    num_cpus = "1.10.0";
    pear = "0.1.2";
    rocket_codegen = "0.4.0";
    rocket_http = "0.4.0";
    state = "0.4.1";
    time = "0.1.42";
    toml = "0.4.10";
    yansi = "0.5.0";
    version_check = "0.1.5";
  };
  deps.rocket_codegen."0.4.0" = {
    devise = "0.2.0";
    indexmap = "1.0.2";
    quote = "0.6.11";
    rocket_http = "0.4.0";
    version_check = "0.1.5";
    yansi = "0.5.0";
  };
  deps.rocket_contrib."0.4.0" = {
    log = "0.4.6";
    rocket = "0.4.0";
    serde = "1.0.89";
    serde_json = "1.0.39";
    notify = "4.0.10";
  };
  deps.rocket_http."0.4.0" = {
    cookie = "0.11.0";
    hyper = "0.10.15";
    indexmap = "1.0.2";
    pear = "0.1.2";
    percent_encoding = "1.0.1";
    smallvec = "0.6.9";
    state = "0.4.1";
    time = "0.1.42";
    unicode_xid = "0.1.0";
  };
  deps.rustc_version."0.2.3" = {
    semver = "0.9.0";
  };
  deps.ryu."0.2.7" = {};
  deps.safemem."0.3.0" = {};
  deps.same_file."1.0.4" = {
    winapi_util = "0.1.2";
  };
  deps.semver."0.9.0" = {
    semver_parser = "0.7.0";
  };
  deps.semver_parser."0.7.0" = {};
  deps.serde."1.0.89" = {
    serde_derive = "1.0.89";
  };
  deps.serde_derive."1.0.89" = {
    proc_macro2 = "0.4.27";
    quote = "0.6.11";
    syn = "0.15.29";
  };
  deps.serde_json."1.0.39" = {
    itoa = "0.4.3";
    ryu = "0.2.7";
    serde = "1.0.89";
  };
  deps.slab."0.4.2" = {};
  deps.smallvec."0.6.9" = {};
  deps.state."0.4.1" = {};
  deps.strsim."0.7.0" = {};
  deps.syn."0.15.29" = {
    proc_macro2 = "0.4.27";
    quote = "0.6.11";
    unicode_xid = "0.1.0";
  };
  deps.thread_local."0.3.6" = {
    lazy_static = "1.3.0";
  };
  deps.time."0.1.42" = {
    libc = "0.2.50";
    redox_syscall = "0.1.51";
    winapi = "0.3.6";
  };
  deps.toml."0.4.10" = {
    serde = "1.0.89";
  };
  deps.traitobject."0.1.0" = {};
  deps.typeable."0.1.2" = {};
  deps.ucd_util."0.1.3" = {};
  deps.unicase."1.4.2" = {
    version_check = "0.1.5";
  };
  deps.unicode_bidi."0.3.4" = {
    matches = "0.1.8";
  };
  deps.unicode_normalization."0.1.8" = {
    smallvec = "0.6.9";
  };
  deps.unicode_xid."0.1.0" = {};
  deps.untrusted."0.6.2" = {};
  deps.url."1.7.2" = {
    idna = "0.1.5";
    matches = "0.1.8";
    percent_encoding = "1.0.1";
  };
  deps.utf8_ranges."1.0.2" = {};
  deps.vcpkg."0.2.6" = {};
  deps.version_check."0.1.5" = {};
  deps.walkdir."2.2.7" = {
    same_file = "1.0.4";
    winapi = "0.3.6";
    winapi_util = "0.1.2";
  };
  deps.winapi."0.2.8" = {};
  deps.winapi."0.3.6" = {
    winapi_i686_pc_windows_gnu = "0.4.0";
    winapi_x86_64_pc_windows_gnu = "0.4.0";
  };
  deps.winapi_build."0.1.1" = {};
  deps.winapi_i686_pc_windows_gnu."0.4.0" = {};
  deps.winapi_util."0.1.2" = {
    winapi = "0.3.6";
  };
  deps.winapi_x86_64_pc_windows_gnu."0.4.0" = {};
  deps.ws2_32_sys."0.2.1" = {
    winapi = "0.2.8";
    winapi_build = "0.1.1";
  };
  deps.yansi."0.4.0" = {};
  deps.yansi."0.5.0" = {};
}
