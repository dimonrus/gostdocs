# Depends

## Inherits
Every config `.yaml` file possible to define dependence on other `.yaml` config file

It allows to build deep config inherits in infrastructure environment

Example:

Content of `global.yaml`

```yaml
db:
  host: 0.0.0.0
  port: 5432
  name: tutorial
  user: tutorial
  password: tutorial
  sslMode: disable
  maxConnections: 50
  connectionIdleLifetime: 15
```
Printing `base.App.GetConfig().Db` after start application with `ENV=global`:
> {ConnectionConfig:{Host:0.0.0.0 Port:5432 Name:tutorial User:tutorial Password:tutorial MaxConnections:50 MaxIdleConnections:0 ConnectionIdleLifetime:15} SSLMode:disable BinaryParameters:false}

Content of `qa.yaml`
```yaml
depends: global
db:
  host: 192.168.0.1
  user: tutorial_qa
  password: tutorial_qa_pass
```
Printing `base.App.GetConfig().Db` after start application with `ENV=qa`:
> {ConnectionConfig:{Host:192.168.0.1 Port:5432 Name:tutorial User:tutorial_qa Password:tutorial_qa_pass MaxConnections:50 MaxIdleConnections:0 ConnectionIdleLifetime:15} SSLMode:disable BinaryParameters:false}

Content of `dev.yaml`
```yaml
depends: qa
db:
  name: tutorial_dev
  user: tutorial_dev
  password: tutorial_dev_pass
```
Printing `base.App.GetConfig().Db` after start application with `ENV=dev`:
> {ConnectionConfig:{Host:192.168.0.1 Port:5432 Name:tutorial_dev User:tutorial_dev Password:tutorial_dev_pass MaxConnections:50 MaxIdleConnections:0 ConnectionIdleLifetime:15} SSLMode:disable BinaryParameters:false}

Content of `local.yaml`
```yaml
depends: dev
db:
  host: 0.0.0.0
```
Printing `base.App.GetConfig().Db` after start application with `ENV=local`:
> {ConnectionConfig:{Host:0.0.0.0 Port:5432 Name:tutorial_dev User:tutorial_dev Password:tutorial_dev_pass MaxConnections:50 MaxIdleConnections:0 ConnectionIdleLifetime:15} SSLMode:disable BinaryParameters:false}

Inheritance in config files allows you to run main application and test in different environments.
