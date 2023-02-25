# Docker Compose

The Docker Compose file consists of the following components:
- Postgres v 15.0
- Rabbit MQ v3.11
- Migration Schema and migration data scripts
- WEB api
- Consumer
- Cron

## Source
```yaml
version: "3.9"
services:
  postgres:
    image: postgres:15.0-alpine3.16
    environment:
      POSTGRES_DB: "tutorial"
      POSTGRES_USER: "tutorial"
      POSTGRES_PASSWORD: "tutorial"
    ports:
      - "5432:5432"
    command:
      - "postgres"
      - "-c"
      - "max_connections=200"
  rabbitmq:
    image: rabbitmq:3.11.2-management-alpine
    ports:
      - "5672:5672"
      - "15672:15672"
    volumes:
      - ./resource/rabbitmq/rabbitmq.conf:/etc/rabbitmq/rabbitmq.conf:ro
      - ./resource/rabbitmq/definitions.json:/etc/rabbitmq/definitions.json:ro
  migration:
    image: ${REGISTRY}/${PROJECT}/build:${TAG}
    restart: on-failure
    command:
      - /bin/sh
      - -c
      - |
        /go/src/tutorial/tutorial -app=script -name=migration -class=schema
        /go/src/tutorial/tutorial -app=script -name=migration -class=data
    volumes:
      - ./app/config/yaml:/go/src/tutorial/config/yaml
    depends_on:
      - "postgres"
    links:
      - "postgres"
  api:
    image: ${REGISTRY}/${PROJECT}/api:${TAG}
    ports:
      - "8080:8080"
    restart: on-failure
    volumes:
      - ./app/config/yaml:/tutorial/app/config/yaml
    depends_on:
      - "postgres"
      - "rabbitmq"
    links:
      - "postgres"
      - "rabbitmq"
  consumer:
    image: ${REGISTRY}/${PROJECT}/consumer:${TAG}
    ports:
      - "3333:3333"
    restart: on-failure
    volumes:
      - ./app/config/yaml:/tutorial/app/config/yaml
    depends_on:
      - "rabbitmq"
      - "postgres"
    links:
      - "rabbitmq"
      - "postgres"
  cron:
    image: ${REGISTRY}/${PROJECT}/cron:${TAG}
    restart: on-failure
    volumes:
      - ./app/config/yaml:/tutorial/app/config/yaml
    depends_on:
      - "postgres"
      - "rabbitmq"
    links:
      - "postgres"
      - "rabbitmq"
```

## Run docker compose
To run all services enter following command `make compose-up`

[STATE OF CODE #8](https://github.com/dimonrus/tutorial/commit/a74fe0d39a6255220acd31876692f4b1b7782623)