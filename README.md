# siege-ssl
Siege Docker container with SSL support. Also changes the default output setting from JSON to be able to see full stats in the terminal

## How to run
```bash
docker run --rm -t rastad/siege:latest --verbose -H "Cookie: mycookie=2020;" -c1 -r20 --no-parser https://mysite.com
```
## Parameters
`-c` Number of concurrent users
`-r` Number of times to run per user
