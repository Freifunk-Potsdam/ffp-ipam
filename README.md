# IPv4 Address Management für Freifunk Potsdam

[![built with nix](https://builtwithnix.org/badge.svg)](https://builtwithnix.org)

[CI status](https://hydra.erictapen.name/jobset/ffp-ipam/master)

## API

Wanna try it out? Current master is hosted for testing on [`https://ipam.erictapen.name/ip4/`](https://ipam.erictapen.name/ip4/).

#### List registered IPv4 adresses

```bash
curl https://ipam.erictapen.name/ip4 \
  -H 'Accept: application/json' \ # This line can be omitted with curl, but in general ffp-ipam cares about the Accept header and serves HTML if wanted!
  -H 'x-api-key: ThisIsNotSecretYet'
```

#### Register a new address

```bash
curl https://ipam.erictapen.name/ip4/register \
 -H 'x-api-key: ThisIsNotSecretYet' \
 -H 'Content-Type: application/json' \
 --data '{ "ip4": "192.168.0.1/32", "contact": "mail@freifunk-potsdam.de", "location": "Behind the corner", "node_name": "mynodename" }'
```

## Building the daemon

### Dependencies

As this uses [Rocket](https://rocket.rs/), you need a nightly version of `rustc` for building. [Rustup](https://rustup.rs/) is a way to get it.

Also you need `pkgconfig` and `openssl` to be installed. If you are using [Nix](https://nixos.org/nix/), `nix-shell` should be enough to get them through `shell.nix`.

### Building with Cargo

```terminal
$ cargo build --release
```

## Running the daemon

```bash
ffp-ipam \
  --listen 127.0.0.1 \
  --port 8000 \
  --token "ThisIsNotSecretYet" \
  --ip4-range "192.168.0.0/24" \
  --ip4-range "10.0.0.0/16" \
  /path/to/state/dir

```

