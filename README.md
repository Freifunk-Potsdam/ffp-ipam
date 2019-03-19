# IPv4 Address Management für Freifunk Potsdam

Hier ist noch alles im Bau. Ausprobieren auf eigene Gefahr ;)

## Startup

```terminal
$ ffp-ipam --token "thisisnotsecret" --ip4-range "192.168.0.0/24" ./data
```


## List

```terminal
$ curl http://localhost:8000/ip4 -H 'x-api-key: thisisnotsecret'
```

## Register

```terminal
$ curl http://localhost:8000/ip4/register -H 'x-api-key: thisisnotsecret' -H 'Content-Type: application/json' --data '{ "ip4": "192.168.0.1", "contact": "lol", "location": "lol", "node_name": "lol" }'
```

