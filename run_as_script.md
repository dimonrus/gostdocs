# Run as script

## Run app
Script allows you to execute useful code once or do it periodically.<br>
There are several scripts defined OOTB like generators and migrations.

To run app as script enter following command:

```bash
 ./tutorial -app=script -name=test
```

At this example you will run code implemented in `app/io/script/test.go`

After input command you will see console output similar to:
>tutorial 2023/01/26 20:19:39 main.go:62: Application environment ENV=local<br>
tutorial 2023/01/26 20:19:39 main.go:37: Start script: test<br>
tutorial 2023/01/26 20:19:39 test.go:11: cron is works, ENV = local

## Cron jobs
You can use script to define cron jobs.

Put the task into `etc/cron/crontab` and build docker container for cron job `make docker-cron`

For good understanding cron expression you can use following hint:
>minute hour day-of-month month day-of-week command

** command - app script command.

Example: `* * * * * sh /variables.sh && /tutorial/tutorial -app=script -name=test`

That's means script `app/io/script/test.go` will run each minute

## Console arguments
Default script arguments defined in `app/config/yaml/global.yaml` file
```yaml
arguments:
  app:
    type: string
    label: application type
  name:
    type: string
    label: name of script
  file:
    type: string
    label: name of file
  class:
    type: string
    label: type of entity
  queue:
    type: string
    label: name of the queue
  server:
    type: string
    label: name of the server
  num:
    type: int
    label: number of something
```
You may add new script argument but not recommended to modify existing.

For example, in script application
```bash
 ./tutorial -app=script -name=test -num=100
```
To get value of `num` var you need to call `num := args["num"].GetInt()` in script file

[STATE OF CODE #7](https://github.com/dimonrus/tutorial/commit/7212eea2d52dfb37ea9c1956a373425935ea8580)