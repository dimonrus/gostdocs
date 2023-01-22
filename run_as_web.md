# Run as web

## Run app
Web application starts daemon that handle for http calls by specific port.

To run web server enter following command:

```bash
 ./tutorial -app=web
```

After input command you will console output similar to:

>tutorial 2023/01/22 22:55:24 main.go:62: Application environment ENV=local<br>
tutorial 2023/01/22 22:55:24 web.go:161: Start insecure web server at 0.0.0.0:8080

## Routes
Default web server OOTB contains predefined HTTP handlers:

- GET {path}/system/health
- GET {path}/system/health_db
- GET {path}/system/memory
- GET {path}/system/swagger

** {path} - base path for web route handler. For example `http://0.0.0.0:8080/tutorial/api`

You can extend routes and handler by adding new ones

## Configuration
Default web server configuration contains in `app/config/yaml/global.yaml` file
```yaml
web:
  port: 8080
  host: 0.0.0.0
  url: http://localhost
  timeout:
    read: 60
    write: 60
    idle: 60
```
If you need change some setting please override it in files depends on `global.yaml` such as `app/config/yaml/local.yaml`
Simply put target section you need to override in `local.yaml` 

For example, lets change port from 8080 to 8081.
```yaml
web:
  port: 8081
```

[STATE OF CODE #5](https://github.com/dimonrus/tutorial/commit/f1574de534924b676d384bbe2d8225c5d80510e3)