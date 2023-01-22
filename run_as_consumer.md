# Run as consumer

## Run app
Consumer application allows to handle AMQP messages.

To run consumer enter following command:

```bash
 ./tutorial -app=consumer
```

After input command you will see console output similar to:

>tutorial 2023/01/22 23:37:08 main.go:62: Application environment ENV=local<br>
tutorial 2023/01/22 23:37:08 main.go:51: Starting AMQP Application...<br>
tutorial 2023/01/22 23:37:08 main.go:149: Receive command: consumer start all<br>
tutorial 2023/01/22 23:37:08 main.go:163: Starting subscribe for 'test' consumer<br>
tutorial 2023/01/22 23:37:08 std.go:237: Start listening tcp commands on localhost:3333<br>
tutorial 2023/01/22 23:37:08 consumer.go:76: Subscribe 'tutorial.test' queue on server 'local'<br>
tutorial 2023/01/22 23:37:08 main.go:140: Subscribers for 'test' are started<br>

## Routes
By default, only one consumer callback defined:

- `app/io/consumer/test.go`

You can extend consumers by adding new ones

## Queue configuration
Consumer queue configuration defined in `app/config/yaml/global.yaml` file
```yaml
rabbit:
  queues:
    tutorial.test:
      exchange: amq.direct
      type: direct
      routingKey:
        - tutorial-test-message
      durable: true
```
For new queue implementation add to `queues` section similar to `tutorial.test` queue definition. For example:
```yaml
rabbit:
  queues:
    tutorial.test:
      exchange: amq.direct
      type: direct
      routingKey:
        - tutorial-test-message
      durable: true
    tutorial.event:
      exchange: amq.direct
      type: direct
      routingKey:
        - tutorial-event
      durable: true
```
## Server configuration
Server configuration defined in `app/config/yaml/local.yaml`
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
You can change server setting depends on your Rabbit MQ server configuration

## Create new consumer
There are command for make consumer more quickly

```yaml
make script-consumer
```
After enter command script will ask you input several names:
>Enter consumer name: event<br>
Enter queue name: tutorial.event<br>
Enter server name: local

When you have been entered last argument consumer file `app/io/consumer/event.go` will be created and console output will be showed following output:
>tutorial 2023/01/23 00:00:15 main.go:62: Application environment ENV=local<br>
tutorial 2023/01/23 00:00:15 main.go:37: Start script: consumer<br>
tutorial 2023/01/23 00:00:15 consumer.go:58: consumer file created: event

Now implement consumer logic to handle AMQP messages

[STATE OF CODE #6](https://github.com/dimonrus/tutorial/commit/47b8fca06075494a730d6f14a248d6bf6e32ee14)