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