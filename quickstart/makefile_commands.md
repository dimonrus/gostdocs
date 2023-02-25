# Makefile
Project has a make file that allows to create docker container and helps build different aps such as
api, cron, consumers, single script calls

## Project commands
1. Command ```make project``` and enter new project name to create new project
2. Command ```make project-build``` to build binary file of the project
3. Command ```make project-size``` to show project size
4. Command ```make project-tests``` to run all tests on project

## Script commands
1. Command ```make script-create``` to create new script file in 'app/io/script' folder
2. Command ```make script-consumer``` to create new consumer in 'app/io/consumer' folder
3. Command ```make script-migration``` to create migration file in 'app/io/db/migrations' folder
4. Command ```make script-migrate``` to run migrations
5. Command ```make script-model``` to create database model in 'app/io/db/models' folder. Table must exists
6. Command ```make script-crud``` to create crud in core with CRUDL api using number 1-C 2-R 4-U 8-D 16-S

## Docker commands
1. Command ```make docker-prune``` to clean old containers
2. Command ```make docker-build``` to build main image
3. Command ```make docker-api``` to build api image
4. Command ```make docker-swagger``` to build swagger image
5. Command ```make docker-api-run``` to run api image
6. Command ```make docker-cron``` to build cron image
7. Command ```make docker-cron-run``` to run cron image
8. Command ```make docker-test``` to create test image
9. Command ```make docker-test-update``` to update tests in test image
10. Command ```make docker-test-run``` to run test in tests image
11. Command ```make docker-migrate``` to run migration in docker container
12. Command ```make docker-consumer``` to build consumer image
13. Command ```make docker-consumer-run``` to run consumer image

## Compose commands
1. Command ```make compose-build``` to build docker containers for all application type
2. Command ```make compose-up``` to run project environment in docker containers
3. Command ```make compose-down``` to stop project environment in docker containers

## Consumer commands via Netcat
Consumers can be managed via Netcat, send consumer command on specific port

Allowed command list

1. Start all consumers
    ```bash
    echo "consumer start all" | nc localhost port
    ```
2. Start specific consumer, where name_1, name_2 are keys from Registry
    ```bash
    echo "consumer start name_1 name_2" | nc localhost port
    ```
3. Stop all consumers
    ```bash
    echo "consumer stop all" | nc localhost port
    ```
4. Stop specific consumer, where name_1, name_2 are keys from Registry
    ```bash
    echo "consumer stop name_1 name_2" | nc localhost port
    ```
5. Restart all consumers
    ```bash
    echo "consumer restart all" | nc localhost port
    ```
6. Restart specific consumer, where name_1, name_2 are keys from Registry
    ```bash
    echo "consumer restart name_1 name_2" | nc localhost port
    ```
7. Check status of all consumers
    ```bash
    echo "consumer status all" | nc localhost port
    ```
8. Check specific consumers, where name_1, name_2 are keys from Registry
     ```bash
     echo "consumer status name_1 name_2" | nc localhost port
     ```
9. Set number of specific consumer, where name_1, name_2 are keys from Registry
   For apply settings consumer must be restarted
     ```bash
     echo "consumer set count N name_1 name_2" | nc localhost port
     ```

[STATE OF CODE #8](https://github.com/dimonrus/tutorial/commit/a74fe0d39a6255220acd31876692f4b1b7782623)