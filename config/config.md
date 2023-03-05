# Config

## Project config
Main configuration file `app/config/config.go` contains all project configs. Main config struct is `Config`<br>
Each field of `Config` struct must have yaml tag.

Every `Config` field values persists in `*.yaml` files in `app/config/yaml` directory

Application initiate config ones at start. Config parser method will parse `*.yaml` file depends
on ENV variable

For example if `ENV=local` config parser will read `local.yaml`

If yaml file contains key [`depends`](config/depends.md) with none empty value then config parser will
parse at first, file with name of `depends` key value and then file witch named of ENV var value i e local.yaml

This mechanism allows to override configs depends on unlimited environments

Config parser also allow to inject environment variables 

```yaml
depends: global
db:
  host: ${DB_HOST}
  port: 5432
  name: tutorial
  user: ${DB_USER}
  password: ${DB_PASSWORD}
```

## Environment var in config
As you can see config parser supports environment variables as values in `.yaml` files

Format of environment values is similar to docker compose format
```yaml
db:
  host: ${DB_HOST}
  port: 5432
```
In provided example value of `db.host` contains environment selector for database host

So if application will be started with `env DB_HOST=0.0.0.0` config struct will contain `0.0.0.0` value in Db.Host field
## Access config

To access to config values call Application method `GetConfig()`. 
It returns config struct defined in `app/config/config.go` file