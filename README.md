# List

```terminal
$ curl http://localhost:8000/ip4 -H 'x-api-key: thisisnotsecret'
```

# Register

```terminal
$ curl http://localhost:8000/ip4/register -H 'x-api-key: thisisnotsecret' -H 'Content-Type: application/json' --data '{ "ip": "fc00::2", "contact": "lol", "location": "lol", "node_name": "lol" }'
```

