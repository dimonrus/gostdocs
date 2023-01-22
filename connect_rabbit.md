# Connect to Rabbit MQ

By default, rabbit mq connection defined in Application object
## Access to Rabbit MQ connection
```go
package core

import (
	"tutorial/app/base"
)
...
    broker := base.App.GetRabbit()
    e := broker.Publish(p, "tutorial.test", "local")
```
## Rabbit MQ Server credentials
Rabbit MQ credential configuration defined in `app/config/yaml/local.yaml`
```yaml
rabbit:
  servers:
    local:
      host: 0.0.0.0
      vhost: \
      port: 5672
      user: tutorial
      password: admin
```
`0.0.0.0` means that Rabbit MQ accept connections on local machine. You can set up Rabbit MQ via `compose.yaml`

```bash
docker-compose -f compose.yaml up rabbitmq
```
## Verify consumer
Check broker works correctly.
1. Run consumer `./tutorial -app=consumer`
2. Publish message into `tutorial.test` queue by execute `TestRabbitMQ` test
```bash
go test -v ./... -run=TestRabbitMQ
```
Consumer console output will be similar to:
>tutorial 2023/01/22 19:14:33 main.go:62: Application environment ENV=local<br>
tutorial 2023/01/22 19:14:33 main.go:51: Starting AMQP Application...<br>
tutorial 2023/01/22 19:14:33 main.go:149: Receive command: consumer start all<br>
tutorial 2023/01/22 19:14:33 main.go:163: Starting subscribe for 'test' consumer<br>
tutorial 2023/01/22 19:14:33 std.go:237: Start listening tcp commands on localhost:3333<br>
tutorial 2023/01/22 19:14:33 consumer.go:76: Subscribe 'tutorial.test' queue on server 'local'<br>
tutorial 2023/01/22 19:14:33 main.go:140: Subscribers for 'test' are started<br>
tutorial 2023/01/22 19:14:47 consumer.go:98: Subscriber: tutorial.test-3rniR - received a message:<br>
some data<br>
tutorial 2023/01/22 19:14:47 test.go:12: some data<br>

[STATE OF CODE #3](https://github.com/dimonrus/tutorial/commit/dbd903934241a57afee21dcf85adf88445c8bc9a)