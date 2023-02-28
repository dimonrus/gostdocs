# Application

By default, application object contains several methods to help build your system logic
## Application interface
```go
type Application interface {
    // GetConfig Get config struct
    GetConfig() interface{}
    // GetConfigPath Get full path to config
    GetConfigPath(env string) string
    // GetAbsolutePath Get absolute path
    GetAbsolutePath(path string, dir string) (string, porterr.IError)
    // SetConfig Set config struct
    SetConfig(cfg interface{}) Application
    // ParseConfig Parse config
    ParseConfig(env string) Application
    // Start run application
    Start(port string, callback func(command *Command)) porterr.IError
    // FatalError Behaviour for fatal errors
    FatalError(err error)
    // GetLogger Get Logger
    GetLogger() Logger
    // SetLogger set custom logger
    SetLogger(logger Logger)
    // SuccessMessage Success log message with command repeat
    SuccessMessage(message string, command ...*Command)
    // AttentionMessage Warning log message with command repeat
    AttentionMessage(message string, command ...*Command)
    // FailMessage Fail log message with command repeat
    FailMessage(message string, command ...*Command)
    // ParseFlags Parse console flags
    ParseFlags(args *Arguments)
}
```
## Definition
- `GetConfig()` - returns config struct, defined in `app/config/config.go` file. 
It's recommended to override, so you can get typed struct
- `GetConfigPath(env string)` - returns config full path to yaml specific file. 
- `GetAbsolutePath(path string, dir string)` - returns absolute path to dir
- `SetConfig(cfg interface{})` - set up config struct in runtime
- `ParseConfig(env string)` - config parser
Scans config directory and parse config yaml file according to environment variable (`ENV`)
- `Start(port string, callback func(command *Command))` - start application
It can be any type of application you defined. Web/Commander/Consumer etc 
- `FatalError(err error)` - throw fatal error
- `GetLogger()` - return logger 
- `SetLogger(logger Logger)` - setup logger. By default it happens on application initialization
- `SuccessMessage(message string, command ...*Command)` - log success message in stdout
- `AttentionMessage(message string, command ...*Command)` - log attention message in stdout
- `FailMessage(message string, command ...*Command)` - log fail message in stdout
- `ParseFlags(args *Arguments)` - each defined flag in global.yaml will be parsed at application init stage

By default `make project` command will create std Application object for project usage. 
Application will be defined in `app/base/main.go` file

## Integrations
Created Application also contains methods and object for database or message broker integrations
- `GetDB()` - returns database connection
- `GetRabbit()` - returns RabbitMQ application
- `GetWeb()` - return web application object
- `GetMigration()` - database migration object
- `GetScripts()` - script registry
- `StartTransaction()` - start database transaction
- `EndTransaction(q *godb.SqlTx, e porterr.IError)` - end database transaction

[STATE OF CODE #8](https://github.com/dimonrus/tutorial/commit/a74fe0d39a6255220acd31876692f4b1b7782623)