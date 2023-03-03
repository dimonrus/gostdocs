# Logger

Basic logger interface defined in gocli library
## Logger Interface

```go
// Logger Common logger interface
type Logger interface {
	Output(callDepth int, message string) error

	Print(v ...interface{})
	Println(v ...interface{})
	Printf(format string, v ...interface{})

	Info(v ...interface{})
	Infoln(v ...interface{})
	Infof(format string, v ...interface{})

	Warn(v ...interface{})
	Warnln(v ...interface{})
	Warnf(format string, v ...interface{})

	Error(v ...interface{})
	Errorln(v ...interface{})
	Errorf(format string, v ...interface{})
}
```
Logger interface provided by gocli is compatible with default logger and uses in most parts of gost components

## Default logger
You can define default gocli logger by following code
```go
config := gocli.LoggerConfig{Level: gocli.LogLevelDebug}
logger := gocli.NewLogger(config)
logger.Infoln("Some info")
```
Output:
>2023/03/04 00:20:55 common_test.go:52: Some info

Logger support 4 level of logging:
```go
LogLevelDebug = 1 << iota   // all message prints
LogLevelInfo                // prints info, warnings, errors
LogLevelWarn                // prints warnings and errors
LogLevelErr                 // prints errors
```
Each level of logging allows to output message with higher priority then the log level

For example in case
```go
config := gocli.LoggerConfig{Level: gocli.LogLevelWarn}
logger := gocli.NewLogger(config)
logger.Infoln("Some info")
```
logger will ignore message because level of logging starts from Warnings

## Logger format
`gocli.LoggerFormat` has a `map[string]string` type and allow to output key value information from context

Example:
```go
config := gocli.LoggerConfig{
    Level:  gocli.LogLevelErr,
    Format: gocli.LoggerFormat{"application": "app: %s ", "requestId": "rid: %s"},
}
ctx := context.WithValue(context.Background(), "application", "tutorial")
ctx = context.WithValue(ctx, "requestId", gohelp.NewUUID())
logger := gocli.NewLogger(config)
// ignored according to log level
logger.Info("ignored")
// output with info from context
logger.Errorln(ctx, "Error happened")
```
Output is:
>2023/03/04 00:14:40 common_test.go:48: app: tutorial  rid: 29B28722-850A-CBD2-86DE-9C719D2B4BD7 Error happened

[STATE OF CODE #9](https://github.com/dimonrus/tutorial/commit/72c8860964b2d08aa6286b288fb5ad670cffaa90)