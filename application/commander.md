# Commander

There are 2 ways to communicate with the application at startup.
## Command line parameters
You can specify parameters in command line on application start</br>
Example:
```bash
env ENV=local ./tutorial -app script -name migration -class schema
```
After entering this command you will run a script that performs the schema migration</br>
** all available arguments by default you can view in `app/config/yaml/global.yaml` file in `arguments` section</br>
** also you can define your own command flags

### Predefined flags
- `app` - application type. web/script/consumer
- `name` - name of script. migration/crud/consumer/model/script whatever you defined in `app/io/script` directory
- `file` - name of file
- `class` - type of entity
- `queue` - name of the queue
- `server` - name of the server
- `num` - number of something

All arguments stored in script callback `func(args gocli.Arguments)` as args

An example to [create custom command flag](https://github.com/dimonrus/tutorial/commit/8b63fbc73b8621f1d808814fa33da11ac3fc9eba)

To run script enter following command into console 
```bash
./tutorial -app=script -name=custom_flag -color=red
```

Then you will see in console output
>tutorial 2023/03/01 22:31:11 main.go:85: Application environment ENV=local</br>
tutorial 2023/03/01 22:31:11 main.go:39: Start script: custom_flag</br>
tutorial 2023/03/01 22:31:11 custom_flag.go:12: Your color is: red

## Socket communication with application
After launching, you can communicate with the application via sockets
Example:
```bash
echo "consumer start all" | nc 0.0.0.0 3333
```
This command starts all stopped consumers. <br>
See details about Rabbit MQ commands
[RabbitMQ Commander](https://github.com/dimonrus/gorabbit/blob/67ccfcdca42268c9641315d66d9916e9a39d7aa3/main.go#L148)

You free to define your own application type with custom commander processor.</br>

For example create ["colors" application type with socket commander](https://github.com/dimonrus/tutorial/commit/ba0a54356f05626a5a9cfc5eabd4f5c35240697f)

To run application with type "colors" and start listening 3333 port enter following command:
```bash
./tutorial -app=colors
```
Output:
>tutorial 2023/03/01 22:36:25 main.go:85: Application environment ENV=local</br>
tutorial 2023/03/01 22:36:25 std.go:237: Start listening tcp commands on localhost:3333

Now you can ask application to do something via socket connection:

```bash
echo "colors list" | nc 0.0.0.0 3333
```
Output:
>--->: Every hunter wants to know where a pheasant sits