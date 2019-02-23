# List

```terminal
$ curl http://localhost:8000/ip4 -H 'x-api-key: 04345eb554c25cc5d7e02fb5e605ccf7af185e92e4237617abd3f43569abf5ae'
```

# Register

```terminal
$ curl http://localhost:8000/ip4/register -H 'x-api-key: 04345eb554c25cc5d7e02fb5e605ccf7af185e92e4237617abd3f43569abf5ae' -H 'Content-Type: application/json' --data '{ "ip": "fc00::2", "contact": "lol", "location": "lol", "node_name": "lol" }'
```

